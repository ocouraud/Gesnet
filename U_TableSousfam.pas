unit U_TableSousfam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  RzTabs, RzPanel, RzRadGrp;

type
  TFrameTableSousfam = class(TFrame)
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridSousfam: TJvDBGrid;
    BtnSupprimer: TBitBtn;
    DSSousfam: TDataSource;
    procedure JvDBGridSousfamKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);

  private
    { Déclarations privées }
  public
     constructor Create(AOwner: TComponent); override;
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier,U_FormAide;

procedure TFrameTableSousfam.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('sousfam_liste.html');

end;

procedure TFrameTableSousfam.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableSousfam.BtnSupprimerClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not DM_Olivier.FDQuerySousFam.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette ligne ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM_Olivier.FDQuerySousFam.Delete;
    end;
  end;
end;

constructor TFrameTableSousfam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DM_Olivier.FDQuerySousFam.Open;
end;

procedure TFrameTableSousfam.JvDBGridSousfamKeyPress(Sender: TObject; var Key: Char);
begin
  // Force toutes les touches alphabétiques en majuscule dans toute la grille
  Key := UpCase(Key);
end;


end.
