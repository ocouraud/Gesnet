unit U_TableFournis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, RzTabs;

type
  TFrameTableFournis = class(TFrame)
    Panel1: TPanel;
    EdtCherche_CODFOU: TEdit;
    EdtCherche_NOM: TEdit;
    JvDBGridFournis: TJvDBGrid;
    DSFournis: TDataSource;
    Panel2: TPanel;
    BtnAjouter: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    procedure EdtCherche_CODFOUChange(Sender: TObject);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure JvDBGridFournisTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure JvDBGridFournisDblClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);

    { Déclarations privées }
  public
    constructor Create(AOwner: TComponent); override;
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses U_DataModule, U_OutilsGrille, U_FormAide, U_FicheFournis, U_DM_Olivier;




procedure TFrameTableFournis.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('fournisseurs_liste.html');

end;

procedure TFrameTableFournis.BtnAjouterClick(Sender: TObject);
begin
  FormFicheFournis := TFormFicheFournis.Create(Self);
  try
    FormFicheFournis.DSFournis.DataSet := DM_Olivier.FDQueryFournis;

    // Configuration de la fiche
    FormFicheFournis.ModeSaisie := msAjout;
    FormFicheFournis.Caption := 'Créer un nouveau fournisseur';

    // Passage en mode insertion
    DM_Olivier.FDQueryFournis.Insert;

    // Si l'utilisateur clique sur Valider (et que le .Post interne a réussi) :
    if FormFicheFournis.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheFournis !

      // ... placez ici votre bloc de Refresh avec Bookmark si nécessaire,
      // ou simplement le Refresh de votre grille.
    end
    else
    begin
      // Si l'utilisateur a annulé, on annule l'insertion
      DM_Olivier.FDQueryFournis.Cancel;
    end;
  finally
    FormFicheFournis.Free;
  end;
end;

procedure TFrameTableFournis.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableFournis.BtnSupprimerClick(Sender: TObject);
begin
  // 1. On vérifie d'abord si la table n'est pas vide
  if DM_Olivier.FDQueryFournis.IsEmpty then
  begin
    ShowMessage('Il n''y a aucun fournisseur à supprimer.');
    Exit;
  end;

  // 2. On demande une confirmation claire à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer le fournisseur ' +
                DM_Olivier.FDQueryFournis.FieldByName('NOM').AsString + ' ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM_Olivier.FDQueryFournis.DisableControls; // On évite les clignotements visuels
    try
      // 3. On procède à la suppression dans MySQL
      DM_Olivier.FDQueryFournis.Delete;

      // 4. On rafraîchit pour que la grille soit à jour avec le serveur
      DM_Olivier.FDQueryFournis.Refresh;
    finally
      DM_Olivier.FDQueryFournis.EnableControls; // On réactive l'affichage
    end;
  end;
end;

constructor TFrameTableFournis.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table des fournisseurs (vous devez déjà avoir cette ligne ou similaire)
  DM_Olivier.FDQueryFournis.Open;
end;

procedure TFrameTableFournis.EdtCherche_CODFOUChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryFournis);
end;

procedure TFrameTableFournis.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryFournis);
end;

procedure TFrameTableFournis.JvDBGridFournisDblClick(Sender: TObject);
begin
  FormFicheFournis := TFormFicheFournis.Create(Self);
  try
    // 1. Branchement du DataSource
    FormFicheFournis.DSFournis.DataSet := DM_Olivier.FDQueryFournis;

    // 2. Configuration du mode
    FormFicheFournis.ModeSaisie := msModification;
    FormFicheFournis.Caption := 'Modifier le fournisseur';

    // 3. Passage en mode édition
    DM_Olivier.FDQueryFournis.Edit;

    // 4. Si la validation interne de la fiche réussit :
    if FormFicheFournis.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheFournisseur !

      // 5. Gestion propre du rafraîchissement avec Bookmark
      DM_Olivier.FDQueryFournis.DisableControls;
      try
        var MonSignet := DM_Olivier.FDQueryFournis.GetBookmark;
        try
          DM_Olivier.FDQueryFournis.Refresh;

          if DM_Olivier.FDQueryFournis.BookmarkValid(MonSignet) then
          begin
            try
              DM_Olivier.FDQueryFournis.GotoBookmark(MonSignet);
            except
              // Ignorer si la ligne a disparu entre-temps
            end;
          end;
        finally
          DM_Olivier.FDQueryFournis.FreeBookmark(MonSignet);
        end;
      finally
        DM_Olivier.FDQueryFournis.EnableControls;
      end;
    end
    else
    begin
      // Si l'utilisateur clique sur Annuler ou ferme la croix, on annule les modifications
      DM_Olivier.FDQueryFournis.Cancel;
    end;

  finally
    FormFicheFournis.Free;
  end;


end;

procedure TFrameTableFournis.JvDBGridFournisTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if DM_Olivier.FDQueryFournis.IndexFieldNames = Field.FieldName then
      DM_Olivier.FDQueryFournis.IndexFieldNames := Field.FieldName + ':D'
    else
      DM_Olivier.FDQueryFournis.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;

end;

end.
