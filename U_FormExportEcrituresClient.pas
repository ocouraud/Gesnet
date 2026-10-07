unit U_FormExportEcrituresClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvExStdCtrls, JvRadioButton, Vcl.ExtCtrls, JvExExtCtrls,
  JvRadioGroup, JvCheckBox, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, frxClass, frxDBSet, frCoreClasses;

type
  TFormExportEcrituresClient = class(TForm)
    BtnGenerer: TButton;
    JvDateEditDu: TJvDateEdit;
    JvDateEditAu: TJvDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    JvCheckBoxVentes: TJvCheckBox;
    JvCheckBoxTresor: TJvCheckBox;
    JvRadioGroup1: TJvRadioGroup;
    JvRadioButtonNouveaux: TJvRadioButton;
    JvRadioButtonTous: TJvRadioButton;
    JvRadioGroup2: TJvRadioGroup;
    JvRadioGroup3: TJvRadioGroup;
    JvRadioButtonPasInterf: TJvRadioButton;
    JvRadioButtonSaari: TJvRadioButton;
    JvRadioButtonRevatel: TJvRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnFermer: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    FDQueryEcr_cpt: TFDQuery;
    DSEcr_cpt: TDataSource;
    JvDBGrid1: TJvDBGrid;
    frxReportEcr_cpt: TfrxReport;
    frxDBDatasetEcr_cpt: TfrxDBDataset;
    BtnImprimer: TButton;
    frxDBDatasetImp_cpta: TfrxDBDataset;
    FDQueryImp_cpta: TFDQuery;
    frxReportImp_cpta: TfrxReport;
    BtnJournal: TButton;
    BtnDecompta: TButton;
    procedure BtnGenererClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimerClick(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure BtnJournalClick(Sender: TObject);
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnDecomptaClick(Sender: TObject);
  private
    { Déclarations privées }
    pNature: Integer;
    pEtendu: Integer;
    pModele: Integer;
  public
    { Déclarations publiques }
  end;

var
  FormExportEcrituresClient: TFormExportEcrituresClient;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier, U_DM_ExportEcrituresClients, U_FormAide, U_TableEntvteaa;

procedure TFormExportEcrituresClient.BtnGenererClick(Sender: TObject);
var
  DateDebut, DateFin: TDateTime;
begin

  // Vérifier si le texte des deux composants forme une vraie date valide
  if not TryStrToDate(JvDateEditDu.Text, DateDebut) or
     not TryStrToDate(JvDateEditAu.Text, DateFin) then
  begin
    ShowMessage('Veuillez renseigner une date de début et une date de fin complètes et valides.');
    JvDateEditDu.SetFocus;
    Exit;
  end;

  // Vérifier la cohérence chronologique (la date de début ne doit pas dépasser la fin)
  if JvDateEditDu.Date > JvDateEditAu.Date then
  begin
    ShowMessage('La date de début ne peut pas être postérieure à la date de fin.');
    JvDateEditDu.SetFocus;
    Exit;
  end;

  pNature:=0;
  if JvCheckBoxVentes.Checked=True then
  begin
    pNature:=1;
    if JvCheckBoxTresor.Checked=True then
      pNature:=3;
  end
  else
  begin
    if JvCheckBoxTresor.Checked=True then
      pNature:=2;
  end;

  pEtendu:=0;
  if JvRadioButtonNouveaux.Checked=True then
    pEtendu:=1;  //Nouveaux seulement
  if JvRadioButtonTous.Checked=True then
    pEtendu:=2;  //Tous

  pModele:=0;
  if JvRadioButtonSaari.Checked=True then
    pModele:=1;
  if JvRadioButtonRevatel.Checked=True then
    pModele:=2;

  DM_ExportEcrituresClients.Export_Ecrit_Compta_Clients(JvDateEditDu.Date,JvDateEditAu.Date,pModele,pNature,pEtendu);
  ShowMessage('Génération terminée');

  FDQueryEcr_cpt.Refresh;
  FDQueryImp_cpta.Refresh;
  end;

procedure TFormExportEcrituresClient.BtnImprimerClick(Sender: TObject);
begin
  // Charger le fichier de modèle FastReport
  frxReportEcr_cpt.LoadFromFile('EcrituresClients.fr3');

  // Optionnel : Passer des paramètres globaux si nécessaire (ex: date de début/fin)
  // frxReportExport.Variables['DateDebut'] := QuotedStr(DateToStr(JvDateEditDu.Date));

  // Lancer l'aperçu avant impression
  frxReportEcr_cpt.ShowReport;
end;

procedure TFormExportEcrituresClient.BtnJournalClick(Sender: TObject);
begin
  // Charger le fichier de modèle FastReport
  frxReportImp_cpta.LoadFromFile('Imp_cpta.fr3');

  // Optionnel : Passer des paramètres globaux si nécessaire (ex: date de début/fin)
  frxReportImp_cpta.Variables['DateDebut'] := QuotedStr(DateToStr(JvDateEditDu.Date));
  frxReportImp_cpta.Variables['DateFin'] := QuotedStr(DateToStr(JvDateEditAu.Date));
  frxReportImp_cpta.Variables['NomSociete'] := QuotedStr(DM_Olivier.gNomSociete);

  // Lancer l'aperçu avant impression
  frxReportImp_cpta.ShowReport;
end;

procedure TFormExportEcrituresClient.BtnDecomptaClick(Sender: TObject);
var
  DlgForm: TForm;
  FiltreFrame: TFrameTableEntvteaa;
  BtnValider: TButton;
  iNoLot: Integer;
  QryEVA: TFDQuery;
  i: Integer;
  iNoFacture: Integer;
begin
  // Création de la Form popup à la volée
  DlgForm := TForm.CreateNew(nil);
  try
    DlgForm.Caption := 'Sélection des factures à décomptabiliser';
    DlgForm.Width := 950;
    DlgForm.Height := 600;
    DlgForm.Position := poScreenCenter;

    // Création du bouton de validation en bas de la fenêtre popup
    BtnValider := TButton.Create(DlgForm);
    BtnValider.Parent := DlgForm;
    BtnValider.Caption := 'Valider la sélection';
    BtnValider.Align := alBottom;
    BtnValider.Height := 40;
    BtnValider.ModalResult := mrOk; // Clic sur ce bouton ferme la fenêtre avec le code mrOk

    // Intégration du Frame dans la Form (au-dessus du bouton)
    FiltreFrame := TFrameTableEntvteaa.Create(DlgForm);

    // Filtrer pour ne garder que les factures dont DATE_COMPTA est renseignée ===
    FiltreFrame.FDQueryEntvteaa.Close;
    FiltreFrame.FDQueryEntvteaa.SQL.Text :=
      'SELECT * FROM entvteaa WHERE DATE_COMPTA IS NOT NULL AND DATE_COMPTA <> "" ORDER BY CODFAC';
    FiltreFrame.FDQueryEntvteaa.Open;
    // ==============================================================================================
    FiltreFrame.Parent := DlgForm;
    FiltreFrame.Align := alClient;

    // Affichage de la fenêtre en mode modal
    if DlgForm.ShowModal = mrOk then
    begin
      // Vérifier si des lignes sont sélectionnées dans la grille du Frame
      if Assigned(FiltreFrame.JvDBGridEntvteaa.SelectedRows) and
         (FiltreFrame.JvDBGridEntvteaa.SelectedRows.Count > 0) then
      begin
        QryEVA := TFDQuery.Create(nil);
        try
          // Optionnel : FDConnection1.StartTransaction;
          //...
          // 1. Lier le query à la même connexion que les autres composants
          QryEVA.Connection := DMGesCloud.ConnexionGesCloud;

          // Parcourir toutes les lignes multi-sélectionnées (Ctrl + Clic)
          for i := 0 to FiltreFrame.JvDBGridEntvteaa.SelectedRows.Count - 1 do
          begin
            FiltreFrame.FDQueryEntvteaa.Bookmark := FiltreFrame.JvDBGridEntvteaa.SelectedRows[i];
            iNoFacture := FiltreFrame.FDQueryEntvteaa.FieldByName('CODFAC').AsInteger;

            if iNoFacture <> 0 then
            begin
              QryEVA.SQL.Text := 'UPDATE entvteaa set DATE_COMPTA=NULL WHERE codfac=:codfac';
              QryEVA.ParamByName('codfac').AsInteger := iNoFacture;
              QryEVA.ExecSQL;
            end;
          end;

          // FDConnection1.Commit;
          ShowMessage(IntToStr(FiltreFrame.JvDBGridEntvteaa.SelectedRows.Count) + ' facture(s) décomptablisée(s) avec succès.');

        except
          on E: Exception do
          begin
            // FDConnection1.Rollback;
            ShowMessage('Erreur lors de la décomptabilisation multiple : ' + E.Message);
          end;
        end;
        QryEVA.Free;
      end
      else
      begin
        ShowMessage('Aucune facture n''a été sélectionnée.');
      end;
    end;
  finally
    DlgForm.Free;
  end;

end;

procedure TFormExportEcrituresClient.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
  //BtnImprimer.Visible:=False;

  JvDateEditDu.Date:=Now;
  JvDateEditAu.Date:=Now;

  JvCheckBoxVentes.Checked:=True;

  JvRadioButtonNouveaux.Checked:=True;
  JvRadioButtonTous.Checked:=False;

  DM_Olivier.FDQueryCtrstock.Open;
  if DM_Olivier.FDQueryCtrstock.FieldByName('INTER_CPTA').AsInteger=1 then
    JvRadioButtonSaari.Checked:=True;
  if DM_Olivier.FDQueryCtrstock.FieldByName('INTER_CPTA').AsInteger=2 then
    JvRadioButtonRevatel.Checked:=True;

  FDQueryEcr_cpt.Open;
  FDQueryImp_cpta.Open;
  end;

procedure TFormExportEcrituresClient.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEcr_cpt.IndexFieldNames = Field.FieldName then
      FDQueryEcr_cpt.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEcr_cpt.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFormExportEcrituresClient.TabSheet1Enter(Sender: TObject);
begin
  //BtnImprimer.Visible:=False;
end;

procedure TFormExportEcrituresClient.TabSheet2Enter(Sender: TObject);
begin
  //BtnImprimer.Visible:=True;
end;

end.
