unit U_TableEntvteaa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxExportBaseDialog, frxExportPDF, frCoreClasses, frxDBSet;

type
  TFrameTableEntvteaa = class(TFrame)
    Panel2: TPanel;
    BtnOuvrir: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridEntvteaa: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODFAC: TEdit;
    EdtCherche_NOM: TEdit;
    EditCherche_SEL: TEdit;
    CheckBoxToutesFactures: TCheckBox;
    EditCherche_DATE_: TEdit;
    EditCherche_CODCLI: TEdit;
    EditCherche_CODCAI: TEdit;
    FDQueryEntvteaa: TFDQuery;
    StringField1: TStringField;
    LargeintField1: TLargeintField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    LargeintField2: TLargeintField;
    ShortintField1: TShortintField;
    SmallintField1: TSmallintField;
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
    IntegerField5: TIntegerField;
    StringField10: TStringField;
    SmallintField11: TSmallintField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField11: TStringField;
    BCDField11: TBCDField;
    BCDField12: TBCDField;
    BCDField13: TBCDField;
    SmallintField13: TSmallintField;
    BCDField14: TBCDField;
    BCDField15: TBCDField;
    BooleanField1: TBooleanField;
    StringField12: TStringField;
    DSEntvteaa: TDataSource;
    BtnImprimer: TButton;
    frxDBDatasetReglements: TfrxDBDataset;
    frxDBDatasetTVA: TfrxDBDataset;
    frxPDFExportFacture: TfrxPDFExport;
    frxDBDatasetFacture: TfrxDBDataset;
    frxReportFacture: TfrxReport;
    FDQueryReglements: TFDQuery;
    FDQueryTVA: TFDQuery;
    FDQueryTVANoTVA: TLargeintField;
    FDQueryTVALibelle: TStringField;
    FDQueryTVATaux: TFMTBCDField;
    FDQueryTVABaseHT: TBCDField;
    FDQueryTVAMontantTVA: TBCDField;
    FDQueryFacture: TFDQuery;
    FDQueryFactureOBSERV: TStringField;
    FDQueryFactureCODFAC: TLargeintField;
    FDQueryFactureCODCLI: TIntegerField;
    FDQueryFactureCODCAI: TStringField;
    FDQueryFactureCODDEV: TLargeintField;
    FDQueryFactureCODDEP: TShortintField;
    FDQueryFactureCODVEN: TSmallintField;
    FDQueryFactureNOM: TStringField;
    FDQueryFactureNOTAHITI: TStringField;
    FDQueryFactureTYPE_: TStringField;
    FDQueryFactureEXO_TVA: TSmallintField;
    FDQueryFactureANNEE: TIntegerField;
    FDQueryFactureMOIS: TSmallintField;
    FDQueryFactureDATE_: TDateField;
    FDQueryFactureHEURE: TIntegerField;
    FDQueryFactureMT_REMISE: TIntegerField;
    FDQueryFacturePRC_REMISE: TBCDField;
    FDQueryFactureTOTHT: TBCDField;
    FDQueryFactureMT_TTC: TLargeintField;
    FDQueryFactureMT_HT0: TBCDField;
    FDQueryFactureMT_HT1: TBCDField;
    FDQueryFactureMT_HT2: TBCDField;
    FDQueryFactureMT_HT3: TBCDField;
    FDQueryFactureMT_TVA1: TBCDField;
    FDQueryFactureMT_TVA2: TBCDField;
    FDQueryFactureMT_TVA3: TBCDField;
    FDQueryFactureMT_TVA: TBCDField;
    FDQueryFactureMARGE: TLargeintField;
    FDQueryFactureREFERENCE_: TStringField;
    FDQueryFactureCODREP: TSmallintField;
    FDQueryFactureNO_SEM: TSmallintField;
    FDQueryFactureNO_JOUR: TSmallintField;
    FDQueryFactureCODPAI: TStringField;
    FDQueryFactureJRSCRD: TSmallintField;
    FDQueryFactureFIN_MOIS: TSmallintField;
    FDQueryFactureLIBREG: TStringField;
    FDQueryFactureCRD_FORCE: TSmallintField;
    FDQueryFactureDATE_ECH: TDateField;
    FDQueryFactureREGL: TSmallintField;
    FDQueryFactureDATE_OPER: TDateField;
    FDQueryFactureDATE_COMPTA: TDateField;
    FDQueryFactureACOMPTE: TIntegerField;
    FDQueryFactureCODGEO: TStringField;
    FDQueryFactureFLAG_TAX: TSmallintField;
    FDQueryFactureSELECT_: TSmallintField;
    FDQueryFactureDER_MODIF: TSQLTimeStampField;
    FDQueryFactureCODADM: TStringField;
    FDQueryFactureNOMVEN: TStringField;
    FDQueryFactureMT_TSOC: TBCDField;
    FDQueryFactureMT_HTSOC: TBCDField;
    FDQueryFactureTX_TSOC: TBCDField;
    FDQueryFactureEXO_CPS: TSmallintField;
    FDQueryFactureMT_TVAI: TBCDField;
    FDQueryFactureMT_HTI: TBCDField;
    FDQueryFactureTVA_ILES: TBooleanField;
    FDQueryFactureOBSERV_1: TMemoField;
    FDQueryFactureCODCLI_1: TIntegerField;
    FDQueryFactureCPTAUX: TStringField;
    FDQueryFactureNOM_1: TStringField;
    FDQueryFactureCODREP_1: TSmallintField;
    FDQueryFacturePRC_REMISE_1: TBCDField;
    FDQueryFactureNOTEL: TStringField;
    FDQueryFactureNOTAHITI_1: TStringField;
    FDQueryFactureNOFAX: TStringField;
    FDQueryFactureJRSCRD_1: TSmallintField;
    FDQueryFactureCREDIT: TLargeintField;
    FDQueryFactureplaf_crd: TIntegerField;
    FDQueryFactureCODPAI_1: TStringField;
    FDQueryFactureFIN_MOIS_1: TSmallintField;
    FDQueryFactureNB_EX: TSmallintField;
    FDQueryFactureCAAN: TLargeintField;
    FDQueryFactureAD1: TStringField;
    FDQueryFactureAD2: TStringField;
    FDQueryFactureAD3: TStringField;
    FDQueryFactureCUM_MVT: TSmallintField;
    FDQueryFactureMT_CPTA: TLargeintField;
    FDQueryFactureEXO_TVA_1: TSmallintField;
    FDQueryFactureBLOQUE: TSmallintField;
    FDQueryFactureCODGEO_1: TStringField;
    FDQueryFactureEMAIL: TStringField;
    FDQueryFactureCODTAR: TStringField;
    FDQueryFactureADM: TSmallintField;
    FDQueryFactureFLAG_TAX_1: TSmallintField;
    FDQueryFactureCODFAC_ADM: TStringField;
    FDQueryFactureFERME: TSmallintField;
    FDQueryFactureDER_MODIF_1: TSQLTimeStampField;
    FDQueryFactureSPEC_GOUV: TSmallintField;
    FDQueryFactureNOGSM: TLargeintField;
    FDQueryFacturePLV: TSmallintField;
    FDQueryFactureINTIT_BQ: TStringField;
    FDQueryFactureCODE_BQ: TStringField;
    FDQueryFactureCODE_GUI: TStringField;
    FDQueryFactureNOCPT: TStringField;
    FDQueryFactureCLE: TStringField;
    FDQueryFactureCOEF_MAJ_PR: TBCDField;
    FDQueryFactureEXO_CPS_1: TSmallintField;
    FDQueryFacturePAS_REM: TSmallintField;
    FDQueryFactureREM_FAM: TSmallintField;
    FDQueryFactureRELEVE_EMAIL: TBooleanField;
    FDQueryFactureSELECT__1: TBooleanField;
    FDQueryFactureAPP_TARIFCLI: TBooleanField;
    FDQueryFactureTVA_ILES_1: TBooleanField;
    FDQueryFactureLIBELLE: TMemoField;
    FDQueryFactureCODFAC_1: TLargeintField;
    FDQueryFactureCODCLI_2: TIntegerField;
    FDQueryFactureCODCAI_1: TStringField;
    FDQueryFactureCODDEV_1: TLargeintField;
    FDQueryFactureCODDEP_1: TShortintField;
    FDQueryFactureCODVEN_1: TSmallintField;
    FDQueryFactureNOENR: TIntegerField;
    FDQueryFactureANNEE_1: TIntegerField;
    FDQueryFactureMOIS_1: TSmallintField;
    FDQueryFactureDATE__1: TDateField;
    FDQueryFactureHEURE_1: TIntegerField;
    FDQueryFactureCODREP_2: TSmallintField;
    FDQueryFactureCODFOU: TStringField;
    FDQueryFactureCODFAM: TStringField;
    FDQueryFactureCODSSF: TStringField;
    FDQueryFactureCODDPT: TStringField;
    FDQueryFactureTYPE__1: TStringField;
    FDQueryFactureCODART: TStringField;
    FDQueryFactureCODBAR: TStringField;
    FDQueryFactureQTE: TBCDField;
    FDQueryFacturePOIDS: TBCDField;
    FDQueryFactureCODTAR_1: TStringField;
    FDQueryFacturePRIXHT: TBCDField;
    FDQueryFacturePRIXTTC: TLargeintField;
    FDQueryFacturePRIXNET: TBCDField;
    FDQueryFactureTOTHT_1: TBCDField;
    FDQueryFactureMT_TTC_1: TLargeintField;
    FDQueryFacturePRC_REMISE_2: TBCDField;
    FDQueryFactureMT_REMISE_1: TIntegerField;
    FDQueryFactureTX_TVA: TBCDField;
    FDQueryFactureMT_TVA_1: TBCDField;
    FDQueryFactureNO_TVA: TSmallintField;
    FDQueryFacturePRIXREV: TBCDField;
    FDQueryFactureMARGE_1: TLargeintField;
    FDQueryFactureNO_SEM_1: TSmallintField;
    FDQueryFactureNO_JOUR_1: TSmallintField;
    FDQueryFactureDATE_OPER_1: TDateField;
    FDQueryFactureDATE_COMPTA_1: TDateField;
    FDQueryFactureDET_PPT: TLargeintField;
    FDQueryFactureDET_ILE: TLargeintField;
    FDQueryFactureSELECT__2: TSmallintField;
    FDQueryFactureNOENRF: TIntegerField;
    FDQueryFacturePXLVTTC: TLargeintField;
    FDQueryFactureDER_MODIF_2: TSQLTimeStampField;
    FDQueryFactureTX_TSOC_1: TBCDField;
    FDQueryFactureMT_TSOC_1: TBCDField;
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
    procedure JvDBGridEntvteaaTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CODFACChange(Sender: TObject);
    procedure EditCherche_SELChange(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure FDQueryEntvtejjCalcFields(DataSet: TDataSet);
    procedure JvDBGridEntvteaaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnImprimerClick(Sender: TObject);
    procedure frxReportFactureBeforePrint(Sender: TfrxReportComponent);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide, U_FicheFacture, U_FormCentraVentes, U_ReportFactureMem;


procedure TFrameTableEntvteaa.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entvteaa_liste.html');
end;


procedure TFrameTableEntvteaa.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableEntvteaa.BtnImprimerClick(Sender: TObject);
var
  FormFactureMemPrint: TFormFactureMemPrint;
  QryEnt, QryLig, QryReg: TFDQuery;
  ACodFac: Integer;
begin

  // 1. Lire vos paramètres globaux (via une requête ou un fichier de config)
  DM_Olivier.FDQueryCtrstock.open;

  if DM_Olivier.FDQueryCtrstock.IsEmpty then
    Exit;

     // 2. Charger le modèle d'état externe
    frxReportFacture.LoadFromFile('Facture.fr3');

  // 2. Vider les variables mémoire pour repartir proprement
  frxReportFacture.Variables.Clear;

  // 3. CRÉER AUTOMATIQUEMENT la catégorie et les variables
  // ATTENTION : FastReport impose de créer au moins une catégorie (commençant par un espace)
  // avant d'y injecter des variables.
  frxReportFacture.Variables[' ' + 'Globales'] := Null;

  // On ajoute les variables à la catégorie qui vient d'être créée
  frxReportFacture.Variables.AddVariable('Globales','VarNomEntreprise',
  ( DM_Olivier.FDQueryCtrstock.FieldByName('Nom').AsString + #13#10 +
    DM_Olivier.FDQueryCtrstock.FieldByName('Nom2').AsString ));
  frxReportFacture.Variables.AddVariable('Globales','VarTelephone', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Tel').AsString));
  frxReportFacture.Variables.AddVariable('Globales','VarAdresse', DM_Olivier.FDQueryCtrstock.FieldByName('Adresse').AsString);
  frxReportFacture.Variables.AddVariable('Globales','VarNoTAHITI', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('NOTAHITI').AsString));
  frxReportFacture.Variables.AddVariable('Globales','VarLOGO', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('LOGO').AsString));
  frxReportFacture.Variables.AddVariable('Globales','VarEMAIL', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('EMAIL').AsString));
  frxReportFacture.Variables.AddVariable('Globales','VarFAX', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('FAX').AsString));
  frxReportFacture.Variables.AddVariable('Globales','VarRC', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('RC').AsString));
  frxReportFacture.Variables.AddVariable('Globales','VarMEMO_FAC', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('MEMO_FAC').AsString));
  frxReportFacture.Variables.AddVariable('Globales','VarRef_Bancaire', DM_Olivier.FDQueryCtrstock.FieldByName('BANQUE').AsString);
  frxReportFacture.Variables.AddVariable('Globales','VarTotalAlpha',QuotedStr('Facture arrêtée à la somme de : ' +
    DMGesCloud.MontantenLettres(FDQueryEntvteaa.FieldByName('MT_TTC').AsInteger) + ' Francs CFP.'));

  //Lecture representant
  DM_Olivier.FDQueryRepres.SQL.Text:='select * from repres where codrep=:codrep';
  DM_Olivier.FDQueryRepres.ParamByName('CODREP').AsInteger:= FDQueryEntvteaa.FieldByName('CODREP').AsInteger;
  DM_Olivier.FDQueryRepres.Open;
  frxReportFacture.Variables.AddVariable('Globales','VarRepres', QuotedStr(DM_Olivier.FDQueryRepres.FieldByName('NOM').AsString));

  // 1. Activer la requête SQL contenant les données du devis
  //FDQueryDevis.ParamByName('CODFAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
  FDQueryFacture.Open;

  FDQueryTVA.ParamByName('CODFAC').AsInteger := FDQueryEntvteaa.FieldByName('CODFAC').AsInteger;
  FDQueryTVA.Open;

  FDQueryReglements.ParamByName('CODFAC').AsInteger := FDQueryEntvteaa.FieldByName('CODFAC').AsInteger;
  FDQueryReglements.Open;

  // 2. Charger le modèle visuel externe (.fr3)
  //frxReportFacture.LoadFromFile('Facture.fr3');

  // 3. Afficher l'aperçu avant impression à l'écran
  frxReportFacture.ShowReport;

  EXIT;

  if FDQueryEntvteaa.IsEmpty then Exit;

  // 1. On récupère le code de la facture actuellement sélectionnée dans la grille
  ACodFac := FDQueryEntvteaa.FieldByName('CODFAC').AsInteger;

  // 2. On crée des requêtes dédiées et isolées pour l'impression de cette facture
  QryEnt := TFDQuery.Create(nil);
  QryLig := TFDQuery.Create(nil);
  QryReg := TFDQuery.Create(nil);
  try
    QryEnt.Connection := DMGesCloud.ConnexionGesCloud;
    QryLig.Connection := DMGesCloud.ConnexionGesCloud;
    QryReg.Connection := DMGesCloud.ConnexionGesCloud;

    // On sélectionne uniquement l'en-tête, les lignes et les règlements de CE code facture
    QryEnt.SQL.Text := 'SELECT * FROM entvteaa WHERE codfac = :CodFac';
    QryEnt.ParamByName('CodFac').AsInteger := ACodFac;
    QryEnt.Open;

    QryLig.SQL.Text := 'SELECT * FROM ligvteaa WHERE codfac = :CodFac';
    QryLig.ParamByName('CodFac').AsInteger := ACodFac;
    QryLig.Open;

    QryReg.SQL.Text := 'SELECT * FROM reglaa WHERE codfac = :CodFac';
    QryReg.ParamByName('CodFac').AsInteger := ACodFac;
    QryReg.Open;

    // 3. On lance l'impression avec ces données strictement filtrées
    FormFactureMemPrint := TFormFactureMemPrint.Create(nil);
    try
      FormFactureMemPrint.ImprimerFacture(QryEnt, QryLig, QryReg);
    finally
      FormFactureMemPrint.Free;
    end;

  finally
    QryEnt.Free;
    QryLig.Free;
    QryReg.Free;
  end;
end;


procedure TFrameTableEntvteaa.BtnOuvrirClick(Sender: TObject);
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


procedure TFrameTableEntvteaa.CheckBoxToutesFacturesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;


procedure TFrameTableEntvteaa.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete si modifiee entre temps
  FDQueryEntvteaa.Refresh;

  if CheckBoxToutesFactures.Checked then
    FiltreSQL := 'codcai <> ''ZZ'''
  else
    FiltreSQL := 'codcai = ' +  QuotedStr(DM_Olivier.Gcodcai);  //QuotedStr(Format('%.2d', [DM_Olivier.NumeroPoste]));

  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    FDQueryEntvteaa.Filter := FiltreSQL;
    FDQueryEntvteaa.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    FDQueryEntvteaa.Filtered := False;
  end;
end;


constructor TFrameTableEntvteaa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryEntvteaa.Close;
  FDQueryEntvteaa.Open;

  //Factures du poste par defaut
  //AppliquerFiltreMaitre();
end;


procedure TFrameTableEntvteaa.EditCherche_SELChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvteaa);
end;

procedure TFrameTableEntvteaa.EdtCherche_CODFACChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvteaa);
end;

procedure TFrameTableEntvteaa.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvteaa);
end;


procedure TFrameTableEntvteaa.FDQueryEntvtejjCalcFields(DataSet: TDataSet);
begin
  if not FDQueryEntvteaa.FieldByName('HEURE').IsNull then
  begin
    // On appelle votre fonction placée dans le DataModule
    FDQueryEntvteaa.FieldByName('HeureLisible').AsString :=
      DM_Olivier.CentièmesVersHeureLisible(FDQueryEntvteaa.FieldByName('HEURE').AsLargeInt);
  end
  else
    FDQueryEntvteaa.FieldByName('HeureLisible').AsString := '';
end;


procedure TFrameTableEntvteaa.frxReportFactureBeforePrint(
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

procedure TFrameTableEntvteaa.JvDBGridEntvteaaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Si avoir
  if Assigned(JvDBGridEntvteaa.DataSource) and Assigned(JvDBGridEntvteaa.DataSource.DataSet) then
  begin
    if JvDBGridEntvteaa.DataSource.DataSet.FieldByName('TYPE_').AsString = 'A' then
    begin
      // Change la couleur du fond de la cellule
      JvDBGridEntvteaa.Canvas.Brush.Color := clRed;
      // Change la couleur du texte
      JvDBGridEntvteaa.Canvas.Font.Color := clWhite;
    end;
  end;

  // L'instruction indispensable pour appliquer le dessin par défaut avec nos modifications de couleurs
  JvDBGridEntvteaa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrameTableEntvteaa.JvDBGridEntvteaaTitleBtnClick(Sender: TObject;
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

end.
