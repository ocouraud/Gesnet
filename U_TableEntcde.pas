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
    procedure Validation;
    procedure Centralisation;
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
begin

  if FDQueryEntcde.IsEmpty then Exit;

  case FDQueryEntcde.FieldByName('ETAT').AsString[1] of
    //En saisie -> En attente
    'S' :
      begin
        Validation;
      end;

    //En attente -> Recuperation (fin)
    'C' :
      begin
        Centralisation;
      end;

  else
    ShowMessage('Opération impossible, commande déjà validée.');
    Exit;
  end;
end;


procedure TFrameTableEntcde.Validation;
var
  QryExec: TFDQuery;
  Qrylig: TFDQuery;
  CodeCourant: Integer;

begin

  // Récupérer la clé unique de la piece
  CodeCourant := FDQueryEntcde.FieldByName('NOCDE').AsInteger;

  if MessageDlg('Validation de la commande ' + IntToStr(CodeCourant) + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  Qrylig := TFDQuery.Create(nil);

  try
    Screen.Cursor := crHourGlass; // Change le curseur en sablier

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    Qrylig.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la TRANSACTION MySQL
    DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      // Parcours de la table mémoire des lignes
      Qrylig.SQL.Text := 'SELECT * FROM ligcde WHERE NOCDE=:NOCDE';
      Qrylig.ParamByName('NOCDE').AsInteger := CodeCourant;
      Qrylig.Open;
      if Qrylig.RecordCount>0 then
      begin
        // Mise a jour ETAT
        QryExec.SQL.Text := 'UPDATE entcde SET ETAT = ''C'' WHERE NOCDE = :NOCDE';
        QryExec.ParamByName('NOCDE').AsInteger := CodeCourant;
        QryExec.ExecSQL;
      end
      else
        ShowMessage('Opération annulée, aucune ligne saisie.');

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
    Qrylig.Free;

    FDQueryEntcde.Refresh;
    AppliquerFiltreMaitre;

    Screen.Cursor := crDefault; // Restaure le curseur normal
  end;
end;

procedure TFrameTableEntcde.Centralisation;
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

  // Récupérer la clé unique de la piece
  CodeCourant := FDQueryEntcde.FieldByName('NOCDE').AsInteger;

  if MessageDlg('Centraliser la commande ' + IntToStr(CodeCourant) + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
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
      Qrylig.SQL.Text := 'SELECT * FROM ligcde WHERE NOCDE=:NOCDE AND QTE_UV_RC<>0';
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
           if FDQueryEntcde.FieldByName('CODDEP').AsInteger=0 then
           begin
             FDQueryEntcde.Edit;
             FDQueryEntcde.FieldByName('CODDEP').AsInteger := DM_Olivier.gCoddep_defaut;
             FDQueryEntcde.Post;
           end;

           //Creation par securite du stodep
           QryExec2.Close;
           QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                            'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
           QryExec2.ParamByName('CODART').AsString := Qrylig.FieldByName('CODART').AsString;
           QryExec2.ParamByName('CODDEP').AsInteger := FDQueryEntcde.FieldByName('CODDEP').AsInteger;
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
           QryExec2.ParamByName('QTE').AsFloat := Qrylig.FieldByName('QTE_UV_RC').AsFloat;
           QryExec2.ParamByName('PRIXVTE').AsFloat := 0;
           QryExec2.ParamByName('VALUNIT').AsFloat := Qrylig.FieldByName('PX_REV').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := Qryart.FieldByName('CODFOU').AsString;
           QryExec2.ParamByName('DATE_').AsDateTime := Now;
           QryExec2.ParamByName('ANNEE').AsInteger := CurrentYear;
           QryExec2.ParamByName('MOIS').AsInteger := Strtoint(FormatDateTime('mm', Now));
           QryExec2.ParamByName('CODDEP').AsInteger := FDQueryEntcde.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('CENTRA').AsString := 'C';
           QryExec2.ParamByName('LIBELLE').AsString := 'Commande DELPHI n°' + IntToStr(CodeCourant);
           QryExec2.ParamByName('TYPE_').AsString := 'E';
           QryExec2.ParamByName('TIME').AsInteger := ResultHeure;
           QryExec2.ExecSQL;

           //On recalcul le stock du depot et de l'article
           DM_Olivier.RecalculerStockStodep(Qrylig.FieldByName('CODART').AsString, FDQueryEntcde.FieldByName('CODDEP').AsInteger);
        end;

        QryExec2.Close;

        //Lecture ligne memoire suivante
        Qrylig.Next;
      end;

      // Mise a jour TYPE_ Facturé
      QryExec.SQL.Text := 'UPDATE entcde SET ETAT = ''R'' WHERE NOCDE = :NOCDE';
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

  if FDQueryEntcde.FieldByName('ETAT').AsString <> 'R' then
  begin
    ShowMessage('Opération impossible, commande en cours.');
    Exit;
  end;

  if MessageDlg('Dupliquer la commande ' +IntToStr(AncienNum)+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;


  QryExec := TFDQuery.Create(nil);
  QryLig := TFDQuery.Create(nil);
  try
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryLig.Connection := DMGesCloud.ConnexionGesCloud;

    //Recuperation dernier num pièce
    QryExec.close;
    QryExec.SQL.Text := 'SELECT NOCDE FROM `entcde` ORDER BY NOCDE DESC LIMIT 1';
    QryExec.Open;
    QryExec.first;
    NouveauNum:=1;
    if QryExec.Eof=false then
      NouveauNum := QryExec.FieldByName('NOCDE').AsInteger + 1;

    // INSERT pour l'en-tête
    QryExec.close;
    QryExec.SQL.Text := 'INSERT INTO entcde '+
    '(`NOCDE`,'+
    '`DOSSIER`,'+
    '`CODFOU`,'+
    '`DATE_`,'+
    '`DEVISE`,'+
    '`TAUX`,'+
    '`ASSUR`,'+
    '`TRANSP`,'+
    '`COM_DOU`,'+
    '`EXPED`,'+
    '`ETAT`,'+
//        '`DATE_ARRIVEE`,'+
    '`TOT_DEVISE`,'+
    '`TOT_CFP`,'+
    '`TOT_FRET`,'+
    '`TOT_COMM_DOU`,'+
    '`TOT_DROITS`,'+
    '`TOT_ASSUR`,'+
    '`TOT_TVA`,'+
    '`COEF_PR`,'+
    '`COEF_PV`,'+
    '`CODDEP`,'+
    '`OBSERV`,'+
    '`PRC_MARG`) '+
    'VALUES '+
    '(:NOCDE ,'+
    ':DOSSIER ,'+
    ':CODFOU ,'+
    ':DATE_ ,'+
    ':DEVISE ,'+
    ':TAUX ,'+
    ':ASSUR ,'+
    ':TRANSP ,'+
    ':COM_DOU ,'+
    ':EXPED ,'+
    ':ETAT ,'+
//        ':DATE_ARRIVEE ,'+
    ':TOT_DEVISE ,'+
    ':TOT_CFP ,'+
    ':TOT_FRET ,'+
    ':TOT_COMM_DOU ,'+
    ':TOT_DROITS ,'+
    ':TOT_ASSUR ,'+
    ':TOT_TVA ,'+
    ':COEF_PR ,'+
    ':COEF_PV ,'+
    ':CODDEP ,'+
    ':OBSERV ,'+
    ':PRC_MARG )';


    // Assignation directe des valeurs depuis la table mémoire
    QryExec.ParamByName('OBSERV').AsString  := FDQueryEntcde.FieldByName('OBSERV').AsString;
    QryExec.ParamByName('NOCDE').AsInteger  := NouveauNum;
    QryExec.ParamByName('CODFOU').AsString   := FDQueryEntcde.FieldByName('CODFOU').AsString;
    QryExec.ParamByName('ETAT').AsString     := 'S';
    QryExec.ParamByName('DATE_').AsDateTime  := Now;
    //QryExec.ParamByName('DATE_ARRIVEE').AsDateTime  := FDQueryEntcde.FieldByName('DATE_ARRIVEE').AsDateTime;
    QryExec.ParamByName('TOT_DEVISE').AsFloat     := FDQueryEntcde.FieldByName('TOT_DEVISE').AsFloat;
    QryExec.ParamByName('TOT_CFP').AsInteger    := FDQueryEntcde.FieldByName('TOT_CFP').AsInteger;
    QryExec.ParamByName('TOT_FRET').AsInteger  := FDQueryEntcde.FieldByName('TOT_FRET').AsInteger;
    QryExec.ParamByName('TOT_COMM_DOU').AsInteger  := FDQueryEntcde.FieldByName('TOT_COMM_DOU').AsInteger;
    QryExec.ParamByName('TOT_DROITS').AsInteger  := FDQueryEntcde.FieldByName('TOT_DROITS').AsInteger;
    QryExec.ParamByName('TOT_ASSUR').AsInteger  := FDQueryEntcde.FieldByName('TOT_ASSUR').AsInteger;
    QryExec.ParamByName('TOT_TVA').AsInteger  := FDQueryEntcde.FieldByName('TOT_TVA').AsInteger;
    QryExec.ParamByName('DOSSIER').AsString    := FDQueryEntcde.FieldByName('DOSSIER').AsString;
    QryExec.ParamByName('DEVISE').AsString    := FDQueryEntcde.FieldByName('DEVISE').AsString;
    QryExec.ParamByName('TAUX').AsFloat     := FDQueryEntcde.FieldByName('TAUX').AsFloat;
    QryExec.ParamByName('COEF_PR').AsFloat     := FDQueryEntcde.FieldByName('COEF_PR').AsFloat;
    QryExec.ParamByName('COEF_PV').AsFloat     := FDQueryEntcde.FieldByName('COEF_PV').AsFloat;
    QryExec.ParamByName('PRC_MARG').AsFloat     := FDQueryEntcde.FieldByName('PRC_MARG').AsFloat;
    QryExec.ParamByName('CODDEP').AsInteger  := FDQueryEntcde.FieldByName('CODDEP').AsInteger;
    QryExec.ParamByName('ASSUR').AsString   := FDQueryEntcde.FieldByName('ASSUR').AsString;
    QryExec.ParamByName('TRANSP').AsString   := FDQueryEntcde.FieldByName('TRANSP').AsString;
    QryExec.ParamByName('COM_DOU').AsString   := FDQueryEntcde.FieldByName('COM_DOU').AsString;
    QryExec.ParamByName('EXPED').AsString   := FDQueryEntcde.FieldByName('EXPED').AsString;
    QryExec.ExecSQL;


    // Dupliquer toutes les lignes associées
    // Parcours de la table mémoire des lignes
    iNolig := 0;
    QryLig.SQL.Text := 'select * from ligcde where NOCDE = :NOCDE';
    QryLig.ParamByName('NOCDE').AsInteger := AncienNum;
    QryLig.Open;
    QryLig.First;
    while not QryLig.Eof do
    begin
      iNolig:= iNolig+1;
      //Insertion LIGNES
      QryExec.Close;
      QryExec.SQL.Text := 'INSERT INTO `ligcde` '+
      '(`NOCDE`,'+
      '`CODART`,'+
      '`REF_FOU`,'+
      '`CODFOU`,'+
      '`DATE_`,'+
      '`LIBELLE`,'+
      '`UV`,'+
      '`QTE_UV`,'+
      '`PX_UC`,'+
      '`UC`,'+
      '`QTE_UC`,'+
      '`ETAT`,'+
      '`QTE_UV_RC`,'+
      '`QTE_UC_RC`,'+
      '`COEF_PR`,'+
      '`COEF_PV`,'+
      '`PX_REV`,'+
      '`PX_VTE`) '+
      'VALUES '+
      '(:NOCDE,'+
      ':CODART,'+
      ':REF_FOU,'+
      ':CODFOU,'+
      ':DATE_,'+
      ':LIBELLE,'+
      ':UV,'+
      ':QTE_UV,'+
      ':PX_UC,'+
      ':UC,'+
      ':QTE_UC,'+
      ':ETAT,'+
      ':QTE_UV_RC,'+
      ':QTE_UC_RC,'+
      ':COEF_PR,'+
      ':COEF_PV,'+
      ':PX_REV,'+
      ':PX_VTE)';

      // Assignation directe des valeurs depuis la table mémoire des lignes
      QryExec.ParamByName('NOCDE').AsInteger   := NouveauNum;
      QryExec.ParamByName('REF_FOU').AsString  := QryLig.FieldByName('REF_FOU').AsString;
      QryExec.ParamByName('DATE_').AsDateTime  := Now;
      QryExec.ParamByName('CODFOU').AsString   := QryLig.FieldByName('CODFOU').AsString;
      QryExec.ParamByName('CODART').AsString   := QryLig.FieldByName('CODART').AsString;
      QryExec.ParamByName('LIBELLE').AsString  := QryLig.FieldByName('LIBELLE').AsString;
      QryExec.ParamByName('UV').AsString       := QryLig.FieldByName('UV').AsString;
      QryExec.ParamByName('UC').AsString       := QryLig.FieldByName('UC').AsString;
      QryExec.ParamByName('QTE_UV').AsFloat    := QryLig.FieldByName('QTE_UV').AsFloat;
      QryExec.ParamByName('QTE_UC').AsFloat    := QryLig.FieldByName('QTE_UC').AsFloat;
      QryExec.ParamByName('ETAT').AsString     := QryLig.FieldByName('ETAT').AsString;
      QryExec.ParamByName('QTE_UV_RC').AsFloat := QryLig.FieldByName('QTE_UV_RC').AsFloat;
      QryExec.ParamByName('QTE_UC_RC').AsFloat := QryLig.FieldByName('QTE_UC_RC').AsFloat;
      QryExec.ParamByName('COEF_PR').AsFloat   := QryLig.FieldByName('COEF_PR').AsFloat;
      QryExec.ParamByName('COEF_PV').AsFloat   := QryLig.FieldByName('COEF_PV').AsFloat;
      QryExec.ParamByName('PX_REV').AsFloat    := QryLig.FieldByName('PX_REV').AsFloat;
      QryExec.ParamByName('PX_VTE').AsFloat    := QryLig.FieldByName('PX_VTE').AsFloat;
      QryExec.ParamByName('PX_UC').AsFloat     := QryLig.FieldByName('PX_UC').AsFloat;

      QryExec.ExecSQL;
      //Lecture ligne suivante
      QryLig.Next;
    end;

    // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
    FDQueryEntcde.Refresh;

    // Se positionner sur la nouvelle piece créée dans la grille
    if not FDQueryEntcde.IsEmpty then
      FDQueryEntcde.Locate('NOCDE', NouveauNum, []);

    ShowMessage('Commande dupliquée avec succès sous le numéro : ' + IntToStr(NouveauNum));
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
  // ItemIndex 0 = S (Non validées), 1 = C (Centralisés/Validees), 2 = R (Receptionnees)
  case RadioGroupEtat.ItemIndex of
    0:
    begin
      FiltreNature := '(etat = ''S'')';
      BtnSupprimer.Enabled:=True;
      BtnCentraliser.Enabled:=True;
      BtnCentraliser.Caption:='Valider';
    end;
    1:
    begin
      FiltreNature := '(etat = ''C'')';
      BtnSupprimer.Enabled:=True;
      BtnCentraliser.Enabled:=True;
      BtnCentraliser.Caption:='Centraliser';
    end;
    2:
    begin
      FiltreNature := '(etat = ''R'')';
      BtnSupprimer.Enabled:=False;
      BtnCentraliser.Enabled:=False;
      BtnCentraliser.Caption:='...';
    end;
  else
    FiltreNature := '(1=1)'; // Par sécurité si rien n'est sélectionné
    BtnSupprimer.Enabled:=False;
    BtnCentraliser.Enabled:=False;
    BtnCentraliser.Caption:='...';
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
