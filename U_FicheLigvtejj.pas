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
  JvDBControls, JvSpin, JvDBSpinEdit;

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
    DBMemo1: TDBMemo;
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
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBTx_tva: TDBEdit;
    Label12: TLabel;
    DBMt_tva: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    DBQte: TJvDBCalcEdit;
    DBPrixht: TJvDBCalcEdit;
    DBPrixttc: TJvDBCalcEdit;
    DBPrc_remise: TJvDBSpinEdit;
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
var
  Wtx_tva: Double;

begin
  // Si le formulaire est en train de se fermer ou de valider, on dégage immédiatement
  if (ModalResult <> mrNone) or (FIsLoading = False) then
    Exit;

  DSLigvtejj.DataSet.Edit;

  IF FormEntvtejj.RzDBCheckBoxEXO_TVA.Checked then
  begin
  	Wtx_tva:=0;
  end
  else
  	Wtx_tva:= DBTx_tva.Field.AsFloat;

  DBPrixnet.Field.AsFloat := DBPrixht.Field.AsFloat
   -((DBPrixht.Field.AsFloat/100)*DBPrc_remise.Value);    //Field.AsFloat);

  DBPrixttc.Field.AsInteger := round(DM_Olivier.CalculerTTC(DBPrixnet.Field.AsFloat,Wtx_tva));

  if FormEntvtejj.RzDBCheckBoxFlag_Tax.Enabled then
  begin
    DBMt_ttc.Field.AsInteger :=	DBPrixttc.Field.AsInteger * DBQte.Field.AsInteger;
    DBTotht.Field.AsFloat := DM_Olivier.CalculerHT(DBMt_ttc.Field.AsInteger,Wtx_tva);
    DBMt_tva.Field.AsFloat := (DBTotht.Field.AsFloat/100) * Wtx_tva;
    //SAI_MT_TSOC= ligvtepc.totht/100*SAI_TX_TSOC
  end
  else
  begin
    DBTotht.Field.AsFloat := DBPrixnet.Field.AsFloat * DBQte.Field.AsFloat;
    DBMt_tva.Field.AsFloat := (DBTotht.Field.AsFloat/100)*Wtx_tva;
    //SAI_MT_TSOC= SAI_TOTHT/100*SAI_TX_TSOC
    DBMt_ttc.Field.AsInteger := Round(DBTotht.Field.AsFloat + DBMt_tva.Field.AsFloat);    //+SAI_MT_TSOC)
  end;
end;


procedure TFormLigvtejj.DBCodbarEnter(Sender: TObject);
begin
  FIsLoading := True;
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


procedure TFormLigvtejj.DBQteExit(Sender: TObject);
begin
  CalculLigne;
end;

procedure TFormLigvtejj.FormCreate(Sender: TObject);
begin
  if FormEntvtejj.RzDBCheckBoxFlag_Tax.Checked then
    DBPrixttc.Enabled:=false
  else
    DBPrixht.Enabled:=false;
end;


procedure TFormLigvtejj.FormShow(Sender: TObject);
begin
  FIsLoading := False; // Ton verrou initial
  try
    if ModeSaisieLigne = msModification then
    begin
      if not (DSLigvtejj.DataSet.State in [dsEdit, dsInsert]) then
        DSLigvtejj.DataSet.Edit;
    end;
    // Si c'est msAjout, le .Insert a déjà été fait par le parent, on ne touche à rien ici.
  finally
    //FIsLoading := False;
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
  // Exemple de validation (si vous décommentez plus tard)
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
