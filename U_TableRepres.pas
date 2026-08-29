unit U_TableRepres;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzTabs;

type
  TFrameTableRepres = class(TFrame)
    DSRepres: TDataSource;
    Panel2: TPanel;
    BtnAjouter: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    Panel1: TPanel;
    EdtCherche_CODFOU: TEdit;
    EdtCherche_NOM: TEdit;
    JvDBGrid1: TJvDBGrid;
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure EdtCherche_CODFOUChange(Sender: TObject);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);

  private
    { Déclarations privées }
  public
    constructor Create(AOwner: TComponent); override;
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule, U_OutilsGrille, U_FormAide, U_FicheRepres;


procedure TFrameTableRepres.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('representants_liste.html');
end;

procedure TFrameTableRepres.BtnAjouterClick(Sender: TObject);
begin
  FormFicheRepres := TFormFicheRepres.Create(Self);
  try
    FormFicheRepres.DSRepres.DataSet := DM_Olivier.FDQueryRepres;

    // Configuration de la fiche
    FormFicheRepres.ModeSaisie := msAjout;
    FormFicheRepres.Caption := 'Créer un nouveau représentant';

    // Passage en mode insertion
    DM_Olivier.FDQueryRepres.Insert;

    // Si l'utilisateur clique sur Valider (et que le .Post interne a réussi) :
    if FormFicheRepres.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheRepres !

      // ... placez ici votre bloc de Refresh avec Bookmark si nécessaire,
      // ou simplement le Refresh de votre grille.
    end
    else
    begin
      // Si l'utilisateur a annulé, on annule l'insertion
      DM_Olivier.FDQueryRepres.Cancel;
    end;
  finally
    FormFicheRepres.Free;
  end;

end;

procedure TFrameTableRepres.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableRepres.BtnOuvrirClick(Sender: TObject);
begin
  FormFicheRepres := TFormFicheRepres.Create(Self);
  try
    // 1. Branchement du DataSource
    FormFicheRepres.DSRepres.DataSet := DM_Olivier.FDQueryRepres;

    // 2. Configuration du mode
    FormFicheRepres.ModeSaisie := msModification;
    FormFicheRepres.Caption := 'Modifier le représentant';

    // 3. Passage en mode édition
    DM_Olivier.FDQueryRepres.Edit;

    // 4. Si la validation interne de la fiche réussit :
    if FormFicheRepres.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheRepres !

      // 5. Gestion propre du rafraîchissement avec Bookmark
      DM_Olivier.FDQueryRepres.DisableControls;
      try
        var MonSignet := DM_Olivier.FDQueryRepres.GetBookmark;
        try
          DM_Olivier.FDQueryRepres.Refresh;

          if DM_Olivier.FDQueryRepres.BookmarkValid(MonSignet) then
          begin
            try
              DM_Olivier.FDQueryRepres.GotoBookmark(MonSignet);
            except
              // Ignorer si la ligne a disparu entre-temps
            end;
          end;
        finally
          DM_Olivier.FDQueryRepres.FreeBookmark(MonSignet);
        end;
      finally
        DM_Olivier.FDQueryRepres.EnableControls;
      end;
    end
    else
    begin
      // Si l'utilisateur clique sur Annuler ou ferme la croix, on annule les modifications
      DM_Olivier.FDQueryRepres.Cancel;
    end;

  finally
    FormFicheRepres.Free;
  end;
end;

procedure TFrameTableRepres.BtnSupprimerClick(Sender: TObject);
begin
  // 1. On vérifie d'abord si la table n'est pas vide
  if DM_Olivier.FDQueryRepres.IsEmpty then
  begin
    ShowMessage('Il n''y a aucun représentant à supprimer.');
    Exit;
  end;

  // 2. On demande une confirmation claire à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer le représentant ' +
                DM_Olivier.FDQueryRepres.FieldByName('NOM').AsString + ' ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM_Olivier.FDQueryRepres.DisableControls; // On évite les clignotements visuels
    try
      // 3. On procède à la suppression dans MySQL
      DM_Olivier.FDQueryRepres.Delete;

      // 4. On rafraîchit pour que la grille soit à jour avec le serveur
      DM_Olivier.FDQueryRepres.Refresh;
    finally
      DM_Olivier.FDQueryRepres.EnableControls; // On réactive l'affichage
    end;
  end;
end;

constructor TFrameTableRepres.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table des representants (vous devez déjà avoir cette ligne ou similaire)
  DM_Olivier.FDQueryRepres.Open;
end;



procedure TFrameTableRepres.EdtCherche_CODFOUChange(Sender: TObject);
begin
    // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryRepres);
end;

procedure TFrameTableRepres.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryRepres);
end;

procedure TFrameTableRepres.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if DM_Olivier.FDQueryRepres.IndexFieldNames = Field.FieldName then
      DM_Olivier.FDQueryRepres.IndexFieldNames := Field.FieldName + ':D'
    else
      DM_Olivier.FDQueryRepres.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;

end;

end.
