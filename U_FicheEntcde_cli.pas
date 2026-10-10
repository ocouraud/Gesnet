unit U_FicheEntcde_cli;

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
  TFormFicheEntcde_cli = class(TForm)
    FDQueryClientsOuverts: TFDQuery;
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
    DSClient: TDataSource;
    DSMemTableEntcde_cli: TDataSource;
    FDMemTableEntcde_cli: TFDMemTable;
    FDMemTableLigcde_cli: TFDMemTable;
    DSMemTableLigcde_cli: TDataSource;
    FDQueryEntcde_cli: TFDQuery;
    FDQueryLigcde_cli: TFDQuery;
    DBMemoObserv: TDBMemo;
    DBNOM: TDBEdit;
    Label6: TLabel;
    DBLookupComboBoxClient: TDBLookupComboBox;
    DBCODCLI: TDBEdit;
    Label21: TLabel;
    DBREFERENCE_: TDBEdit;
    Label17: TLabel;
    JvDBDate_: TJvDBDateEdit;
    Label10: TLabel;
    DBNOCDE: TDBEdit;
    Label1: TLabel;
    JvDBGridLigcde_cli: TJvDBGrid;
    Panel3: TPanel;
    Label14: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    DBTOTHT: TDBEdit;
    DBMT_TVA: TDBEdit;
    DBMT_TTC: TDBEdit;
    Panel5: TPanel;
    BtnAjouterLigne: TButton;
    BtnSupprimerLigne: TButton;
    BtnModifierLigne: TButton;
    Panel1: TPanel;
    Panel12: TPanel;
    BtnValider: TBitBtn;
    BtnAide: TBitBtn;
    BtnAnnuler: TBitBtn;
    procedure DBCODCLIExit(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure JvDBGridLigcde_cliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnAjouterLigneClick(Sender: TObject);
    procedure BtnModifierLigneClick(Sender: TObject);
    procedure BtnSupprimerLigneClick(Sender: TObject);
  private
    { Déclarations privées }
    FIsLoading: Boolean;
    FNocdeCree: Integer;
    procedure ValiderChampPrix(Sender: TField);
    procedure CalculCompletPiece;
    procedure CMDialogKey(var Msg: TCMDialogKey);   //Juste pour louverture
  public
    { Déclarations publiques }
    ModeSaisie: TModeSaisie;
    ModeSaisieLigne: TModeSaisie;
    constructor Create(AOwner: TComponent; AMode: TModeSaisie; ANocde: Integer); reintroduce;
    property NocdeCree: Integer read FNocdeCree;
  end;

var
  FormFicheEntcde_cli: TFormFicheEntcde_cli;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_TableEntcde_cli, U_DataModule, U_FormAide, U_FicheLigcde_cli;


constructor TFormFicheEntcde_cli.Create(AOwner: TComponent; AMode: TModeSaisie; ANocde: Integer);
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
    FDQueryEntcde_cli.Close;
    FDQueryEntcde_cli.SQL.Text := 'select * from entcde_cli where nocde = :NOCDE';
    FDQueryEntcde_cli.ParamByName('NOCDE').AsInteger := ANocde;
    FDQueryEntcde_cli.Open;

    FDMemTableEntcde_cli.Close;
    FDMemTableEntcde_cli.FieldDefs.Assign(FDQueryEntcde_cli.FieldDefs);
    FDMemTableEntcde_cli.CreateDataSet;
    FDMemTableEntcde_cli.Open;

    if ModeSaisie = msAjout then
    begin
      FDMemTableEntcde_cli.Append;
      FDMemTableEntcde_cli.FieldByName('NOCDE').AsInteger := ANocde;
      FDMemTableEntcde_cli.FieldByName('DATE_').AsDateTime := Date;
      //FDMemTableEntcde_cli.FieldByName('HEURE').AsLargeInt := Round(Frac(Now) * 86400 * 100);
      FDMemTableEntcde_cli.FieldByName('CODCLI').AsInteger := DM_Olivier.gCodcli_defaut;
      FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger := 1;

      // Lecture Client
      QryExec.Close;
      QryExec.SQL.Text := 'SELECT * FROM client where CODCLI=:CODCLI';
      QryExec.ParamByName('CODCLI').AsInteger := DM_Olivier.gCodcli_defaut;
      QryExec.Open;
      FDMemTableEntcde_cli.FieldByName('NOMCLI').AsString := QryExec.FieldByName('NOM').AsString;

      FDMemTableEntcde_cli.Post;
      FDMemTableEntcde_cli.Edit;
    end
    else
    begin
      FDMemTableEntcde_cli.CopyDataSet(FDQueryEntcde_cli, [coAppend]);
      FDMemTableEntcde_cli.First;
    end;

    // 2. Gestion des Lignes de détails
    FDQueryLigcde_cli.Close;
    FDQueryLigcde_cli.Sql.Text := 'select * from ligcde_cli where nocde=:nocde';
    FDQueryLigcde_cli.ParamByName('NOCDE').AsInteger := ANocde;
    FDQueryLigcde_cli.Open();
    FDQueryLigcde_cli.FetchAll;

    FDMemTableLigcde_cli.Close;
    FDMemTableLigcde_cli.FieldDefs.Assign(FDQueryLigcde_cli.FieldDefs);
    FDMemTableLigcde_cli.CreateDataSet;
    FDMemTableLigcde_cli.Open;

    // Attaches événement dynamiquement aux champs :
    if FDMemTableLigcde_cli.FindField('PRIXHT') <> nil then
      FDMemTableLigcde_cli.FieldByName('PRIXHT').OnValidate := ValiderChampPrix;

    if FDMemTableLigcde_cli.FindField('PRIXTTC') <> nil then
      FDMemTableLigcde_cli.FieldByName('PRIXTTC').OnValidate := ValiderChampPrix;

    if ModeSaisie = msModification then
    begin
      FDMemTableLigcde_cli.CopyDataSet(FDQueryLigcde_cli, [coAppend]);
      FDMemTableLigcde_cli.First;
    end
    else
    begin
      if not FDMemTableLigcde_cli.Active then
        FDMemTableLigcde_cli.Open;
      FDMemTableLigcde_cli.EmptyDataSet;
    end;

    FDQueryClientsOuverts.Open;

    FDMemTableEntcde_cli.Edit;

    if ModeSaisie = msAjout then
      DBCODCLIExit(self)
    else
    begin
      var i: Integer;
      if FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger = 2 then
      begin
//        for i := 0 to ControlCount - 1 do
//        begin
//          // On désactive tout SAUF le bouton Annuler qui contient les boutons d'action
//          //if (Controls[i] <> Panel1) and (Controls[i] <> Panel12) then
//            Controls[i].Enabled := False;
//        end;

        BtnAnnuler.Caption := 'Quitter';
        BtnValider.Enabled := False;
        BtnAjouterLigne.Enabled := False;
        BtnSupprimerLigne.Enabled := False;
        BtnModifierLigne.Enabled := False;
      end;
    end;

    if DM_Olivier.fgTxTaxe(FDMemTableEntcde_cli.FieldByName('DATE_').AsDateTime, 'TVAI') = 0 then
    begin
//      RzDBCheckBoxTVA_ILES.Visible := False;
//      FDMemTableEntcde_cli.FieldByName('TVA_ILES').AsBoolean := False;
    end
    else
    begin
//      RzDBCheckBoxTVA_ILES.Visible := True;
    end;

  finally
    QryExec.Free;
    if ModeSaisie = msModification then
      FIsLoading := False;
  end;
end;

procedure TFormFicheEntcde_cli.DBCODCLIExit(Sender: TObject);
var
  QryExec: TFDQuery;
  Values: array of string;
  MotDePasse: string;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntcde_cli.State in [dsEdit, dsInsert]) then
    Exit;
  if not FDMemTableEntcde_cli.Active then
    Exit;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  try
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM client WHERE CODCLI=:CODCLI and FERME=0';
    QryExec.ParamByName('CODCLI').AsInteger := FDMemTableEntcde_cli.FieldByName('CODCLI').AsInteger;
    QryExec.Open;
    IF QryExec.Eof then
    begin
      ShowMessage('Client inconnu !');
      FDMemTableEntcde_cli.FieldByName('CODCLI').AsInteger:=FDMemTableEntcde_cli.FieldByName('CODCLI').OldValue;
      DBCODCLI.SetFocus;     //Focus sur le champ sur lequel on est positionné
      Exit;
    end;
    if QryExec.FieldByName('BLOQUE').AsInteger=1 then
      begin
      ShowMessage('Client bloqué - Commande/Facturation/Devis impossible');
      DBCODCLI.SetFocus;     //Focus sur le champ sur lequel on est positionné
      Exit;
    end;
  finally
    //QryExec.Free;
  end;

  FDMemTableEntcde_cli.FieldByName('NOMCLI').AsString := FDQueryClientsOuverts.FieldByName('NOM').AsString;

  CalculCompletPiece;
  QryExec.Free;
end;


procedure TFormFicheEntcde_cli.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // Si l'utilisateur essaie d'annuler/fermer la fiche
  if ModalResult = mrCancel then
  begin
    if FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger<>2 then
    begin
      if MessageDlg('⚠ Etes-vous sûr de vouloir annuler les modifications ?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      begin
        CanClose := False; // On bloque la fermeture, l'utilisateur reste dans le formulaire
      end;
    end;
  end;
end;

procedure TFormFicheEntcde_cli.JvDBGridLigcde_cliKeyDown(Sender: TObject;
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
        BtnAjouterLigne.Click;
      end;

    VK_DELETE:
      begin
        Key := 0;
        BtnSupprimerLigne.Click;
      end;
  end;
end;

//CALCUL COMPLET DE LA PIECE
procedure TFormFicheEntcde_cli.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entcde_cli_fiche.html');
end;

procedure TFormFicheEntcde_cli.BtnAjouterLigneClick(Sender: TObject);
var
  Continuer: Boolean;
begin

  if FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger = 2 then
      Exit;

  repeat
    // Création et affichage de la fiche de saisie
    FormLigcde_cli := TFormLigcde_cli.Create(Self);
    try
      FormLigcde_cli.DSLigcde_cli.DataSet := FDMemTableLigcde_cli;

      // Configuration de la fiche
      FormLigcde_cli.ModeSaisieLigne := U_FicheLigcde_cli.msAjout;
      FormLigcde_cli.Caption := 'Nouvelle ligne de commande';

      // Passage en mode insertion
      FDMemTableLigcde_cli.Insert;

      // Pré-remplir les champs correctement
      FDMemTableLigcde_cli.FieldByName('NOCDE').AsInteger := FDMemTableEntcde_cli.FieldByName('NOCDE').AsInteger;
      FDMemTableLigcde_cli.FieldByName('CODCLI').AsInteger := FDMemTableEntcde_cli.FieldByName('CODCLI').AsInteger;

      // Si l'utilisateur clique sur Valider
      Continuer := (FormLigcde_cli.ShowModal = mrOk);
      if Continuer then
      begin
        // Le .Post a DEJA été fait à l'intérieur de la fiche
        CalculCompletPiece;
      end
      else
      begin
        // Si l'utilisateur a annulé, on annule l'insertion
        FDMemTableLigcde_cli.Cancel;
      end;
    finally
      FormLigcde_cli.Free;
    end;
  until not Continuer; // La boucle tourne tant que l'utilisateur valide (mrOk)

  JvDBGridLigcde_cli.SetFocus;
end;


procedure TFormFicheEntcde_cli.BtnModifierLigneClick(Sender: TObject);
begin
  // Vérifie qu'une ligne est bien sélectionnée
  if FDMemTableLigcde_cli.IsEmpty then Exit;

    // Si le focus est sur la grille et qu'on appuie sur Entrée
  if FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger = 2 then
      Exit;

  FormLigcde_cli := TFormLigcde_cli.Create(Self);
  try
    FormLigcde_cli.DSLigcde_cli.DataSet := FDMemTableLigcde_cli;
    FormLigcde_cli.ModeSaisieLigne := U_FicheLigcde_cli.msModification;
    FormLigcde_cli.Caption := 'Modifier la ligne de la pièce';

    if FormLigcde_cli.ShowModal = mrOk then
    begin
      // 1. On s'assure que le post est bien effectif et fermé
      if FDMemTableLigcde_cli.State in [dsEdit, dsInsert] then
        FDMemTableLigcde_cli.Post;

      CalculCompletPiece;
      // 2. On repositionne et rafraîchit proprement le dataset
      DM_Olivier.RefreshDataSetWithBookmark(FDMemTableLigcde_cli)
    end
    else
    begin
      // Si annulé, on s'assure juste proprement de remettre le dataset en état stable
      // S'il était en édit/insert, on l'annule, mais on protège avec un try/except pour éviter tout plantage visuel
      try
        if FDMemTableLigcde_cli.State in [dsEdit, dsInsert] then
          FDMemTableLigcde_cli.Cancel;
      except
        // On ignore silencieusement si le dataset était déjà fermé/sorti du mode édit
      end;
    end;
  finally
    FormLigcde_cli.Free;
    JvDBGridLigcde_cli.SetFocus;
  end;

end;

procedure TFormFicheEntcde_cli.BtnSupprimerLigneClick(Sender: TObject);
var
  i: Integer;
  BookmarkList: TBookmarkList;
  NbLignesSupprimees: Integer;
begin
  // Garde-fou existant
  if FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger = 2 then
    Exit;

  // 1. Vérification si la table est vide
  if FDMemTableLigcde_cli.IsEmpty then
  begin
    ShowMessage('Aucune ligne à supprimer.');
    JvDBGridLigcde_cli.SetFocus;
    Exit;
  end;

  // 2. Vérifier si des lignes sont sélectionnées dans la JvDBGrid
  BookmarkList := JvDBGridLigcde_cli.SelectedRows;
  if BookmarkList.Count = 0 then
  begin
    ShowMessage('Veuillez sélectionner au moins une ligne à supprimer.');
    JvDBGridLigcde_cli.SetFocus;
    Exit;
  end;

  // 3. Demande de confirmation globale
  if MessageDlg('Voulez-vous vraiment supprimer les ' + IntToStr(BookmarkList.Count) + ' ligne(s) sélectionnée(s) ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    NbLignesSupprimees := 0;
    try
      // Désactiver le rafraîchissement visuel pendant la suppression en masse
      FDMemTableLigcde_cli.DisableControls;
      try
        // Parcours à l'envers (de la fin vers le début) pour préserver la validité des signets
        for i := BookmarkList.Count - 1 downto 0 do
        begin
          if FDMemTableLigcde_cli.BookmarkValid(TBookmark(BookmarkList[i])) then
          begin
            FDMemTableLigcde_cli.GotoBookmark(TBookmark(BookmarkList[i]));
            FDMemTableLigcde_cli.Delete;
            Inc(NbLignesSupprimees);
          end;
        end;
      finally
        // Réactiver l'affichage de la grille
        FDMemTableLigcde_cli.EnableControls;
      end;

      // 4. Recalcul unique de la pièce après la suppression des lignes
      if NbLignesSupprimees > 0 then
        CalculCompletPiece;

    except
      on E: Exception do
      begin
        // S'assurer de réactiver les contrôles en cas d'erreur
        if FDMemTableLigcde_cli.ControlsDisabled then
          FDMemTableLigcde_cli.EnableControls;

        MessageDlg('Erreur lors de la suppression des lignes : ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;

  JvDBGridLigcde_cli.SetFocus;

end;

procedure TFormFicheEntcde_cli.BtnValiderClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  NumCDE: Integer;
  VNoCde: Integer;
  WAnnuleSaisie: Boolean;
  iNolig: Integer;

begin

  //Calcul de securite
  CalculCompletPiece;

  // 1. S'assurer que les saisies en cours dans les grilles/champs sont validées (Post)
  if FDMemTableEntcde_cli.State in [dsEdit, dsInsert] then
    FDMemTableEntcde_cli.Post;
  if FDMemTableLigcde_cli.State in [dsEdit, dsInsert] then
    FDMemTableLigcde_cli.Post;

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
        //Recuperation dernier num commande
        QryExec.close;
        QryExec.SQL.Text := 'SELECT NOCDE FROM `entcde_cli` ORDER BY NOCDE DESC LIMIT 1';
        QryExec.Open;
        QryExec.first;
        NumCDE:=1;
        if QryExec.Eof=false then
          NumCDE := QryExec.FieldByName('NOCDE').AsInteger + 1;

        FNocdeCree := NumCDE;

        // INSERT pour l'en-tête
        QryExec.close;
        QryExec.SQL.Text := 'INSERT INTO `entcde_cli` ('+
        '`NOCDE`, `REFERENCE_`, `CODCLI`, `NOMCLI`, `DATE_`, `TOTHT`, `MT_TVA`, '+
        '`MT_TTC`, `STATUT`, `OBSERV`) '+
        'VALUES '+
        '(:NOCDE, :REFERENCE_, :CODCLI, :NOMCLI, :DATE_, :TOTHT, :MT_TVA, :MT_TTC, :STATUT, :OBSERV)';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('OBSERV').AsString     := FDMemTableEntcde_cli.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('NOCDE').AsInteger     := NumCDE;
        QryExec.ParamByName('CODCLI').AsInteger    := FDMemTableEntcde_cli.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('NOMCLI').AsString     := FDMemTableEntcde_cli.FieldByName('NOMCLI').AsString;
        QryExec.ParamByName('STATUT').AsInteger     := 1;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableEntcde_cli.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableEntcde_cli.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableEntcde_cli.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('REFERENCE_').AsString := FDMemTableEntcde_cli.FieldByName('REFERENCE_').AsString;
        QryExec.ExecSQL;

      end
      else
      begin
        // UPDATE pour l'en-tête en modification
        NumCDE := FDMemTableEntcde_cli.FieldByName('NOCDE').AsInteger;

        QryExec.SQL.Text := 'UPDATE `entcde_cli` SET '+
        '`NOCDE` = :NOCDE ,'+
        '`REFERENCE_` = :REFERENCE_ ,'+
        '`CODCLI` = :CODCLI ,'+
        '`NOMCLI` = :NOMCLI ,'+
        '`DATE_` = :DATE_ ,'+
        '`TOTHT` = :TOTHT ,'+
        '`MT_TVA` = :MT_TVA ,'+
        '`MT_TTC` = :MT_TTC ,'+
        '`STATUT` = :STATUT ,'+
        '`OBSERV` = :OBSERV '+
        'WHERE `NOCDE` = :NOCDE';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('OBSERV').AsString     := FDMemTableEntcde_cli.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('NOCDE').AsInteger     := NumCDE;
        QryExec.ParamByName('CODCLI').AsInteger    := FDMemTableEntcde_cli.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('NOMCLI').AsString     := FDMemTableEntcde_cli.FieldByName('NOMCLI').AsString;
        QryExec.ParamByName('STATUT').AsInteger     := 1;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableEntcde_cli.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableEntcde_cli.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableEntcde_cli.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('REFERENCE_').AsString := FDMemTableEntcde_cli.FieldByName('REFERENCE_').AsString;
        QryExec.ExecSQL;
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
        QryExec.SQL.Text := 'DELETE FROM ligcde_cli WHERE NOCDE = :NOCDE';
        QryExec.ParamByName('NOCDE').AsInteger := NumCDE;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des lignes
      iNolig := 0;
      FDMemTableLigcde_cli.First;
      while not FDMemTableLigcde_cli.Eof do
      begin
        iNolig:= iNolig+1;
        //Insertion lig_prof
        QryExec.Close;
        QryExec.SQL.Text := 'INSERT INTO `ligcde_cli` ('+
        '`NOCDE`,'+
        '`CODCLI`,'+
        '`CODART`,'+
        '`LIBELLE`,'+
        '`DATE_`,'+
        '`QTE`,'+
        '`PRIXHT`,'+
        '`PRIXTTC`,'+
        '`TOTHT`,'+
        '`TVA`,'+
        '`TX_TVA`,'+
        '`MT_TVA`,'+
        '`MT_TTC`,'+
        '`NOLIG`,'+
        '`OBSERV`) '+
        'VALUES ('+
        ':NOCDE, '+
        ':CODCLI, '+
        ':CODART, '+
        ':LIBELLE, '+
        ':DATE_, '+
        ':QTE, '+
        ':PRIXHT, '+
        ':PRIXTTC, '+
        ':TOTHT, '+
        ':TVA, '+
        ':TX_TVA, '+
        ':MT_TVA, '+
        ':MT_TTC, '+
        ':NOLIG, '+
        ':OBSERV)';

        // Assignation directe des valeurs depuis la table mémoire des lignes
        QryExec.ParamByName('NOCDE').AsInteger     := NumCDE;
        QryExec.ParamByName('LIBELLE').AsString    := FDMemTableLigcde_cli.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('CODCLI').AsInteger    := FDMemTableLigcde_cli.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODART').AsString     := FDMemTableLigcde_cli.FieldByName('CODART').AsString;
        QryExec.ParamByName('QTE').AsFloat         := FDMemTableLigcde_cli.FieldByName('QTE').AsFloat;
        QryExec.ParamByName('PRIXHT').AsFloat      := FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat;
        QryExec.ParamByName('PRIXTTC').AsInteger   := FDMemTableLigcde_cli.FieldByName('PRIXTTC').AsInteger;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger    := FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('TX_TVA').AsFloat      := FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('TVA').AsString        := FDMemTableLigcde_cli.FieldByName('TVA').AsString;
        QryExec.ParamByName('OBSERV').AsString     := FDMemTableLigcde_cli.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableEntcde_cli.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('NOLIG').AsInteger     := iNolig;

        QryExec.ExecSQL;

        //Lecture ligne memoire suivante
        FDMemTableLigcde_cli.Next;
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

procedure TFormFicheEntcde_cli.CalculCompletPiece;
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
  wDate: TDateTime;
  AQte: Double;

  SavedBookmark: TBookmark;
begin
  // Sorties anticipées si conditions non remplies
  if FIsLoading then Exit;
  if not (FDMemTableEntcde_cli.State in [dsEdit, dsInsert]) then Exit;
  if not FDMemTableLigcde_cli.Active then Exit;

  QryExec := nil;
  QryArticle := nil;
  SavedBookmark := nil;

  wDate := FDMemTableEntcde_cli.FieldByName('Date_').AsDateTime;

  try
    // Création requêtes temporaires
    QryExec := TFDQuery.Create(nil);
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;

    QryArticle := TFDQuery.Create(nil);
    QryArticle.Connection := DMGesCloud.ConnexionGesCloud;

    FDMemTableLigcde_cli.DisableControls;
    try
      if not FDMemTableLigcde_cli.IsEmpty then
        SavedBookmark := FDMemTableLigcde_cli.GetBookmark;

      // Si exonéré de TVA
      FDMemTableLigcde_cli.First;
      while not FDMemTableLigcde_cli.Eof do
      begin
      FDMemTableLigcde_cli.Edit;

      // Lecture article
      QryArticle.Close;
      QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
      QryArticle.ParamByName('CODART').AsString := FDMemTableLigcde_cli.FieldByName('CODART').AsString;
      QryArticle.Open;
      FDMemTableLigcde_cli.FieldByName('TVA').AsString := QryArticle.FieldByName('TVA').AsString;
      pTVA := QryArticle.FieldByName('TVA').AsString;

      FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat := DM_Olivier.fgTxTaxe(wDate,pTVA);

      // Sécurité anti-division par zéro sur la quantité
      AQte := FDMemTableLigcde_cli.FieldByName('QTE').AsFloat;
      if AQte = 0 then
        AQte := 1;

      // Calcul TVA sur PRIXHT ou PRIXTTC
//      if RzDBCheckBoxFlag_Tax.Checked = False  then
//      begin
        // Sur TTC
//        FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigcde_cli.FieldByName('PRIXTTC').AsInteger
//          * FDMemTableLigcde_cli.FieldByName('QTE').AsFloat);
//        FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat := (FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger)
//          * (FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat
//          / (100 + FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat));
//        FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat := FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger
//          - FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat;
//        if FDMemTableLigcde_cli.FieldByName('QTE').AsFloat<>0 then
//          FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat
//          / AQte,-2);
//      end
//      else
//      begin
        // Sur HT
        FDMemTableLigcde_cli.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat, FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat));
        FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat := FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat * FDMemTableLigcde_cli.FieldByName('QTE').AsFloat;
        FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat := (FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat / 100) * FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat;
        FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat + FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat);
//      end;

      // Arrondis
      FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat, -2);
      FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat, -2);
      FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat, -2);

      FDMemTableLigcde_cli.Post;
      FDMemTableLigcde_cli.Next;
    end;


      // Traitement TVA ILES
//      if RzDBCheckBoxTVA_ILES.Checked and not RzDBCheckBoxEXO_TVA.Checked then
//      begin
//        FDMemTableLigcde_cli.First;
//        while not FDMemTableLigcde_cli.Eof do
//        begin
//          FDMemTableLigcde_cli.Edit;
//
//          QryArticle.Close;
//          QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
//          QryArticle.ParamByName('CODART').AsString := FDMemTableLigcde_cli.FieldByName('CODART').AsString;
//          QryArticle.Open;
//
//          if (QryArticle.FieldByName('TVA').AsString = 'TVA0') or
//             (QryArticle.FieldByName('EXCLU_TVA1').AsBoolean) or
//             (DM_Olivier.fgTxTaxe(FDMemTableEntcde_cli.FieldByName('DATE_').AsDateTime, 'TVAI') = 0) then
//          begin
//            FDMemTableLigcde_cli.Cancel;
//            FDMemTableLigcde_cli.Next;
//            Continue;
//          end;
//
//          FDMemTableLigcde_cli.FieldByName('NO_TVA').AsInteger := 4;
//          FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat := DM_Olivier.fgTxTaxe(FDMemTableEntcde_cli.FieldByName('DATE_').AsDateTime, 'TVAI');
//
//          if (RzDBCheckBoxFlag_Tax.Checked = False) then
//          begin
//            FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigcde_cli.FieldByName('PRIXTTC').AsInteger
//              * FDMemTableLigcde_cli.FieldByName('QTE').AsFloat);
//            FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat := (FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger)
//              * (FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat
//              / (100 + FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat));
//            FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat := FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger
//              - FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat;
//            FDMemTableLigcde_cli.FieldByName('PRIXNET').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat
//              / AQte,-2);
//          end
//          else
//          begin
//            FDMemTableLigcde_cli.FieldByName('PRIXNET').AsFloat := FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat - ((FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat / 100) * FDMemTableLigcde_cli.FieldByName('PRC_REMISE').AsFloat);
//            FDMemTableLigcde_cli.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLigcde_cli.FieldByName('PRIXNET').AsFloat, FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat));
//            FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat := FDMemTableLigcde_cli.FieldByName('PRIXNET').AsFloat * FDMemTableLigcde_cli.FieldByName('QTE').AsFloat;
//            FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat := (FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat / 100) * FDMemTableLigcde_cli.FieldByName('TX_TVA').AsFloat;
//            FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger := Round(FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat + FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat);
//          end;
//
//          FDMemTableLigcde_cli.FieldByName('MT_REMISE').AsFloat := (FDMemTableLigcde_cli.FieldByName('PRIXHT').AsFloat * FDMemTableLigcde_cli.FieldByName('QTE').AsFloat) - FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat;
//          FDMemTableLigcde_cli.FieldByName('MARGE').AsFloat := FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat - (FDMemTableLigcde_cli.FieldByName('PRIXREV').AsFloat * FDMemTableLigcde_cli.FieldByName('QTE').AsFloat);
//
//          //Arrondis
//          FDMemTableLigcde_cli.FieldByName('PRIXNET').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('PRIXNET').AsFloat, -2);
//          FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat, -2);
//          FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('MT_TVA').AsFloat, -2);
//          FDMemTableLigcde_cli.FieldByName('MT_REMISE').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('MT_REMISE').AsFloat, -2);
//          FDMemTableLigcde_cli.FieldByName('MARGE').AsFloat := RoundTo(FDMemTableLigcde_cli.FieldByName('MARGE').AsFloat, -2);
//
//          FDMemTableLigcde_cli.Post;
//          FDMemTableLigcde_cli.Next;
//        end;
//      end;

      // CAL_EVP
      FDMemTableEntcde_cli.FieldByName('MT_TTC').AsInteger := 0;
      FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat := 0;
      FDMemTableEntcde_cli.FieldByName('MT_TVA').AsInteger := 0;

      wHT0 := 0; wHT0r := 0;
      wHT1 := 0; wHT1r := 0;
      wHT2 := 0; wHT2r := 0;
      wHT3 := 0; wHT3r := 0;
      wHT4 := 0; wHT4r := 0;
      wTVA1 := 0; wTVA2 := 0; wTVA3 := 0; wTVA4 := 0;

      FDMemTableLigcde_cli.First;
      while not FDMemTableLigcde_cli.Eof do
      begin
        FDMemTableLigcde_cli.Edit;

        QryArticle.Close;
        QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryArticle.ParamByName('CODART').AsString := FDMemTableLigcde_cli.FieldByName('CODART').AsString;
        QryArticle.Open;

//        DM_Olivier.FDQueryCtrstock.Open;
//        if DM_Olivier.FDQueryCtrstock.FieldByName('NATURE').AsString = 'G' then
//        begin
//          QryExec.Close;
//          QryExec.SQL.Text := 'SELECT * FROM prixgeo WHERE CODGEO=:CODGEO AND CODPRIX=:CODPRIX';
//          QryExec.ParamByName('CODGEO').AsString := FDMemTableEntcde_cli.FieldByName('CODGEO').AsString;
//          QryExec.ParamByName('CODPRIX').AsString := QryArticle.FieldByName('CODPRIX').AsString;
//          QryExec.Open;
//          if not QryExec.Eof then
//          begin
//            FDMemTableLigcde_cli.FieldByName('DET_PPT').AsFloat := QryArticle.FieldByName('DET_PPT').AsFloat;
//            FDMemTableLigcde_cli.FieldByName('DET_ILE').AsFloat := QryArticle.FieldByName('DET_PPT').AsFloat * QryExec.FieldByName('COEF').AsFloat;
//          end;
//        end;

        FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat := FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat + FDMemTableLigcde_cli.FieldByName('TOTHT').AsFloat;
        FDMemTableEntcde_cli.FieldByName('MT_TTC').AsInteger := FDMemTableEntcde_cli.FieldByName('MT_TTC').AsInteger + FDMemTableLigcde_cli.FieldByName('MT_TTC').AsInteger;
        FDMemTableEntcde_cli.FieldByName('MT_TVA').AsFloat := FDMemTableEntcde_cli.FieldByName('MT_TTC').AsInteger - FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat;

        FDMemTableLigcde_cli.Post;
        FDMemTableLigcde_cli.Next;
      end;



      // Arrondis
      FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat := RoundTo(FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat, -2);
      FDMemTableEntcde_cli.FieldByName('MT_TVA').AsFloat := RoundTo(FDMemTableEntcde_cli.FieldByName('MT_TVA').AsFloat, -2);
      FDMemTableEntcde_cli.FieldByName('MT_TTC').AsInteger := Round(FDMemTableEntcde_cli.FieldByName('MT_TVA').AsFloat
        + FDMemTableEntcde_cli.FieldByName('TOTHT').AsFloat);

    finally
      try
        if Assigned(SavedBookmark) then
        begin
          if FDMemTableLigcde_cli.BookmarkValid(SavedBookmark) then
            FDMemTableLigcde_cli.GotoBookmark(SavedBookmark);
          FDMemTableLigcde_cli.FreeBookmark(SavedBookmark);
        end;
      except
      end;
      FDMemTableLigcde_cli.EnableControls;
    end;

  finally
    QryExec.Free;
    QryArticle.Free;
  end;
end;


procedure TFormFicheEntcde_cli.ValiderChampPrix(Sender: TField);
begin
  if Sender.IsNull then Exit;

  if Sender.AsFloat < 0 then
  begin
    DatabaseError('⚠ Prix négatif interdit.');
  end;
end;

procedure TFormFicheEntcde_cli.CMDialogKey(var Msg: TCMDialogKey);
begin
  //Ctrl+Entree -> Pour valider la fiche
 if (Msg.CharCode = VK_RETURN) and ((GetKeyState(VK_CONTROL) + $8000) <> 0) then
  begin
    if FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger = 2 then
      Exit;

    BtnValider.Click;
    Msg.Result := 1;
    Exit;
  end;
  // Si le focus est sur la grille et qu'on appuie sur Entrée
  if (ActiveControl = JvDBGridLigcde_cli) and (Msg.CharCode = VK_RETURN) then
  begin
    if FDMemTableEntcde_cli.FieldByName('STATUT').AsInteger = 2 then
      Exit;

    BtnModifierLigne.Click;
    Msg.Result := 1; // Indique que le message a été traité
    Exit;
  end;

  inherited; // Laisse le comportement par défaut pour le reste
end;


end.
