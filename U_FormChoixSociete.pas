unit U_FormChoixSociete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.IniFiles,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TFormChoixSociete = class(TForm)
    StringGridSocietes: TStringGrid;
    BtnValider: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormChoixSociete: TFormChoixSociete;

implementation

{$R *.dfm}
uses U_DataModule;


procedure TFormChoixSociete.BtnValiderClick(Sender: TObject);
var
  IniFile: TIniFile;
  SectionChoisie: string;
  //MdpClair: string;
begin
  // Vérification qu'une ligne valide est sélectionnée
  if StringGridSocietes.Row < 1 then Exit;

  // On récupère le code de la société dans la 1ère colonne (colonne 0)
  SectionChoisie := StringGridSocietes.Cells[0, StringGridSocietes.Row];

  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'societes.ini');
  try
    DMGesCloud.ConnexionGesCloud.Connected := False;

    DMGesCloud.ConnexionGesCloud.DriverName := 'MySQL';
    DMGesCloud.ConnexionGesCloud.Params.Values['Server']   := IniFile.ReadString(SectionChoisie, 'Server', '127.0.0.1');
    DMGesCloud.ConnexionGesCloud.Params.Values['Database'] := IniFile.ReadString(SectionChoisie, 'Database', '');
    DMGesCloud.ConnexionGesCloud.Params.Values['User_Name']:= IniFile.ReadString(SectionChoisie, 'User', '');

    // Exemple avec le décodage Base64 si vous avez chiffré le mot de passe
    // MdpClair := TNetEncoding.Base64.Decode(IniFile.ReadString(SectionChoisie, 'Password', ''));
    // DMGesCloud.ConnexionGesCloud.Params.Values['Password'] := MdpClair;

    // Version sans chiffrement (si vous préférez le laisser en clair dans le fichier)
    DMGesCloud.ConnexionGesCloud.Params.Values['Password'] := IniFile.ReadString(SectionChoisie, 'Password', '');

    DMGesCloud.ConnexionGesCloud.Params.Values['Port']     := IniFile.ReadString(SectionChoisie, 'Port', '3306');

    // Stockage de la société courante si besoin dans le DataModule
    //DMGesCloud.SocieteCourante := SectionChoisie;

    // Test de connexion effective
    DMGesCloud.ConnexionGesCloud.Connected := True;

    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ShowMessage('Erreur de connexion : ' + E.Message);
      ModalResult := mrNone;
    end;
  end;
  IniFile.Free;
end;

procedure TFormChoixSociete.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  Sections: TStringList;
  i: Integer;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'societes.ini');
  Sections := TStringList.Create;
  try
    IniFile.ReadSections(Sections);

    // Configuration des colonnes de la grille
    StringGridSocietes.ColCount := 4;
    StringGridSocietes.RowCount := Sections.Count + 1; // +1 pour l'en-tête
    StringGridSocietes.FixedRows := 1;

    // Titres des colonnes
    StringGridSocietes.Cells[0, 0] := 'Code ID';
    StringGridSocietes.Cells[1, 0] := 'Nom de la Société';
    StringGridSocietes.Cells[2, 0] := 'Base de données';
    StringGridSocietes.Cells[3, 0] := 'Adresse';

    // Remplissage des lignes
    for i := 0 to Sections.Count - 1 do
    begin
      StringGridSocietes.Cells[0, i + 1] := Sections[i]; // Ex: SocieteA
      StringGridSocietes.Cells[1, i + 1] := IniFile.ReadString(Sections[i], 'Nom', '');
      StringGridSocietes.Cells[2, i + 1] := IniFile.ReadString(Sections[i], 'Database', '');
      StringGridSocietes.Cells[3, i + 1] := IniFile.ReadString(Sections[i], 'Server', '');
    end;

    // Ajustement visuel (optionnel)
    StringGridSocietes.Selection := TGridRect(Rect(0, 1, StringGridSocietes.ColCount - 1, 1));
  finally
    Sections.Free;
    IniFile.Free;
  end;
end;


procedure TFormChoixSociete.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    // Simule un clic sur Annuler ou ferme la fenêtre avec un code d'annulation
    ModalResult := mrCancel;
  end;
end;

end.
