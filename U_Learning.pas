unit U_Learning;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, JvgPage, Vcl.CategoryButtons;

type
  TFormLearning = class(TForm)
    BtnLister: TBitBtn;
    DSClients: TDataSource;
    procedure BtnListerClick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormLearning: TFormLearning;

implementation

{$R *.dfm}

uses U_DataModule;

procedure TFormLearning.BtnListerClick(Sender: TObject);
var
  DialogueSQL: TFDQuery; // Notre conteneur pour le lot d'enregistrements
begin
  // 1. On appelle la fonction en lui demandant, par exemple, tous les clients d'une zone
  DialogueSQL := DMGesCloud.LireEnregistrements('client', ['CODGEO'], ['F']);

  try
    // 2. On vérifie si on a trouvé au moins un enregistrement
    if not DialogueSQL.IsEmpty then
    begin
      // 3. On se positionne sur le tout premier enregistrement du lot
      DialogueSQL.First;

      // 4. On boucle tant qu'on n'a pas atteint la fin du lot (Eof = End of File)
      while not DialogueSQL.Eof do
      begin
        // --- C'est ici qu'on lit les données de la ligne en cours ---
        // Exemple : on affiche le nom du client en cours
        ShowMessage(DialogueSQL.FieldByName('NOM').AsString);

        // IMPORTANT : On passe obligatoirement à la ligne suivante,
        // sinon la boucle tourne à l'infini sur le même client !
        DialogueSQL.Next;
      end;
    end
    else
    begin
      ShowMessage('Aucun client trouvé dans cette zone.');
    end;

  finally
    // 5. On détruit la requête pour libérer la mémoire une fois la boucle finie
    DialogueSQL.Free;
  end;
end;


end.
