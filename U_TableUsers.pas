unit U_TableUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormTableUsers = class(TForm)
    JvDBGrid1: TJvDBGrid;
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    BtnSupprimer: TBitBtn;
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormTableUsers: TFormTableUsers;

implementation

{$R *.dfm}
uses U_DataModule, U_FormAide;

procedure TFormTableUsers.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('users_liste.html');
end;

procedure TFormTableUsers.BtnSupprimerClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not DMGesCloud.QrySecUsers.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette ligne ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DMGesCloud.QrySecUsers.Delete;
    end;
  end;
end;

end.
