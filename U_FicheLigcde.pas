unit U_FicheLigcde;

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
  TFormLigcde = class(TForm)
    DSLigcde: TDataSource;
    Label1: TLabel;
    DBCodart: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    DBQte_UV: TJvDBCalcEdit;
    FDQueryArticle: TFDQuery;
    DSArticle: TDataSource;
    JvDBLookupComboCodbar: TJvDBLookupCombo;
    PanelFond: TPanel;
    Shape1: TShape;
    BalloonHint1: TBalloonHint;
    DBEditRef_fou: TDBEdit;
    Label2: TLabel;
    Label5: TLabel;
    DBEditUV: TDBEdit;
    Label9: TLabel;
    DBEditUC: TDBEdit;
    Label10: TLabel;
    DBQte_UC: TJvDBCalcEdit;
    Label6: TLabel;
    DBPx_UC: TJvDBCalcEdit;
    Shape2: TShape;
    JvCalcEditQte_UV_UC: TJvCalcEdit;
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure DBQte_UVExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCodartEnter(Sender: TObject);
    procedure DBCodartExit(Sender: TObject);
    procedure DBQte_UVEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBQte_UCExit(Sender: TObject);
    procedure DBQte_UCEnter(Sender: TObject);

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
  FormLigcde: TFormLigcde;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_FicheEntcde, U_DataModule;


procedure TFormLigcde.ExecuterAnnulation;
begin
      // Si des modifications étaient en cours, on les annule proprement
  if FormFicheEntcde.FDMemTableLigcde.State in [dsEdit, dsInsert] then
    FormFicheEntcde.FDMemTableLigcde.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;


//CALCUL COMPLET DE LA LIGNE
procedure TFormLigcde.CalculLigne;
var
  AQte: Double;
begin
  // Si le formulaire est en train de se fermer ou de charger, on sort
  if (ModalResult <> mrNone) or (FIsLoading = False) then
    Exit;

  // S'assurer que le dataset est modifiable
  if not (DSLigcde.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

end;


procedure TFormLigcde.DBCodartEnter(Sender: TObject);
begin
  FIsLoading := True;
end;


procedure TFormLigcde.DBCodartExit(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExecArticle: TFDQuery;
  pTVA: String;
  wDate: TDateTime;

begin
  // Si on est en train d'annuler ou si le champ est vide, on laisse sortir sans bloquer
  if (FormFicheEntcde.FDMemTableLigcde.State = dsBrowse) or (DBCodart.Text = '') then
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

///    DSLigcde.DataSet.FieldByName('CODART').AsString := QryExec.FieldByName('CODART').AsString;

    // Si pas de changement de codart, on sort
    if DBCodart.Field.AsString = DBCodart.Field.OldValue then
      Exit;

	  //SAI_LIBELLE	= article.libelle
    DSLigcde.DataSet.FieldByName('UV').AsString := 'Piece';
    DSLigcde.DataSet.FieldByName('UC').AsString := QryExecArticle.FieldByName('UC').AsString;
    DSLigcde.DataSet.FieldByName('REF_FOU').AsString := QryExecArticle.FieldByName('REF_FOU').AsString;
    DSLigcde.DataSet.FieldByName('PX_UC').AsFloat := QryExecArticle.FieldByName('prixach').AsFloat;
    JvCalcEditQte_UV_UC.Value := QryExecArticle.FieldByName('QTE_UV_UC').AsInteger;
    if JvCalcEditQte_UV_UC.Value=0 then
      JvCalcEditQte_UV_UC.Value:=1;

    CalculLigne;
    DBQte_UV.SetFocus;

  finally
    QryExec.Free;
    QryExecArticle.Free;
  end;
end;

procedure TFormLigcde.DBQte_UCEnter(Sender: TObject);
begin
  FIsLoading := True;
  CalculLigne;
end;

procedure TFormLigcde.DBQte_UCExit(Sender: TObject);
begin
  DBQte_UV.Value := DBQte_UC.Value * JvCalcEditQte_UV_UC.Value;
  CalculLigne;
end;

procedure TFormLigcde.DBQte_UVEnter(Sender: TObject);
begin
  FIsLoading := True;
  CalculLigne;
end;

procedure TFormLigcde.DBQte_UVExit(Sender: TObject);
var QryStodep: TFDQuery;
begin
  DBQte_UC.Value := DBQte_UV.Value * JvCalcEditQte_UV_UC.Value;
  CalculLigne;
end;

procedure TFormLigcde.FormCreate(Sender: TObject);
begin
  FDQueryArticle.Open;

//  if FormFicheEntcde.RzDBCheckBoxFlag_Tax.Checked then
//    DBPrixttc.Enabled:=false
//  else
//    DBPrixht.Enabled:=false;
end;


procedure TFormLigcde.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    ExecuterAnnulation;
    Key := 0; // Empêche le bip sonore de Windows lié à la touche Échap
  end;
end;

procedure TFormLigcde.FormShow(Sender: TObject);
begin
  FIsLoading := False; // On active le verrou pour bloquer les calculs en cascade pendant l'initialisation
  try
    if ModeSaisieLigne = msModification then
    begin
      if not (DSLigcde.DataSet.State in [dsEdit, dsInsert]) then
        DSLigcde.DataSet.Edit;
      DBQte_UV.SetFocus;
    end
    else
    begin
      // S'il s'agit d'un ajout et que le dataset n'y est pas, on le met en insert
      if not (DSLigcde.DataSet.State in [dsEdit, dsInsert]) then
        DSLigcde.DataSet.Insert;
      //DSLigcde.DataSet.FieldByName('QTE').AsInteger := 1;
    end;
  finally
  end;
end;

procedure TFormLigcde.BtnAnnulerClick(Sender: TObject);
begin
  ExecuterAnnulation;
end;


procedure TFormLigcde.BtnValiderClick(Sender: TObject);
begin
  try
    // On valide le dataset via son DataSource (plus indépendant)
    if DSLigcde.Dataset.State in [dsEdit, dsInsert] then
    begin
      //Controle si saisie invalide
      if DSLigcde.dataset.FieldByName('CODART').AsString='' then
      begin
        DBCodartExit(Sender);
        if DSLigcde.dataset.FieldByName('CODART').AsString='' then
         exit;
      end;
      if JvCalcEditQte_UV_UC.Value=0 then
        JvCalcEditQte_UV_UC.Value:=1;
      CalculLigne;
      DSLigcde.Dataset.Post;
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
