unit U_FormExportEcrituresClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvExStdCtrls, JvRadioButton, Vcl.ExtCtrls, JvExExtCtrls,
  JvRadioGroup, JvCheckBox;

type
  TFormExportEcrituresClient = class(TForm)
    BtnGenerer: TButton;
    JvDateEditDu: TJvDateEdit;
    JvDateEditAu: TJvDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    JvCheckBoxVentes: TJvCheckBox;
    JvCheckBoxTresor: TJvCheckBox;
    JvRadioGroup1: TJvRadioGroup;
    JvRadioButtonNouveaux: TJvRadioButton;
    JvRadioButtonTous: TJvRadioButton;
    JvRadioGroup2: TJvRadioGroup;
    JvRadioGroup3: TJvRadioGroup;
    JvRadioButtonPasInterf: TJvRadioButton;
    JvRadioButtonSaari: TJvRadioButton;
    JvRadioButtonRevatel: TJvRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    procedure BtnGenererClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    pNature: Integer;
    pEtendu: Integer;
    pModele: Integer;
  public
    { Déclarations publiques }
  end;

var
  FormExportEcrituresClient: TFormExportEcrituresClient;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier, U_DM_ExportEcrituresClients;

procedure TFormExportEcrituresClient.BtnGenererClick(Sender: TObject);
begin
  pNature:=0;
  if JvCheckBoxVentes.Checked=True then
  begin
    pNature:=1;
    if JvCheckBoxTresor.Checked=True then
      pNature:=3;
  end
  else
  begin
    if JvCheckBoxTresor.Checked=True then
      pNature:=2;
  end;

  pEtendu:=0;
  if JvRadioButtonNouveaux.Checked=True then
    pEtendu:=1;  //Nouveaux seulement
  if JvRadioButtonTous.Checked=True then
    pEtendu:=2;  //Tous

  pModele:=0;
  if JvRadioButtonSaari.Checked=True then
    pModele:=1;
  if JvRadioButtonRevatel.Checked=True then
    pModele:=2;

  DM_ExportEcrituresClients.Export_Ecrit_Compta_Clients(JvDateEditDu.Date,JvDateEditAu.Date,pModele,pNature,pEtendu);
end;

procedure TFormExportEcrituresClient.FormCreate(Sender: TObject);
begin
  JvDateEditDu.Date:=Now;
  JvDateEditAu.Date:=Now;

  JvCheckBoxVentes.Checked:=True;

  JvRadioButtonNouveaux.Checked:=True;
  JvRadioButtonTous.Checked:=False;

  DM_Olivier.FDQueryCtrstock.Open;
  if DM_Olivier.FDQueryCtrstock.FieldByName('INTER_CPTA').AsInteger=1 then
    JvRadioButtonSaari.Checked:=True;
  if DM_Olivier.FDQueryCtrstock.FieldByName('INTER_CPTA').AsInteger=2 then
    JvRadioButtonRevatel.Checked:=True;
end;

end.
