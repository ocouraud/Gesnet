unit U_TablePaiement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzTabs;

type
  TFrameTablePaiement = class(TFrame)
    Panel1: TPanel;
    EdtCherche_CODPAI: TEdit;
    EdtCherche_LIBELLE: TEdit;
    Panel2: TPanel;
    BtnAjouter: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridPaiement: TJvDBGrid;
    DSPaiement: TDataSource;
    procedure JvDBGridPaiementTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure JvDBGridPaiementDblClick(Sender: TObject);
    procedure EdtCherche_CODPAIChange(Sender: TObject);
    procedure EdtCherche_NOMChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    constructor Create(AOwner: TComponent); override;
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses U_DataModule, U_OutilsGrille, U_FormAide, U_DM_Olivier, U_FichePaiement;


procedure TFrameTablePaiement.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('paiements_liste.html');

end;

procedure TFrameTablePaiement.BtnAjouterClick(Sender: TObject);
begin
  FormFichePaiement := TFormFichePaiement.Create(Self);
  try
    FormFichePaiement.DSPaiement.DataSet := DM_Olivier.FDQueryPaiement;

    // Configuration de la fiche
    FormFichePaiement.ModeSaisie := msAjout;
    FormFichePaiement.Caption := 'Créer un nouveau mode de règlement';

    // Passage en mode insertion
    DM_Olivier.FDQueryPaiement.Insert;

    // Si l'utilisateur clique sur Valider (et que le .Post interne a réussi) :
    if FormFichePaiement.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheFournis !

      // ... placez ici votre bloc de Refresh avec Bookmark si nécessaire,
      // ou simplement le Refresh de votre grille.
    end
    else
    begin
      // Si l'utilisateur a annulé, on annule l'insertion
      DM_Olivier.FDQueryPaiement.Cancel;
    end;
  finally
    FormFichePaiement.Free;
  end;

end;

procedure TFrameTablePaiement.BtnFermerClick(Sender: TObject);
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

procedure TFrameTablePaiement.BtnSupprimerClick(Sender: TObject);
begin
  // 1. On vérifie d'abord si la table n'est pas vide
  if DM_Olivier.FDQueryPaiement.IsEmpty then
  begin
    ShowMessage('Il n''y a aucun mode de règlement à supprimer.');
    Exit;
  end;

  // 2. On demande une confirmation claire à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer le mode de règlement ' +
                DM_Olivier.FDQueryPaiement.FieldByName('CODPAI').AsString + ' ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM_Olivier.FDQueryPaiement.DisableControls; // On évite les clignotements visuels
    try
      // 3. On procède à la suppression dans MySQL
      DM_Olivier.FDQueryPaiement.Delete;

      // 4. On rafraîchit pour que la grille soit à jour avec le serveur
      DM_Olivier.FDQueryPaiement.Refresh;
    finally
      DM_Olivier.FDQueryPaiement.EnableControls; // On réactive l'affichage
    end;
  end;
end;

constructor TFrameTablePaiement.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table des fournisseurs (vous devez déjà avoir cette ligne ou similaire)
  DM_Olivier.FDQueryPaiement.Open;
end;

procedure TFrameTablePaiement.EdtCherche_CODPAIChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryPaiement);
end;

procedure TFrameTablePaiement.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DM_Olivier.FDQueryFournis);
end;


procedure TFrameTablePaiement.JvDBGridPaiementDblClick(Sender: TObject);
begin
  FormFichePaiement := TFormFichePaiement.Create(Self);
  try
    // 1. Branchement du DataSource
    FormFichePaiement.DSPaiement.DataSet := DM_Olivier.FDQueryPaiement;

    // 2. Configuration du mode
    FormFichePaiement.ModeSaisie := msModification;
    FormFichePaiement.Caption := 'Modifier le mode de règlement';

    // 3. Passage en mode édition
    DM_Olivier.FDQueryPaiement.Edit;

    // 4. Si la validation interne de la fiche réussit :
    if FormFichePaiement.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheFournisseur !

      // 5. Gestion propre du rafraîchissement avec Bookmark
      DM_Olivier.FDQueryPaiement.DisableControls;
      try
        var MonSignet := DM_Olivier.FDQueryPaiement.GetBookmark;
        try
          DM_Olivier.FDQueryPaiement.Refresh;

          if DM_Olivier.FDQueryPaiement.BookmarkValid(MonSignet) then
          begin
            try
              DM_Olivier.FDQueryPaiement.GotoBookmark(MonSignet);
            except
              // Ignorer si la ligne a disparu entre-temps
            end;
          end;
        finally
          DM_Olivier.FDQueryPaiement.FreeBookmark(MonSignet);
        end;
      finally
        DM_Olivier.FDQueryPaiement.EnableControls;
      end;
    end
    else
    begin
      // Si l'utilisateur clique sur Annuler ou ferme la croix, on annule les modifications
      DM_Olivier.FDQueryPaiement.Cancel;
    end;

  finally
    FormFichePaiement.Free;
  end;

end;

procedure TFrameTablePaiement.JvDBGridPaiementTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if DM_Olivier.FDQueryPaiement.IndexFieldNames = Field.FieldName then
      DM_Olivier.FDQueryPaiement.IndexFieldNames := Field.FieldName + ':D'
    else
      DM_Olivier.FDQueryPaiement.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;

end;

end.
