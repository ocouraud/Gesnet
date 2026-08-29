unit U_FormAide;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SHDocVw, Vcl.OleCtrls;

type
  TFormAide = class(TForm)
    WebBrowser1: TWebBrowser;
  public
    //procedure AfficherAide(const AUrlOuFichier: string);
    procedure AfficherAide(const APage: string);
  end;

var
  FormAide: TFormAide;

implementation

{$R *.dfm}

//procedure TFormAide.AfficherAide(const AUrlOuFichier: string);
//var
//  CheminAbsolu: string;
//begin
//  Show;
//
//  if FileExists(ExtractFilePath(ParamStr(0)) + 'Aide\' + AUrlOuFichier) then
//    CheminAbsolu := ExtractFilePath(ParamStr(0)) + 'Aide\' + AUrlOuFichier
//  else
//    CheminAbsolu := AUrlOuFichier;
//
//  WebBrowser1.Navigate(CheminAbsolu);
//end;

procedure TFormAide.AfficherAide(const APage: string);
var
  LPath: string;
begin
  // Si APage est déjà un chemin complet (ex: C:\...), on l'utilise directement.
  // Sinon, on construit le chemin à partir du dossier de l'exécutable.
  if ExtractFilePath(APage) <> '' then
    LPath := APage
  else
    LPath := ExtractFilePath(ParamStr(0)) + 'Aide\' + APage;

  if FileExists(LPath) then
  begin
    FormAide.Show; // S'assure que la fenêtre d'aide passe au premier plan
    WebBrowser1.Navigate('file:///' + StringReplace(LPath, '\', '/', [rfReplaceAll]));
  end
  else
    ShowMessage('Fichier introuvable à cet emplacement :' + sLineBreak + LPath);
end;
end.
