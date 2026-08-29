unit U_TableChrono;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  RzTabs, RzPanel, RzRadGrp;

type
  TFrameTableChrono = class(TFrame)
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridChrono: TJvDBGrid;
    BtnSupprimer: TBitBtn;
    DSChrono: TDataSource;
    procedure JvDBGridChronoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure FrameEnter(Sender: TObject);

  private
    { Déclarations privées }
    procedure PrefixGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
     constructor Create(AOwner: TComponent); override;
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier,U_FormAide;

procedure TFrameTableChrono.PrefixGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
case IndexStr(Sender.AsString, ['DEV01', 'FAC01', 'CBR01']) of
  0: Text := 'Devis';
  1: Text := 'Facture';
  2: Text := 'Code-barres';
else
  Text := Sender.AsString;
end;
end;

procedure TFrameTableChrono.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('chrono_liste.html');

end;

procedure TFrameTableChrono.BtnFermerClick(Sender: TObject);
var
  OngletParent: TRzTabSheet;
begin
  if Assigned(Self.Parent) and (Self.Parent is TRzTabSheet) then
  begin
    OngletParent := TRzTabSheet(Self.Parent);

    // Repousse la destruction de l'onglet à la fin du traitement du clic
    TThread.ForceQueue(nil, procedure
    begin
      OngletParent.Free;
    end);
  end;
end;

procedure TFrameTableChrono.BtnSupprimerClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not DM_Olivier.FDQueryChrono.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette ligne ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM_Olivier.FDQueryChrono.Delete;
    end;
  end;
end;

constructor TFrameTableChrono.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM_Olivier.FDQueryChrono.Open;
  DM_Olivier.FDQueryChrono.FieldByName('PREFIX').OnGetText := PrefixGetText;
end;

procedure TFrameTableChrono.FrameEnter(Sender: TObject);
begin
 ShowMessage('Attention: Ces chronos doivent etre manpulés avec la plus grande prudence.');
end;

procedure TFrameTableChrono.JvDBGridChronoKeyPress(Sender: TObject; var Key: Char);
begin
  // Force toutes les touches alphabétiques en majuscule dans toute la grille
  Key := UpCase(Key);
end;


end.
