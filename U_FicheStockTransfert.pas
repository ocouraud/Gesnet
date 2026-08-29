unit U_FicheStockTransfert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvToolEdit, JvExMask, JvBaseEdits;

type
  //TStockTransfertModeSaisie = (msAjout, msModification); // Type nommé global à l'unité
  TFormFicheStockTransfert = class(TForm)
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    FDQueryStodepDu: TFDQuery;
    FDQueryStodepVers: TFDQuery;
    DSStodepDu: TDataSource;
    DSStodepVers: TDataSource;
    DBLookupComboBoxStodepDu: TDBLookupComboBox;
    DBLookupComboBoxStodepVers: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    EditLibelle: TEdit;
    JvCalcQte: TJvCalcEdit;
    JvCalcValunit: TJvCalcEdit;
    JvDate: TJvDateEdit;
    EditCodart: TEdit;
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBoxStodepDuClick(Sender: TObject);
    procedure DBLookupComboBoxStodepVersClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  //ModeSaisie: TStockTransfertModeSaisie; // On utilise ce type ici
  end;

var
  FormFicheStockTransfert: TFormFicheStockTransfert;

implementation

{$R *.dfm}
uses U_FicheArticle, U_DM_Olivier, U_DataModule;


procedure TFormFicheStockTransfert.BtnAnnulerClick(Sender: TObject);
begin
  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;

procedure TFormFicheStockTransfert.BtnValiderClick(Sender: TObject);
var
      FDQueryExec: TFDQuery;
begin
  // 1. (Optionnel) Vos vérifications rapides côté interface
  if VarIsNull(DBLookupComboBoxStodepDu.KeyValue) or (DBLookupComboBoxStodepDu.KeyValue = Unassigned) then
  begin
    ShowMessage('Veuillez sélectionner un dépot.');
    if DBLookupComboBoxStodepDu.CanFocus then
     DBLookupComboBoxStodepDu.SetFocus;
    Exit; // On bloque la fermeture
  end;

  if VarIsNull(DBLookupComboBoxStodepVers.KeyValue) or (DBLookupComboBoxStodepVers.KeyValue = Unassigned) then
  begin
    ShowMessage('Veuillez sélectionner un dépot.');
    if DBLookupComboBoxStodepVers.CanFocus then
     DBLookupComboBoxStodepVers.SetFocus;
    Exit; // On bloque la fermeture
  end;

  if DBLookupComboBoxStodepDu.KeyValue = DBLookupComboBoxStodepVers.KeyValue then
  begin
    ShowMessage('Veuillez sélectionner des dépots différents.');
    if DBLookupComboBoxStodepDu.CanFocus then
     DBLookupComboBoxStodepDu.SetFocus;
    Exit; // On bloque la fermeture
  end;

  if JvCalcQte.Value <= 0 then
  begin
    ShowMessage('Erreur quantité.');
    if JvCalcQte.CanFocus then
     JvCalcQte.SetFocus;
    Exit; // On bloque la fermeture
  end;

  if JvCalcQte.Value > DBLookupComboBoxStodepDu.ListSource.DataSet.FieldByName('QTE').AsFloat then
  begin
    ShowMessage('Quantité trop importante.');
    if JvCalcQte.CanFocus then
     JvCalcQte.SetFocus;
    Exit; // On bloque la fermeture
  end;

  // 2. Tentative d'enregistrement sécurisée
    FDQueryExec := TFDQuery.Create(nil);
  try
    // Exemple d'insertion directe sans dataset (en mode "Command / ExecSQL")
    FDQueryExec.Connection := DMGesCloud.ConnexionGesCloud;
    FDQueryExec.SQL.Text :=
      'INSERT INTO Stock (CODART, CODDEP, DATE_, TYPE_, QTE, VALUNIT, LIBELLE) ' +
      'VALUES (:art, :dep, :date, :type, :qte, :val, :lib)';

    // SORTIE Passage des paramètres (en récupérant les valeurs de vos contrôles, par exemple TJvCalcEdit ou TEdit)
    FDQueryExec.Params.ParamByName('art').AsString := EditCodart.Text;
    FDQueryExec.Params.ParamByName('dep').AsInteger := DBLookupComboBoxStodepDu.KeyValue; // ou le composant du dépôt source/destination
    FDQueryExec.Params.ParamByName('date').AsDateTime := JvDate.Date; // ou votre champ date
    FDQueryExec.Params.ParamByName('type').AsString := 'T'; // Par exemple 'T' pour Transfert
    FDQueryExec.Params.ParamByName('qte').AsFloat := -JvCalcQte.value; // Si vous utilisez TJvCalcEdit
    FDQueryExec.Params.ParamByName('val').AsFloat := JvCalcValunit.value;
    FDQueryExec.Params.ParamByName('lib').AsString := EditLibelle.Text;

    // Exécution de la requête d'insertion pour la sortie
    FDQueryExec.ExecSQL;


    // ENTREE Passage des paramètres (en récupérant les valeurs de vos contrôles, par exemple TJvCalcEdit ou TEdit)
    FDQueryExec.Params.ParamByName('art').AsString := EditCodart.Text;
    FDQueryExec.Params.ParamByName('dep').AsInteger := DBLookupComboBoxStodepVers.KeyValue; // ou le composant du dépôt source/destination
    FDQueryExec.Params.ParamByName('date').AsDateTime := JvDate.Date; // ou votre champ date
    FDQueryExec.Params.ParamByName('type').AsString := 'T'; // Par exemple 'T' pour Transfert
    FDQueryExec.Params.ParamByName('qte').AsFloat := JvCalcQte.value; // Si vous utilisez TJvCalcEdit
    FDQueryExec.Params.ParamByName('val').AsFloat := JvCalcValunit.value;
    FDQueryExec.Params.ParamByName('lib').AsString := EditLibelle.Text;

    // Exécution de la requête d'insertion pour l'entree
    FDQueryExec.ExecSQL;

    // Si tout est OK, on autorise la fermeture de la fiche
    Self.ModalResult := mrOk;

  except
    on E: Exception do
    begin
      // Si une erreur/doublon est détecté par la base ou le BeforePost :
      MessageDlg('Erreur sur le mouvement :'#13#10 + E.Message, mtError, [mbOK], 0);
      // La fiche reste ouverte pour que l'utilisateur corrige l'erreur !
    end;
  end;
end;


procedure TFormFicheStockTransfert.DBLookupComboBoxStodepDuClick(
  Sender: TObject);
begin
  JvCalcValunit.Value := DBLookupComboBoxStodepDu.ListSource.DataSet.FieldByName('PMP').AsFloat;
end;

procedure TFormFicheStockTransfert.DBLookupComboBoxStodepVersClick(
  Sender: TObject);
begin
  if JvCalcQte.CanFocus then
     JvCalcQte.SetFocus;
end;

procedure TFormFicheStockTransfert.FormShow(Sender: TObject);
begin
  EditCodart.text := FormFicheArticle.DBCodart.field.AsString; //DM_Olivier.FDQueryArticle.FieldByName('CODART').AsString;
  EditLibelle.text := 'Transfert de stock';

  FDQueryStodepDu.Close;
  FDQueryStodepDu.Open;

  FDQueryStodepVers.Close;
  FDQueryStodepVers.Open;
end;

end.
