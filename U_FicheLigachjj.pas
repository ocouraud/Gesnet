unit U_FicheLigachjj;

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
  TFormLigachjj = class(TForm)
    DSLigachjj: TDataSource;
    Label1: TLabel;
    DBCodart: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBTotht: TDBEdit;
    Label8: TLabel;
    Label11: TLabel;
    DBTx_tva: TDBEdit;
    Label12: TLabel;
    DBMt_tva: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    DBQte: TJvDBCalcEdit;
    DBPrixht: TJvDBCalcEdit;
    DBPrixttc: TJvDBCalcEdit;
    FDQueryArticle: TFDQuery;
    DSArticle: TDataSource;
    JvDBLookupComboCodbar: TJvDBLookupCombo;
    PanelFond: TPanel;
    Shape1: TShape;
    BalloonHint1: TBalloonHint;
    JvCalcEditMT_TTC: TJvCalcEdit;
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
    procedure DBCodartEnter(Sender: TObject);
    procedure DBCodartExit(Sender: TObject);
    procedure DBQteEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBMt_tvaExit(Sender: TObject);
    procedure JvCalcEditMT_TTCExit(Sender: TObject);
    procedure DBTothtExit(Sender: TObject);
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
  FormLigachjj: TFormLigachjj;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_FicheAchat, U_DataModule;


procedure TFormLigachjj.ExecuterAnnulation;
begin
      // Si des modifications étaient en cours, on les annule proprement
  if FormFicheAchat.FDMemTableLigachjj.State in [dsEdit, dsInsert] then
    FormFicheAchat.FDMemTableLigachjj.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;


//CALCUL COMPLET DE LA LIGNE
procedure TFormLigachjj.CalculLigne;
var
  AQte: Double;
begin
  // Si le formulaire est en train de se fermer ou de charger, on sort
  if (ModalResult <> mrNone) or (FIsLoading = False) then
    Exit;

  // S'assurer que le dataset est modifiable
  if not (DSLigachjj.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  // Sécurité anti-division par zéro sur la quantité
  AQte := DBQte.Field.AsFloat;
  if AQte = 0 then
    AQte := 1;

  // Calcul TVA sur PRIXHT ou PRIXTTC
//  if (FormFicheAchat.RzDBCheckBoxFlag_Tax.Checked = False) then
//  begin
//    // Sur TTC
//    DBMt_ttc.Field.AsInteger := Round(DBPrixttc.Field.AsInteger * DBQte.Field.AsFloat);
//    DBMt_tva.Field.AsFloat := DBMt_ttc.Field.AsInteger * (DBTx_tva.Field.AsFloat / (100 + DBTx_tva.Field.AsFloat));
//    DBTotht.Field.AsFloat := DBMt_ttc.Field.AsInteger - DBMt_tva.Field.AsFloat;
//    DBPrixnet.Field.AsFloat := RoundTo(DBTotht.Field.AsFloat / AQte,-2);
//  end
//  else
//  begin
    // Sur HT
    DBPrixttc.Field.AsInteger := Round(DM_Olivier.CalculerTTC(DBPrixht.Field.AsFloat, DBTx_tva.Field.AsFloat));
    DBTotht.Field.AsFloat := DBPrixht.Field.AsFloat * DBQte.Field.AsFloat;
    DBMt_tva.Field.AsFloat := (DBTotht.Field.AsFloat / 100) * DBTx_tva.Field.AsFloat;
//  end;

  // Arrondis (nettoyage des doublons et uniformisation des accès champs)
  DBPrixht.Field.AsFloat := RoundTo(DBPrixht.Field.AsFloat, -2);
  DBTotht.Field.AsFloat := RoundTo(DBTotht.Field.AsFloat, -2);
  DBMt_tva.Field.AsFloat := RoundTo(DBMt_tva.Field.AsFloat, -2);
  JvCalcEditMT_TTC.Value := Round(DBTotht.Field.AsFloat + DBMt_tva.Field.AsFloat);
end;


procedure TFormLigachjj.DBCodartEnter(Sender: TObject);
begin
  FIsLoading := True;
end;


procedure TFormLigachjj.DBCodartExit(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExecArticle: TFDQuery;
  pTVA: String;
  wDate: TDateTime;

begin
  // Si on est en train d'annuler ou si le champ est vide, on laisse sortir sans bloquer
  if (FormFicheAchat.FDMemTableLigachjj.State = dsBrowse) or (DBCodart.Text = '') then
    Exit;

  // Création des requêtes temporaires
  QryExec := nil;
  QryExecArticle := nil;
  try
    QryExec := TFDQuery.Create(nil);
    QryExecArticle := TFDQuery.Create(nil);

    //QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExecArticle.Connection := DMGesCloud.ConnexionGesCloud;
    // Recherche du code barre
    QryExecArticle.SQL.Text := 'SELECT * FROM article WHERE CODART = :CODART';
    QryExecArticle.ParamByName('CODART').AsString := DBCodart.Field.AsString;
    QryExecArticle.Open;

    if QryExecArticle.Eof then
    begin
      BalloonHint1.Description := '⚠ Article inconnu !';
      BalloonHint1.ShowHint(DBCodart);
      JvDBLookupComboCodbar.SetFocus;
      Exit; // Le bloc try...finally libérera proprement les requêtes
    end;

///    DSLigachjj.DataSet.FieldByName('CODART').AsString := QryExec.FieldByName('CODART').AsString;

    // Si pas de changement de codart, on sort
    if DBCodart.Field.AsString = DBCodart.Field.OldValue then
      Exit;

    // Contrôle si changement - Affectation Libellé et Prix HT de base
    //DBLibelle.Text := FDQueryArticle.FieldByName('LIBELLE').AsString;
    DBPrixht.Field.AsFloat := FDQueryArticle.FieldByName('PMP').AsFloat;

    // Recherche tx TVA par date d'effet
    wdate := FormFicheAchat.FDMemTableAchat.FieldByName('DATE_').AsDateTime;
    pTVA := FDQueryArticle.FieldByName('TVA').AsString;
    DBTx_tva.Field.AsFloat := DM_Olivier.fgTxTaxe(wDate,pTVA);

    if pTVA <> '' then
      DSLigachjj.DataSet.FieldByName('NO_TVA').AsInteger := StrToInt(pTVA[Length(pTVA)]);

    // Champs divers
    DSLigachjj.DataSet.FieldByName('CODSSF').AsString := QryExecArticle.FieldByName('CODSSF').AsString;
    DSLigachjj.DataSet.FieldByName('CODFOU').AsString := QryExecArticle.FieldByName('CODFOU').AsString;
    DSLigachjj.DataSet.FieldByName('CODFAM').AsString := QryExecArticle.FieldByName('CODFAM').AsString;

    // Prix TTC
    DSLigachjj.DataSet.FieldByName('PRIXTTC').AsFloat := DM_Olivier.CalculerTTC(DSLigachjj.DataSet.FieldByName('PRIXHT').AsFloat, DBTx_tva.Field.AsFloat);

    CalculLigne;
    DBQte.SetFocus;

  finally
    QryExec.Free;
    QryExecArticle.Free;
  end;
end;


procedure TFormLigachjj.DBMt_tvaExit(Sender: TObject);
begin
  CalculLigne;
end;


procedure TFormLigachjj.JvCalcEditMT_TTCExit(Sender: TObject);
begin
  if DSLigachjj.DataSet.FieldByName('TOTHT').AsFloat + DSLigachjj.DataSet.FieldByName('MT_TVA').AsFloat
    <> JvCalcEditMT_TTC.Value then
  begin
    BalloonHint1.Description := '⚠ Incohérence dans les montants !';
    BalloonHint1.ShowHint(JvCalcEditMT_TTC);
    DBPrixht.SetFocus;
    Exit;
  end;

  CalculLigne;
end;


procedure TFormLigachjj.JvDBSpinPrc_remiseChange(Sender: TObject);
begin
  if FIsLoading = False then
  begin
    exit;
  end;
  CalculLigne;
end;

procedure TFormLigachjj.JvDBSpinPrc_remiseEnter(Sender: TObject);
begin
  //FIsLoading := True;
end;

procedure TFormLigachjj.JvDBSpinPrc_remiseExit(Sender: TObject);
begin
  CalculLigne;
end;

procedure TFormLigachjj.DBPrixhtExit(Sender: TObject);
begin
  if DBPrixht.Field.AsFloat<0 then
  begin
    BalloonHint1.Description := '⚠ Prix négatif interdit';
    BalloonHint1.ShowHint(DBPrixht);
    DBPrixttc.SetFocus;
  end;
  CalculLigne;
end;

procedure TFormLigachjj.DBPrixttcExit(Sender: TObject);
var
  Wtx_tva: Double;
begin
  if DBPrixttc.Field.AsFloat<0 then
  begin
    BalloonHint1.Description := '⚠ Prix négatif interdit';
    BalloonHint1.ShowHint(DBPrixttc);
    DBPrixttc.SetFocus;
  end;
//  IF FormFicheAchat.RzDBCheckBoxEXO_TVA.Checked then
//  begin
//  	Wtx_tva:=0;
//  end
//  else
  	Wtx_tva:= DBTx_tva.Field.AsFloat;

  DBPrixht.Field.AsFloat := DM_Olivier.CalculerHT(DBPrixttc.Field.AsInteger,Wtx_tva);
  CalculLigne;
end;


procedure TFormLigachjj.DBQteEnter(Sender: TObject);
begin
  FIsLoading := True;
  CalculLigne;
end;

procedure TFormLigachjj.DBQteExit(Sender: TObject);
var QryStodep: TFDQuery;
begin
  CalculLigne;
end;

procedure TFormLigachjj.DBTothtExit(Sender: TObject);
begin
  if DBQte.Field.AsFloat<>0 then
    DBPrixht.Field.AsFloat := DBTotht.Field.AsFloat / DBQte.Field.AsFloat;
  CalculLigne;
end;

procedure TFormLigachjj.FormCreate(Sender: TObject);
begin
  FDQueryArticle.Open;

//  if FormFicheAchat.RzDBCheckBoxFlag_Tax.Checked then
//    DBPrixttc.Enabled:=false
//  else
//    DBPrixht.Enabled:=false;
end;


procedure TFormLigachjj.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    ExecuterAnnulation;
    Key := 0; // Empêche le bip sonore de Windows lié à la touche Échap
  end;
end;

procedure TFormLigachjj.FormShow(Sender: TObject);
begin
  FIsLoading := False; // On active le verrou pour bloquer les calculs en cascade pendant l'initialisation
  try
    if ModeSaisieLigne = msModification then
    begin
      if not (DSLigachjj.DataSet.State in [dsEdit, dsInsert]) then
        DSLigachjj.DataSet.Edit;
      DBQte.SetFocus;
    end
    else
    begin
      // S'il s'agit d'un ajout et que le dataset n'y est pas, on le met en insert
      if not (DSLigachjj.DataSet.State in [dsEdit, dsInsert]) then
        DSLigachjj.DataSet.Insert;
      DSLigachjj.DataSet.FieldByName('QTE').AsInteger := 1;
    end;
  finally
  end;
end;

procedure TFormLigachjj.BtnAnnulerClick(Sender: TObject);
begin
  ExecuterAnnulation;
end;


procedure TFormLigachjj.BtnValiderClick(Sender: TObject);
begin
  try
    // On valide le dataset via son DataSource (plus indépendant)
    if DSLigachjj.Dataset.State in [dsEdit, dsInsert] then
    begin
      //Controle si saisie invalide
      if DSLigachjj.dataset.FieldByName('CODART').AsString='' then
      begin
        DBCodartExit(Sender);
        if DSLigachjj.dataset.FieldByName('CODART').AsString='' then
         exit;
      end;
      CalculLigne;
      DSLigachjj.Dataset.Post;
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
