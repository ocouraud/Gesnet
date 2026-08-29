unit U_TableGeo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RzTabs, RzPanel, RzRadGrp;

type
  TFrameTableGeo = class(TFrame)
    DSGeo: TDataSource;
    JvDBGrid1: TJvDBGrid;
    BtnSupprimer: TBitBtn;
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule, U_FormAide;

procedure TFrameTableGeo.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('geo_liste.html');
end;

procedure TFrameTableGeo.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableGeo.BtnSupprimerClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not DM_Olivier.FDQueryGeo.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette ligne ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM_Olivier.FDQueryGeo.Delete;
    end;
  end;
end;

constructor TFrameTableGeo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM_Olivier.FDQueryGeo.Open;
end;

procedure TFrameTableGeo.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  // Force toutes les touches alphabétiques en majuscule dans toute la grille
  Key := UpCase(Key);
end;

end.
