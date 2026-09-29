unit U_FormParametresRelevesClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls;

type
  TFormParametresRelevesClients = class(TForm)
    DBLookupComboBoxClientDu: TDBLookupComboBox;
    FDQueryClientsDu: TFDQuery;
    DSClientDu: TDataSource;
    DSClientAu: TDataSource;
    DBLookupComboBoxClientAu: TDBLookupComboBox;
    FDQueryClientsAu: TFDQuery;
    CheckBoxSoldees: TCheckBox;
    CheckBoxNonSoldees: TCheckBox;
    BtnValid: TButton;
    Button1: TButton;
    JvDateEditDu: TJvDateEdit;
    JvDateEditAu: TJvDateEdit;
    procedure FormShow(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormParametresRelevesClients: TFormParametresRelevesClients;

implementation

{$R *.dfm}
  uses U_DataModule, U_DM_Olivier, U_FrameEcrituresClients;


procedure TFormParametresRelevesClients.FormShow(Sender: TObject);
begin
  FDQueryClientsDu.open;
  FDQueryClientsAu.open;
end;

end.
