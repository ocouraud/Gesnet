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
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
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

procedure TFormFicheTresor.FormCreate(Sender: TObject);
begin
  FDQueryJournal.Close;
  FDQueryJournal.Open;
end;

end.
