unit U_FicheEntvtejj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.Buttons, RzButton, RzRadChk, RzDBChk, RzPanel,
  RzRadGrp, RzDBRGrp;

type
  TModeSaisie = (msAjout, msModification);
  TFormEntvtejj = class(TForm)
    FDMemTableEntvtejj: TFDMemTable;
    DSMemTableEntvtejj: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Panel1: TPanel;
    RzDBRadioGroupType: TRzDBRadioGroup;
    RzDBCheckBoxEXO_TVA: TRzDBCheckBox;
    FDMemTableLigvtejj: TFDMemTable;
    DSMemTableLigvtejj: TDataSource;
    JvDBGridLigvtejj: TJvDBGrid;
    Panel2: TPanel;
    DBCODFAC: TDBEdit;
    FDMemTableRegljj: TFDMemTable;
    DSMemTableRegljj: TDataSource;
    JvDBGridRegljj: TJvDBGrid;
    BtnValider: TBitBtn;
    BtnAide: TBitBtn;
    BtnAnnuler: TBitBtn;
    procedure BtnValiderClick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: TModeSaisie;
    constructor Create(AOwner: TComponent; AMode: TModeSaisie; ACodFac: Integer); reintroduce;


  end;

var
  FormEntvtejj: TFormEntvtejj;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_TableEntvtejj, U_DataModule;


procedure TFormEntvtejj.BtnValiderClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  NumFacture: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;
begin
  // Conversion en nombre total de secondes depuis minuit
  LHeure := Now; // ou un champ heure
  DecodeTime(Now, H, M, S, MS);
  Centiemes := MS div 10; // Conversion des millisecondes en centièmes
  // Construction de l'entier : HH * 1000000 + MM * 10000 + SS * 100 + CC
  ResultHeure := (H * 360000) + (M * 6000) + (S * 100) + Centiemes;

  // 1. S'assurer que les saisies en cours dans les grilles/champs sont validées (Post)
  if FDMemTableEntvtejj.State in [dsEdit, dsInsert] then
    FDMemTableEntvtejj.Post;
  if FDMemTableLigvtejj.State in [dsEdit, dsInsert] then
    FDMemTableLigvtejj.Post;
  if FDMemTableRegljj.State in [dsEdit, dsInsert] then
    FDMemTableRegljj.Post;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec2 := TFDQuery.Create(nil);

  try
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la transaction MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      // ==========================================
      // 2. ENREGISTREMENT DE L'EN-TÊTE
      // ==========================================
      if ModeSaisie = msAjout then
      begin
        // Incrementation numero de facture + 1 dans chrono
        QryExec.SQL.Text := 'UPDATE chrono set CHRONO=CHRONO+1 WHERE PREFIX=:PREFIX';
        QryExec.ParamByName('PREFIX').AsString := 'FAC01';
        QryExec.ExecSQL;
        QryExec.Close;
        //Recuperation nouveau numero chrono
        QryExec.SQL.Text := 'SELECT * FROM chrono WHERE PREFIX=:PREFIX';
        QryExec.ParamByName('PREFIX').AsString := 'FAC01';
        QryExec.Open;
        NumFacture := QryExec.FieldByName('CHRONO').AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

        // Exemple d'INSERT pour l'en-tête (adaptez les noms de champs selon votre table)
        QryExec.close;
        QryExec.SQL.Text := 'INSERT INTO entvtejj (CODDEV, CODFAC, TYPE_, TOP_, DATE_, HEURE, CODDEP, CODCAI, CODCLI, NOM, TOTHT, MT_TTC) ' +
                            'VALUES (:CODDEV, :CODFAC, :TYPE_, :TOP_, :DATE_, :HEURE, :CODDEP, :CODCAI, :CODCLI, :NOM, :TOTHT, :MT_TTC)';
      end
      else
      begin
        // Exemple d'UPDATE pour l'en-tête en modification
        QryExec.SQL.Text := 'UPDATE entvtejj SET TOP_=:TOP_, CODDEV=:CODDEV, DATE_ = :DATE_, HEURE = :HEURE, CODCLI = :CODCLI, CODCAI = :CODCAI ' +
                            'TOTHT = :TOTHT, MT_TTC = :MT_TTC, NOM = :NOM, CODDEP = :CODDEP, TYPE_=:TYPE_ ' +
                            'WHERE CODFAC = :CODFAC';
        // Récupération du numéro de facture (généré ou existant)
        NumFacture := FDMemTableEntvtejj.FieldByName('CODFAC').AsInteger;
      end;

      //ShowMessage(inttostr(NumFacture));

      // Passage des paramètres de l'en-tête
      QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
      QryExec.ParamByName('DATE_').AsDateTime := FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
      QryExec.ParamByName('HEURE').AsInteger := ResultHeure;
      QryExec.ParamByName('TYPE_').AsString := FDMemTableEntvtejj.FieldByName('TYPE_').AsString;
      QryExec.ParamByName('CODCLI').AsInteger := FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger;
      QryExec.ParamByName('TOTHT').AsFloat := FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat;
      QryExec.ParamByName('CODDEV').AsInteger := FDMemTableEntvtejj.FieldByName('CODDEV').AsInteger;
      QryExec.ParamByName('MT_TTC').AsFloat := FDMemTableEntvtejj.FieldByName('MT_TTC').AsFloat;
      QryExec.ParamByName('NOM').AsString := FDMemTableEntvtejj.FieldByName('NOM').AsString;
      QryExec.ParamByName('CODDEP').AsInteger := FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
      QryExec.ParamByName('CODCAI').AsString := FDMemTableEntvtejj.FieldByName('CODCAI').AsString;
      QryExec.ParamByName('TOP_').AsString := FDMemTableEntvtejj.FieldByName('TOP_').AsString;
      QryExec.ExecSQL;
      QryExec.Close;

      // ===========================================================
      //3. Suppression generale des mouvements de stocks initiaux
      // ===========================================================
      if ModeSaisie = msModification then
      begin
        QryExec.SQL.Text := 'SELECT * FROM ligvtejj WHERE CODFAC = :CODFAC and NOENR<>0';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.Open;

        while not QryExec.Eof do
        begin
          //Recherche et suppression du mouvement de stock associé
          QryExec2.SQL.Text := 'DELETE from stock WHERE NOENR = :NOENR';
          QryExec2.ParamByName('NOENR').AsInteger := QryExec.FieldByName('NOENR').AsInteger;
          QryExec2.ExecSQL;
          QryExec2.Close;

          //On recalcul le stock du depot et de l'article
          DM_Olivier.RecalculerStockStodep(QryExec.FieldByName('CODART').AsString, FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger);

          //Lecture ligvtejj suivant
          QryExec.Next;
        end;
      end;


      // ==========================================
      // 4. ENREGISTREMENT DES LIGNES (ligvtejj)
      // ==========================================
      // Pour faire simple et propre lors d'une modification :
      // on supprime les anciennes lignes de cette facture et on réinsère l'état actuel de la table mémoire.
      if ModeSaisie = msModification then
      begin
        QryExec.Close;
        QryExec.SQL.Text := 'DELETE FROM ligvtejj WHERE CODFAC = :CODFAC';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des lignes
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        //Génération du mouvement de stock associé a la ligne
        VNoEnrStock :=0;
        //Controle si article géré en stock
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryExec.ParamByName('CODART').AsString :=FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryExec.Open;
        if QryExec.FieldByName('G_STO').AsInteger=1 then
        begin
           //Creation par securite du stodep
           QryExec2.Close;
           QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                            'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
           QryExec2.ParamByName('CODART').AsString :=FDMemTableLigvtejj.FieldByName('CODART').AsString;
           QryExec2.ParamByName('CODDEP').AsInteger :=FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('PMP').AsFloat :=QryExec.FieldByName('PMP').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString :=QryExec.FieldByName('CODFOU').AsString;
           QryExec2.ExecSQL;

           //Insertion stock
           QryExec2.Close;
           //     ShowMessage(FDMemTableLigvtejj.FieldByName('CODART').AsString);
           QryExec2.SQL.Text := 'INSERT INTO stock (CODART, DATE_, ANNEE, MOIS, TYPE_, QTE, VALUNIT, PRIXVTE, CODDEP, CENTRA, LIBELLE, CODFOU, TIME, CODFAC) ' +
                            'VALUES (:CODART, :DATE_, :ANNEE, :MOIS, :TYPE_, :QTE, :VALUNIT, :PRIXVTE, :CODDEP, :CENTRA, :LIBELLE, :CODFOU, :TIME, :CODFAC)';
           QryExec2.ParamByName('CODFAC').AsInteger := NumFacture;
           QryExec2.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
           QryExec2.ParamByName('QTE').AsFloat := -FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
           QryExec2.ParamByName('PRIXVTE').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat;
           QryExec2.ParamByName('VALUNIT').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := FDMemTableLigvtejj.FieldByName('CODFOU').AsString;
           QryExec2.ParamByName('DATE_').AsDateTime := FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
           QryExec2.ParamByName('ANNEE').AsInteger := FDMemTableLigvtejj.FieldByName('ANNEE').AsInteger;
           QryExec2.ParamByName('MOIS').AsInteger := FDMemTableLigvtejj.FieldByName('MOIS').AsInteger;
           QryExec2.ParamByName('CODDEP').AsInteger := FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('CENTRA').AsString := 'C';
           QryExec2.ParamByName('LIBELLE').AsString := 'Facture DELPHI n°' + IntToStr(NumFacture);
           QryExec2.ParamByName('TYPE_').AsString := 'V';
           QryExec2.ParamByName('TIME').AsInteger := ResultHeure;
           QryExec2.ExecSQL;

           // 2. Récupération du NOENR tout juste généré par MySQL pour la table stock
           QryExec2.Close;
           QryExec2.SQL.Text := 'SELECT LAST_INSERT_ID()';
           QryExec2.Open;
           VNoEnrStock := QryExec2.Fields[0].AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

           //On recalcul le stock du depot et de l'article
           DM_Olivier.RecalculerStockStodep(FDMemTableLigvtejj.FieldByName('CODART').AsString, FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger);

        end;

        //Insertion ligvtejj
        QryExec.Close;
        QryExec.SQL.Text := 'INSERT INTO ligvtejj (CODFAC, CODART, QTE, PRIXNET, TOTHT, LIBELLE, CODFOU, NOENR) ' +
                            'VALUES (:CODFAC, :CODART, :QTE, :PRIXNET, :TOTHT, :LIBELLE, :CODFOU, :NOENR)';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryExec.ParamByName('QTE').AsFloat := FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
        QryExec.ParamByName('PRIXNET').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('LIBELLE').AsString := FDMemTableLigvtejj.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('CODFOU').AsString := FDMemTableLigvtejj.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('NOENR').AsInteger := VNoEnrStock;
        QryExec.ExecSQL;

        //Lecture ligne memoire suivante
        FDMemTableLigvtejj.Next;
      end;


      // ==========================================
      // 4. ENREGISTREMENT DES RÈGLEMENTS (regljj)
      // ==========================================
      if ModeSaisie = msModification then
      begin
        QryExec.Close;
        QryExec.SQL.Text := 'DELETE FROM regljj WHERE CODFAC = :CODFAC';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des règlements
      FDMemTableRegljj.First;
      while not FDMemTableRegljj.Eof do
      begin
        QryExec.Close;
        QryExec.SQL.Text := 'INSERT INTO regljj (CODFAC, CODPAI, MONTANT, DATE_, DATE_ECH) ' +
                            'VALUES (:CODFAC, :CODPAI, :MONTANT, :DATE_, :DATE_ECH)';

        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ParamByName('CODPAI').AsString := FDMemTableRegljj.FieldByName('CODPAI').AsString;
        QryExec.ParamByName('MONTANT').AsFloat := FDMemTableRegljj.FieldByName('MONTANT').AsFloat;
        QryExec.ParamByName('DATE_').AsDateTime := FDMemTableRegljj.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('DATE_ECH').AsDateTime := FDMemTableRegljj.FieldByName('DATE_ECH').AsDateTime;
        QryExec.ExecSQL;

        FDMemTableRegljj.Next;
      end;

      // Si tout s'est déroulé sans erreur, on valide définitivement dans MySQL
      DMGesCloud.ConnexionGesCloud.Commit;
      ModalResult := mrOk;

    except
      on E: Exception do
      begin
        // En cas d'erreur, on annule tout (ni l'en-tête ni les lignes ne sont modifiés)
        DMGesCloud.ConnexionGesCloud.Rollback;
        ShowMessage('Erreur lors de l''enregistrement : ' + E.Message);
        ModalResult := mrNone;
      end;
    end;
  finally
    QryExec.Free;
    QryExec2.Free;
  end;
end;

constructor TFormEntvtejj.Create(AOwner: TComponent; AMode: TModeSaisie; ACodFac: Integer);
begin
  inherited Create(AOwner);
  ModeSaisie := AMode;

// 1. Gestion de l'En-tête
  DM_Olivier.FDQueryEntvtejj.Close;
  if ModeSaisie = msModification then
  begin
    DM_Olivier.FDQueryEntvtejj.SQL.Text := 'select * from entvtejj where codfac = :CODFAC';
    DM_Olivier.FDQueryEntvtejj.ParamByName('CODFAC').AsInteger := ACodFac;
  end;
  DM_Olivier.FDQueryEntvtejj.Open;

  FDMemTableEntvtejj.Close;
  FDMemTableEntvtejj.FieldDefs.Assign(DM_Olivier.FDQueryEntvtejj.FieldDefs);
  FDMemTableEntvtejj.CreateDataSet;

  if ModeSaisie = msAjout then
  begin
    FDMemTableEntvtejj.Append;
    FDMemTableEntvtejj.FieldByName('CODFAC').AsInteger := ACodFac;
    FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime := Date;
    FDMemTableEntvtejj.FieldByName('CODCAI').AsString := Format('%d', [DM_Olivier.NumeroPoste]);
    FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger := 1;
    FDMemTableEntvtejj.FieldByName('TYPE_').AsString := 'F';
    FDMemTableEntvtejj.FieldByName('TOP_').AsString := 'S';
    FDMemTableEntvtejj.Post;

    // On se remet en édition pour que l'interface graphique puisse accepter la saisie de l'utilisateur
    FDMemTableEntvtejj.Edit;
  end
  else
  begin
    // En modification, on copie l'en-tête unique correspondant
    FDMemTableEntvtejj.CopyDataSet(DM_Olivier.FDQueryEntvtejj, [coAppend]);
    FDMemTableEntvtejj.First;
  end;

  // 2. Gestion des Lignes de détails
  DM_Olivier.FDQueryLigvtejj.Close;
  //if ModeSaisie = msModification then
  //begin
    DM_Olivier.FDQueryLigvtejj.ParamByName('CODFAC').AsInteger := ACodFac;
  //end;
  DM_Olivier.FDQueryLigvtejj.Open();
  DM_Olivier.FDQueryLigvtejj.FetchAll;

  FDMemTableLigvtejj.Close;
  FDMemTableLigvtejj.FieldDefs.Assign(DM_Olivier.FDQueryLigvtejj.FieldDefs);
  FDMemTableLigvtejj.CreateDataSet;

  // 3. Gestion des Reglements
  DM_Olivier.FDQueryRegljj.Close;
  //if ModeSaisie = msModification then
  //begin
    DM_Olivier.FDQueryRegljj.ParamByName('CODFAC').AsInteger := ACodFac;
  //end;
  DM_Olivier.FDQueryRegljj.Open();
  DM_Olivier.FDQueryRegljj.FetchAll;

  FDMemTableRegljj.Close;
  FDMemTableRegljj.FieldDefs.Assign(DM_Olivier.FDQueryRegljj.FieldDefs);
  FDMemTableRegljj.CreateDataSet;

  if ModeSaisie = msModification then
  begin
    FDMemTableLigvtejj.CopyDataSet(DM_Olivier.FDQueryLigvtejj, [coAppend]);
    FDMemTableLigvtejj.First;
    FDMemTableRegljj.CopyDataSet(DM_Olivier.FDQueryRegljj, [coAppend]);
    FDMemTableRegljj.First;
  end;
end;


end.
