unit U_FicheLig_prof;

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
  TFormLig_prof = class(TForm)
    DSlig_prof: TDataSource;
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
    w_G_Sto: Integer;
    procedure ExecuterAnnulation;
    procedure CalculLigne;
  public
    { Déclarations publiques }
    ModeSaisieLigne: TModeSaisieLigne; // On utilise ce type ici
  end;

var
  FormLig_prof: TFormLig_prof;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_FicheEnt_prof, U_DataModule;


procedure TFormLig_prof.ExecuterAnnulation;
begin
      // Si des modifications étaient en cours, on les annule proprement
  if FormEnt_prof.FDMemTablelig_prof.State in [dsEdit, dsInsert] then
    FormEnt_prof.FDMemTablelig_prof.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;


//CALCUL COMPLET DE LA LIGNE
procedure TFormLig_prof.CalculLigne;
var
  AQte: Double;
begin
  // Si le formulaire est en train de se fermer ou de charger, on sort
  if (ModalResult <> mrNone) or (FIsLoading = False) then
    Exit;

  // S'assurer que le dataset est modifiable
  if not (DSlig_prof.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  // Sécurité anti-division par zéro sur la quantité
  AQte := DBQte.Field.AsFloat;
  if AQte = 0 then
    AQte := 1;

  // Calcul TVA sur PRIXHT ou PRIXTTC
  if (FormEnt_prof.RzDBCheckBoxFlag_Tax.Checked = False) then
  begin
    // Sur TTC
    DBMt_ttc.Field.AsInteger := Round(DBPrixttc.Field.AsInteger * DBQte.Field.AsFloat);
    DBMt_tva.Field.AsFloat := DBMt_ttc.Field.AsInteger * (DBTx_tva.Field.AsFloat / (100 + DBTx_tva.Field.AsFloat));
    DBTotht.Field.AsFloat := DBMt_ttc.Field.AsInteger - DBMt_tva.Field.AsFloat;
    DBPrixnet.Field.AsFloat := RoundTo(DBTotht.Field.AsFloat / AQte,-2);
  end
  else
  begin
    // Sur HT
    DBPrixnet.Field.AsFloat := DBPrixht.Field.AsFloat - ((DBPrixht.Field.AsFloat / 100) * JvDBSpinPrc_remise.Value);
    DBPrixttc.Field.AsInteger := Round(DM_Olivier.CalculerTTC(DBPrixnet.Field.AsFloat, DBTx_tva.Field.AsFloat));
    DBTotht.Field.AsFloat := DBPrixnet.Field.AsFloat * DBQte.Field.AsFloat;
    DBMt_tva.Field.AsFloat := (DBTotht.Field.AsFloat / 100) * DBTx_tva.Field.AsFloat;
    DBMt_ttc.Field.AsInteger := Round(DBTotht.Field.AsFloat + DBMt_tva.Field.AsFloat);
  end;

  DBMt_remise.Field.AsFloat := (DBPrixht.Field.AsFloat * DBQte.Field.AsFloat) - DBTotht.Field.AsFloat;
  DSlig_prof.DataSet.FieldByName('MARGE').AsFloat := DBTotht.Field.AsFloat - (DSlig_prof.DataSet.FieldByName('PRIXREV').AsFloat * DBQte.Field.AsFloat);

  // Arrondis (nettoyage des doublons et uniformisation des accès champs)
  DBPrixnet.Field.AsFloat := RoundTo(DBPrixnet.Field.AsFloat, -2);
  DBTotht.Field.AsFloat := RoundTo(DBTotht.Field.AsFloat, -2);
  DBMt_tva.Field.AsFloat := RoundTo(DBMt_tva.Field.AsFloat, -2);
  DBMt_remise.Field.AsFloat := RoundTo(DBMt_remise.Field.AsFloat, -2);
  DSlig_prof.DataSet.FieldByName('MARGE').AsFloat := RoundTo(DSlig_prof.DataSet.FieldByName('MARGE').AsFloat, -2);
end;


procedure TFormLig_prof.DBCodbarEnter(Sender: TObject);
begin
  FIsLoading := True;
end;


procedure TFormLig_prof.DBCodbarExit(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExecArticle: TFDQuery;
  QryExecClient: TFDQuery;
  pTVA: String;
  wDate: TDateTime;

begin
  // Si on est en train d'annuler ou si le champ est vide, on laisse sortir sans bloquer
  if (FormEnt_prof.FDMemTablelig_prof.State = dsBrowse) or (DBCodbar.Text = '') then
    Exit;

  // Création des requêtes temporaires
  QryExec := nil;
  QryExecArticle := nil;
  QryExecClient := nil;
  try
    QryExec := TFDQuery.Create(nil);
    QryExecArticle := TFDQuery.Create(nil);
    QryExecClient := TFDQuery.Create(nil);

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExecArticle.Connection := DMGesCloud.ConnexionGesCloud;
    QryExecClient.Connection := DMGesCloud.ConnexionGesCloud;

    // Recherche du code barre
    QryExec.SQL.Text := 'SELECT * FROM codbar WHERE CODBAR = :CODBAR';
    QryExec.ParamByName('CODBAR').AsString := DBCodbar.Field.AsString;
    QryExec.Open;

    if QryExec.Eof then
    begin
      BalloonHint1.Description := '⚠ Article inconnu !';
      BalloonHint1.ShowHint(DBCodbar);
      JvDBLookupComboCodbar.SetFocus;
      Exit; // Le bloc try...finally libérera proprement les requêtes
    end;

    DSlig_prof.DataSet.FieldByName('CODART').AsString := QryExec.FieldByName('CODART').AsString;

    // Si pas de changement de code-barre, on sort
    if DBCodbar.Field.AsString = DBCodbar.Field.OldValue then
      Exit;

    // Contrôle si changement - Affectation Libellé et Prix HT de base
    DBLibelle.Text := FDQueryCodbar.FieldByName('libelle').AsString;
    DBPrixht.Field.AsFloat := FDQueryCodbar.FieldByName('prixvte').AsFloat;

    // Recherche tx TVA par date d'effet
    wdate := FormEnt_prof.FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime;
    pTVA := FDQueryCodbar.FieldByName('TVA').AsString;
    DBTx_tva.Field.AsFloat := DM_Olivier.fgTxTaxe(wDate,pTVA);

//    if pTVA = 'TVA0' then
//      DBTx_tva.Field.AsFloat := 0
//    else if pTVA = 'TVA1' then
//      DBTx_tva.Field.AsFloat := DM_Olivier.gTx_TVA1
//    else if pTVA = 'TVA2' then
//      DBTx_tva.Field.AsFloat := DM_Olivier.gTx_TVA2
//    else if pTVA = 'TVA3' then
//      DBTx_tva.Field.AsFloat := DM_Olivier.gTx_TVA3;

    if pTVA <> '' then
      DSlig_prof.DataSet.FieldByName('NO_TVA').AsInteger := StrToInt(pTVA[Length(pTVA)]);

    // Si TVA Îles
    if (FormEnt_prof.RzDBCheckBoxTVA_ILES.Checked) and (FDQueryCodbar.FieldByName('EXCLU_TVA1').AsBoolean = False) then
    begin
      DBTx_tva.Field.AsFloat := DM_Olivier.fgTxTaxe(wDate,'TVAI');  //DM_Olivier.gTx_TVAI;
      DSlig_prof.DataSet.FieldByName('NO_TVA').AsInteger := 4;
    end;

    // Si exonéré TVA
    if FormEnt_prof.RzDBCheckBoxEXO_TVA.Checked then
      DBTx_tva.Field.AsFloat := 0;

    // Lecture fichier article
    QryExecArticle.SQL.Text := 'SELECT * FROM article WHERE CODART = :CODART';
    QryExecArticle.ParamByName('CODART').AsString := DSlig_prof.DataSet.FieldByName('CODART').AsString;
    QryExecArticle.Open;

    // Recherche artcli_bloq client-article
    QryExec.SQL.Text := 'SELECT * FROM artcli_bloq WHERE CODART = :CODART AND CODCLI = :CODCLI';
    QryExec.ParamByName('CODART').AsString := DSlig_prof.DataSet.FieldByName('CODART').AsString;
    QryExec.ParamByName('CODCLI').AsInteger := DSlig_prof.DataSet.FieldByName('CODCLI').AsInteger;
    QryExec.Open;

    if not QryExec.Eof then
    begin
      if QryExec.FieldByName('BLOQUE').AsBoolean = True then
      begin
        BalloonHint1.Description := '⚠ Article interdit à la vente pour ce client';
        BalloonHint1.ShowHint(DBCodbar);
        JvDBLookupComboCodbar.SetFocus;
        Exit;
      end;
    end;

    if (QryExecArticle.FieldByName('OBSERV_FAC').AsString <> '') then
      DBLibelle.Text := DBLibelle.Text + #13#10 + QryExecArticle.FieldByName('OBSERV').AsString;

    // Lecture Client
    QryExecClient.SQL.Text := 'SELECT * FROM client WHERE CODCLI = :CODCLI';
    QryExecClient.ParamByName('CODCLI').AsInteger := DSlig_prof.DataSet.FieldByName('CODCLI').AsInteger;
    QryExecClient.Open;

    // Remise par famille
    if (QryExecClient.FieldByName('coef_maj_pr').AsFloat = 0) and (QryExecClient.FieldByName('rem_fam').AsInteger = 1) then
    begin
      QryExec.SQL.Text := 'SELECT * FROM famrem WHERE CODFAM = :CODFAM AND :DAT_FAC BETWEEN DAT_DEB AND DAT_FIN';
      QryExec.ParamByName('CODFAM').AsString := QryExecArticle.FieldByName('CODFAM').AsString;
      QryExec.ParamByName('DAT_FAC').AsDateTime := FormEnt_prof.FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime;
      QryExec.Open;
      if not QryExec.Eof then
        DSlig_prof.DataSet.FieldByName('PRC_REMISE').AsFloat := QryExec.FieldByName('PRC_REM').AsFloat;
    end;

    // PRIX DE VENTE - Promo article
    if QryExecClient.FieldByName('coef_maj_pr').AsFloat = 0 then
    begin
      QryExec.SQL.Text := 'SELECT * FROM promo WHERE CODART = :CODART AND :DAT_FAC BETWEEN DAT_DEB AND DAT_FIN';
      QryExec.ParamByName('CODART').AsString := QryExecArticle.FieldByName('CODART').AsString;
      QryExec.ParamByName('DAT_FAC').AsDateTime := FormEnt_prof.FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime;
      QryExec.Open;
      if not QryExec.Eof then
      begin
        if QryExec.FieldByName('PRIXHT').AsFloat > 0 then
          DSlig_prof.DataSet.FieldByName('PRIXHT').AsFloat := QryExec.FieldByName('PRIXHT').AsFloat
        else
          DSlig_prof.DataSet.FieldByName('PRC_REMISE').AsFloat := QryExec.FieldByName('PRC_REM').AsFloat;
      end;
    end;

    // Recherche si remisable
    if QryExecArticle.FieldByName('PREST').AsInteger = 1 then
    begin
      DSlig_prof.DataSet.FieldByName('PRC_REMISE').AsFloat := 0;
      JvDBSpinPrc_remise.Enabled := False;
    end
    else
      JvDBSpinPrc_remise.Enabled := True;

    // Recherche tarif général client
    QryExec.SQL.Text := 'SELECT * FROM tarifart WHERE CODART = :CODART AND CODTAR = :CODTAR';
    QryExec.ParamByName('CODART').AsString := QryExecArticle.FieldByName('CODART').AsString;
    QryExec.ParamByName('CODTAR').AsString := QryExecClient.FieldByName('CODTAR').AsString;
    QryExec.Open;
    if not QryExec.Eof then
    begin
      DBCodtar.Enabled := True;
      DBCodtar.Field.AsString := QryExec.FieldByName('CODTAR').AsString;
      DSlig_prof.DataSet.FieldByName('PRIXHT').AsFloat := QryExec.FieldByName('PRIXHT').AsFloat;
    end
    else
    begin
      DBCodtar.Enabled := False;
      DBCodtar.Field.AsString := '';
    end;

    // Tarif spécifique au client
    QryExec.SQL.Text := 'SELECT * FROM tarifcli WHERE CODART = :CODART AND CODCLI = :CODCLI';
    QryExec.ParamByName('CODART').AsString := QryExecArticle.FieldByName('CODART').AsString;
    QryExec.ParamByName('CODCLI').AsInteger := DSlig_prof.DataSet.FieldByName('CODCLI').AsInteger;
    QryExec.Open;
    if not QryExec.Eof then
    begin
      DBCodtar.Field.AsString := '';
      if QryExec.FieldByName('PRIXVTE').AsFloat <> 0 then
        DSlig_prof.DataSet.FieldByName('PRIXHT').AsFloat := QryExec.FieldByName('PRIXVTE').AsFloat
      else
        DSlig_prof.DataSet.FieldByName('PRC_REMISE').AsFloat := QryExec.FieldByName('PRC_REMISE').AsFloat;
    end;

    // PRIX DE REVIENT
    DSlig_prof.DataSet.FieldByName('PRIXREV').AsFloat := QryExecArticle.FieldByName('PMP').AsFloat;

    if DM_Olivier.PMPGlobalMode = 0 then
    begin
      QryExec.SQL.Text := 'SELECT * FROM stodep WHERE CODART = :CODART AND CODDEP = :CODDEP';
      QryExec.ParamByName('CODART').AsString := QryExecArticle.FieldByName('CODART').AsString;
      QryExec.ParamByName('CODDEP').AsInteger := DSlig_prof.DataSet.FieldByName('CODDEP').AsInteger;
      QryExec.Open;
      if not QryExec.Eof then
        DSlig_prof.DataSet.FieldByName('PRIXREV').AsFloat := QryExec.FieldByName('PMP').AsFloat;
    end;

    if QryExecArticle.FieldByName('COM_PR').AsFloat <> 0 then
      DSlig_prof.DataSet.FieldByName('PRIXREV').AsFloat := Round(QryExecArticle.FieldByName('PRIXVTE').AsFloat - ((QryExecArticle.FieldByName('PRIXVTE').AsFloat / 100) * QryExecArticle.FieldByName('COM_PR').AsFloat));

    // Si basé sur coef major pr (Attention correction du nom de champ PRIX_REV -> PRIXREV)
    if QryExecClient.FieldByName('coef_maj_pr').AsFloat <> 0 then
      DSlig_prof.DataSet.FieldByName('PRIXHT').AsFloat := DSlig_prof.DataSet.FieldByName('PRIXREV').AsFloat * QryExecClient.FieldByName('coef_maj_pr').AsFloat;

    // Calcul des prix détail GROSSISTE
    DM_Olivier.FDQueryCtrstock.Open;
    if DM_Olivier.FDQueryCtrstock.FieldByName('NATURE').AsString = 'G' then
    begin
      DSlig_prof.DataSet.FieldByName('DET_PPT').AsFloat := QryExecArticle.FieldByName('DET_PPT').AsFloat;
      QryExec.SQL.Text := 'SELECT * FROM prixgeo WHERE CODGEO = :CODGEO AND CODPRIX = :CODPRIX';
      QryExec.ParamByName('CODGEO').AsString := FormEnt_prof.FDMemTableEnt_prof.FieldByName('CODGEO').AsString;
      QryExec.ParamByName('CODPRIX').AsString := QryExecArticle.FieldByName('CODPRIX').AsString;
      QryExec.Open;
      if not QryExec.Eof then
        DSlig_prof.DataSet.FieldByName('DET_ILE').AsFloat := DSlig_prof.DataSet.FieldByName('DET_PPT').AsFloat * QryExec.ParamByName('COEF').AsFloat;
    end;

    // Champs divers
    DSlig_prof.DataSet.FieldByName('CODSSF').AsString := QryExecArticle.FieldByName('CODSSF').AsString;
    DSlig_prof.DataSet.FieldByName('CODFOU').AsString := QryExecArticle.FieldByName('CODFOU').AsString;
    DSlig_prof.DataSet.FieldByName('CODFAM').AsString := QryExecArticle.FieldByName('CODFAM').AsString;
    DSlig_prof.DataSet.FieldByName('CODDPT').AsString := QryExecArticle.FieldByName('CODDPT').AsString;

    // Prix nets et TTC
    DSlig_prof.DataSet.FieldByName('PRIXNET').AsFloat := DSlig_prof.DataSet.FieldByName('PRIXHT').AsFloat - ((DSlig_prof.DataSet.FieldByName('PRIXHT').AsFloat / 100) * DSlig_prof.DataSet.FieldByName('PRC_REMISE').AsFloat);
    DSlig_prof.DataSet.FieldByName('PRIXTTC').AsFloat := DM_Olivier.CalculerTTC(DSlig_prof.DataSet.FieldByName('PRIXNET').AsFloat, DBTx_tva.Field.AsFloat);

    CalculLigne;
    DBQte.SetFocus;

  finally
    QryExec.Free;
    QryExecArticle.Free;
    QryExecClient.Free;
  end;
end;


procedure TFormLig_prof.JvDBSpinPrc_remiseChange(Sender: TObject);
begin
  if FIsLoading = False then
  begin
    exit;
  end;
  CalculLigne;
end;

procedure TFormLig_prof.JvDBSpinPrc_remiseEnter(Sender: TObject);
begin
  //FIsLoading := True;
end;

procedure TFormLig_prof.JvDBSpinPrc_remiseExit(Sender: TObject);
begin
  CalculLigne;
end;

procedure TFormLig_prof.DBPrixhtExit(Sender: TObject);
begin
  if DBPrixht.Field.AsFloat<0 then
  begin
    BalloonHint1.Description := '⚠ Prix négatif interdit';
    BalloonHint1.ShowHint(DBPrixht);
    DBPrixttc.SetFocus;
  end;
  CalculLigne;
end;

procedure TFormLig_prof.DBPrixttcExit(Sender: TObject);
var
  Wtx_tva: Double;
begin
  if DBPrixttc.Field.AsFloat<0 then
  begin
    BalloonHint1.Description := '⚠ Prix négatif interdit';
    BalloonHint1.ShowHint(DBPrixttc);
    DBPrixttc.SetFocus;
  end;
  IF FormEnt_prof.RzDBCheckBoxEXO_TVA.Checked then
  begin
  	Wtx_tva:=0;
  end
  else
  	Wtx_tva:= DBTx_tva.Field.AsFloat;

  DBPrixnet.Field.AsFloat := DM_Olivier.CalculerHT(DBPrixttc.Field.AsInteger,Wtx_tva);
  DBPrixht.Field.AsFloat := DBPrixnet.Field.AsFloat/(1-(JvDBSpinPrc_remise.Value));  //Field.AsFloat/100));
  CalculLigne;
end;


procedure TFormLig_prof.DBQteEnter(Sender: TObject);
begin
  FIsLoading := True;
end;

procedure TFormLig_prof.DBQteExit(Sender: TObject);
var QryStodep: TFDQuery;
begin
  //Si article géré en stock
  if FDQueryCodbar.FieldByName('G_STO').AsInteger=1 then
  begin
    //Controle stock
    QryStodep := nil;
    QryStodep := TFDQuery.Create(nil);
    QryStodep.Connection := DMGesCloud.ConnexionGesCloud;
    QryStodep.SQL.Text := 'SELECT * FROM stodep WHERE CODART = :CODART AND CODDEP = :CODDEP';
    QryStodep.ParamByName('CODART').AsString := DSlig_prof.DataSet.FieldByName('CODART').AsString;
    QryStodep.ParamByName('CODDEP').AsInteger := DSlig_prof.DataSet.FieldByName('CODDEP').AsInteger;
    QryStodep.Open;

    //Si quantite insuffisante
    if QryStodep.FieldByName('QTE').AsFloat < DBQte.Field.AsFloat then
    begin
      //Selon parametrage global
      if DM_Olivier.gALERT_ASTO='A' then   // On autorise
        Exit;

      if DM_Olivier.gALERT_ASTO='R' then  // On refuse
      begin
        ShowMessage('Quantité en stock dépôt insuffisante');
        DBQte.SetFocus;
        exit;
      end;

      // On demande
      if MessageDlg('Quantité en stock dépôt insuffisante, forcer l''opération ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        Exit;
    end;
  end;

  CalculLigne;
end;

procedure TFormLig_prof.FormCreate(Sender: TObject);
begin
  FDQueryCodbar.Open;

  if FormEnt_prof.RzDBCheckBoxFlag_Tax.Checked then
    DBPrixttc.Enabled:=false
  else
    DBPrixht.Enabled:=false;
end;


procedure TFormLig_prof.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    ExecuterAnnulation;
    Key := 0; // Empêche le bip sonore de Windows lié à la touche Échap
  end;
end;

procedure TFormLig_prof.FormShow(Sender: TObject);
begin
  FIsLoading := False; // On active le verrou pour bloquer les calculs en cascade pendant l'initialisation
  try
    if ModeSaisieLigne = msModification then
    begin
      if not (DSlig_prof.DataSet.State in [dsEdit, dsInsert]) then
        DSlig_prof.DataSet.Edit;
      DBQte.SetFocus;
    end
    else
    begin
      // S'il s'agit d'un ajout et que le dataset n'y est pas, on le met en insert
      if not (DSlig_prof.DataSet.State in [dsEdit, dsInsert]) then
        DSlig_prof.DataSet.Insert;
      DSlig_prof.DataSet.FieldByName('QTE').AsInteger := 1;
    end;
  finally
  end;
end;

procedure TFormLig_prof.BtnAnnulerClick(Sender: TObject);
begin
  ExecuterAnnulation;
end;


procedure TFormLig_prof.BtnValiderClick(Sender: TObject);
begin
  try
    // On valide le dataset via son DataSource (plus indépendant)
    if DSlig_prof.Dataset.State in [dsEdit, dsInsert] then
    begin
      //Controle si saisie invalide
      if DSlig_prof.dataset.FieldByName('CODART').AsString='' then
      begin
        DBCodbarExit(Sender);
        if DSlig_prof.dataset.FieldByName('CODART').AsString='' then
         exit;
      end;

      DSlig_prof.Dataset.Post;
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
