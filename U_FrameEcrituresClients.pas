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
  private
    procedure AppliquerFiltreMaitre;
    procedure CalculerSolde;
    procedure CalculerSelection;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_FicheClient, U_OutilsGrille, U_FormAide, U_FicheTresor;

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
    FormFicheTresor.FDQueryTresor.ParamByName('CODCLI').AsInteger := FDQueryClients.FieldByName('CODCLI').AsInteger;
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

procedure TFrameEcrituresClients.BtnModifierClick(Sender: TObject);
var
  NumEnr: Integer;
begin
  if FDQueryTresor.IsEmpty then Exit;

  NumEnr := FDQueryTresor.FieldByName('NOENR').AsInteger;

  // 1. Il faut d'abord créer la fiche en mémoire !
  FormFicheTresor := TFormFicheTresor.Create(Self);
  try
    // On passe le NOENR en paramètre à la requête de la fiche
    FormFicheTresor.FDQueryTresor.ParamByName('NOENR').AsInteger := NumEnr;
    FormFicheTresor.FDQueryTresor.ParamByName('CODCLI').AsInteger := FDQueryClients.FieldByName('CODCLI').AsInteger;
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

procedure TFrameEcrituresClients.EdtCherche_CPTAUXChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryClients);
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
begin

  FDQueryTresor.DisableControls; // Évite les clignotements à l'écran
  try
    case rgFiltreEcritures.ItemIndex of
      0: // Toutes
        begin
          FDQueryTresor.Filter := '';
          FDQueryTresor.Filtered := False;
          BtnAjouter.Enabled:=False;
          BtnModifier.Enabled:=False;
          BtnSupprimer.Enabled:=False;
        end;

      1: // Non soldées (Exemple: DEBIT <> CREDIT ou champ SOLDE <> 0)
        begin
          FDQueryTresor.Filter := 'SOLDE=0'; // Adaptez selon le champ de votre table
          FDQueryTresor.Filtered := True;
          BtnAjouter.Enabled:=True;
          BtnModifier.Enabled:=True;
          BtnSupprimer.Enabled:=True;
        end;

      2: // Soldées
        begin
          FDQueryTresor.Filter := 'SOLDE=1'; // Adaptez selon la logique de lettrage/solde
          FDQueryTresor.Filtered := True;
          BtnAjouter.Enabled:=False;
          BtnModifier.Enabled:=False;
          BtnSupprimer.Enabled:=False;
        end;

      3: // Aucune
        begin
          FDQueryTresor.Filter := '1 = 0'; // Masque toutes les lignes
          FDQueryTresor.Filtered := True;
          BtnAjouter.Enabled:=False;
          BtnModifier.Enabled:=False;
          BtnSupprimer.Enabled:=False;
        end;
    end;
  finally
    FDQueryTresor.EnableControls;
  end;

  CalculerSolde;

end;

procedure TFrameEcrituresClients.CalculerSolde;
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
    LblTotalDebit.Caption := FormatFloat('#,##0 DB', TotalDebit);
    LblTotalCredit.Caption := FormatFloat('#,##0 CR', TotalCredit);

    // Affichage dans un Edit ou Label dédié au Solde
    // Affichage dans le Label dédié au Solde
     if TotalDebit - TotalCredit>0 then
       TLabelSolde.Caption := FormatFloat('#,##0 DB', TotalDebit - TotalCredit)
     else
       TLabelSolde.Caption := FormatFloat('#,##0 CR', TotalCredit - TotalDebit);

     if TotalDebit - TotalCredit=0 then
       TLabelSolde.Caption := '0';

     LettrageCR.Caption:='0';
     LettrageDB.Caption:='0';
     LettrageSolde.Caption:='0';



  finally
    if FDQueryTresor.BookmarkValid(bm) then
      FDQueryTresor.GotoBookmark(bm);
    FDQueryTresor.FreeBookmark(bm);
    FDQueryTresor.EnableControls;
  end;
end;

procedure TFrameEcrituresClients.CalculerSelection;
var
  i: Integer;
  TotalDebit, TotalCredit, Solde: Double;
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
        TotalDebit := TotalDebit + FDQueryTresor.FieldByName('DEBIT').AsFloat;
        TotalCredit := TotalCredit + FDQueryTresor.FieldByName('CREDIT').AsFloat;
      end;
    finally
      FDQueryTresor.EnableControls;
    end;
  end;

  // Calcul du solde
  //Solde := TotalCredit - TotalDebit;

  // Affichage dans tes labels (adapte les noms si besoin)
  LettrageDB.Caption  := FormatFloat('#,##0', TotalDebit) + ' DB';
  LettrageCR.Caption := FormatFloat('#,##0', TotalCredit) + ' CR';
  //TLabelSolde.Caption       := Format('%.2f', [Solde]);

     if TotalDebit - TotalCredit>0 then
       LettrageSolde.Caption := FormatFloat('#,##0 DB', TotalDebit - TotalCredit)
     else
       LettrageSolde.Caption := FormatFloat('#,##0 CR', TotalCredit - TotalDebit);

     if TotalDebit - TotalCredit=0 then
       LettrageSolde.Caption := '0';
end;

end.
