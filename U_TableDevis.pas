unit U_TableDevis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxDBSet, frCoreClasses, frxExportBaseDialog, frxDesgn,
  frxExportBaseImageSettingsDialog, frxExportHTML, frxExportPDF, frxExportCSV;

type
  TFrameTableDevis = class(TFrame)
    Panel2: TPanel;
    BtnTransformer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridEnt_prof: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODDEV: TEdit;
    EdtCherche_NOM: TEdit;
    CheckBoxToutesFactures: TCheckBox;
    EditCherche_DATE_: TEdit;
    EditCherche_CODCLI: TEdit;
    EditCherche_CODCAI: TEdit;
    FDQueryEnt_prof: TFDQuery;
    StringField1: TStringField;
    LargeintField1: TLargeintField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    LargeintField2: TLargeintField;
    ShortintField1: TShortintField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    SmallintField2: TSmallintField;
    IntegerField2: TIntegerField;
    SmallintField3: TSmallintField;
    DateField1: TDateField;
    IntegerField3: TIntegerField;
    BCDField1: TBCDField;
    IntegerField4: TIntegerField;
    BCDField2: TBCDField;
    LargeintField3: TLargeintField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    BCDField7: TBCDField;
    BCDField8: TBCDField;
    BCDField9: TBCDField;
    BCDField10: TBCDField;
    LargeintField4: TLargeintField;
    StringField7: TStringField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    StringField8: TStringField;
    SmallintField8: TSmallintField;
    SmallintField9: TSmallintField;
    StringField9: TStringField;
    SmallintField10: TSmallintField;
    DateField2: TDateField;
    StringField10: TStringField;
    SmallintField11: TSmallintField;
    SQLTimeStampField1: TSQLTimeStampField;
    BCDField12: TBCDField;
    BCDField13: TBCDField;
    SmallintField13: TSmallintField;
    BCDField14: TBCDField;
    BCDField15: TBCDField;
    BooleanField1: TBooleanField;
    StringField12: TStringField;
    DSEnt_prof: TDataSource;
    BtnImprimer: TButton;
    BtnAjouter: TBitBtn;
    RadioGroupEtat: TRadioGroup;
    BtnSupprimer: TBitBtn;
    BtnOublier: TBitBtn;
    BtnOuvrir: TBitBtn;
    FDQueryEnt_profMT_TSOC: TBCDField;
    EdtCherche_CODFAC: TEdit;
    BtnDupliquer: TBitBtn;
    frxReportDevis: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDQueryDevis: TFDQuery;
    DSDevis: TDataSource;
    FDQueryDevisOBSERV: TStringField;
    FDQueryDevisTYPE_: TStringField;
    FDQueryDevisCODDEV: TLargeintField;
    FDQueryDevisCODCLI: TIntegerField;
    FDQueryDevisCODFAC: TLargeintField;
    FDQueryDevisCODCAI: TStringField;
    FDQueryDevisCODDEP: TShortintField;
    FDQueryDevisNOM: TStringField;
    FDQueryDevisNOTAHITI: TStringField;
    FDQueryDevisEXO_TVA: TSmallintField;
    FDQueryDevisANNEE: TIntegerField;
    FDQueryDevisMOIS: TSmallintField;
    FDQueryDevisDATE_: TDateField;
    FDQueryDevisHEURE: TIntegerField;
    FDQueryDevisMT_REMISE: TIntegerField;
    FDQueryDevisPRC_REMISE: TBCDField;
    FDQueryDevisTOTHT: TBCDField;
    FDQueryDevisMT_TTC: TLargeintField;
    FDQueryDevisMT_HT0: TBCDField;
    FDQueryDevisMT_HT1: TBCDField;
    FDQueryDevisMT_HT2: TBCDField;
    FDQueryDevisMT_HT3: TBCDField;
    FDQueryDevisMT_TVA1: TBCDField;
    FDQueryDevisMT_TVA2: TBCDField;
    FDQueryDevisMT_TVA3: TBCDField;
    FDQueryDevisMT_TVA: TBCDField;
    FDQueryDevisMARGE: TLargeintField;
    FDQueryDevisREFERENCE_: TStringField;
    FDQueryDevisCODREP: TSmallintField;
    FDQueryDevisNO_SEM: TSmallintField;
    FDQueryDevisNO_JOUR: TSmallintField;
    FDQueryDevisCODPAI: TStringField;
    FDQueryDevisJRSCRD: TSmallintField;
    FDQueryDevisFIN_MOIS: TSmallintField;
    FDQueryDevisLIBREG: TStringField;
    FDQueryDevisCRD_FORCE: TSmallintField;
    FDQueryDevisDATE_ECH: TDateField;
    FDQueryDevisREGL: TSmallintField;
    FDQueryDevisCODGEO: TStringField;
    FDQueryDevisFLAG_TAX: TSmallintField;
    FDQueryDevisDER_MODIF: TSQLTimeStampField;
    FDQueryDevisMT_TSOC: TBCDField;
    FDQueryDevisMT_HTSOC: TBCDField;
    FDQueryDevisTX_TSOC: TBCDField;
    FDQueryDevisEXO_CPS: TSmallintField;
    FDQueryDevisMT_TVAI: TBCDField;
    FDQueryDevisMT_HTI: TBCDField;
    FDQueryDevisTVA_ILES: TBooleanField;
    FDQueryDevisOBSERV_1: TMemoField;
    FDQueryDevisCODCLI_1: TIntegerField;
    FDQueryDevisCPTAUX: TStringField;
    FDQueryDevisNOM_1: TStringField;
    FDQueryDevisCODREP_1: TSmallintField;
    FDQueryDevisPRC_REMISE_1: TBCDField;
    FDQueryDevisNOTEL: TStringField;
    FDQueryDevisNOTAHITI_1: TStringField;
    FDQueryDevisNOFAX: TStringField;
    FDQueryDevisJRSCRD_1: TSmallintField;
    FDQueryDevisCREDIT: TLargeintField;
    FDQueryDevisplaf_crd: TIntegerField;
    FDQueryDevisCODPAI_1: TStringField;
    FDQueryDevisFIN_MOIS_1: TSmallintField;
    FDQueryDevisNB_EX: TSmallintField;
    FDQueryDevisCAAN: TLargeintField;
    FDQueryDevisAD1: TStringField;
    FDQueryDevisAD2: TStringField;
    FDQueryDevisAD3: TStringField;
    FDQueryDevisCUM_MVT: TSmallintField;
    FDQueryDevisMT_CPTA: TLargeintField;
    FDQueryDevisEXO_TVA_1: TSmallintField;
    FDQueryDevisBLOQUE: TSmallintField;
    FDQueryDevisCODGEO_1: TStringField;
    FDQueryDevisEMAIL: TStringField;
    FDQueryDevisCODTAR: TStringField;
    FDQueryDevisADM: TSmallintField;
    FDQueryDevisFLAG_TAX_1: TSmallintField;
    FDQueryDevisCODFAC_ADM: TStringField;
    FDQueryDevisFERME: TSmallintField;
    FDQueryDevisDER_MODIF_1: TSQLTimeStampField;
    FDQueryDevisSPEC_GOUV: TSmallintField;
    FDQueryDevisNOGSM: TLargeintField;
    FDQueryDevisPLV: TSmallintField;
    FDQueryDevisINTIT_BQ: TStringField;
    FDQueryDevisCODE_BQ: TStringField;
    FDQueryDevisCODE_GUI: TStringField;
    FDQueryDevisNOCPT: TStringField;
    FDQueryDevisCLE: TStringField;
    FDQueryDevisCOEF_MAJ_PR: TBCDField;
    FDQueryDevisEXO_CPS_1: TSmallintField;
    FDQueryDevisPAS_REM: TSmallintField;
    FDQueryDevisREM_FAM: TSmallintField;
    FDQueryDevisRELEVE_EMAIL: TBooleanField;
    FDQueryDevisSELECT_: TBooleanField;
    FDQueryDevisAPP_TARIFCLI: TBooleanField;
    FDQueryDevisTVA_ILES_1: TBooleanField;
    FDQueryDevisLIBELLE: TMemoField;
    FDQueryDevisCODFAC_1: TLargeintField;
    FDQueryDevisCODCLI_2: TIntegerField;
    FDQueryDevisCODCAI_1: TStringField;
    FDQueryDevisCODDEV_1: TLargeintField;
    FDQueryDevisCODDEP_1: TShortintField;
    FDQueryDevisNOENR: TIntegerField;
    FDQueryDevisANNEE_1: TIntegerField;
    FDQueryDevisMOIS_1: TSmallintField;
    FDQueryDevisCODREP_2: TSmallintField;
    FDQueryDevisCODFOU: TStringField;
    FDQueryDevisCODSSF: TStringField;
    FDQueryDevisCODFAM: TStringField;
    FDQueryDevisCODDPT: TStringField;
    FDQueryDevisTYPE__1: TStringField;
    FDQueryDevisCODART: TStringField;
    FDQueryDevisCODBAR: TStringField;
    FDQueryDevisQTE: TBCDField;
    FDQueryDevisPOIDS: TBCDField;
    FDQueryDevisCODTAR_1: TStringField;
    FDQueryDevisPRIXHT: TBCDField;
    FDQueryDevisPRIXTTC: TLargeintField;
    FDQueryDevisPRIXNET: TBCDField;
    FDQueryDevisTOTHT_1: TBCDField;
    FDQueryDevisMT_TTC_1: TLargeintField;
    FDQueryDevisPRC_REMISE_2: TBCDField;
    FDQueryDevisMT_REMISE_1: TIntegerField;
    FDQueryDevisTX_TVA: TBCDField;
    FDQueryDevisMT_TVA_1: TBCDField;
    FDQueryDevisNO_TVA: TSmallintField;
    FDQueryDevisPRIXREV: TBCDField;
    FDQueryDevisMARGE_1: TLargeintField;
    FDQueryDevisNO_SEM_1: TSmallintField;
    FDQueryDevisNO_JOUR_1: TSmallintField;
    FDQueryDevisDET_PPT: TLargeintField;
    FDQueryDevisDET_ILE: TLargeintField;
    FDQueryDevisNOENRF: TIntegerField;
    FDQueryDevisDER_MODIF_2: TSQLTimeStampField;
    FDQueryDevisIMP_CODE: TSmallintField;
    FDQueryDevisTX_TSOC_1: TBCDField;
    FDQueryDevisMT_TSOC_1: TBCDField;
    frxPDFExport1: TfrxPDFExport;
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
    procedure JvDBGridEnt_profTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CODDEVChange(Sender: TObject);
    procedure EditCherche_SELChange(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure FDQueryEnt_profCalcFields(DataSet: TDataSet);
    procedure BtnImprimerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure CheckBoxNatureClick(Sender: TObject);
    procedure RadioGroupEtatClick(Sender: TObject);
    procedure BtnOublierClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnTransformerClick(Sender: TObject);
    procedure BtnDupliquerClick(Sender: TObject);
    procedure frxReportDevisBeforePrint(Sender: TfrxReportComponent);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide, U_FicheEnt_prof, U_ReportDevis;


procedure TFrameTableDevis.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('ent_prof_liste.html');
end;


procedure TFrameTableDevis.BtnAjouterClick(Sender: TObject);
begin
  // On crée la fiche en passant le mode Création et le numéro 0 pour nouveau
  FormEnt_prof := TFormEnt_prof.Create(Self, msAjout, 0);
  try
    FormEnt_prof.Caption := 'Créer un nouveau devis';

    if FormEnt_prof.ShowModal = mrOk then
    begin
      // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
      FDQueryEnt_prof.Refresh;

      // Se positionner sur la nouvelle facture créée dans la grille
      if not FDQueryEnt_prof.IsEmpty then
        FDQueryEnt_prof.Locate('CODDEV', FormEnt_prof.CodDevCree, []);
    end;
  finally
    FormEnt_prof.Free;
  end;
end;

procedure TFrameTableDevis.BtnDupliquerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauCodDev: Integer;
  AncienCodDev: Integer;

begin
  AncienCodDev := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if AncienCodDev = 0 then
  begin
    ShowMessage('Veuillez sélectionner un devis dans la liste.');
    Exit;
  end;

  if MessageDlg('Dupliquer le devis ' +IntToStr(AncienCodDev)+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;


  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;

    // Étape 1 : Incrémenter le chrono pour obtenir un nouveau CODDEV unique
    QryExec.SQL.Text := 'UPDATE chrono SET CHRONO = CHRONO + 1 WHERE PREFIX = :PREFIX';
    QryExec.ParamByName('PREFIX').AsString := 'DEV01'; // Adapte le préfixe selon ton paramétrage
    QryExec.ExecSQL;
    QryExec.Close;

    // Récupérer ce nouveau numéro
    QryExec.SQL.Text := 'SELECT CHRONO FROM chrono WHERE PREFIX = :PREFIX';
    QryExec.ParamByName('PREFIX').AsString := 'DEV01';
    QryExec.Open;
    NouveauCodDev := QryExec.FieldByName('CHRONO').AsInteger;
    QryExec.Close;

    // Étape 2 : Dupliquer l'en-tête (ent_prof)
    // On omet CODDEV dans la liste des colonnes insérées pour l'injecter dynamiquement avec NouveauCodDev
    QryExec.SQL.Text :=
      'INSERT INTO ent_prof (' +
      '  OBSERV, TYPE_, CODDEV, CODCLI, CODCAI, CODDEP, NOM, NOTAHITI, ' +
      '  EXO_TVA, DATE_, HEURE, MT_REMISE, PRC_REMISE, TOTHT, MT_TTC, ' +
      '  MT_HT0, MT_HT1, MT_HT2, MT_HT3, MT_TVA1, MT_TVA2, MT_TVA3, MT_TVA, MARGE, ' +
      '  REFERENCE_, CODREP, NO_SEM, NO_JOUR, CODPAI, JRSCRD, FIN_MOIS, LIBREG, ' +
      '  CRD_FORCE, DATE_ECH, REGL, CODGEO, FLAG_TAX, DER_MODIF, MT_TSOC, MT_HTSOC, ' +
      '  TX_TSOC, EXO_CPS, MT_TVAI, MT_HTI, TVA_ILES' +
      ') ' +
      'SELECT ' +
      '  OBSERV, ''D'' AS TYPE_, :NOUVEAU_DEV AS CODDEV, CODCLI, :g_CODCAI AS CODCAI, CODDEP, NOM, NOTAHITI, ' +
      '  EXO_TVA, CURRENT_DATE, CURRENT_TIME, MT_REMISE, PRC_REMISE, TOTHT, MT_TTC, ' +
      '  MT_HT0, MT_HT1, MT_HT2, MT_HT3, MT_TVA1, MT_TVA2, MT_TVA3, MT_TVA, MARGE, ' +
      '  REFERENCE_, CODREP, NO_SEM, NO_JOUR, CODPAI, JRSCRD, FIN_MOIS, LIBREG, ' +
      '  CRD_FORCE, DATE_ECH, REGL, CODGEO, FLAG_TAX, CURRENT_TIMESTAMP, MT_TSOC, MT_HTSOC, ' +
      '  TX_TSOC, EXO_CPS, MT_TVAI, MT_HTI, TVA_ILES ' +
      'FROM ent_prof ' +
      'WHERE CODDEV = :ANCIEN_DEV';

    QryExec.ParamByName('NOUVEAU_DEV').AsInteger := NouveauCodDev;
    QryExec.ParamByName('ANCIEN_DEV').AsInteger  := AncienCodDev;
    QryExec.ParamByName('g_CODCAI').AsString := DM_Olivier.gCodCai;
    QryExec.ExecSQL;
    QryExec.Close;

    // Étape 3 : Dupliquer toutes les lignes associées (lig_prof)
    // On omet NOENRF (clé primaire auto-incrémentée) pour qu'un nouvel ID unique soit généré par ligne,
    // et on associe les lignes au NouveauCodDev.
    QryExec.SQL.Text :=
      'INSERT INTO lig_prof (' +
      '  LIBELLE, CODCLI, CODCAI, CODDEV, CODDEP, CODREP, ' +
      '  CODFOU, CODSSF, CODFAM, CODDPT, TYPE_, CODART, CODBAR, QTE, POIDS, CODTAR, ' +
      '  PRIXHT, PRIXTTC, PRIXNET, TOTHT, MT_TTC, PRC_REMISE, MT_REMISE, TX_TVA, ' +
      '  MT_TVA, NO_TVA, PRIXREV, MARGE, NO_SEM, NO_JOUR, DET_PPT, DET_ILE, ' +
      '  DER_MODIF, IMP_CODE, TX_TSOC, MT_TSOC' +
      ') ' +
      'SELECT ' +
      '  LIBELLE, CODCLI, :g_CODCAI AS CODCAI, :NOUVEAU_DEV AS CODDEV, CODDEP, CODREP, ' +
      '  CODFOU, CODSSF, CODFAM, CODDPT, ''D'' AS TYPE_, CODART, CODBAR, QTE, POIDS, CODTAR, ' +
      '  PRIXHT, PRIXTTC, PRIXNET, TOTHT, MT_TTC, PRC_REMISE, MT_REMISE, TX_TVA, ' +
      '  MT_TVA, NO_TVA, PRIXREV, MARGE, NO_SEM, NO_JOUR, DET_PPT, DET_ILE, ' +
      '  CURRENT_TIMESTAMP, IMP_CODE, TX_TSOC, MT_TSOC ' +
      'FROM lig_prof ' +
      'WHERE CODDEV = :ANCIEN_DEV';

    QryExec.ParamByName('NOUVEAU_DEV').AsInteger := NouveauCodDev;
    QryExec.ParamByName('ANCIEN_DEV').AsInteger  := AncienCodDev;
    QryExec.ParamByName('g_CODCAI').AsString := DM_Olivier.gCodCai;
    QryExec.ExecSQL;

    ShowMessage('Devis dupliqué avec succès sous le numéro : ' + IntToStr(NouveauCodDev));
  finally
    QryExec.Free;
  end;
end;

procedure TFrameTableDevis.BtnFermerClick(Sender: TObject);
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


procedure TFrameTableDevis.BtnImprimerClick(Sender: TObject);
var
  NumDevisSelectionne: Integer;
begin

  // 1. Lire vos paramètres globaux (via une requête ou un fichier de config)
  DM_Olivier.FDQueryCtrstock.open;

  if DM_Olivier.FDQueryCtrstock.IsEmpty then
    Exit;

     // 2. Charger le modèle d'état externe
    frxReportDevis.LoadFromFile('Devis.fr3');

  // 2. Vider les variables mémoire pour repartir proprement
  frxReportDevis.Variables.Clear;

  // 3. CRÉER AUTOMATIQUEMENT la catégorie et les variables
  // ATTENTION : FastReport impose de créer au moins une catégorie (commençant par un espace)
  // avant d'y injecter des variables.
  frxReportDevis.Variables[' ' + 'Globales'] := Null;

  // On ajoute les variables à la catégorie qui vient d'être créée
  frxReportDevis.Variables.AddVariable('Globales','VarNomEntreprise',
  ( DM_Olivier.FDQueryCtrstock.FieldByName('Nom').AsString + #13#10 +
    DM_Olivier.FDQueryCtrstock.FieldByName('Nom2').AsString ));
  frxReportDevis.Variables.AddVariable('Globales','VarTelephone', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Tel').AsString));
  frxReportDevis.Variables.AddVariable('Globales','VarAdresse', DM_Olivier.FDQueryCtrstock.FieldByName('Adresse').AsString);
  frxReportDevis.Variables.AddVariable('Globales','VarNoTAHITI', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('NOTAHITI').AsString));
  frxReportDevis.Variables.AddVariable('Globales','VarLOGO', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('LOGO').AsString));
  frxReportDevis.Variables.AddVariable('Globales','VarEMAIL', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('EMAIL').AsString));
  frxReportDevis.Variables.AddVariable('Globales','VarFAX', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('FAX').AsString));
  frxReportDevis.Variables.AddVariable('Globales','VarRC', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('RC').AsString));
  frxReportDevis.Variables.AddVariable('Globales','VarMEMO_DEV', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('MEMO_DEV').AsString));

  //Lecture representant
  DM_Olivier.FDQueryRepres.SQL.Text:='select * from repres where codrep=:codrep';
  DM_Olivier.FDQueryRepres.ParamByName('CODREP').AsInteger:= FDQueryEnt_prof.FieldByName('CODREP').AsInteger;
  DM_Olivier.FDQueryRepres.Open;
  frxReportDevis.Variables.AddVariable('Globales','VarRepres', QuotedStr(DM_Olivier.FDQueryRepres.FieldByName('NOM').AsString));

  // 4. Ouvrir le concepteur visuel
  // Dès qu'il va s'ouvrir, l'onglet "Variables" à droite affichera votre catégorie toute prête !
  //frxReportDevis.DesignReport;

    // 3. Injecter les données dans les variables FastReport
    // Utilisez QuotedStr pour le texte, mais pas pour les nombres !
//    frxReportDevis.Variables['VarNomEntreprise'] := QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Nom').AsString);
//    frxReportDevis.Variables['VarTelephone']     := QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Tel').AsString);
//    frxReportDevis.Variables['VarAdresse']       := QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Adresse').AsString);
//    frxReportDevis.Variables['VarNoTAHITI']       := QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Adresse').AsString);

    // Exemple pour un paramètre numérique (ex: un taux de TVA global de la config)
    // frxReport1.Variables['VarTvaParDefaut'] := 20.0; // Pas de QuotedStr pour les nombres

//  DM_Olivier.FDQueryCtrstock.Close;

  // 4. Ouvrir les données de la facture et afficher le rapport




  // 1. Activer la requête SQL contenant les données de la facture
  //FDQueryDevis.ParamByName('CODDEV').AsInteger := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;
  FDQueryDevis.Open;

  // 2. Charger le modèle visuel externe (.fr3)
  //frxReportDevis.LoadFromFile('Devis.fr3');

  // 3. Afficher l'aperçu avant impression à l'écran
  frxReportDevis.ShowReport;

  EXIT;



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


procedure TFrameTableDevis.BtnOublierClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauType: string;
  CodDevCourant: Integer;
begin
  if FDQueryEnt_prof.IsEmpty then Exit;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'F' then
  begin
    ShowMessage('Opération impossible, devis déjà facturé.');
    Exit;
  end;

  // Récupérer la clé unique du devis courant (suppose que le champ s'appelle CODDEV)
  CodDevCourant := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'D' then
  begin
    if MessageDlg('Oublier le devis ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
    NouveauType := 'O';
  end
  else
  begin
    if MessageDlg('Rappeler le devis ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
    NouveauType := 'D';
  end;

  // Exécution d'un UPDATE direct et ultra-sécurisé par la clé primaire
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEnt_prof.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'UPDATE ent_prof SET TYPE_ = :NOUVEAU_TYPE WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('NOUVEAU_TYPE').AsString := NouveauType;
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

    QryExec.SQL.Text := 'UPDATE lig_prof SET TYPE_ = :NOUVEAU_TYPE WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('NOUVEAU_TYPE').AsString := NouveauType;
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

    // Rafraîchir la vue pour voir le changement instantanément
    FDQueryEnt_prof.Refresh;
    JvDBGridEnt_prof.SetFocus;
  finally
    QryExec.Free;
  end;
end;

procedure TFrameTableDevis.BtnOuvrirClick(Sender: TObject);
var
  NumDevis: Integer;
  Bookmark: TBookmark; // Variable pour mémoriser la position
begin
  if FDQueryEnt_prof.IsEmpty then Exit;

  NumDevis := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;
  FormEnt_prof := TFormEnt_prof.Create(Self, msModification, NumDevis);

  try
    FormEnt_prof.Caption := 'Modifier le devis';

    if FormEnt_prof.ShowModal = mrOk then
    begin
      // 1. On mémorise la position actuelle avant le rafraîchissement
      Bookmark := FDQueryEnt_prof.GetBookmark;
      try
        FDQueryEnt_prof.Refresh;

        // 2. On tente de se reposer sur l'enregistrement mémorisé
        if FDQueryEnt_prof.BookmarkValid(Bookmark) then
          FDQueryEnt_prof.GotoBookmark(Bookmark);
      except
        // Si l'enregistrement a été supprimé entre-temps, on ignore l'erreur
      end;

      // 3. On libère le signet proprement
      FDQueryEnt_prof.FreeBookmark(Bookmark);
    end;
  finally
    FormEnt_prof.Free;
  end;
end;


procedure TFrameTableDevis.BtnSupprimerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauType: string;
  CodDevCourant: Integer;
begin
  if FDQueryEnt_prof.IsEmpty then Exit;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'F' then
  begin
    ShowMessage('Opération impossible, devis déjà facturé.');
    Exit;
  end;

  // Récupérer la clé unique du devis courant
  CodDevCourant := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if MessageDlg('Supprimer le devis ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Exécution d'un DELETE direct DES LIGNES
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEnt_prof.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM lig_prof WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

  finally
    QryExec.Free;
  end;

  // Suivi d'un DELETE direct et ultra-sécurisé par la clé primaire
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEnt_prof.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM ent_prof WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

    // Rafraîchir la vue pour voir le changement instantanément
    FDQueryEnt_prof.Refresh;
    JvDBGridEnt_prof.SetFocus;
  finally
    QryExec.Free;
  end;
end;


procedure TFrameTableDevis.BtnTransformerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  Qrylig_prof: TFDQuery;
  NumFacture: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;
  wTotregl: Integer;
  WAnnuleSaisie: Boolean;
  CodDevCourant: Integer;

begin

  if FDQueryEnt_prof.IsEmpty then Exit;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'F' then
  begin
    ShowMessage('Opération impossible, devis déjà facturé.');
    Exit;
  end;

  // Récupérer la clé unique du devis courant
  CodDevCourant := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if MessageDlg('Transformer le devis ' + IntToStr(CodDevCourant) + ' en facture ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Conversion en nombre total de secondes depuis minuit
  LHeure := Now; // ou un champ heure
  DecodeTime(Now, H, M, S, MS);
  Centiemes := MS div 10; // Conversion des millisecondes en centièmes
  // Construction de l'entier : HH * 1000000 + MM * 10000 + SS * 100 + CC
  ResultHeure := (H * 360000) + (M * 6000) + (S * 100) + Centiemes;


  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec2 := TFDQuery.Create(nil);
  Qrylig_prof := TFDQuery.Create(nil);

  try
    Screen.Cursor := crHourGlass; // Change le curseur en sablier

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;
    Qrylig_prof.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la TRANSACTION MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      // ==========================================
      // ENREGISTREMENT DE L'EN-TÊTE
      // ==========================================
      // Incrementation numero de facture + 1 dans chrono
      QryExec.SQL.Text := 'UPDATE chrono set CHRONO=CHRONO+1 WHERE PREFIX=:PREFIX';
      QryExec.ParamByName('PREFIX').AsString := 'FAC01';
      QryExec.ExecSQL;
      QryExec.Close;
      //Recuperation nouveau numero chrono
      QryExec.SQL.Text := 'SELECT * FROM chrono WHERE PREFIX=:PREFIX';
      QryExec.ParamByName('PREFIX').AsString := 'FAC01';
      QryExec.Open;
      NumFacture := QryExec.FieldByName('CHRONO').AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

      // Appel de la procédure mutualisée
      QryExec.close;
      DM_Olivier.ExecuterInsertionEntVteJJ(FDQueryEnt_prof, QryExec, CodDevCourant, NumFacture);


      QryExec.Close;

      // Parcours de la table mémoire des lignes
      Qrylig_prof.SQL.Text := 'SELECT * FROM lig_prof WHERE CODDEV=:CODDEV';
      Qrylig_prof.ParamByName('CODDEV').AsInteger := CodDevCourant;
      Qrylig_prof.Open;
      Qrylig_prof.First;
      while not Qrylig_prof.Eof do
      begin
        //Génération du mouvement de stock associé a la ligne
        VNoEnrStock :=0;
        //Controle si article géré en stock
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryExec.ParamByName('CODART').AsString :=Qrylig_prof.FieldByName('CODART').AsString;
        QryExec.Open;
        if QryExec.FieldByName('G_STO').AsInteger=1 then
        begin
           //Creation par securite du stodep
           QryExec2.Close;
           QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                            'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
           QryExec2.ParamByName('CODART').AsString :=Qrylig_prof.FieldByName('CODART').AsString;
           QryExec2.ParamByName('CODDEP').AsInteger :=FDQueryEnt_prof.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('PMP').AsFloat :=QryExec.FieldByName('PMP').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString :=QryExec.FieldByName('CODFOU').AsString;
           QryExec2.ExecSQL;

           //Insertion stock
           QryExec2.Close;
           //     ShowMessage(Qrylig_prof.FieldByName('CODART').AsString);
           QryExec2.SQL.Text := 'INSERT INTO stock (CODART, DATE_, ANNEE, MOIS, TYPE_, QTE, VALUNIT, PRIXVTE, CODDEP, CENTRA, LIBELLE, CODFOU, TIME, CODFAC) ' +
                            'VALUES (:CODART, :DATE_, :ANNEE, :MOIS, :TYPE_, :QTE, :VALUNIT, :PRIXVTE, :CODDEP, :CENTRA, :LIBELLE, :CODFOU, :TIME, :CODFAC)';
           QryExec2.ParamByName('CODFAC').AsInteger := NumFacture;
           QryExec2.ParamByName('CODART').AsString := Qrylig_prof.FieldByName('CODART').AsString;
           QryExec2.ParamByName('QTE').AsFloat := -Qrylig_prof.FieldByName('QTE').AsFloat;
           QryExec2.ParamByName('PRIXVTE').AsFloat := Qrylig_prof.FieldByName('PRIXNET').AsFloat;
           QryExec2.ParamByName('VALUNIT').AsFloat := Qrylig_prof.FieldByName('PRIXREV').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := Qrylig_prof.FieldByName('CODFOU').AsString;
           QryExec2.ParamByName('DATE_').AsDateTime := Now;
           QryExec2.ParamByName('ANNEE').AsInteger := Qrylig_prof.FieldByName('ANNEE').AsInteger;
           QryExec2.ParamByName('MOIS').AsInteger := Qrylig_prof.FieldByName('MOIS').AsInteger;
           QryExec2.ParamByName('CODDEP').AsInteger := FDQueryEnt_prof.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('CENTRA').AsString := 'C';
           QryExec2.ParamByName('LIBELLE').AsString := 'Facture DELPHI n°' + IntToStr(NumFacture);
           QryExec2.ParamByName('TYPE_').AsString := 'V';
           QryExec2.ParamByName('TIME').AsInteger := ResultHeure;
           QryExec2.ExecSQL;

           // 2. Récupération du NOENR tout juste généré par MySQL pour la table stock
           QryExec2.Close;
           QryExec2.SQL.Text := 'SELECT LAST_INSERT_ID()';
           QryExec2.Open;
           VNoEnrStock := QryExec2.Fields[0].AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

           //On recalcul le stock du depot et de l'article
           DM_Olivier.RecalculerStockStodep(Qrylig_prof.FieldByName('CODART').AsString, FDQueryEnt_prof.FieldByName('CODDEP').AsInteger);

        end;


        QryExec.Close;

        //Insertion ligvtejj par appel de la procédure mutualisée pour chaque ligne
        DM_Olivier.ExecuterInsertionLigVteJJ(Qrylig_prof, QryExec, CodDevCourant, NumFacture, VNoEnrStock);

        //Lecture ligne memoire suivante
        Qrylig_prof.Next;
      end;

      // Mise a jour TYPE_ Facturé
      QryExec.SQL.Text := 'UPDATE ent_prof SET TYPE_ = ''F'', CODFAC = :CODFAC WHERE CODDEV = :CODDEV';
      QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
      QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
      QryExec.ExecSQL;

      QryExec.SQL.Text := 'UPDATE lig_prof SET TYPE_ = ''F'', CODFAC = :CODFAC WHERE CODDEV = :CODDEV';
      QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
      QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
      QryExec.ExecSQL;

      // TRANSACTION: Si tout s'est déroulé sans erreur, on valide définitivement dans MySQL
      DMGesCloud.ConnexionGesCloud.Commit;

    except
      on E: Exception do
      begin
        // TRANSACTION: En cas d'erreur, on annule tout (ni l'en-tête ni les lignes ne sont modifiés)
        DMGesCloud.ConnexionGesCloud.Rollback;
        ShowMessage('Erreur lors de l''enregistrement : ' + E.Message);;
      end;
    end;
  finally
    QryExec.Free;
    QryExec2.Free;
    Qrylig_prof.Free;

    FDQueryEnt_prof.Refresh;

    Screen.Cursor := crDefault; // Restaure le curseur normal
  end;
end;


procedure TFrameTableDevis.CheckBoxNatureClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;

procedure TFrameTableDevis.CheckBoxToutesFacturesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;


procedure TFrameTableDevis.AppliquerFiltreMaitre;
var
  FiltreNature, FiltreCaisse: string;
begin
  // On rafraîchit la requête si modifiée entre temps
  FDQueryEnt_prof.Refresh;

  // 1. Définition du filtre selon l'option sélectionnée dans le TRadioGroup
  // ItemIndex 0 = F (Facturés), 1 = D (Non facturés), 2 = O (Oubliés)
  case RadioGroupEtat.ItemIndex of
    0:
    begin
      FiltreNature := '(type_ = ''F'')';
      BtnOublier.Caption:='Oublier';
      BtnOublier.Enabled:=False;
      BtnSupprimer.Enabled:=False;
      BtnTransformer.Enabled:=False;
    end;
    1:
    begin
      FiltreNature := '(type_ = ''D'')';
      BtnOublier.Caption:='Oublier';
      BtnOublier.Enabled:=True;
      BtnSupprimer.Enabled:=True;
      BtnTransformer.Enabled:=True;
    end;
    2:
    begin
      FiltreNature := '(type_ = ''O'')';
      BtnOublier.Caption:='Rappeler';
      BtnOublier.Enabled:=True;
      BtnSupprimer.Enabled:=True;
      BtnTransformer.Enabled:=False;
    end
  else
    FiltreNature := '(1=1)'; // Par sécurité si rien n'est sélectionné
    BtnOublier.Caption:='Oublier';
    BtnOublier.Enabled:=True;
    BtnSupprimer.Enabled:=True;
    BtnTransformer.Enabled:=True;
  end;

  // 2. Définition du filtre sur la caisse
  if CheckBoxToutesFactures.Checked then
    FiltreCaisse := '(codcai <> ''ZZ'')'
  else
    FiltreCaisse := '(codcai = ' + QuotedStr(DM_Olivier.Gcodcai) + ')';

  // 3. On combine l'ensemble avec "and" (en minuscules) et des parenthèses
  FDQueryEnt_prof.Filter := FiltreNature + ' and ' + FiltreCaisse;
  FDQueryEnt_prof.Filtered := True;
end;

constructor TFrameTableDevis.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryEnt_prof.Close;
  FDQueryEnt_prof.Open;

  //Factures du poste par defaut
  //AppliquerFiltreMaitre();
end;


procedure TFrameTableDevis.EditCherche_SELChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEnt_prof);
end;

procedure TFrameTableDevis.EdtCherche_CODDEVChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEnt_prof);
end;

procedure TFrameTableDevis.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEnt_prof);
end;


procedure TFrameTableDevis.FDQueryEnt_profCalcFields(DataSet: TDataSet);
begin
  if not FDQueryEnt_prof.FieldByName('HEURE').IsNull then
  begin
    // On appelle votre fonction placée dans le DataModule
    FDQueryEnt_prof.FieldByName('HeureLisible').AsString :=
      DM_Olivier.CentièmesVersHeureLisible(FDQueryEnt_prof.FieldByName('HEURE').AsLargeInt);
  end
  else
    FDQueryEnt_prof.FieldByName('HeureLisible').AsString := '';
end;


procedure TFrameTableDevis.frxReportDevisBeforePrint(
  Sender: TfrxReportComponent);
var
  CheminLogo: string;
begin
  // 1. Détecter le moment où l'objet image va être dessiné
  if Sender.Name = 'LogoEntreprise' then
  begin
    // 2. Définir le chemin (Exemple : un dossier "Images" situé à côté de votre exécutable .exe)
    CheminLogo := DM_Olivier.FDQueryCtrstock.FieldByName('LOGO').AsString;

    // 3. Charger l'image dynamiquement si le fichier existe
    if FileExists(CheminLogo) then
    begin
      TfrxPictureView(Sender).Picture.LoadFromFile(CheminLogo); // Charge l'image
    end
    else
    begin
      // Sécurité : Si le logo est absent, on peut masquer le bloc pour éviter un carré vide
      TfrxPictureView(Sender).Visible := False;
    end;
  end;
end;


procedure TFrameTableDevis.JvDBGridEnt_profTitleBtnClick(Sender: TObject;
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

procedure TFrameTableDevis.RadioGroupEtatClick(Sender: TObject);
begin
  AppliquerFiltreMaitre();
end;

end.
