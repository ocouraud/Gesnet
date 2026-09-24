unit U_TableEntvtejj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxExportBaseDialog, frxExportPDF, frCoreClasses, frxDBSet, Printers;

type
  TFrameTableEntvtejj = class(TFrame)
    Panel2: TPanel;
    BtnAjouter: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnSuspendre: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridEntvtejj: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODFAC: TEdit;
    EdtCherche_NOM: TEdit;
    EditCherche_SEL: TEdit;
    CheckBoxToutesFactures: TCheckBox;
    FDQueryEntvtejj: TFDQuery;
    DSEntvtejj: TDataSource;
    FDQueryEntvtejjOBSERV: TStringField;
    FDQueryEntvtejjCODFAC: TLargeintField;
    FDQueryEntvtejjTOP_: TStringField;
    FDQueryEntvtejjCODCLI: TIntegerField;
    FDQueryEntvtejjCODCAI: TStringField;
    FDQueryEntvtejjCODDEV: TLargeintField;
    FDQueryEntvtejjCODDEP: TShortintField;
    FDQueryEntvtejjCODVEN: TSmallintField;
    FDQueryEntvtejjNOM: TStringField;
    FDQueryEntvtejjNOTAHITI: TStringField;
    FDQueryEntvtejjTYPE_: TStringField;
    FDQueryEntvtejjEXO_TVA: TSmallintField;
    FDQueryEntvtejjANNEE: TIntegerField;
    FDQueryEntvtejjMOIS: TSmallintField;
    FDQueryEntvtejjDATE_: TDateField;
    FDQueryEntvtejjHEURE: TIntegerField;
    FDQueryEntvtejjPRC_REMISE: TBCDField;
    FDQueryEntvtejjMT_REMISE: TIntegerField;
    FDQueryEntvtejjTOTHT: TBCDField;
    FDQueryEntvtejjMT_TTC: TLargeintField;
    FDQueryEntvtejjMT_HT0: TBCDField;
    FDQueryEntvtejjMT_HT1: TBCDField;
    FDQueryEntvtejjMT_HT2: TBCDField;
    FDQueryEntvtejjMT_HT3: TBCDField;
    FDQueryEntvtejjMT_TVA1: TBCDField;
    FDQueryEntvtejjMT_TVA2: TBCDField;
    FDQueryEntvtejjMT_TVA3: TBCDField;
    FDQueryEntvtejjMT_TVA: TBCDField;
    FDQueryEntvtejjMARGE: TLargeintField;
    FDQueryEntvtejjREFERENCE_: TStringField;
    FDQueryEntvtejjCODREP: TSmallintField;
    FDQueryEntvtejjNO_SEM: TSmallintField;
    FDQueryEntvtejjNO_JOUR: TSmallintField;
    FDQueryEntvtejjREGL: TSmallintField;
    FDQueryEntvtejjCODPAI: TStringField;
    FDQueryEntvtejjJRSCRD: TSmallintField;
    FDQueryEntvtejjFIN_MOIS: TSmallintField;
    FDQueryEntvtejjLIBREG: TStringField;
    FDQueryEntvtejjCRD_FORCE: TSmallintField;
    FDQueryEntvtejjdate_ech: TDateField;
    FDQueryEntvtejjACOMPTE: TIntegerField;
    FDQueryEntvtejjCODGEO: TStringField;
    FDQueryEntvtejjFLAG_TAX: TSmallintField;
    FDQueryEntvtejjSEL: TSmallintField;
    FDQueryEntvtejjDER_MODIF: TSQLTimeStampField;
    FDQueryEntvtejjNOMVEN: TStringField;
    FDQueryEntvtejjMT_TSOC: TBCDField;
    FDQueryEntvtejjMT_HTSOC: TBCDField;
    FDQueryEntvtejjTX_TSOC: TBCDField;
    FDQueryEntvtejjEXO_CPS: TSmallintField;
    FDQueryEntvtejjMT_TVAI: TBCDField;
    FDQueryEntvtejjMT_HTI: TBCDField;
    FDQueryEntvtejjTVA_ILES: TBooleanField;
    EditCherche_DATE_: TEdit;
    EditCherche_CODCLI: TEdit;
    EditCherche_CODCAI: TEdit;
    FDQueryEntvtejjHeureLisible: TStringField;
    BtnCentralisation: TButton;
    BtnImprimer: TButton;
    FDQueryFacture: TFDQuery;
    FDQueryTVA: TFDQuery;
    FDQueryTVANoTVA: TLargeintField;
    FDQueryTVALibelle: TStringField;
    FDQueryTVATaux: TFMTBCDField;
    FDQueryTVABaseHT: TBCDField;
    FDQueryTVAMontantTVA: TBCDField;
    frxDBDatasetTVA: TfrxDBDataset;
    frxPDFExportFacture: TfrxPDFExport;
    frxDBDatasetFacture: TfrxDBDataset;
    frxReportFacture: TfrxReport;
    FDQueryFactureOBSERV: TStringField;
    FDQueryFactureCODFAC: TLargeintField;
    FDQueryFactureTOP_: TStringField;
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
    FDQueryFacturePRC_REMISE: TBCDField;
    FDQueryFactureMT_REMISE: TIntegerField;
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
    FDQueryFactureREGL: TSmallintField;
    FDQueryFactureCODPAI: TStringField;
    FDQueryFactureJRSCRD: TSmallintField;
    FDQueryFactureFIN_MOIS: TSmallintField;
    FDQueryFactureLIBREG: TStringField;
    FDQueryFactureCRD_FORCE: TSmallintField;
    FDQueryFacturedate_ech: TDateField;
    FDQueryFactureACOMPTE: TIntegerField;
    FDQueryFactureCODGEO: TStringField;
    FDQueryFactureFLAG_TAX: TSmallintField;
    FDQueryFactureSEL: TSmallintField;
    FDQueryFactureDER_MODIF: TSQLTimeStampField;
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
    FDQueryFactureSELECT_: TBooleanField;
    FDQueryFactureAPP_TARIFCLI: TBooleanField;
    FDQueryFactureTVA_ILES_1: TBooleanField;
    FDQueryFactureLIBELLE: TMemoField;
    FDQueryFactureCODFAC_1: TLargeintField;
    FDQueryFactureCODCLI_2: TIntegerField;
    FDQueryFactureCODCAI_1: TStringField;
    FDQueryFactureCODDEV_1: TLargeintField;
    FDQueryFactureCODDEP_1: TShortintField;
    FDQueryFactureNOENR: TIntegerField;
    FDQueryFactureANNEE_1: TIntegerField;
    FDQueryFactureMOIS_1: TSmallintField;
    FDQueryFactureCODREP_2: TSmallintField;
    FDQueryFactureCODFOU: TStringField;
    FDQueryFactureCODSSF: TStringField;
    FDQueryFactureCODFAM: TStringField;
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
    FDQueryFactureDET_PPT: TLargeintField;
    FDQueryFactureDET_ILE: TLargeintField;
    FDQueryFactureNOENRF: TIntegerField;
    FDQueryFacturePXLVTTC: TLargeintField;
    FDQueryFactureDER_MODIF_2: TSQLTimeStampField;
    FDQueryFactureTX_TSOC_1: TBCDField;
    FDQueryFactureMT_TSOC_1: TBCDField;
    FDQueryReglements: TFDQuery;
    frxDBDatasetReglements: TfrxDBDataset;
    BtnTicket: TButton;
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
    procedure JvDBGridEntvtejjTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CODFACChange(Sender: TObject);
    procedure EditCherche_SELChange(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure FDQueryEntvtejjCalcFields(DataSet: TDataSet);
    procedure JvDBGridEntvtejjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGridEntvtejjDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FDQueryEntvtejjAfterScroll(DataSet: TDataSet);
    procedure BtnSuspendreClick(Sender: TObject);
    procedure BtnCentralisationClick(Sender: TObject);
    procedure BtnImprimerClick(Sender: TObject);
    procedure frxReportFactureBeforePrint(Sender: TfrxReportComponent);
    procedure BtnTicketClick(Sender: TObject);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide, U_FicheEntvtejj, U_FormCentraVentes, U_ReportFactureMem;


procedure TFrameTableEntvtejj.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entvtejj_liste.html');
end;

procedure TFrameTableEntvtejj.BtnAjouterClick(Sender: TObject);
begin
  // On crée la fiche en passant le mode Création et le numéro 0 pour nouveau
  FormEntvtejj := TFormEntvtejj.Create(Self, msAjout, 0);
  try
    FormEntvtejj.Caption := 'Créer une nouvelle facture';

    if FormEntvtejj.ShowModal = mrOk then
    begin
      // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
      FDQueryEntvtejj.Refresh;

      // Se positionner sur la nouvelle facture créée dans la grille
      if not FDQueryEntvtejj.IsEmpty then
        FDQueryEntvtejj.Locate('CODFAC', FormEntvtejj.CodFacCree, []);

      if MessageDlg('Imprimer la facture ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        BtnImprimerClick(Sender);

    end;
  finally
    FormEntvtejj.Free;
  end;
end;


procedure TFrameTableEntvtejj.BtnCentralisationClick(Sender: TObject);
begin
  if FDQueryEntvtejj.IsEmpty then Exit;

  FormCentraVentes := TFormCentraVentes.Create(Self);

  try
    FormCentraVentes.Caption := 'Centralisation des ventes non suspendues';

    if FormCentraVentes.ShowModal = mrOk then
    begin
      FDQueryEntvtejj.Refresh;
    end;
  finally
    FormCentraVentes.Free;
  end;
end;


procedure TFrameTableEntvtejj.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableEntvtejj.BtnOuvrirClick(Sender: TObject);
var
  //Fiche: TFormEntvtejj;
  NumFacture: Integer;
begin
  if FDQueryEntvtejj.IsEmpty then Exit;

  // Récupérez le CODFAC depuis la grille de la liste des factures
  NumFacture := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
  FormEntvtejj := TFormEntvtejj.Create(Self, msModification,NumFacture);

  try
    FormEntvtejj.Caption := 'Modifier la facture';

    if FormEntvtejj.ShowModal = mrOk then
    begin
      FDQueryEntvtejj.Refresh;
      if MessageDlg('Imprimer la facture ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        BtnImprimerClick(Sender);
    end;
  finally
    FormEntvtejj.Free;
  end;
end;


procedure TFrameTableEntvtejj.BtnSuspendreClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauTop: string;
  CodFacCourant: Integer;
  TotalRegle, TotalTtc: Currency;
  TopActuel: string;
begin
  if FDQueryEntvtejj.IsEmpty then Exit;

  // Récupération des données nécessaires de la ligne courante
  CodFacCourant := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
  TopActuel     := FDQueryEntvtejj.FieldByName('TOP_').AsString;
  TotalTtc      := FDQueryEntvtejj.FieldByName('mt_ttc').AsCurrency;

  // Détermination du nouveau statut TOP_
  if TopActuel = 'F' then
  begin
    NouveauTop := 'S';
  end
  else
  begin
    // Vérification des règlements via une requête dédiée
    QryExec := TFDQuery.Create(nil);
    try
      QryExec.Connection := DMGesCloud.ConnexionGesCloud;
      QryExec.SQL.Text := 'SELECT SUM(montant) AS totreg FROM regljj WHERE codfac = :codfac';
      QryExec.ParamByName('CODFAC').AsInteger := CodFacCourant;
      QryExec.Open;

      TotalRegle := 0;
      if not QryExec.Eof then
        TotalRegle := QryExec.FieldByName('totreg').AsCurrency;
    finally
      QryExec.Free;
    end;

    // Comparaison des montants
    if TotalRegle = TotalTtc then
      NouveauTop := 'F'
    else
    begin
      ShowMessage('Opération impossible, règlement incomplet.');
      Exit; // On stoppe net si le règlement ne correspond pas
    end;
  end;

  // Exécution de l'UPDATE direct et sécurisé par la clé unique (CODFAC)
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec.SQL.Text := 'UPDATE entvtejj SET TOP_ = :NOUVEAU_TOP WHERE CODFAC = :CODFAC';
    QryExec.ParamByName('NOUVEAU_TOP').AsString := NouveauTop;
    QryExec.ParamByName('CODFAC').AsInteger := CodFacCourant;
    QryExec.ExecSQL;

    // Rafraîchissement propre de la grille
    FDQueryEntvtejj.Refresh;
    JvDBGridEntvtejj.SetFocus;
  finally
    QryExec.Free;
  end;
end;


procedure TFrameTableEntvtejj.BtnTicketClick(Sender: TObject);
var
  QryEnt, QryLig, QryReg: TFDQuery;
  F: TextFile;
  TotalArticles: Double;
  Idx: Integer;
  wDate: TDateTime;
begin
  Idx := Printer.Printers.IndexOf('Ticket');
  if Idx <> -1 then
  begin
    Printer.PrinterIndex := Idx;

//    AssignPrn(F);
    AssignFile(F, 'C:\Users\Administrator\Desktop\Ticket.txt');
    Rewrite(F);
    try
      Writeln(F, 'Test impression...');
    finally
      CloseFile(F);
    end;
  end
  else
  begin
    ShowMessage('Imprimante "Ticket" introuvable !');
    exit;
  end;

  QryEnt := TFDQuery.Create(nil);
  QryLig := TFDQuery.Create(nil);
  QryReg := TFDQuery.Create(nil);
  try
    QryEnt.Connection := DMGesCloud.ConnexionGesCloud;
    QryLig.Connection := DMGesCloud.ConnexionGesCloud;
    QryReg.Connection := DMGesCloud.ConnexionGesCloud;

    DM_Olivier.FDQueryCtrstock.open;


//    // 1. Récupération de l'en-tête (entvtejj)
//    QryEnt.SQL.Text := 'SELECT * FROM entvtejj WHERE CODFAC = :FAC';
//    QryEnt.ParamByName('FAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
//    QryEnt.Open;
//    if QryEnt.IsEmpty then Exit;

    // 2. Récupération des lignes (ligvtejj)
    QryLig.SQL.Text := 'SELECT * FROM ligvtejj WHERE CODFAC = :FAC';
    QryLig.ParamByName('FAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
    QryLig.Open;

    // 3. Récupération des règlements (regljj)
    QryReg.SQL.Text := 'SELECT * FROM regljj WHERE CODFAC = :FAC';
    QryReg.ParamByName('FAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
    QryReg.Open;

    // --- ENVOI VERS L'IMPRIMANTE ---
    // On assigne l'imprimante par défaut de Windows (ou tu peux cibler un nom précis)
//    AssignPrn(F);
    AssignFile(F, 'C:\Users\Administrator\Desktop\Ticket.txt');
    Rewrite(F);
    try
      // En-tête du ticket
      Writeln(F, DM_Olivier.FDQueryCtrstock.FieldByName('NOM').AsString);
      Writeln(F, 'No TAHITI : ' + DM_Olivier.FDQueryCtrstock.FieldByName('NOTAHITI').AsString +
      ' - Tel. : '+ DM_Olivier.FDQueryCtrstock.FieldByName('TEL').AsString);
      Writeln(F, 'Client : ' + FDQueryEntvtejj.FieldByName('CODCLI').AsString + ' ' + FDQueryEntvtejj.FieldByName('NOM').AsString);
      if FDQueryEntvtejj.FieldByName('TYPE_').AsString='F' then
        Writeln(F, 'Facture : ' + FDQueryEntvtejj.FieldByName('CODFAC').AsString +
                 '            ' + FormatDateTime('dd/mm/yyyy', FDQueryEntvtejj.FieldByName('DATE_').AsDateTime) +
                 ' ' + DM_Olivier.CentièmesVersHeureLisible(FDQueryEntvtejj.FieldByName('HEURE').AsInteger))
      else
        Writeln(F, 'Avoir : ' + FDQueryEntvtejj.FieldByName('CODFAC').AsString +
               '            ' + FormatDateTime('dd/mm/yyyy', FDQueryEntvtejj.FieldByName('DATE_').AsDateTime) +
               ' ' + DM_Olivier.CentièmesVersHeureLisible(FDQueryEntvtejj.FieldByName('HEURE').AsInteger));

      Writeln(F, '-----------------------------------------------');

      // En-têtes du tableau
      Writeln(F, Format('%-22s %6s %5s %6s %2s', ['LIBELLE', 'QTE', 'PX', 'TOT', ' TVA']));
      Writeln(F, '-----------------------------------------------');

      TotalArticles := 0;
      wDate:=FDQueryEntvtejj.FieldByName('Date_').AsDateTime;

      // Boucle sur les lignes d'articles (ligvtejj)
      while not QryLig.Eof do
      begin
        Writeln(F, QryLig.FieldByName('LIBELLE').AsString);
        Writeln(F, Format('%29.2f %6.0f %6.0f %2.0f', [
          QryLig.FieldByName('QTE').AsFloat,
          QryLig.FieldByName('PRIXTTC').AsFloat,
          QryLig.FieldByName('MT_TTC').AsFloat,
          QryLig.FieldByName('TX_TVA').AsFloat
        ]));

        TotalArticles := TotalArticles + QryLig.FieldByName('QTE').AsFloat;
        QryLig.Next;
      end;

      Writeln(F, '-----------------------------------------------');

      // Totaux (entvtejj)
      Writeln(F, Format('TOTAL HT. :%27.0f', [FDQueryEntvtejj.FieldByName('TOTHT').AsFloat]));
      Writeln(F, Format('TOTAL TAX :%27.0f', [FDQueryEntvtejj.FieldByName('MT_TVA').AsFloat]));
      Writeln(F, Format('TOTAL TTC :%27.0f', [FDQueryEntvtejj.FieldByName('MT_TTC').AsFloat]));
//      if FDQueryEntvtejj.FieldByName('MT_HT0').AsFloat<>0 then
//        Writeln(F, Format('*TVA 0%%  :%27.0f', 0));
      if FDQueryEntvtejj.FieldByName('MT_HT1').AsFloat<>0 then
        Writeln(F, Format('*TVA %2d%%  :%27.0f', [Trunc(DM_Olivier.fgTxTaxe(wDate,'TVA1')),FDQueryEntvtejj.FieldByName('MT_TVA1').AsFloat]));
      if FDQueryEntvtejj.FieldByName('MT_HT2').AsFloat<>0 then
        Writeln(F, Format('*TVA %2d%%  :%27.0f', [Trunc(DM_Olivier.fgTxTaxe(wDate,'TVA2')),FDQueryEntvtejj.FieldByName('MT_TVA2').AsFloat]));
      if FDQueryEntvtejj.FieldByName('MT_HT3').AsFloat<>0 then
        Writeln(F, Format('*TVA %2d%%  :%27.0f', [Trunc(DM_Olivier.fgTxTaxe(wDate,'TVA3')),FDQueryEntvtejj.FieldByName('MT_TVA3').AsFloat]));
      if FDQueryEntvtejj.FieldByName('MT_HTI').AsFloat<>0 then
        Writeln(F, Format('*TVA %2d%%  :%27.0f', [Trunc(DM_Olivier.fgTxTaxe(wDate,'TVAI')),FDQueryEntvtejj.FieldByName('MT_TVAI').AsFloat]));

      // Règlements (regljj)
      while not QryReg.Eof do
      begin
        Writeln(F, Format('%-15s %22.0f', [
          QryReg.FieldByName('LIBELLE').AsString,
          QryReg.FieldByName('MONTANT').AsFloat
        ]));
        QryReg.Next;
      end;

      Writeln(F, Format('%.0f ARTICLES', [TotalArticles]));
      Writeln(F, 'MERCI - MAURU''URU');

      // Commande ESC/POS optionnelle pour couper le papier (Ex: Epson/Star)
      // Write(F, #27#109);

    finally
      CloseFile(F);
    end;

  finally
    QryEnt.Free;
    QryLig.Free;
    QryReg.Free;
  end;
end;

procedure TFrameTableEntvtejj.BtnImprimerClick(Sender: TObject);
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
    DMGesCloud.MontantenLettres(FDQueryEntvtejj.FieldByName('MT_TTC').AsInteger) + ' Francs CFP.'));
  if FDQueryEntvtejj.FieldByName('TYPE_').AsString='F' then
    frxReportFacture.Variables.AddVariable('Globales','VarLibTypeFacture', QuotedStr('FACTURE'))
  else
    frxReportFacture.Variables.AddVariable('Globales','VarLibTypeFacture', QuotedStr('AVOIR'));

  //Lecture representant
  DM_Olivier.FDQueryRepres.SQL.Text:='select * from repres where codrep=:codrep';
  DM_Olivier.FDQueryRepres.ParamByName('CODREP').AsInteger:= FDQueryEntvtejj.FieldByName('CODREP').AsInteger;
  DM_Olivier.FDQueryRepres.Open;
  frxReportFacture.Variables.AddVariable('Globales','VarRepres', QuotedStr(DM_Olivier.FDQueryRepres.FieldByName('NOM').AsString));

  // 1. Activer la requête SQL contenant les données du devis
  //FDQueryDevis.ParamByName('CODFAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
  FDQueryFacture.Open;

  FDQueryTVA.ParamByName('CODFAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
  FDQueryTVA.Open;

  FDQueryReglements.ParamByName('CODFAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
  FDQueryReglements.Open;

  // 2. Charger le modèle visuel externe (.fr3)
  //frxReportFacture.LoadFromFile('Facture.fr3');

  // 3. Afficher l'aperçu avant impression à l'écran
  frxReportFacture.ShowReport;

  EXIT;


  if FDQueryEntvtejj.IsEmpty then Exit;

  // 1. On récupère le code de la facture actuellement sélectionnée dans la grille
  ACodFac := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;

  // 2. On crée des requêtes dédiées et isolées pour l'impression de cette facture
  QryEnt := TFDQuery.Create(nil);
  QryLig := TFDQuery.Create(nil);
  QryReg := TFDQuery.Create(nil);
  try
    QryEnt.Connection := DMGesCloud.ConnexionGesCloud;
    QryLig.Connection := DMGesCloud.ConnexionGesCloud;
    QryReg.Connection := DMGesCloud.ConnexionGesCloud;

    // On sélectionne uniquement l'en-tête, les lignes et les règlements de CE code facture
    QryEnt.SQL.Text := 'SELECT * FROM entvtejj WHERE codfac = :CodFac';
    QryEnt.ParamByName('CodFac').AsInteger := ACodFac;
    QryEnt.Open;

    QryLig.SQL.Text := 'SELECT * FROM ligvtejj WHERE codfac = :CodFac';
    QryLig.ParamByName('CodFac').AsInteger := ACodFac;
    QryLig.Open;

    QryReg.SQL.Text := 'SELECT * FROM regljj WHERE codfac = :CodFac';
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


procedure TFrameTableEntvtejj.CheckBoxToutesFacturesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;


procedure TFrameTableEntvtejj.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete si modifiee entre temps
  FDQueryEntvtejj.Refresh;

  if CheckBoxToutesFactures.Checked then
    FiltreSQL := 'codcai <> ''ZZ'''
  else
    FiltreSQL := 'codcai = ' +  QuotedStr(DM_Olivier.Gcodcai);  //QuotedStr(Format('%.2d', [DM_Olivier.NumeroPoste]));

   //MessageDlg(FiltreSQL, mtInformation, [mbOk], 0);

  // 2. On vérifie si le champ Nom contient du texte
  //if EdtCherche_Nom.Text <> '' then
  //begin
  //  if FiltreSQL <> '' then FiltreSQL := FiltreSQL + ' AND '; // On cumule les filtres
  //  FiltreSQL := FiltreSQL + 'nom LIKE ' + QuotedStr(EdtCherche_Nom.Text + '%');
  //end;

  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    FDQueryEntvtejj.Filter := FiltreSQL;
    FDQueryEntvtejj.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    FDQueryEntvtejj.Filtered := False;
  end;
end;


constructor TFrameTableEntvtejj.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryEntvtejj.Close;
  FDQueryEntvtejj.Open;

  //Factures du poste par defaut
  AppliquerFiltreMaitre();
end;


procedure TFrameTableEntvtejj.EditCherche_SELChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvtejj);
end;

procedure TFrameTableEntvtejj.EdtCherche_CODFACChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvtejj);
end;

procedure TFrameTableEntvtejj.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvtejj);
end;

procedure TFrameTableEntvtejj.FDQueryEntvtejjAfterScroll(DataSet: TDataSet);
begin
  if JvDBGridEntvtejj.DataSource.DataSet.FieldByName('TOP_').AsString = 'F' then
  begin
    BtnSuspendre.Caption:='Suspendre';
    BtnSuspendre.Font.Color := clRed;
  end
  else
  begin
     BtnSuspendre.Caption:='Libérer';
     BtnSuspendre.Font.Color := clGreen;
  end;
end;

procedure TFrameTableEntvtejj.FDQueryEntvtejjCalcFields(DataSet: TDataSet);
begin
  if not FDQueryEntvtejj.FieldByName('HEURE').IsNull then
  begin
    // On appelle votre fonction placée dans le DataModule
    FDQueryEntvtejj.FieldByName('HeureLisible').AsString :=
      DM_Olivier.CentièmesVersHeureLisible(FDQueryEntvtejj.FieldByName('HEURE').AsLargeInt);
  end
  else
    FDQueryEntvtejj.FieldByName('HeureLisible').AsString := '';
end;


procedure TFrameTableEntvtejj.frxReportFactureBeforePrint(
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

procedure TFrameTableEntvtejj.JvDBGridEntvtejjDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Si avoir
  if Assigned(JvDBGridEntvtejj.DataSource) and Assigned(JvDBGridEntvtejj.DataSource.DataSet) then
  begin
    if JvDBGridEntvtejj.DataSource.DataSet.FieldByName('TYPE_').AsString = 'A' then
    begin
      // Change la couleur du fond de la cellule
      JvDBGridEntvtejj.Canvas.Brush.Color := clRed;
      // Change la couleur du texte
      JvDBGridEntvtejj.Canvas.Font.Color := clWhite;
    end;
  end;
  // Si facture suspendue
  if Assigned(JvDBGridEntvtejj.DataSource) and Assigned(JvDBGridEntvtejj.DataSource.DataSet) then
  begin
    if JvDBGridEntvtejj.DataSource.DataSet.FieldByName('TOP_').AsString = 'S' then
    begin
      // Change la couleur du fond de la cellule
      //JvDBGridEntvtejj.Canvas.Brush.Color := clRed;
      // Change la couleur du texte
      JvDBGridEntvtejj.Canvas.Font.Color := clRed;
    end;
  end;

  // L'instruction indispensable pour appliquer le dessin par défaut avec nos modifications de couleurs
  JvDBGridEntvtejj.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrameTableEntvtejj.JvDBGridEntvtejjKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
//    VK_RETURN:
//      begin
//        Key := 0; // Empêche le comportement natif de la touche Entrée sur la grille
//        BtnModifierLigne.Click;
//      end;

    VK_INSERT:
      begin
        Key := 0;
        BtnAjouter.Click;
      end;

    VK_DELETE:
      begin
        Key := 0;
        BtnSuspendre.Click;
      end;
  end;
end;


procedure TFrameTableEntvtejj.JvDBGridEntvtejjTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEntvtejj.IndexFieldNames = Field.FieldName then
      FDQueryEntvtejj.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEntvtejj.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

end.
