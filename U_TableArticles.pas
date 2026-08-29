unit U_TableArticles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RzTabs;

type
  TFrameTableArticles = class(TFrame)
    DSArticle: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel2: TPanel;
    BtnAjouter: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    Panel1: TPanel;
    EdtCherche_CODART: TEdit;
    EdtCherche_LIBELLE: TEdit;
    CheckBoxFermes: TCheckBox;
    EdtCherche_CODFOU: TEdit;
    EdtCherche_CODFAM: TEdit;
    EdtCherche_FERME: TEdit;
    EdtCherche_REF_FOU: TEdit;
    CheckBoxCB: TCheckBox;
    procedure BtnAideClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_CODARTChange(Sender: TObject);
    procedure EdtCherche_LIBELLEChange(Sender: TObject);
    procedure CheckBoxFermesClick(Sender: TObject);
    procedure EdtCherche_CODFAMChange(Sender: TObject);
    procedure EdtCherche_CODFOUChange(Sender: TObject);
    procedure EdtCherche_REF_FOUChange(Sender: TObject);
    procedure CheckBoxCBClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_OutilsGrille, U_FormAide, U_FicheArticle;

procedure TFrameTableArticles.CheckBoxCBClick(Sender: TObject);
// Affiche ou masque la colonne "CODE-BARRES" (index 18)
var
  i: Integer;
begin
  for i := 0 to JvDBGrid1.Columns.Count - 1 do
  begin
    if JvDBGrid1.Columns[i].FieldName = 'CODE_BARRES' then
    begin
      JvDBGrid1.Columns[i].Visible := CheckBoxCB.Checked;
      Break;
    end;
  end;
end;

procedure TFrameTableArticles.CheckBoxFermesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;

//Procedure de FILTRAGE
procedure TFrameTableArticles.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete
  DM_Olivier.FDQueryArticle.Refresh;

  if not CheckBoxFermes.Checked then FiltreSQL := 'ferme = 0' else FiltreSQL := 'ferme = 1';
  if not CheckBoxFermes.Checked then EdtCherche_FERME.Text := '0' else EdtCherche_FERME.Text := '1';
  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    DM_Olivier.FDQueryArticle.Filter := FiltreSQL;
    DM_Olivier.FDQueryArticle.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    DM_Olivier.FDQueryArticle.Filtered := False;
  end;
end;


constructor TFrameTableArticles.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table des fournisseurs (vous devez déjà avoir cette ligne ou similaire)
  DM_Olivier.FDQueryArticle.Close;
  DM_Olivier.FDQueryArticle.Open;

  //Par defaut ouverture avec ferme=0
  AppliquerFiltreMaitre();
end;

procedure TFrameTableArticles.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if DM_Olivier.FDQueryArticle.IndexFieldNames = Field.FieldName then
      DM_Olivier.FDQueryArticle.IndexFieldNames := Field.FieldName + ':D'
    else
      DM_Olivier.FDQueryArticle.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFrameTableArticles.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('articles_liste.html');

end;

procedure TFrameTableArticles.BtnAjouterClick(Sender: TObject);
var
  BM: TBookmark;
begin
  FormFicheArticle := TFormFicheArticle.Create(Self);
  try
    FormFicheArticle.DSArticle.DataSet := DM_Olivier.FDQueryArticle;
    FormFicheArticle.ModeSaisie := msAjout;
    FormFicheArticle.Caption := 'Créer un nouveau client';

    DM_Olivier.FDQueryArticle.Insert;

    if FormFicheArticle.ShowModal = mrOk then
    begin
      BM := DM_Olivier.FDQueryArticle.GetBookmark;
      try
        DM_Olivier.FDQueryArticle.Refresh;
        if DM_Olivier.FDQueryArticle.BookmarkValid(BM) then
          DM_Olivier.FDQueryArticle.GotoBookmark(BM);
      finally
        DM_Olivier.FDQueryArticle.FreeBookmark(BM);
      end;
    end
    else
      DM_Olivier.FDQueryArticle.Cancel;
  finally
    FormFicheArticle.Free;
  end;
end;


procedure TFrameTableArticles.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableArticles.BtnOuvrirClick(Sender: TObject);
begin
  // Vérifie qu'un client est bien sélectionné
  if DM_Olivier.FDQueryArticle.IsEmpty then Exit;

  FormFicheArticle := TFormFicheArticle.Create(Self);
  try
    FormFicheArticle.DSArticle.DataSet := DM_Olivier.FDQueryArticle;
    FormFicheArticle.ModeSaisie := msModification;
    FormFicheArticle.Caption := 'Modifier l''article';

    DM_Olivier.FDQueryArticle.Edit; // <-- Passage en édition

  if FormFicheArticle.ShowModal = mrOk then
    DM_Olivier.RefreshDataSetWithBookmark(DM_Olivier.FDQueryArticle)
  else
    DM_Olivier.FDQueryArticle.Cancel;
  finally
    FormFicheArticle.Free;
  end;
end;

procedure TFrameTableArticles.BtnSupprimerClick(Sender: TObject);
begin
  // 1. On vérifie d'abord si la table n'est pas vide
  if DM_Olivier.FDQueryArticle.IsEmpty then
  begin
    ShowMessage('Il n''y a aucun articles à supprimer.');
    Exit;
  end;

  // 2. On demande une confirmation claire à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer l''article ' +
                DM_Olivier.FDQueryArticle.FieldByName('LIBELLE').AsString + ' ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM_Olivier.FDQueryArticle.DisableControls; // On évite les clignotements visuels
    try
      // 3. On procède à la suppression dans MySQL
      DM_Olivier.FDQueryArticle.Delete;

      // 4. On rafraîchit pour que la grille soit à jour avec le serveur
      DM_Olivier.FDQueryArticle.Refresh;
    finally
      DM_Olivier.FDQueryArticle.EnableControls; // On réactive l'affichage
    end;
  end;
end;

procedure TFrameTableArticles.EdtCherche_CODARTChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryArticle);
end;

procedure TFrameTableArticles.EdtCherche_LIBELLEChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryArticle);
end;

procedure TFrameTableArticles.EdtCherche_CODFOUChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryArticle);
end;

procedure TFrameTableArticles.EdtCherche_CODFAMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryArticle);
end;

procedure TFrameTableArticles.EdtCherche_REF_FOUChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryArticle);
end;
end.
