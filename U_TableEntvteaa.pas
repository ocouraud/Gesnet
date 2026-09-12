unit U_TableEntvteaa;

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
  TFrameTableEntvteaa = class(TFrame)
    Panel2: TPanel;
    BtnOuvrir: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridEntvteaa: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODFAC: TEdit;
    EdtCherche_NOM: TEdit;
    EditCherche_SEL: TEdit;
    CheckBoxToutesFactures: TCheckBox;
    EditCherche_DATE_: TEdit;
    EditCherche_CODCLI: TEdit;
    EditCherche_CODCAI: TEdit;
    FDQueryEntvteaa: TFDQuery;
    StringField1: TStringField;
    LargeintField1: TLargeintField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    LargeintField2: TLargeintField;
    ShortintField1: TShortintField;
    SmallintField1: TSmallintField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    SmallintField2: TSmallintField;
    IntegerField2: TIntegerField;
    SmallintField3: TSmallintField;
    DateField1: TDateField;
    IntegerField3: TIntegerField;
    BCDField1: TBCDField;
    IntegerField4: TIntegerField;
    BCDField2: TBCDField;
    LargeintField3: TLargeintField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    BCDField7: TBCDField;
    BCDField8: TBCDField;
    BCDField9: TBCDField;
    BCDField10: TBCDField;
    LargeintField4: TLargeintField;
    StringField7: TStringField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    StringField8: TStringField;
    SmallintField8: TSmallintField;
    SmallintField9: TSmallintField;
    StringField9: TStringField;
    SmallintField10: TSmallintField;
    DateField2: TDateField;
    IntegerField5: TIntegerField;
    StringField10: TStringField;
    SmallintField11: TSmallintField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField11: TStringField;
    BCDField11: TBCDField;
    BCDField12: TBCDField;
    BCDField13: TBCDField;
    SmallintField13: TSmallintField;
    BCDField14: TBCDField;
    BCDField15: TBCDField;
    BooleanField1: TBooleanField;
    StringField12: TStringField;
    DSEntvteaa: TDataSource;
    BtnImprimer: TButton;
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
    procedure JvDBGridEntvteaaTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CODFACChange(Sender: TObject);
    procedure EditCherche_SELChange(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure FDQueryEntvtejjCalcFields(DataSet: TDataSet);
    procedure JvDBGridEntvteaaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnImprimerClick(Sender: TObject);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide, U_FicheFacture, U_FormCentraVentes, U_ReportFactureMem;


procedure TFrameTableEntvteaa.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entvteaa_liste.html');
end;


procedure TFrameTableEntvteaa.BtnFermerClick(Sender: TObject);
var
  OngletParent: TRzTabSheet;
begin
  if Assigned(Self.Parent) and (Self.Parent is TRzTabSheet) then
  begin
    OngletParent := TRzTabSheet(Self.Parent);

    // Repousse la destruction de l'onglet à la fin du traitement du clic
    TThread.ForceQueue(nil, procedure
    begin
      OngletParent.Free;
    end);
  end;
end;

procedure TFrameTableEntvteaa.BtnImprimerClick(Sender: TObject);
var
  FormFactureMemPrint: TFormFactureMemPrint;
  QryEnt, QryLig, QryReg: TFDQuery;
  ACodFac: Integer;
begin
  if FDQueryEntvteaa.IsEmpty then Exit;

  // 1. On récupère le code de la facture actuellement sélectionnée dans la grille
  ACodFac := FDQueryEntvteaa.FieldByName('CODFAC').AsInteger;

  // 2. On crée des requêtes dédiées et isolées pour l'impression de cette facture
  QryEnt := TFDQuery.Create(nil);
  QryLig := TFDQuery.Create(nil);
  QryReg := TFDQuery.Create(nil);
  try
    QryEnt.Connection := DMGesCloud.ConnexionGesCloud;
    QryLig.Connection := DMGesCloud.ConnexionGesCloud;
    QryReg.Connection := DMGesCloud.ConnexionGesCloud;

    // On sélectionne uniquement l'en-tête, les lignes et les règlements de CE code facture
    QryEnt.SQL.Text := 'SELECT * FROM entvteaa WHERE codfac = :CodFac';
    QryEnt.ParamByName('CodFac').AsInteger := ACodFac;
    QryEnt.Open;

    QryLig.SQL.Text := 'SELECT * FROM ligvteaa WHERE codfac = :CodFac';
    QryLig.ParamByName('CodFac').AsInteger := ACodFac;
    QryLig.Open;

    QryReg.SQL.Text := 'SELECT * FROM reglaa WHERE codfac = :CodFac';
    QryReg.ParamByName('CodFac').AsInteger := ACodFac;
    QryReg.Open;

    // 3. On lance l'impression avec ces données strictement filtrées
    FormFactureMemPrint := TFormFactureMemPrint.Create(nil);
    try
      FormFactureMemPrint.ImprimerFacture(QryEnt, QryLig, QryReg);
    finally
      FormFactureMemPrint.Free;
    end;

  finally
    QryEnt.Free;
    QryLig.Free;
    QryReg.Free;
  end;
end;


procedure TFrameTableEntvteaa.BtnOuvrirClick(Sender: TObject);
var
  NumFacture: Integer; // ou Int64 selon la taille de votre numérique
  FormFicheFacture: TFormFicheFacture; // <-- On déclare la variable de la fiche
begin
  NumFacture := FDQueryEntvteaa.FieldByName('CODFAC').AsInteger; // ou le nom exact de votre champ dans la ligne

  // 1. On charge la facture dans le DataModule
  DMGesCloud.FDQueryPrintEntvteaa.Close;
//  DMGesCloud.FDQueryPrintEntvteaa.SQL.Text := 'SELECT * FROM entvteaa WHERE CODFAC = :codfac';
  DMGesCloud.FDQueryPrintEntvteaa.Params[0].AsInteger := NumFacture; // Utilisation de .AsInteger pour un champ numérique
  DMGesCloud.FDQueryPrintEntvteaa.Open;

  FormFicheFacture := TFormFicheFacture.Create(Self);
  FormFicheFacture.Caption := 'Consultation Facture N° ' + FDQueryEntvteaa.FieldByName('CODFAC').AsString;

try
    FormFicheFacture.ShowModal;
  finally
    FormFicheFacture.Free;
  end;
end;


procedure TFrameTableEntvteaa.CheckBoxToutesFacturesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;


procedure TFrameTableEntvteaa.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete si modifiee entre temps
  FDQueryEntvteaa.Refresh;

  if CheckBoxToutesFactures.Checked then
    FiltreSQL := 'codcai <> ''ZZ'''
  else
    FiltreSQL := 'codcai = ' +  QuotedStr(DM_Olivier.Gcodcai);  //QuotedStr(Format('%.2d', [DM_Olivier.NumeroPoste]));

  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    FDQueryEntvteaa.Filter := FiltreSQL;
    FDQueryEntvteaa.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    FDQueryEntvteaa.Filtered := False;
  end;
end;


constructor TFrameTableEntvteaa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryEntvteaa.Close;
  FDQueryEntvteaa.Open;

  //Factures du poste par defaut
  //AppliquerFiltreMaitre();
end;


procedure TFrameTableEntvteaa.EditCherche_SELChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvteaa);
end;

procedure TFrameTableEntvteaa.EdtCherche_CODFACChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvteaa);
end;

procedure TFrameTableEntvteaa.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvteaa);
end;


procedure TFrameTableEntvteaa.FDQueryEntvtejjCalcFields(DataSet: TDataSet);
begin
  if not FDQueryEntvteaa.FieldByName('HEURE').IsNull then
  begin
    // On appelle votre fonction placée dans le DataModule
    FDQueryEntvteaa.FieldByName('HeureLisible').AsString :=
      DM_Olivier.CentièmesVersHeureLisible(FDQueryEntvteaa.FieldByName('HEURE').AsLargeInt);
  end
  else
    FDQueryEntvteaa.FieldByName('HeureLisible').AsString := '';
end;


procedure TFrameTableEntvteaa.JvDBGridEntvteaaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Si avoir
  if Assigned(JvDBGridEntvteaa.DataSource) and Assigned(JvDBGridEntvteaa.DataSource.DataSet) then
  begin
    if JvDBGridEntvteaa.DataSource.DataSet.FieldByName('TYPE_').AsString = 'A' then
    begin
      // Change la couleur du fond de la cellule
      JvDBGridEntvteaa.Canvas.Brush.Color := clRed;
      // Change la couleur du texte
      JvDBGridEntvteaa.Canvas.Font.Color := clWhite;
    end;
  end;

  // L'instruction indispensable pour appliquer le dessin par défaut avec nos modifications de couleurs
  JvDBGridEntvteaa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrameTableEntvteaa.JvDBGridEntvteaaTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEntvteaa.IndexFieldNames = Field.FieldName then
      FDQueryEntvteaa.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEntvteaa.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

end.
