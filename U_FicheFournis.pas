unit U_FicheFournis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RzPanel, RzRadGrp, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TFormFicheFournis = class(TForm)
    Label1: TLabel;
    DBcodfou: TDBEdit;
    DSFournis: TDataSource;
    DBEditNom: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    BtnAide: TBitBtn;
    DBLookupComboBoxDevise: TDBLookupComboBox;
    FDQueryParameDevise: TFDQuery;
    DSParame: TDataSource;
    DBCheckBoxFinMois: TDBCheckBox;
    FDQueryStatis: TFDQuery;
    DSStatis: TDataSource;
    rgFiltreEcritures: TRzRadioGroup;
    Label2: TLabel;
    Onglet: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    FDQueryEcr_fou: TFDQuery;
    DSEcr_fou: TDataSource;
    JvDBGrid2: TJvDBGrid;
    LblTotalCredit: TLabel;
    LblTotalDebit: TLabel;
    TLabelSolde: TLabel;
    Label26: TLabel;
    procedure BtnValiderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgFiltreEcrituresClick(Sender: TObject);
    procedure JvDBGrid2TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnAideClick(Sender: TObject);
  private
    procedure CalculerSolde;
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification);
  end;

var
  FormFicheFournis: TFormFicheFournis;

implementation

uses U_TableFournis, U_FormAide, U_DataModule, U_DM_Olivier;

{$R *.dfm}


procedure TFormFicheFournis.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('fournisseur.html');
end;

procedure TFormFicheFournis.BtnValiderClick(Sender: TObject);
var
  ReqVerification: TFDQuery;
begin
  // ==========================================
  // 1. CONTRÔLES COMMUNS (AJOUT ET MODIFICATION)
  // ==========================================

  if Trim(DBcodfou.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un code fournisseur.');
    if DBcodfou.CanFocus then
      DBcodfou.SetFocus;  //DBcodfou.SetFocus;
      //ActiveControl := DBcodfou;
    Exit;
  end;

    if Trim(DBLookupComboBoxDevise.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver le code devise par défaut.');
    if DBLookupComboBoxDevise.CanFocus then
    //ActiveControl := DBLookupComboBoxDevise;  //DBLookupComboBoxDevise.SetFocus;
    DBLookupComboBoxDevise.SetFocus;
    Exit;
  end;

  // ==========================================
  // 2. CONTRÔLE D'UNICITÉ (UNIQUEMENT EN AJOUT)
  // ==========================================

  if ModeSaisie = msAjout then
  begin
    ReqVerification := DMGesCloud.CreerRequeteTemp;
    try
      if DMGesCloud.ExisteEnregistrement('fournis', ['CODFOU'], [DBcodfou.Field.AsString], ReqVerification) then
      begin
        ShowMessage('Ce code fournisseur existe déjà !');
        if DBcodfou.CanFocus then
        DBcodfou.SetFocus;  //DBcodfou.SetFocus;
        //ActiveControl := DBcodfou;
        Exit; // On bloque ici, la fiche ne se ferme pas
      end;
    finally
      DMGesCloud.LibererRequeteTemp(ReqVerification);
    end;
  end;

  // --- 2. LA TENTATIVE D'ENREGISTREMENT SÉCURISÉE ---
  try
    // On force l'enregistrement dans le Dataset (ce qui va déclencher le BeforePost du DataModule)
    DM_Olivier.FDQueryFournis.Post;

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

procedure TFormFicheFournis.FormShow(Sender: TObject);
begin
  // 1. Désactivation du champ code en mode modification
  DBcodfou.ReadOnly := (ModeSaisie = msModification);

  if ModeSaisie = msAjout then
  begin
    if DM_Olivier.FDQueryFournis.State in [dsInsert] then
    begin
      DBCheckBoxFinMois.Checked := False;
    end;
  end;

  DBEditNom.SetFocus;

  // On force le rafraîchissement de la liste des paiements à l'ouverture de la fiche
  FDQueryParameDevise.Close;
  FDQueryParameDevise.Open;

  FDQueryStatis.Close;
  FDQueryStatis.Open;

  FDQueryEcr_fou.Close;
  FDQueryEcr_fou.Open;

  // ... le reste de votre code existant au démarrage ...
  // 1. On définit le choix par défaut sur "Aucune" (Index 3)
  rgFiltreEcritures.ItemIndex := 3;
    // 2. On appelle explicitement l'événement OnClick pour appliquer le filtre
  rgFiltreEcrituresClick(rgFiltreEcritures);

end;

procedure TFormFicheFournis.JvDBGrid1TitleBtnClick(Sender: TObject;
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

procedure TFormFicheFournis.JvDBGrid2TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEcr_fou.IndexFieldNames = Field.FieldName then
      FDQueryEcr_fou.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEcr_fou.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFormFicheFournis.rgFiltreEcrituresClick(Sender: TObject);
begin

  FDQueryEcr_fou.DisableControls; // Évite les clignotements à l'écran
  try
    case rgFiltreEcritures.ItemIndex of
      0: // Toutes
        begin
          FDQueryEcr_fou.Filter := '';
          FDQueryEcr_fou.Filtered := False;
        end;

      1: // Non soldées (Exemple: DEBIT <> CREDIT ou champ SOLDE <> 0)
        begin
          FDQueryEcr_fou.Filter := 'SOLDE=0'; // Adaptez selon le champ de votre table
          FDQueryEcr_fou.Filtered := True;
        end;

      2: // Soldées
        begin
          FDQueryEcr_fou.Filter := 'SOLDE=1'; // Adaptez selon la logique de lettrage/solde
          FDQueryEcr_fou.Filtered := True;
        end;

      3: // Aucune
        begin
          FDQueryEcr_fou.Filter := '1 = 0'; // Masque toutes les lignes
          FDQueryEcr_fou.Filtered := True;
        end;
    end;
  finally
    FDQueryEcr_fou.EnableControls;
  end;

  CalculerSolde;
end;

procedure TFormFicheFournis.CalculerSolde;
var
  TotalDebit, TotalCredit: Currency;
  bm: TBookmark;
begin
  TotalDebit := 0;
  TotalCredit := 0;

  FDQueryEcr_fou.DisableControls;
  bm := FDQueryEcr_fou.GetBookmark; // Sauvegarde la position courante
  try
    FDQueryEcr_fou.First;
    while not FDQueryEcr_fou.Eof do
    begin
      TotalDebit := TotalDebit + FDQueryEcr_fou.FieldByName('DEBIT').AsCurrency;
      TotalCredit := TotalCredit + FDQueryEcr_fou.FieldByName('CREDIT').AsCurrency;
      FDQueryEcr_fou.Next;
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
    if FDQueryEcr_fou.BookmarkValid(bm) then
      FDQueryEcr_fou.GotoBookmark(bm);
    FDQueryEcr_fou.FreeBookmark(bm);
    FDQueryEcr_fou.EnableControls;
  end;
end;

end.
