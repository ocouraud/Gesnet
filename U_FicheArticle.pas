unit U_FicheArticle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  RzPanel, RzRadGrp, JvExDBGrids, JvDBGrid, System.UITypes, RLReport, RLBarcode;
type
  TFormFicheArticle = class(TForm)
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    BtnAide: TBitBtn;
    Label1: TLabel;
    DBCodart: TDBEdit;
    DSArticle: TDataSource;
    Label2: TLabel;
    DBLibelle: TDBEdit;
    DBCheckBoxFerme: TDBCheckBox;
    FDQueryTVA: TFDQuery;
    DSTVA: TDataSource;
    DBLookupComboBoxTVA: TDBLookupComboBox;
    Label4: TLabel;
    DBLibcourt: TDBEdit;
    DBCheckBoxNonTVAIles: TDBCheckBox;
    PageControl1: TPageControl;
    TabSheetGral: TTabSheet;
    FDQueryDepart: TFDQuery;
    DSDepart: TDataSource;
    DBLookupComboBoxDepart: TDBLookupComboBox;
    Label5: TLabel;
    Label3: TLabel;
    DBLookupComboBoxFamille: TDBLookupComboBox;
    FDQueryFamille: TFDQuery;
    DSFamille: TDataSource;
    Label6: TLabel;
    FDQuerySousFam: TFDQuery;
    DSSousfam: TDataSource;
    DBLookupComboBoxSF: TDBLookupComboBox;
    Label7: TLabel;
    FDQueryFournis: TFDQuery;
    DSFournis: TDataSource;
    DBLookupComboBoxFournis: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    FDQueryActivite: TFDQuery;
    DSActivite: TDataSource;
    DBLookupComboBoxActivite: TDBLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Panel2: TPanel;
    DBGridStodep: TDBGrid;
    FDQueryStodep: TFDQuery;
    DSStodep: TDataSource;
    DBCheckBoxG_Sto: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    DBEdit9: TDBEdit;
    Label19: TLabel;
    DBPMP: TDBEdit;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    EditPrc_marge: TEdit;
    Label21: TLabel;
    EditTx_marque: TEdit;
    Label22: TLabel;
    EditMarge: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBPrixvte: TDBEdit;
    Label25: TLabel;
    DBEdit10: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    Label26: TLabel;
    DBEdit12: TDBEdit;
    EditPRIXTTC: TEdit;
    Label27: TLabel;
    TabSheetStock: TTabSheet;
    JvDBGridStock: TJvDBGrid;
    FDQueryStock: TFDQuery;
    FDQueryStockCODART: TStringField;
    FDQueryStockDATE_: TDateField;
    FDQueryStockANNEE: TIntegerField;
    FDQueryStockMOIS: TSmallintField;
    FDQueryStockTYPE_: TStringField;
    FDQueryStockQTE: TBCDField;
    FDQueryStockUNIT: TSmallintField;
    FDQueryStockVALUNIT: TBCDField;
    FDQueryStockPRIXVTE: TBCDField;
    FDQueryStockPRIXVTE_UNIT: TIntegerField;
    FDQueryStockCODDEP: TShortintField;
    FDQueryStockCENTRA: TStringField;
    FDQueryStockLIBELLE: TStringField;
    FDQueryStockCODFOU: TStringField;
    FDQueryStockNOENR: TFDAutoIncField;
    FDQueryStockPOIDS: TBCDField;
    FDQueryStockDER_MODIF: TSQLTimeStampField;
    FDQueryStockTIME: TLargeintField;
    FDQueryStockCODFAC: TLargeintField;
    DStock: TDataSource;
    Panel3: TPanel;
    BtnNewStock: TButton;
    BtnSupprimer: TButton;
    BtnTransfert: TButton;
    Label28: TLabel;
    TabSheetTarifs: TTabSheet;
    FDQueryTarifart: TFDQuery;
    DSTarifart: TDataSource;
    JvDBGridTarifart: TJvDBGrid;
    FDQueryPromo: TFDQuery;
    DSPromo: TDataSource;
    JvDBGridPromo: TJvDBGrid;
    FDQueryTarifartCODTAR: TStringField;
    FDQueryTarifartCODART: TStringField;
    FDQueryTarifartPRIXHT: TBCDField;
    FDQueryTarifartCOM_PR: TBCDField;
    FDQueryTarifartDER_MODIF: TSQLTimeStampField;
    BtnSuprPromo: TBitBtn;
    BtnSuprTarifart: TBitBtn;
    FDQueryTarifartcodtar_tarif: TStringField;
    FDQueryCodbar: TFDQuery;
    DSCodbar: TDataSource;
    TabSheetCodbar: TTabSheet;
    JvDBGridCodbar: TJvDBGrid;
    FDQueryCodbarCODBAR: TStringField;
    FDQueryCodbarCODART: TStringField;
    FDQueryCodbarTYPE: TStringField;
    FDQueryCodbarPRIXVTE: TIntegerField;
    FDQueryCodbarDER_MODIF: TSQLTimeStampField;
    BtnSupprCodbar: TBitBtn;
    BtnGenCodbar: TBitBtn;
    TabSheetCA: TTabSheet;
    FDQueryCa_art: TFDQuery;
    DSCa_art: TDataSource;
    JvDBGridCa_art: TJvDBGrid;
    TabSheetLigvteaa: TTabSheet;
    FDQueryLigvteaa: TFDQuery;
    DSLigvteaa: TDataSource;
    JvDBGridLigvteaa: TJvDBGrid;
    TabSheetDevis: TTabSheet;
    FDQueryLig_prof: TFDQuery;
    DSLig_prof: TDataSource;
    JvDBGridLig_prof: TJvDBGrid;
    BtnConsulterFacture: TSpeedButton;
    BtnImprimerFacture: TSpeedButton;
    SBConsultDevis: TSpeedButton;
    SBImpDevis: TSpeedButton;
    TabSheetCommandes: TTabSheet;
    JvDBGridLigcde: TJvDBGrid;
    FDQueryLigcde: TFDQuery;
    DSLigcde: TDataSource;
    EditDerPxRev: TEdit;
    Label29: TLabel;
    EditCoefPR: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    EditQteCdeEnCours: TEdit;
    TabSheetAchats: TTabSheet;
    JvDBGridAchats: TJvDBGrid;
    FDQueryLigachjj: TFDQuery;
    DSLigachjj: TDataSource;
    TabSheetInfocompl: TTabSheet;
    JvDBGridArtinfocompl: TJvDBGrid;
    FDQueryArtinfocompl: TFDQuery;
    DSArtinfocompl: TDataSource;
    BtnSupprimerInfo: TBitBtn;
    BtnAjouterInfo: TBitBtn;
    TabSheetImage: TTabSheet;
    Label32: TLabel;
    DBImage: TDBEdit;
    ImageLogo: TImage;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ImageCB: TImage;
    procedure BtnAideClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDQueryStodepNewRecord(DataSet: TDataSet);
    procedure FDQueryStodepBeforePost(DataSet: TDataSet);
    procedure DBCheckBoxG_StoClick(Sender: TObject);
    procedure DBPrixvteExit(Sender: TObject);
    procedure EditPrc_margeExit(Sender: TObject);
    procedure EditTx_marqueExit(Sender: TObject);
    procedure EditPRIXTTCExit(Sender: TObject);
    procedure DBGridStodepCellClick(Column: TColumn);
    procedure BtnNewStockClick(Sender: TObject);
    procedure JvDBGridStockTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure FDQueryStockAfterScroll(DataSet: TDataSet);
    procedure BtnTransfertClick(Sender: TObject);
    procedure FDQueryTarifartCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryPromoNewRecord(DataSet: TDataSet);
    procedure FDQueryPromoBeforePost(DataSet: TDataSet);
    procedure BtnSuprPromoClick(Sender: TObject);
    procedure BtnSuprTarifartClick(Sender: TObject);
    procedure FDQueryCodbarImpfactValidate(Sender: TField);
    procedure JvDBGridCodbarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGridCodbarCellClick(Column: TColumn);
    procedure BtnSupprCodbarClick(Sender: TObject);
    procedure BtnGenCodbarClick(Sender: TObject);
    procedure JvDBGridLigvteaaTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnConsulterFactureClick(Sender: TObject);
    procedure BtnImprimerFactureClick(Sender: TObject);
    procedure SBConsultDevisClick(Sender: TObject);
    procedure JvDBGridLig_profTitleBtnDblClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure SBImpDevisClick(Sender: TObject);
    procedure BtnSupprimerInfoClick(Sender: TObject);
    procedure BtnAjouterInfoClick(Sender: TObject);
    procedure DBImageChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FDQueryCodbarAfterScroll(DataSet: TDataSet);
  private
    FDernierCheminLogo: string;
    FCalculEnCours: Boolean;
    procedure ActualiserVisibilitePMP;
    procedure CalculerDepuisMarge;
    procedure CalculerDepuisPrixVente;
    procedure CalculerDepuisTxMarque;
    procedure CalculerPrixTTC;
    procedure CalculerDepuisTTC;
    procedure RaffraichirStockFiche(const CodeArt: string;
      const CodeDep: Integer);
    procedure ChargerApercuLogo;
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification); // <-- CA DOIT ÊTRE ICI !
  end;

var
  FormFicheArticle: TFormFicheArticle;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier, System.Generics.Collections, System.Generics.Defaults,
  U_ReportFactureAA, U_FicheFacture, U_FormAide, U_SelCodInfoCompl, U_FicheStock,
  U_FicheStockTransfert, U_FicheDevis, U_ReportDevisAA, BarcodeEAN13;

procedure TFormFicheArticle.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('article.html');
end;

procedure TFormFicheArticle.BtnAjouterInfoClick(Sender: TObject);
var
  LIdInfo: SmallInt;
  LCodInfo: string;
  LCodart: string;
begin
  LCodart := DBCodart.text;
  if LCodart = '' then
  begin
    ShowMessage('Veuillez d''abord sélectionner un article.');
    Exit;
  end;

  if TFormSelCodInfoCompl.SelectionnerArt('A',LCodart, LIdInfo, LCodInfo) then
  begin
    // Vérification si la combinaison existe déjà dans le DataSet actuel
    if FDQueryArtinfocompl.Locate('id;codinfo', VarArrayOf([LIdInfo, LCodInfo]), []) then
    begin
      ShowMessage('Cette information complémentaire est déjà attribuée à cet article.');
      Exit;
    end;

    // Si elle n'existe pas, on insère
    FDQueryArtinfocompl.Append;
    FDQueryArtinfocompl.FieldByName('id').AsInteger := LIdInfo;
    FDQueryArtinfocompl.FieldByName('CODART').AsString := LCodart;
    FDQueryArtinfocompl.FieldByName('codinfo').AsString := LCodInfo;
    FDQueryArtinfocompl.Post;

    FDQueryArtinfocompl.Refresh;
  end;
end;

procedure TFormFicheArticle.BtnConsulterFactureClick(Sender: TObject);
var
  NumFacture: Integer; // ou Int64 selon la taille de votre numérique
  FormFicheFacture: TFormFicheFacture; // <-- On déclare la variable de la fiche
begin
  NumFacture := FDQueryLigvteaa.FieldByName('CODFAC').AsInteger; // ou le nom exact de votre champ dans la ligne

  // 1. On charge la facture dans le DataModule
  DMGesCloud.FDQueryPrintEntvteaa.Close;
//  DMGesCloud.FDQueryPrintEntvteaa.SQL.Text := 'SELECT * FROM entvteaa WHERE CODFAC = :codfac';
  DMGesCloud.FDQueryPrintEntvteaa.Params[0].AsInteger := NumFacture; // Utilisation de .AsInteger pour un champ numérique
  DMGesCloud.FDQueryPrintEntvteaa.Open;

  FormFicheFacture := TFormFicheFacture.Create(Self);
  FormFicheFacture.Caption := 'Consultation Facture N° ' + FDQueryLigvteaa.FieldByName('CODFAC').AsString;

try
    FormFicheFacture.ShowModal;
  finally
    FormFicheFacture.Free;
  end;
end;


procedure TFormFicheArticle.BtnGenCodbarClick(Sender: TObject);
var
  QueryCtr: TFDQuery;
  NouveauCode: string;
  ValeurActuelle: Int64;
begin
  QueryCtr := TFDQuery.Create(nil);
  try
    // 1. Récupération du compteur actuel
    QueryCtr.Connection := DMGesCloud.ConnexionGesCloud;
    QueryCtr.SQL.Text := 'SELECT Cpt_BAR FROM ctrstock WHERE CODSOC = :codsoc';
    QueryCtr.Params[0].AsString := 'A';
    QueryCtr.Open;

    if not QueryCtr.IsEmpty then
    begin
      // 2. Conversion en entier et ajout de 10
      ValeurActuelle := StrToInt64Def(QueryCtr.FieldByName('Cpt_BAR').AsString, 0) + 10;

      // 3. Génération du nouveau code-barres EAN-13 en prenant les 12 premiers chiffres formatés
      NouveauCode := DM_Olivier.GetEAN13CheckDigitFrom13(Format('%.12d', [ValeurActuelle]));

      // 4. Insertion dans la table des articles (FDQueryCodbar)
      FDQueryCodbar.Insert;
      FDQueryCodbar.FieldByName('CODBAR').AsString := NouveauCode;
      FDQueryCodbar.Post;

      // 5. Mise à jour de la table des compteurs (ctrstock)
      QueryCtr.Edit;
      QueryCtr.FieldByName('Cpt_BAR').AsString := NouveauCode; // ou stocker la valeur brute incrémentée
      QueryCtr.Post;
    end;

  finally
    QueryCtr.Free;
  end;

  JvDBGridCodbar.Refresh;
end;


procedure TFormFicheArticle.BtnImprimerFactureClick(Sender: TObject);
var
  NumFactureSelectionnee: Integer;
begin
  // 1. On récupère le numéro de la facture sélectionnée dans la grille des factures
  // (Assurez-vous de cibler le bon champ, ici supposé 'CODFAC')
  NumFactureSelectionnee := FDQueryLigvteaa.FieldByName('CODFAC').AsInteger;

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
  DMGesCloud.FDQueryRepres.ParamByName('CODREP').AsInteger := FDQueryLigvteaa.FieldByName('CODREP').AsInteger;
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

procedure TFormFicheArticle.BtnNewStockClick(Sender: TObject);
begin
  // 2. Création et affichage de la fiche de saisie
  FormFicheStock := TFormFicheStock.Create(Self);
  try
    FormFicheStock.DSStock.DataSet := FDQueryStock;

    // Configuration de la fiche
    FormFicheStock.ModeSaisie := U_FicheStock.msAjout;
    FormFicheStock.Caption := 'Nouveau mouvement de stock';

    // Passage en mode insertion
    FDQueryStock.Insert;
    // Pré-remplir les champs correctement
    // On prend la valeur texte du composant (ou directement depuis l'article courant)
    //FDQueryStock.FieldByName('CODART').AsString := DM_Olivier.FDQueryArticle.FieldByName('CODART').AsString;
    //FDQueryStock.FieldByName('CODDEP').AsInteger := FDQueryStodep.FieldByName('CODDEP').AsInteger;
    FDQueryStock.FieldByName('DATE_').AsDateTime := Date;
    FDQueryStock.FieldByName('VALUNIT').AsFloat := FDQueryStodep.FieldByName('PMP').AsFloat;
    //FDQueryStock.FieldByName('PRIXVTE').AsFloat := DM_Olivier.FDQueryArticle.FieldByName('PRIXVTE').AsFloat;
    FDQueryStock.FieldByName('TYPE_').AsString := 'E';
    FDQueryStock.FieldByName('LIBELLE').AsString := 'Entrée en stock';

    // Si l'utilisateur clique sur Valider (et que le .Post interne a réussi) :
    if FormFicheStock.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheStock !
      //On recalcul le stock de l'article
      //DM_Olivier.RecalculerStockPMP(FDQueryStock.FieldByName('CODART').AsString, FDQueryStock.FieldByName('CODDEP').AsInteger);
      // Pour mettre à jour l'affichage de la fiche article
      //DM_Olivier.FDQueryArticle.Refresh;
      // ... placez ici votre bloc de Refresh avec Bookmark si nécessaire,
      // ou simplement le Refresh de votre grille.
      //FDQueryStock.Refresh;
    end
    else
    begin
      // Si l'utilisateur a annulé, on annule l'insertion
      FDQueryStock.Cancel;
    end;
  finally
    // 1. On lance systématiquement le recalcul du stock
    // Appel de la procédure centralisée !
    DM_Olivier.RecalculerStockStodep(DBcodart.Field.AsString, FDQueryStodep.FieldByName('CODDEP').AsInteger);
    RaffraichirStockFiche(DBcodart.Field.AsString, FDQueryStodep.FieldByName('CODDEP').AsInteger);

    FormFicheStock.Free;
  end;
end;


procedure TFormFicheArticle.BtnValiderClick(Sender: TObject);
var
  ReqVerification: TFDQuery;
begin
  // ==========================================
  // 1. CONTRÔLES COMMUNS (AJOUT ET MODIFICATION)
  // ==========================================

  if Trim(DBCodart.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un code article.');
    if DBCodart.CanFocus then
     DBCodart.SetFocus;
    Exit;
  end;

  if Trim(DBLibelle.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver une désignation.');
    if DBLibelle.CanFocus then
     DBLibelle.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxTVA.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver une TVA.');
    if DBLookupComboBoxTVA.CanFocus then
    DBLookupComboBoxTVA.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxDepart.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver le département.');
    if DBLookupComboBoxDepart.CanFocus then
      DBLookupComboBoxDepart.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxFamille.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver la famille.');
    if DBLookupComboBoxFamille.CanFocus then
        DBLookupComboBoxFamille.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxFournis.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver le fournisseur.');
    if DBLookupComboBoxFournis.CanFocus then
        DBLookupComboBoxFournis.SetFocus;
    Exit;
  end;

  if Trim(DBLookupComboBoxSF.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver la sous-famille.');
    if DBLookupComboBoxSF.CanFocus then
        DBLookupComboBoxSF.SetFocus;
    Exit;
  end;

   if Trim(DBLibcourt.Text) = '' then
     DBLibcourt.Text:=DBLibelle.Text;

  // ==========================================
  // 2. CONTRÔLE D'UNICITÉ (UNIQUEMENT EN AJOUT)
  // ==========================================

  if ModeSaisie = msAjout then
  begin
    ReqVerification := DMGesCloud.CreerRequeteTemp;
    try
      if DMGesCloud.ExisteEnregistrement('article', ['CODART'], [DBcodart.Field.AsString], ReqVerification) then
      begin
        ShowMessage('Ce code article existe déjà !');
        if DBcodart.CanFocus then
          DBcodart.SetFocus;
        Exit; // On bloque ici, la fiche ne se ferme pas
      end;
    finally
      DMGesCloud.LibererRequeteTemp(ReqVerification);
    end;
  end;

  // --- 2. LA TENTATIVE D'ENREGISTREMENT SÉCURISÉE ---
  try
    // On force l'enregistrement dans le Dataset (ce qui va déclencher le BeforePost du DataModule)
    DM_Olivier.FDQueryArticle.Post;

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


procedure TFormFicheArticle.BtnTransfertClick(Sender: TObject);
begin
  // 2. Création et affichage de la fiche de saisie
  FormFicheStockTransfert := TFormFicheStockTransfert.Create(Self);
  try
    //FormFicheStockTransfert.DSStock.DataSet := FDQueryStock;

    // Configuration de la fiche
    //FormFicheStockTransfert.ModeSaisie := U_FicheStockTransfert.msAjout;
    FormFicheStockTransfert.Caption := 'Nouveau transfert de stock article '+DBCodart.Text+': '+DBLibelle.text;

    // Si l'utilisateur clique sur Valider (et que le .Post interne a réussi) :
    if FormFicheStockTransfert.ShowModal = mrOk then
    begin
      // Le .Post a DEJA été fait à l'intérieur de FormFicheStockTransfert !
      //On recalcul le stock de l'article
      //DM_Olivier.RecalculerStockPMP(FDQueryStock.FieldByName('CODART').AsString, FDQueryStock.FieldByName('CODDEP').AsInteger);
      // Pour mettre à jour l'affichage de la fiche article
      //DM_Olivier.FDQueryArticle.Refresh;
      // ... placez ici votre bloc de Refresh avec Bookmark si nécessaire,
      // ou simplement le Refresh de votre grille.
      //FDQueryStock.Refresh;
    end
    else
    begin
      // Si l'utilisateur a annulé, on annule l'insertion
      //FDQueryStock.Cancel;
    end;
  finally
    // 1. On lance systématiquement le recalcul du stock
    // Appel de la procédure centralisée !
    DM_Olivier.RecalculerStockArticle(DBcodart.Field.AsString);
    RaffraichirStockFiche(DBcodart.Field.AsString, FDQueryStodep.FieldByName('CODDEP').AsInteger);

    FormFicheStockTransfert.Free;
  end;

end;

procedure TFormFicheArticle.BtnSupprCodbarClick(Sender: TObject);
begin
  if FDQueryCodbar.FieldByName('CODBAR').AsString=FDQueryCodbar.FieldByName('CODART').AsString then
     begin
      ShowMessage('Ce code ne peut pas être supprimé.');
      Exit;
    end;

  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not FDQueryCodbar.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer ce code de facturation ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FDQueryCodbar.Delete;
    end;
  end;

end;

procedure TFormFicheArticle.BtnSupprimerClick(Sender: TObject);
var
  CurrentNoEnr: Integer;
  CurrentCodDep: Integer;
  IsDernier: Boolean;
  QQueryCheck: TFDQuery;
begin
  if FDQueryStock.IsEmpty then
  begin
    ShowMessage('Aucun mouvement sélectionné à supprimer.');
    Exit;
  end;

  CurrentNoEnr := FDQueryStock.FieldByName('NOENR').AsInteger;
  CurrentCodDep := FDQueryStock.FieldByName('CODDEP').AsInteger;

  // Vérification du dernier mouvement POUR CE DÉPÔT
  QQueryCheck := TFDQuery.Create(nil);
  try
    QQueryCheck.Connection := FDQueryStock.Connection;
    QQueryCheck.SQL.Text := 'SELECT MAX(NOENR) AS MAX_NOENR FROM Stock WHERE CODART = :art AND CODDEP = :dep';
    QQueryCheck.ParamByName('art').AsString := FDQueryStock.FieldByName('CODART').AsString;
    QQueryCheck.ParamByName('dep').AsInteger := CurrentCodDep;
    QQueryCheck.Open;

    IsDernier := (QQueryCheck.FieldByName('MAX_NOENR').AsInteger = CurrentNoEnr);
    QQueryCheck.Close;
  finally
    QQueryCheck.Free;
  end;

  if not IsDernier then
  begin
    MessageDlg('Vous ne pouvez supprimer que le tout dernier mouvement de cet article pour ce dépôt.', mtWarning, [mbOk], 0);
    Exit;
  end;

  // Demande de confirmation et suppression
  if MessageDlg('Voulez-vous vraiment supprimer ce mouvement ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      FDQueryStock.Delete;

      // Appel de la procédure centralisée !
      RaffraichirStockFiche(DBcodart.Field.AsString, CurrentCodDep);

      ShowMessage('Le mouvement a été supprimé avec succès.');
    except
      on E: Exception do
        MessageDlg('Erreur lors de la suppression du mouvement: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;


procedure TFormFicheArticle.BtnSupprimerInfoClick(Sender: TObject);
begin
  // 1. Vérification que la requête est ouverte et non vide
  if not FDQueryArtinfocompl.Active or FDQueryArtinfocompl.IsEmpty then
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
      FDQueryArtinfocompl.Delete;

      // 4. Rafraîchissement pour synchroniser avec la base
      FDQueryArtinfocompl.Refresh;
    except
      on E: Exception do
      begin
        ShowMessage('Erreur lors de la suppression : ' + E.Message);
        FDQueryArtinfocompl.CancelUpdates; // Annule la modification locale en cas d'échec
      end;
    end;
  end;
end;

procedure TFormFicheArticle.BtnSuprPromoClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not FDQueryPromo.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette promotion ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FDQueryPromo.Delete;
    end;
  end;
end;

procedure TFormFicheArticle.BtnSuprTarifartClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not FDQueryTarifart.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer ce tarif-article ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FDQueryTarifart.Delete;
    end;
  end;
end;

procedure TFormFicheArticle.DBCheckBoxG_StoClick(Sender: TObject);
begin
   DBGridStodep.Visible := DBCheckBoxG_Sto.Checked;
end;

procedure TFormFicheArticle.DBGridStodepCellClick(Column: TColumn);
begin
  FDQueryStock.Refresh
end;

procedure TFormFicheArticle.DBImageChange(Sender: TObject);
begin
  // On ne charge l'aperçu que si la Frame est effectivement affichée à l'écran
  if Showing then
    ChargerApercuLogo;
end;

procedure TFormFicheArticle.ChargerApercuLogo;
var
  Chemin: string;
begin
  Chemin := DBImage.Text;

  // Ne rien faire si le chemin n'a pas changé
  if Chemin = FDernierCheminLogo then Exit;
  FDernierCheminLogo := Chemin;

  if (Chemin <> '') and FileExists(Chemin) then
  begin
    try
      ImageLogo.Picture.Graphic := nil;
      ImageLogo.Picture.LoadFromFile(Chemin);
    except
      ImageLogo.Picture.Graphic := nil;
    end;
  end
  else
    ImageLogo.Picture.Graphic := nil;
end;


procedure TFormFicheArticle.DBPrixvteExit(Sender: TObject);
begin
  CalculerDepuisPrixVente;
end;

procedure TFormFicheArticle.EditPrc_margeExit(Sender: TObject);
begin
  CalculerDepuisMarge;
end;

procedure TFormFicheArticle.EditPRIXTTCExit(Sender: TObject);
begin
  CalculerDepuisTTC;
end;

procedure TFormFicheArticle.EditTx_marqueExit(Sender: TObject);
begin
  CalculerDepuisTxMarque;
end;


procedure TFormFicheArticle.FDQueryCodbarAfterScroll(DataSet: TDataSet);
var
  CodeBarreBrut: string;
  Code12Chiffres: string;
begin
  // Vérifie si le dataset n'est pas vide et possède un code-barres valide
  if not FDQueryCodbar.IsEmpty then
  begin
    // Efface le Canvas existant en blanc
    ImageCB.Canvas.Brush.Color := clWhite;
    ImageCB.Canvas.FillRect(ImageCB.ClientRect);

    // 1. Récupération de la chaîne depuis la base de données
    CodeBarreBrut := FDQueryCodbar.FieldByName('CODBAR').AsString;

    // 2. Extraction stricte des 12 premiers caractères
    Code12Chiffres := Copy(CodeBarreBrut, 1, 12);

    // 3. Nettoyage de sécurité (optionnel, pour s'assurer qu'il n'y a que des chiffres)
    Code12Chiffres := Trim(Code12Chiffres);

    // 4. Vérification de la longueur avant le dessin
    if Length(Code12Chiffres) = 12 then
    begin
      // Nettoie le canvas en blanc
      ImageCB.Canvas.Brush.Color := clWhite;
      ImageCB.Canvas.FillRect(ImageCB.ClientRect);

      // Appel de votre procédure
      DessinerEAN13(Code12Chiffres, ImageCB.Canvas, 20, 10, 50);
    end;
  end;
end;

procedure TFormFicheArticle.FDQueryCodbarImpfactValidate(Sender: TField);
begin
  FDQueryCodbar.FieldByName('TYPE').AsString:='1'  //(FDQueryCodbar.FieldByName('Impfact').AsBoolean = '1');
end;

procedure TFormFicheArticle.FDQueryPromoBeforePost(DataSet: TDataSet);
begin
  // Exemple de contrôle global sur la ligne en cours de validation
  if DataSet.FieldByName('PRIXHT').AsFloat < 0 then
  begin
    raise Exception.Create('Le prix HT ne peut pas être négatif !');
  end;

  if (DataSet.FieldByName('PRC_REM').AsFloat <> 0) AND (DataSet.FieldByName('PRIXHT').AsFloat <> 0) then
  begin
     raise Exception.Create('Il faut choisir entre remise ou prix...');
  end;

  if (DataSet.FieldByName('PRC_REM').AsFloat < 0) OR (DataSet.FieldByName('PRC_REM').AsFloat > 100) then
  begin
     raise Exception.Create('Vérifier la remise !');
  end;
end;

procedure TFormFicheArticle.FDQueryPromoNewRecord(DataSet: TDataSet);
begin
  // 1. Clé parente (Master-Detail)
  if DBCodart.Text<>'' then
    DataSet.FieldByName('codart').AsString := DBCodart.text;

  DataSet.FieldByName('codart').AsString := DBCodart.text;
  DataSet.FieldByName('prixht').AsFloat := DBPrixvte.Field.AsFloat;
  DataSet.FieldByName('dat_deb').AsDateTime := Date;
  DataSet.FieldByName('dat_fin').AsDateTime := Date;
end;


procedure TFormFicheArticle.FDQueryStockAfterScroll(DataSet: TDataSet);
var
  QQueryCheck: TFDQuery;
  IsDernier: Boolean;
begin
  if DataSet.IsEmpty then
  begin
    BtnSupprimer.Enabled := False;
    Exit;
  end;

  // On vérifie si l'enregistrement courant est le dernier POUR CE DÉPÔT
  QQueryCheck := TFDQuery.Create(nil);
  try
    QQueryCheck.Connection := FDQueryStock.Connection;
    QQueryCheck.SQL.Text := 'SELECT MAX(NOENR) AS MAX_NOENR FROM Stock WHERE CODART = :art AND CODDEP = :dep';
    QQueryCheck.ParamByName('art').AsString := DataSet.FieldByName('CODART').AsString;
    QQueryCheck.ParamByName('dep').AsInteger := DataSet.FieldByName('CODDEP').AsInteger;
    QQueryCheck.Open;

    IsDernier := (QQueryCheck.FieldByName('MAX_NOENR').AsInteger = DataSet.FieldByName('NOENR').AsInteger);
    QQueryCheck.Close;
  finally
    QQueryCheck.Free;
  end;

  // Le bouton n'est actif que si c'est le dernier mouvement du dépôt
  BtnSupprimer.Enabled := IsDernier;
end;


procedure TFormFicheArticle.FDQueryStodepBeforePost(DataSet: TDataSet);
var
  CodeDepSaisi: string;
  QueryVerif: TFDQuery;
begin
  // 1. Récupérer le code dépôt saisi dans la ligne en cours
  CodeDepSaisi := DataSet.FieldByName('CODDEP').AsString;

  // Si le champ est vide, on laisse la contrainte ou on bloque
  if Trim(CodeDepSaisi) = '' then
    raise Exception.Create('Le code dépôt ne peut pas être vide.');

  // 2. Vérifier l'existence du dépôt via une requête rapide
  QueryVerif := TFDQuery.Create(nil);
  try
    QueryVerif.Connection := DMGesCloud.ConnexionGesCloud;
    QueryVerif.SQL.Text := 'SELECT COUNT(*) FROM depot WHERE CODDEP = :dep';
    QueryVerif.Params[0].AsString := CodeDepSaisi;
    QueryVerif.Open;

    // 3. Si le dépôt n'existe pas (compte à 0), on bloque l'enregistrement
    if QueryVerif.Fields[0].AsInteger = 0 then
    begin
      raise Exception.Create('Erreur : Le dépôt "' + CodeDepSaisi + '" n''existe pas dans la table des dépôts.');
    end;
  finally
    QueryVerif.Free;
  end;
end;

procedure TFormFicheArticle.FDQueryStodepNewRecord(DataSet: TDataSet);
begin
  // 1. Lier le code article courant
  DataSet.FieldByName('CODART').AsString := DM_Olivier.FDQueryArticle.FieldByName('CODART').AsString;

  // 2. Initialiser la quantité à 0
  DataSet.FieldByName('QTE').AsFloat := 0; // ou AsInteger selon le type du champ QTE

  // 3. Initialiser le PMP avec la valeur de l'article
  DataSet.FieldByName('PMP').AsCurrency := DM_Olivier.FDQueryArticle.FieldByName('PMP').AsCurrency;
end;


procedure TFormFicheArticle.FDQueryTarifartCalcFields(DataSet: TDataSet);
var
  PrixHT: Double;
  TauxTVA: Double;
begin
  PrixHT := DataSet.FieldByName('PRIXHT').AsFloat;

  // Récupérez le taux de TVA (par exemple depuis votre combo de TVA de la fiche article)
  TauxTVA := DBLookupComboBoxTVA.ListSource.DataSet.FieldByName('TAUX').AsFloat;   //FDQueryTVA.FieldByName('TAUX').AsFloat; // À adapter selon votre logique de TVA

  // On écrit directement dans le champ calculé (qui sera créé en mémoire par FireDAC)
  DataSet.FieldByName('CalcPrixTTC').AsFloat := DM_Olivier.CalculerTTC(PrixHT,TauxTVA)    //PrixHT * TauxTVA;
end;


procedure TFormFicheArticle.FormCreate(Sender: TObject);
 var
 QueryCheck: TFDQuery;

begin
  // On crée le champ calculé UNE SEULE FOIS au lancement de la fiche
  with TFloatField.Create(FDQueryTarifart) do
  begin
    FieldName := 'CalcPrixTTC';
    Name := FDQueryTarifart.Name + 'CalcPrixTTC';
    Calculated := True;
    DataSet := FDQueryTarifart;
  end;

  // Recherche dernier prix de revient ligcde
  QueryCheck := TFDQuery.Create(nil);
  try
    QueryCheck.Connection := FDQueryStock.Connection;
    QueryCheck.SQL.Text := 'SELECT PX_REV, COEF_PR FROM ligcde WHERE CODART = :art AND PX_REV > 0 AND ETAT = ''R'' ORDER BY NOREC DESC LIMIT 1';
    QueryCheck.ParamByName('art').AsString := DBCodart.text;
    QueryCheck.Open;
    if not QueryCheck.IsEmpty then
    begin
      // Utilisation de AsFloat (ou AsCurrency) pour garder les décimales, avec un affichage propre à 2 décimales
      EditDerPxRev.Text := FloatToStrF(QueryCheck.FieldByName('PX_REV').AsFloat, ffFixed, 15, 2);
      EditCoefPR.Text := FloatToStrF(QueryCheck.FieldByName('COEF_PR').AsFloat, ffFixed, 15, 2);
    end
    else
    begin
      EditDerPxRev.Text := '0.00'; // Valeur par défaut si aucun historique trouvé
      EditCoefPR.Text := '0.00'; // Valeur par défaut si aucun historique trouvé
    end;
    QueryCheck.Close;

    // Recherche qte commande en cours
  //QueryCheck := TFDQuery.Create(nil);
    QueryCheck.Connection := FDQueryStock.Connection;
    QueryCheck.SQL.Text := 'SELECT sum(QTE_UV) as TOT_QTE_UV FROM ligcde WHERE CODART = :art AND ETAT <> ''R''';
    QueryCheck.ParamByName('art').AsString := DBCodart.text;
    QueryCheck.Open;
    if not QueryCheck.IsEmpty then
    begin
      // Utilisation de AsFloat (ou AsCurrency) pour garder les décimales, avec un affichage propre à 2 décimales
      EditQteCdeEnCours.Text := FloatToStrF(QueryCheck.FieldByName('TOT_QTE_UV').AsFloat, ffFixed, 15, 2);
    end
    else
    begin
      EditQteCdeEnCours.Text := '0.00'; // Valeur par défaut si aucun historique trouvé
    end;
    QueryCheck.Close;

  finally
    QueryCheck.Free;
  end;
end;

procedure TFormFicheArticle.FormShow(Sender: TObject);
begin
  // 1. Désactivation du champ code en mode modification
  DBCodart.ReadOnly := (ModeSaisie = msModification);

  // --- AFFECTATION AUTOMATIQUE DU PROCHAIN NUMÉRO EN MODE CRÉATION ---
  if ModeSaisie = msAjout then
  begin
    // Si la requête est déjà en mode insertion (Append/Insert)
    if DM_Olivier.FDQueryArticle.State in [dsInsert] then
    begin
      DBCheckBoxFerme.Checked := false;
//      DBCheckBoxFinMois.Checked := false;
//      DBCheckBoxAppTarifcli.Checked := false;
     end;
  end;

  FDQueryTVA.Close;
  FDQueryTVA.Open;

  FDQueryDepart.Close;
  FDQueryDepart.Open;

  FDQueryFamille.Close;
  FDQueryFamille.Open;

  FDQuerySousFam.Close;
  FDQuerySousFam.Open;

  FDQueryFournis.Close;
  FDQueryFournis.Open;

  FDQueryActivite.Close;
  FDQueryActivite.Open;

  //La creation de la colonne calculee se fait en OnCreate (une seule fois)
  FDQueryTarifart.Close;
  FDQueryTarifart.Open;

  FDQueryPromo.Close;
  FDQueryPromo.Open;

  DM_Olivier.FDQueryCtrstock.Close;
  DM_Olivier.FDQueryCtrstock.Open;

  FDQueryStodep.Close;
  FDQueryStodep.Open;
  //Puis on controle si gestion pmp global ou pas
  ActualiserVisibilitePMP;
  DBCheckBoxG_StoClick(Self);

  FDQueryStock.Close;
  FDQueryStock.Open;

  FDQueryCodbar.Close;
  FDQueryCodbar.Open;

  FDQueryCa_art.Close;
  FDQueryCa_art.Open;

  FDQueryLigvteaa.Close;
  FDQueryLigvteaa.Open;

  FDQueryLig_prof.Close;
  FDQueryLig_prof.Open;

  FDQueryLigcde.Close;
  FDQueryLigcde.Open;

  FDQueryLigachjj.Close;
  FDQueryLigachjj.Open;

  FDQueryArtinfocompl.Close;
  FDQueryArtinfocompl.Open;

  //Calcul marge et taux de marque
  CalculerDepuisPrixVente;

  // Charger immédiatement l'aperçu Image
  ChargerApercuLogo;

  DBLibelle.SetFocus;

end;


procedure TFormFicheArticle.JvDBGridCodbarCellClick(Column: TColumn);
begin
if Column.FieldName = 'TYPE' then
  begin
    FDQueryCodbar.Edit;
    if FDQueryCodbar.FieldByName('TYPE').AsString = '1' then
      FDQueryCodbar.FieldByName('TYPE').AsString := '0'
    else
      FDQueryCodbar.FieldByName('TYPE').AsString := '1';
  end;
end;

procedure TFormFicheArticle.JvDBGridCodbarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Checked: Boolean;
  CheckRect: TRect;
begin
  if Column.FieldName = 'TYPE' then
  begin
    // 1. Nettoyer le fond de la cellule
    JvDBGridCodbar.Canvas.Brush.Color := JvDBGridCodbar.Color;
    JvDBGridCodbar.Canvas.FillRect(Rect);

    // 2. Déterminer l'état (coché si '1')
    Checked := (Column.Field.AsString = '1');

    // 3. Calculer un carré centré de 15x15 pixels pour la case à cocher
    CheckRect := Rect;
    // Centrage horizontal et vertical
    CheckRect.Left := Rect.Left + (Rect.Width - 15) div 2;
    CheckRect.Top := Rect.Top + (Rect.Height - 15) div 2;
    CheckRect.Right := CheckRect.Left + 15;
    CheckRect.Bottom := CheckRect.Top + 15;

    // 4. Dessiner la case à cocher native Windows
    if Checked then
      DrawFrameControl(JvDBGridCodbar.Canvas.Handle, CheckRect, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_CHECKED)
    else
      DrawFrameControl(JvDBGridCodbar.Canvas.Handle, CheckRect, DFC_BUTTON, DFCS_BUTTONCHECK);
  end
  else
    JvDBGridCodbar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFormFicheArticle.JvDBGridLigvteaaTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryLigvteaa.IndexFieldNames = Field.FieldName then
      FDQueryLigvteaa.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryLigvteaa.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFormFicheArticle.JvDBGridLig_profTitleBtnDblClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryLig_prof.IndexFieldNames = Field.FieldName then
      FDQueryLig_prof.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryLig_prof.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFormFicheArticle.JvDBGridStockTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryStock.IndexFieldNames = Field.FieldName then
      FDQueryStock.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryStock.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFormFicheArticle.ActualiserVisibilitePMP;
var
  EstPMPGlobal: Boolean;
  i: Integer;
begin
  // 1. Lire la valeur en testant si elle vaut 1 (ou <> 0)
  EstPMPGlobal := (DM_Olivier.PMPGlobalMode = 1); //(DM_Olivier.FDQueryCtrstock.FieldByName('PMP_GLO').AsInteger = 1);
  // 2. Parcourir les colonnes de DBGridStodep pour trouver 'PMP'
  for i := 0 to DBGridStodep.Columns.Count - 1 do
  begin
    if DBGridStodep.Columns[i].FieldName = 'PMP' then
    begin
      DBGridStodep.Columns[i].Visible := not EstPMPGlobal;
      Break;
    end;
  end;
end;

procedure TFormFicheArticle.CalculerDepuisPrixVente;
var
  PMP, PV: Double;
begin
  if FCalculEnCours then Exit;
  FCalculEnCours := True;
  try
    PMP := DM_Olivier.FDQueryArticle.FieldByName('PMP').AsFloat;
    if Assigned(DBPrixvte.Field) then
        PV := DBPrixvte.Field.AsFloat
    else
        PV := 0;

    EditMarge.text := FloatToStrF((PV - PMP), ffFixed, 10, 2);
    CalculerPrixTTC;

    // 1. Calcul de la marge (%)
    if PMP > 0 then
      EditPrc_marge.Text := FloatToStrF(((PV - PMP) / PMP) * 100, ffFixed, 10, 2)
    else
      EditPrc_marge.Text := '0';

    // 2. Calcul du taux de marque (%)
    if PV > 0 then
      EditTx_marque.Text := FloatToStrF(((PV - PMP) / PV) * 100, ffFixed, 10, 2)
    else
      EditTx_marque.Text := '0';
  finally
    FCalculEnCours := False;
  end;
end;

procedure TFormFicheArticle.CalculerDepuisMarge;
var
  PMP, PrcMarge, PV: Double;
begin
  if FCalculEnCours then Exit;
  FCalculEnCours := True;
  try
    PMP := DM_Olivier.FDQueryArticle.FieldByName('PMP').AsFloat;
    if TryStrToFloat(EditPrc_marge.Text, PrcMarge) then
    begin
      // Calcul du nouveau Prix de Vente
      PV := PMP * (1 + (PrcMarge / 100));
      DM_Olivier.FDQueryArticle.FieldByName('PRIXVTE').AsFloat := PV;
      CalculerPrixTTC;

      // Calcul du taux de marque correspondant
      if PV > 0 then
        EditTx_marque.Text := FloatToStrF(((PV - PMP) / PV) * 100, ffFixed, 10, 2)
      else
        EditTx_marque.Text := '0';

      EditMarge.text := FloatToStrF((PV - PMP), ffFixed, 10, 2);
    end;
  finally
    FCalculEnCours := False;
  end;
end;

procedure TFormFicheArticle.CalculerDepuisTxMarque;
var
  PMP, TxMarque, PV: Double;
begin
  if FCalculEnCours then Exit;
  FCalculEnCours := True;
  try
    PMP := DM_Olivier.FDQueryArticle.FieldByName('PMP').AsFloat;
    if TryStrToFloat(EditTx_marque.Text, TxMarque) then
    begin
      // Empêcher division par zéro ou taux >= 100%
      if (TxMarque > 0) and (TxMarque < 100) then
      begin
        // Calcul du nouveau Prix de Vente
        PV := PMP / (1 - (TxMarque / 100));
        DM_Olivier.FDQueryArticle.FieldByName('PRIXVTE').AsFloat := PV;
        EditMarge.text := FloatToStrF((PV - PMP), ffFixed, 10, 2);
        CalculerPrixTTC;
        // Calcul de la marge correspondante
        if PMP > 0 then
          EditPrc_marge.Text := FloatToStrF(((PV - PMP) / PMP) * 100, ffFixed, 10, 2)
        else
          EditPrc_marge.Text := '0';
      end;
    end;
  finally
    FCalculEnCours := False;
  end;
end;


procedure TFormFicheArticle.CalculerPrixTTC;
var
  PrixVente, TauxTVA, ResultatTTC: Double;
begin
  // On récupère directement la valeur du champ lié au composant DBPrixvte
  // Cela garantit de prendre la valeur la plus "fraîche" de l'UI
  if Assigned(DBPrixvte.Field) then
    PrixVente := DBPrixvte.Field.AsFloat
  else
    PrixVente := 0;

  TauxTVA := FDQueryTVA.FieldByName('TAUX').AsFloat;

  ResultatTTC := DM_Olivier.CalculerTTC(PrixVente, TauxTVA);

  EditPRIXTTC.Text := FloatToStrF(ResultatTTC, ffFixed, 10, 2);
end;


procedure TFormFicheArticle.CalculerDepuisTTC;
var
  TTC, TauxTVA, NouveauHT: Double;
begin
  if FCalculEnCours then Exit;

  if not TryStrToFloat(EditPRIXTTC.Text, TTC) then Exit;
  TauxTVA := FDQueryTVA.FieldByName('TAUX').AsFloat;

  NouveauHT := DM_Olivier.CalculerHT(TTC, TauxTVA);

  if Assigned(DBPrixvte.Field) then
  begin
    DBPrixvte.Field.AsFloat := NouveauHT;
  end;

  // On appelle CalculerDepuisPrixVente en étant hors de la protection FCalculEnCours
  // Vu que DBPrixvte.Field.AsFloat est déjà à jour, cela va recalculer marges, taux et réafficher le TTC
  CalculerDepuisPrixVente;
end;


procedure TFormFicheArticle.RaffraichirStockFiche(const CodeArt: string; const CodeDep: Integer);
begin
  // 1. On lance le recalcul du stock
  //DM_Olivier.RecalculerStockStodep(CodeArt, CodeDep);

  // 2. On rafraîchit les listes de stock
  if Assigned(FDQueryStodep) then FDQueryStodep.Refresh;
  if Assigned(FDQueryStock) then FDQueryStock.Refresh;

  // 3. SYNCHRONISATION CIBLÉE DE LA FICHE ARTICLE :
  if Assigned(DM_Olivier.FDQueryArticle) and (DM_Olivier.FDQueryArticle.State in [dsEdit, dsInsert]) then
  begin
    with TFDQuery.Create(nil) do
    try
      Connection := DMGesCloud.ConnexionGesCloud;
      SQL.Text := 'SELECT QTE, PMP FROM ARTICLE WHERE CODART = :art';
      ParamByName('art').AsString := CodeArt;
      Open;
      if not Eof then
      begin
        // On injecte les vraies valeurs calculées dans les champs en mémoire
        DM_Olivier.FDQueryArticle.FieldByName('QTE').AsFloat := FieldByName('QTE').AsFloat;
        DM_Olivier.FDQueryArticle.FieldByName('PMP').AsFloat := FieldByName('PMP').AsFloat;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TFormFicheArticle.SBConsultDevisClick(Sender: TObject);
var
  NumDevis: Integer; // ou Int64 selon la taille de votre numérique
  FormFicheDevis: TFormFicheDevis; // <-- On déclare la variable de la fiche
begin
  NumDevis := FDQueryLig_prof.FieldByName('CODDEV').AsInteger; // ou le nom exact de votre champ dans la ligne

  // 1. On charge la facture dans le DataModule
  DM_Olivier.FDQueryEnt_prof.Close;
  DM_Olivier.FDQueryEnt_prof.Params[0].AsInteger := NumDevis; // Utilisation de .AsInteger pour un champ numérique
  DM_Olivier.FDQueryEnt_prof.Open;

  FormFicheDevis := TFormFicheDevis.Create(Self);
  FormFicheDevis.Caption := 'Consultation Devis N° ' + FDQueryLig_prof.FieldByName('CODDEV').AsString;

try
    FormFicheDevis.ShowModal;
  finally
    FormFicheDevis.Free;
  end;
end;

procedure TFormFicheArticle.SBImpDevisClick(Sender: TObject);
var
  NumDevis: Integer;
begin
  // 1. On récupère le numéro de la facture sélectionnée dans la grille des factures
  // (Assurez-vous de cibler le bon champ, ici supposé 'CODFAC')
  NumDevis := FDQueryLig_prof.FieldByName('CODDEV').AsInteger;

  if NumDevis = 0 then
  begin
    ShowMessage('Veuillez sélectionner un devis dans la liste.');
    Exit;
  end;

  // 2. On injecte le paramètre et on ouvre les requêtes sur le DataModule
  DM_Olivier.FDQueryEnt_prof.Close;
  DM_Olivier.FDQueryEnt_prof.ParamByName('CODDEV').AsInteger := NumDevis;
  DM_Olivier.FDQueryEnt_prof.Open;

  DMGesCloud.FDQueryRepres.Close;
  DMGesCloud.FDQueryRepres.ParamByName('CODREP').AsInteger := FDQueryLigvteaa.FieldByName('CODREP').AsInteger;
  DMGesCloud.FDQueryRepres.Open;

  // 3. On crée la fiche d'impression, on affiche l'aperçu, puis on libère la mémoire
  FormDevisPrint := TFormDevisPrint.Create(Self);

  FormDevisPrint.FDQueryLig_prof.Close;
  FormDevisPrint.FDQueryLig_prof.ParamByName('CODDEV').AsInteger := NumDevis;
  FormDevisPrint.FDQueryLig_prof.Open;


  try
    // RLReport1 est le nom de votre composant TRLReport sur FormDevisPrint
    FormDevisPrint.RLReport1.Preview;
  finally
    FormDevisPrint.Free;
  end;
end;


procedure TFormFicheArticle.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    // Passer le dataset en édition si ce n'est pas déjà le cas
    if not (DM_Olivier.FDQueryArticle.State in [dsEdit, dsInsert]) then
      DM_Olivier.FDQueryArticle.Edit;

    // Affecter le chemin au champ BDD connecté à DBEdit16
    DBImage.Field.AsString := OpenDialog1.FileName;

    // Charger immédiatement l'aperçu
    ChargerApercuLogo;
  end;
end;

end.
