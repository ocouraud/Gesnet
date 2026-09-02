unit U_FicheEntvtejj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.Buttons, RzButton, RzRadChk, RzDBChk, RzPanel,
  RzRadGrp, RzDBRGrp, FireDAC.Stan.Async, FireDAC.DApt, Math, System.DateUtils;

type
  TModeSaisie = (msAjout, msModification);
  TFormEntvtejj = class(TForm)
    FDMemTableEntvtejj: TFDMemTable;
    DSMemTableEntvtejj: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Panel1: TPanel;
    RzDBRadioGroupType: TRzDBRadioGroup;
    RzDBCheckBoxEXO_TVA: TRzDBCheckBox;
    RzDBCheckBoxTVA_ILES: TRzDBCheckBox;
    FDMemTableLigvtejj: TFDMemTable;
    DSMemTableLigvtejj: TDataSource;
    JvDBGridLigvtejj: TJvDBGrid;
    Panel2: TPanel;
    DBCODFAC: TDBEdit;
    FDMemTableRegljj: TFDMemTable;
    DSMemTableRegljj: TDataSource;
    JvDBGridRegljj: TJvDBGrid;
    BtnValider: TBitBtn;
    BtnAide: TBitBtn;
    BtnAnnuler: TBitBtn;
    LabelHeureLisible: TLabel;
    DBLookupComboBoxClient: TDBLookupComboBox;
    DSClient: TDataSource;
    FDQueryClientsOuverts: TFDQuery;
    FDQueryClientsOuvertsOBSERV: TMemoField;
    FDQueryClientsOuvertsCODCLI: TIntegerField;
    FDQueryClientsOuvertsCPTAUX: TStringField;
    FDQueryClientsOuvertsNOM: TStringField;
    FDQueryClientsOuvertsCODREP: TSmallintField;
    FDQueryClientsOuvertsPRC_REMISE: TBCDField;
    FDQueryClientsOuvertsNOTEL: TStringField;
    FDQueryClientsOuvertsNOTAHITI: TStringField;
    FDQueryClientsOuvertsNOFAX: TStringField;
    FDQueryClientsOuvertsJRSCRD: TSmallintField;
    FDQueryClientsOuvertsCREDIT: TLargeintField;
    FDQueryClientsOuvertsplaf_crd: TIntegerField;
    FDQueryClientsOuvertsCODPAI: TStringField;
    FDQueryClientsOuvertsFIN_MOIS: TSmallintField;
    FDQueryClientsOuvertsNB_EX: TSmallintField;
    FDQueryClientsOuvertsCAAN: TLargeintField;
    FDQueryClientsOuvertsAD1: TStringField;
    FDQueryClientsOuvertsAD2: TStringField;
    FDQueryClientsOuvertsAD3: TStringField;
    FDQueryClientsOuvertsCUM_MVT: TSmallintField;
    FDQueryClientsOuvertsMT_CPTA: TLargeintField;
    FDQueryClientsOuvertsEXO_TVA: TSmallintField;
    FDQueryClientsOuvertsBLOQUE: TSmallintField;
    FDQueryClientsOuvertsCODGEO: TStringField;
    FDQueryClientsOuvertsEMAIL: TStringField;
    FDQueryClientsOuvertsCODTAR: TStringField;
    FDQueryClientsOuvertsADM: TSmallintField;
    FDQueryClientsOuvertsFLAG_TAX: TSmallintField;
    FDQueryClientsOuvertsCODFAC_ADM: TStringField;
    FDQueryClientsOuvertsFERME: TSmallintField;
    FDQueryClientsOuvertsDER_MODIF: TSQLTimeStampField;
    FDQueryClientsOuvertsSPEC_GOUV: TSmallintField;
    FDQueryClientsOuvertsNOGSM: TLargeintField;
    FDQueryClientsOuvertsPLV: TSmallintField;
    FDQueryClientsOuvertsINTIT_BQ: TStringField;
    FDQueryClientsOuvertsCODE_BQ: TStringField;
    FDQueryClientsOuvertsCODE_GUI: TStringField;
    FDQueryClientsOuvertsNOCPT: TStringField;
    FDQueryClientsOuvertsCLE: TStringField;
    FDQueryClientsOuvertsCOEF_MAJ_PR: TBCDField;
    FDQueryClientsOuvertsEXO_CPS: TSmallintField;
    FDQueryClientsOuvertsPAS_REM: TSmallintField;
    FDQueryClientsOuvertsREM_FAM: TSmallintField;
    FDQueryClientsOuvertsRELEVE_EMAIL: TBooleanField;
    FDQueryClientsOuvertsSELECT_: TBooleanField;
    FDQueryClientsOuvertsAPP_TARIFCLI: TBooleanField;
    FDQueryClientsOuvertsTVA_ILES: TBooleanField;
    LabelNomRepres: TLabel;
    procedure BtnValiderClick(Sender: TObject);
    procedure RzDBRadioGroupTypeChange(Sender: TObject);
    procedure DBCODCLIExit(Sender: TObject);
    procedure DBCODCLIChange(Sender: TObject);
    procedure DBCODREPChange(Sender: TObject);
    procedure DBCODREPExit(Sender: TObject);
    procedure RzDBCheckBoxEXO_TVAClick(Sender: TObject);
    procedure RzDBCheckBoxTVA_ILESClick(Sender: TObject);

  private
    { Déclarations privées }
    FCodFacCree: Integer;
    procedure CalculCompletFacture;
  public
    { Déclarations publiques }
    ModeSaisie: TModeSaisie;
    constructor Create(AOwner: TComponent; AMode: TModeSaisie; ACodFac: Integer); reintroduce;
    property CodFacCree: Integer read FCodFacCree;

  end;

var
  FormEntvtejj: TFormEntvtejj;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_TableEntvtejj, U_DataModule;


procedure TFormEntvtejj.BtnValiderClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  NumFacture: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;
begin
  //Calcul complet avant validation
  CalculCompletFacture;

  // Conversion en nombre total de secondes depuis minuit
  LHeure := Now; // ou un champ heure
  DecodeTime(Now, H, M, S, MS);
  Centiemes := MS div 10; // Conversion des millisecondes en centièmes
  // Construction de l'entier : HH * 1000000 + MM * 10000 + SS * 100 + CC
  ResultHeure := (H * 360000) + (M * 6000) + (S * 100) + Centiemes;

  // 1. S'assurer que les saisies en cours dans les grilles/champs sont validées (Post)
  if FDMemTableEntvtejj.State in [dsEdit, dsInsert] then
    FDMemTableEntvtejj.Post;
  if FDMemTableLigvtejj.State in [dsEdit, dsInsert] then
    FDMemTableLigvtejj.Post;
  if FDMemTableRegljj.State in [dsEdit, dsInsert] then
    FDMemTableRegljj.Post;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec2 := TFDQuery.Create(nil);

  try
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la transaction MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      // ==========================================
      // 2. ENREGISTREMENT DE L'EN-TÊTE
      // ==========================================
      if ModeSaisie = msAjout then
      begin
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
        FCodFacCree := NumFacture;

        // Exemple d'INSERT pour l'en-tête (adaptez les noms de champs selon votre table)
        QryExec.close;
        QryExec.SQL.Text := 'INSERT INTO `entvtejj` (' +
          '`OBSERV`, `CODFAC`, `TOP_`, `CODCLI`, `CODCAI`, `CODDEV`, `CODDEP`, `CODVEN`, `NOM`, `NOTAHITI`, ' +
          '`TYPE_`, `EXO_TVA`, `ANNEE`, `MOIS`, `DATE_`, `HEURE`, `PRC_REMISE`, `MT_REMISE`, `TOTHT`, `MT_TTC`, ' +
          '`MT_HT0`, `MT_HT1`, `MT_HT2`, `MT_HT3`, `MT_TVA1`, `MT_TVA2`, `MT_TVA3`, `MT_TVA`, `MARGE`, `REFERENCE_`, ' +
          '`CODREP`, `NO_SEM`, `NO_JOUR`, `REGL`, `CODPAI`, `JRSCRD`, `FIN_MOIS`, `LIBREG`, `CRD_FORCE`, `date_ech`, ' +
          '`ACOMPTE`, `CODGEO`, `FLAG_TAX`, `SEL`, `DER_MODIF`, `NOMVEN`, `MT_TSOC`, `MT_HTSOC`, `TX_TSOC`, `EXO_CPS`, ' +
          '`MT_TVAI`, `MT_HTI`, `TVA_ILES`) VALUES (' +
          ':OBSERV, :CODFAC, :TOP_, :CODCLI, :CODCAI, :CODDEV, :CODDEP, :CODVEN, :NOM, :NOTAHITI, ' +
          ':TYPE_, :EXO_TVA, :ANNEE, :MOIS, :DATE_, :HEURE, :PRC_REMISE, :MT_REMISE, :TOTHT, :MT_TTC, ' +
          ':MT_HT0, :MT_HT1, :MT_HT2, :MT_HT3, :MT_TVA1, :MT_TVA2, :MT_TVA3, :MT_TVA, :MARGE, :REFERENCE_, ' +
          ':CODREP, :NO_SEM, :NO_JOUR, :REGL, :CODPAI, :JRSCRD, :FIN_MOIS, :LIBREG, :CRD_FORCE, :date_ech, ' +
          ':ACOMPTE, :CODGEO, :FLAG_TAX, :SEL, CURRENT_TIMESTAMP, :NOMVEN, :MT_TSOC, :MT_HTSOC, :TX_TSOC, :EXO_CPS, ' +
          ':MT_TVAI, :MT_HTI, :TVA_ILES)';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('OBSERV').AsString     := FDMemTableEntvtejj.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('CODFAC').AsInteger    := NumFacture;
        QryExec.ParamByName('TOP_').AsString       := FDMemTableEntvtejj.FieldByName('TOP_').AsString;
        QryExec.ParamByName('CODCLI').AsInteger    := FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODCAI').AsString     := FDMemTableEntvtejj.FieldByName('CODCAI').AsString;
        QryExec.ParamByName('CODDEV').AsInteger    := FDMemTableEntvtejj.FieldByName('CODDEV').AsInteger;
        QryExec.ParamByName('CODDEP').AsInteger    := FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('CODVEN').AsInteger    := FDMemTableEntvtejj.FieldByName('CODVEN').AsInteger;
        QryExec.ParamByName('NOM').AsString        := FDMemTableEntvtejj.FieldByName('NOM').AsString;
        QryExec.ParamByName('NOTAHITI').AsString   := FDMemTableEntvtejj.FieldByName('NOTAHITI').AsString;
        QryExec.ParamByName('TYPE_').AsString      := FDMemTableEntvtejj.FieldByName('TYPE_').AsString;
        QryExec.ParamByName('EXO_TVA').AsInteger   := FDMemTableEntvtejj.FieldByName('EXO_TVA').AsInteger;
        QryExec.ParamByName('ANNEE').AsInteger     := FDMemTableEntvtejj.FieldByName('ANNEE').AsInteger;
        QryExec.ParamByName('MOIS').AsInteger      := FDMemTableEntvtejj.FieldByName('MOIS').AsInteger;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('HEURE').AsString      := FDMemTableEntvtejj.FieldByName('HEURE').AsString;
        QryExec.ParamByName('PRC_REMISE').AsFloat  := FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat;
        QryExec.ParamByName('MT_REMISE').AsFloat   := FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('MT_HT0').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT0').AsFloat;
        QryExec.ParamByName('MT_HT1').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat;
        QryExec.ParamByName('MT_HT2').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat;
        QryExec.ParamByName('MT_HT3').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat;
        QryExec.ParamByName('MT_TVA1').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVA1').AsFloat;
        QryExec.ParamByName('MT_TVA2').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVA2').AsFloat;
        QryExec.ParamByName('MT_TVA3').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVA3').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('MARGE').AsFloat       := FDMemTableEntvtejj.FieldByName('MARGE').AsFloat;
        QryExec.ParamByName('REFERENCE_').AsString := FDMemTableEntvtejj.FieldByName('REFERENCE_').AsString;
        QryExec.ParamByName('CODREP').AsInteger    := FDMemTableEntvtejj.FieldByName('CODREP').AsInteger;
        QryExec.ParamByName('NO_SEM').AsInteger    := FDMemTableEntvtejj.FieldByName('NO_SEM').AsInteger;
        QryExec.ParamByName('NO_JOUR').AsInteger   := FDMemTableEntvtejj.FieldByName('NO_JOUR').AsInteger;
        QryExec.ParamByName('REGL').AsInteger      := FDMemTableEntvtejj.FieldByName('REGL').AsInteger;
        QryExec.ParamByName('CODPAI').AsString     := FDMemTableEntvtejj.FieldByName('CODPAI').AsString;
        QryExec.ParamByName('JRSCRD').AsInteger    := FDMemTableEntvtejj.FieldByName('JRSCRD').AsInteger;
        QryExec.ParamByName('FIN_MOIS').AsInteger  := FDMemTableEntvtejj.FieldByName('FIN_MOIS').AsInteger;
        QryExec.ParamByName('LIBREG').AsString     := FDMemTableEntvtejj.FieldByName('LIBREG').AsString;
        QryExec.ParamByName('CRD_FORCE').AsInteger := FDMemTableEntvtejj.FieldByName('CRD_FORCE').AsInteger;
        QryExec.ParamByName('date_ech').AsDateTime := FDMemTableEntvtejj.FieldByName('date_ech').AsDateTime;
        QryExec.ParamByName('ACOMPTE').AsInteger   := FDMemTableEntvtejj.FieldByName('ACOMPTE').AsInteger;
        QryExec.ParamByName('CODGEO').AsString     := FDMemTableEntvtejj.FieldByName('CODGEO').AsString;
        QryExec.ParamByName('FLAG_TAX').AsInteger  := FDMemTableEntvtejj.FieldByName('FLAG_TAX').AsInteger;
        QryExec.ParamByName('SEL').AsInteger       := FDMemTableEntvtejj.FieldByName('SEL').AsInteger;
        QryExec.ParamByName('NOMVEN').AsString     := FDMemTableEntvtejj.FieldByName('NOMVEN').AsString;
        QryExec.ParamByName('MT_TSOC').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TSOC').AsFloat;
        QryExec.ParamByName('MT_HTSOC').AsFloat    := FDMemTableEntvtejj.FieldByName('MT_HTSOC').AsFloat;
        QryExec.ParamByName('TX_TSOC').AsFloat     := FDMemTableEntvtejj.FieldByName('TX_TSOC').AsFloat;
        QryExec.ParamByName('EXO_CPS').AsInteger   := FDMemTableEntvtejj.FieldByName('EXO_CPS').AsInteger;
        QryExec.ParamByName('MT_TVAI').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVAI').AsFloat;
        QryExec.ParamByName('MT_HTI').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat;
        QryExec.ParamByName('TVA_ILES').AsBoolean  := FDMemTableEntvtejj.FieldByName('TVA_ILES').AsBoolean;
        QryExec.ExecSQL;
      end
      else
      begin
        // UPDATE pour l'en-tête en modification
        QryExec.SQL.Text := 'UPDATE `entvtejj` SET ' +
          '`OBSERV` = :OBSERV, ' +
          '`CODFAC` = :CODFAC, ' +
          '`TOP_` = :TOP_, ' +
          '`CODCLI` = :CODCLI, ' +
          '`CODCAI` = :CODCAI, ' +
          '`CODDEV` = :CODDEV, ' +
          '`CODDEP` = :CODDEP, ' +
          '`CODVEN` = :CODVEN, ' +
          '`NOM` = :NOM, ' +
          '`NOTAHITI` = :NOTAHITI, ' +
          '`TYPE_` = :TYPE_, ' +
          '`EXO_TVA` = :EXO_TVA, ' +
          '`ANNEE` = :ANNEE, ' +
          '`MOIS` = :MOIS, ' +
          '`DATE_` = :DATE_, ' +
          '`HEURE` = :HEURE, ' +
          '`PRC_REMISE` = :PRC_REMISE, ' +
          '`MT_REMISE` = :MT_REMISE, ' +
          '`TOTHT` = :TOTHT, ' +
          '`MT_TTC` = :MT_TTC, ' +
          '`MT_HT0` = :MT_HT0, ' +
          '`MT_HT1` = :MT_HT1, ' +
          '`MT_HT2` = :MT_HT2, ' +
          '`MT_HT3` = :MT_HT3, ' +
          '`MT_TVA1` = :MT_TVA1, ' +
          '`MT_TVA2` = :MT_TVA2, ' +
          '`MT_TVA3` = :MT_TVA3, ' +
          '`MT_TVA` = :MT_TVA, ' +
          '`MARGE` = :MARGE, ' +
          '`REFERENCE_` = :REFERENCE_, ' +
          '`CODREP` = :CODREP, ' +
          '`NO_SEM` = :NO_SEM, ' +
          '`NO_JOUR` = :NO_JOUR, ' +
          '`REGL` = :REGL, ' +
          '`CODPAI` = :CODPAI, ' +
          '`JRSCRD` = :JRSCRD, ' +
          '`FIN_MOIS` = :FIN_MOIS, ' +
          '`LIBREG` = :LIBREG, ' +
          '`CRD_FORCE` = :CRD_FORCE, ' +
          '`date_ech` = :date_ech, ' +
          '`ACOMPTE` = :ACOMPTE, ' +
          '`CODGEO` = :CODGEO, ' +
          '`FLAG_TAX` = :FLAG_TAX, ' +
          '`SEL` = :SEL, ' +
          '`DER_MODIF` = CURRENT_TIMESTAMP, ' +
          '`NOMVEN` = :NOMVEN, ' +
          '`MT_TSOC` = :MT_TSOC, ' +
          '`MT_HTSOC` = :MT_HTSOC, ' +
          '`TX_TSOC` = :TX_TSOC, ' +
          '`EXO_CPS` = :EXO_CPS, ' +
          '`MT_TVAI` = :MT_TVAI, ' +
          '`MT_HTI` = :MT_HTI, ' +
          '`TVA_ILES` = :TVA_ILES ' +
          'WHERE `CODFAC` = :CODFAC';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('OBSERV').AsString     := FDMemTableEntvtejj.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('CODFAC').AsInteger     := FDMemTableEntvtejj.FieldByName('CODFAC').AsInteger;
        QryExec.ParamByName('TOP_').AsString      := FDMemTableEntvtejj.FieldByName('TOP_').AsString;
        QryExec.ParamByName('CODCLI').AsInteger     := FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODCAI').AsString     := FDMemTableEntvtejj.FieldByName('CODCAI').AsString;
        QryExec.ParamByName('CODDEV').AsInteger     := FDMemTableEntvtejj.FieldByName('CODDEV').AsInteger;
        QryExec.ParamByName('CODDEP').AsInteger     := FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('CODVEN').AsInteger     := FDMemTableEntvtejj.FieldByName('CODVEN').AsInteger;
        QryExec.ParamByName('NOM').AsString        := FDMemTableEntvtejj.FieldByName('NOM').AsString;
        QryExec.ParamByName('NOTAHITI').AsString   := FDMemTableEntvtejj.FieldByName('NOTAHITI').AsString;
        QryExec.ParamByName('TYPE_').AsString      := FDMemTableEntvtejj.FieldByName('TYPE_').AsString;
        QryExec.ParamByName('EXO_TVA').AsInteger   := FDMemTableEntvtejj.FieldByName('EXO_TVA').AsInteger;
        QryExec.ParamByName('ANNEE').AsInteger     := FDMemTableEntvtejj.FieldByName('ANNEE').AsInteger;
        QryExec.ParamByName('MOIS').AsInteger      := FDMemTableEntvtejj.FieldByName('MOIS').AsInteger;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('HEURE').AsString      := FDMemTableEntvtejj.FieldByName('HEURE').AsString;
        QryExec.ParamByName('PRC_REMISE').AsFloat  := FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat;
        QryExec.ParamByName('MT_REMISE').AsFloat   := FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('MT_HT0').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT0').AsFloat;
        QryExec.ParamByName('MT_HT1').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat;
        QryExec.ParamByName('MT_HT2').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat;
        QryExec.ParamByName('MT_HT3').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat;
        QryExec.ParamByName('MT_TVA1').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVA1').AsFloat;
        QryExec.ParamByName('MT_TVA2').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVA2').AsFloat;
        QryExec.ParamByName('MT_TVA3').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVA3').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('MARGE').AsFloat       := FDMemTableEntvtejj.FieldByName('MARGE').AsFloat;
        QryExec.ParamByName('REFERENCE_').AsString := FDMemTableEntvtejj.FieldByName('REFERENCE_').AsString;
        QryExec.ParamByName('CODREP').AsInteger     := FDMemTableEntvtejj.FieldByName('CODREP').AsInteger;
        QryExec.ParamByName('NO_SEM').AsInteger    := FDMemTableEntvtejj.FieldByName('NO_SEM').AsInteger;
        QryExec.ParamByName('NO_JOUR').AsInteger   := FDMemTableEntvtejj.FieldByName('NO_JOUR').AsInteger;
        QryExec.ParamByName('REGL').AsInteger      := FDMemTableEntvtejj.FieldByName('REGL').AsInteger;
        QryExec.ParamByName('CODPAI').AsString     := FDMemTableEntvtejj.FieldByName('CODPAI').AsString;
        QryExec.ParamByName('JRSCRD').AsInteger    := FDMemTableEntvtejj.FieldByName('JRSCRD').AsInteger;
        QryExec.ParamByName('FIN_MOIS').AsInteger  := FDMemTableEntvtejj.FieldByName('FIN_MOIS').AsInteger;
        QryExec.ParamByName('LIBREG').AsString     := FDMemTableEntvtejj.FieldByName('LIBREG').AsString;
        QryExec.ParamByName('CRD_FORCE').AsInteger := FDMemTableEntvtejj.FieldByName('CRD_FORCE').AsInteger;
        QryExec.ParamByName('date_ech').AsDateTime := FDMemTableEntvtejj.FieldByName('date_ech').AsDateTime;
        QryExec.ParamByName('ACOMPTE').AsInteger   := FDMemTableEntvtejj.FieldByName('ACOMPTE').AsInteger;
        QryExec.ParamByName('CODGEO').AsString     := FDMemTableEntvtejj.FieldByName('CODGEO').AsString;
        QryExec.ParamByName('FLAG_TAX').AsInteger  := FDMemTableEntvtejj.FieldByName('FLAG_TAX').AsInteger;
        QryExec.ParamByName('SEL').AsInteger       := FDMemTableEntvtejj.FieldByName('SEL').AsInteger;
        QryExec.ParamByName('NOMVEN').AsString     := FDMemTableEntvtejj.FieldByName('NOMVEN').AsString;
        QryExec.ParamByName('MT_TSOC').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TSOC').AsFloat;
        QryExec.ParamByName('MT_HTSOC').AsFloat    := FDMemTableEntvtejj.FieldByName('MT_HTSOC').AsFloat;
        QryExec.ParamByName('TX_TSOC').AsFloat     := FDMemTableEntvtejj.FieldByName('TX_TSOC').AsFloat;
        QryExec.ParamByName('EXO_CPS').AsInteger   := FDMemTableEntvtejj.FieldByName('EXO_CPS').AsInteger;
        QryExec.ParamByName('MT_TVAI').AsFloat     := FDMemTableEntvtejj.FieldByName('MT_TVAI').AsFloat;
        QryExec.ParamByName('MT_HTI').AsFloat      := FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat;
        QryExec.ParamByName('TVA_ILES').AsBoolean  := FDMemTableEntvtejj.FieldByName('TVA_ILES').AsBoolean;

        QryExec.ExecSQL;
        // Récupération du numéro de facture (généré ou existant)
        NumFacture := FDMemTableEntvtejj.FieldByName('CODFAC').AsInteger;
      end;

      QryExec.Close;

      // ===========================================================
      //3. Suppression generale des mouvements de stocks initiaux
      // ===========================================================
      if ModeSaisie = msModification then
      begin
        QryExec.SQL.Text := 'SELECT * FROM ligvtejj WHERE CODFAC = :CODFAC and NOENR<>0';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.Open;

        while not QryExec.Eof do
        begin
          //Recherche et suppression du mouvement de stock associé
          QryExec2.SQL.Text := 'DELETE from stock WHERE NOENR = :NOENR';
          QryExec2.ParamByName('NOENR').AsInteger := QryExec.FieldByName('NOENR').AsInteger;
          QryExec2.ExecSQL;
          QryExec2.Close;

          //On recalcul le stock du depot et de l'article
          DM_Olivier.RecalculerStockStodep(QryExec.FieldByName('CODART').AsString, FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger);

          //Lecture ligvtejj suivant
          QryExec.Next;
        end;
      end;


      // ==========================================
      // 4. ENREGISTREMENT DES LIGNES (ligvtejj)
      // ==========================================
      // Pour faire simple et propre lors d'une modification :
      // on supprime les anciennes lignes de cette facture et on réinsère l'état actuel de la table mémoire.
      if ModeSaisie = msModification then
      begin
        QryExec.Close;
        QryExec.SQL.Text := 'DELETE FROM ligvtejj WHERE CODFAC = :CODFAC';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des lignes
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        //Génération du mouvement de stock associé a la ligne
        VNoEnrStock :=0;
        //Controle si article géré en stock
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryExec.ParamByName('CODART').AsString :=FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryExec.Open;
        if QryExec.FieldByName('G_STO').AsInteger=1 then
        begin
           //Creation par securite du stodep
           QryExec2.Close;
           QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                            'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
           QryExec2.ParamByName('CODART').AsString :=FDMemTableLigvtejj.FieldByName('CODART').AsString;
           QryExec2.ParamByName('CODDEP').AsInteger :=FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('PMP').AsFloat :=QryExec.FieldByName('PMP').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString :=QryExec.FieldByName('CODFOU').AsString;
           QryExec2.ExecSQL;

           //Insertion stock
           QryExec2.Close;
           //     ShowMessage(FDMemTableLigvtejj.FieldByName('CODART').AsString);
           QryExec2.SQL.Text := 'INSERT INTO stock (CODART, DATE_, ANNEE, MOIS, TYPE_, QTE, VALUNIT, PRIXVTE, CODDEP, CENTRA, LIBELLE, CODFOU, TIME, CODFAC) ' +
                            'VALUES (:CODART, :DATE_, :ANNEE, :MOIS, :TYPE_, :QTE, :VALUNIT, :PRIXVTE, :CODDEP, :CENTRA, :LIBELLE, :CODFOU, :TIME, :CODFAC)';
           QryExec2.ParamByName('CODFAC').AsInteger := NumFacture;
           QryExec2.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
           QryExec2.ParamByName('QTE').AsFloat := -FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
           QryExec2.ParamByName('PRIXVTE').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat;
           QryExec2.ParamByName('VALUNIT').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := FDMemTableLigvtejj.FieldByName('CODFOU').AsString;
           QryExec2.ParamByName('DATE_').AsDateTime := FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
           QryExec2.ParamByName('ANNEE').AsInteger := FDMemTableLigvtejj.FieldByName('ANNEE').AsInteger;
           QryExec2.ParamByName('MOIS').AsInteger := FDMemTableLigvtejj.FieldByName('MOIS').AsInteger;
           QryExec2.ParamByName('CODDEP').AsInteger := FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger;
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
           DM_Olivier.RecalculerStockStodep(FDMemTableLigvtejj.FieldByName('CODART').AsString, FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger);

        end;

        //Insertion ligvtejj
        QryExec.Close;
        QryExec.SQL.Text := 'INSERT INTO `ligvtejj` (' +
          '`LIBELLE`, `CODFAC`, `CODCLI`, `CODCAI`, `CODDEV`, `CODDEP`, `NOENR`, `ANNEE`, `MOIS`, `CODREP`, ' +
          '`CODFOU`, `CODSSF`, `CODFAM`, `CODDPT`, `TYPE_`, `CODART`, `CODBAR`, `QTE`, `POIDS`, `CODTAR`, ' +
          '`PRIXHT`, `PRIXTTC`, `PRIXNET`, `TOTHT`, `MT_TTC`, `PRC_REMISE`, `MT_REMISE`, `TX_TVA`, `MT_TVA`, `NO_TVA`, ' +
          '`PRIXREV`, `MARGE`, `NO_SEM`, `NO_JOUR`, `DET_PPT`, `DET_ILE`, `PXLVTTC`, `DER_MODIF`, `TX_TSOC`, `MT_TSOC`) VALUES (' +
          ':LIBELLE, :CODFAC, :CODCLI, :CODCAI, :CODDEV, :CODDEP, :NOENR, :ANNEE, :MOIS, :CODREP, ' +
          ':CODFOU, :CODSSF, :CODFAM, :CODDPT, :TYPE_, :CODART, :CODBAR, :QTE, :POIDS, :CODTAR, ' +
          ':PRIXHT, :PRIXTTC, :PRIXNET, :TOTHT, :MT_TTC, :PRC_REMISE, :MT_REMISE, :TX_TVA, :MT_TVA, :NO_TVA, ' +
          ':PRIXREV, :MARGE, :NO_SEM, :NO_JOUR, :DET_PPT, :DET_ILE, :PXLVTTC, CURRENT_TIMESTAMP, :TX_TSOC, :MT_TSOC)';

        // Assignation directe des valeurs depuis la table mémoire des lignes
        QryExec.ParamByName('LIBELLE').AsString    := FDMemTableLigvtejj.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('CODFAC').AsInteger    := NumFacture;
        QryExec.ParamByName('CODCLI').AsInteger    := FDMemTableLigvtejj.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODCAI').AsString     := FDMemTableLigvtejj.FieldByName('CODCAI').AsString;
        QryExec.ParamByName('CODDEV').AsInteger    := FDMemTableLigvtejj.FieldByName('CODDEV').AsInteger;
        QryExec.ParamByName('CODDEP').AsInteger    := FDMemTableLigvtejj.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('NOENR').AsInteger     := VNoEnrStock;
        QryExec.ParamByName('ANNEE').AsInteger     := FDMemTableLigvtejj.FieldByName('ANNEE').AsInteger;
        QryExec.ParamByName('MOIS').AsInteger      := FDMemTableLigvtejj.FieldByName('MOIS').AsInteger;
        QryExec.ParamByName('CODREP').AsInteger    := FDMemTableLigvtejj.FieldByName('CODREP').AsInteger;
        QryExec.ParamByName('CODFOU').AsString    := FDMemTableLigvtejj.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('CODSSF').AsString    := FDMemTableLigvtejj.FieldByName('CODSSF').AsString;
        QryExec.ParamByName('CODFAM').AsString    := FDMemTableLigvtejj.FieldByName('CODFAM').AsString;
        QryExec.ParamByName('CODDPT').AsString    := FDMemTableLigvtejj.FieldByName('CODDPT').AsString;
        QryExec.ParamByName('TYPE_').AsString      := FDMemTableLigvtejj.FieldByName('TYPE_').AsString;
        QryExec.ParamByName('CODART').AsString     := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryExec.ParamByName('CODBAR').AsString     := FDMemTableLigvtejj.FieldByName('CODBAR').AsString;
        QryExec.ParamByName('QTE').AsFloat         := FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
        QryExec.ParamByName('POIDS').AsFloat       := FDMemTableLigvtejj.FieldByName('POIDS').AsFloat;
        QryExec.ParamByName('CODTAR').AsString    := FDMemTableLigvtejj.FieldByName('CODTAR').AsString;
        QryExec.ParamByName('PRIXHT').AsFloat      := FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat;
        QryExec.ParamByName('PRIXTTC').AsInteger   := FDMemTableLigvtejj.FieldByName('PRIXTTC').AsInteger;
        QryExec.ParamByName('PRIXNET').AsFloat     := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('PRC_REMISE').AsFloat  := FDMemTableLigvtejj.FieldByName('PRC_REMISE').AsFloat;
        QryExec.ParamByName('MT_REMISE').AsFloat   := FDMemTableLigvtejj.FieldByName('MT_REMISE').AsFloat;
        QryExec.ParamByName('TX_TVA').AsFloat      := FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('NO_TVA').AsInteger    := FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger;
        QryExec.ParamByName('PRIXREV').AsFloat     := FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat;
        QryExec.ParamByName('MARGE').AsFloat       := FDMemTableLigvtejj.FieldByName('MARGE').AsFloat;
        QryExec.ParamByName('NO_SEM').AsInteger    := FDMemTableLigvtejj.FieldByName('NO_SEM').AsInteger;
        QryExec.ParamByName('NO_JOUR').AsInteger   := FDMemTableLigvtejj.FieldByName('NO_JOUR').AsInteger;
        QryExec.ParamByName('DET_PPT').AsFloat   := FDMemTableLigvtejj.FieldByName('DET_PPT').AsFloat;
        QryExec.ParamByName('DET_ILE').AsFloat   := FDMemTableLigvtejj.FieldByName('DET_ILE').AsFloat;
        //QryExec.ParamByName('NOENRF').AsInteger    := FDMemTableLigvtejj.FieldByName('NOENRF').AsInteger;
        QryExec.ParamByName('PXLVTTC').AsInteger   := FDMemTableLigvtejj.FieldByName('PXLVTTC').AsInteger;
        QryExec.ParamByName('TX_TSOC').AsFloat     := FDMemTableLigvtejj.FieldByName('TX_TSOC').AsFloat;
        QryExec.ParamByName('MT_TSOC').AsFloat     := FDMemTableLigvtejj.FieldByName('MT_TSOC').AsFloat;

        QryExec.ExecSQL;

        //Lecture ligne memoire suivante
        FDMemTableLigvtejj.Next;
      end;


      // ==========================================
      // 4. ENREGISTREMENT DES RÈGLEMENTS (regljj)
      // ==========================================
      if ModeSaisie = msModification then
      begin
        QryExec.Close;
        QryExec.SQL.Text := 'DELETE FROM regljj WHERE CODFAC = :CODFAC';
        QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des règlements
      FDMemTableRegljj.First;
      while not FDMemTableRegljj.Eof do
      begin
        QryExec.Close;

        QryExec.SQL.Text := 'INSERT INTO `regljj` (' +
          '`CODFAC`, `CODCAI`, `CODVEN`, `DATE_`, `TOP_`, `LIBELLE`, `MONTANT`, `DATE_ECH`, `CODPAI`, `TYPE_`, ' +
          '`SELECT_`, `DATE_OPER`, `DATE_COMPTA`, `DER_MODIF`, `MONT_ARR`) VALUES (' +
          ':CODFAC, :CODCAI, :CODVEN, :DATE_, :TOP_, :LIBELLE, :MONTANT, :DATE_ECH, :CODPAI, :TYPE_, ' +
          ':SELECT_, :DATE_OPER, :DATE_COMPTA, CURRENT_TIMESTAMP, :MONT_ARR)';

        // Assignation directe des valeurs depuis la table mémoire des règlements
        QryExec.ParamByName('CODFAC').AsInteger     := NumFacture;
        QryExec.ParamByName('CODCAI').AsString      := FDMemTableRegljj.FieldByName('CODCAI').AsString;
        QryExec.ParamByName('CODVEN').AsInteger     := FDMemTableRegljj.FieldByName('CODVEN').AsInteger;
        QryExec.ParamByName('DATE_').AsDateTime     := FDMemTableRegljj.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('TOP_').AsString       := FDMemTableRegljj.FieldByName('TOP_').AsString;
        QryExec.ParamByName('LIBELLE').AsString     := FDMemTableRegljj.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('MONTANT').AsInteger    := FDMemTableRegljj.FieldByName('MONTANT').AsInteger;
        QryExec.ParamByName('DATE_ECH').AsDateTime  := FDMemTableRegljj.FieldByName('DATE_ECH').AsDateTime;
        QryExec.ParamByName('CODPAI').AsString      := FDMemTableRegljj.FieldByName('CODPAI').AsString;
        QryExec.ParamByName('TYPE_').AsString       := FDMemTableRegljj.FieldByName('TYPE_').AsString;
        QryExec.ParamByName('SELECT_').AsInteger    := FDMemTableRegljj.FieldByName('SELECT_').AsInteger;
        QryExec.ParamByName('DATE_OPER').AsDateTime := FDMemTableRegljj.FieldByName('DATE_OPER').AsDateTime;
        QryExec.ParamByName('DATE_COMPTA').AsDateTime := FDMemTableRegljj.FieldByName('DATE_COMPTA').AsDateTime;
        //QryExec.ParamByName('NOENR').AsInteger      := FDMemTableRegljj.FieldByName('NOENR').AsInteger;
        QryExec.ParamByName('MONT_ARR').AsInteger   := FDMemTableRegljj.FieldByName('MONT_ARR').AsInteger;

        QryExec.ExecSQL;
        FDMemTableRegljj.Next;
      end;

      // Si tout s'est déroulé sans erreur, on valide définitivement dans MySQL
      DMGesCloud.ConnexionGesCloud.Commit;
      ModalResult := mrOk;

    except
      on E: Exception do
      begin
        // En cas d'erreur, on annule tout (ni l'en-tête ni les lignes ne sont modifiés)
        DMGesCloud.ConnexionGesCloud.Rollback;
        ShowMessage('Erreur lors de l''enregistrement : ' + E.Message);
        ModalResult := mrNone;
      end;
    end;
  finally
    QryExec.Free;
    QryExec2.Free;
  end;
end;

constructor TFormEntvtejj.Create(AOwner: TComponent; AMode: TModeSaisie; ACodFac: Integer);
var
  QryExec: TFDQuery;
begin
  inherited Create(AOwner);
  ModeSaisie := AMode;

// 1. Gestion de l'En-tête
  DM_Olivier.FDQueryEntvtejj.Close;
  if ModeSaisie = msModification then
  begin
    DM_Olivier.FDQueryEntvtejj.SQL.Text := 'select * from entvtejj where codfac = :CODFAC';
    DM_Olivier.FDQueryEntvtejj.ParamByName('CODFAC').AsInteger := ACodFac;
  end;
  DM_Olivier.FDQueryEntvtejj.Open;

  FDMemTableEntvtejj.Close;
  FDMemTableEntvtejj.FieldDefs.Assign(DM_Olivier.FDQueryEntvtejj.FieldDefs);
  FDMemTableEntvtejj.CreateDataSet;

  if ModeSaisie = msAjout then
  begin
    FDMemTableEntvtejj.Append;
    FDMemTableEntvtejj.FieldByName('CODFAC').AsInteger := ACodFac;
    FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime := Date;
    //1. Stocker la valeur brute en centièmes dans le champ technique de la table
    FDMemTableEntvtejj.FieldByName('HEURE').AsLargeInt := Round(Frac(Now) * 86400 * 100);
    FDMemTableEntvtejj.FieldByName('CODCAI').AsString := Format('%d', [DM_Olivier.NumeroPoste]);
    FDMemTableEntvtejj.FieldByName('CODDEP').AsInteger := DM_Olivier.gCoddep_defaut;
    FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger := DM_Olivier.gCodcli_defaut;
    FDMemTableEntvtejj.FieldByName('TYPE_').AsString := 'F';
    FDMemTableEntvtejj.FieldByName('TOP_').AsString := 'S';
    FDMemTableEntvtejj.FieldByName('CODVEN').AsInteger := DMGesCloud.gCodven_defaut;
    FDMemTableEntvtejj.FieldByName('NOMVEN').AsString := DMGesCloud.LoggedUser;
    FDMemTableEntvtejj.Post;

    // On se remet en édition pour que l'interface graphique puisse accepter la saisie de l'utilisateur
    FDMemTableEntvtejj.Edit;
  end
  else
  begin
    // En modification, on copie l'en-tête unique correspondant
    FDMemTableEntvtejj.CopyDataSet(DM_Olivier.FDQueryEntvtejj, [coAppend]);
    FDMemTableEntvtejj.First;
  end;
  // 2. Afficher l'heure immédiatement sous sa forme lisible :
  LabelHeureLisible.Caption := DM_Olivier.CentièmesVersHeureLisible(FDMemTableEntvtejj.FieldByName('HEURE').AsLargeInt);

  // 2. Gestion des Lignes de détails
  DM_Olivier.FDQueryLigvtejj.Close;
  DM_Olivier.FDQueryLigvtejj.ParamByName('CODFAC').AsInteger := ACodFac;
  DM_Olivier.FDQueryLigvtejj.Open();
  DM_Olivier.FDQueryLigvtejj.FetchAll;

  FDMemTableLigvtejj.Close;
  FDMemTableLigvtejj.FieldDefs.Assign(DM_Olivier.FDQueryLigvtejj.FieldDefs);
  FDMemTableLigvtejj.CreateDataSet;

  // 3. Gestion des Reglements
  DM_Olivier.FDQueryRegljj.Close;
  DM_Olivier.FDQueryRegljj.ParamByName('CODFAC').AsInteger := ACodFac;
  DM_Olivier.FDQueryRegljj.Open();
  DM_Olivier.FDQueryRegljj.FetchAll;

  FDMemTableRegljj.Close;
  FDMemTableRegljj.FieldDefs.Assign(DM_Olivier.FDQueryRegljj.FieldDefs);
  FDMemTableRegljj.CreateDataSet;

  if ModeSaisie = msModification then
  begin
    FDMemTableLigvtejj.CopyDataSet(DM_Olivier.FDQueryLigvtejj, [coAppend]);
    FDMemTableLigvtejj.First;
    FDMemTableRegljj.CopyDataSet(DM_Olivier.FDQueryRegljj, [coAppend]);
    FDMemTableRegljj.First;
  end;

  //Ouverture des Query
  FDQueryClientsOuverts.Open;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM repres WHERE CODREP=:CODREP';
  QryExec.ParamByName('CODREP').AsString :=   FDMemTableEntvtejj.FieldByName('CODREP').AsString;
  QryExec.Open;
  LabelNomRepres.Caption := QryExec.FieldByName('NOM').AsString;

  //Traitement selon type_ facture ou avoir
  RzDBRadioGroupTypeChange(self);
end;

procedure TFormEntvtejj.DBCODCLIChange(Sender: TObject);
var
  QryExec: TFDQuery;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntvtejj.State in [dsEdit, dsInsert]) then
    Exit;

  FDMemTableEntvtejj.FieldByName('NOM').AsString := FDQueryClientsOuverts.FieldByName('NOM').AsString;
  FDMemTableEntvtejj.FieldByName('NOTAHITI').AsString := FDQueryClientsOuverts.FieldByName('NOTAHITI').AsString;
  FDMemTableEntvtejj.FieldByName('CODREP').AsInteger := FDQueryClientsOuverts.FieldByName('CODREP').AsInteger;
  FDMemTableEntvtejj.FieldByName('EXO_TVA').AsInteger := FDQueryClientsOuverts.FieldByName('EXO_TVA').AsInteger;
  FDMemTableEntvtejj.FieldByName('CODGEO').AsString := FDQueryClientsOuverts.FieldByName('CODGEO').AsString;

    // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.SQL.Text := 'SELECT * FROM geo WHERE CODGEO=:CODGEO';
  QryExec.ParamByName('CODGEO').AsString :=   FDMemTableEntvtejj.FieldByName('CODGEO').AsString;
  QryExec.Open;
  FDMemTableEntvtejj.FieldByName('TVA_ILES').AsBytes := QryExec.FieldByName('TVA_ILES').AsBytes;

  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM repres WHERE CODREP=:CODREP';
  QryExec.ParamByName('CODREP').AsInteger :=   FDMemTableEntvtejj.FieldByName('CODREP').AsInteger;
  QryExec.Open;
  LabelNomRepres.Caption := QryExec.FieldByName('NOM').AsString;
end;

procedure TFormEntvtejj.DBCODCLIExit(Sender: TObject);
begin
  DBCODCLIChange(SELF);
end;

procedure TFormEntvtejj.DBCODREPChange(Sender: TObject);
var
  QryExec: TFDQuery;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntvtejj.State in [dsEdit, dsInsert]) then
    Exit;

   // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.SQL.Text := 'SELECT * FROM repres WHERE CODREP=:CODREP';
  QryExec.ParamByName('CODREP').AsInteger := FDMemTableEntvtejj.FieldByName('CODREP').AsInteger;
  QryExec.Open;
  LabelNomRepres.Caption := QryExec.FieldByName('NOM').AsString;
end;

procedure TFormEntvtejj.DBCODREPExit(Sender: TObject);
begin
 DBCODREPChange(SELF);
end;

procedure TFormEntvtejj.RzDBCheckBoxEXO_TVAClick(Sender: TObject);
begin
  CalculCompletFacture;
end;

procedure TFormEntvtejj.RzDBCheckBoxTVA_ILESClick(Sender: TObject);
begin
  CalculCompletFacture;
end;

procedure TFormEntvtejj.RzDBRadioGroupTypeChange(Sender: TObject);
begin
  if RzDBRadioGroupType.Value = 'F' then
  begin
    JvDBGridLigvtejj.AlternateRowColor := RGB(240, 248, 255); // Rose clair
  end
  else
  begin
    JvDBGridLigvtejj.AlternateRowColor := RGB(255, 182, 193); // Alice blue
  end;
  //Relance calcul complet facture
  CalculCompletFacture;
end;


//CALCUL COMPLET DE LA FACTURE
procedure TFormEntvtejj.CalculCompletFacture;
var
  QryExec: TFDQuery;
  QryArticle: TFDQuery;
  pTVA: String;

  wHT0: Double;
  wHT0r: Double;
  wHT1: Double;
  wHT1r: Double;
  wHT2: Double;
  wHT2r: Double;
  wHT3: Double;
  wHT3r: Double;
  wHT4: Double;
  wHT4r: Double;
  wTVA1: Double;
  wTVA2: Double;
  wTVA3: Double;
  wTVA4: Double;

  MONT: Double;
  WTOT_REGLE: dOUBLE;

begin
  // On ne fait rien si la fiche est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntvtejj.State in [dsEdit, dsInsert]) then
    Exit;

   // Création requêtes temporaires dédiées aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;

  QryArticle := TFDQuery.Create(nil);
  QryArticle.Connection := DMGesCloud.ConnexionGesCloud;

  // Sauvegarde la position actuelle du curseur pour ne pas perturber l'utilisateur
  FDMemTableLigvtejj.DisableControls;
  try
    //Si exonere de TVA
	  if RzDBCheckBoxEXO_TVA.Checked then
    begin
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        FDMemTableLigvtejj.Edit;
				FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger := 0;
				FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat := 0;
				FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat := 0;
        FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat);
				FDMemTableLigvtejj.FieldByName('PRIXTTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat);
        FDMemTableLigvtejj.FieldByName('MARGE').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat - (FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat);
				FDMemTableLigvtejj.Post;
        FDMemTableLigvtejj.Next;
      end;
    end
    else
    begin
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        FDMemTableLigvtejj.Edit;

        //Lecture article
        QryArticle.Close;
        QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryArticle.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryArticle.Open;
				FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger := StrToIntDef(StringReplace(QryArticle.FieldByName('TVA').AsString, 'TVA', '', [rfReplaceAll, rfIgnoreCase]),0);
        pTVA := QryArticle.FieldByName('TVA').AsString;

        //Lecture Paramre
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM parame WHERE CODE=:CODE';
        QryExec.ParamByName('CODE').AsString := pTVA;
        QryExec.Open;
				FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat :=  QryExec.FieldByName('TAUX').AsFloat;
        FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat - ((FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('PRC_REMISE').AsFloat);
        FDMemTableLigvtejj.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat,FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat));
//				IF INT_FLAG_TAX = 0 ALORS
//					ligvtepc.mt_ttc	= ligvtepc.prixttc*ligvtepc.qte
//					ligvtepc.totht	= PRIX_HT(ligvtepc.mt_ttc,ligvtepc.tx_tva,ligvtepc.tx_tsoc,article.tax_soc)
//					ligvtepc.mt_tva	= ligvtepc.totht/100*ligvtepc.tx_tva
//					ligvtepc.mt_tsoc= ligvtepc.totht/100*ligvtepc.tx_tsoc
//				ELSE
					FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
					FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat := (FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat;
					//ligvtepc.mt_tsoc	= ligvtepc.totht/100*ligvtepc.tx_tsoc
					FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat+FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat);  //+ligvtepc.mt_tsoc)
//				END
        FDMemTableLigvtejj.FieldByName('MARGE').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat - (FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat);

				FDMemTableLigvtejj.Post;
        FDMemTableLigvtejj.Next;
      end;
    end;

    //Traitement TVA ILES
    IF RzDBCheckBoxTVA_ILES.Checked AND NOT RzDBCheckBoxEXO_TVA.Checked then
    begin
      FDMemTableLigvtejj.First;
      while not FDMemTableLigvtejj.Eof do
      begin
        FDMemTableLigvtejj.Edit;

        //Lecture article
        QryArticle.Close;
        QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryArticle.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryArticle.Open;

        if QryArticle.FieldByName('TVA').AsString = 'TVA0' then   //ppn
        begin
          FDMemTableLigvtejj.Next;
          CONTINUE;
        end;

        if QryArticle.FieldByName('EXCLU_TVA1').AsBoolean then	  //Exclu iles
        begin
          FDMemTableLigvtejj.Next;
          CONTINUE;
        end;

        //Recherche Taux TVA en cours
        if DM_Olivier.fgTxTaxe(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime,'TVAI')=0 then
        begin
          FDMemTableLigvtejj.Next;
          CONTINUE;
        end;

				FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger := 4;
        FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat	:= DM_Olivier.fgTxTaxe(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime,'TVAI');
        FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat - ((FDMemTableLigvtejj.FieldByName('PRIXHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('PRC_REMISE').AsFloat);
        FDMemTableLigvtejj.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat,FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat));
//        IF INT_FLAG_TAX = 0 ALORS
//          ligvtepc.mt_ttc	= ligvtepc.prixttc*ligvtepc.qte
//          ligvtepc.totht	= PRIX_HT(ligvtepc.mt_ttc,ligvtepc.tx_tva,ligvtepc.tx_tsoc,article.tax_soc)
//          ligvtepc.mt_tva	= ligvtepc.totht/100*ligvtepc.tx_tva
//          ligvtepc.mt_tsoc	= ligvtepc.totht/100*ligvtepc.tx_tsoc
//        ELSE
					FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat := FDMemTableLigvtejj.FieldByName('PRIXNET').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat;
					FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat := (FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat/100)*FDMemTableLigvtejj.FieldByName('TX_TVA').AsFloat;
					//ligvtepc.mt_tsoc	= ligvtepc.totht/100*ligvtepc.tx_tsoc
					FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat+FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat);  //+ligvtepc.mt_tsoc)
//        END
        FDMemTableLigvtejj.FieldByName('MARGE').AsFloat := FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat - (FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat);

        FDMemTableLigvtejj.post;
        FDMemTableLigvtejj.Next;
      end;
    end;

    //	CAL_EVP
    FDMemTableEntvtejj.FieldByName('ANNEE').AsInteger := YearOf(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime);
    FDMemTableEntvtejj.FieldByName('MOIS').AsInteger  := MonthOf(FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime);
    FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger  := 0;
    FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA').AsInteger  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA1').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA2').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVA3').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_TVAI').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MARGE').AsFloat  := 0;
    FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat  := 0;

    FDMemTableEntvtejj.FieldByName('CODGEO').AsString:=FDQueryClientsOuverts.FieldByName('CODGEO').Asstring;

    FDMemTableLigvtejj.First;
    while not FDMemTableLigvtejj.Eof do
    begin
        //BtnAnnuler.Enabled:=false;
        FDMemTableLigvtejj.Edit;

        //Lecture article
        QryArticle.Close;
        QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryArticle.ParamByName('CODART').AsString := FDMemTableLigvtejj.FieldByName('CODART').AsString;
        QryArticle.Open;

        DM_Olivier.FDQueryCtrstock.Open;
        IF DM_Olivier.FDQueryCtrstock.FieldByName('NATURE').AsString = 'G' then
        begin
          //!MàJ Prix détail (au cas ou client change)
          DM_Olivier.FDQueryPrixgeo.Close;
          DM_Olivier.FDQueryPrixgeo.ParamByName('CODART').AsString:=FDMemTableLigvtejj.FieldByName('CODART').AsString;
          DM_Olivier.FDQueryPrixgeo.ParamByName('CODGEO').AsString:=FDMemTableEntvtejj.FieldByName('CODGEO').AsString;
          DM_Olivier.FDQueryPrixgeo.Open;

          FDMemTableLigvtejj.FieldByName('DET_PPT').AsFloat := QryArticle.FieldByName('DET_PPT').AsFloat;
          FDMemTableLigvtejj.FieldByName('DET_ILE').AsFloat := QryArticle.FieldByName('DET_PPT').AsFloat * DM_Olivier.FDQueryPrixgeo.FieldByName('COEF').AsFloat;
        end;

        //!total cout revient prealable avant la marge globale
        FDMemTableEntvtejj.FieldByName('MARGE').AsFloat := FDMemTableEntvtejj.FieldByName('MARGE').AsFloat + (FDMemTableLigvtejj.FieldByName('PRIXREV').AsFloat * FDMemTableLigvtejj.FieldByName('QTE').AsFloat);

        //!Différents Cumuls
        FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger := FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger + FDMemTableLigvtejj.FieldByName('MT_TTC').AsInteger;

//        //!Calcul assiette Taxe sociale remisable globalement
//        wHTSOCr est un numérique
//        wHTSOC est un numérique
//        wMTSOC est un numérique
//        IF ligvtepc.mt_tsoc ALORS
//          IF article.prest =0 ALORS	//!Remisable global
//            wHTSOCr += ligvtepc.totht
//          END
//          wHTSOC += ligvtepc.totht
//          wMTSOC += ligvtepc.mt_tsoc
//        END

        //!Calcul assiettes TVA remisables globalement

        //Si exonere de TVA
    	  if RzDBCheckBoxEXO_TVA.Checked then
        begin
          if QryArticle.FieldByName('PREST').AsInteger=0 then	//!Remisable global
            wHT0r  := wHT0r + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
          wHT0  := wHT0 + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
        end
        else
        begin
          case FDMemTableLigvtejj.FieldByName('NO_TVA').AsInteger of
             0:
              begin
                if QryArticle.FieldByName('PREST').AsInteger=0 then	//!Remisable global
                  wHT0r  := wHT0r + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wHT0  := wHT0 + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
               end;

             1:
              begin
                if QryArticle.FieldByName('PREST').AsInteger=0 then	//!Remisable global
                  wHT1r  := wHT1r + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wHT1  := wHT1 + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wTVA1 := wTVA1 + FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat;
              end;

             2:
              begin
                if QryArticle.FieldByName('PREST').AsInteger=0 then	//!Remisable global
                  wHT2r  := wHT2r + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wHT2  := wHT2 + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wTVA2 := wTVA2 + FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat;
              end;

             3:
              begin
                if QryArticle.FieldByName('PREST').AsInteger=0 then	//!Remisable global
                  wHT3r  := wHT3r + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wHT3  := wHT3 + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wTVA3 := wTVA3 + FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat;
              end;

             4:
              begin
                if QryArticle.FieldByName('PREST').AsInteger=0 then	//!Remisable global
                  wHT4r  := wHT4r + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wHT4  := wHT4 + FDMemTableLigvtejj.FieldByName('TOTHT').AsFloat;
                wTVA4 := wTVA4 + FDMemTableLigvtejj.FieldByName('MT_TVA').AsFloat;
              end;
          end;
        end;

        FDMemTableLigvtejj.post;
        FDMemTableLigvtejj.Next;

      end;

    //!Assiettes et mont TVA
    FDMemTableEntvtejj.FieldByName('MT_HT0').AsFloat := wHT0;
    FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat := wHT1;
    FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat := wHT2;
    FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat := wHT3;
    FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat := wHT4;
    FDMemTableEntvtejj.FieldByName('MT_TVA1').AsFloat:= wTVA1;
    FDMemTableEntvtejj.FieldByName('MT_TVA2').AsFloat:= wTVA2;
    FDMemTableEntvtejj.FieldByName('MT_TVA3').AsFloat:= wTVA3;
    FDMemTableEntvtejj.FieldByName('MT_TVAI').AsFloat:= wTVA4;


//FDMemTableEntvtejj.FieldByName('.mt_htsoc	= wHTSOC
//SAI_MT_TSOC_EVC	= wMTSOC

    if FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat <> 0 then
    begin
      MONT := Round(((wHT0r * FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat) / 100));
      FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat	:= MONT;
      FDMemTableEntvtejj.FieldByName('MT_HT0').AsFloat    := FDMemTableEntvtejj.FieldByName('MT_HT0').AsFloat - MONT;

      MONT := Round(((wHT1r * FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat) / 100));
      FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat;
      FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat    := FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat - MONT;
      FDMemTableEntvtejj.FieldByName('MT_TVA1').AsFloat   := ((FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat/100) * DM_Olivier.gTx_TVA1);

      MONT := Round(((wHT2r * FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat) / 100));
      FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat;
      FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat    := FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat - MONT;
      FDMemTableEntvtejj.FieldByName('MT_TVA2').AsFloat   := ((FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat/100) * DM_Olivier.gTx_TVA2);

      MONT := Round(((wHT3r * FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat) / 100));
      FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat;
      FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat    := FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat - MONT;
      FDMemTableEntvtejj.FieldByName('MT_TVA3').AsFloat   := ((FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat/100) * DM_Olivier.gTx_TVA3);

      MONT := Round(((wHT4r * FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat) / 100));
      FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEntvtejj.FieldByName('MT_REMISE').AsFloat;
      FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat    := FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat - MONT;
      FDMemTableEntvtejj.FieldByName('MT_TVAI').AsFloat   := ((FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat/100) * DM_Olivier.gTx_TVAI);

//    MONT := Round(((wHTSOCr * FDMemTableEntvtejj.FieldByName('PRC_REMISE').AsFloat) / 100));
//    FDMemTableEntvtejj.FieldByName('.mt_htsoc -= MONT
//    SAI_MT_TSOC_EVC   = ((FDMemTableEntvtejj.FieldByName('.mt_htsoc/100) * FDMemTableEntvtejj.FieldByName('.tx_tsoc)
    end;

    FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat	:= FDMemTableEntvtejj.FieldByName('MT_HT0').AsFloat
    + FDMemTableEntvtejj.FieldByName('MT_HT1').AsFloat
    + FDMemTableEntvtejj.FieldByName('MT_HT2').AsFloat
    + FDMemTableEntvtejj.FieldByName('MT_HT3').AsFloat
    + FDMemTableEntvtejj.FieldByName('MT_HTI').AsFloat;

    FDMemTableEntvtejj.FieldByName('MT_TVA').AsFloat := FDMemTableEntvtejj.FieldByName('MT_TVA1').AsFloat
    + FDMemTableEntvtejj.FieldByName('MT_TVA2').AsFloat
    + FDMemTableEntvtejj.FieldByName('MT_TVA3').AsFloat
    + FDMemTableEntvtejj.FieldByName('MT_TVAI').AsFloat;

    //Calcul final de la marge globale
    FDMemTableEntvtejj.FieldByName('MARGE').AsFloat	:= FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat - FDMemTableEntvtejj.FieldByName('MARGE').AsFloat;

    //! Cause arrondi
    FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger := Round(FDMemTableEntvtejj.FieldByName('MT_TVA').AsFloat
     + FDMemTableEntvtejj.FieldByName('TOTHT').AsFloat);
     //+ SAI_MT_TSOC_EVC)

    //Test si facture réglée
    WTOT_REGLE :=0;
    //Lecture des reglements
    FDMemTableRegljj.First;
    while not FDMemTableRegljj.Eof do
    begin
      WTOT_REGLE := WTOT_REGLE + FDMemTableRegljj.FieldByName('MONTANT').AsFloat;
      FDMemTableRegljj.Next;
    end;

    if WTOT_REGLE=FDMemTableEntvtejj.FieldByName('MT_TTC').AsInteger then
    begin
      FDMemTableEntvtejj.FieldByName('REGL').AsInteger:=1;
      FDMemTableEntvtejj.FieldByName('TOP_').AsString:= 'F';
    end
    else
    begin
      FDMemTableEntvtejj.FieldByName('REGL').AsInteger:=0;
      FDMemTableEntvtejj.FieldByName('TOP_').AsString:= 'S';
    end;


  finally
    // Réactive l'affichage de la grille
    FDMemTableLigvtejj.EnableControls;
    QryExec.Free;
    QryArticle.Free;
  end;
end;



end.
