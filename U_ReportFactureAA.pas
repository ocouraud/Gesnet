unit U_ReportFactureAA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport, RLFilters,
  RLPDFFilter, Vcl.ExtCtrls, JvExExtCtrls, JvShape;

type
  TFormFacturePrint = class(TForm)
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

    { Champs Facture }
    RLDBTextNumFac: TRLDBText;
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
    DSEntvteaa: TDataSource;
    DSLigvteaa: TDataSource;
    DSReglaa: TDataSource;
    DSCtrstock: TDataSource;
    RLLblTotalHT: TRLLabel;
    RLLblTotalTTC: TRLLabel;
    RLLblTotalTaxes: TRLLabel;

    RLLblRegL1_Lib: TRLLabel;
    RLLblRegL1_Mnt: TRLLabel;
    RLLblRegL1_Ech: TRLLabel;
    RLLblRegL2_Lib: TRLLabel;
    RLLblRegL2_Mnt: TRLLabel;
    RLLblRegL2_Ech: TRLLabel;
    RLLblRegL3_Lib: TRLLabel;
    RLLblRegL3_Mnt: TRLLabel;
    RLLblRegL3_Ech: TRLLabel;
    RLLblRegL4_Lib: TRLLabel;
    RLLblRegL4_Mnt: TRLLabel;
    RLLblRegL4_Ech: TRLLabel;
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
    JvShape4: TJvShape;
    RLDBMemoObserv: TRLDBMemo;
    RLDBResultQte: TRLLabel;
    RLDBResultTOTHT: TRLLabel;
    JvShape5: TJvShape;
    JvShape6: TJvShape;

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
  FormFacturePrint: TFormFacturePrint;
  // Déclarations des variables globales pour sécuriser les valeurs
  MntTotalHT, MntTotalTaxes, MntTotalTTC: Double;

implementation

{$R *.dfm}

uses U_DataModule, U_FicheClient;


procedure TFormFacturePrint.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  // 1. On ouvre la table de configuration de l'entreprise si elle est fermée
  if not DMGesCloud.ReqRepres.Active then
    DMGesCloud.FDQueryRepres.Open;

  if not DMGesCloud.FDQueryCtrstock.Active then
    DMGesCloud.FDQueryCtrstock.Open;

  if not DMGesCloud.FDQueryParameTVA.Active then
    DMGesCloud.FDQueryParameTVA.Open;

  // 2. On sauvegarde les montants de la facture tant qu'on est sur le bon enregistrement
  if (DSEntvteaa.DataSet <> nil) and not DSEntvteaa.DataSet.IsEmpty then
  begin
    MntTotalHT    := DSEntvteaa.DataSet.FieldByName('TOTHT').AsFloat;
    MntTotalTaxes := DSEntvteaa.DataSet.FieldByName('MT_TVA').AsFloat;
    MntTotalTTC   := DSEntvteaa.DataSet.FieldByName('MT_TTC').AsFloat;
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


procedure TFormFacturePrint.RLBandDetailLignesBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  // Remplace QTE et TOTHT par les vrais noms de tes champs de ta requête de lignes
  FCalculQte := FCalculQte + DSLigvteaa.DataSet.FieldByName('QTE').AsFloat;
  FCalculHT  := FCalculHT  + DSLigvteaa.DataSet.FieldByName('TOTHT').AsFloat;
end;

procedure TFormFacturePrint.RLBandHeaderBeforePrint(Sender: TObject; var PrintIt: Boolean);
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


procedure TFormFacturePrint.RLBandSummaryBeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  i: Integer;
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
  QueryEnt := DMGesCloud.FDQueryPrintEntvteaa;
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
  RLMemoArreteSomme.Lines.Text := 'Facture arrêtée à la somme de : ' +
                                  DMGesCloud.MontantenLettres(MntTotalTTC) + ' Francs CFP.';

  // 4. Nettoyage et remplissage des labels de règlement
  RLLblRegL1_Lib.Caption := ''; RLLblRegL1_Mnt.Caption := ''; RLLblRegL1_Ech.Caption := '';
  RLLblRegL2_Lib.Caption := ''; RLLblRegL2_Mnt.Caption := ''; RLLblRegL2_Ech.Caption := '';
  RLLblRegL3_Lib.Caption := ''; RLLblRegL3_Mnt.Caption := ''; RLLblRegL3_Ech.Caption := '';
  RLLblRegL4_Lib.Caption := ''; RLLblRegL4_Mnt.Caption := ''; RLLblRegL4_Ech.Caption := '';

  DMGesCloud.FDQueryReglaa.First;
  i := 1;
  while (not DMGesCloud.FDQueryReglaa.Eof) and (i <= 4) do
  begin
    case i of
      1: begin
           RLLblRegL1_Lib.Caption := DMGesCloud.FDQueryReglaa.FieldByName('LIBELLE').AsString;
           RLLblRegL1_Mnt.Caption := FormatFloat('#,##0', DMGesCloud.FDQueryReglaa.FieldByName('MONTANT').AsCurrency);
           RLLblRegL1_Ech.Caption := DMGesCloud.FDQueryReglaa.FieldByName('DATE_ECH').AsString;
         end;
      2: begin
           RLLblRegL2_Lib.Caption := DMGesCloud.FDQueryReglaa.FieldByName('LIBELLE').AsString;
           RLLblRegL2_Mnt.Caption := FormatFloat('#,##0', DMGesCloud.FDQueryReglaa.FieldByName('MONTANT').AsCurrency);
           RLLblRegL2_Ech.Caption := DMGesCloud.FDQueryReglaa.FieldByName('DATE_ECH').AsString;
         end;
      3: begin
           RLLblRegL3_Lib.Caption := DMGesCloud.FDQueryReglaa.FieldByName('LIBELLE').AsString;
           RLLblRegL3_Mnt.Caption := FormatFloat('#,##0', DMGesCloud.FDQueryReglaa.FieldByName('MONTANT').AsCurrency);
           RLLblRegL3_Ech.Caption := DMGesCloud.FDQueryReglaa.FieldByName('DATE_ECH').AsString;
         end;
      4: begin
           RLLblRegL4_Lib.Caption := DMGesCloud.FDQueryReglaa.FieldByName('LIBELLE').AsString;
           RLLblRegL4_Mnt.Caption := FormatFloat('#,##0', DMGesCloud.FDQueryReglaa.FieldByName('MONTANT').AsCurrency);
           RLLblRegL4_Ech.Caption := DMGesCloud.FDQueryReglaa.FieldByName('DATE_ECH').AsString;
         end;
    end;
    Inc(i);
    DMGesCloud.FDQueryReglaa.Next;
  end;
  RLDBResultQte.Caption := FormatFloat('#,##0.00', FCalculQte);
  RLDBResultTOTHT.Caption  := FormatFloat('#,##0.00', FCalculHT);
end;

end.
