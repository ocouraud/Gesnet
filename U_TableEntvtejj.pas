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
    BtnSuspendre: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridEntvtejj: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODFAC: TEdit;
    EdtCherche_NOM: TEdit;
    EditCherche_SEL: TEdit;
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
    EditCherche_DATE_: TEdit;
    EditCherche_CODCLI: TEdit;
    EditCherche_CODCAI: TEdit;
    FDQueryEntvtejjHeureLisible: TStringField;
    BtnCentralisation: TButton;
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
    procedure JvDBGridEntvtejjTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CODFACChange(Sender: TObject);
    procedure EditCherche_SELChange(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure FDQueryEntvtejjCalcFields(DataSet: TDataSet);
    procedure JvDBGridEntvtejjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGridEntvtejjDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FDQueryEntvtejjAfterScroll(DataSet: TDataSet);
    procedure BtnSuspendreClick(Sender: TObject);
    procedure BtnCentralisationClick(Sender: TObject);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide, U_FicheEntvtejj, U_FormCentraVentes;

procedure TFrameTableEntvtejj.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entvtejj_liste.html');
end;

procedure TFrameTableEntvtejj.BtnAjouterClick(Sender: TObject);
begin
  // On crée la fiche en passant le mode Création et le numéro 0 pour nouveau
  FormEntvtejj := TFormEntvtejj.Create(Self, msAjout, 0);
  try
    FormEntvtejj.Caption := 'Créer une nouvelle facture';

    if FormEntvtejj.ShowModal = mrOk then
    begin
      // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
      FDQueryEntvtejj.Refresh;

      // Se positionner sur la nouvelle facture créée dans la grille
      if not FDQueryEntvtejj.IsEmpty then
        FDQueryEntvtejj.Locate('CODFAC', FormEntvtejj.CodFacCree, []);
    end;
  finally
    FormEntvtejj.Free;
  end;
end;


procedure TFrameTableEntvtejj.BtnCentralisationClick(Sender: TObject);
begin
  if FDQueryEntvtejj.IsEmpty then Exit;

  FormCentraVentes := TFormCentraVentes.Create(Self);

  try
    FormCentraVentes.Caption := 'Centralisation des ventes non suspendues';

    if FormCentraVentes.ShowModal = mrOk then
    begin
      FDQueryEntvtejj.Refresh;
    end;
  finally
    FormCentraVentes.Free;
  end;
end;


procedure TFrameTableEntvtejj.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableEntvtejj.BtnOuvrirClick(Sender: TObject);
var
  //Fiche: TFormEntvtejj;
  NumFacture: Integer;
begin
  if FDQueryEntvtejj.IsEmpty then Exit;

  // Récupérez le CODFAC depuis la grille de la liste des factures
  NumFacture := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
  FormEntvtejj := TFormEntvtejj.Create(Self, msModification,NumFacture);

  try
    FormEntvtejj.Caption := 'Modifier la facture';

    if FormEntvtejj.ShowModal = mrOk then
    begin
      FDQueryEntvtejj.Refresh;
    end;
  finally
    FormEntvtejj.Free;
  end;
end;


procedure TFrameTableEntvtejj.BtnSuspendreClick(Sender: TObject); // ou Sender d'origine
var
  QryExec: TFDQuery;
begin
  if FDQueryEntvtejj.IsEmpty then Exit;

  QryExec := nil; // Initialisation indispensable
  try
    FDQueryEntvtejj.Edit;
    if FDQueryEntvtejj.FieldByName('TOP_').AsString = 'F' then
    begin
      FDQueryEntvtejj.FieldByName('TOP_').AsString := 'S';
    end
    else
    begin
      QryExec := TFDQuery.Create(nil);
      QryExec.Connection := DMGesCloud.ConnexionGesCloud;
      QryExec.SQL.Text := 'select sum(montant) as totreg from regljj where codfac=:codfac';
      QryExec.ParamByName('CODFAC').AsInteger := FDQueryEntvtejj.FieldByName('CODFAC').AsInteger;
      QryExec.Open;

      if not QryExec.Eof then
      begin
        // Utilise de préférence .AsCurrency ou .AsFloat pour comparer des montants
        if QryExec.FieldByName('totreg').AsCurrency = FDQueryEntvtejj.FieldByName('mt_ttc').AsCurrency then
          FDQueryEntvtejj.FieldByName('TOP_').AsString := 'F'
        else
          ShowMessage('Opération impossible, règlement incomplet.');
      end;
    end;
    FDQueryEntvtejj.Post;
    JvDBGridEntvtejj.SetFocus;
  finally
    QryExec.Free; // S'exécutera proprement dans tous les cas
  end;
end;


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
  FDQueryEntvtejj.Open;

  //Factures du poste par defaut
  AppliquerFiltreMaitre();
end;


procedure TFrameTableEntvtejj.EditCherche_SELChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvtejj);
end;

procedure TFrameTableEntvtejj.EdtCherche_CODFACChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvtejj);
end;

procedure TFrameTableEntvtejj.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntvtejj);
end;

procedure TFrameTableEntvtejj.FDQueryEntvtejjAfterScroll(DataSet: TDataSet);
begin
  if JvDBGridEntvtejj.DataSource.DataSet.FieldByName('TOP_').AsString = 'F' then
  begin
    BtnSuspendre.Caption:='Suspendre';
    BtnSuspendre.Font.Color := clRed;
  end
  else
  begin
     BtnSuspendre.Caption:='Libérer';
     BtnSuspendre.Font.Color := clGreen;
  end;
end;

procedure TFrameTableEntvtejj.FDQueryEntvtejjCalcFields(DataSet: TDataSet);
begin
  if not FDQueryEntvtejj.FieldByName('HEURE').IsNull then
  begin
    // On appelle votre fonction placée dans le DataModule
    FDQueryEntvtejj.FieldByName('HeureLisible').AsString :=
      DM_Olivier.CentièmesVersHeureLisible(FDQueryEntvtejj.FieldByName('HEURE').AsLargeInt);
  end
  else
    FDQueryEntvtejj.FieldByName('HeureLisible').AsString := '';
end;


procedure TFrameTableEntvtejj.JvDBGridEntvtejjDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Si avoir
  if Assigned(JvDBGridEntvtejj.DataSource) and Assigned(JvDBGridEntvtejj.DataSource.DataSet) then
  begin
    if JvDBGridEntvtejj.DataSource.DataSet.FieldByName('TYPE_').AsString = 'A' then
    begin
      // Change la couleur du fond de la cellule
      JvDBGridEntvtejj.Canvas.Brush.Color := clRed;
      // Change la couleur du texte
      JvDBGridEntvtejj.Canvas.Font.Color := clWhite;
    end;
  end;
  // Si facture suspendue
  if Assigned(JvDBGridEntvtejj.DataSource) and Assigned(JvDBGridEntvtejj.DataSource.DataSet) then
  begin
    if JvDBGridEntvtejj.DataSource.DataSet.FieldByName('TOP_').AsString = 'S' then
    begin
      // Change la couleur du fond de la cellule
      //JvDBGridEntvtejj.Canvas.Brush.Color := clRed;
      // Change la couleur du texte
      JvDBGridEntvtejj.Canvas.Font.Color := clRed;
    end;
  end;

  // L'instruction indispensable pour appliquer le dessin par défaut avec nos modifications de couleurs
  JvDBGridEntvtejj.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrameTableEntvtejj.JvDBGridEntvtejjKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
//    VK_RETURN:
//      begin
//        Key := 0; // Empêche le comportement natif de la touche Entrée sur la grille
//        BtnModifierLigne.Click;
//      end;

    VK_INSERT:
      begin
        Key := 0;
        BtnAjouter.Click;
      end;

    VK_DELETE:
      begin
        Key := 0;
        BtnSuspendre.Click;
      end;
  end;
end;


procedure TFrameTableEntvtejj.JvDBGridEntvtejjTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEntvtejj.IndexFieldNames = Field.FieldName then
      FDQueryEntvtejj.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEntvtejj.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

end.
