unit U_FicheLigvtejj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math,
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
    Label1: TLabel;
    DBCodbar: TDBEdit;
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
    DBCodtar: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    DBQte: TJvDBCalcEdit;
    DBPrixht: TJvDBCalcEdit;
    DBPrixttc: TJvDBCalcEdit;
    JvDBSpinPrc_remise: TJvDBSpinEdit;
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
    procedure JvDBSpinPrc_remiseExit(Sender: TObject);
    procedure DBQteExit(Sender: TObject);
    procedure DBPrixhtExit(Sender: TObject);
    procedure DBPrixttcExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JvDBSpinPrc_remiseChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvDBSpinPrc_remiseEnter(Sender: TObject);
    procedure DBCodbarEnter(Sender: TObject);
    procedure DBCodbarExit(Sender: TObject);
    procedure DBQteEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Déclarations privées }
    FIsLoading: Boolean;   //Juste pour louverture
    procedure ExecuterAnnulation;
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


procedure TformLigvtejj.ExecuterAnnulation;
begin
      // Si des modifications étaient en cours, on les annule proprement
  if FormEntvtejj.FDMemTableLigvtejj.State in [dsEdit, dsInsert] then
    FormEntvtejj.FDMemTableLigvtejj.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;


//CALCUL COMPLET DE LA LIGNE
procedure TFormLigvtejj.CalculLigne;
begin
  // Si le formulaire est en train de se fermer ou de valider, on dégage immédiatement
  if (ModalResult <> mrNone) or (FIsLoading = False) then
    Exit;

  DSLigvtejj.DataSet.Edit;

  //Calcul TVA sur PRIXHT ou PRIXTTC
  if FormEntvtejj.RzDBCheckBoxFlag_Tax.Checked = False then
  begin
    //Sur TTC
    DBMt_ttc.Field.AsInteger := Round(DBPrixttc.Field.AsInteger
      * DBQte.Field.AsFloat);
    DBMt_tva.Field.AsFloat := (DBMt_ttc.Field.AsInteger)
      * (DBTx_tva.Field.AsFloat
      / (100+(DBTx_tva.Field.AsFloat)));
     DBTotht.Field.AsFloat := DBMt_ttc.Field.AsInteger
      - DBMt_tva.Field.AsFloat;
     DBPrixnet.Field.AsFloat :=  DBTotht.Field.AsFloat / DBQte.Field.AsFloat;
  end
  else
  begin
    //Sur HT
    DBPrixnet.Field.AsFloat := DBPrixht.Field.AsFloat - ((DBPrixht.Field.AsFloat/100)*JvDBSpinPrc_remise.Value);
    DBPrixttc.Field.AsInteger := Round(DM_Olivier.CalculerTTC(DBPrixnet.Field.AsFloat,(DBTx_tva.Field.AsFloat)));
    DBTotht.Field.AsFloat := DBPrixnet.Field.AsFloat * DBQte.Field.AsFloat;
    DBMt_tva.Field.AsFloat := (DBTotht.Field.AsFloat/100)*(DBTx_tva.Field.AsFloat);
    DBMt_ttc.Field.AsInteger := Round(DBTotht.Field.AsFloat+DBMt_tva.Field.AsFloat);  //+ligvtepc.mt_tsoc)
  end;

  DBMt_remise.Field.AsFloat := (DBPrixht.Field.AsFloat * DBQte.Field.AsFloat) - DBTotht.Field.AsFloat;
  DSLigvtejj.DataSet.FieldByName('MARGE').AsFloat := DBTotht.Field.AsFloat - (DSLigvtejj.DataSet.FieldByName('PRIXREV').AsFloat * DBQte.Field.AsFloat);

  //Arrondis
  DBPrixnet.Field.AsFloat := RoundTo(DBPrixnet.Field.AsFloat,-2);
  DBTotht.Field.AsFloat := RoundTo(DBTotht.Field.AsFloat,-2);
  DBMt_tva.Field.AsFloat := RoundTo(DBMt_tva.Field.AsFloat,-2);
  DSLigvtejj.DataSet.FieldByName('MT_REMISE').AsFloat := RoundTo(DSLigvtejj.DataSet.FieldByName('MT_REMISE').AsFloat,-2);
  DBPrixnet.Field.AsFloat := RoundTo(DBPrixnet.Field.AsFloat,-2);
  DSLigvtejj.DataSet.FieldByName('MARGE').AsFloat := RoundTo(DSLigvtejj.DataSet.FieldByName('MARGE').AsFloat,-2);


end;


procedure TFormLigvtejj.DBCodbarEnter(Sender: TObject);
begin
  FIsLoading := True;
end;


procedure TFormLigvtejj.DBCodbarExit(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExecArticle: TFDQuery;
  QryExecClient: TFDQuery;
  pTVA: String;
begin

  // Si on est en train d'annuler ou si le champ est vide, on laisse sortir sans bloquer
  if (FormEntvtejj.FDMemTableLigvtejj.State = dsBrowse) or (DBCodbar.Text = '') then
    Exit;

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

  //Si pas de changement de codbar on sort
  if DBCodbar.Field.AsString=DBCodbar.Field.OldValue then
  begin
    QryExec.Free;
    Exit;
  end;

   //Controle si changement
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


//		SI client.app_tarifcli ALORS //Tarif client uniquement
//			gpTab_codbar=Ouvre(FEN_Vision_codbar,ligvtepc.coddep,client.codcli,client.codcli)
//		SINON
//			gpTab_codbar=Ouvre(FEN_Vision_codbar,ligvtepc.coddep,0,client.codcli)
//		FIN
//		SAI_CODBAR=gpTab_codbar[ind]
//

  //Lecture fichier article
  QryExecArticle := TFDQuery.Create(nil);
  QryExecArticle.Connection := DMGesCloud.ConnexionGesCloud;
  QryExecArticle.Close;
  QryExecArticle.SQL.Text := 'SELECT * FROM article where CODART=:CODART';
  QryExecArticle.ParamByName('CODART').AsString:=DSLigvtejj.DataSet.FieldByName('CODART').AsString;
  QryExecArticle.Open;

  //Recherche artcli_bloq client-article
  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM artcli_bloq WHERE CODART=:CODART AND CODCLI=:CODCLI';
  QryExec.ParamByName('CODART').AsString:=DSLigvtejj.DataSet.FieldByName('CODART').AsString;
  QryExec.ParamByName('CODCLI').AsInteger:=DSLigvtejj.DataSet.FieldByName('CODCLI').AsInteger;
  QryExec.Open;
  IF not QryExec.Eof then
  begin
    if QryExec.FieldByName('BLOQUE').AsBoolean=True then
    begin
      BalloonHint1.Description := '⚠ Article interdit à la vente pour ce client';
      BalloonHint1.ShowHint(DBCodbar);
      JvDBLookupComboCodbar.SetFocus;
      QryExec.Free;
      QryExecArticle.Free;
      exit;
    end;
  end;

  if (FormEntvtejj.RzDBRadioGroupType.Value <> 'F') and (DbQte.Field.AsFloat>0) then   // Facture ou Avoir
    DbQte.Field.AsFloat := -DbQte.Field.AsFloat;

  if (QryExecArticle.FieldByName('OBSERV_FAC').AsString<>'') AND (QryExecArticle.FieldByName('OBSERV_FAC').AsInteger=1) then
  	DSLigvtejj.DataSet.FieldByName('OBSERV').AsString:=DSLigvtejj.DataSet.FieldByName('OBSERV').AsString + #13#10 + QryExecArticle.FieldByName('OBSERV_FAC').AsString;

  //Lecture Client
  QryExecClient := TFDQuery.Create(nil);
  QryExecClient.Connection := DMGesCloud.ConnexionGesCloud;
  QryExecClient.Close;
  QryExecClient.SQL.Text := 'SELECT * FROM client where CODCLI=:CODCLI';
  QryExecClient.ParamByName('CODCLI').AsInteger:=DSLigvtejj.DataSet.FieldByName('CODCLI').AsInteger;
  QryExecClient.Open;

  //Remise par famille
  if (QryExecClient.FieldByName('coef_maj_pr').AsFloat=0) and (QryExecClient.FieldByName('rem_fam').AsInteger=1) then
  begin
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM famrem WHERE CODFAM=:CODFAM AND :DAT_FAC BETWEEN DAT_DEB AND DAT_FIN';
    QryExec.ParamByName('CODFAM').AsString:=QryExecArticle.FieldByName('CODFAM').AsString;
    QryExec.ParamByName('DAT_FAC').AsDateTime:=FormEntvtejj.FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
    QryExec.Open;
    if not QryExec.Eof then
      DSLigvtejj.DataSet.FieldByName('PRC_REMISE').asFloat:=QryExec.FieldByName('PRC_REM').AsFloat;
  end;


  //PRIX DE VENTE-------------------
  //Promo article
  if QryExecClient.FieldByName('coef_maj_pr').AsFloat=0 then
  begin
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM promo WHERE CODART=:CODART AND :DAT_FAC BETWEEN DAT_DEB AND DAT_FIN';
    QryExec.ParamByName('CODART').AsString:=QryExecArticle.FieldByName('CODART').AsString;
    QryExec.ParamByName('DAT_FAC').AsDateTime:=FormEntvtejj.FDMemTableEntvtejj.FieldByName('DATE_').AsDateTime;
    QryExec.Open;
    if not QryExec.Eof then
      if QryExec.FieldByName('PRIXHT').AsFloat>0 then
        DSLigvtejj.DataSet.FieldByName('PRIXHT').asFloat:=QryExec.FieldByName('PRIXHT').AsFloat
      else
        DSLigvtejj.DataSet.FieldByName('PRC_REMISE').asFloat:=QryExec.FieldByName('PRC_REM').AsFloat;
  end;

  //Recherche si remisable
  if QryExecArticle.FieldByName('PREST').AsInteger=1 then
  begin
    DSLigvtejj.DataSet.FieldByName('PRC_REMISE').asFloat:=0;
    JvDBSpinPrc_remise.Enabled:=False;
  end
  else
    JvDBSpinPrc_remise.Enabled:=True;

  //Recherche client beneficie d'un tarif general
  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM tarifart WHERE CODART=:CODART AND CODTAR=:CODTAR';
  QryExec.ParamByName('CODART').AsString:=QryExecArticle.FieldByName('CODART').AsString;
  QryExec.ParamByName('CODTAR').AsString:=QryExecClient.FieldByName('CODTAR').AsString;
  QryExec.Open;
  if not QryExec.Eof then
  begin
  	DBCodtar.Enabled := True;
    DBCodtar.Field.AsString:= QryExec.FieldByName('CODTAR').AsString;
    DSLigvtejj.DataSet.FieldByName('PRIXHT').AsFloat := QryExec.FieldByName('PRIXHT').Asfloat;
  end
  else
  begin
   	DBCodtar.Enabled := False;
    DBCodtar.Field.AsString:=''
  end;

  //Tarif specifique au client
  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM tarifcli WHERE CODART=:CODART AND CODCLI=:CODCLI';
  QryExec.ParamByName('CODART').AsString:=QryExecArticle.FieldByName('CODART').AsString;
  QryExec.ParamByName('CODCLI').AsInteger:=DSLigvtejj.DataSet.FieldByName('CODCLI').AsInteger;
  QryExec.Open;
  if not QryExec.Eof then
  begin
  	DBCodtar.Field.AsString := '';
    if QryExec.FieldByName('PRIXVTE').Asfloat<>0 then
      DSLigvtejj.DataSet.FieldByName('PRIXHT').AsFloat := QryExec.FieldByName('PRIXVTE').Asfloat
    else
      DSLigvtejj.DataSet.FieldByName('PRC_REMISE').AsFloat := QryExec.FieldByName('PRC_REMISE').Asfloat;
  end;


  //PRIX DE REVIENT-------------------
  //Prix de revient article par defaut
  DSLigvtejj.DataSet.FieldByName('PRIXREV').AsFloat := QryExecArticle.FieldByName('PMP').AsFloat;

  //Prix de revient si gestion PMP par depot
  if DM_Olivier.PMPGlobalMode=0 then
  begin
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM stodep WHERE CODART=:CODART AND CODDEP=:CODDEP';
    QryExec.ParamByName('CODART').AsString:=QryExecArticle.FieldByName('CODART').AsString;
    QryExec.ParamByName('CODDEP').AsInteger:=DSLigvtejj.DataSet.FieldByName('CODDEP').AsInteger;
    QryExec.Open;
    if not QryExec.Eof then
      DSLigvtejj.DataSet.FieldByName('PRIXREV').AsFloat := QryExec.FieldByName('PMP').AsFloat;
  end;

  //Si le prix de revient est calculé sur une commission sur le prix de vente
  IF QryExecArticle.FieldByName('COM_PR').AsFloat<>0 then
  	DSLigvtejj.DataSet.FieldByName('PRIXREV').AsFloat := Round(QryExecArticle.FieldByName('PRIXVTE').AsFloat
      -((QryExecArticle.FieldByName('PRIXVTE').AsFloat/100)*QryExecArticle.FieldByName('COM_PR').AsFloat));
  //FIN Prix de revient-----------------------

  //!CALCUL PRIXHT si basé sur coef major pr
  if QryExecClient.FieldByName('coef_maj_pr').AsFloat<>0 then
      DSLigvtejj.DataSet.FieldByName('PRIXHT').AsFloat	:= DSLigvtejj.DataSet.FieldByName('PRIX_REV').AsFloat
        *QryExecClient.FieldByName('coef_maj_pr').AsFloat;

  //!Calcul des prix détail GROSSISTE
  DM_Olivier.FDQueryCtrstock.Open;
  if DM_Olivier.FDQueryCtrstock.FieldByName('NATURE').AsString='G' then
  begin
  	DSLigvtejj.DataSet.FieldByName('DET_PPT').AsFloat	:= QryExecArticle.FieldByName('DET_PPT').AsFloat;
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM prixgeo WHERE CODGEO=:CODGEO AND CODPRIX=:CODPRIX';
    QryExec.ParamByName('CODGEO').AsString:=FormEntvtejj.FDMemTableEntvtejj.FieldByName('CODGEO').AsString;
    QryExec.ParamByName('CODPRIX').AsString:=QryExecArticle.FieldByName('CODPRIX').AsString;
    QryExec.Open;
    if not QryExec.Eof then
  		DSLigvtejj.DataSet.FieldByName('DET_ILE').AsFloat := DSLigvtejj.DataSet.FieldByName('DET_PPT').AsFloat
       *   QryExec.ParamByName('COEF').AsFloat;
  end;

  //Divers champs liés
  DSLigvtejj.DataSet.FieldByName('CODSSF').AsString	:= QryExecArticle.FieldByName('CODSSF').AsString;
  DSLigvtejj.DataSet.FieldByName('CODFOU').AsString	:= QryExecArticle.FieldByName('CODFOU').AsString;
  DSLigvtejj.DataSet.FieldByName('CODFAM').AsString	:= QryExecArticle.FieldByName('CODFAM').AsString;
  DSLigvtejj.DataSet.FieldByName('CODDPT').AsString	:= QryExecArticle.FieldByName('CODDPT').AsString;


  //MAINTENANT CALCUL PRIX RESULTANTS
  //PRIX NET HT
  DSLigvtejj.DataSet.FieldByName('PRIXNET').AsFloat	:= DSLigvtejj.DataSet.FieldByName('PRIXHT').AsFloat
    -((DSLigvtejj.DataSet.FieldByName('PRIXHT').AsFloat/100)
    *DSLigvtejj.DataSet.FieldByName('PRC_REMISE').asFloat);

  //PRIX TTC
  DSLigvtejj.DataSet.FieldByName('PRIXTTC').AsFloat	:=
    DM_Olivier.CalculerTTC(DSLigvtejj.DataSet.FieldByName('PRIXNET').AsFloat,DBTx_tva.Field.AsFloat);
  DSLigvtejj.DataSet.FieldByName('PXLVTTC').AsFloat	:=
    DM_Olivier.CalculerTTC(QryExecArticle.FieldByName('PXLVHT').AsFloat,DBTx_tva.Field.AsFloat);


//IF article.qte_auto=1 ALORS
//	SAI_MT_TTC..Etat=Actif
//	DonneFocus(SAI_MT_TTC)
//ELSE
//	SAI_MT_TTC..Etat=Grisé
//	DonneFocus(SAI_QTE)
//END
  CalculLigne;

  DBQte.SetFocus;

end;

procedure TFormLigvtejj.JvDBSpinPrc_remiseChange(Sender: TObject);
begin
  if FIsLoading = False then
  begin
    exit;
  end;
  CalculLigne;
end;

procedure TFormLigvtejj.JvDBSpinPrc_remiseEnter(Sender: TObject);
begin
  //FIsLoading := True;
end;

procedure TFormLigvtejj.JvDBSpinPrc_remiseExit(Sender: TObject);
begin
  CalculLigne;
end;

procedure TFormLigvtejj.DBPrixhtExit(Sender: TObject);
begin
  if DBPrixht.Field.AsFloat<0 then
  begin
    BalloonHint1.Description := '⚠ Prix négatif interdit';
    BalloonHint1.ShowHint(DBPrixht);
    DBPrixttc.SetFocus;
  end;
  CalculLigne;
end;

procedure TFormLigvtejj.DBPrixttcExit(Sender: TObject);
var
  Wtx_tva: Double;
begin
  if DBPrixttc.Field.AsFloat<0 then
  begin
    BalloonHint1.Description := '⚠ Prix négatif interdit';
    BalloonHint1.ShowHint(DBPrixttc);
    DBPrixttc.SetFocus;
  end;
  IF FormEntvtejj.RzDBCheckBoxEXO_TVA.Checked then
  begin
  	Wtx_tva:=0;
  end
  else
  	Wtx_tva:= DBTx_tva.Field.AsFloat;

  DBPrixnet.Field.AsFloat := DM_Olivier.CalculerHT(DBPrixttc.Field.AsInteger,Wtx_tva);
  DBPrixht.Field.AsFloat := DBPrixnet.Field.AsFloat/(1-(JvDBSpinPrc_remise.Value));  //Field.AsFloat/100));
  CalculLigne;
end;


procedure TFormLigvtejj.DBQteEnter(Sender: TObject);
begin
  FIsLoading := True;
end;

procedure TFormLigvtejj.DBQteExit(Sender: TObject);
begin
  if (FormEntvtejj.RzDBRadioGroupType.Value <> 'F') and (DbQte.Field.AsFloat>0) then   // Facture ou Avoir
    DbQte.Field.AsFloat := -DbQte.Field.AsFloat;

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


procedure TFormLigvtejj.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    ExecuterAnnulation;
    Key := 0; // Empêche le bip sonore de Windows lié à la touche Échap
  end;
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
  ExecuterAnnulation;
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
    begin
      //Controle si saisie invalide
      if DSLigvtejj.dataset.FieldByName('CODART').AsString='' then
      begin
        DBCodbarExit(Sender);
        if DSLigvtejj.dataset.FieldByName('CODART').AsString='' then
         exit;
      end;

      DSLigvtejj.Dataset.Post;
    end;

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
