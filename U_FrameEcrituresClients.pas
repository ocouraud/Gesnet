unit U_FrameEcrituresClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, RzTabs,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RzPanel, RzRadGrp, System.UITypes;

type
  TFrameEcrituresClients = class(TFrame)
    JvDBGridClients: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODCLI: TEdit;
    EdtCherche_NOM: TEdit;
    CheckBoxFermes: TCheckBox;
    Panel2: TPanel;
    BtnOuvrir: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    DSClients: TDataSource;
    FDQueryClients: TFDQuery;
    EdtCherche_CPTAUX: TEdit;
    JvDBGridTresor: TJvDBGrid;
    FDQueryTresor: TFDQuery;
    DSTresor: TDataSource;
    rgFiltreEcritures: TRzRadioGroup;
    LblTotalCredit: TLabel;
    LblTotalDebit: TLabel;
    TLabelSolde: TLabel;
    Label26: TLabel;
    LettrageCR: TLabel;
    LettrageDB: TLabel;
    Label1: TLabel;
    LettrageSolde: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnSupprimer: TBitBtn;
    BtnModifier: TBitBtn;
    BtnAjouter: TBitBtn;
    BtnContrePartie: TBitBtn;
    BtnLettrage: TBitBtn;
    EdtCherche_LIBELLE: TEdit;
    EdtCherche_DATE_: TEdit;
    EdtCherche_CODJAL: TEdit;
    BtnReleves: TBitBtn;
    constructor Create(AOwner: TComponent); override;
    procedure EdtCherche_CODCLIChange(Sender: TObject);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CPTAUXChange(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure JvDBGridClientsCellClick(Column: TColumn);
    procedure BtnFermerClick(Sender: TObject);
    procedure JvDBGridClientsTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure JvDBGridTresorTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure rgFiltreEcrituresClick(Sender: TObject);
    procedure JvDBGridTresorCellClick(Column: TColumn);
    procedure JvDBGridTresorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnContrePartieClick(Sender: TObject);
    procedure BtnLettrageClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure EdtCherche_DATE_Change(Sender: TObject);
    procedure EdtCherche_LIBELLEChange(Sender: TObject);
    procedure EdtCherche_CODJALChange(Sender: TObject);
    procedure CheckBoxFermesClick(Sender: TObject);
    procedure BtnRelevesClick(Sender: TObject);
  private
    procedure AppliquerFiltreMaitre;
    procedure CalculerSolde;
    procedure CalculerSelection;
    procedure LancementLettrage;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_FicheClient, U_OutilsGrille, U_FormAide, U_FicheTresor,
U_FormParametresRelevesClients;

procedure TFrameEcrituresClients.BtnRelevesClick(Sender: TObject);
begin
  // Vérifie qu'un client est bien sélectionné
  if FDQueryClients.IsEmpty then Exit;

  FormParametresRelevesClients := TFormParametresRelevesClients.Create(Self);
  try
    FormParametresRelevesClients.Caption := 'Paramètres relevés clients';
    FormParametresRelevesClients.DBLookupComboBoxClientDu.KeyValue:=
    FDQueryClients.FieldByName('CODCLI').AsInteger;
    FormParametresRelevesClients.DBLookupComboBoxClientAu.KeyValue:=
    FDQueryClients.FieldByName('CODCLI').AsInteger;

  if FormParametresRelevesClients.ShowModal = mrOk then
    DM_Olivier.RefreshDataSetWithBookmark(FDQueryClients)
  else
    FDQueryClients.Cancel;
  finally
    FormParametresRelevesClients.Free;
  end;

end;

procedure TFrameEcrituresClients.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('ecritures_clients_liste.html');
end;

procedure TFrameEcrituresClients.BtnAjouterClick(Sender: TObject);
var
  BM: TBookmark;
//  QryPaiement: TFDQuery;
begin
  FormFicheTresor := TFormFicheTresor.Create(Self);
  try
//    FormFicheTresor.FDQueryTresor.ParamByName('CODCLI').AsInteger := FDQueryClients.FieldByName('CODCLI').AsInteger;
    FormFicheTresor.FDQueryTresor.ParamByName('NOENR').AsInteger := 0;
    FormFicheTresor.TresorModeSaisie := msCreer;
    FormFicheTresor.Caption := 'Créer une nouvelle écriture';
    FormFicheTresor.FDQueryTresor.Open;

    // 1. On crée d'abord la ligne vide
    FormFicheTresor.FDQueryTresor.Insert;

    // 2. On injecte le code client dans le champ de la table de trésorerie pour qu'il ne soit pas vide
    FormFicheTresor.FDQueryTresor.FieldByName('CODCLI').AsInteger := FDQueryClients.FieldByName('CODCLI').AsInteger;
    FormFicheTresor.FDQueryTresor.FieldByName('Date_').AsDateTime := Now;
    FormFicheTresor.FDQueryTresor.FieldByName('Date_ech').AsDateTime := Now;
    FormFicheTresor.FDQueryTresor.FieldByName('ORIGIN').AsString := 'T';
    FormFicheTresor.FDQueryTresor.FieldByName('DEBIT').AsInteger := 0;
    FormFicheTresor.FDQueryTresor.FieldByName('CREDIT').AsInteger := 0;
    FormFicheTresor.FDQueryTresor.FieldByName('SOLDE').AsInteger := 0;

//    QryPaiement := TFDQuery.Create(nil);
//    QryPaiement.Connection := DMGesCloud.ConnexionGesCloud;
//    QryPaiement.SQL.Text := 'SELECT * from paiement where codpai=:codpai';
//    QryPaiement.ParamByName('codpai').AsString := FDQueryClients.FieldByName('codpai').AsString;
//    QryPaiement.Open;
//    FormFicheTresor.FDQueryTresor.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;

    if FormFicheTresor.ShowModal = mrOk then
    begin
      BM := FDQueryTresor.GetBookmark;
      try
        FDQueryTresor.Refresh;
        CalculerSolde;
        if FDQueryTresor.BookmarkValid(BM) then
          FDQueryTresor.GotoBookmark(BM);
      finally
        FDQueryTresor.FreeBookmark(BM);
      end;
    end
    else
      FDQueryTresor.Cancel;
  finally
    FormFicheTresor.Free;
  end;
end;

procedure TFrameEcrituresClients.BtnContrePartieClick(Sender: TObject);
var
  BM: TBookmark;
  i: Integer;
  TotalDebit, TotalCredit, NumEnrCree, Solde: Integer;
begin
  TotalDebit := 0;
  TotalCredit := 0;

  // On vérifie s'il y a des lignes sélectionnées
  if JvDBGridTresor.SelectedRows.Count > 0 then
  begin
    // Désactiver temporairement les contrôles visuels pour accélérer le traitement
    FDQueryTresor.DisableControls;
    try
      for i := 0 to JvDBGridTresor.SelectedRows.Count - 1 do
      begin
        // On positionne le dataset en passant directement le signet de la grille
        FDQueryTresor.GotoBookmark(TBookmark(JvDBGridTresor.SelectedRows.Items[i]));

        // On cumule les valeurs
        TotalDebit := TotalDebit + FDQueryTresor.FieldByName('DEBIT').AsInteger;
        TotalCredit := TotalCredit + FDQueryTresor.FieldByName('CREDIT').AsInteger;
      end;
    finally
      FDQueryTresor.EnableControls;
    end;
  end;

  //Initialisation fiche tresor
  FormFicheTresor := TFormFicheTresor.Create(Self);
  try
//    FormFicheTresor.FDQueryTresor.ParamByName('CODCLI').AsInteger := FDQueryClients.FieldByName('CODCLI').AsInteger;
    FormFicheTresor.FDQueryTresor.ParamByName('NOENR').AsInteger := 0;
    FormFicheTresor.TresorModeSaisie := msCreer;
    FormFicheTresor.Caption := 'Créer une nouvelle écriture';
    FormFicheTresor.FDQueryTresor.Open;

    // 1. On crée d'abord la ligne vide
    FormFicheTresor.FDQueryTresor.Insert;

    // 2. On injecte le code client dans le champ de la table de trésorerie pour qu'il ne soit pas vide
    FormFicheTresor.FDQueryTresor.FieldByName('CODCLI').AsInteger := FDQueryClients.FieldByName('CODCLI').AsInteger;
    FormFicheTresor.FDQueryTresor.FieldByName('Date_').AsDateTime := Now;
    FormFicheTresor.FDQueryTresor.FieldByName('Date_ech').AsDateTime := Now;
    FormFicheTresor.FDQueryTresor.FieldByName('ORIGIN').AsString := 'T';
    FormFicheTresor.FDQueryTresor.FieldByName('SOLDE').AsInteger := 0;
    if TotalCredit-TotalDebit>0 then
    begin
      FormFicheTresor.FDQueryTresor.FieldByName('DEBIT').AsInteger := TotalCredit-TotalDebit;
      FormFicheTresor.FDQueryTresor.FieldByName('CREDIT').AsInteger := 0;
    end
    else
    begin
      FormFicheTresor.FDQueryTresor.FieldByName('DEBIT').AsInteger := 0;
      FormFicheTresor.FDQueryTresor.FieldByName('CREDIT').AsInteger := TotalDebit-TotalCredit;
    end;

//    QryPaiement := TFDQuery.Create(nil);
//    QryPaiement.Connection := DMGesCloud.ConnexionGesCloud;
//    QryPaiement.SQL.Text := 'SELECT * from paiement where codpai=:codpai';
//    QryPaiement.ParamByName('codpai').AsString := FDQueryClients.FieldByName('codpai').AsString;
//    QryPaiement.Open;
//    FormFicheTresor.FDQueryTresor.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;

    if FormFicheTresor.ShowModal = mrOk then
    begin
      // 1. On récupère le NOENR de la nouvelle écriture qui vient d'être enregistrée
      // (En supposant que ton autoincrement ou dataset renvoie le dernier ID généré,
      // ou qu'il est accessible via FieldByName('NOENR'). AsInteger)
      NumEnrCree := FormFicheTresor.FDQueryTresor.FieldByName('NOENR').AsInteger;

      // 2. On rafraîchit la grille principale du frame
      FDQueryTresor.Refresh;
      CalculerSolde;

      // 3. On se positionne directement sur la nouvelle ligne grâce à sa clé unique
      if FDQueryTresor.Locate('NOENR', NumEnrCree, []) then
      begin
        // 4. On l'ajoute à la sélection multiple existante de la grille
        if not JvDBGridTresor.SelectedRows.CurrentRowSelected then
          JvDBGridTresor.SelectedRows.CurrentRowSelected := True;
      end;

      // 5. On actualise les totaux de la sélection globale
      CalculerSelection;

      //Demande de lettrage
      LancementLettrage;
      CalculerSolde;

    end
    else
      FDQueryTresor.Cancel;
  finally
    FormFicheTresor.Free;
  end;
end;


procedure TFrameEcrituresClients.LancementLettrage;
var
  Reponse: string;
  i: Integer;
  BM: TBookmark;
begin
  Reponse := '';

  // Affiche une boîte de dialogue demandant la saisie
  if InputQuery('Lettrage du jeu d''écritures ?', 'Entrez le lettrage (2 caractères max)', Reponse) then
  begin
    // Nettoyage des espaces superflus
    Reponse := UpperCase(Trim(Reponse));

    // 1. Vérification de la longueur (maximum 2 caractères)
    if Length(Reponse) > 2 then
    begin
      ShowMessage('Erreur : Le lettrage ne doit pas dépasser 2 caractères.');
      Exit; // Arrêt du traitement
    end;

    // 2. Gestion du caractère optionnel (si l'utilisateur laisse vide)
    if Reponse = '' then
    begin
      //Exit;
    end
    else
    begin
      // 3. Test du contenu pour décider de poursuivre ou pas
      if (Reponse = 'NON') or (Reponse = 'STOP') then
      begin
        ShowMessage('Traitement interrompu selon le code saisi.');
        Exit;
      end;
    end;

    // --- Poursuite du traitement principal si tout est OK ---
    if JvDBGridTresor.SelectedRows.Count > 0 then
    begin
      FDQueryTresor.DisableControls;
      try
        for i := 0 to JvDBGridTresor.SelectedRows.Count - 1 do
        begin
          BM := TBookmark(JvDBGridTresor.SelectedRows.Items[i]);

          // Sécurité indispensable : On vérifie que le signet est valide avant de l'utiliser
          if FDQueryTresor.BookmarkValid(BM) then
          begin
            FDQueryTresor.GotoBookmark(BM);

            FDQueryTresor.Edit;
            try
              FDQueryTresor.FieldByName('SOLDE').AsInteger := 1;
              FDQueryTresor.FieldByName('LETTRE').AsString := Reponse;
              FDQueryTresor.Post;
            except
              FDQueryTresor.Cancel;
              raise;
            end;
          end;
        end;
      finally
        FDQueryTresor.EnableControls;

        // Actualiser la grille et les totaux après les modifications en masse
        FDQueryTresor.Refresh;
        CalculerSolde;
      end;
    end;
  end
  else
  begin
    Exit;
  end;
end;


procedure TFrameEcrituresClients.BtnFermerClick(Sender: TObject);
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

procedure TFrameEcrituresClients.BtnLettrageClick(Sender: TObject);
begin
  LancementLettrage;
end;

procedure TFrameEcrituresClients.BtnModifierClick(Sender: TObject);
var
  NumEnr: Integer;
begin
  if FDQueryTresor.IsEmpty then Exit;

  if FDQueryTresor.FieldByName('ORIGIN').AsString='V' then
  begin
    ShowMessage('Modification interdite sur écriture de vente');
    exit;
  end;

  NumEnr := FDQueryTresor.FieldByName('NOENR').AsInteger;


  // 1. Il faut d'abord créer la fiche en mémoire !
  FormFicheTresor := TFormFicheTresor.Create(Self);
  try
    // On passe le NOENR en paramètre à la requête de la fiche
    FormFicheTresor.FDQueryTresor.ParamByName('NOENR').AsInteger := NumEnr;
//    FormFicheTresor.FDQueryTresor.ParamByName('CODCLI').AsInteger := FDQueryClients.FieldByName('CODCLI').AsInteger;
    FormFicheTresor.TresorModeSaisie := msModif;
    FormFicheTresor.Caption := 'Modifier l''écriture';
    FormFicheTresor.FDQueryTresor.Open;

        // 3. Passage en mode édition
    FormFicheTresor.FDQueryTresor.Edit;
    // Ouvre la requête de la fiche sur l'enregistrement à modifier (ou passe le paramètre/clé si besoin)
    // ...

    if FormFicheTresor.ShowModal = mrOk then
    begin
      // 1. On recharge les données de la table
      FDQueryTresor.Refresh;

      // 2. On se repositionne proprement sur l'enregistrement modifié
      if not FDQueryTresor.Locate('NOENR', NumEnr, []) then
      begin
        // Gestion de repli si besoin
      end;
    end;
  finally
    FormFicheTresor.Free;
  end;
end;


procedure TFrameEcrituresClients.BtnOuvrirClick(Sender: TObject);
begin
  // Vérifie qu'un client est bien sélectionné
  if FDQueryClients.IsEmpty then Exit;

  //Open query client pour la fiche
  DMGesCloud.ReqClients.SQL.Text:='select * from client where codcli=:codcli';
  DMGesCloud.ReqClients.ParamByName('CODCLI').AsInteger:=FDQueryClients.FieldByName('CODCLI').AsInteger;
  DMGesCloud.ReqClients.Open;

  FormFicheClient := TFormFicheClient.Create(Self);
  try
    FormFicheClient.DSClients.DataSet := DMGesCloud.ReqClients;
    FormFicheClient.ModeSaisie := msModification;
    FormFicheClient.Caption := 'Modifier le client';

    DMGesCloud.ReqClients.Edit; // <-- Passage en édition

  if FormFicheClient.ShowModal = mrOk then
    DM_Olivier.RefreshDataSetWithBookmark(FDQueryClients)
  else
    DMGesCloud.ReqClients.Cancel;
  finally
    FormFicheClient.Free;
  end;
end;


procedure TFrameEcrituresClients.BtnSupprimerClick(Sender: TObject);
begin
  // 1. On vérifie d'abord si la table n'est pas vide
  if FDQueryTresor.IsEmpty then
  begin
    ShowMessage('Il n''y a aucune écriture à supprimer.');
    Exit;
  end;

  // 2. On demande une confirmation claire à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer l''écriture selectionnée ?' +
                FDQueryTresor.FieldByName('CODPAI').AsString + ' ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FDQueryTresor.DisableControls; // On évite les clignotements visuels
    try
      // 3. On procède à la suppression dans MySQL
      FDQueryTresor.Delete;

      // 4. On rafraîchit pour que la grille soit à jour avec le serveur
      FDQueryTresor.Refresh;
    finally
      FDQueryTresor.EnableControls; // On réactive l'affichage
      CalculerSolde;
    end;
  end;
end;


constructor TFrameEcrituresClients.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table des clients et tresor
  FDQueryClients.Close;
  FDQueryClients.Open;

  rgFiltreEcritures.Enabled:=False;

  BtnAjouter.Enabled:=False;
  BtnModifier.Enabled:=False;
  BtnSupprimer.Enabled:=False;
  BtnContrePartie.Enabled:=False;
  BtnLettrage.Enabled:=False;
end;


//Procedure de FILTRAGE
procedure TFrameEcrituresClients.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete si modifiee entre temps
  FDQueryClients.Refresh;

  if not CheckBoxFermes.Checked then FiltreSQL := 'ferme = 0' else FiltreSQL := 'ferme = 1';

  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    FDQueryClients.Filter := FiltreSQL;
    FDQueryClients.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    FDQueryClients.Filtered := False;
  end;
end;


procedure TFrameEcrituresClients.EdtCherche_CODCLIChange(Sender: TObject);
begin
 // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryClients);
end;

procedure TFrameEcrituresClients.EdtCherche_CODJALChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryTresor);
end;

procedure TFrameEcrituresClients.EdtCherche_CPTAUXChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryClients);
end;

procedure TFrameEcrituresClients.EdtCherche_DATE_Change(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryTresor);
end;

procedure TFrameEcrituresClients.EdtCherche_LIBELLEChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryTresor);
end;

procedure TFrameEcrituresClients.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryClients);
end;

procedure TFrameEcrituresClients.JvDBGridClientsCellClick(Column: TColumn);
begin
  FDQueryTresor.Close;
  FDQueryTresor.ParamByName('CODCLI').AsInteger:=FDQueryClients.FieldByName('CODCLI').AsInteger;
  FDQueryTresor.Open;
  FDQueryTresor.Refresh;

  rgFiltreEcritures.Enabled:=True;
  rgFiltreEcrituresClick(nil);
  BtnContrePartie.Enabled:=False;
end;

procedure TFrameEcrituresClients.JvDBGridClientsTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryClients.IndexFieldNames = Field.FieldName then
      FDQueryClients.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryClients.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFrameEcrituresClients.JvDBGridTresorCellClick(Column: TColumn);
begin
  CalculerSelection;
end;

procedure TFrameEcrituresClients.JvDBGridTresorKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CalculerSelection;
end;

procedure TFrameEcrituresClients.JvDBGridTresorTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryTresor.IndexFieldNames = Field.FieldName then
      FDQueryTresor.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryTresor.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;


procedure TFrameEcrituresClients.rgFiltreEcrituresClick(Sender: TObject);
var
  IdCourant: Integer;
begin
  // On vide la sélection de la grille car le filtre change
  JvDBGridTresor.SelectedRows.Clear;

  IdCourant := 0;
  if not FDQueryTresor.IsEmpty then
    IdCourant := FDQueryTresor.FieldByName('NOENR').AsInteger;

  FDQueryTresor.DisableControls;
  try
    case rgFiltreEcritures.ItemIndex of
      0: // Toutes
        begin
          FDQueryTresor.Filter := '';
          FDQueryTresor.Filtered := False;
          BtnAjouter.Enabled := False;
          BtnModifier.Enabled := False;
          BtnSupprimer.Enabled := False;
        end;

      1: // Non soldées
        begin
          FDQueryTresor.Filter := 'SOLDE=0';
          FDQueryTresor.Filtered := True;
          BtnAjouter.Enabled := True;
          BtnModifier.Enabled := True;
          BtnSupprimer.Enabled := True;
        end;

      2: // Soldées
        begin
          FDQueryTresor.Filter := 'SOLDE=1';
          FDQueryTresor.Filtered := True;
          BtnAjouter.Enabled := False;
          BtnModifier.Enabled := False;
          BtnSupprimer.Enabled := False;
        end;

      3: // Aucune
        begin
          FDQueryTresor.Filter := '1 = 0';
          FDQueryTresor.Filtered := True;
          BtnAjouter.Enabled := False;
          BtnModifier.Enabled := False;
          BtnSupprimer.Enabled := False;
        end;
    end;
  finally
    FDQueryTresor.EnableControls;
  end;

  if (IdCourant > 0) and (not FDQueryTresor.Locate('NOENR', IdCourant, [])) then
    FDQueryTresor.First;

  CalculerSolde;
end;


procedure TFrameEcrituresClients.CalculerSolde;
var
  TotalDebit, TotalCredit: Currency;
  IdCourant: Integer;
begin
  TotalDebit := 0;
  TotalCredit := 0;

  FDQueryTresor.DisableControls;

  IdCourant := 0;
  if not FDQueryTresor.IsEmpty then
    IdCourant := FDQueryTresor.FieldByName('NOENR').AsInteger;

  try
    FDQueryTresor.First;
    while not FDQueryTresor.Eof do
    begin
      TotalDebit := TotalDebit + FDQueryTresor.FieldByName('DEBIT').AsCurrency;
      TotalCredit := TotalCredit + FDQueryTresor.FieldByName('CREDIT').AsCurrency;
      FDQueryTresor.Next;
    end;

    // Affichage des totaux de colonnes
    LblTotalDebit.Caption := FormatFloat('#,##0 DB', TotalDebit);
    LblTotalCredit.Caption := FormatFloat('#,##0 CR', TotalCredit);

    if TotalDebit - TotalCredit > 0 then
      TLabelSolde.Caption := FormatFloat('#,##0 DB', TotalDebit - TotalCredit)
    else
      TLabelSolde.Caption := FormatFloat('#,##0 CR', TotalCredit - TotalDebit);

    if TotalDebit - TotalCredit = 0 then
      TLabelSolde.Caption := '0';

    LettrageCR.Caption := '0';
    LettrageDB.Caption := '0';
    LettrageSolde.Caption := '0';

    CalculerSelection;

  finally
    // Restitution de la position de manière sécurisée
    if (IdCourant > 0) and (not FDQueryTresor.Locate('NOENR', IdCourant, [])) then
      FDQueryTresor.First;

    FDQueryTresor.EnableControls;
  end;
end;


procedure TFrameEcrituresClients.CheckBoxFermesClick(Sender: TObject);
begin
 AppliquerFiltreMaitre;
end;

procedure TFrameEcrituresClients.CalculerSelection;
var
  i: Integer;
  TotalDebit, TotalCredit: Double;
  BM: TBookmark;
begin
  TotalDebit := 0;
  TotalCredit := 0;

  // On vérifie s'il y a des lignes sélectionnées
  if JvDBGridTresor.SelectedRows.Count > 0 then
  begin
    FDQueryTresor.DisableControls;
    try
      for i := 0 to JvDBGridTresor.SelectedRows.Count - 1 do
      begin
        BM := TBookmark(JvDBGridTresor.SelectedRows.Items[i]);

        // On vérifie scrupuleusement si le signet est toujours valide pour cette requête
        try
          if FDQueryTresor.BookmarkValid(BM) then
          begin
            FDQueryTresor.GotoBookmark(BM);
            TotalDebit := TotalDebit + FDQueryTresor.FieldByName('DEBIT').AsFloat;
            TotalCredit := TotalCredit + FDQueryTresor.FieldByName('CREDIT').AsFloat;
          end;
        except
          // En cas de signet corrompu ou obsolète, on l'ignore silencieusement
        end;
      end;
    finally
      FDQueryTresor.EnableControls;
    end;
  end;

  // Affichage des résultats et des boutons
  LettrageDB.Caption  := FormatFloat('#,##0', TotalDebit) + ' DB';
  LettrageCR.Caption := FormatFloat('#,##0', TotalCredit) + ' CR';
  BtnContrePartie.Enabled := True;
  BtnLettrage.Enabled := False;

  if TotalDebit - TotalCredit > 0 then
    LettrageSolde.Caption := FormatFloat('#,##0 DB', TotalDebit - TotalCredit)
  else
    LettrageSolde.Caption := FormatFloat('#,##0 CR', TotalCredit - TotalDebit);

  if TotalDebit - TotalCredit = 0 then
  begin
    LettrageSolde.Caption := '0';
    BtnContrePartie.Enabled := False;
    if TotalDebit + TotalCredit<>0 then
      BtnLettrage.Enabled := True;
  end;

  //Selon la nature des ecritures
    case rgFiltreEcritures.ItemIndex of
      0: // Toutes
        begin
          BtnLettrage.Enabled := False;
          BtnContrePartie.Enabled := False;
        end;

      1: // Non soldées
        begin

        end;

      2: // Soldées
        begin
          BtnLettrage.Enabled := False;
          BtnContrePartie.Enabled := False;
        end;

      3: // Aucune
        begin
          BtnLettrage.Enabled := False;
          BtnContrePartie.Enabled := False;
        end;
    end;

end;

end.
