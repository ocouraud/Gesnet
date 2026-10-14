unit U_TableEntcde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, frxClass,
  frxExportBaseDialog, frxExportPDF, frCoreClasses, frxDBSet;

type
  TFrameTableEntcde = class(TFrame)
    FDQueryEntcde: TFDQuery;
    DSEntcde: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_NOCDE: TEdit;
    EdtCherche_DOSSIER: TEdit;
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
    frxDBDatasetFactureAchat: TfrxDBDataset;
    frxReportFactureAchat: TfrxReport;
    FDQueryFactureAchat: TFDQuery;
    BtnCentraliser: TBitBtn;
    EditCherche_NOM: TEdit;
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure RadioGroupEtatClick(Sender: TObject);
    procedure EdtCherche_NOCDEChange(Sender: TObject);
    procedure EditCherche_CODFOUChange(Sender: TObject);
    procedure EdtCherche_DOSSIERChange(Sender: TObject);
    procedure EditCherche_DATE_Change(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnDupliquerClick(Sender: TObject);
    procedure BtnImprimerClick(Sender: TObject);
    procedure FDQueryFactureAchatCalcFields(DataSet: TDataSet);
    procedure BtnCentraliserClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure AppliquerFiltreMaitre;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule, U_OutilsGrille, U_FormAide, U_FicheEntcde;

procedure TFrameTableEntcde.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entcde_liste.html');
end;

procedure TFrameTableEntcde.BtnAjouterClick(Sender: TObject);
begin
  // On crée la fiche en passant le mode Création et le numéro 0 pour nouveau
  FormFicheEntcde := TFormFicheEntcde.Create(Self, msAjout, 0);
  try
    FormFicheEntcde.Caption := 'Créer une nouvelle pièce';

    if FormFicheEntcde.ShowModal = mrOk then
    begin
      // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
      FDQueryEntcde.Refresh;

      // Se positionner sur la nouvelle facture créée dans la grille
      if not FDQueryEntcde.IsEmpty then
        FDQueryEntcde.Locate('NOCDE', FormFicheEntcde.NumeroCree, []);
    end;
  finally
    FormFicheEntcde.Free;
  end;
end;

procedure TFrameTableEntcde.BtnCentraliserClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  Qrylig: TFDQuery;
  Qryart: TFDQuery;

  NumFacture: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;
  CodeCourant: Integer;

begin

  if FDQueryEntcde.IsEmpty then Exit;

  if FDQueryEntcde.FieldByName('TOP_').AsString = 'C' then
  begin
    ShowMessage('Opération impossible, achat déjà centralisé.');
    Exit;
  end;

  // Récupérer la clé unique de la piece
  CodeCourant := FDQueryEntcde.FieldByName('NOCDE').AsInteger;

  if MessageDlg('Centraliser l''achat ' + IntToStr(CodeCourant) + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Conversion en nombre total de secondes depuis minuit
  LHeure := Now; // ou un champ heure
  DecodeTime(Now, H, M, S, MS);
  Centiemes := MS div 10; // Conversion des millisecondes en centièmes
  // Construction de l'entier : HH * 1000000 + MM * 10000 + SS * 100 + CC
  ResultHeure := (H * 360000) + (M * 6000) + (S * 100) + Centiemes;


  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec2 := TFDQuery.Create(nil);
  Qrylig := TFDQuery.Create(nil);
  Qryart := TFDQuery.Create(nil);

  try
    Screen.Cursor := crHourGlass; // Change le curseur en sablier

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;
    Qrylig.Connection := DMGesCloud.ConnexionGesCloud;
    Qryart.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la TRANSACTION MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try

      // Parcours de la table mémoire des lignes
      Qrylig.SQL.Text := 'SELECT * FROM ligachjj WHERE NOCDE=:NOCDE';
      Qrylig.ParamByName('NOCDE').AsInteger := CodeCourant;
      Qrylig.Open;
      Qrylig.First;
      while not Qrylig.Eof do
      begin
        //Génération du mouvement de stock associé a la ligne
        VNoEnrStock :=0;
        //Controle si article géré en stock
        Qryart.Close;
        Qryart.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        Qryart.ParamByName('CODART').AsString :=Qrylig.FieldByName('CODART').AsString;
        Qryart.Open;
        if Qryart.FieldByName('G_STO').AsInteger=1 then
        begin
           if Qrylig.FieldByName('CODDEP').AsInteger=0 then
           begin
             Qrylig.Edit;
             Qrylig.FieldByName('CODDEP').AsInteger := DM_Olivier.gCoddep_defaut;
             Qrylig.Post;
           end;

           //Creation par securite du stodep
           QryExec2.Close;
           QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                            'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
           QryExec2.ParamByName('CODART').AsString := Qrylig.FieldByName('CODART').AsString;
           QryExec2.ParamByName('CODDEP').AsInteger := Qrylig.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('PMP').AsFloat := Qryart.FieldByName('PMP').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := Qryart.FieldByName('CODFOU').AsString;
           QryExec2.ExecSQL;

           //Insertion stock
           QryExec2.Close;
           //     ShowMessage(Qrylig_prof.FieldByName('CODART').AsString);
           QryExec2.SQL.Text := 'INSERT INTO stock (CODART, DATE_, ANNEE, MOIS, TYPE_, QTE, VALUNIT, PRIXVTE, CODDEP, CENTRA, LIBELLE, CODFOU, TIME, CODFAC) ' +
                            'VALUES (:CODART, :DATE_, :ANNEE, :MOIS, :TYPE_, :QTE, :VALUNIT, :PRIXVTE, :CODDEP, :CENTRA, :LIBELLE, :CODFOU, :TIME, :CODFAC)';
           QryExec2.ParamByName('CODFAC').AsInteger := 0;
           QryExec2.ParamByName('CODART').AsString := Qrylig.FieldByName('CODART').AsString;
           QryExec2.ParamByName('QTE').AsFloat := Qrylig.FieldByName('QTE').AsFloat;
           QryExec2.ParamByName('PRIXVTE').AsFloat := 0;
           QryExec2.ParamByName('VALUNIT').AsFloat := Qrylig.FieldByName('PRIXHT').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := Qryart.FieldByName('CODFOU').AsString;
           QryExec2.ParamByName('DATE_').AsDateTime := Now;
           QryExec2.ParamByName('ANNEE').AsInteger := CurrentYear;
           QryExec2.ParamByName('MOIS').AsInteger := Strtoint(FormatDateTime('mm', Now));
           QryExec2.ParamByName('CODDEP').AsInteger := Qrylig.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('CENTRA').AsString := 'C';
           QryExec2.ParamByName('LIBELLE').AsString := 'Achat DELPHI fact n°' + IntToStr(CodeCourant);
           QryExec2.ParamByName('TYPE_').AsString := 'E';
           QryExec2.ParamByName('TIME').AsInteger := ResultHeure;
           QryExec2.ExecSQL;

           // 2. Récupération du NOENR tout juste généré par MySQL pour la table stock
           QryExec2.Close;
           QryExec2.SQL.Text := 'SELECT LAST_INSERT_ID()';
           QryExec2.Open;
           VNoEnrStock := QryExec2.Fields[0].AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

           //Mise a jour NOENR_STO sur ligachjj
           Qrylig.Edit;
           Qrylig.FieldByName('NOENR_STO').AsInteger := VNoEnrStock;
           Qrylig.Post;

           //On recalcul le stock du depot et de l'article
           DM_Olivier.RecalculerStockStodep(Qrylig.FieldByName('CODART').AsString, Qrylig.FieldByName('CODDEP').AsInteger);
        end;

        QryExec2.Close;

        //Lecture ligne memoire suivante
        Qrylig.Next;
      end;

      // Mise a jour TYPE_ Facturé
      QryExec.SQL.Text := 'UPDATE achat SET TOP_ = ''C'' WHERE NOCDE = :NOCDE';
      QryExec.ParamByName('NOCDE').AsInteger := CodeCourant;
      QryExec.ExecSQL;

      // TRANSACTION: Si tout s'est déroulé sans erreur, on valide définitivement dans MySQL
      DMGesCloud.ConnexionGesCloud.Commit;

    except
      on E: Exception do
      begin
        // TRANSACTION: En cas d'erreur, on annule tout (ni l'en-tête ni les lignes ne sont modifiés)
        DMGesCloud.ConnexionGesCloud.Rollback;
        ShowMessage('Erreur lors de l''enregistrement : ' + E.Message);
      end;
    end;
  finally
    QryExec.Free;
    QryExec2.Free;
    Qrylig.Free;
    Qryart.Free;

    FDQueryEntcde.Refresh;
    AppliquerFiltreMaitre;

    Screen.Cursor := crDefault; // Restaure le curseur normal
  end;
end;


procedure TFrameTableEntcde.BtnDupliquerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryLig: TFDQuery;
  NouveauNum: Integer;
  AncienNum: Integer;
  iNolig: Integer;

begin
  AncienNum := FDQueryEntcde.FieldByName('NOCDE').AsInteger;

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
    QryExec.SQL.Text := 'SELECT NOCDE FROM `achat` ORDER BY NOCDE DESC LIMIT 1';
    QryExec.Open;
    QryExec.first;
    NouveauNum:=1;
    if QryExec.Eof=false then
      NouveauNum := QryExec.FieldByName('NOCDE').AsInteger + 1;

    // INSERT pour l'en-tête
    QryExec.close;
    QryExec.SQL.Text := 'INSERT INTO `achat` ('+
    '`NOCDE`, `REFER_`, `CODFOU`, `CODDEP`, `LIBELLE`, `DATE_`, `MT_HT`, `MT_TVA`, '+
    '`MT_TTC`, `TOP_`, `OBSERV`, `MT_REM`, `DATE_ECH`, `CODPAI`, `LIBPAI`,'+
    ' `JRSCRD`, `REGL`, `FINMOIS`, `IMPORT`) '+
    'VALUES '+
    '(:NOCDE, :REFER, :CODFOU, :CODDEP, :LIBELLE, :DATE_, :MT_HT, :MT_TVA, :MT_TTC, '+
    ':TOP, :OBSERV, :MT_REM, :DATE_ECH, :CODPAI, :LIBPAI,'+
    ' :JRSCRD, :REGL, :FINMOIS, :IMPORT)';

    // Assignation directe des valeurs depuis la table mémoire
    QryExec.ParamByName('OBSERV').AsString     := FDQueryEntcde.FieldByName('OBSERV').AsString;
    QryExec.ParamByName('NOCDE').AsInteger    := NouveauNum;
    QryExec.ParamByName('CODFOU').AsString     := FDQueryEntcde.FieldByName('CODFOU').AsString;
    QryExec.ParamByName('CODDEP').AsInteger    := FDQueryEntcde.FieldByName('CODDEP').AsInteger;
    QryExec.ParamByName('LIBELLE').AsString    := FDQueryEntcde.FieldByName('LIBELLE').AsString;
    QryExec.ParamByName('DATE_').AsDateTime    := FDQueryEntcde.FieldByName('DATE_').AsDateTime;
    QryExec.ParamByName('MT_HT').AsFloat       := FDQueryEntcde.FieldByName('TOTHT').AsFloat;
    QryExec.ParamByName('MT_TTC').AsInteger    := FDQueryEntcde.FieldByName('MT_TTC').AsInteger;
    QryExec.ParamByName('MT_TVA').AsFloat      := FDQueryEntcde.FieldByName('MT_TVA').AsFloat;
    QryExec.ParamByName('REFER').AsString      := FDQueryEntcde.FieldByName('REFER').AsString;
    QryExec.ParamByName('TOP_').AsString       := FDQueryEntcde.FieldByName('TOP_').AsString;
    QryExec.ParamByName('DATE_ECH').AsDateTime    := FDQueryEntcde.FieldByName('DATE_ECH').AsDateTime;
    QryExec.ParamByName('MT_REM').AsFloat      := FDQueryEntcde.FieldByName('MT_REM').AsFloat;
    QryExec.ParamByName('CODPAI').AsString      := FDQueryEntcde.FieldByName('CODPAI').AsString;
    QryExec.ParamByName('LIBPAI').AsString       := FDQueryEntcde.FieldByName('LIBPAI').AsString;
    QryExec.ParamByName('JRSCRD').AsInteger    := FDQueryEntcde.FieldByName('JRSCRD').AsInteger;
    QryExec.ParamByName('REGL').AsFloat      := FDQueryEntcde.FieldByName('REGL').AsFloat;
    QryExec.ParamByName('FINMOIS').AsInteger    := FDQueryEntcde.FieldByName('FINMOIS').AsInteger;
    QryExec.ParamByName('REGL').AsInteger      := FDQueryEntcde.FieldByName('REGL').AsInteger;

    QryExec.ExecSQL;


    // Dupliquer toutes les lignes associées
    // Parcours de la table mémoire des lignes
    iNolig := 0;
    QryLig.SQL.Text := 'select * from ligachjj where NOCDE = :NOCDE';
    QryLig.ParamByName('NOCDE').AsInteger := AncienNum;
    QryLig.Open;
    QryLig.First;
    while not QryLig.Eof do
    begin
      iNolig:= iNolig+1;
      //Insertion LIGNES
      QryExec.Close;
      QryExec.SQL.Text := 'INSERT INTO `ligachjj` '+
      '(`NOCDE`,'+
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
      ':NOCDE, '+
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
    FDQueryEntcde.Refresh;

    // Se positionner sur la nouvelle piece créée dans la grille
    if not FDQueryEntcde.IsEmpty then
      FDQueryEntcde.Locate('NOCDE', NouveauNum, []);

    ShowMessage('Achat dupliqué avec succès sous le numéro : ' + IntToStr(NouveauNum));
  finally
    QryExec.Free;
    QryLig.Free;
  end;
end;

procedure TFrameTableEntcde.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableEntcde.BtnImprimerClick(Sender: TObject);
var
  NumAchatSelectionne: Integer;
begin

  // 1. Lire vos paramètres globaux (via une requête ou un fichier de config)
  DM_Olivier.FDQueryCtrstock.open;

  if DM_Olivier.FDQueryCtrstock.IsEmpty then
    Exit;

     // 2. Charger le modèle d'état externe
    frxReportFactureAchat.LoadFromFile('FactureAchat.fr3');

  // 2. Vider les variables mémoire pour repartir proprement
  frxReportFactureAchat.Variables.Clear;

  // 3. CRÉER AUTOMATIQUEMENT la catégorie et les variables
  // ATTENTION : FastReport impose de créer au moins une catégorie (commençant par un espace)
  // avant d'y injecter des variables.
  frxReportFactureAchat.Variables[' ' + 'Globales'] := Null;

  // On ajoute les variables à la catégorie qui vient d'être créée
  frxReportFactureAchat.Variables.AddVariable('Globales','VarNomEntreprise',
  ( DM_Olivier.FDQueryCtrstock.FieldByName('Nom').AsString + #13#10 +
    DM_Olivier.FDQueryCtrstock.FieldByName('Nom2').AsString ));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarTelephone', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Tel').AsString));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarAdresse', DM_Olivier.FDQueryCtrstock.FieldByName('Adresse').AsString);
  frxReportFactureAchat.Variables.AddVariable('Globales','VarNoTAHITI', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('NOTAHITI').AsString));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarLOGO', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('LOGO').AsString));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarEMAIL', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('EMAIL').AsString));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarFAX', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('FAX').AsString));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarRC', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('RC').AsString));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarMEMO_DEV', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('MEMO_DEV').AsString));
  frxReportFactureAchat.Variables.AddVariable('Globales','VarRef_Bancaire', DM_Olivier.FDQueryCtrstock.FieldByName('BANQUE').AsString);
  frxReportFactureAchat.Variables.AddVariable('Globales','VarTotalAlpha',QuotedStr('Achat arrêté à la somme de : ' +
    DMGesCloud.MontantenLettres(FDQueryEntcde.FieldByName('MT_TTC').AsInteger) + ' Francs CFP.'));

  // 1. Activer la requête SQL contenant les données de l'achat
  //FDQueryDevis.ParamByName('CODDEV').AsInteger := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;
  FDQueryFactureAchat.Open;

  // 3. Afficher l'aperçu avant impression à l'écran
  frxReportFactureAchat.ShowReport;

end;

procedure TFrameTableEntcde.BtnOuvrirClick(Sender: TObject);
var
  NOCDE: Integer;
begin
  if FDQueryEntcde.IsEmpty then Exit;

  NOCDE := FDQueryEntcde.FieldByName('NOCDE').AsInteger;
  FormFicheEntcde := TFormFicheEntcde.Create(Self, msModification, NOCDE);

  try
    FormFicheEntcde.Caption := 'Modifier la commande';

    if FormFicheEntcde.ShowModal = mrOk then
    begin
      // 1. On recharge les données de la table
      FDQueryEntcde.Refresh;

      // 2. On se repositionne proprement sur l'achat modifié grâce à sa clé unique
      if not FDQueryEntcde.Locate('NOCDE', NOCDE, []) then
      begin
        // Optionnel : si la commande a changé de filtre ou n'est plus visible,
        // Locate renvoie false, gérer un repli si nécessaire.
      end;
    end;
  finally
    FormFicheEntcde.Free;
  end;

end;

procedure TFrameTableEntcde.BtnSupprimerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauType: string;
  NumCourant: Integer;
begin
  if FDQueryEntcde.IsEmpty then Exit;

  if FDQueryEntcde.FieldByName('ETAT').AsString <> 'S' then
  begin
    ShowMessage('Opération impossible, commande déjà traitée.');
    Exit;
  end;

  // Récupérer la clé unique de la piece courante
  NumCourant := FDQueryEntcde.FieldByName('NOCDE').AsInteger;

  if MessageDlg('Supprimer la pièce no '+IntToStr(NumCourant)+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Exécution d'un DELETE direct DES LIGNES
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEntcde.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM ligcde WHERE NOCDE = :NOCDE';
    QryExec.ParamByName('NOCDE').AsInteger := NumCourant;
    QryExec.ExecSQL;

  finally
    QryExec.Free;
  end;

  // Suivi d'un DELETE direct et ultra-sécurisé par la clé primaire
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEntcde.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM entcde WHERE NOCDE = :NOCDE';
    QryExec.ParamByName('NOCDE').AsInteger := NumCourant;
    QryExec.ExecSQL;

    // Rafraîchir la vue pour voir le changement instantanément
    FDQueryEntcde.Refresh;
    JvDBGrid1.SetFocus;
  finally
    QryExec.Free;
  end;
end;


constructor TFrameTableEntcde.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryEntcde.Close;
  FDQueryEntcde.Open;

  RadioGroupEtat.ItemIndex:=0;
  AppliquerFiltreMaitre;

  // FORMATAGE AFFICHAGE NUMERIQUE
  TNumericField(FDQueryEntcde.FieldByName('TOT_CFP')).DisplayFormat := '#,##0';
  TNumericField(FDQueryEntcde.FieldByName('TOT_DEVISE')).DisplayFormat := '#,##0.00';
  TNumericField(FDQueryEntcde.FieldByName('TOT_FRET')).DisplayFormat := '#,##0';
  TNumericField(FDQueryEntcde.FieldByName('TOT_TVA')).DisplayFormat := '#,##0';
end;

procedure TFrameTableEntcde.EditCherche_CODFOUChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde);
end;

procedure TFrameTableEntcde.EditCherche_DATE_Change(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde);
end;

procedure TFrameTableEntcde.EdtCherche_NOCDEChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde);
end;

procedure TFrameTableEntcde.EdtCherche_DOSSIERChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde);
end;

procedure TFrameTableEntcde.FDQueryFactureAchatCalcFields(DataSet: TDataSet);
begin
  FDQueryFactureAchat.FieldByName('tot_ttc').AsInteger:=round(FDQueryFactureAchat.FieldByName('TOTHT').AsInteger
  + FDQueryFactureAchat.FieldByName('MT_TVA_1').AsInteger);
end;

procedure TFrameTableEntcde.FrameResize(Sender: TObject);
begin
  // On force le bouton Fermer à se caler tout à droite du Panel2
  // (Largeur du Panel - Largeur du bouton - Marge de 10 pixels)
  BtnFermer.Left := Panel2.ClientWidth - BtnFermer.Width - 5;

  // On cale le bouton Aide juste à gauche du bouton Fermer
  BtnAide.Left := Panel2.ClientWidth - BtnAide.Width - 5;
end;

procedure TFrameTableEntcde.AppliquerFiltreMaitre;
var
  FiltreNature: string;
begin
  // On rafraîchit la requête si modifiée entre temps
  FDQueryEntcde.Refresh;

  // 1. Définition du filtre selon l'option sélectionnée dans le TRadioGroup
  // ItemIndex 0 = J (Non centralisés), 1 = C (Centralisés)
  case RadioGroupEtat.ItemIndex of
    0:
    begin
      FiltreNature := '(etat = ''S'')';
      BtnSupprimer.Enabled:=True;
    end;
    1:
    begin
      FiltreNature := '(etat = ''C'')';
      BtnSupprimer.Enabled:=True;
    end;
    2:
    begin
      FiltreNature := '(etat = ''R'')';
      BtnSupprimer.Enabled:=False;
    end;
  else
    FiltreNature := '(1=1)'; // Par sécurité si rien n'est sélectionné
    BtnSupprimer.Enabled:=False;
  end;

  // 3. On combine l'ensemble avec "and" (en minuscules) et des parenthèses
  FDQueryEntcde.Filter := FiltreNature;
  FDQueryEntcde.Filtered := True;
end;


procedure TFrameTableEntcde.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEntcde.IndexFieldNames = Field.FieldName then
      FDQueryEntcde.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEntcde.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFrameTableEntcde.RadioGroupEtatClick(Sender: TObject);
begin
  AppliquerFiltreMaitre();
end;

end.
