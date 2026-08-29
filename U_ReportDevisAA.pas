unit U_ReportDevisAA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport, RLFilters,
  RLPDFFilter, Vcl.ExtCtrls, JvExExtCtrls, JvShape, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormDevisPrint = class(TForm)
    RLReport1: TRLReport;
    RLBandHeader: TRLBand;
    RLBandColumnHeader: TRLBand;
    RLSubDetailLignes: TRLSubDetail;
    RLBandDetailLignes: TRLBand;
    RLBandSummary: TRLBand;
    RLBandPageFooter: TRLBand;
    RLDBTextSocTel: TRLDBText;
    RLDBTextSocFax: TRLDBText;
    RLDBTextSocRC: TRLDBText;
    RLDBTextSocTahiti: TRLDBText;
    RLDBTextCoddev: TRLDBText;
    RLDBTextDateFac: TRLDBText;
    RLDBTextRef: TRLDBText;
    RLDBTextRepres: TRLDBText;

    { Champs Client }
    RLDBTextCodCli: TRLDBText;
    RLDBTextCliNom: TRLDBText;
    RLDBTextCliAd1: TRLDBText;
    RLDBTextCliAd3: TRLDBText;
    RLDBTextCliTahiti: TRLDBText;

    { Colonnes Grille }
    RLDBTextArtRef: TRLDBText;
    RLDBTextArtDes: TRLDBMemo;
    RLDBTextArtQte: TRLDBText;
    RLDBTextArtPxHT: TRLDBText;
    RLDBTextArtRem: TRLDBText;
    RLDBTextArtNetHT: TRLDBText;
    RLDBTextArtTotTTC: TRLDBText;
    RLDBTextArtNoTVA: TRLDBText;

    { Labels, Memos et System }
    RLDBMemoGarantie: TRLDBMemo; // Mis à jour ici pour correspondre au DFM
    RLSystemInfoPage: TRLSystemInfo;
    DSEnt_prof: TDataSource;
    DSLig_prof: TDataSource;
    DSCtrstock: TDataSource;
    RLLblTotalHT: TRLLabel;
    RLLblTotalTTC: TRLLabel;
    RLLblTotalTaxes: TRLLabel;
    DSParameTVA: TDataSource;
    RLLblTVADesignation: TRLMemo;
    RLLabelRemise: TRLLabel;
    RLLblTotalRemise: TRLLabel;
    RLLPrc_remise: TRLLabel;
    RLDBMemoNomSoc: TRLDBMemo;
    RLDBTextCliAd2: TRLDBText;
    RLMemoArreteSomme: TRLMemo;
    RLImgLogo: TRLImage;
    DSRepres: TDataSource;
    RLDBTextVendeur: TRLDBText;
    RLLabel2: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    JvShape1: TJvShape;
    JvShape2: TJvShape;
    JvShape3: TJvShape;
    RLDBMemoObserv: TRLDBMemo;
    RLDBResultQte: TRLLabel;
    RLDBResultTOTHT: TRLLabel;
    JvShape5: TJvShape;
    JvShape6: TJvShape;
    FDQueryLig_prof: TFDQuery;
    FDQueryLig_profLIBELLE: TMemoField;
    FDQueryLig_profCODFAC: TLargeintField;
    FDQueryLig_profCODCLI: TIntegerField;
    FDQueryLig_profCODCAI: TStringField;
    FDQueryLig_profCODDEV: TLargeintField;
    FDQueryLig_profCODDEP: TShortintField;
    FDQueryLig_profNOENR: TIntegerField;
    FDQueryLig_profANNEE: TIntegerField;
    FDQueryLig_profMOIS: TSmallintField;
    FDQueryLig_profCODREP: TSmallintField;
    FDQueryLig_profCODFOU: TStringField;
    FDQueryLig_profCODSSF: TStringField;
    FDQueryLig_profCODFAM: TStringField;
    FDQueryLig_profCODDPT: TStringField;
    FDQueryLig_profTYPE_: TStringField;
    FDQueryLig_profCODART: TStringField;
    FDQueryLig_profCODBAR: TStringField;
    FDQueryLig_profQTE: TBCDField;
    FDQueryLig_profPOIDS: TBCDField;
    FDQueryLig_profCODTAR: TStringField;
    FDQueryLig_profPRIXHT: TBCDField;
    FDQueryLig_profPRIXTTC: TLargeintField;
    FDQueryLig_profPRIXNET: TBCDField;
    FDQueryLig_profTOTHT: TBCDField;
    FDQueryLig_profMT_TTC: TLargeintField;
    FDQueryLig_profPRC_REMISE: TBCDField;
    FDQueryLig_profMT_REMISE: TIntegerField;
    FDQueryLig_profTX_TVA: TBCDField;
    FDQueryLig_profMT_TVA: TBCDField;
    FDQueryLig_profNO_TVA: TSmallintField;
    FDQueryLig_profPRIXREV: TBCDField;
    FDQueryLig_profMARGE: TLargeintField;
    FDQueryLig_profNO_SEM: TSmallintField;
    FDQueryLig_profNO_JOUR: TSmallintField;
    FDQueryLig_profDET_PPT: TLargeintField;
    FDQueryLig_profDET_ILE: TLargeintField;
    FDQueryLig_profNOENRF: TFDAutoIncField;
    FDQueryLig_profDER_MODIF: TSQLTimeStampField;
    FDQueryLig_profIMP_CODE: TSmallintField;
    FDQueryLig_profTX_TSOC: TBCDField;
    FDQueryLig_profMT_TSOC: TBCDField;

    procedure RLBandSummaryBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandHeaderBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBandDetailLignesBeforePrint(Sender: TObject;
      var PrintIt: Boolean);

  private
    FCalculQte : Double;
    FCalculHT  : Double;

  public
    { Public declarations }
  end;

var
  FormDevisPrint: TFormDevisPrint;
  // Déclarations des variables globales pour sécuriser les valeurs
  MntTotalHT, MntTotalTaxes, MntTotalTTC: Double;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier, U_FicheClient;


procedure TFormDevisPrint.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  // 1. On ouvre la table de configuration de l'entreprise si elle est fermée
  if not DMGesCloud.ReqRepres.Active then
    DMGesCloud.FDQueryRepres.Open;

  if not DMGesCloud.FDQueryCtrstock.Active then
    DMGesCloud.FDQueryCtrstock.Open;

  if not DMGesCloud.FDQueryParameTVA.Active then
    DMGesCloud.FDQueryParameTVA.Open;

  // 2. On sauvegarde les montants de la facture tant qu'on est sur le bon enregistrement
  if (DSEnt_prof.DataSet <> nil) and not DSEnt_prof.DataSet.IsEmpty then
  begin
    MntTotalHT    := DSEnt_prof.DataSet.FieldByName('TOTHT').AsFloat;
    MntTotalTaxes := DSEnt_prof.DataSet.FieldByName('MT_TVA').AsFloat;
    MntTotalTTC   := DSEnt_prof.DataSet.FieldByName('MT_TTC').AsFloat;
  end
  else
  begin
    MntTotalHT    := 0;
    MntTotalTaxes := 0;
    MntTotalTTC   := 0;
  end;
  FCalculQte := 0;
  FCalculHT  := 0;
end;


procedure TFormDevisPrint.RLBandDetailLignesBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  // Remplace QTE et TOTHT par les vrais noms de tes champs de ta requête de lignes
  FCalculQte := FCalculQte + DSLig_prof.DataSet.FieldByName('QTE').AsFloat;
  FCalculHT  := FCalculHT  + DSLig_prof.DataSet.FieldByName('TOTHT').AsFloat;
end;

procedure TFormDevisPrint.RLBandHeaderBeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  CheminLogo: string;
begin
  // 1. Récupération du chemin du logo depuis ta table/requête
  CheminLogo := DMGesCloud.FDQueryCtrStock.FieldByName('logo').AsString; // Ajuste le nom exact de ta requête/table CtrStock

  // 2. Vérification et chargement dynamique
  if (CheminLogo <> '') and FileExists(CheminLogo) then
  begin
    RLImgLogo.Visible := True;
    RLImgLogo.Picture.LoadFromFile(CheminLogo);
  end
  else
  begin
    // Si pas de logo ou fichier introuvable, on masque le composant pour éviter un carré blanc
    RLImgLogo.Visible := False;
  end;
end;


procedure TFormDevisPrint.RLBandSummaryBeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  QueryEnt: TDataSet;
  QueryPar: TDataSet;
  TxtDesignation: string;
  MntRemise: Currency;


  // Procédure interne pour aligner proprement le texte sous forme de colonnes
  procedure AjouterLigneTVA(const NumeroTVA, CodeTVA: string; MntHT, MntTVA: Currency);
  var
    LigneDetail, LibelleComplet: string;
  begin
    if MntHT <> 0 then
    begin
      if QueryPar.Locate('CODE', CodeTVA, []) then
      begin
        if TxtDesignation <> '' then TxtDesignation := TxtDesignation + #13#10;

        LibelleComplet := NumeroTVA + ' - ' + QueryPar.FieldByName('LIBELLE').AsString + ' (' + QueryPar.FieldByName('TAUX').AsString + '%)';

        // Construction d'une ligne unique alignée (ex: Libellé calé à gauche, montants calés à droite)
        LigneDetail := Format('%-28s %12s %12s', [
          LibelleComplet,
          FormatFloat('0.00', MntHT),
          FormatFloat('0.00', MntTVA)
        ]);

        TxtDesignation := TxtDesignation + LigneDetail;
      end;
    end;
  end;



begin
  QueryEnt := DM_Olivier.FDQueryEnt_prof;
  QueryPar := DSParameTVA.DataSet;


// 1. GESTION DYNAMIQUE DU BLOC TVA (Un seul texte combiné)
  TxtDesignation := '';

  // Étape A : On traite le taux 0 en premier directement (sans toucher au curseur)
  if QueryEnt.FieldByName('MT_HT0').AsCurrency <> 0 then
  begin
    TxtDesignation := Format('%-28s %12s %12s', [
      '0 - Exonéré (0%)',
      FormatFloat('0.00', QueryEnt.FieldByName('MT_HT0').AsCurrency),
      FormatFloat('0.00', 0.0)
    ]);
  end;


  // Étape B : On ajoute les autres taux à la suite
  AjouterLigneTVA('1', 'TVA1', QueryEnt.FieldByName('MT_HT1').AsCurrency, QueryEnt.FieldByName('MT_TVA1').AsCurrency);
  AjouterLigneTVA('2', 'TVA2', QueryEnt.FieldByName('MT_HT2').AsCurrency, QueryEnt.FieldByName('MT_TVA2').AsCurrency);
  AjouterLigneTVA('3', 'TVA3', QueryEnt.FieldByName('MT_HT3').AsCurrency, QueryEnt.FieldByName('MT_TVA3').AsCurrency);
  AjouterLigneTVA('4', 'TVAI', QueryEnt.FieldByName('MT_HTI').AsCurrency, QueryEnt.FieldByName('MT_TVAI').AsCurrency);

  // On injecte tout dans le composant principal
  RLLblTVADesignation.Lines.Text := TxtDesignation;


  // 1b. GESTION DE LA REMISE GLOBALE
  MntRemise := QueryEnt.FieldByName('MT_REMISE').AsCurrency;

  if MntRemise <> 0 then
  begin
    // Afficher les éléments de la remise
    RLLabelRemise.Visible   := True;
    RLLPrc_remise.Visible   := True;
    RLLblTotalRemise.Visible:= True;
    RLLPrc_remise.Caption   := QueryEnt.FieldByName('PRC_REMISE').AsString + '%';
    RLLblTotalRemise.Caption:= FormatFloat('#,##0.00', MntRemise);

    // Cadre GRAND (englobe la Remise + les Totaux)
    JvShape5.Top    := 25; // Ajuste cette valeur selon la position initiale de ton cadre
    JvShape5.Height := 77;  // Hauteur totale avec la ligne Remise
  end
  else
  begin
    // Masquer la remise
    RLLabelRemise.Visible   := False;
    RLLPrc_remise.Visible   := False;
    RLLblTotalRemise.Visible:= False;

    // Cadre PETIT (commence plus bas, au niveau de TOTAL HT)
    JvShape5.Top    := 38; // Ajuste pour aligner le haut du cadre juste au-dessus de TOTAL HT
    JvShape5.Height := 65;  // Hauteur réduite
  end;

  // 2. Grands Totaux (mis avec .00 pour s'aligner sur tes colonnes du haut !)
  RLLblTotalHT.Caption    := FormatFloat('#,##0.00', MntTotalHT);
  RLLblTotalTaxes.Caption := FormatFloat('#,##0.00', MntTotalTaxes);
  RLLblTotalTTC.Caption    := FormatFloat('#,##0 Fcp.', MntTotalTTC);

  // 3. Libellé en toutes lettres
  RLMemoArreteSomme.Lines.Text := 'Devis arrêté à la somme de : ' +
                                  DMGesCloud.MontantenLettres(MntTotalTTC) + ' Francs CFP.';

  RLDBResultQte.Caption := FormatFloat('#,##0.00', FCalculQte);
  RLDBResultTOTHT.Caption  := FormatFloat('#,##0.00', FCalculHT);
end;

end.
