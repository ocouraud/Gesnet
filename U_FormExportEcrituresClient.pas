unit U_FormExportEcrituresClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormExportEcrituresClient = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormExportEcrituresClient: TFormExportEcrituresClient;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier, U_DM_ExportEcrituresClients;

procedure TFormExportEcrituresClient.Button1Click(Sender: TObject);
begin
  DM_ExportEcrituresClients.Export_Ecrit_Compta_Clients(now,now,1,1,1);
end;

end.
