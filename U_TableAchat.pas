unit U_TableAchat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, frxClass,
  frxExportBaseDialog, frxExportPDF, frCoreClasses, frxDBSet;

type
  TFrameTableAchat = class(TFrame)
    FDQueryAchat: TFDQuery;
    DSAchat: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODACH: TEdit;
    EdtCherche_LIBELLE: TEdit;
    EditCherche_DATE_: TEdit;
    EditCherche_CODFOU: TEdit;
    RadioGroupEtat: TRadioGroup;
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    BtnImprimer: TButton;
    BtnAjouter: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnDupliquer: TBitBtn;
    frxPDFExport1: TfrxPDFExport;
    frxDBDatasetCde_Client: TfrxDBDataset;
    frxReportCmde_Client: TfrxReport;
    FDQueryCmde_Client: TFDQuery;
    FDQueryAchatCODACH: TLargeintField;
    FDQueryAchatCODFOU: TStringField;
    FDQueryAchatCODDEP: TSmallintField;
    FDQueryAchatPOSTE: TStringField;
    FDQueryAchatLIBELLE: TStringField;
    FDQueryAchatREFER: TStringField;
    FDQueryAchatDATE_: TDateField;
    FDQueryAchatDATE_COMPTA: TDateField;
    FDQueryAchatDATE_ECH: TDateField;
    FDQueryAchatMT_HT: TBCDField;
    FDQueryAchatMT_REM: TBCDField;
    FDQueryAchatMT_TVA: TIntegerField;
    FDQueryAchatMT_TTC: TIntegerField;
    FDQueryAchatCODPAI: TStringField;
    FDQueryAchatLIBPAI: TStringField;
    FDQueryAchatTOP_: TStringField;
    FDQueryAchatJRSCRD: TSmallintField;
    FDQueryAchatFINMOIS: TSmallintField;
    FDQueryAchatREGL: TSmallintField;
    FDQueryAchatIMPORT: TSmallintField;
    FDQueryAchatDER_MODIF: TIntegerField;
    FDQueryAchatMT_TSOC: TLargeintField;
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure RadioGroupEtatClick(Sender: TObject);
    procedure EdtCherche_CODACHChange(Sender: TObject);
    procedure EditCherche_CODFOUChange(Sender: TObject);
    procedure EdtCherche_LIBELLEChange(Sender: TObject);
    procedure EditCherche_DATE_Change(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnDupliquerClick(Sender: TObject);
    procedure BtnImprimerClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure AppliquerFiltreMaitre;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule, U_OutilsGrille, U_FormAide, U_FicheAchat;

procedure TFrameTableAchat.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('achat_liste.html');
end;

procedure TFrameTableAchat.BtnAjouterClick(Sender: TObject);
begin
  // On crée la fiche en passant le mode Création et le numéro 0 pour nouveau
  FormFicheAchat := TFormFicheAchat.Create(Self, msAjout, 0);
  try
    FormFicheAchat.Caption := 'Créer une nouvelle pièce';

    if FormFicheAchat.ShowModal = mrOk then
    begin
      // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
      FDQueryAchat.Refresh;

      // Se positionner sur la nouvelle facture créée dans la grille
      if not FDQueryAchat.IsEmpty then
        FDQueryAchat.Locate('CODACH', FormFicheAchat.CodAchCree, []);
    end;
  finally
    FormFicheAchat.Free;
  end;
end;

procedure TFrameTableAchat.BtnDupliquerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryLig: TFDQuery;
  NouveauNum: Integer;
  AncienNum: Integer;
  iNolig: Integer;

begin
  AncienNum := FDQueryAchat.FieldByName('CODACH').AsInteger;

  if AncienNum = 0 then
  begin
    ShowMessage('Veuillez sélectionner une pièce dans la liste.');
    Exit;
  end;

  if MessageDlg('Dupliquer la pièce ' +IntToStr(AncienNum)+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;


  QryExec := TFDQuery.Create(nil);
  QryLig := TFDQuery.Create(nil);
  try
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryLig.Connection := DMGesCloud.ConnexionGesCloud;

    //Recuperation dernier num pièce
    QryExec.close;
    QryExec.SQL.Text := 'SELECT CODACH FROM `achat` ORDER BY CODACH DESC LIMIT 1';
    QryExec.Open;
    QryExec.first;
    NouveauNum:=1;
    if QryExec.Eof=false then
      NouveauNum := QryExec.FieldByName('CODACH').AsInteger + 1;

    // INSERT pour l'en-tête
    QryExec.close;
    QryExec.SQL.Text := 'INSERT INTO `achat` ('+
    '`CODACH`, `REFER_`, `CODFOU`, `CODDEP`, `LIBELLE`, `DATE_`, `MT_HT`, `MT_TVA`, '+
    '`MT_TTC`, `TOP_`, `OBSERV`, `MT_REM`, `DATE_ECH`, `CODPAI`, `LIBPAI`,'+
    ' `JRSCRD`, `REGL`, `FINMOIS`, `IMPORT`) '+
    'VALUES '+
    '(:CODACH, :REFER, :CODFOU, :CODDEP, :LIBELLE, :DATE_, :MT_HT, :MT_TVA, :MT_TTC, '+
    ':TOP, :OBSERV, :MT_REM, :DATE_ECH, :CODPAI, :LIBPAI,'+
    ' :JRSCRD, :REGL, :FINMOIS, :IMPORT)';

    // Assignation directe des valeurs depuis la table mémoire
    QryExec.ParamByName('OBSERV').AsString     := FDQueryAchat.FieldByName('OBSERV').AsString;
    QryExec.ParamByName('CODACH').AsInteger    := NouveauNum;
    QryExec.ParamByName('CODFOU').AsString     := FDQueryAchat.FieldByName('CODFOU').AsString;
    QryExec.ParamByName('CODDEP').AsInteger    := FDQueryAchat.FieldByName('CODDEP').AsInteger;
    QryExec.ParamByName('LIBELLE').AsString    := FDQueryAchat.FieldByName('LIBELLE').AsString;
    QryExec.ParamByName('DATE_').AsDateTime    := FDQueryAchat.FieldByName('DATE_').AsDateTime;
    QryExec.ParamByName('MT_HT').AsFloat       := FDQueryAchat.FieldByName('TOTHT').AsFloat;
    QryExec.ParamByName('MT_TTC').AsInteger    := FDQueryAchat.FieldByName('MT_TTC').AsInteger;
    QryExec.ParamByName('MT_TVA').AsFloat      := FDQueryAchat.FieldByName('MT_TVA').AsFloat;
    QryExec.ParamByName('REFER').AsString      := FDQueryAchat.FieldByName('REFER').AsString;
    QryExec.ParamByName('TOP_').AsString       := FDQueryAchat.FieldByName('TOP_').AsString;
    QryExec.ParamByName('DATE_ECH').AsDateTime    := FDQueryAchat.FieldByName('DATE_ECH').AsDateTime;
    QryExec.ParamByName('MT_REM').AsFloat      := FDQueryAchat.FieldByName('MT_REM').AsFloat;
    QryExec.ParamByName('CODPAI').AsString      := FDQueryAchat.FieldByName('CODPAI').AsString;
    QryExec.ParamByName('LIBPAI').AsString       := FDQueryAchat.FieldByName('LIBPAI').AsString;
    QryExec.ParamByName('JRSCRD').AsInteger    := FDQueryAchat.FieldByName('JRSCRD').AsInteger;
    QryExec.ParamByName('REGL').AsFloat      := FDQueryAchat.FieldByName('REGL').AsFloat;
    QryExec.ParamByName('FINMOIS').AsInteger    := FDQueryAchat.FieldByName('FINMOIS').AsInteger;
    QryExec.ParamByName('REGL').AsInteger      := FDQueryAchat.FieldByName('REGL').AsInteger;

    QryExec.ExecSQL;


    // Dupliquer toutes les lignes associées
    // Parcours de la table mémoire des lignes
    iNolig := 0;
    QryLig.SQL.Text := 'select * from ligachjj where codach = :codach';
    QryLig.ParamByName('CODACH').AsInteger := AncienNum;
    QryLig.Open;
    QryLig.First;
    while not QryLig.Eof do
    begin
      iNolig:= iNolig+1;
      //Insertion LIGNES
      QryExec.Close;
      QryExec.SQL.Text := 'INSERT INTO `ligachjj` '+
      '(`CODACH`,'+
      '`REFER`,'+
      '`DATE_`,'+
      '`CODFOU`,'+
      '`CODSSF`,'+
      '`CODFAM`,'+
      '`CODART`,'+
      '`CODDEP`,'+
      '`QTE`,'+
      '`PRIXHT`,'+
      '`PRIXTTC`,'+
      '`TOTHT`,'+
      '`TX_TVA`,'+
      '`MT_TVA`,'+
      '`NO_TVA`,'+
      '`NOENR_STO`) '+
      'VALUES  ('+
      ':CODACH, '+
      ':REFER, '+
      ':DATE_, '+
      ':CODFOU, '+
      ':CODSSF, '+
      ':CODFAM, '+
      ':CODART, '+
      ':CODDEP, '+
      ':QTE, '+
      ':PRIXHT, '+
      ':PRIXTTC, '+
      ':TOTHT, '+
      ':TX_TVA, '+
      ':MT_TVA, '+
      ':NO_TVA, '+
      ':NOENR_STO)';

      // Assignation directe des valeurs depuis la table mémoire des lignes
      QryExec.ParamByName('NOCDE').AsInteger     := NouveauNum;
      QryExec.ParamByName('LIBELLE').AsString    := QryLig.FieldByName('LIBELLE').AsString;
      QryExec.ParamByName('CODCLI').AsInteger    := QryLig.FieldByName('CODCLI').AsInteger;
      QryExec.ParamByName('CODART').AsString     := QryLig.FieldByName('CODART').AsString;
      QryExec.ParamByName('QTE').AsFloat         := QryLig.FieldByName('QTE').AsFloat;
      QryExec.ParamByName('PRIXHT').AsFloat      := QryLig.FieldByName('PRIXHT').AsFloat;
      QryExec.ParamByName('PRIXTTC').AsInteger   := QryLig.FieldByName('PRIXTTC').AsInteger;
      QryExec.ParamByName('TOTHT').AsFloat       := QryLig.FieldByName('TOTHT').AsFloat;
      QryExec.ParamByName('MT_TTC').AsInteger    := QryLig.FieldByName('MT_TTC').AsInteger;
      QryExec.ParamByName('TX_TVA').AsFloat      := QryLig.FieldByName('TX_TVA').AsFloat;
      QryExec.ParamByName('MT_TVA').AsFloat      := QryLig.FieldByName('MT_TVA').AsFloat;
      QryExec.ParamByName('TVA').AsString        := QryLig.FieldByName('TVA').AsString;
      QryExec.ParamByName('OBSERV').AsString     := QryLig.FieldByName('OBSERV').AsString;
      QryExec.ParamByName('DATE_').AsDateTime    := QryLig.FieldByName('DATE_').AsDateTime;
      QryExec.ParamByName('NOLIG').AsInteger     := iNolig;

      QryExec.ExecSQL;
      //Lecture ligne suivante
      QryLig.Next;
    end;

    // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
    FDQueryAchat.Refresh;

    // Se positionner sur la nouvelle piece créée dans la grille
    if not FDQueryAchat.IsEmpty then
      FDQueryAchat.Locate('CODACH', NouveauNum, []);

    ShowMessage('Achat dupliqué avec succès sous le numéro : ' + IntToStr(NouveauNum));
  finally
    QryExec.Free;
    QryLig.Free;
  end;
end;

procedure TFrameTableAchat.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableAchat.BtnImprimerClick(Sender: TObject);
var
  NumDevisSelectionne: Integer;
begin

  // 1. Lire vos paramètres globaux (via une requête ou un fichier de config)
  DM_Olivier.FDQueryCtrstock.open;

  if DM_Olivier.FDQueryCtrstock.IsEmpty then
    Exit;

     // 2. Charger le modèle d'état externe
    frxReportCmde_Client.LoadFromFile('Commande_client.fr3');

  // 2. Vider les variables mémoire pour repartir proprement
  frxReportCmde_Client.Variables.Clear;

  // 3. CRÉER AUTOMATIQUEMENT la catégorie et les variables
  // ATTENTION : FastReport impose de créer au moins une catégorie (commençant par un espace)
  // avant d'y injecter des variables.
  frxReportCmde_Client.Variables[' ' + 'Globales'] := Null;

  // On ajoute les variables à la catégorie qui vient d'être créée
  frxReportCmde_Client.Variables.AddVariable('Globales','VarNomEntreprise',
  ( DM_Olivier.FDQueryCtrstock.FieldByName('Nom').AsString + #13#10 +
    DM_Olivier.FDQueryCtrstock.FieldByName('Nom2').AsString ));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarTelephone', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Tel').AsString));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarAdresse', DM_Olivier.FDQueryCtrstock.FieldByName('Adresse').AsString);
  frxReportCmde_Client.Variables.AddVariable('Globales','VarNoTAHITI', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('NOTAHITI').AsString));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarLOGO', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('LOGO').AsString));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarEMAIL', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('EMAIL').AsString));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarFAX', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('FAX').AsString));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarRC', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('RC').AsString));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarMEMO_DEV', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('MEMO_DEV').AsString));
  frxReportCmde_Client.Variables.AddVariable('Globales','VarRef_Bancaire', DM_Olivier.FDQueryCtrstock.FieldByName('BANQUE').AsString);
  frxReportCmde_Client.Variables.AddVariable('Globales','VarTotalAlpha',QuotedStr('Commande arrêtée à la somme de : ' +
    DMGesCloud.MontantenLettres(FDQueryAchat.FieldByName('MT_TTC').AsInteger) + ' Francs CFP.'));

  // 1. Activer la requête SQL contenant les données du devis
  //FDQueryDevis.ParamByName('CODDEV').AsInteger := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;
  FDQueryCmde_Client.Open;

  // 3. Afficher l'aperçu avant impression à l'écran
  frxReportCmde_Client.ShowReport;

end;

procedure TFrameTableAchat.BtnOuvrirClick(Sender: TObject);
var
  CodAch: Integer;
begin
  if FDQueryAchat.IsEmpty then Exit;

  CodAch := FDQueryAchat.FieldByName('CODACH').AsInteger;
  FormFicheAchat := TFormFicheAchat.Create(Self, msModification, CodAch);

  try
    FormFicheAchat.Caption := 'Modifier la commande';

    if FormFicheAchat.ShowModal = mrOk then
    begin
      // 1. On recharge les données de la table
      FDQueryAchat.Refresh;

      // 2. On se repositionne proprement sur le devis modifié grâce à sa clé unique
      if not FDQueryAchat.Locate('CODACH', CodAch, []) then
      begin
        // Optionnel : si la commande a changé de filtre ou n'est plus visible,
        // Locate renvoie false, gérer un repli si nécessaire.
      end;
    end;
  finally
    FormFicheAchat.Free;
  end;

end;

procedure TFrameTableAchat.BtnSupprimerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauType: string;
  NumCourant: Integer;
begin
  if FDQueryAchat.IsEmpty then Exit;

  if FDQueryAchat.FieldByName('TOP_').AsString = 'C' then
  begin
    ShowMessage('Opération impossible, achat déjà centralisé.');
    Exit;
  end;

  // Récupérer la clé unique de la piece courante
  NumCourant := FDQueryAchat.FieldByName('CODACH').AsInteger;

  if MessageDlg('Supprimer la pièce no '+IntToStr(NumCourant)+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Exécution d'un DELETE direct DES LIGNES
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryAchat.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM ligachjj WHERE CODACH = :CODACH';
    QryExec.ParamByName('CODACH').AsInteger := NumCourant;
    QryExec.ExecSQL;

  finally
    QryExec.Free;
  end;

  // Suivi d'un DELETE direct et ultra-sécurisé par la clé primaire
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryAchat.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM achat WHERE CODACH = :CODACH';
    QryExec.ParamByName('CODACH').AsInteger := NumCourant;
    QryExec.ExecSQL;

    // Rafraîchir la vue pour voir le changement instantanément
    FDQueryAchat.Refresh;
    JvDBGrid1.SetFocus;
  finally
    QryExec.Free;
  end;
end;


constructor TFrameTableAchat.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryAchat.Close;
  FDQueryAchat.Open;

  RadioGroupEtat.ItemIndex:=0;
  AppliquerFiltreMaitre;

  // FORMATAGE AFFICHAGE NUMERIQUE
  TNumericField(FDQueryAchat.FieldByName('MT_HT')).DisplayFormat := '#,##0.00';
  TNumericField(FDQueryAchat.FieldByName('MT_TTC')).DisplayFormat := '#,##0';
  TNumericField(FDQueryAchat.FieldByName('MT_TVA')).DisplayFormat := '#,##0.00';
  TNumericField(FDQueryAchat.FieldByName('MT_REM')).DisplayFormat := '#,##0.00';
end;

procedure TFrameTableAchat.EditCherche_CODFOUChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryAchat);
end;

procedure TFrameTableAchat.EditCherche_DATE_Change(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryAchat);
end;

procedure TFrameTableAchat.EdtCherche_CODACHChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryAchat);
end;

procedure TFrameTableAchat.EdtCherche_LIBELLEChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryAchat);
end;

procedure TFrameTableAchat.FrameResize(Sender: TObject);
begin
  // On force le bouton Fermer à se caler tout à droite du Panel2
  // (Largeur du Panel - Largeur du bouton - Marge de 10 pixels)
  BtnFermer.Left := Panel2.ClientWidth - BtnFermer.Width - 5;

  // On cale le bouton Aide juste à gauche du bouton Fermer
  BtnAide.Left := Panel2.ClientWidth - BtnAide.Width - 5;
end;

procedure TFrameTableAchat.AppliquerFiltreMaitre;
var
  FiltreNature: string;
begin
  // On rafraîchit la requête si modifiée entre temps
  FDQueryAchat.Refresh;

  // 1. Définition du filtre selon l'option sélectionnée dans le TRadioGroup
  // ItemIndex 0 = J (Non centralisés), 1 = C (Centralisés)
  case RadioGroupEtat.ItemIndex of
    0:
    begin
      FiltreNature := '(top_ = ''J'')';
      BtnSupprimer.Enabled:=True;
    end;
    1:
    begin
      FiltreNature := '(top_ = ''C'')';
      BtnSupprimer.Enabled:=False;
    end;
  else
    FiltreNature := '(1=1)'; // Par sécurité si rien n'est sélectionné
    BtnSupprimer.Enabled:=False;
  end;

  // 3. On combine l'ensemble avec "and" (en minuscules) et des parenthèses
  FDQueryAchat.Filter := FiltreNature;
  FDQueryAchat.Filtered := True;
end;


procedure TFrameTableAchat.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryAchat.IndexFieldNames = Field.FieldName then
      FDQueryAchat.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryAchat.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFrameTableAchat.RadioGroupEtatClick(Sender: TObject);
begin
  AppliquerFiltreMaitre();
end;

end.
