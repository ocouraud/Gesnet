unit U_TableEntvtejj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrameTableEntvtejj = class(TFrame)
    Panel2: TPanel;
    BtnAjouter: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODFAC: TEdit;
    EdtCherche_NOM: TEdit;
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
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide;

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
  FDQueryEntvtejj.open;

  //Factures du poste par defaut
  AppliquerFiltreMaitre();

end;


end.
