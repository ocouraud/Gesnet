unit U_TableDevis;

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
  TFrameTableDevis = class(TFrame)
    Panel2: TPanel;
    BtnOuvrir: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridEnt_prof: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODFAC: TEdit;
    EdtCherche_NOM: TEdit;
    EditCherche_SEL: TEdit;
    CheckBoxToutesFactures: TCheckBox;
    EditCherche_DATE_: TEdit;
    EditCherche_CODCLI: TEdit;
    EditCherche_CODCAI: TEdit;
    FDQueryEnt_prof: TFDQuery;
    StringField1: TStringField;
    LargeintField1: TLargeintField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    LargeintField2: TLargeintField;
    ShortintField1: TShortintField;
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
    StringField10: TStringField;
    SmallintField11: TSmallintField;
    SQLTimeStampField1: TSQLTimeStampField;
    BCDField12: TBCDField;
    BCDField13: TBCDField;
    SmallintField13: TSmallintField;
    BCDField14: TBCDField;
    BCDField15: TBCDField;
    BooleanField1: TBooleanField;
    StringField12: TStringField;
    DSEnt_prof: TDataSource;
    BtnImprimer: TButton;
    BtnAjouter: TBitBtn;
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
    procedure JvDBGridEnt_profTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CODFACChange(Sender: TObject);
    procedure EditCherche_SELChange(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure FDQueryEnt_profCalcFields(DataSet: TDataSet);
    procedure BtnImprimerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide, U_FicheEnt_prof, U_ReportDevis;


procedure TFrameTableDevis.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('ent_prof_liste.html');
end;


procedure TFrameTableDevis.BtnAjouterClick(Sender: TObject);
begin
  // On crée la fiche en passant le mode Création et le numéro 0 pour nouveau
  FormEnt_prof := TFormEnt_prof.Create(Self, msAjout, 0);
  try
    FormEnt_prof.Caption := 'Créer une nouvelle facture';

    if FormEnt_prof.ShowModal = mrOk then
    begin
      // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
      FDQueryEnt_prof.Refresh;

      // Se positionner sur la nouvelle facture créée dans la grille
      if not FDQueryEnt_prof.IsEmpty then
        FDQueryEnt_prof.Locate('CODDEV', FormEnt_prof.CodDevCree, []);
    end;
  finally
    FormEnt_prof.Free;
  end;
end;

procedure TFrameTableDevis.BtnFermerClick(Sender: TObject);
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


procedure TFrameTableDevis.BtnImprimerClick(Sender: TObject);
var
  NumDevisSelectionne: Integer;
begin
  // 1. On récupère le numéro de la facture sélectionnée dans la grille des factures
  // (Assurez-vous de cibler le bon champ, ici supposé 'CODFAC')
  NumDevisSelectionne := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if NumDevisSelectionne = 0 then
  begin
    ShowMessage('Veuillez sélectionner un devis dans la liste.');
    Exit;
  end;

  // 2. On injecte le paramètre et on ouvre les requêtes sur le DataModule
  DM_Olivier.FDQueryEnt_prof.Close;
  DM_Olivier.FDQueryEnt_prof.ParamByName('CODDEV').AsInteger := NumDevisSelectionne;
  DM_Olivier.FDQueryEnt_prof.Open;

  DMGesCloud.FDQueryRepres.Close;
  DMGesCloud.FDQueryRepres.ParamByName('CODREP').AsInteger := FDQueryEnt_prof.FieldByName('CODREP').AsInteger;
  DMGesCloud.FDQueryRepres.Open;

  // 3. On crée la fiche d'impression, on affiche l'aperçu, puis on libère la mémoire
  FormDevisPrint := TFormDevisPrint.Create(Self);

  FormDevisPrint.FDQueryLig_prof.Close;
  FormDevisPrint.FDQueryLig_prof.ParamByName('CODDEV').AsInteger := NumDevisSelectionne;
  FormDevisPrint.FDQueryLig_prof.Open;
  try
    // RLReport1 est le nom de votre composant TRLReport sur FormDevisPrint
    FormDevisPrint.RLReport1.Preview;
  finally
    FormDevisPrint.Free;
  end;
 end;


procedure TFrameTableDevis.BtnOuvrirClick(Sender: TObject);
var
  //Fiche: TFormEntvtejj;
  NumDevis: Integer;
begin
  if FDQueryEnt_prof.IsEmpty then Exit;

  // Récupérez le CODFAC depuis la grille de la liste des factures
  NumDevis := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;
  FormEnt_prof := TFormEnt_prof.Create(Self, msModification,NumDevis);

  try
    FormEnt_prof.Caption := 'Modifier le devis';

    if FormEnt_prof.ShowModal = mrOk then
    begin
      FDQueryEnt_prof.Refresh;
    end;
  finally
    FormEnt_prof.Free;
  end;
end;



procedure TFrameTableDevis.CheckBoxToutesFacturesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;


procedure TFrameTableDevis.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete si modifiee entre temps
  FDQueryEnt_prof.Refresh;

  if CheckBoxToutesFactures.Checked then
    FiltreSQL := 'codcai <> ''ZZ'''
  else
    FiltreSQL := 'codcai = ' +  QuotedStr(DM_Olivier.Gcodcai);  //QuotedStr(Format('%.2d', [DM_Olivier.NumeroPoste]));

  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    FDQueryEnt_prof.Filter := FiltreSQL;
    FDQueryEnt_prof.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    FDQueryEnt_prof.Filtered := False;
  end;
end;


constructor TFrameTableDevis.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryEnt_prof.Close;
  FDQueryEnt_prof.Open;

  //Factures du poste par defaut
  //AppliquerFiltreMaitre();
end;


procedure TFrameTableDevis.EditCherche_SELChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEnt_prof);
end;

procedure TFrameTableDevis.EdtCherche_CODFACChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEnt_prof);
end;

procedure TFrameTableDevis.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEnt_prof);
end;


procedure TFrameTableDevis.FDQueryEnt_profCalcFields(DataSet: TDataSet);
begin
  if not FDQueryEnt_prof.FieldByName('HEURE').IsNull then
  begin
    // On appelle votre fonction placée dans le DataModule
    FDQueryEnt_prof.FieldByName('HeureLisible').AsString :=
      DM_Olivier.CentièmesVersHeureLisible(FDQueryEnt_prof.FieldByName('HEURE').AsLargeInt);
  end
  else
    FDQueryEnt_prof.FieldByName('HeureLisible').AsString := '';
end;


procedure TFrameTableDevis.JvDBGridEnt_profTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEnt_prof.IndexFieldNames = Field.FieldName then
      FDQueryEnt_prof.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEnt_prof.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

end.
