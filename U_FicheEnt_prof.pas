unit U_FicheEnt_prof;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.Buttons, RzButton, RzRadChk, RzDBChk, RzPanel,
  RzRadGrp, RzDBRGrp, FireDAC.Stan.Async, FireDAC.DApt, Math, System.DateUtils,
  JvExMask, JvToolEdit, JvDBControls;

type
  TModeSaisie = (msAjout, msModification);
  TFormEnt_prof = class(TForm)
    FDMemTableEnt_prof: TFDMemTable;
    DSMemTableEnt_prof: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Panel3: TPanel;
    RzDBCheckBoxEXO_TVA: TRzDBCheckBox;
    RzDBCheckBoxTVA_ILES: TRzDBCheckBox;
    FDMemTableLig_prof: TFDMemTable;
    DSMemTableLig_prof: TDataSource;
    JvDBGridLig_prof: TJvDBGrid;
    Panel12: TPanel;
    DBPRC_REMISE: TDBEdit;
    DBCODCLI: TDBEdit;
    BtnValider: TBitBtn;
    BtnAide: TBitBtn;
    BtnAnnuler: TBitBtn;
    LabelHeureLisible: TLabel;
    DBLookupComboBoxClient: TDBLookupComboBox;
    DSClient: TDataSource;
    FDQueryClientsOuverts: TFDQuery;
    RzDBCheckBoxFlag_Tax: TRzDBCheckBox;
    FDQueryClientsOuvertsOBSERV: TMemoField;
    FDQueryClientsOuvertsCODCLI: TIntegerField;
    FDQueryClientsOuvertsCPTAUX: TStringField;
    FDQueryClientsOuvertsNOM: TStringField;
    FDQueryClientsOuvertsCODREP: TSmallintField;
    FDQueryClientsOuvertsPRC_REMISE: TBCDField;
    FDQueryClientsOuvertsNOTEL: TStringField;
    FDQueryClientsOuvertsNOTAHITI: TStringField;
    FDQueryClientsOuvertsNOFAX: TStringField;
    FDQueryClientsOuvertsJRSCRD: TSmallintField;
    FDQueryClientsOuvertsCREDIT: TLargeintField;
    FDQueryClientsOuvertsplaf_crd: TIntegerField;
    FDQueryClientsOuvertsCODPAI: TStringField;
    FDQueryClientsOuvertsFIN_MOIS: TSmallintField;
    FDQueryClientsOuvertsNB_EX: TSmallintField;
    FDQueryClientsOuvertsCAAN: TLargeintField;
    FDQueryClientsOuvertsAD1: TStringField;
    FDQueryClientsOuvertsAD2: TStringField;
    FDQueryClientsOuvertsAD3: TStringField;
    FDQueryClientsOuvertsCUM_MVT: TSmallintField;
    FDQueryClientsOuvertsMT_CPTA: TLargeintField;
    FDQueryClientsOuvertsEXO_TVA: TSmallintField;
    FDQueryClientsOuvertsBLOQUE: TSmallintField;
    FDQueryClientsOuvertsCODGEO: TStringField;
    FDQueryClientsOuvertsEMAIL: TStringField;
    FDQueryClientsOuvertsCODTAR: TStringField;
    FDQueryClientsOuvertsADM: TSmallintField;
    FDQueryClientsOuvertsFLAG_TAX: TSmallintField;
    FDQueryClientsOuvertsCODFAC_ADM: TStringField;
    FDQueryClientsOuvertsFERME: TSmallintField;
    FDQueryClientsOuvertsDER_MODIF: TSQLTimeStampField;
    FDQueryClientsOuvertsSPEC_GOUV: TSmallintField;
    FDQueryClientsOuvertsNOGSM: TLargeintField;
    FDQueryClientsOuvertsPLV: TSmallintField;
    FDQueryClientsOuvertsINTIT_BQ: TStringField;
    FDQueryClientsOuvertsCODE_BQ: TStringField;
    FDQueryClientsOuvertsCODE_GUI: TStringField;
    FDQueryClientsOuvertsNOCPT: TStringField;
    FDQueryClientsOuvertsCLE: TStringField;
    FDQueryClientsOuvertsCOEF_MAJ_PR: TBCDField;
    FDQueryClientsOuvertsEXO_CPS: TSmallintField;
    FDQueryClientsOuvertsPAS_REM: TSmallintField;
    FDQueryClientsOuvertsREM_FAM: TSmallintField;
    FDQueryClientsOuvertsRELEVE_EMAIL: TBooleanField;
    FDQueryClientsOuvertsSELECT_: TBooleanField;
    FDQueryClientsOuvertsAPP_TARIFCLI: TBooleanField;
    FDQueryClientsOuvertsTVA_ILES: TBooleanField;
    JvDBDate_: TJvDBDateEdit;
    DBLookupComboBoxRepres: TDBLookupComboBox;
    DSRepres: TDataSource;
    DBMemoObserv: TDBMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAjouterLigne: TButton;
    BtnSupprimerLigne: TButton;
    Panel5: TPanel;
    BtnModifierLigne: TButton;
    Label6: TLabel;
    procedure BtnValiderClick(Sender: TObject);
    procedure DBCODCLIExit(Sender: TObject);
    procedure DBCODREPChange(Sender: TObject);
    procedure DBCODREPExit(Sender: TObject);
    procedure RzDBCheckBoxEXO_TVAClick(Sender: TObject);
    procedure RzDBCheckBoxTVA_ILESClick(Sender: TObject);
    procedure RzDBCheckBoxFlag_TaxClick(Sender: TObject);
    procedure DBPRC_REMISEChange(Sender: TObject);
    procedure DBPRC_REMISEExit(Sender: TObject);
    procedure DBLookupComboBoxClientClick(Sender: TObject);
    procedure JvDBDate_Exit(Sender: TObject);
    procedure JvDBGridLig_profEnter(Sender: TObject);
    procedure BtnAjouterLigneClick(Sender: TObject);
    procedure BtnSupprimerLigneClick(Sender: TObject);
    procedure BtnModifierLigneClick(Sender: TObject);
    procedure JvDBGridLig_profKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBDate_Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Déclarations privées }
    FCodDevCree: Integer;
    FIsLoading: Boolean;   //Juste pour louverture
    procedure CalculCompletPiece;
    function SiRemisesSaisie(): Boolean;
    procedure CMDialogKey(var Msg: TCMDialogKey); message CM_DIALOGKEY;

  public
    { Déclarations publiques }
    ModeSaisie: TModeSaisie;
    ModeSaisieLigne: TModeSaisie;
    constructor Create(AOwner: TComponent; AMode: TModeSaisie; ACoddev: Integer); reintroduce;
    property CodDevCree: Integer read FCodDevCree;

  end;

var
  FormEnt_prof: TFormEnt_prof;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_TableDevis, U_DataModule, U_FicheLig_prof;


procedure TFormEnt_prof.CMDialogKey(var Msg: TCMDialogKey);
begin
  //Ctrl+Entree -> Pour valider la fiche
 if (Msg.CharCode = VK_RETURN) and ((GetKeyState(VK_CONTROL) + $8000) <> 0) then
  begin
    BtnValider.Click;
    Msg.Result := 1;
    Exit;
  end;
  // Si le focus est sur la grille et qu'on appuie sur Entrée
  if (ActiveControl = JvDBGridLig_prof) and (Msg.CharCode = VK_RETURN) then
  begin
    BtnModifierLigne.Click;
    Msg.Result := 1; // Indique que le message a été traité
    Exit;
  end;

  inherited; // Laisse le comportement par défaut pour le reste
end;

function TFormEnt_prof.SiRemisesSaisie(): Boolean;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEnt_prof.State in [dsEdit, dsInsert]) then
      begin
      Result := False;
      Exit;
  end;

  if not FDMemTableLig_prof.Active then
     begin
      Result := False;
      Exit;
  end;

  //Remise globale
  if (FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat<>0) then
     begin
      Result := True;
      Exit;
  end;

  //Remise ligne
  FDMemTableLig_prof.First;
  while not FDMemTableLig_prof.Eof do
  begin
		if FDMemTableLig_prof.FieldByName('MT_REMISE').AsInteger <> 0 then
    begin
      Result := True;
      Exit;
    end;
    FDMemTableLig_prof.Next;
  end;

  Result := False;
end;


procedure TFormEnt_prof.BtnAjouterLigneClick(Sender: TObject);
var
  Continuer: Boolean;
begin
  repeat
    // Création et affichage de la fiche de saisie
    FormLig_prof := TFormLig_prof.Create(Self);
    try
      FormLig_prof.DSlig_prof.DataSet := FDMemTableLig_prof;

      // Configuration de la fiche
      FormLig_prof.ModeSaisieLigne := U_FicheLig_prof.msAjout;
      FormLig_prof.Caption := 'Nouvelle ligne de devis';

      // Passage en mode insertion
      FDMemTableLig_prof.Insert;

      // Pré-remplir les champs correctement
      //FDMemTableLig_prof.FieldByName('CODFAC').AsInteger := FDMemTableEnt_prof.FieldByName('CODFAC').AsInteger;
      FDMemTableLig_prof.FieldByName('CODDEV').AsInteger := FDMemTableEnt_prof.FieldByName('CODDEV').AsInteger;
      FDMemTableLig_prof.FieldByName('CODDEP').AsInteger := FDMemTableEnt_prof.FieldByName('CODDEP').AsInteger;
      FDMemTableLig_prof.FieldByName('CODCLI').AsInteger := FDMemTableEnt_prof.FieldByName('CODCLI').AsInteger;
      FDMemTableLig_prof.FieldByName('CODCAI').AsString := FDMemTableEnt_prof.FieldByName('CODCAI').AsString;
      FDMemTableLig_prof.FieldByName('TYPE_').AsString := FDMemTableEnt_prof.FieldByName('TYPE_').AsString;

      // Si l'utilisateur clique sur Valider
      Continuer := (FormLig_prof.ShowModal = mrOk);
      if Continuer then
      begin
        // Le .Post a DEJA été fait à l'intérieur de la fiche
        CalculCompletPiece;
      end
      else
      begin
        // Si l'utilisateur a annulé, on annule l'insertion
        FDMemTableLig_prof.Cancel;
      end;
    finally
      FormLig_prof.Free;
    end;
  until not Continuer; // La boucle tourne tant que l'utilisateur valide (mrOk)

  JvDBGridLig_prof.SetFocus;
end;


procedure TFormEnt_prof.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // Si l'utilisateur essaie d'annuler/fermer la fiche
  if ModalResult = mrCancel then
  begin
    if MessageDlg('⚠ Etes-vous sûr de vouloir annuler les modifications apportées au devis ?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      CanClose := False; // On bloque la fermeture, l'utilisateur reste dans le formulaire
    end;
  end;
end;


procedure TFormEnt_prof.BtnModifierLigneClick(Sender: TObject);
begin
  // Vérifie qu'une ligne est bien sélectionnée
  if FDMemTableLig_prof.IsEmpty then Exit;

  FormLig_prof := TFormLig_prof.Create(Self);
  try
    FormLig_prof.DSlig_prof.DataSet := FDMemTableLig_prof;
    FormLig_prof.ModeSaisieLigne := U_FicheLig_prof.msModification;
    FormLig_prof.Caption := 'Modifier la ligne du devis';

    if FormLig_prof.ShowModal = mrOk then
    begin
      // 1. On s'assure que le post est bien effectif et fermé
      if FDMemTableLig_prof.State in [dsEdit, dsInsert] then
        FDMemTableLig_prof.Post;

      CalculCompletPiece;
      // 2. On repositionne et rafraîchit proprement le dataset
      DM_Olivier.RefreshDataSetWithBookmark(FDMemTableLig_prof)
    end
    else
    begin
      // Si annulé, on s'assure juste proprement de remettre le dataset en état stable
      // S'il était en édit/insert, on l'annule, mais on protège avec un try/except pour éviter tout plantage visuel
      try
        if FDMemTableLig_prof.State in [dsEdit, dsInsert] then
          FDMemTableLig_prof.Cancel;
      except
        // On ignore silencieusement si le dataset était déjà fermé/sorti du mode édit
      end;
    end;
  finally
    FormLig_prof.Free;
    JvDBGridLig_prof.SetFocus;
  end;
end;


procedure TFormEnt_prof.BtnSupprimerLigneClick(Sender: TObject);
begin
  if FDMemTableLig_prof.IsEmpty then
  begin
    ShowMessage('Aucune ligne sélectionnée à supprimer.');
    JvDBGridLig_prof.SetFocus;
    Exit;
  end;

  // Demande de confirmation et suppression
  if MessageDlg('Voulez-vous vraiment supprimer cette ligne ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      FDMemTableLig_prof.Delete;

      // Recalcul de la facture
      CalculCompletPiece;

      //ShowMessage('La ligne a été supprimée avec succès.');
    except
      on E: Exception do
        MessageDlg('Erreur lors de la suppression de la ligne: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  JvDBGridLig_prof.SetFocus;
end;


procedure TFormEnt_prof.BtnValiderClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  NumDevis: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;
  wTotregl: Integer;
  WAnnuleSaisie: Boolean;
begin
  //Calcul complet avant validation
  CalculCompletPiece;
  // Conversion en nombre total de secondes depuis minuit
  LHeure := Now; // ou un champ heure
  DecodeTime(Now, H, M, S, MS);
  Centiemes := MS div 10; // Conversion des millisecondes en centièmes
  // Construction de l'entier : HH * 1000000 + MM * 10000 + SS * 100 + CC
  ResultHeure := (H * 360000) + (M * 6000) + (S * 100) + Centiemes;

  // 1. S'assurer que les saisies en cours dans les grilles/champs sont validées (Post)
  if FDMemTableEnt_prof.State in [dsEdit, dsInsert] then
    FDMemTableEnt_prof.Post;
  if FDMemTableLig_prof.State in [dsEdit, dsInsert] then
    FDMemTableLig_prof.Post;

  FDMemTableEnt_prof.Edit;

  //Mise à jour top facture à F (non suspendue)
  FDMemTableEnt_prof.Post;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec2 := TFDQuery.Create(nil);

  try
    Screen.Cursor := crHourGlass; // Change le curseur en sablier

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la TRANSACTION MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      // ==========================================
      // 2. ENREGISTREMENT DE L'EN-TÊTE
      // ==========================================
      if ModeSaisie = msAjout then
      begin
        // Incrementation numero de facture + 1 dans chrono
        QryExec.SQL.Text := 'UPDATE chrono set CHRONO=CHRONO+1 WHERE PREFIX=:PREFIX';
        QryExec.ParamByName('PREFIX').AsString := 'DEV01';
        QryExec.ExecSQL;
        QryExec.Close;
        //Recuperation nouveau numero chrono
        QryExec.SQL.Text := 'SELECT * FROM chrono WHERE PREFIX=:PREFIX';
        QryExec.ParamByName('PREFIX').AsString := 'DEV01';
        QryExec.Open;
        NumDevis := QryExec.FieldByName('CHRONO').AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables
        FCodDevCree := NumDevis;

        // Exemple d'INSERT pour l'en-tête (adaptez les noms de champs selon votre table)
        QryExec.close;
        QryExec.SQL.Text := 'INSERT INTO `ent_prof` (' +
          '`OBSERV`, `CODFAC`, `CODCLI`, `CODCAI`, `CODDEV`, `CODDEP, `NOM`, `NOTAHITI`, ' +
          '`TYPE_`, `EXO_TVA`, `ANNEE`, `MOIS`, `DATE_`, `HEURE`, `PRC_REMISE`, `MT_REMISE`, `TOTHT`, `MT_TTC`, ' +
          '`MT_HT0`, `MT_HT1`, `MT_HT2`, `MT_HT3`, `MT_TVA1`, `MT_TVA2`, `MT_TVA3`, `MT_TVA`, `MARGE`, `REFERENCE_`, ' +
          '`CODREP`, `NO_SEM`, `NO_JOUR`, `REGL`, `CODPAI`, `JRSCRD`, `FIN_MOIS`, `LIBREG`, `CRD_FORCE`, `date_ech`, ' +
          '`CODGEO`, `FLAG_TAX`, `DER_MODIF`, `MT_TSOC`, `MT_HTSOC`, `TX_TSOC`, `EXO_CPS`, ' +
          '`MT_TVAI`, `MT_HTI`, `TVA_ILES`) VALUES (' +
          ':OBSERV, :CODFAC, :CODCLI, :CODCAI, :CODDEV, :CODDEP, :NOM, :NOTAHITI, ' +
          ':TYPE_, :EXO_TVA, :ANNEE, :MOIS, :DATE_, :HEURE, :PRC_REMISE, :MT_REMISE, :TOTHT, :MT_TTC, ' +
          ':MT_HT0, :MT_HT1, :MT_HT2, :MT_HT3, :MT_TVA1, :MT_TVA2, :MT_TVA3, :MT_TVA, :MARGE, :REFERENCE_, ' +
          ':CODREP, :NO_SEM, :NO_JOUR, :REGL, :CODPAI, :JRSCRD, :FIN_MOIS, :LIBREG, :CRD_FORCE, :date_ech, ' +
          ':CODGEO, :FLAG_TAX, CURRENT_TIMESTAMP, :MT_TSOC, :MT_HTSOC, :TX_TSOC, :EXO_CPS, ' +
          ':MT_TVAI, :MT_HTI, :TVA_ILES)';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('OBSERV').AsString     := FDMemTableEnt_prof.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('CODFAC').AsInteger    := NumDevis;
        QryExec.ParamByName('CODCLI').AsInteger    := FDMemTableEnt_prof.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODCAI').AsString     := FDMemTableEnt_prof.FieldByName('CODCAI').AsString;
        QryExec.ParamByName('CODDEV').AsInteger    := FDMemTableEnt_prof.FieldByName('CODDEV').AsInteger;
        QryExec.ParamByName('CODDEP').AsInteger    := FDMemTableEnt_prof.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('NOM').AsString        := FDMemTableEnt_prof.FieldByName('NOM').AsString;
        QryExec.ParamByName('NOTAHITI').AsString   := FDMemTableEnt_prof.FieldByName('NOTAHITI').AsString;
        QryExec.ParamByName('TYPE_').AsString      := FDMemTableEnt_prof.FieldByName('TYPE_').AsString;
        QryExec.ParamByName('EXO_TVA').AsInteger   := FDMemTableEnt_prof.FieldByName('EXO_TVA').AsInteger;
        QryExec.ParamByName('ANNEE').AsInteger     := FDMemTableEnt_prof.FieldByName('ANNEE').AsInteger;
        QryExec.ParamByName('MOIS').AsInteger      := FDMemTableEnt_prof.FieldByName('MOIS').AsInteger;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('HEURE').AsString      := FDMemTableEnt_prof.FieldByName('HEURE').AsString;
        QryExec.ParamByName('PRC_REMISE').AsFloat  := FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat;
        QryExec.ParamByName('MT_REMISE').AsFloat   := FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableEnt_prof.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('MT_HT0').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat;
        QryExec.ParamByName('MT_HT1').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat;
        QryExec.ParamByName('MT_HT2').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat;
        QryExec.ParamByName('MT_HT3').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat;
        QryExec.ParamByName('MT_TVA1').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat;
        QryExec.ParamByName('MT_TVA2').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat;
        QryExec.ParamByName('MT_TVA3').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('MARGE').AsFloat       := FDMemTableEnt_prof.FieldByName('MARGE').AsFloat;
        QryExec.ParamByName('REFERENCE_').AsString := FDMemTableEnt_prof.FieldByName('REFERENCE_').AsString;
        QryExec.ParamByName('CODREP').AsInteger    := FDMemTableEnt_prof.FieldByName('CODREP').AsInteger;
        QryExec.ParamByName('NO_SEM').AsInteger    := FDMemTableEnt_prof.FieldByName('NO_SEM').AsInteger;
        QryExec.ParamByName('NO_JOUR').AsInteger   := FDMemTableEnt_prof.FieldByName('NO_JOUR').AsInteger;
        QryExec.ParamByName('REGL').AsInteger      := FDMemTableEnt_prof.FieldByName('REGL').AsInteger;
        QryExec.ParamByName('CODPAI').AsString     := FDMemTableEnt_prof.FieldByName('CODPAI').AsString;
        QryExec.ParamByName('JRSCRD').AsInteger    := FDMemTableEnt_prof.FieldByName('JRSCRD').AsInteger;
        QryExec.ParamByName('FIN_MOIS').AsInteger  := FDMemTableEnt_prof.FieldByName('FIN_MOIS').AsInteger;
        QryExec.ParamByName('LIBREG').AsString     := FDMemTableEnt_prof.FieldByName('LIBREG').AsString;
        QryExec.ParamByName('CRD_FORCE').AsInteger := FDMemTableEnt_prof.FieldByName('CRD_FORCE').AsInteger;
        QryExec.ParamByName('date_ech').AsDateTime := FDMemTableEnt_prof.FieldByName('date_ech').AsDateTime;
        QryExec.ParamByName('CODGEO').AsString     := FDMemTableEnt_prof.FieldByName('CODGEO').AsString;
        QryExec.ParamByName('FLAG_TAX').AsInteger  := FDMemTableEnt_prof.FieldByName('FLAG_TAX').AsInteger;
        QryExec.ParamByName('MT_TSOC').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TSOC').AsFloat;
        QryExec.ParamByName('MT_HTSOC').AsFloat    := FDMemTableEnt_prof.FieldByName('MT_HTSOC').AsFloat;
        QryExec.ParamByName('TX_TSOC').AsFloat     := FDMemTableEnt_prof.FieldByName('TX_TSOC').AsFloat;
        QryExec.ParamByName('EXO_CPS').AsInteger   := FDMemTableEnt_prof.FieldByName('EXO_CPS').AsInteger;
        QryExec.ParamByName('MT_TVAI').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat;
        QryExec.ParamByName('MT_HTI').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat;
        QryExec.ParamByName('TVA_ILES').AsBoolean  := FDMemTableEnt_prof.FieldByName('TVA_ILES').AsBoolean;
        QryExec.ExecSQL;
      end
      else
      begin
        // UPDATE pour l'en-tête en modification
        QryExec.SQL.Text := 'UPDATE `ent_prof` SET ' +
          '`OBSERV` = :OBSERV, ' +
          '`CODFAC` = :CODFAC, ' +
          '`CODCLI` = :CODCLI, ' +
          '`CODCAI` = :CODCAI, ' +
          '`CODDEV` = :CODDEV, ' +
          '`CODDEP` = :CODDEP, ' +
          '`NOM` = :NOM, ' +
          '`NOTAHITI` = :NOTAHITI, ' +
          '`TYPE_` = :TYPE_, ' +
          '`EXO_TVA` = :EXO_TVA, ' +
          '`ANNEE` = :ANNEE, ' +
          '`MOIS` = :MOIS, ' +
          '`DATE_` = :DATE_, ' +
          '`HEURE` = :HEURE, ' +
          '`PRC_REMISE` = :PRC_REMISE, ' +
          '`MT_REMISE` = :MT_REMISE, ' +
          '`TOTHT` = :TOTHT, ' +
          '`MT_TTC` = :MT_TTC, ' +
          '`MT_HT0` = :MT_HT0, ' +
          '`MT_HT1` = :MT_HT1, ' +
          '`MT_HT2` = :MT_HT2, ' +
          '`MT_HT3` = :MT_HT3, ' +
          '`MT_TVA1` = :MT_TVA1, ' +
          '`MT_TVA2` = :MT_TVA2, ' +
          '`MT_TVA3` = :MT_TVA3, ' +
          '`MT_TVA` = :MT_TVA, ' +
          '`MARGE` = :MARGE, ' +
          '`REFERENCE_` = :REFERENCE_, ' +
          '`CODREP` = :CODREP, ' +
          '`NO_SEM` = :NO_SEM, ' +
          '`NO_JOUR` = :NO_JOUR, ' +
          '`REGL` = :REGL, ' +
          '`CODPAI` = :CODPAI, ' +
          '`JRSCRD` = :JRSCRD, ' +
          '`FIN_MOIS` = :FIN_MOIS, ' +
          '`LIBREG` = :LIBREG, ' +
          '`CRD_FORCE` = :CRD_FORCE, ' +
          '`date_ech` = :date_ech, ' +
          '`CODGEO` = :CODGEO, ' +
          '`FLAG_TAX` = :FLAG_TAX, ' +
          '`DER_MODIF` = CURRENT_TIMESTAMP, ' +
          '`MT_TSOC` = :MT_TSOC, ' +
          '`MT_HTSOC` = :MT_HTSOC, ' +
          '`TX_TSOC` = :TX_TSOC, ' +
          '`EXO_CPS` = :EXO_CPS, ' +
          '`MT_TVAI` = :MT_TVAI, ' +
          '`MT_HTI` = :MT_HTI, ' +
          '`TVA_ILES` = :TVA_ILES ' +
          'WHERE `CODDEV` = :CODDEV';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('OBSERV').AsString     := FDMemTableEnt_prof.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('CODFAC').AsInteger     := FDMemTableEnt_prof.FieldByName('CODFAC').AsInteger;
        QryExec.ParamByName('CODCLI').AsInteger     := FDMemTableEnt_prof.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODCAI').AsString     := FDMemTableEnt_prof.FieldByName('CODCAI').AsString;
        QryExec.ParamByName('CODDEV').AsInteger     := FDMemTableEnt_prof.FieldByName('CODDEV').AsInteger;
        QryExec.ParamByName('CODDEP').AsInteger     := FDMemTableEnt_prof.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('NOM').AsString        := FDMemTableEnt_prof.FieldByName('NOM').AsString;
        QryExec.ParamByName('NOTAHITI').AsString   := FDMemTableEnt_prof.FieldByName('NOTAHITI').AsString;
        QryExec.ParamByName('TYPE_').AsString      := FDMemTableEnt_prof.FieldByName('TYPE_').AsString;
        QryExec.ParamByName('EXO_TVA').AsInteger   := FDMemTableEnt_prof.FieldByName('EXO_TVA').AsInteger;
        QryExec.ParamByName('ANNEE').AsInteger     := FDMemTableEnt_prof.FieldByName('ANNEE').AsInteger;
        QryExec.ParamByName('MOIS').AsInteger      := FDMemTableEnt_prof.FieldByName('MOIS').AsInteger;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('HEURE').AsString      := FDMemTableEnt_prof.FieldByName('HEURE').AsString;
        QryExec.ParamByName('PRC_REMISE').AsFloat  := FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat;
        QryExec.ParamByName('MT_REMISE').AsFloat   := FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableEnt_prof.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('MT_HT0').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat;
        QryExec.ParamByName('MT_HT1').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat;
        QryExec.ParamByName('MT_HT2').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat;
        QryExec.ParamByName('MT_HT3').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat;
        QryExec.ParamByName('MT_TVA1').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat;
        QryExec.ParamByName('MT_TVA2').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat;
        QryExec.ParamByName('MT_TVA3').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('MARGE').AsFloat       := FDMemTableEnt_prof.FieldByName('MARGE').AsFloat;
        QryExec.ParamByName('REFERENCE_').AsString := FDMemTableEnt_prof.FieldByName('REFERENCE_').AsString;
        QryExec.ParamByName('CODREP').AsInteger     := FDMemTableEnt_prof.FieldByName('CODREP').AsInteger;
        QryExec.ParamByName('NO_SEM').AsInteger    := FDMemTableEnt_prof.FieldByName('NO_SEM').AsInteger;
        QryExec.ParamByName('NO_JOUR').AsInteger   := FDMemTableEnt_prof.FieldByName('NO_JOUR').AsInteger;
        QryExec.ParamByName('REGL').AsInteger      := FDMemTableEnt_prof.FieldByName('REGL').AsInteger;
        QryExec.ParamByName('CODPAI').AsString     := FDMemTableEnt_prof.FieldByName('CODPAI').AsString;
        QryExec.ParamByName('JRSCRD').AsInteger    := FDMemTableEnt_prof.FieldByName('JRSCRD').AsInteger;
        QryExec.ParamByName('FIN_MOIS').AsInteger  := FDMemTableEnt_prof.FieldByName('FIN_MOIS').AsInteger;
        QryExec.ParamByName('LIBREG').AsString     := FDMemTableEnt_prof.FieldByName('LIBREG').AsString;
        QryExec.ParamByName('CRD_FORCE').AsInteger := FDMemTableEnt_prof.FieldByName('CRD_FORCE').AsInteger;
        QryExec.ParamByName('date_ech').AsDateTime := FDMemTableEnt_prof.FieldByName('date_ech').AsDateTime;
        QryExec.ParamByName('CODGEO').AsString     := FDMemTableEnt_prof.FieldByName('CODGEO').AsString;
        QryExec.ParamByName('FLAG_TAX').AsInteger  := FDMemTableEnt_prof.FieldByName('FLAG_TAX').AsInteger;
        QryExec.ParamByName('MT_TSOC').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TSOC').AsFloat;
        QryExec.ParamByName('MT_HTSOC').AsFloat    := FDMemTableEnt_prof.FieldByName('MT_HTSOC').AsFloat;
        QryExec.ParamByName('TX_TSOC').AsFloat     := FDMemTableEnt_prof.FieldByName('TX_TSOC').AsFloat;
        QryExec.ParamByName('EXO_CPS').AsInteger   := FDMemTableEnt_prof.FieldByName('EXO_CPS').AsInteger;
        QryExec.ParamByName('MT_TVAI').AsFloat     := FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat;
        QryExec.ParamByName('MT_HTI').AsFloat      := FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat;
        QryExec.ParamByName('TVA_ILES').AsBoolean  := FDMemTableEnt_prof.FieldByName('TVA_ILES').AsBoolean;

        QryExec.ExecSQL;
        // Récupération du numéro de devis (généré ou existant)
        NumDevis := FDMemTableEnt_prof.FieldByName('CODDEV').AsInteger;
      end;

      QryExec.Close;

      // ==========================================
      // 4. ENREGISTREMENT DES LIGNES (ligvtejj)
      // ==========================================
      // Pour faire simple et propre lors d'une modification :
      // on supprime les anciennes lignes de cette facture et on réinsère l'état actuel de la table mémoire.
      if ModeSaisie = msModification then
      begin
        QryExec.Close;
        QryExec.SQL.Text := 'DELETE FROM lig_prof WHERE CODDEV = :CODDEV';
        QryExec.ParamByName('CODDEV').AsInteger := NumDevis;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des lignes
      FDMemTableLig_prof.First;
      while not FDMemTableLig_prof.Eof do
      begin

        //Insertion lig_prof
        QryExec.Close;
        QryExec.SQL.Text := 'INSERT INTO `lig_prof` (' +
          '`LIBELLE`, `CODDEV`, `CODCLI`, `CODCAI`, `CODFAC`, `CODDEP`, `ANNEE`, `MOIS`, `CODREP`, ' +
          '`CODFOU`, `CODSSF`, `CODFAM`, `CODDPT`, `TYPE_`, `CODART`, `CODBAR`, `QTE`, `POIDS`, `CODTAR`, ' +
          '`PRIXHT`, `PRIXTTC`, `PRIXNET`, `TOTHT`, `MT_TTC`, `PRC_REMISE`, `MT_REMISE`, `TX_TVA`, `MT_TVA`, `NO_TVA`, ' +
          '`PRIXREV`, `MARGE`, `NO_SEM`, `NO_JOUR`, `DET_PPT`, `DET_ILE`, `DER_MODIF`, `TX_TSOC`, `MT_TSOC`) VALUES (' +
          ':LIBELLE, :CODDEV, :CODCLI, :CODCAI, :CODFAC, :CODDEP, :ANNEE, :MOIS, :CODREP, ' +
          ':CODFOU, :CODSSF, :CODFAM, :CODDPT, :TYPE_, :CODART, :CODBAR, :QTE, :POIDS, :CODTAR, ' +
          ':PRIXHT, :PRIXTTC, :PRIXNET, :TOTHT, :MT_TTC, :PRC_REMISE, :MT_REMISE, :TX_TVA, :MT_TVA, :NO_TVA, ' +
          ':PRIXREV, :MARGE, :NO_SEM, :NO_JOUR, :DET_PPT, :DET_ILE, CURRENT_TIMESTAMP, :TX_TSOC, :MT_TSOC)';

        // Assignation directe des valeurs depuis la table mémoire des lignes
        QryExec.ParamByName('LIBELLE').AsString    := FDMemTableLig_prof.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('CODDEV').AsInteger    := NumDevis;
        QryExec.ParamByName('CODCLI').AsInteger    := FDMemTableLig_prof.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODCAI').AsString     := FDMemTableLig_prof.FieldByName('CODCAI').AsString;
        QryExec.ParamByName('CODFAC').AsInteger    := 0;
        QryExec.ParamByName('CODDEP').AsInteger    := FDMemTableLig_prof.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('ANNEE').AsInteger     := FDMemTableLig_prof.FieldByName('ANNEE').AsInteger;
        QryExec.ParamByName('MOIS').AsInteger      := FDMemTableLig_prof.FieldByName('MOIS').AsInteger;
        QryExec.ParamByName('CODREP').AsInteger    := FDMemTableLig_prof.FieldByName('CODREP').AsInteger;
        QryExec.ParamByName('CODFOU').AsString    := FDMemTableLig_prof.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('CODSSF').AsString    := FDMemTableLig_prof.FieldByName('CODSSF').AsString;
        QryExec.ParamByName('CODFAM').AsString    := FDMemTableLig_prof.FieldByName('CODFAM').AsString;
        QryExec.ParamByName('CODDPT').AsString    := FDMemTableLig_prof.FieldByName('CODDPT').AsString;
        QryExec.ParamByName('TYPE_').AsString      := FDMemTableLig_prof.FieldByName('TYPE_').AsString;
        QryExec.ParamByName('CODART').AsString     := FDMemTableLig_prof.FieldByName('CODART').AsString;
        QryExec.ParamByName('CODBAR').AsString     := FDMemTableLig_prof.FieldByName('CODBAR').AsString;
        QryExec.ParamByName('QTE').AsFloat         := FDMemTableLig_prof.FieldByName('QTE').AsFloat;
        QryExec.ParamByName('POIDS').AsFloat       := FDMemTableLig_prof.FieldByName('POIDS').AsFloat;
        QryExec.ParamByName('CODTAR').AsString    := FDMemTableLig_prof.FieldByName('CODTAR').AsString;
        QryExec.ParamByName('PRIXHT').AsFloat      := FDMemTableLig_prof.FieldByName('PRIXHT').AsFloat;
        QryExec.ParamByName('PRIXTTC').AsInteger   := FDMemTableLig_prof.FieldByName('PRIXTTC').AsInteger;
        QryExec.ParamByName('PRIXNET').AsFloat     := FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('PRC_REMISE').AsFloat  := FDMemTableLig_prof.FieldByName('PRC_REMISE').AsFloat;
        QryExec.ParamByName('MT_REMISE').AsFloat   := FDMemTableLig_prof.FieldByName('MT_REMISE').AsFloat;
        QryExec.ParamByName('TX_TVA').AsFloat      := FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('NO_TVA').AsInteger    := FDMemTableLig_prof.FieldByName('NO_TVA').AsInteger;
        QryExec.ParamByName('PRIXREV').AsFloat     := FDMemTableLig_prof.FieldByName('PRIXREV').AsFloat;
        QryExec.ParamByName('MARGE').AsFloat       := FDMemTableLig_prof.FieldByName('MARGE').AsFloat;
        QryExec.ParamByName('NO_SEM').AsInteger    := FDMemTableLig_prof.FieldByName('NO_SEM').AsInteger;
        QryExec.ParamByName('NO_JOUR').AsInteger   := FDMemTableLig_prof.FieldByName('NO_JOUR').AsInteger;
        QryExec.ParamByName('DET_PPT').AsFloat   := FDMemTableLig_prof.FieldByName('DET_PPT').AsFloat;
        QryExec.ParamByName('DET_ILE').AsFloat   := FDMemTableLig_prof.FieldByName('DET_ILE').AsFloat;
        QryExec.ParamByName('TX_TSOC').AsFloat     := FDMemTableLig_prof.FieldByName('TX_TSOC').AsFloat;
        QryExec.ParamByName('MT_TSOC').AsFloat     := FDMemTableLig_prof.FieldByName('MT_TSOC').AsFloat;

        QryExec.ExecSQL;

        //Lecture ligne memoire suivante
        FDMemTableLig_prof.Next;
      end;


      // TRANSACTION: Si tout s'est déroulé sans erreur, on valide définitivement dans MySQL
      DMGesCloud.ConnexionGesCloud.Commit;
      ModalResult := mrOk;

    except
      on E: Exception do
      begin
        // TRANSACTION: En cas d'erreur, on annule tout (ni l'en-tête ni les lignes ne sont modifiés)
        DMGesCloud.ConnexionGesCloud.Rollback;
        ShowMessage('Erreur lors de l''enregistrement : ' + E.Message);
        ModalResult := mrNone;
      end;
    end;
  finally
    QryExec.Free;
    QryExec2.Free;

    Screen.Cursor := crDefault; // Restaure le curseur normal
  end;
end;


constructor TFormEnt_prof.Create(AOwner: TComponent; AMode: TModeSaisie; ACodDev: Integer);
var
  QryExec: TFDQuery;
begin
  FIsLoading := True;
  QryExec := nil;

  inherited Create(AOwner);

  try
    ModeSaisie := AMode;

    // Création requête temporaire
    QryExec := TFDQuery.Create(nil);
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;

    // 1. Gestion de l'En-tête
    DM_Olivier.FDQueryEnt_prof.Close;
    if ModeSaisie = msModification then
    begin
      DM_Olivier.FDQueryEnt_prof.SQL.Text := 'select * from ent_prof where coddev = :CODDEV';
      DM_Olivier.FDQueryEnt_prof.ParamByName('CODDEV').AsInteger := ACoddev;
    end;
    DM_Olivier.FDQueryEnt_prof.Open;

    FDMemTableEnt_prof.Close;
    FDMemTableEnt_prof.FieldDefs.Assign(DM_Olivier.FDQueryEnt_prof.FieldDefs);
    FDMemTableEnt_prof.CreateDataSet;

    if ModeSaisie = msAjout then
    begin
      FDMemTableEnt_prof.Append;
      FDMemTableEnt_prof.FieldByName('CODDEV').AsInteger := ACoddev;
      FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime := Date;
      FDMemTableEnt_prof.FieldByName('HEURE').AsLargeInt := Round(Frac(Now) * 86400 * 100);
      FDMemTableEnt_prof.FieldByName('CODCAI').AsString := Format('%d', [DM_Olivier.NumeroPoste]);
      FDMemTableEnt_prof.FieldByName('CODDEP').AsInteger := DM_Olivier.gCoddep_defaut;
      FDMemTableEnt_prof.FieldByName('CODCLI').AsInteger := DM_Olivier.gCodcli_defaut;
      FDMemTableEnt_prof.FieldByName('TYPE_').AsString := 'D';

      // Lecture Ctrstock
      QryExec.Close;
      QryExec.SQL.Text := 'SELECT * FROM ctrstock where CODSOC=''A''';
      QryExec.Open;
      FDMemTableEnt_prof.FieldByName('FLAG_TAX').AsInteger := QryExec.FieldByName('FLAG_TAX').AsInteger;

      // Lecture Client
      QryExec.Close;
      QryExec.SQL.Text := 'SELECT * FROM client where CODCLI=:CODCLI';
      QryExec.ParamByName('CODCLI').AsInteger := DM_Olivier.gCodcli_defaut;
      QryExec.Open;
      FDMemTableEnt_prof.FieldByName('NOM').AsString := QryExec.FieldByName('NOM').AsString;
      FDMemTableEnt_prof.FieldByName('CODREP').AsString := QryExec.FieldByName('CODREP').AsString;
      FDMemTableEnt_prof.FieldByName('FLAG_TAX').AsInteger := QryExec.FieldByName('FLAG_TAX').AsInteger;

      FDMemTableEnt_prof.Post;
      FDMemTableEnt_prof.Edit;
    end
    else
    begin
      FDMemTableEnt_prof.CopyDataSet(DM_Olivier.FDQueryEnt_prof, [coAppend]);
      FDMemTableEnt_prof.First;
    end;

    LabelHeureLisible.Caption := DM_Olivier.CentièmesVersHeureLisible(FDMemTableEnt_prof.FieldByName('HEURE').AsLargeInt);

    // 2. Gestion des Lignes de détails
    DM_Olivier.FDQueryLig_prof.Close;
    DM_Olivier.FDQueryLig_prof.Sql.Text := 'select * from lig_prof where coddev=:coddev';
    DM_Olivier.FDQueryLig_prof.ParamByName('CODDEV').AsInteger := ACoddev;
    DM_Olivier.FDQueryLig_prof.Open();
    DM_Olivier.FDQueryLig_prof.FetchAll;

    FDMemTableLig_prof.Close;
    FDMemTableLig_prof.FieldDefs.Assign(DM_Olivier.FDQueryLig_prof.FieldDefs);
    FDMemTableLig_prof.CreateDataSet;

    if ModeSaisie = msModification then
    begin
      FDMemTableLig_prof.CopyDataSet(DM_Olivier.FDQueryLig_prof, [coAppend]);
      FDMemTableLig_prof.First;
    end
    else
    begin
      if not FDMemTableLig_prof.Active then
        FDMemTableLig_prof.Open;
      FDMemTableLig_prof.EmptyDataSet;
    end;

    FDQueryClientsOuverts.Open;
    DM_Olivier.FDQueryRepres.Open;

    FDMemTableEnt_prof.Edit;

    if ModeSaisie = msAjout then
      DBCODCLIExit(self);

    if DM_Olivier.fgTxTaxe(FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime, 'TVAI') = 0 then
    begin
      RzDBCheckBoxTVA_ILES.Visible := False;
      FDMemTableEnt_prof.FieldByName('TVA_ILES').AsBoolean := False;
    end
    else
    begin
      RzDBCheckBoxTVA_ILES.Visible := True;
    end;

  finally
    QryExec.Free;
    if ModeSaisie = msModification then
      FIsLoading := False;
  end;
end;


procedure TFormEnt_prof.DBCODCLIExit(Sender: TObject);
var
  QryExec: TFDQuery;
  Values: array of string;
  MotDePasse: string;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEnt_prof.State in [dsEdit, dsInsert]) then
    Exit;
  if not FDMemTableLig_prof.Active then
    Exit;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  try
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM client WHERE CODCLI=:CODCLI and FERME=0';
    QryExec.ParamByName('CODCLI').AsInteger := FDMemTableEnt_prof.FieldByName('CODCLI').AsInteger;
    QryExec.Open;
    IF QryExec.Eof then
    begin
      ShowMessage('Client inconnu !');
      FDMemTableEnt_prof.FieldByName('CODCLI').AsInteger:=FDMemTableEnt_prof.FieldByName('CODCLI').OldValue;
      DBCODCLI.SetFocus;     //Focus sur le champ sur lequel on est positionné
      Exit;
    end;
    if QryExec.FieldByName('BLOQUE').AsInteger=1 then
      begin
      ShowMessage('Client bloqué - Facturation/Devis impossible');
      DBCODCLI.SetFocus;     //Focus sur le champ sur lequel on est positionné
      Exit;
    end;
  finally
    //QryExec.Free;
  end;


  //Si client avec remise interdite => Controle si remise autorisee par mot de passe
  DBPRC_REMISE.Enabled:=False;
  if (FDQueryClientsOuverts.FieldByName('PAS_REM').AsInteger=1) and
     (FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat<>0) then
  begin
    if SiRemisesSaisie() = True then
    begin
      SetLength(Values, 1);
      Values[0] := '';
      // Le '#1' au début du libellé active le masquage de type mot de passe
      if InputQuery('Contrôle Crédit client', [#1'Mot de passe :'], Values) then
        begin
          MotDePasse := Values[0];
          // Traitement...
          if MotDePasse<>DM_Olivier.gPass_modif_fac then
          begin
            ShowMessage('Erreur mot de passe, remises interdites.');
            FDMemTableEnt_prof.FieldByName('CODCLI').AsString := FDMemTableEnt_prof.FieldByName('CODCLI').OldValue;
            if Screen.ActiveControl <> nil then
            begin
              Screen.ActiveControl.SetFocus;     //Focus sur le champ sur lequel on est positionné
            end;
            exit
          end
          else
          begin
            //Mot de passe correct on accepte la remise
            DBPRC_REMISE.Enabled:=True;
          end;
      end
      else
      begin
        // L'utilisateur a cliqué sur ANNULER
        FDMemTableEnt_prof.FieldByName('CODCLI').AsString := FDMemTableEnt_prof.FieldByName('CODCLI').OldValue;
        if Screen.ActiveControl <> nil then
        begin
          Screen.ActiveControl.SetFocus;
        end;
        exit;
      end;
    end;
  end
  else
  begin
    //Sinon on accepte
    if FDQueryClientsOuverts.FieldByName('PAS_REM').AsInteger<>1 then
      DBPRC_REMISE.Enabled:=True;
  end;

  FDMemTableEnt_prof.FieldByName('NOM').AsString := FDQueryClientsOuverts.FieldByName('NOM').AsString;
  FDMemTableEnt_prof.FieldByName('NOTAHITI').AsString := FDQueryClientsOuverts.FieldByName('NOTAHITI').AsString;
  FDMemTableEnt_prof.FieldByName('CODREP').AsInteger := FDQueryClientsOuverts.FieldByName('CODREP').AsInteger;
  FDMemTableEnt_prof.FieldByName('EXO_TVA').AsInteger := FDQueryClientsOuverts.FieldByName('EXO_TVA').AsInteger;
  FDMemTableEnt_prof.FieldByName('CODGEO').AsString := FDQueryClientsOuverts.FieldByName('CODGEO').AsString;
  if (DBPRC_REMISE.Enabled  = True) and (FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat=0) then
    FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat := FDQueryClientsOuverts.FieldByName('PRC_REMISE').AsFloat;
	FDMemTableEnt_prof.FieldByName('CODPAI').AsString	:= FDQueryClientsOuverts.FieldByName('CODPAI').AsString;

  //Lecture geo pour TVA iles
  QryExec.SQL.Text := 'SELECT * FROM geo WHERE CODGEO=:CODGEO';
  QryExec.ParamByName('CODGEO').AsString :=   FDMemTableEnt_prof.FieldByName('CODGEO').AsString;
  QryExec.Open;
  FDMemTableEnt_prof.FieldByName('TVA_ILES').AsBytes := QryExec.FieldByName('TVA_ILES').AsBytes;

//  QryExec.Close;
//  QryExec.SQL.Text := 'SELECT * FROM repres WHERE CODREP=:CODREP';
//  QryExec.ParamByName('CODREP').AsInteger :=   FDMemTableEnt_prof.FieldByName('CODREP').AsInteger;
//  QryExec.Open;
//  LabelNomRepres.Caption := QryExec.FieldByName('NOM').AsString;

  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM paiement WHERE CODPAI=:CODPAI';
  QryExec.ParamByName('CODPAI').AsString :=   FDMemTableEnt_prof.FieldByName('CODPAI').AsString;
  QryExec.Open;
  FDMemTableEnt_prof.FieldByName('LIBREG').AsBytes := QryExec.FieldByName('LIBELLE').AsBytes;

  CalculCompletPiece;
  QryExec.Free;
end;


procedure TFormEnt_prof.DBCODREPChange(Sender: TObject);
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEnt_prof.State in [dsEdit, dsInsert]) then
    Exit;
  if not FDMemTableLig_prof.Active then
    Exit;
end;


procedure TFormEnt_prof.DBCODREPExit(Sender: TObject);
begin
 DBCODREPChange(SELF);
end;


procedure TFormEnt_prof.DBLookupComboBoxClientClick(Sender: TObject);
begin
  DBCODCLIExit(self);
end;

procedure TFormEnt_prof.DBPRC_REMISEChange(Sender: TObject);
begin
  CalculCompletPiece;
end;

procedure TFormEnt_prof.DBPRC_REMISEExit(Sender: TObject);
begin
  CalculCompletPiece;
end;


procedure TFormEnt_prof.JvDBDate_Enter(Sender: TObject);
begin
     if (ModeSaisie=msAjout) and (FIsLoading=True) then
        JvDBGridLig_prof.SetFocus;
end;

procedure TFormEnt_prof.JvDBDate_Exit(Sender: TObject);
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEnt_prof.State in [dsEdit, dsInsert]) then
    Exit;
  if not FDMemTableLig_prof.Active then
    Exit;

  if DM_Olivier.fgTxTaxe(JvDBDate_.Date,'TVAI')=0 then
  begin
  	RzDBCheckBoxTVA_ILES.Visible:=False;
    FDMemTableEnt_prof.FieldByName('TVA_ILES').AsBoolean:=False;
  end
  else
  begin
  	RzDBCheckBoxTVA_ILES.Visible:=True;
  end;
  CalculCompletPiece;
end;

procedure TFormEnt_prof.JvDBGridLig_profEnter(Sender: TObject);
begin
  //Pour rendre le focus que tu as vole a la date
  if FIsLoading = True then
  begin
     FIsLoading := False;
     if ModeSaisie=msModification then
        JvDBDate_.SetFocus;
  end;
end;


procedure TFormEnt_prof.JvDBGridLig_profKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
        BtnAjouterLigne.Click;
      end;

    VK_DELETE:
      begin
        Key := 0;
        BtnSupprimerLigne.Click;
      end;
  end;
end;


procedure TFormEnt_prof.RzDBCheckBoxEXO_TVAClick(Sender: TObject);
begin
  CalculCompletPiece;
end;


procedure TFormEnt_prof.RzDBCheckBoxFlag_TaxClick(Sender: TObject);
begin
  CalculCompletPiece;
end;


procedure TFormEnt_prof.RzDBCheckBoxTVA_ILESClick(Sender: TObject);
begin
  CalculCompletPiece;
end;


//CALCUL COMPLET DE LA FACTURE
procedure TFormEnt_prof.CalculCompletPiece;
var
  QryExec: TFDQuery;
  QryArticle: TFDQuery;
  pTVA: String;

  wHT0: Double;
  wHT0r: Double;
  wHT1: Double;
  wHT1r: Double;
  wHT2: Double;
  wHT2r: Double;
  wHT3: Double;
  wHT3r: Double;
  wHT4: Double;
  wHT4r: Double;
  wTVA1: Double;
  wTVA2: Double;
  wTVA3: Double;
  wTVA4: Double;

  MONT: Double;
  WTOT_REGLE: Double;

  SavedBookmark: TBookmark;
begin
  // Sorties anticipées si conditions non remplies
  if FIsLoading then Exit;
  if not (FDMemTableEnt_prof.State in [dsEdit, dsInsert]) then Exit;
  if not FDMemTableLig_prof.Active then Exit;

  QryExec := nil;
  QryArticle := nil;
  SavedBookmark := nil;

  try
    // Création requêtes temporaires
    QryExec := TFDQuery.Create(nil);
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;

    QryArticle := TFDQuery.Create(nil);
    QryArticle.Connection := DMGesCloud.ConnexionGesCloud;

    FDMemTableLig_prof.DisableControls;
    try
      if not FDMemTableLig_prof.IsEmpty then
        SavedBookmark := FDMemTableLig_prof.GetBookmark;

      // Si exonéré de TVA
      if RzDBCheckBoxEXO_TVA.Checked then
      begin
        RzDBCheckBoxFlag_Tax.Checked := True;

        FDMemTableLig_prof.First;
        while not FDMemTableLig_prof.Eof do
        begin
          FDMemTableLig_prof.Edit;
          FDMemTableLig_prof.FieldByName('NO_TVA').AsInteger := 0;
          FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat := 0;
          FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat := 0;
          FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLig_prof.FieldByName('TOTHT').AsFloat);
          FDMemTableLig_prof.FieldByName('PRIXTTC').AsInteger := Round(FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat);
          FDMemTableLig_prof.FieldByName('MARGE').AsFloat := FDMemTableLig_prof.FieldByName('TOTHT').AsFloat - (FDMemTableLig_prof.FieldByName('PRIXREV').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat);
          FDMemTableLig_prof.Post;
          FDMemTableLig_prof.Next;
        end;
      end
      else
      begin
        FDMemTableLig_prof.First;
        while not FDMemTableLig_prof.Eof do
        begin
          FDMemTableLig_prof.Edit;

          // Lecture article
          QryArticle.Close;
          QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
          QryArticle.ParamByName('CODART').AsString := FDMemTableLig_prof.FieldByName('CODART').AsString;
          QryArticle.Open;
          FDMemTableLig_prof.FieldByName('NO_TVA').AsInteger := StrToIntDef(StringReplace(QryArticle.FieldByName('TVA').AsString, 'TVA', '', [rfReplaceAll, rfIgnoreCase]), 0);
          pTVA := QryArticle.FieldByName('TVA').AsString;

          // Lecture Parametre
          QryExec.Close;
          QryExec.SQL.Text := 'SELECT * FROM parame WHERE CODE=:CODE';
          QryExec.ParamByName('CODE').AsString := pTVA;
          QryExec.Open;
          FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat := QryExec.FieldByName('TAUX').AsFloat;

          // Calcul TVA sur PRIXHT ou PRIXTTC
          if RzDBCheckBoxFlag_Tax.Checked = False then
          begin
            // Sur TTC
            FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLig_prof.FieldByName('PRIXTTC').AsInteger
              * FDMemTableLig_prof.FieldByName('QTE').AsFloat);
            FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat := (FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger)
              * (FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat
              / (100 + FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat));
            FDMemTableLig_prof.FieldByName('TOTHT').AsFloat := FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger
              - FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat;
            FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat := FDMemTableLig_prof.FieldByName('TOTHT').AsFloat / FDMemTableLig_prof.FieldByName('QTE').AsFloat;
          end
          else
          begin
            // Sur HT
            FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat := FDMemTableLig_prof.FieldByName('PRIXHT').AsFloat - ((FDMemTableLig_prof.FieldByName('PRIXHT').AsFloat / 100) * FDMemTableLig_prof.FieldByName('PRC_REMISE').AsFloat);
            FDMemTableLig_prof.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat, FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat));
            FDMemTableLig_prof.FieldByName('TOTHT').AsFloat := FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat;
            FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat := (FDMemTableLig_prof.FieldByName('TOTHT').AsFloat / 100) * FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat;
            FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLig_prof.FieldByName('TOTHT').AsFloat + FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat);
          end;

          FDMemTableLig_prof.FieldByName('MT_REMISE').AsFloat := FDMemTableLig_prof.FieldByName('TOTHT').AsFloat - (FDMemTableLig_prof.FieldByName('PRIXHT').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat);
          FDMemTableLig_prof.FieldByName('MARGE').AsFloat := FDMemTableLig_prof.FieldByName('TOTHT').AsFloat - (FDMemTableLig_prof.FieldByName('PRIXREV').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat);

          // Arrondis
          FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('TOTHT').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('TOTHT').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('MT_REMISE').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('MT_REMISE').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('MARGE').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('MARGE').AsFloat, -2);

          FDMemTableLig_prof.Post;
          FDMemTableLig_prof.Next;
        end;
      end;

      // Traitement TVA ILES
      if RzDBCheckBoxTVA_ILES.Checked and not RzDBCheckBoxEXO_TVA.Checked then
      begin
        FDMemTableLig_prof.First;
        while not FDMemTableLig_prof.Eof do
        begin
          FDMemTableLig_prof.Edit;

          QryArticle.Close;
          QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
          QryArticle.ParamByName('CODART').AsString := FDMemTableLig_prof.FieldByName('CODART').AsString;
          QryArticle.Open;

          if (QryArticle.FieldByName('TVA').AsString = 'TVA0') or
             (QryArticle.FieldByName('EXCLU_TVA1').AsBoolean) or
             (DM_Olivier.fgTxTaxe(FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime, 'TVAI') = 0) then
          begin
            FDMemTableLig_prof.Cancel;
            FDMemTableLig_prof.Next;
            Continue;
          end;

          FDMemTableLig_prof.FieldByName('NO_TVA').AsInteger := 4;
          FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat := DM_Olivier.fgTxTaxe(FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime, 'TVAI');

          if RzDBCheckBoxFlag_Tax.Checked = False then
          begin
            FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLig_prof.FieldByName('PRIXTTC').AsInteger
              * FDMemTableLig_prof.FieldByName('QTE').AsFloat);
            FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat := (FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger)
              * (FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat
              / (100 + FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat));
            FDMemTableLig_prof.FieldByName('TOTHT').AsFloat := FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger
              - FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat;
            FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat := FDMemTableLig_prof.FieldByName('TOTHT').AsFloat / FDMemTableLig_prof.FieldByName('QTE').AsFloat;
          end
          else
          begin
            FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat := FDMemTableLig_prof.FieldByName('PRIXHT').AsFloat - ((FDMemTableLig_prof.FieldByName('PRIXHT').AsFloat / 100) * FDMemTableLig_prof.FieldByName('PRC_REMISE').AsFloat);
            FDMemTableLig_prof.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat, FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat));
            FDMemTableLig_prof.FieldByName('TOTHT').AsFloat := FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat;
            FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat := (FDMemTableLig_prof.FieldByName('TOTHT').AsFloat / 100) * FDMemTableLig_prof.FieldByName('TX_TVA').AsFloat;
            FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLig_prof.FieldByName('TOTHT').AsFloat + FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat);
          end;

          FDMemTableLig_prof.FieldByName('MT_REMISE').AsFloat := (FDMemTableLig_prof.FieldByName('PRIXHT').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat) - FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
          FDMemTableLig_prof.FieldByName('MARGE').AsFloat := FDMemTableLig_prof.FieldByName('TOTHT').AsFloat - (FDMemTableLig_prof.FieldByName('PRIXREV').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat);

          //Arrondis
          FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('PRIXNET').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('TOTHT').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('TOTHT').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('MT_REMISE').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('MT_REMISE').AsFloat, -2);
          FDMemTableLig_prof.FieldByName('MARGE').AsFloat := RoundTo(FDMemTableLig_prof.FieldByName('MARGE').AsFloat, -2);

          FDMemTableLig_prof.Post;
          FDMemTableLig_prof.Next;
        end;
      end;

      // CAL_EVP
      FDMemTableEnt_prof.FieldByName('ANNEE').AsInteger := YearOf(FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime);
      FDMemTableEnt_prof.FieldByName('MOIS').AsInteger := MonthOf(FDMemTableEnt_prof.FieldByName('DATE_').AsDateTime);
      FDMemTableEnt_prof.FieldByName('MT_TTC').AsInteger := 0;
      FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_TVA').AsInteger := 0;
      FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MARGE').AsFloat := 0;
      FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat := 0;

      FDMemTableEnt_prof.FieldByName('CODGEO').AsString := FDQueryClientsOuverts.FieldByName('CODGEO').AsString;

      wHT0 := 0; wHT0r := 0;
      wHT1 := 0; wHT1r := 0;
      wHT2 := 0; wHT2r := 0;
      wHT3 := 0; wHT3r := 0;
      wHT4 := 0; wHT4r := 0;
      wTVA1 := 0; wTVA2 := 0; wTVA3 := 0; wTVA4 := 0;

      FDMemTableLig_prof.First;
      while not FDMemTableLig_prof.Eof do
      begin
        FDMemTableLig_prof.Edit;

        QryArticle.Close;
        QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryArticle.ParamByName('CODART').AsString := FDMemTableLig_prof.FieldByName('CODART').AsString;
        QryArticle.Open;

        DM_Olivier.FDQueryCtrstock.Open;
        if DM_Olivier.FDQueryCtrstock.FieldByName('NATURE').AsString = 'G' then
        begin
          QryExec.Close;
          QryExec.SQL.Text := 'SELECT * FROM prixgeo WHERE CODGEO=:CODGEO AND CODPRIX=:CODPRIX';
          QryExec.ParamByName('CODGEO').AsString := FDMemTableEnt_prof.FieldByName('CODGEO').AsString;
          QryExec.ParamByName('CODPRIX').AsString := QryArticle.FieldByName('CODPRIX').AsString;
          QryExec.Open;
          if not QryExec.Eof then
          begin
            FDMemTableLig_prof.FieldByName('DET_PPT').AsFloat := QryArticle.FieldByName('DET_PPT').AsFloat;
            FDMemTableLig_prof.FieldByName('DET_ILE').AsFloat := QryArticle.FieldByName('DET_PPT').AsFloat * QryExec.FieldByName('COEF').AsFloat;
          end;
        end;

        FDMemTableEnt_prof.FieldByName('MARGE').AsFloat := FDMemTableEnt_prof.FieldByName('MARGE').AsFloat + (FDMemTableLig_prof.FieldByName('PRIXREV').AsFloat * FDMemTableLig_prof.FieldByName('QTE').AsFloat);
        FDMemTableEnt_prof.FieldByName('MT_TTC').AsInteger := FDMemTableEnt_prof.FieldByName('MT_TTC').AsInteger + FDMemTableLig_prof.FieldByName('MT_TTC').AsInteger;

        if RzDBCheckBoxEXO_TVA.Checked then
        begin
          if QryArticle.FieldByName('PREST').AsInteger = 0 then
            wHT0r := wHT0r + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
          wHT0 := wHT0 + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
        end
        else
        begin
          case FDMemTableLig_prof.FieldByName('NO_TVA').AsInteger of
            0: begin
                 if QryArticle.FieldByName('PREST').AsInteger = 0 then
                   wHT0r := wHT0r + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wHT0 := wHT0 + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
               end;
            1: begin
                 if QryArticle.FieldByName('PREST').AsInteger = 0 then
                   wHT1r := wHT1r + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wHT1 := wHT1 + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wTVA1 := wTVA1 + FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat;
               end;
            2: begin
                 if QryArticle.FieldByName('PREST').AsInteger = 0 then
                   wHT2r := wHT2r + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wHT2 := wHT2 + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wTVA2 := wTVA2 + FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat;
               end;
            3: begin
                 if QryArticle.FieldByName('PREST').AsInteger = 0 then
                   wHT3r := wHT3r + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wHT3 := wHT3 + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wTVA3 := wTVA3 + FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat;
               end;
            4: begin
                 if QryArticle.FieldByName('PREST').AsInteger = 0 then
                   wHT4r := wHT4r + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wHT4 := wHT4 + FDMemTableLig_prof.FieldByName('TOTHT').AsFloat;
                 wTVA4 := wTVA4 + FDMemTableLig_prof.FieldByName('MT_TVA').AsFloat;
               end;
          end;
        end;

        FDMemTableLig_prof.Post;
        FDMemTableLig_prof.Next;
      end;

      FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat := wHT0;
      FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat := wHT1;
      FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat := wHT2;
      FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat := wHT3;
      FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat := wHT4;
      FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat := wTVA1;
      FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat := wTVA2;
      FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat := wTVA3;
      FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat := wTVA4;

      if FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat <> 0 then
      begin
        MONT := Round(((wHT0r * FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat) / 100));
        FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat := MONT;
        FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat := FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat - MONT;

        MONT := Round(((wHT1r * FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat) / 100));
        FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat;
        FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat := FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat - MONT;
        FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat := ((FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat / 100) * DM_Olivier.gTx_TVA1);

        MONT := Round(((wHT2r * FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat) / 100));
        FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat;
        FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat := FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat - MONT;
        FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat := ((FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat / 100) * DM_Olivier.gTx_TVA2);

        MONT := Round(((wHT3r * FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat) / 100));
        FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat;
        FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat := FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat - MONT;
        FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat := ((FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat / 100) * DM_Olivier.gTx_TVA3);

        MONT := Round(((wHT4r * FDMemTableEnt_prof.FieldByName('PRC_REMISE').AsFloat) / 100));
        FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat := MONT + FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat;
        FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat := FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat - MONT;
        FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat := ((FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat / 100) * DM_Olivier.gTx_TVAI);
      end;

      FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat := FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat
        + FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat
        + FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat
        + FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat
        + FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat;

      FDMemTableEnt_prof.FieldByName('MT_TVA').AsFloat := FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat
        + FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat
        + FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat
        + FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat;

      // Arrondis
      FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_HT0').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_HT1').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_HT2').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_HT3').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_HTI').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_TVA').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_TVA').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_TVA1').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_TVA2').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_TVA3').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_TVAI').AsFloat, -2);
      FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat := RoundTo(FDMemTableEnt_prof.FieldByName('MT_REMISE').AsFloat, -2);

      FDMemTableEnt_prof.FieldByName('MARGE').AsFloat := FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat - FDMemTableEnt_prof.FieldByName('MARGE').AsFloat;

      FDMemTableEnt_prof.FieldByName('MT_TTC').AsInteger := Round(FDMemTableEnt_prof.FieldByName('MT_TVA').AsFloat
        + FDMemTableEnt_prof.FieldByName('TOTHT').AsFloat);

    finally
      try
        if Assigned(SavedBookmark) then
        begin
          if FDMemTableLig_prof.BookmarkValid(SavedBookmark) then
            FDMemTableLig_prof.GotoBookmark(SavedBookmark);
          FDMemTableLig_prof.FreeBookmark(SavedBookmark);
        end;
      except
      end;
      FDMemTableLig_prof.EnableControls;
    end;

  finally
    QryExec.Free;
    QryArticle.Free;
  end;
end;

end.
