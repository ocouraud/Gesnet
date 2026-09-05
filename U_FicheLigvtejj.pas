unit U_FicheLigvtejj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, JvExMask, JvToolEdit, JvBaseEdits,
  JvDBControls, JvSpin, JvDBSpinEdit, JvExControls, JvDBLookup, Vcl.ComCtrls;

type
  TModeSaisieLigne = (msAjout, msModification); // Type nommé global à l'unité
  TFormLigvtejj = class(TForm)
    DSLigvtejj: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery1LIBELLE: TMemoField;
    FDQuery1CODFAC: TLargeintField;
    FDQuery1CODCLI: TIntegerField;
    FDQuery1CODCAI: TStringField;
    FDQuery1CODDEV: TLargeintField;
    FDQuery1CODDEP: TShortintField;
    FDQuery1NOENR: TIntegerField;
    FDQuery1ANNEE: TIntegerField;
    FDQuery1MOIS: TSmallintField;
    FDQuery1CODREP: TSmallintField;
    FDQuery1CODFOU: TStringField;
    FDQuery1CODSSF: TStringField;
    FDQuery1CODFAM: TStringField;
    FDQuery1CODDPT: TStringField;
    FDQuery1TYPE_: TStringField;
    FDQuery1CODART: TStringField;
    FDQuery1CODBAR: TStringField;
    FDQuery1QTE: TBCDField;
    FDQuery1POIDS: TBCDField;
    FDQuery1CODTAR: TStringField;
    FDQuery1PRIXHT: TBCDField;
    FDQuery1PRIXTTC: TLargeintField;
    FDQuery1PRIXNET: TBCDField;
    FDQuery1TOTHT: TBCDField;
    FDQuery1MT_TTC: TLargeintField;
    FDQuery1PRC_REMISE: TBCDField;
    FDQuery1MT_REMISE: TIntegerField;
    FDQuery1TX_TVA: TBCDField;
    FDQuery1MT_TVA: TBCDField;
    FDQuery1NO_TVA: TSmallintField;
    FDQuery1PRIXREV: TBCDField;
    FDQuery1MARGE: TLargeintField;
    FDQuery1NO_SEM: TSmallintField;
    FDQuery1NO_JOUR: TSmallintField;
    FDQuery1DET_PPT: TLargeintField;
    FDQuery1DET_ILE: TLargeintField;
    FDQuery1NOENRF: TFDAutoIncField;
    FDQuery1PXLVTTC: TLargeintField;
    FDQuery1DER_MODIF: TSQLTimeStampField;
    FDQuery1TX_TSOC: TBCDField;
    FDQuery1MT_TSOC: TBCDField;
    Label1: TLabel;
    DBCodbar: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBLibelle: TDBMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBPrixnet: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBTotht: TDBEdit;
    Label8: TLabel;
    DBMt_ttc: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBMt_remise: TDBEdit;
    Label11: TLabel;
    DBTx_tva: TDBEdit;
    Label12: TLabel;
    DBMt_tva: TDBEdit;
    Label13: TLabel;
    DBDET_PPT: TDBEdit;
    Label14: TLabel;
    DBDET_ILE: TDBEdit;
    Label15: TLabel;
    DBPXLVTTC: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    DBQte: TJvDBCalcEdit;
    DBPrixht: TJvDBCalcEdit;
    DBPrixttc: TJvDBCalcEdit;
    DBPrc_remise: TJvDBSpinEdit;
    FDQueryCodbar: TFDQuery;
    DSCodbar: TDataSource;
    JvDBLookupComboCodbar: TJvDBLookupCombo;
    FDQueryCodbarOBSERV: TMemoField;
    FDQueryCodbarCODART: TStringField;
    FDQueryCodbarFERME: TSmallintField;
    FDQueryCodbarLIBELLE: TStringField;
    FDQueryCodbarCODFAM: TStringField;
    FDQueryCodbarCODDPT: TStringField;
    FDQueryCodbarCODSSF: TStringField;
    FDQueryCodbarCODFOU: TStringField;
    FDQueryCodbarREF_FOU: TStringField;
    FDQueryCodbarCOND: TIntegerField;
    FDQueryCodbarQTEMIN: TIntegerField;
    FDQueryCodbarUNIMIN: TSmallintField;
    FDQueryCodbarPRIXVTE: TBCDField;
    FDQueryCodbarPMP: TBCDField;
    FDQueryCodbarPRIXACH: TBCDField;
    FDQueryCodbarCOM_PR: TBCDField;
    FDQueryCodbarQTE: TBCDField;
    FDQueryCodbarUNIT: TSmallintField;
    FDQueryCodbarQTECDE: TIntegerField;
    FDQueryCodbarCODEMP: TStringField;
    FDQueryCodbarVOLUME: TBCDField;
    FDQueryCodbarUC: TStringField;
    FDQueryCodbarQTE_UV_UC: TSmallintField;
    FDQueryCodbarPOIDS: TBCDField;
    FDQueryCodbarTVA: TStringField;
    FDQueryCodbarPREST: TSmallintField;
    FDQueryCodbarG_STO: TSmallintField;
    FDQueryCodbarDET_PPT: TIntegerField;
    FDQueryCodbarCODPRIX: TStringField;
    FDQueryCodbarSELECT_: TSmallintField;
    FDQueryCodbarLOT: TSmallintField;
    FDQueryCodbarGARANTIE: TSmallintField;
    FDQueryCodbarQTE_AUTO: TSmallintField;
    FDQueryCodbarDER_MODIF: TSQLTimeStampField;
    FDQueryCodbarOBSERV_FAC: TSmallintField;
    FDQueryCodbarIMAGE: TStringField;
    FDQueryCodbarCODFAM_WEB: TStringField;
    FDQueryCodbarLIBCOURT: TStringField;
    FDQueryCodbarPXLVHT: TBCDField;
    FDQueryCodbarLIBRE_PPT: TSmallintField;
    FDQueryCodbarTAX_SOC: TSmallintField;
    FDQueryCodbarEXCLU_TVA1: TBooleanField;
    FDQueryCodbarcodbar: TStringField;
    PanelFond: TPanel;
    Shape1: TShape;
    BalloonHint1: TBalloonHint;
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure DBPrc_remiseExit(Sender: TObject);
    procedure DBQteExit(Sender: TObject);
    procedure DBPrixhtExit(Sender: TObject);
    procedure DBPrixttcExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBPrc_remiseChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBPrc_remiseEnter(Sender: TObject);
    procedure DBCodbarEnter(Sender: TObject);
    procedure DBCodbarExit(Sender: TObject);
    procedure DBQteEnter(Sender: TObject);
  private
    { Déclarations privées }
    FIsLoading: Boolean;   //Juste pour louverture
    procedure CalculLigne;
  public
    { Déclarations publiques }
    ModeSaisieLigne: TModeSaisieLigne; // On utilise ce type ici
  end;

var
  FormLigvtejj: TFormLigvtejj;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_FicheEntvtejj, U_DataModule;


//CALCUL COMPLET DE LA LIGNE
procedure TFormLigvtejj.CalculLigne;
begin
  // Si le formulaire est en train de se fermer ou de valider, on dégage immédiatement
  if (ModalResult <> mrNone) or (FIsLoading = False) then
    Exit;

  DSLigvtejj.DataSet.Edit;

  DBPrixnet.Field.AsFloat := DBPrixht.Field.AsFloat
   -((DBPrixht.Field.AsFloat/100)*DBPrc_remise.Value);

  DBPrixttc.Field.AsInteger := round(DM_Olivier.CalculerTTC(DBPrixnet.Field.AsFloat,DBTx_tva.Field.AsFloat));

  if FormEntvtejj.RzDBCheckBoxFlag_Tax.Enabled then
  begin
    DBMt_ttc.Field.AsInteger :=	DBPrixttc.Field.AsInteger * DBQte.Field.AsInteger;
    DBTotht.Field.AsFloat := DM_Olivier.CalculerHT(DBMt_ttc.Field.AsInteger,DBTx_tva.Field.AsFloat);
    DBMt_tva.Field.AsFloat := (DBTotht.Field.AsFloat/100) * DBTx_tva.Field.AsFloat;
    //SAI_MT_TSOC= ligvtepc.totht/100*SAI_TX_TSOC
  end
  else
  begin
    DBTotht.Field.AsFloat := DBPrixnet.Field.AsFloat * DBQte.Field.AsFloat;
    DBMt_tva.Field.AsFloat := (DBTotht.Field.AsFloat/100)*DBTx_tva.Field.AsFloat;
    //SAI_MT_TSOC= SAI_TOTHT/100*SAI_TX_TSOC
    DBMt_ttc.Field.AsInteger := Round(DBTotht.Field.AsFloat + DBMt_tva.Field.AsFloat);    //+SAI_MT_TSOC)
  end;
end;


procedure TFormLigvtejj.DBCodbarEnter(Sender: TObject);
begin
  FIsLoading := True;
end;


procedure TFormLigvtejj.DBCodbarExit(Sender: TObject);
var
  QryExec: TFDQuery;
  pTVA: String;
begin

   //Creation requete temporaire
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM codbar where CODBAR=:CODBAR';
  QryExec.ParamByName('CODBAR').AsString:=DBCodbar.Field.AsString;
  QryExec.Open;
  IF QryExec.Eof then
  begin
    //ShowMessage('Article inconnu !');
    //StatusBar1.SimpleText := '⚠️ Article inconnu !';
    // Affichage d'une bulle d'aide près du composant
    //BalloonHint1.Title := '⚠ Article inconnu !';
    BalloonHint1.Description := '⚠ Article inconnu !';
    BalloonHint1.ShowHint(DBCodbar);
    JvDBLookupComboCodbar.SetFocus;
    QryExec.Free;
    exit;
  end;

  DSLigvtejj.DataSet.FieldByName('CODART').AsString := QryExec.FieldByName('CODART').AsString;

  //Toutes les relations...
  if DBCodbar.Field.AsString<>DBCodbar.Field.OldValue then
  begin
    //DBLibelle.Text := JvDBLookupComboCodbar.LookupSource.DataSet.FieldByName('libelle').AsString;
    DBLibelle.Text := FDQueryCodbar.FieldByName('libelle').AsString;
    DBPrixht.Field.AsFloat := FDQueryCodbar.FieldByName('prixvte').AsFloat;

    //Recherche tx TVA
    pTVA := FDQueryCodbar.FieldByName('TVA').AsString;
    if pTVA = 'TVA0' then
      DBTx_tva.Field.AsFloat := 0
    else if pTVA = 'TVA1' then
      DBTx_tva.Field.AsFloat := DM_Olivier.gTx_TVA1
    else if pTVA = 'TVA2' then
      DBTx_tva.Field.AsFloat := DM_Olivier.gTx_TVA2
    else if pTVA = 'TVA3' then
      DBTx_tva.Field.AsFloat := DM_Olivier.gTx_TVA3;

    DSLigvtejj.DataSet.FieldByName('NO_TVA').AsInteger := StrToInt(pTVA[Length(pTVA)]);

    //Si TVA Iles
    if (FormEntvtejj.RzDBCheckBoxTVA_ILES.Checked) and (FDQueryCodbar.FieldByName('EXCLU_TVA1').AsBoolean=False) then
    begin
       DBTx_tva.Field.AsFloat:=DM_Olivier.gTx_TVAI;
       DSLigvtejj.DataSet.FieldByName('NO_TVA').AsInteger := 4;
    end;

    //Si exonere TVA
    IF FormEntvtejj.RzDBCheckBoxEXO_TVA.Checked then
     DBTx_tva.Field.AsFloat:=0;

    CalculLigne;
  end;

  DBQte.SetFocus;

//		SI client.app_tarifcli ALORS //Tarif client uniquement
//			gpTab_codbar=Ouvre(FEN_Vision_codbar,ligvtepc.coddep,client.codcli,client.codcli)
//		SINON
//			gpTab_codbar=Ouvre(FEN_Vision_codbar,ligvtepc.coddep,0,client.codcli)
//		FIN
//		SAI_CODBAR=gpTab_codbar[ind]

//	HLitRecherchePremier(codbar,codbar,SAI_CODBAR)
//	SI HTrouve(codbar)=Faux ALORS
//		SAI_CODBAR=""
//		Info("Code article de facturation inconnu")
//		RepriseSaisie(SAI_CODBAR)
//	FIN
//
//FIN
//
//SAI_CODART=codbar.codart
//HLitRecherchePremier(article,codart,SAI_CODART)
//SI SAI_CODART<>sav_codart ALORS
//	SAI_LIBELLE	= article.libelle
//FIN
//Message("")
//
////Recherche artcli_bloq client-article
//SI HLitRecherchePremier(artcli_bloq,key_art_cli,[codbar.codart,client.codcli]) ALORS
//	SI artcli_bloq.bloque=Vrai ALORS
//		Info("Article interdit à la vente pour ce client")
//		RepriseSaisie(SAI_CODBAR)
//	FIN
//END
//
//IF entvtepc.type_<>"F" AND SAI_QTE>0
//	ligvtepc.qte = -1 * SAI_QTE
//END
//
//IF article.observ<>"" AND article.observ_fac=1
//	SAI_LIBELLE=SAI_LIBELLE + CR + article.observ
//END
//
//SI SAI_CODART<>sav_codart ALORS
//	SAI_PRIXHT=article.prixvte
//FIN
//sav_codart=SAI_CODART
//
////!Recherche Tarifcli client-article
//SI HLitRecherchePremier(tarifcli,tcl_key_cli_art,[client.codcli,SAI_CODART]) ALORS
//	SI tarifcli.prixvte<>0 ALORS
//		SAI_PRIXHT	= tarifcli.prixvte	//SAI_PRIXHT*(1-(tarifcli.PRC_REMISE/100))
//	SINON
//		SAI_PRC_REMISE=tarifcli.prc_remise
//	FIN
//END
//
//
//IF client.coef_maj_pr=0 AND client.rem_fam=1 ALORS       //!On ne cumul pas les avantages ! THEN
//	HFiltre(famrem,far_key_famrem_fam,article.codfam)
//	HLitPremier(famrem,far_key_famrem_fam)
//	//HLitRecherchePremier(famrem,FAR_KEY_FAMREM_FAM,[article.CODFAM,"20991231"])
//	TANTQUE HTrouve(famrem)
//		IF famrem.dat_fin<SAI_DATE_ THEN
//			SORTIR
//		FIN
//		IF famrem.dat_deb>SAI_DATE_ THEN
//			HLitSuivant(famrem)
//			CONTINUER
//		FIN
//		SAI_PRC_REMISE=famrem.prc_rem
//		SORTIR
//	END
//	HDésactiveFiltre(famrem)
//END
//
//IF client.coef_maj_pr=0 ALORS 						     //!On ne cumul pas les avantages !
//	//!Recherche Promo article
//	HFiltre(promo,pro_key_promo_art,SAI_CODART)
//	HLitPremier(promo,pro_key_promo_art)
//	//HLitRecherchePremier(promo,PRO_KEY_PROMO_ART,[SAI_CODART,"20991231"])
//	TANTQUE HTrouve(promo)
//		IF promo.dat_fin<SAI_DATE_ THEN
//			SORTIR
//		END
//		IF promo.dat_deb>SAI_DATE_ THEN
//			HLitSuivant(promo)
//			CONTINUER
//		FIN
//		IF promo.prixht ALORS
//			SAI_PRIXHT=promo.prixht
//		ELSE
//			SAI_PRC_REMISE=promo.prc_rem
//		END
//		SORTIR
//	END
//	HDésactiveFiltre(promo)
//END
//
////!Recherche si remisable
//IF article.prest
//	SAI_PRC_REMISE			= 0
//	SAI_PRC_REMISE..Etat	= Grisé
//ELSE
//	SAI_PRC_REMISE..Etat=Actif
//END
//
//
////!CALCUL PRIXHT si basé sur coef major pr        !Revatel pour PLB FAAA 3/02/2020
//IF client.coef_maj_pr ALORS
//	HLitRecherchePremier(stodep,std_key_std_dep,[ligvtepc.coddep,SAI_CODART])
//	IF HTrouve()=Faux ALORS
//		HRAZ(stodep)
//		stodep.coddep	= ligvtepc.coddep
//		stodep.codart	= SAI_CODART
//		stodep.rapport	= 1
//		stodep.condit	= "PIECE"
//		stodep.pmp		= article.pmp
//		HAjoute(stodep)
//	END
//	IF stodep.pmp=0 AND article.pmp>0 ALORS
//		stodep.pmp=article.pmp
//		HModifie(stodep)
//	END
//	//!Valorisé au PMP STODEP
//	ligvtepc.prixrev	= stodep.pmp
//	SAI_PRIXHT	= ligvtepc.prixrev * client.coef_maj_pr
//END
//
////!Calcul des prix détail
//IF ctrstock.nature="G" ALORS
//	ligvtepc.det_ppt= article.det_ppt
//	SI HLitRecherchePremier(prixgeo,primary,[entvtepc.codgeo,article.codprix])=Vrai
//		ligvtepc.det_ile = ligvtepc.det_ppt * prixgeo.coef
//	FIN
//END
//
//ligvtepc.prixrev=article.pmp
//IF article.g_sto=1 AND entvtepc.type_<>"P"  ALORS //!Prison: Avoir Financier
//	HLitRecherchePremier(stodep,std_key_std_dep,[ligvtepc.coddep,SAI_CODART])
//	IF HTrouve()=Faux ALORS
//		//!Recherche autre dépot avec Tarif->Dépot (Presse)
//		HLitRecherchePremier(stodep,codart,SAI_CODART)
//		TANTQUE HTrouve(stodep)
//			//!Recherche Tarif article affecté à 1 dépôt différent
//			HLitRecherchePremier(tarifart,tara_key_tara_at,SAI_CODART,hGénérique)
//			IF HTrouve(tarifart) OR tarifart.codart=SAI_CODART ALORS
//				HLitRecherchePremier(TARIF,CODTAR,tarifart.codtar)
//				IF tarif.coddep<>0
//					ligvtepc.coddep	= tarif.coddep
//					SAI_CODTAR		= tarifart.codtar
//					ExécuteTraitement(SAI_CODTAR,trtSortie)
//				END
//			END
//			HLitSuivant(stodep)
//		END
//		//!Relecture STODEP suite éventuel Tarif affecté à 1 dépôt différent
//		HLitRecherchePremier(stodep,std_key_std_dep,[ligvtepc.coddep,SAI_CODART])
//		IF HTrouve()=Faux ALORS
//			HRAZ(stodep)
//			stodep.coddep	= ligvtepc.coddep
//			stodep.codart	= SAI_CODART
//			stodep.rapport	= 1
//			stodep.condit	= "PIECE"
//			stodep.pmp		= article.pmp
//			HAjoute(stodep)
//		END
//	END
//	IF stodep.pmp=0 AND article.pmp>0 ALORS
//		stodep.pmp=article.pmp
//		HModifie(stodep)
//	END
//	//!Valorisé au PMP STODEP
//	ligvtepc.prixrev = stodep.pmp
//END
//IF article.com_pr<>0 ALORS
//	ligvtepc.prixrev=Round(article.prixvte-((article.prixvte/100)*article.com_pr))
//END
//SI ligvtepc.prixrev=0 ALORS
//	SI HExécuteRequêteSQL(gsdSqldata,hRequêteDéfaut,"select valunit from stock where codart='"+SAI_CODART+...
//		"' and coddep="+ligvtepc.coddep+" and valunit<>0 order by date_ desc limit 1")=Vrai ALORS
//		HLitPremier(gsdSqldata)
//		ligvtepc.prixrev=gsdSqldata.valunit
//
//		HLitRecherchePremier(stodep,std_key_std_dep,[ligvtepc.coddep,SAI_CODART])
//		stodep.pmp=ligvtepc.prixrev
//		HModifie(stodep)
//	FIN
//FIN
//
//SAI_PRIXNET	= SAI_PRIXHT-((SAI_PRIXHT/100)*SAI_PRC_REMISE)
//
////!TVA
//HLitRecherchePremier(parame,code,article.tva)
//SAI_TX_TVA	= parame.taux
//Wtx_tva		= SAI_TX_TVA
//IF INT_EXO_TVA=1 ALORS
//	Wtx_tva=0
//END
//SAI_NO_TVA	= SansCaractèreGauche(parame.code,"TVA")
//
////TVA ILES
//SI INT_TVA_ILES=1 ET article.exclu_tva1<>1 ET article.tva<>"TVA0" ALORS
//	pdate=SAI_DATE_
//	SAI_TX_TVA=fgTxTaxe(pdate,"TVAI")
//	Wtx_tva=SAI_TX_TVA
//	SAI_NO_TVA	= 4
//FIN
//
////!TAXE SOCIALE
//SAI_TX_TSOC	= 0
//IF article.tax_soc ALORS
//	SAI_TX_TSOC=entvtepc.tx_tsoc
//END
//
//SAI_PRIXTTC	= PRIX_TTC(SAI_PRIXNET,Wtx_tva,SAI_TX_TSOC,article.tax_soc)
////SAI_PXLVTTC	= PRIX_TTC(article.PXLVHT,Wtx_tva,SAI_TX_TSOC,article.TAX_SOC)
//
//CAL_LIG()
//
//ligvtepc.codssf	= article.codssf
//ligvtepc.codfou	= article.codfou
//ligvtepc.codfam	= article.codfam
//ligvtepc.coddpt	= article.coddpt
//
////!Recherche Tarif article
//HLitRecherchePremier(tarifart,tara_key_tara_at,SAI_CODART,hGénérique)
//IF HTrouve() ALORS
//	SAI_CODTAR..Etat		= Actif
//	BTN_VIS_CODTAR..Etat	= Actif
//ELSE
//	SAI_CODTAR..Etat		= Grisé
//	BTN_VIS_CODTAR..Etat	= Grisé
//END
//
//HLitRecherchePremier(tarifart,tara_key_tara_at,[SAI_CODART,client.codtar])
//IF HTrouve() ALORS
//	SAI_CODTAR=client.codtar
//	ExécuteTraitement(SAI_CODTAR,trtSortie)
//END
//
//IF article.qte_auto=1 ALORS
//	SAI_MT_TTC..Etat=Actif
//	DonneFocus(SAI_MT_TTC)
//ELSE
//	SAI_MT_TTC..Etat=Grisé
//	DonneFocus(SAI_QTE)
//END


end;

procedure TFormLigvtejj.DBPrc_remiseChange(Sender: TObject);
begin
  if FIsLoading = False then
  begin
    exit;
  end;
  CalculLigne;
end;

procedure TFormLigvtejj.DBPrc_remiseEnter(Sender: TObject);
begin
  //FIsLoading := True;
end;

procedure TFormLigvtejj.DBPrc_remiseExit(Sender: TObject);
begin
  CalculLigne;
end;

procedure TFormLigvtejj.DBPrixhtExit(Sender: TObject);
begin
  CalculLigne;
end;

procedure TFormLigvtejj.DBPrixttcExit(Sender: TObject);
var
  Wtx_tva: Double;
begin
  IF FormEntvtejj.RzDBCheckBoxEXO_TVA.Checked then
  begin
  	Wtx_tva:=0;
  end
  else
  	Wtx_tva:= DBTx_tva.Field.AsFloat;

  DBPrixnet.Field.AsFloat := DM_Olivier.CalculerHT(DBPrixttc.Field.AsInteger,Wtx_tva);
  DBPrixht.Field.AsFloat := DBPrixnet.Field.AsFloat/(1-(DBPrc_remise.Value));  //Field.AsFloat/100));
  CalculLigne;
end;


procedure TFormLigvtejj.DBQteEnter(Sender: TObject);
begin
  FIsLoading := True;
end;

procedure TFormLigvtejj.DBQteExit(Sender: TObject);
begin
  CalculLigne;
end;

procedure TFormLigvtejj.FormCreate(Sender: TObject);
begin
  FDQueryCodbar.Open;

  if FormEntvtejj.RzDBCheckBoxFlag_Tax.Checked then
    DBPrixttc.Enabled:=false
  else
    DBPrixht.Enabled:=false;
end;


procedure TFormLigvtejj.FormShow(Sender: TObject);
begin
  FIsLoading := False; // On active le verrou pour bloquer les calculs en cascade pendant l'initialisation
  try
    if ModeSaisieLigne = msModification then
    begin
      if not (DSLigvtejj.DataSet.State in [dsEdit, dsInsert]) then
        DSLigvtejj.DataSet.Edit;

      if FormEntvtejj.RzDBRadioGroupType.Value = 'F' then   // Facture ou Avoir
      begin
      end
      else
      begin
        Panel1.Color := RGB(255, 182, 193);   //Pink
      end;
      DBQte.SetFocus;
    end
    else
    begin
      // S'il s'agit d'un ajout et que le dataset n'y est pas, on le met en insert
      if not (DSLigvtejj.DataSet.State in [dsEdit, dsInsert]) then
        DSLigvtejj.DataSet.Insert;

      if FormEntvtejj.RzDBRadioGroupType.Value = 'F' then   // Facture ou Avoir
      begin
        DSLigvtejj.DataSet.FieldByName('QTE').AsInteger := 1;
        //Panel1.Color := clBtnFace;
      end
      else
      begin
        DSLigvtejj.DataSet.FieldByName('QTE').AsInteger := -1;
        Panel1.Color := RGB(255, 182, 193);       //Pink
      end;
    end;
  finally

  end;
end;

procedure TFormLigvtejj.BtnAnnulerClick(Sender: TObject);
begin
  // Si des modifications étaient en cours, on les annule proprement
  if FormEntvtejj.FDMemTableLigvtejj.State in [dsEdit, dsInsert] then
    FormEntvtejj.FDMemTableLigvtejj.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"

end;

procedure TFormLigvtejj.BtnValiderClick(Sender: TObject);
begin
  // Exemple de validation (à décommenter plus tard)
  // if DBQte.Field.AsFloat = 0 then
  // begin
  //   ShowMessage('Erreur quantité.');
  //   if DBQte.CanFocus then DBQte.SetFocus;
  //   Exit;
  // end;

  try
    // On valide le dataset via son DataSource (plus indépendant)
    if DSLigvtejj.Dataset.State in [dsEdit, dsInsert] then
      DSLigvtejj.Dataset.Post;

    // Si le Post a réussi sans exception, on autorise la fermeture
    Self.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      // Si une erreur survient (base, BeforePost, etc.),
      // on n'assigne PAS mrOk, la fiche reste donc ouverte.
      MessageDlg('Erreur sur la ligne :'#13#10 + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

end.
