unit U_TablePostesAchats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrameTablePostesAchats = class(TFrame)
    DSPoste: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    BtnSupprimer: TBitBtn;
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure BtnAppliquerClick(Sender: TObject);
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

constructor TFrameTablePostesAchats.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM_Olivier.FDQueryPoste.Open;
end;

procedure TFrameTablePostesAchats.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('poste_liste.html');
end;

procedure TFrameTablePostesAchats.BtnAppliquerClick(Sender: TObject);
begin
  // 1. Valide la cellule / ligne en cours de saisie en mémoire
  if DM_Olivier.FDQueryPoste.State in [dsEdit, dsInsert] then
    DM_Olivier.FDQueryPoste.Post;

  // 2. Transfère l'intégralité des modifications de la Frame vers MySQL en un seul appel
  if DM_Olivier.FDQueryPoste.ChangeCount > 0 then
  begin
    DM_Olivier.FDQueryPoste.ApplyUpdates;
    DM_Olivier.FDQueryPoste.CommitUpdates; // Vide le tampon mémoire local après succès
  end;
end;

procedure TFrameTablePostesAchats.BtnFermerClick(Sender: TObject);
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


procedure TFrameTablePostesAchats.BtnSupprimerClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not DM_Olivier.FDQueryPoste.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette ligne ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM_Olivier.FDQueryPoste.Delete;
    end;
  end;
end;

procedure TFrameTablePostesAchats.JvDBGrid1CellClick(Column: TColumn);
begin
  // Si on clique sur la case à cocher et que la ligne est en édition
  if SameText(Column.FieldName, 'STOCK_BOOL') and
     (JvDBGrid1.DataSource.DataSet.State in [dsEdit, dsInsert]) then
  begin
    JvDBGrid1.DataSource.DataSet.Post; // Envoie immédiatement l'UPDATE à MySQL
  end;
end;

procedure TFrameTablePostesAchats.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 // Force toutes les touches alphabétiques en majuscule dans toute la grille
  Key := UpCase(Key);
end;

end.
