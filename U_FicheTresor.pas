unit U_FicheTresor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, JvExMask, JvToolEdit, JvDBControls;

type
  TTresorModeSaisie = (msCreer, msModif); // Type nommé global à l'unité
  TFormFicheTresor = class(TForm)
    DSTresor: TDataSource;
    FDQueryTresor: TFDQuery;
    FDQueryTresorCODCLI: TIntegerField;
    FDQueryTresorDATE_: TDateField;
    FDQueryTresorTOP_: TStringField;
    FDQueryTresorLIBELLE: TStringField;
    FDQueryTresorDEBIT: TLargeintField;
    FDQueryTresorCREDIT: TLargeintField;
    FDQueryTresorANNEE: TIntegerField;
    FDQueryTresorMOIS: TSmallintField;
    FDQueryTresorDATE_ECH: TDateField;
    FDQueryTresorCODPAI: TStringField;
    FDQueryTresorSOLDE: TSmallintField;
    FDQueryTresorSELECT_: TSmallintField;
    FDQueryTresorDATE_OPER: TDateField;
    FDQueryTresorDATE_COMPTA: TDateField;
    FDQueryTresorREFERENCE_: TStringField;
    FDQueryTresorTYPE_: TStringField;
    FDQueryTresorCODREP: TSmallintField;
    FDQueryTresorORIGIN: TStringField;
    FDQueryTresorLETTRE: TStringField;
    FDQueryTresorNOENR: TFDAutoIncField;
    FDQueryTresorDER_MODIF: TSQLTimeStampField;
    Label1: TLabel;
    Label2: TLabel;
    DBEditLibelle: TDBEdit;
    Label3: TLabel;
    DBEditDEBIT: TDBEdit;
    Label4: TLabel;
    DBEditCREDIT: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BtnAnnuler: TBitBtn;
    BtnValider: TBitBtn;
    FDQueryTresorCODJAL: TStringField;
    DSJournal: TDataSource;
    DBLookupComboBoxJournal: TDBLookupComboBox;
    Label5: TLabel;
    FDQueryJournal: TFDQuery;
    JvDBDateEditDate_: TJvDBDateEdit;
    JvDBDateEditDate_ech: TJvDBDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    TresorModeSaisie: TTresorModeSaisie; // On utilise ce type ici
  end;

var
  FormFicheTresor: TFormFicheTresor;

implementation

{$R *.dfm}
uses U_FrameEcrituresClients, U_DM_Olivier, U_DataModule, U_FormAide;

procedure TFormFicheTresor.BtnValiderClick(Sender: TObject);
var
  ReqVerification: TFDQuery;
begin
  // ==========================================
  // 1. CONTRÔLES COMMUNS (AJOUT ET MODIFICATION)
  // ==========================================

  if Trim(DBEditLibelle.Text) = '' then
  begin
    ShowMessage('Veuillez saisir un code libellé.');
    if DBEditLibelle.CanFocus then
      DBEditLibelle.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxJournal.Text) = '' then
  begin
    ShowMessage('Veuillez saisir un code journal.');
    if DBLookupComboBoxJournal.CanFocus then
     DBLookupComboBoxJournal.SetFocus;
    Exit;
  end;

  if DSTresor.DataSet.FieldByName('DEBIT').AsInteger +
   DSTresor.DataSet.FieldByName('CREDIT').AsInteger = 0 then
  begin
    ShowMessage('Veuillez saisir un débit ou un crédit.');
    if DBEditDEBIT.CanFocus then
     DBEditDEBIT.SetFocus;
    Exit;
  end;

  // --- 2. LA TENTATIVE D'ENREGISTREMENT SÉCURISÉE ---
  try
    DSTresor.DataSet.FieldByName('TYPE_').AsString:=FDQueryJournal.FieldByName('TYPE_').AsString;
    // On force l'enregistrement dans le Dataset (ce qui va déclencher le BeforePost du DataModule)
    FDQueryTresor.Post;

    // SI TOUT S'EST BIEN PASSÉ :
    // On ferme la fiche par code en renvoyant mrOk à la fenêtre parente
    Self.ModalResult := mrOk;

  except
    on E: Exception do
    begin
      // SI LE BEFOREPOST (OU LA BDD) LEVE UNE ERREUR :
      MessageDlg('Validation impossible :'#13#10 + E.Message, mtError, [mbOK], 0);
    end;

  end;
end;

procedure TFormFicheTresor.FormCreate(Sender: TObject);
begin
  FDQueryJournal.Close;
  FDQueryJournal.Open;
end;

end.
