unit U_FicheClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  RzPanel, RzRadGrp, JvExDBGrids, JvDBGrid, System.UITypes;

type
  TFormFicheClient = class(TForm)
    DSClients: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Label1: TLabel;
    DBcodcli: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBoxRepres: TDBLookupComboBox;
    Label4: TLabel;
    DSRepres: TDataSource;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    DBLookupComboBoxGeo: TDBLookupComboBox;
    DSGeo: TDataSource;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    DBCheckBoxFerme: TDBCheckBox;
    Label13: TLabel;
    DBEditPrc_remise: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBoxPaiement: TDBLookupComboBox;
    Label15: TLabel;
    DSPaiement: TDataSource;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    DBCheckBoxFinMois: TDBCheckBox;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    Label24: TLabel;
    DBEdit21: TDBEdit;
    ComboTarif: TDBLookupComboBox;
    Label25: TLabel;
    DSTarif: TDataSource;
    DSTarifcli: TDataSource;
    FDQueryTarifcli: TFDQuery;
    TDBGridTarifcli: TDBGrid;
    BtnNouveauTarifcli: TSpeedButton;
    BtnModifierTarifcli: TSpeedButton;
    BtnSupprimerTarifcli: TSpeedButton;
    DBCheckBoxAppTarifcli: TDBCheckBox;
    FDQueryEntvteaa: TFDQuery;
    DSEntvteaa: TDataSource;
    BtnConsulterFacture: TSpeedButton;
    BtnImprimerFacture: TSpeedButton;
    FDQueryTresor: TFDQuery;
    DSTresor: TDataSource;
    TLabelSolde: TLabel;
    rgFiltreEcritures: TRzRadioGroup;
    Label26: TLabel;
    Panel2: TPanel;
    LblTotalDebit: TLabel;
    LblTotalCredit: TLabel;
    FDQueryStatis: TFDQuery;
    DSStatis: TDataSource;
    JvDBGridEntvteaa: TJvDBGrid;
    JvDBGridTresor: TJvDBGrid;
    JvDBGridStatis: TJvDBGrid;
    BtnAide: TBitBtn;
    FDQueryCliinfocompl: TFDQuery;
    DSCliinfocompl: TDataSource;
    JvDBGridCliinfocompl: TJvDBGrid;
    BtnAjouterInfo: TBitBtn;
    BtnSupprimerInfo: TBitBtn;
    TabSheetDevis: TTabSheet;
    FDQueryEnt_prof: TFDQuery;
    DSEnt_prof: TDataSource;
    JvDBGridEnt_prof: TJvDBGrid;
    BtnConsulter_devis: TSpeedButton;
    BtnImpDevis: TSpeedButton;
    procedure BtnValiderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboTarifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnNouveauTarifcliClick(Sender: TObject);
    procedure BtnModifierTarifcliClick(Sender: TObject);
    procedure BtnSupprimerTarifcliClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrierOrdreTabulation(ParentControl: TWinControl);
    procedure BtnImprimerFactureClick(Sender: TObject);
    procedure DBGridTresorTitleClick(Column: TColumn);
    procedure rgFiltreEcrituresClick(Sender: TObject);
    procedure CalculerSolde;
    procedure JvDBGridEntvteaaTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure JvDBGridTresorTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure JvDBGridStatisTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnConsulterFactureClick(Sender: TObject);
    procedure FDQueryEntvteaaHEUREGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnAjouterInfoClick(Sender: TObject);
    procedure BtnSupprimerInfoClick(Sender: TObject);
    procedure FDQueryCliinfocomplAfterOpen(DataSet: TDataSet);
    procedure DBEditPrc_remiseExit(Sender: TObject);
    procedure JvDBGridEnt_profTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnConsulter_devisClick(Sender: TObject);
    procedure BtnImpDevisClick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification); // <-- CA DOIT ÊTRE ICI !
  end;

var
  FormFicheClient: TFormFicheClient;

implementation

uses U_FicheTarifClient, U_DataModule, U_DM_Olivier, System.Generics.Collections, System.Generics.Defaults,
  U_ReportFactureAA, U_ReportDevisAA, U_FicheFacture, U_FicheDevis, U_FormAide, U_SelCodInfoCompl; // <--- C'est cette ligne qui donne l'accès à DMGesCloud !

{$R *.dfm}



procedure TFormFicheClient.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('client.html');
end;



procedure TFormFicheClient.btnAjouterInfoClick(Sender: TObject);
var
  LIdInfo: SmallInt;
  LCodInfo: string;
  LCodCli: Integer;
begin
  LCodCli := DMGesCloud.ReqClients.FieldByName('CODCLI').AsInteger;

  if LCodCli = 0 then
  begin
    ShowMessage('Veuillez d''abord sélectionner un client.');
    Exit;
  end;

  if TFormSelCodInfoCompl.SelectionnerCli('C', LCodCli, LIdInfo, LCodInfo) then
  begin
    // Vérification si la combinaison existe déjà dans le DataSet actuel
    if FDQueryCliinfocompl.Locate('id;codinfo', VarArrayOf([LIdInfo, LCodInfo]), []) then
    begin
      ShowMessage('Cette information complémentaire est déjà attribuée à ce client.');
      Exit;
    end;

    // Si elle n'existe pas, on insère
    FDQueryCliinfocompl.Append;
    FDQueryCliinfocompl.FieldByName('id').AsInteger := LIdInfo;
    FDQueryCliinfocompl.FieldByName('CODCLI').AsInteger := LCodCli;
    FDQueryCliinfocompl.FieldByName('codinfo').AsString := LCodInfo;
    FDQueryCliinfocompl.Post;

    FDQueryCliinfocompl.Refresh;
  end;
end;


procedure TFormFicheClient.BtnConsulterFactureClick(Sender: TObject);
var
  NumFacture: Integer; // ou Int64 selon la taille de votre numérique
  FormFicheFacture: TFormFicheFacture; // <-- On déclare la variable de la fiche
begin
  NumFacture := FDQueryEntvteaa.FieldByName('CODFAC').AsInteger; // ou le nom exact de votre champ dans la ligne

  // 1. On charge la facture dans le DataModule
  DMGesCloud.FDQueryPrintEntvteaa.Close;
//  DMGesCloud.FDQueryPrintEntvteaa.SQL.Text := 'SELECT * FROM entvteaa WHERE CODFAC = :codfac';
  DMGesCloud.FDQueryPrintEntvteaa.Params[0].AsInteger := NumFacture; // Utilisation de .AsInteger pour un champ numérique
  DMGesCloud.FDQueryPrintEntvteaa.Open;

  FormFicheFacture := TFormFicheFacture.Create(Self);
  FormFicheFacture.Caption := 'Consultation Facture N° ' + FDQueryEntvteaa.FieldByName('CODFAC').AsString;

try
    FormFicheFacture.ShowModal;
  finally
    FormFicheFacture.Free;
  end;
end;


procedure TFormFicheClient.BtnConsulter_devisClick(Sender: TObject);
var
  NumDevis: Integer; // ou Int64 selon la taille de votre numérique
  FormFicheDevis: TFormFicheDevis; // <-- On déclare la variable de la fiche
begin
  NumDevis := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger; // ou le nom exact de votre champ dans la ligne

  // 1. On charge la facture dans le DataModule
  DM_Olivier.FDQueryEnt_prof.Close;
//  DMGesCloud.FDQueryPrintEntvteaa.SQL.Text := 'SELECT * FROM entvteaa WHERE CODFAC = :codfac';
  DM_Olivier.FDQueryEnt_prof.Params[0].AsInteger := NumDevis; // Utilisation de .AsInteger pour un champ numérique
  DM_Olivier.FDQueryEnt_prof.Open;

  FormFicheDevis := TFormFicheDevis.Create(Self);
  FormFicheDevis.Caption := 'Consultation Devis N° ' + FDQueryEnt_prof.FieldByName('CODDEV').AsString;

try
    FormFicheDevis.ShowModal;
  finally
    FormFicheDevis.Free;
  end;
end;

procedure TFormFicheClient.BtnImpDevisClick(Sender: TObject);
var
  NumDevisSelectionne: Integer;
begin
  // 1. On récupère le numéro de la facture sélectionnée dans la grille des factures
  // (Assurez-vous de cibler le bon champ, ici supposé 'CODFAC')
  NumDevisSelectionne := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if NumDevisSelectionne = 0 then
  begin
    ShowMessage('Veuillez sélectionner un devis dans la liste.');
    Exit;
  end;

  // 2. On injecte le paramètre et on ouvre les requêtes sur le DataModule
  DM_Olivier.FDQueryEnt_prof.Close;
  DM_Olivier.FDQueryEnt_prof.ParamByName('CODDEV').AsInteger := NumDevisSelectionne;
  DM_Olivier.FDQueryEnt_prof.Open;

  DMGesCloud.FDQueryRepres.Close;
  DMGesCloud.FDQueryRepres.ParamByName('CODREP').AsInteger := FDQueryEnt_prof.FieldByName('CODREP').AsInteger;
  DMGesCloud.FDQueryRepres.Open;

  // 3. On crée la fiche d'impression, on affiche l'aperçu, puis on libère la mémoire
  FormDevisPrint := TFormDevisPrint.Create(Self);

  FormDevisPrint.FDQueryLig_prof.Close;
  FormDevisPrint.FDQueryLig_prof.ParamByName('CODDEV').AsInteger := NumDevisSelectionne;
  FormDevisPrint.FDQueryLig_prof.Open;
  try
    // RLReport1 est le nom de votre composant TRLReport sur FormDevisPrint
    FormDevisPrint.RLReport1.Preview;
  finally
    FormDevisPrint.Free;
  end;

 end;

procedure TFormFicheClient.BtnImprimerFactureClick(Sender: TObject);
var
  NumFactureSelectionnee: Integer;
begin
  // 1. On récupère le numéro de la facture sélectionnée dans la grille des factures
  // (Assurez-vous de cibler le bon champ, ici supposé 'CODFAC')
  NumFactureSelectionnee := FDQueryEntvteaa.FieldByName('CODFAC').AsInteger;

  if NumFactureSelectionnee = 0 then
  begin
    ShowMessage('Veuillez sélectionner une facture dans la liste.');
    Exit;
  end;

  // 2. On injecte le paramètre et on ouvre les requêtes sur le DataModule
  DMGesCloud.FDQueryPrintEntvteaa.Close;
  DMGesCloud.FDQueryPrintEntvteaa.ParamByName('CODFAC').AsInteger := NumFactureSelectionnee;
  DMGesCloud.FDQueryPrintEntvteaa.Open;

  DMGesCloud.FDQueryLigvteaa.Close;
  DMGesCloud.FDQueryLigvteaa.ParamByName('CODFAC').AsInteger := NumFactureSelectionnee;
  DMGesCloud.FDQueryLigvteaa.Open;

  DMGesCloud.FDQueryReglaa.Close;
  DMGesCloud.FDQueryReglaa.ParamByName('CODFAC').AsInteger := NumFactureSelectionnee;
  DMGesCloud.FDQueryReglaa.Open;

  DMGesCloud.FDQueryRepres.Close;
  DMGesCloud.FDQueryRepres.ParamByName('CODREP').AsInteger := FDQueryEntvteaa.FieldByName('CODREP').AsInteger;
  DMGesCloud.FDQueryRepres.Open;

  // 3. On crée la fiche d'impression, on affiche l'aperçu, puis on libère la mémoire
  FormFacturePrint := TFormFacturePrint.Create(Self);
  try
    // RLReport1 est le nom de votre composant TRLReport sur FormFacturePrint
    FormFacturePrint.RLReport1.Preview;
  finally
    FormFacturePrint.Free;
  end;
 end;


//Modifier Tarifcli
procedure TFormFicheClient.BtnModifierTarifcliClick(Sender: TObject);
var
  V_CodCli, V_CodArt: string;
begin
  if FDQueryTarifcli.IsEmpty then
  begin
    ShowMessage('Veuillez sélectionner un tarif à modifier.');
    Exit;
  end;

  V_CodCli := FDQueryTarifcli.FieldByName('CODCLI').AsString;
  V_CodArt := FDQueryTarifcli.FieldByName('CODART').AsString;

  // 1. Préparation de la saisie
  DMGesCloud.ReqSaisieTarif.Close;
  DMGesCloud.ReqSaisieTarif.SQL.Text := 'SELECT * FROM tarifcli WHERE CODCLI = :CODCLI AND CODART = :CODART';
  DMGesCloud.ReqSaisieTarif.ParamByName('CODCLI').AsString := V_CodCli;
  DMGesCloud.ReqSaisieTarif.ParamByName('CODART').AsString := V_CodArt;
  DMGesCloud.ReqSaisieTarif.Open;

  if DMGesCloud.ReqSaisieTarif.IsEmpty then
  begin
    ShowMessage('Impossible de charger le tarif sélectionné.');
    Exit;
  end;

  DMGesCloud.ReqSaisieTarif.Edit;

  // 2. Création et affichage de la fiche de saisie
  FicheTarifClient := TFicheTarifClient.Create(Self);
  try
    FicheTarifClient.DBCodcli.ReadOnly := True;
    FicheTarifClient.DBLookupComboBoxArticles.Enabled := False;

    // Si l'utilisateur clique sur "Valider" (et que le .Post interne a réussi !)
    if FicheTarifClient.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait par la fiche Tarif ! On a juste à fermer la requête
      DMGesCloud.ReqSaisieTarif.Close;

      // Rafraîchissement de la grille principale
      FDQueryTarifcli.Close;
      FDQueryTarifcli.Open;
    end
    else
    begin
      // Si l'utilisateur a cliqué sur "Annuler"
      if DMGesCloud.ReqSaisieTarif.State in [dsEdit] then
        DMGesCloud.ReqSaisieTarif.Cancel;
      DMGesCloud.ReqSaisieTarif.Close;
    end;
  finally
    FicheTarifClient.Free;
  end;
end;


//Ajout Tarifcli
procedure TFormFicheClient.BtnNouveauTarifcliClick(Sender: TObject);
begin
  // 1. Préparation de la saisie
  DMGesCloud.ReqSaisieTarif.Open;
  DMGesCloud.ReqSaisieTarif.Append;
  DMGesCloud.ReqSaisieTarif.FieldByName('CODCLI').AsString := DMGesCloud.ReqClients.FieldByName('CODCLI').AsString;

  // 2. Création et affichage de la fiche de saisie
  FicheTarifClient := TFicheTarifClient.Create(Self);
  try
    // Si l'utilisateur clique sur "Valider" (et que le .Post interne a réussi !)
    if FicheTarifClient.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait par la fiche Tarif ! On a juste à fermer la requête
      DMGesCloud.ReqSaisieTarif.Close;

      // Rafraîchissement de la grille principale
      FDQueryTarifcli.Close;
      FDQueryTarifcli.Open;
    end
    else
    begin
      // Si l'utilisateur a cliqué sur "Annuler"
      DMGesCloud.ReqSaisieTarif.Cancel;
      DMGesCloud.ReqSaisieTarif.Close;
    end;
  finally
    FicheTarifClient.Free;
  end;
end;


//Supression d'un Tarifcli
procedure TFormFicheClient.BtnSupprimerInfoClick(Sender: TObject);
begin
  // 1. Vérification que la requête est ouverte et non vide
  if not FDQueryCliinfocompl.Active or FDQueryCliinfocompl.IsEmpty then
  begin
    ShowMessage('Aucune information complémentaire à supprimer.');
    Exit;
  end;

  // 2. Demande de confirmation à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer l''information complémentaire sélectionnée ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      // 3. Suppression de la ligne courante
      FDQueryCliinfocompl.Delete;

      // 4. Rafraîchissement pour synchroniser avec la base
      FDQueryCliinfocompl.Refresh;
    except
      on E: Exception do
      begin
        ShowMessage('Erreur lors de la suppression : ' + E.Message);
        FDQueryCliinfocompl.CancelUpdates; // Annule la modification locale en cas d'échec
      end;
    end;
  end;
end;


procedure TFormFicheClient.BtnSupprimerTarifcliClick(Sender: TObject);
begin

  // 1. On vérifie d'abord si la table n'est pas vide pour éviter une erreur
  if FDQueryTarifcli.IsEmpty then
  begin
    ShowMessage('Aucun tarif article sélectionné à supprimer.');
    Exit;
  end;

  // 2. On demande une confirmation de sécurité à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer le tarif article sélectionné ?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      // 3. On supprime l'enregistrement actuellement sélectionné dans la grille
      FDQueryTarifcli.Delete;

      // Note : Si vous utilisez les "Cached Updates" (mises à jour différées) sur votre FDQuery,
      // décommentez la ligne suivante pour appliquer immédiatement la modification en base de données :
      // FDQueryTarifcli.ApplyUpdates(0);

      ShowMessage('Le tarif article a été supprimé avec succès.');
    except
      on E: Exception do
        MessageDlg('Erreur lors de la suppression du tarif article: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;

end;



procedure TFormFicheClient.BtnValiderClick(Sender: TObject);
var
  ReqVerification: TFDQuery;
begin
  // ==========================================
  // 1. CONTRÔLES COMMUNS (AJOUT ET MODIFICATION)
  // ==========================================

  if Trim(DBcodcli.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un numéro client.');
    if DBcodcli.CanFocus then
     DBcodcli.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxRepres.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un représentant.');
    if DBLookupComboBoxRepres.CanFocus then
    DBLookupComboBoxRepres.SetFocus; // Petit détail : redonner le focus au bon composant
    Exit;
  end;

  if Trim(DBLookupComboBoxGeo.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver la zone géographique.');
    if DBLookupComboBoxGeo.CanFocus then
      DBLookupComboBoxGeo.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxPaiement.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver le mode de paiement par défaut.');
    if DBLookupComboBoxPaiement.CanFocus then
        DBLookupComboBoxPaiement.SetFocus;
    Exit;
  end;

  // ==========================================
  // 2. CONTRÔLE D'UNICITÉ (UNIQUEMENT EN AJOUT)
  // ==========================================

  if ModeSaisie = msAjout then
  begin
    ReqVerification := DMGesCloud.CreerRequeteTemp;
    try
      if DMGesCloud.ExisteEnregistrement('client', ['CODCLI'], [DBcodcli.Field.AsString], ReqVerification) then
      begin
        ShowMessage('Ce code client existe déjà !');
        if DBcodcli.CanFocus then
          DBcodcli.SetFocus;
        Exit; // On bloque ici, la fiche ne se ferme pas
      end;
    finally
      DMGesCloud.LibererRequeteTemp(ReqVerification);
    end;
  end;

  // --- 2. LA TENTATIVE D'ENREGISTREMENT SÉCURISÉE ---
  try
    // On force l'enregistrement dans le Dataset (ce qui va déclencher le BeforePost du DataModule)
    DMGescloud.ReqClients.Post;

    // SI TOUT S'EST BIEN PASSÉ :
    // On ferme la fiche par code en renvoyant mrOk à la fenêtre parente
    Self.ModalResult := mrOk;

  except
    on E: Exception do
    begin
      // SI LE BEFOREPOST (OU LA BDD) LEVE UNE ERREUR :
      MessageDlg('Validation impossible :'#13#10 + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;


procedure TFormFicheClient.ComboTarifKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LComboBox: TDBLookupComboBox;
begin
  if (Key = VK_DELETE) or (Key = VK_BACK) then
  begin
    if Sender is TDBLookupComboBox then
    begin
      LComboBox := TDBLookupComboBox(Sender);

      // On vérifie que le composant est bien relié à une table de données
      if (LComboBox.DataSource <> nil) and (LComboBox.DataSource.DataSet <> nil) then
      begin
        // 1. On force le mode Édition si ce n'est pas déjà fait
        if not (LComboBox.DataSource.DataSet.State in [dsEdit, dsInsert]) then
          LComboBox.DataSource.DataSet.Edit;

        // 2. FORCE LA VALEUR À VIDE DIRECTEMENT DANS LE CHAMP DE LA BASE
        LComboBox.DataSource.DataSet.FieldByName(LComboBox.DataField).Clear;

        // 3. On efface l'affichage à l'écran pour que l'utilisateur voie que c'est vide
        LComboBox.KeyValue := Null;

        // 4. On dit à Delphi que la touche a été traitée
        Key := 0;
      end;
    end;
  end;
end;


//Pour disable le bouton supprimer si grid vide
procedure TFormFicheClient.FDQueryCliinfocomplAfterOpen(DataSet: TDataSet);
begin
  btnSupprimerInfo.Enabled := not DataSet.IsEmpty;
end;


//Pour afficher l'heure au bon format dans la facture appelee
procedure TFormFicheClient.FDQueryEntvteaaHEUREGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  SecTotales: Double;
  HeureTime: TDateTime;
begin
  if not Sender.IsNull then
  begin
    SecTotales := Sender.AsFloat;
    HeureTime := (SecTotales / 86400.0);
    Text := FormatDateTime('hh:nn:ss', HeureTime);
  end
  else
    Text := '';
end;

procedure TFormFicheClient.FormCreate(Sender: TObject);
begin
  TrierOrdreTabulation(Self);
end;


procedure TFormFicheClient.FormShow(Sender: TObject);
begin
  // 1. Désactivation du champ code en mode modification
  DBcodcli.ReadOnly := (ModeSaisie = msModification);

  // --- AFFECTATION AUTOMATIQUE DU PROCHAIN NUMÉRO EN MODE CRÉATION ---
  if ModeSaisie = msAjout then
  begin
    // Si la requête est déjà en mode insertion (Append/Insert)
    if DMGesCloud.ReqClients.State in [dsInsert] then
    begin
      // On affecte le numéro automatique calculé par le DataModule
      DMGesCloud.ReqClients.FieldByName('CODCLI').AsInteger := DMGesCloud.GetProchainCodCli;

      // On donne directement le focus au champ Nom (DBEdit2)
      // pour que l'utilisateur n'ait pas à retaper le numéro

      DBCheckBoxFerme.Checked := false;
      DBCheckBoxFinMois.Checked := false;
      DBCheckBoxAppTarifcli.Checked := false;
     end;
  end;

  DBEdit3.SetFocus;

  // On force le rafraîchissement de la liste des paiements à l'ouverture de la fiche
  DMGesCloud.ReqPaiement.Close;
  DMGesCloud.ReqPaiement.Open;

  DMGesCloud.ReqGeo.Close;
  DMGesCloud.ReqGeo.Open;

  DMGesCloud.ReqRepres.Close;
  DMGesCloud.ReqRepres.Open;

  DMGesCloud.ReqTarif.Close;
  DMGesCloud.ReqTarif.Open;

  FDQueryTarifcli.Close;
  FDQueryTarifcli.Open;

  FDQueryEntvteaa.Close;
  FDQueryEntvteaa.Open;

  FDQueryTresor.Close;
  FDQueryTresor.Open;

  FDQueryEnt_prof.Close;
  FDQueryEnt_prof.Open;

  FDQueryStatis.Close;
  FDQueryStatis.Open;

  FDQueryCliinfocompl.Close;
  FDQueryCliinfocompl.Open;

  // ... le reste de votre code existant au démarrage ...
  // 1. On définit le choix par défaut sur "Aucune" (Index 3)
  rgFiltreEcritures.ItemIndex := 3;
    // 2. On appelle explicitement l'événement OnClick pour appliquer le filtre
  rgFiltreEcrituresClick(rgFiltreEcritures);

end;


procedure TFormFicheClient.DBEditPrc_remiseExit(Sender: TObject);
var
  Valeur: Double;
begin
  // Si le champ n'est pas vide
  if Trim(DBEditPrc_remise.Text) <> '' then
  begin
    Valeur := StrToFloatDef(DBEditPrc_remise.Text, 0);

    // Vérification des bornes (ex: entre 0 et 100)
    if (Valeur < 0) or (Valeur > 100) then
    begin
      ShowMessage('La valeur doit être comprise entre 0 et 100.');
      DBEditPrc_remise.SetFocus; // On replace le curseur dans le champ
    end;
  end;
end;


procedure TFormFicheClient.DBGridTresorTitleClick(Column: TColumn);
var
  NomChamp: string;
begin
  NomChamp := Column.FieldName;

  // On inverse le sens si la colonne est déjà triée en A-Z
  if FDQueryTresor.IndexFieldNames = NomChamp then
    FDQueryTresor.IndexFieldNames := NomChamp + ':D' // :D = Descending dans FireDAC
  else
    FDQueryTresor.IndexFieldNames := NomChamp; // Tri ascendant par défaut
end;




procedure TFormFicheClient.JvDBGridEntvteaaTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEntvteaa.IndexFieldNames = Field.FieldName then
      FDQueryEntvteaa.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEntvteaa.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;



procedure TFormFicheClient.JvDBGridEnt_profTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEnt_prof.IndexFieldNames = Field.FieldName then
      FDQueryEnt_prof.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEnt_prof.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFormFicheClient.JvDBGridStatisTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryStatis.IndexFieldNames = Field.FieldName then
      FDQueryStatis.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryStatis.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;


procedure TFormFicheClient.JvDBGridTresorTitleBtnClick(Sender: TObject;
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

procedure TFormFicheClient.rgFiltreEcrituresClick(Sender: TObject);
begin

  FDQueryTresor.DisableControls; // Évite les clignotements à l'écran
  try
    case rgFiltreEcritures.ItemIndex of
      0: // Toutes
        begin
          FDQueryTresor.Filter := '';
          FDQueryTresor.Filtered := False;
        end;

      1: // Non soldées (Exemple: DEBIT <> CREDIT ou champ SOLDE <> 0)
        begin
          FDQueryTresor.Filter := 'SOLDE=0'; // Adaptez selon le champ de votre table
          FDQueryTresor.Filtered := True;
        end;

      2: // Soldées
        begin
          FDQueryTresor.Filter := 'SOLDE=1'; // Adaptez selon la logique de lettrage/solde
          FDQueryTresor.Filtered := True;
        end;

      3: // Aucune
        begin
          FDQueryTresor.Filter := '1 = 0'; // Masque toutes les lignes
          FDQueryTresor.Filtered := True;
        end;
    end;
  finally
    FDQueryTresor.EnableControls;
  end;

  CalculerSolde;

end;


procedure TFormFicheClient.TrierOrdreTabulation(ParentControl: TWinControl);
var
  I, J: Integer;
  TempList: TList<TControl>;
  Control: TControl;
begin
  TempList := TList<TControl>.Create;
  try
    // 1. On liste tous les contrôles enfants qui acceptent le focus (Tabstop)
    for I := 0 to ParentControl.ControlCount - 1 do
    begin
      Control := ParentControl.Controls[I];
      if (Control is TWinControl) and TWinControl(Control).TabStop then
        TempList.Add(Control);
    end;

    // 2. Tri personnalisé : d'abord de haut en bas (Top), puis de gauche à droite (Left)
    TempList.Sort(TComparer<TControl>.Construct(
      function(const Left, Right: TControl): Integer
      begin
        // On compare d'abord la hauteur (Top) avec une marge de tolérance (ex: 5 pixels)
        // pour les champs qui ne sont pas parfaitement alignés au pixel près
        if Abs(Left.Top - Right.Top) > 5 then
          Result := Left.Top - Right.Top
        else
          // Si ils sont sur la même "ligne", on trie de gauche à droite
          Result := Left.Left - Right.Left;
      end
    ));

    // 3. On applique le nouvel ordre de tabulation (TabOrder)
    for J := 0 to TempList.Count - 1 do
      TWinControl(TempList[J]).TabOrder := J;

    // 4. Récursion pour les conteneurs enfants (ex: Panels, GroupBox)
    for I := 0 to ParentControl.ControlCount - 1 do
    begin
      if ParentControl.Controls[I] is TWinControl then
        TrierOrdreTabulation(TWinControl(ParentControl.Controls[I]));
    end;
  finally
    TempList.Free;
  end;
end;


procedure TFormFicheClient.CalculerSolde;
var
  TotalDebit, TotalCredit: Currency;
  bm: TBookmark;
begin
  TotalDebit := 0;
  TotalCredit := 0;

  FDQueryTresor.DisableControls;
  bm := FDQueryTresor.GetBookmark; // Sauvegarde la position courante
  try
    FDQueryTresor.First;
    while not FDQueryTresor.Eof do
    begin
      TotalDebit := TotalDebit + FDQueryTresor.FieldByName('DEBIT').AsCurrency;
      TotalCredit := TotalCredit + FDQueryTresor.FieldByName('CREDIT').AsCurrency;
      FDQueryTresor.Next;
    end;

    // Affichage des totaux de colonnes
    LblTotalDebit.Caption := FormatFloat('#,##0', TotalDebit);
    LblTotalCredit.Caption := FormatFloat('#,##0', TotalCredit);

    // Affichage dans un Edit ou Label dédié au Solde
    // Affichage dans le Label dédié au Solde
     if TotalDebit - TotalCredit>0 then
       TLabelSolde.Caption := FormatFloat('#,##0 DB', TotalDebit - TotalCredit)
     else
       TLabelSolde.Caption := FormatFloat('#,##0 CR', TotalCredit - TotalDebit);

     if TotalDebit - TotalCredit=0 then
       TLabelSolde.Caption := '0';


  finally
    if FDQueryTresor.BookmarkValid(bm) then
      FDQueryTresor.GotoBookmark(bm);
    FDQueryTresor.FreeBookmark(bm);
    FDQueryTresor.EnableControls;
  end;
end;

end.
