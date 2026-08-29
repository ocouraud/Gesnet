unit U_TableActivite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrameTableActivite = class(TFrame)
    JvDBGrid1: TJvDBGrid;
    DSActivite: TDataSource;
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    BtnSupprimer: TBitBtn;
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule, U_FormAide;

procedure TFrameTableActivite.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('activite_liste.html');
end;

procedure TFrameTableActivite.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableActivite.BtnSupprimerClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not DM_Olivier.FDQueryActivite.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette ligne ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM_Olivier.FDQueryActivite.Delete;
    end;
  end;
end;

constructor TFrameTableActivite.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM_Olivier.FDQueryActivite.Open;
end;

procedure TFrameTableActivite.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 // Force toutes les touches alphabétiques en majuscule dans toute la grille
  Key := UpCase(Key);
end;

end.
