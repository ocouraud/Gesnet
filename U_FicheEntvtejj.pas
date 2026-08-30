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
  NumFacture: Integer;
begin
  // 1. S'assurer que les saisies en cours dans les grilles/champs sont validées (Post)
  if FDMemTableEntvtejj.State in [dsEdit, dsInsert] then
    FDMemTableEntvtejj.Post;
  if FDMemTableLigvtejj.State in [dsEdit, dsInsert] then
    FDMemTableLigvtejj.Post;
  if FDMemTableRegljj.State in [dsEdit, dsInsert] then
    FDMemTableRegljj.Post;

  // Récupération du numéro de facture (généré ou existant)
  NumFacture := FDMemTableEntvtejj.FieldByName('CODFAC').AsInteger;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la transaction MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      // ==========================================
      // 2. ENREGISTREMENT DE L'EN-TÊTE
      // ==========================================
      if ModeSaisie = msAjout then
      begin
        // Exemple d'INSERT pour l'en-tête (adaptez les noms de champs selon votre table)
        QryExec.SQL.Text := 'INSERT INTO entvtejj (CODFAC, DATE_, CODCAI, CODCLI, TOTHT, MT_TTC) ' +
                            'VALUES (:CODFAC, :DATE_, :CODCAI, :CODCLI, :TOTHT, :MT_TTC)';
      end
      else
      begin
        // Exemple d'UPDATE pour l'en-tête en modification
        QryExec.SQL.Text := 'UPDATE entvtejj SET DATE_ = :DATE_, CODCLI = :CODCLI, ' +
                            'TOTHT = :TOTHT, MT_TTC = :MT_TTC WHERE CODFAC = :CODFAC';
      end;

      // Passage des paramètres de l'en-tête
      QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
      QryExec.ParamByName('DATE_').AsDateTime := FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
      //QryExec.ParamByName('CODCAI').AsString := FDMemTableEntvtejj.FieldByName('CODCAI').AsString;
      QryExec.ParamByName('CODCLI').AsInteger := FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger;
      QryExec.ParamByName('TOTHT').AsFloat := FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat;
      QryExec.ParamByName('MT_TTC').AsFloat := FDMemTableEntvtejj.FieldByName('MT_TTC').AsFloat;

      QryExec.ExecSQL;


      // ==========================================
      // 3. ENREGISTREMENT DES LIGNES (ligvtejj)
      // ==========================================
      // Pour faire simple et propre lors d'une modification :
      // on supprime les anciennes lignes de cette facture et on réinsère l'état actuel de la table mémoire.
      if ModeSaisie = msModification then
      begin
        QryExec.SQL.Text := 'DELETE FROM ligvtejj WHERE CODFAC = :CODFAC';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des lignes
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        QryExec.SQL.Text := 'INSERT INTO ligvtejj (CODFAC, CODART, QTE, PRIXNET, TOTHT) ' +
                            'VALUES (:CODFAC, :CODART, :QTE, :PRIXNET, :TOTHT)';

        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryExec.ParamByName('QTE').AsFloat := FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
        QryExec.ParamByName('PRIXNET').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
        QryExec.ExecSQL;

        FDMemTableLigvtejj.Next;
      end;


      // ==========================================
      // 4. ENREGISTREMENT DES RÈGLEMENTS (regljj)
      // ==========================================
      if ModeSaisie = msModification then
      begin
        QryExec.SQL.Text := 'DELETE FROM regljj WHERE CODFAC = :CODFAC';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des règlements
      FDMemTableRegljj.First;
      while not FDMemTableRegljj.Eof do
      begin
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
    // On peut filtrer la requête d'en-tête pour ne charger que la facture sélectionnée
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
    FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime := Date;
    FDMemTableEntvtejj.FieldByName('CODCAI').AsString := Format('%.2d', [DM_Olivier.NumeroPoste]);
  end
  else
  begin
    // En modification, on copie l'en-tête unique correspondant
    FDMemTableEntvtejj.CopyDataSet(DM_Olivier.FDQueryEntvtejj, [coAppend]);
    FDMemTableEntvtejj.First;
  end;

  // 2. Gestion des Lignes de détails
  DM_Olivier.FDQueryLigvtejj.Close;
  if ModeSaisie = msModification then
  begin
    DM_Olivier.FDQueryLigvtejj.ParamByName('CODFAC').AsInteger := ACodFac;
  end;
  DM_Olivier.FDQueryLigvtejj.Open();
  DM_Olivier.FDQueryLigvtejj.FetchAll;

  FDMemTableLigvtejj.Close;
  FDMemTableLigvtejj.FieldDefs.Assign(DM_Olivier.FDQueryLigvtejj.FieldDefs);
  FDMemTableLigvtejj.CreateDataSet;

  // 3. Gestion des Reglements
  DM_Olivier.FDQueryRegljj.Close;
  if ModeSaisie = msModification then
  begin
    DM_Olivier.FDQueryRegljj.ParamByName('CODFAC').AsInteger := ACodFac;
  end;
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
