unit U_FicheEntvtejj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.Buttons, RzButton, RzRadChk, RzDBChk, RzPanel,
  RzRadGrp, RzDBRGrp, FireDAC.Stan.Async, FireDAC.DApt, Math, System.DateUtils;

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
    RzDBCheckBoxTVA_ILES: TRzDBCheckBox;
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
    LabelHeureLisible: TLabel;
    DBLookupComboBoxClient: TDBLookupComboBox;
    DSClient: TDataSource;
    FDQueryClientsOuverts: TFDQuery;
    FDQueryClientsOuvertsOBSERV: TMemoField;
    FDQueryClientsOuvertsCODCLI: TIntegerField;
    FDQueryClientsOuvertsCPTAUX: TStringField;
    FDQueryClientsOuvertsNOM: TStringField;
    FDQueryClientsOuvertsCODREP: TSmallintField;
    FDQueryClientsOuvertsPRC_REMISE: TBCDField;
    FDQueryClientsOuvertsNOTEL: TStringField;
    FDQueryClientsOuvertsNOTAHITI: TStringField;
    FDQueryClientsOuvertsNOFAX: TStringField;
    FDQueryClientsOuvertsJRSCRD: TSmallintField;
    FDQueryClientsOuvertsCREDIT: TLargeintField;
    FDQueryClientsOuvertsplaf_crd: TIntegerField;
    FDQueryClientsOuvertsCODPAI: TStringField;
    FDQueryClientsOuvertsFIN_MOIS: TSmallintField;
    FDQueryClientsOuvertsNB_EX: TSmallintField;
    FDQueryClientsOuvertsCAAN: TLargeintField;
    FDQueryClientsOuvertsAD1: TStringField;
    FDQueryClientsOuvertsAD2: TStringField;
    FDQueryClientsOuvertsAD3: TStringField;
    FDQueryClientsOuvertsCUM_MVT: TSmallintField;
    FDQueryClientsOuvertsMT_CPTA: TLargeintField;
    FDQueryClientsOuvertsEXO_TVA: TSmallintField;
    FDQueryClientsOuvertsBLOQUE: TSmallintField;
    FDQueryClientsOuvertsCODGEO: TStringField;
    FDQueryClientsOuvertsEMAIL: TStringField;
    FDQueryClientsOuvertsCODTAR: TStringField;
    FDQueryClientsOuvertsADM: TSmallintField;
    FDQueryClientsOuvertsFLAG_TAX: TSmallintField;
    FDQueryClientsOuvertsCODFAC_ADM: TStringField;
    FDQueryClientsOuvertsFERME: TSmallintField;
    FDQueryClientsOuvertsDER_MODIF: TSQLTimeStampField;
    FDQueryClientsOuvertsSPEC_GOUV: TSmallintField;
    FDQueryClientsOuvertsNOGSM: TLargeintField;
    FDQueryClientsOuvertsPLV: TSmallintField;
    FDQueryClientsOuvertsINTIT_BQ: TStringField;
    FDQueryClientsOuvertsCODE_BQ: TStringField;
    FDQueryClientsOuvertsCODE_GUI: TStringField;
    FDQueryClientsOuvertsNOCPT: TStringField;
    FDQueryClientsOuvertsCLE: TStringField;
    FDQueryClientsOuvertsCOEF_MAJ_PR: TBCDField;
    FDQueryClientsOuvertsEXO_CPS: TSmallintField;
    FDQueryClientsOuvertsPAS_REM: TSmallintField;
    FDQueryClientsOuvertsREM_FAM: TSmallintField;
    FDQueryClientsOuvertsRELEVE_EMAIL: TBooleanField;
    FDQueryClientsOuvertsSELECT_: TBooleanField;
    FDQueryClientsOuvertsAPP_TARIFCLI: TBooleanField;
    FDQueryClientsOuvertsTVA_ILES: TBooleanField;
    LabelNomRepres: TLabel;
    procedure BtnValiderClick(Sender: TObject);
    procedure RzDBRadioGroupTypeChange(Sender: TObject);
    procedure DBCODCLIExit(Sender: TObject);
    procedure DBCODCLIChange(Sender: TObject);
    procedure DBCODREPChange(Sender: TObject);
    procedure DBCODREPExit(Sender: TObject);

  private
    { Déclarations privées }
    FCodFacCree: Integer;
    procedure CalculCompletFacture;
  public
    { Déclarations publiques }
    ModeSaisie: TModeSaisie;
    constructor Create(AOwner: TComponent; AMode: TModeSaisie; ACodFac: Integer); reintroduce;
    property CodFacCree: Integer read FCodFacCree;

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
        FCodFacCree := NumFacture;

        // Exemple d'INSERT pour l'en-tête (adaptez les noms de champs selon votre table)
        QryExec.close;
        QryExec.SQL.Text := 'INSERT INTO entvtejj (CODDEV, CODFAC, TYPE_, TOP_, DATE_, HEURE, CODDEP, CODCAI, CODCLI, NOM, TOTHT, MT_TTC) ' +
                            'VALUES (:CODDEV, :CODFAC, :TYPE_, :TOP_, :DATE_, :HEURE, :CODDEP, :CODCAI, :CODCLI, :NOM, :TOTHT, :MT_TTC)';
      end
      else
      begin
        // Exemple d'UPDATE pour l'en-tête en modification
        QryExec.SQL.Text := 'UPDATE entvtejj SET TOP_=:TOP_, CODDEV=:CODDEV, DATE_ = :DATE_, HEURE = :HEURE, CODCLI = :CODCLI, CODCAI = :CODCAI, ' +
                            'TOTHT = :TOTHT, MT_TTC = :MT_TTC, NOM = :NOM, CODDEP = :CODDEP, TYPE_=:TYPE_ ' +
                            'WHERE CODFAC = :CODFAC';
        // Récupération du numéro de facture (généré ou existant)
        NumFacture := FDMemTableEntvtejj.FieldByName('CODFAC').AsInteger;
      end;

      //ShowMessage(inttostr(NumFacture));

      // Passage des paramètres de l'en-tête
      QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
      QryExec.ParamByName('DATE_').AsDateTime := FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
      QryExec.ParamByName('HEURE').AsInteger  := ResultHeure;
      QryExec.ParamByName('TYPE_').AsString   := FDMemTableEntvtejj.FieldByName('TYPE_').AsString;
      QryExec.ParamByName('CODCLI').AsInteger := FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger;
      QryExec.ParamByName('TOTHT').AsFloat    := FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat;
      QryExec.ParamByName('CODDEV').AsInteger := FDMemTableEntvtejj.FieldByName('CODDEV').AsInteger;
      QryExec.ParamByName('MT_TTC').AsFloat   := FDMemTableEntvtejj.FieldByName('MT_TTC').AsFloat;
      QryExec.ParamByName('NOM').AsString     := FDMemTableEntvtejj.FieldByName('NOM').AsString;
      QryExec.ParamByName('CODDEP').AsInteger := FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
      QryExec.ParamByName('CODCAI').AsString  := FDMemTableEntvtejj.FieldByName('CODCAI').AsString;
      QryExec.ParamByName('TOP_').AsString    := FDMemTableEntvtejj.FieldByName('TOP_').AsString;
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
var
  QryExec: TFDQuery;
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
    //1. Stocker la valeur brute en centièmes dans le champ technique de la table
    FDMemTableEntvtejj.FieldByName('HEURE').AsLargeInt := Round(Frac(Now) * 86400 * 100);
    FDMemTableEntvtejj.FieldByName('CODCAI').AsString := Format('%d', [DM_Olivier.NumeroPoste]);
    FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger := DM_Olivier.gCoddep_defaut;
    FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger := DM_Olivier.gCodcli_defaut;
    FDMemTableEntvtejj.FieldByName('TYPE_').AsString := 'F';
    FDMemTableEntvtejj.FieldByName('TOP_').AsString := 'S';
    FDMemTableEntvtejj.FieldByName('CODVEN').AsInteger := DMGesCloud.gCodven_defaut;
    FDMemTableEntvtejj.FieldByName('NOMVEN').AsString := DMGesCloud.LoggedUser;
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
  // 2. Afficher l'heure immédiatement sous sa forme lisible :
  LabelHeureLisible.Caption := DM_Olivier.CentièmesVersHeureLisible(FDMemTableEntvtejj.FieldByName('HEURE').AsLargeInt);

  // 2. Gestion des Lignes de détails
  DM_Olivier.FDQueryLigvtejj.Close;
  DM_Olivier.FDQueryLigvtejj.ParamByName('CODFAC').AsInteger := ACodFac;
  DM_Olivier.FDQueryLigvtejj.Open();
  DM_Olivier.FDQueryLigvtejj.FetchAll;

  FDMemTableLigvtejj.Close;
  FDMemTableLigvtejj.FieldDefs.Assign(DM_Olivier.FDQueryLigvtejj.FieldDefs);
  FDMemTableLigvtejj.CreateDataSet;

  // 3. Gestion des Reglements
  DM_Olivier.FDQueryRegljj.Close;
  DM_Olivier.FDQueryRegljj.ParamByName('CODFAC').AsInteger := ACodFac;
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

  //Ouverture des Query
  FDQueryClientsOuverts.Open;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM repres WHERE CODREP=:CODREP';
  QryExec.ParamByName('CODREP').AsString :=   FDMemTableEntvtejj.FieldByName('CODREP').AsString;
  QryExec.Open;
  LabelNomRepres.Caption := QryExec.FieldByName('NOM').AsString;

  //Traitement selon type_ facture ou avoir
  RzDBRadioGroupTypeChange(self);
end;

procedure TFormEntvtejj.DBCODCLIChange(Sender: TObject);
var
  QryExec: TFDQuery;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntvtejj.State in [dsEdit, dsInsert]) then
    Exit;

  FDMemTableEntvtejj.FieldByName('NOM').AsString := FDQueryClientsOuverts.FieldByName('NOM').AsString;
  FDMemTableEntvtejj.FieldByName('NOTAHITI').AsString := FDQueryClientsOuverts.FieldByName('NOTAHITI').AsString;
  FDMemTableEntvtejj.FieldByName('CODREP').AsInteger := FDQueryClientsOuverts.FieldByName('CODREP').AsInteger;
  FDMemTableEntvtejj.FieldByName('EXO_TVA').AsInteger := FDQueryClientsOuverts.FieldByName('EXO_TVA').AsInteger;
  FDMemTableEntvtejj.FieldByName('CODGEO').AsString := FDQueryClientsOuverts.FieldByName('CODGEO').AsString;

    // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.SQL.Text := 'SELECT * FROM geo WHERE CODGEO=:CODGEO';
  QryExec.ParamByName('CODGEO').AsString :=   FDMemTableEntvtejj.FieldByName('CODGEO').AsString;
  QryExec.Open;
  FDMemTableEntvtejj.FieldByName('TVA_ILES').AsBytes := QryExec.FieldByName('TVA_ILES').AsBytes;

  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM repres WHERE CODREP=:CODREP';
  QryExec.ParamByName('CODREP').AsInteger :=   FDMemTableEntvtejj.FieldByName('CODREP').AsInteger;
  QryExec.Open;
  LabelNomRepres.Caption := QryExec.FieldByName('NOM').AsString;
end;

procedure TFormEntvtejj.DBCODCLIExit(Sender: TObject);
begin
  DBCODCLIChange(SELF);
end;

procedure TFormEntvtejj.DBCODREPChange(Sender: TObject);
var
  QryExec: TFDQuery;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntvtejj.State in [dsEdit, dsInsert]) then
    Exit;

   // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.SQL.Text := 'SELECT * FROM repres WHERE CODREP=:CODREP';
  QryExec.ParamByName('CODREP').AsInteger := FDMemTableEntvtejj.FieldByName('CODREP').AsInteger;
  QryExec.Open;
  LabelNomRepres.Caption := QryExec.FieldByName('NOM').AsString;
end;

procedure TFormEntvtejj.DBCODREPExit(Sender: TObject);
begin
 DBCODREPChange(SELF);
end;

procedure TFormEntvtejj.RzDBRadioGroupTypeChange(Sender: TObject);
begin
  if RzDBRadioGroupType.Value = 'F' then
  begin
    JvDBGridLigvtejj.AlternateRowColor := RGB(240, 248, 255); // Rose clair
  end
  else
  begin
    JvDBGridLigvtejj.AlternateRowColor := RGB(255, 182, 193); // Alice blue
  end;
end;


//CALCUL COMPLET DE LA FACTURE
procedure TFormEntvtejj.CalculCompletFacture;
var
  QryExec: TFDQuery;
  pTVA: String;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntvtejj.State in [dsEdit, dsInsert]) then
    Exit;

   // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;

  // Sauvegarde la position actuelle du curseur pour ne pas perturber l'utilisateur
  FDMemTableLigvtejj.DisableControls;
  try
    //Si exonere de TVA
	  if RzDBCheckBoxEXO_TVA.Checked then
    begin
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        FDMemTableLigvtejj.Edit;
				FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger := 0;
				FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat := 0;
				FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat := 0;
        FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat);
				FDMemTableLigvtejj.FieldByName('PRIXTTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat);
        FDMemTableLigvtejj.FieldByName('MARGE').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat - (FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat);
				FDMemTableLigvtejj.Post;
        FDMemTableLigvtejj.Next;
      end;
    end
    else
    begin
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        FDMemTableLigvtejj.Edit;

        //Lecture article
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryExec.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryExec.Open;
				FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger := StrToIntDef(StringReplace(QryExec.FieldByName('TVA').AsString, 'TVA', '', [rfReplaceAll, rfIgnoreCase]),0);
        pTVA := QryExec.FieldByName('TVA').AsString;

        //Lecture Paramre
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM parame WHERE CODE=:CODE';
        QryExec.ParamByName('CODE').AsString := pTVA;
        QryExec.Open;
				FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat :=  QryExec.FieldByName('TAUX').AsFloat;
        FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat - ((FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('PRC_REMISE').AsFloat);
        FDMemTableLigvtejj.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat,FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat));
//				IF INT_FLAG_TAX = 0 ALORS
//					ligvtepc.mt_ttc	= ligvtepc.prixttc*ligvtepc.qte
//					ligvtepc.totht	= PRIX_HT(ligvtepc.mt_ttc,ligvtepc.tx_tva,ligvtepc.tx_tsoc,article.tax_soc)
//					ligvtepc.mt_tva	= ligvtepc.totht/100*ligvtepc.tx_tva
//					ligvtepc.mt_tsoc= ligvtepc.totht/100*ligvtepc.tx_tsoc
//				ELSE
					FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
					FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat := (FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat;
					//ligvtepc.mt_tsoc	= ligvtepc.totht/100*ligvtepc.tx_tsoc
					FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat+FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat);  //+ligvtepc.mt_tsoc)
//				END
        FDMemTableLigvtejj.FieldByName('MARGE').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat - (FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat);

				FDMemTableLigvtejj.Post;
        FDMemTableLigvtejj.Next;
      end;
    end;

    //Traitement TVA ILES
    IF RzDBCheckBoxTVA_ILES.Checked AND NOT RzDBCheckBoxEXO_TVA.Checked then
    begin
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        FDMemTableLigvtejj.Edit;

        //Lecture article
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryExec.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryExec.Open;

        if QryExec.FieldByName('TVA').AsString = 'TVA0' then   //ppn
        begin
          FDMemTableLigvtejj.Next;
          CONTINUE;
        end;

        if QryExec.FieldByName('EXCLU_TVA1').AsBoolean then	  //Exclu iles
        begin
          FDMemTableLigvtejj.Next;
          CONTINUE;
        end;

        //Recherche Taux TVA en cours
        if DM_Olivier.fgTxTaxe(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime,'TVAI')=0 then
        begin
          FDMemTableLigvtejj.Next;
          CONTINUE;
        end;

				FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger := 4;
        FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat	:= DM_Olivier.fgTxTaxe(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime,'TVAI');
        FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat - ((FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('PRC_REMISE').AsFloat);
        FDMemTableLigvtejj.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat,FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat));
//        IF INT_FLAG_TAX = 0 ALORS
//          ligvtepc.mt_ttc	= ligvtepc.prixttc*ligvtepc.qte
//          ligvtepc.totht	= PRIX_HT(ligvtepc.mt_ttc,ligvtepc.tx_tva,ligvtepc.tx_tsoc,article.tax_soc)
//          ligvtepc.mt_tva	= ligvtepc.totht/100*ligvtepc.tx_tva
//          ligvtepc.mt_tsoc	= ligvtepc.totht/100*ligvtepc.tx_tsoc
//        ELSE
					FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
					FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat := (FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat;
					//ligvtepc.mt_tsoc	= ligvtepc.totht/100*ligvtepc.tx_tsoc
					FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat+FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat);  //+ligvtepc.mt_tsoc)
//        END
        FDMemTableLigvtejj.FieldByName('MARGE').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat - (FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat);

        FDMemTableLigvtejj.post;
        FDMemTableLigvtejj.Next;
      end;
    end;

    //	CAL_EVP
    FDMemTableEntvtejj.FieldByName('ANNEE').AsInteger := YearOf(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime);
    FDMemTableEntvtejj.FieldByName('MOIS').AsInteger  := MonthOf(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime);
    FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger  := 0;
    FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA').AsInteger  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA1').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA2').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA3').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVAI').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MARGE').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat  := 0;

    FDMemTableEntvtejj.FieldByName('CODGEO').AsString:=FDQueryClientsOuverts.FieldByName('CODGEO').Asstring;

    FDMemTableLigvtejj.First;
    while not FDMemTableLigvtejj.Eof do
    begin
        BtnAnnuler.Enabled:=false;

        article.codart=ligvtepc.codart
        HLitRecherchePremier(article,codart,ligvtepc.codart)
        IF ctrstock.nature="G" ALORS
          //!MàJ Prix détail (au cas ou client change)
          HLitRecherchePremier(prixgeo,primary,[entvtepc.codgeo,article.codprix])
          ligvtepc.det_ppt = article.det_ppt
          ligvtepc.det_ile = ligvtepc.det_ppt*prixgeo.coef
          HModifie(ligvtepc)
        END

        //!total co–t revient
        entvtepc.marge   += ligvtepc.qte * ligvtepc.prixrev

        //!Différents Cumuls
        SAI_MT_TTC_EVC  += ligvtepc.mt_ttc

        //!Calcul assiette Taxe sociale remisable globalement
        wHTSOCr est un numérique
        wHTSOC est un numérique
        wMTSOC est un numérique
        IF ligvtepc.mt_tsoc ALORS
          IF article.prest =0 ALORS	//!Remisable global
            wHTSOCr += ligvtepc.totht
          END
          wHTSOC += ligvtepc.totht
          wMTSOC += ligvtepc.mt_tsoc
        END

        //!Calcul assiettes TVA remisables globalement
        wHT0	est un numérique
        wHT0r	est un numérique
        wHT1	est un numérique
        wHT1r	est un numérique
        wHT2	est un numérique
        wHT2r	est un numérique
        wHT3	est un numérique
        wHT3r	est un numérique
        wHT4	est un numérique
        wHT4r	est un numérique
        wTVA1	est un numérique
        wTVA2	est un numérique
        wTVA3	est un numérique
        wTVA4	est un numérique

        IF INT_EXO_TVA=1 ALORS
          IF article.prest=0 ALORS	//!Remisable global
            wHT0r  += ligvtepc.totht
          END
          wHT0  += ligvtepc.totht
        ELSE

          SELON ligvtepc.no_tva
            CAS 0 :
              IF article.prest=0 ALORS
                wHT0r  += ligvtepc.totht
              END
              wHT0  += ligvtepc.totht

            CAS 1 :
              IF article.prest=0 ALORS
                wHT1r  += ligvtepc.totht
              END
              wHT1  += ligvtepc.totht
              wTVA1 += ligvtepc.mt_tva

            CAS 2 :
              IF article.prest=0 ALORS
                wHT2r  += ligvtepc.totht
              END
              wHT2  += ligvtepc.totht
              wTVA2 += ligvtepc.mt_tva

            CAS 3
              IF article.prest=0 ALORS
                wHT3r  += ligvtepc.totht
              END
              wHT3  += ligvtepc.totht
              wTVA3 += ligvtepc.mt_tva

            CAS 4
              IF article.prest=0 ALORS
                wHT4r  += ligvtepc.totht
              END
              wHT4  += ligvtepc.totht
              wTVA4 += ligvtepc.mt_tva
          END
        END
          HLitSuivant(ligvtepc)

      END

//!Assiettes et mont TVA
entvtepc.mt_ht0	= wHT0
entvtepc.mt_ht1	= wHT1
entvtepc.mt_ht2	= wHT2
entvtepc.mt_ht3	= wHT3
entvtepc.mt_hti	= wHT4
entvtepc.mt_tva1	= wTVA1
entvtepc.mt_tva2	= wTVA2
entvtepc.mt_tva3	= wTVA3
entvtepc.mt_tvai	= wTVA4

//!Assiette ET MONT CPS
MONT est un numérique

entvtepc.mt_htsoc	= wHTSOC
SAI_MT_TSOC_EVC	= wMTSOC

IF SAI_PRC_REMISE_EVC <> 0 ALORS
	MONT= Round(((wHT0r * SAI_PRC_REMISE_EVC) / 100))
	SAI_MT_REMISE_EVC	= MONT
	entvtepc.mt_ht0   -= MONT

	MONT = Round(((wHT1r * SAI_PRC_REMISE_EVC) / 100))
	SAI_MT_REMISE_EVC+= MONT
	entvtepc.mt_ht1   -= MONT
	entvtepc.mt_tva1   = ((entvtepc.mt_ht1/100) * gTx_TVA1)

	MONT = Round(((wHT2r * SAI_PRC_REMISE_EVC) / 100))
	SAI_MT_REMISE_EVC+= MONT
	entvtepc.mt_ht2   -= MONT
	entvtepc.mt_tva2   = ((entvtepc.mt_ht2/100) * gTx_TVA2)

	MONT = Round(((wHT3r * SAI_PRC_REMISE_EVC) / 100),1)
	SAI_MT_REMISE_EVC+= MONT
	entvtepc.mt_ht3   -= MONT
	entvtepc.mt_tva3   = ((entvtepc.mt_ht3/100) * gTx_TVA3)

	MONT = Round(((wHT4r * SAI_PRC_REMISE_EVC) / 100),1)
	SAI_MT_REMISE_EVC+= MONT
	entvtepc.mt_hti   -= MONT
	entvtepc.mt_tvai   = ((entvtepc.mt_hti/100) * gTx_TVAI)

	MONT = Round(((wHTSOCr * SAI_PRC_REMISE_EVC) / 100),1)
	entvtepc.mt_htsoc -= MONT
	SAI_MT_TSOC_EVC   = ((entvtepc.mt_htsoc/100) * entvtepc.tx_tsoc)
END

SAI_TOTHT_EVC		= entvtepc.mt_ht0 + entvtepc.mt_ht1 + entvtepc.mt_ht2 + entvtepc.mt_ht3 + entvtepc.mt_hti
SAI_MT_TVA_EVC		= entvtepc.mt_tva1 + entvtepc.mt_tva2 + entvtepc.mt_tva3 + entvtepc.mt_tvai
entvtepc.marge		= SAI_TOTHT_EVC - entvtepc.marge

//! Cause arrondi
SAI_MT_TTC_EVC    = Round(SAI_MT_TVA_EVC + SAI_TOTHT_EVC + SAI_MT_TSOC_EVC)

//Test si facture réglée
WTOT_REGLE =0
HLitRecherchePremier(reglpc,codfac,entvtepc.codfac)
TANTQUE HTrouve()=Vrai
	WTOT_REGLE += reglpc.montant
	HLitSuivant(reglpc)
FIN

SI WTOT_REGLE=SAI_MT_TTC_EVC ALORS
	entvtepc.regl=1
	entvtepc.top_= "F"
SINON
	entvtepc.regl=0
	entvtepc.top_= "S"
FIN

COULEUR_TABLE_REGLPC()

Sablier(Faux)





  finally
      // Réactive l'affichage de la grille
      FDMemTableLigvtejj.EnableControls;
	    brut_ht	= SAI_TOTHT + SAI_MT_REMISE

	    // Rafraichissement de la table ligvtepc
	    TableAffiche(TABLE_Ligvtepc,taCourantBandeau)
  end;
END;



end.
