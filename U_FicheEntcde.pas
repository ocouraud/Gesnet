unit U_FicheEntcde;

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
  JvExMask, JvToolEdit, JvDBControls, JvExControls, JvDBLookup, JvBaseEdits;

type
  TModeSaisie = (msAjout, msModification);
  TFormFicheEntcde = class(TForm)
    FDQueryFournis: TFDQuery;
    DSFournis: TDataSource;
    DSMemTableEntcde: TDataSource;
    FDMemTableEntcde: TFDMemTable;
    FDMemTableLigcde: TFDMemTable;
    DSMemTableLigcde: TDataSource;
    FDQueryEntcde: TFDQuery;
    FDQueryLigcde: TFDQuery;
    DBLookupComboBoxFournis: TDBLookupComboBox;
    DBCODFOU: TDBEdit;
    Label21: TLabel;
    DBDOSSIER: TDBEdit;
    Label17: TLabel;
    JvDBDate_: TJvDBDateEdit;
    Label10: TLabel;
    DBNOCDE: TDBEdit;
    Label1: TLabel;
    Panel5: TPanel;
    BtnAjouterLigne: TButton;
    BtnSupprimerLigne: TButton;
    BtnModifierLigne: TButton;
    Panel1: TPanel;
    Panel12: TPanel;
    BtnValider: TBitBtn;
    BtnAide: TBitBtn;
    BtnAnnuler: TBitBtn;
    Label2: TLabel;
    DSLigcde: TDataSource;
    FDQueryArticle: TFDQuery;
    JvDBLookupComboDevise: TJvDBLookupCombo;
    Label4: TLabel;
    DBLookupComboBoxDepot: TDBLookupComboBox;
    JvDBGridLignes: TJvDBGrid;
    DSDepot: TDataSource;
    DSParameDevise: TDataSource;
    JvDBCalcEdit1: TJvDBCalcEdit;
    Label5: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBLookupComboBoxASSUR: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBoxTRANSP: TDBLookupComboBox;
    DBLookupComboBoxCOM_DOU: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBMemoObserv: TDBMemo;
    procedure DBCODFOUExit(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure JvDBGridLignesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnAjouterLigneClick(Sender: TObject);
    procedure BtnModifierLigneClick(Sender: TObject);
    procedure BtnSupprimerLigneClick(Sender: TObject);
    procedure DBTot_deviseExit(Sender: TObject);
    procedure DBTOT_TVAExit(Sender: TObject);
    procedure DBTOT_FRETExit(Sender: TObject);
    procedure FDMemTableLigcdeCalcFields(DataSet: TDataSet);
    procedure DBLookupComboBoxDepotClick(Sender: TObject);
    procedure JvDBLookupComboDeviseChange(Sender: TObject);
  private
    { Déclarations privées }
    FIsLoading: Boolean;
    FNumeroCree: Integer;
    procedure ValiderChampPrix(Sender: TField);
    procedure CalculCompletPiece;
    procedure CMDialogKey(var Msg: TCMDialogKey);   //Juste pour louverture
  public
    { Déclarations publiques }
    ModeSaisie: TModeSaisie;
    ModeSaisieLigne: TModeSaisie;
    constructor Create(AOwner: TComponent; AMode: TModeSaisie; ANumero: Integer); reintroduce;
    property NumeroCree: Integer read FNumeroCree;
  end;

var
  FormFicheEntcde: TFormFicheEntcde;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_TableEntcde, U_DataModule, U_FormAide, U_FicheLigcde;


constructor TFormFicheEntcde.Create(AOwner: TComponent; AMode: TModeSaisie; ANumero: Integer);
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
    FDQueryEntcde.Close;
    FDQueryEntcde.SQL.Text := 'select * from entcde where nocde = :nocde';
    FDQueryEntcde.ParamByName('NOCDE').AsInteger := ANumero;
    FDQueryEntcde.Open;

    FDMemTableEntcde.Close;
    FDMemTableEntcde.FieldDefs.Assign(FDQueryEntcde.FieldDefs);
    FDMemTableEntcde.CreateDataSet;
    FDMemTableEntcde.Open;

    if ModeSaisie = msAjout then
    begin
      FDMemTableEntcde.Append;
      FDMemTableEntcde.FieldByName('NOCDE').AsInteger := ANumero;
      FDMemTableEntcde.FieldByName('DATE_').AsDateTime := Date;
      FDMemTableEntcde.FieldByName('CODDEP').AsInteger := DM_Olivier.gCoddep_defaut;
      FDMemTableEntcde.FieldByName('ETAT').AsString := 'S';

      FDMemTableEntcde.Post;
      FDMemTableEntcde.Edit;
    end
    else
    begin
      FDMemTableEntcde.CopyDataSet(FDQueryEntcde, [coAppend]);
      FDMemTableEntcde.First;
    end;

    // 2. Gestion des Lignes de détails
    FDQueryLigcde.Close;
    FDQueryLigcde.Sql.Text := 'SELECT * FROM ligcde '+
    'WHERE ligcde.NOCDE = :NOCDE';

    // On charge la requête source
    FDQueryLigcde.ParamByName('NOCDE').AsInteger := ANumero;
    FDQueryLigcde.Open();
    FDQueryLigcde.FetchAll;

    FDMemTableLigcde.Close;

    if ModeSaisie = msModification then
    begin
      // Mode Modification : On récupère structure et données d'un coup
      FDMemTableLigcde.Data := FDQueryLigcde.Data;
      FDMemTableLigcde.First;
    end
    else
    begin
      // Mode Création : On initialise une structure vide basée sur la requête
      FDMemTableLigcde.FieldDefs.Assign(FDQueryLigcde.FieldDefs);
      FDMemTableLigcde.CreateDataSet;
      FDMemTableLigcde.Open;
      FDMemTableLigcde.EmptyDataSet;
    end;

    // 2. Attachement dynamique des événements (OBLIGATOIREMENT APRÈS le chargement/création)
//    if FDMemTableLigcde.FindField('PRIXHT') <> nil then
//      FDMemTableLigcde.FieldByName('PRIXHT').OnValidate := ValiderChampPrix;
//
//    if FDMemTableLigcde.FindField('PRIXTTC') <> nil then
//      FDMemTableLigcde.FieldByName('PRIXTTC').OnValidate := ValiderChampPrix;

    FDQueryFournis.Close;
    FDQueryFournis.Open;
    DM_Olivier.FDQueryParameDevise.Close;
    DM_Olivier.FDQueryParameDevise.Open;
    DM_Olivier.FDQueryDepot.Close;
    DM_Olivier.FDQueryDepot.Open;

    FDMemTableEntcde.Edit;

    if ModeSaisie = msAjout then
    begin
      JvDBGridLignes.Enabled:=False;
      BtnAjouterLigne.Enabled:=False;
      BtnSupprimerLigne.Enabled:=False;
      BtnModifierLigne.Enabled:=False;
      DBLookupComboBoxDepot.Enabled:=False;
    end
    else
    begin
      var i: Integer;
      if FDMemTableEntcde.FieldByName('ETAT').AsString = 'R' then
      begin
        JvDBGridLignes.Enabled:=False;
        BtnAnnuler.Caption := 'Quitter';
        BtnValider.Enabled := False;
        BtnAjouterLigne.Enabled := False;
        BtnSupprimerLigne.Enabled := False;
        BtnModifierLigne.Enabled := False;
        DBLookupComboBoxDepot.Enabled:=False;
      end;
    end;

  finally
    QryExec.Free;
    if ModeSaisie = msModification then
      FIsLoading := False;
  end;
end;

procedure TFormFicheEntcde.DBCODFOUExit(Sender: TObject);
var
  QryExec: TFDQuery;
  Values: array of string;
  MotDePasse: string;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableEntcde.State in [dsEdit, dsInsert]) then
    Exit;
  if not FDMemTableEntcde.Active then
    Exit;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  try
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM fournis WHERE CODFOU=:CODFOU';
    QryExec.ParamByName('CODFOU').AsString := FDMemTableEntcde.FieldByName('CODFOU').AsString;
    QryExec.Open;
    IF QryExec.Eof then
    begin
      ShowMessage('Fournisseur inconnu !');
      if ModeSaisie = msModification then
        FDMemTableEntcde.FieldByName('CODFOU').AsString:=FDMemTableEntcde.FieldByName('CODFOU').OldValue;

      DBLookupComboBoxFournis.SetFocus;     //Focus sur le champ sur lequel on est positionné
      Exit;
    end;

    FDMemTableEntcde.FieldByName('DEVISE').AsString:= QryExec.FieldByName('DEVISE').AsString;
    JvDBLookupComboDeviseChange(Sender);

//    if ModeSaisie = msAjout then
//      FDMemTableEntcde.FieldByName('LIBELLE').AsString := 'Achat ' + FDQueryFournis.FieldByName('nom').AsString;

  finally
    //QryExec.Free;
  end;

  CalculCompletPiece;
  QryExec.Free;
end;


procedure TFormFicheEntcde.DBLookupComboBoxDepotClick(Sender: TObject);
begin
  FDMemTableEntcde.FieldByName('CODDEP').AsInteger := DBLookupComboBoxDepot.KeyValue;
end;

procedure TFormFicheEntcde.DBTOT_FRETExit(Sender: TObject);
begin
  FDMemTableEntcde.FieldByName('MT_HT').AsFloat := Round(FDMemTableEntcde.FieldByName('MT_TTC').AsInteger
  - FDMemTableEntcde.FieldByName('MT_TVA').AsInteger + FDMemTableEntcde.FieldByName('MT_REM').AsFloat);
  CalculCompletPiece;
  end;

procedure TFormFicheEntcde.DBTOT_TVAExit(Sender: TObject);
begin
  FDMemTableEntcde.FieldByName('MT_TTC').AsInteger := Round(FDMemTableEntcde.FieldByName('MT_HT').AsFloat
   + FDMemTableEntcde.FieldByName('MT_TVA').AsInteger - FDMemTableEntcde.FieldByName('MT_REM').AsFloat);
  CalculCompletPiece;
end;

procedure TFormFicheEntcde.DBTot_deviseExit(Sender: TObject);
begin
  FDMemTableEntcde.FieldByName('MT_TTC').AsInteger := Round(FDMemTableEntcde.FieldByName('MT_HT').AsFloat
   + FDMemTableEntcde.FieldByName('MT_TVA').AsInteger - FDMemTableEntcde.FieldByName('MT_REM').AsFloat);
  CalculCompletPiece;
end;



procedure TFormFicheEntcde.FDMemTableLigcdeCalcFields(DataSet: TDataSet);
begin
// Addition simple des deux champs de la ligne
  DataSet.FieldByName('tot_ttc').AsCurrency :=
    DataSet.FieldByName('totht').AsCurrency + DataSet.FieldByName('mt_tva').AsCurrency;

  //Recup libelle article
  FDQueryArticle.Close;
  FDQueryArticle.ParamByName('codart').AsString := DataSet.FieldByName('codart').AsString;
  FDQueryArticle.Open;
  DataSet.FieldByName('lib_art').AsString := FDQueryArticle.FieldByName('LIBELLE').AsString
end;

procedure TFormFicheEntcde.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // Si l'utilisateur essaie d'annuler/fermer la fiche
  if ModalResult = mrCancel then
  begin
    if FDMemTableEntcde.FieldByName('ETAT').AsString<>'R' then
    begin
      if MessageDlg('⚠ Etes-vous sûr de vouloir annuler les modifications ?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      begin
        CanClose := False; // On bloque la fermeture, l'utilisateur reste dans le formulaire
      end;
    end;
  end;
  FDQueryFournis.Close;
  DM_Olivier.FDQueryPoste.Close;
end;

procedure TFormFicheEntcde.JvDBGridLignesKeyDown(Sender: TObject;
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


procedure TFormFicheEntcde.JvDBLookupComboDeviseChange(Sender: TObject);
begin
FDMemTableEntcde.FieldByName('TAUX').AsFloat :=
  JvDBLookupComboDevise.LookupSource.DataSet.FieldByName('TAUX').AsFloat;
end;

//CALCUL COMPLET DE LA PIECE
procedure TFormFicheEntcde.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entcde_cli_fiche.html');
end;

procedure TFormFicheEntcde.BtnAjouterLigneClick(Sender: TObject);
var
  Continuer: Boolean;
begin

  if FDMemTableEntcde.FieldByName('ETAT').AsString = 'R' then
      Exit;

  repeat
    // Création et affichage de la fiche de saisie
    FormLigcde := TFormLigcde.Create(Self);
    try
      FormLigcde.DSLigcde.DataSet := FDMemTableLigcde;

      // Configuration de la fiche
      FormLigcde.ModeSaisieLigne := U_FicheLigcde.msAjout;
      FormLigcde.Caption := 'Nouvelle ligne';

      // Passage en mode insertion
      FDMemTableLigcde.Insert;

      // Pré-remplir les champs correctement
      FDMemTableLigcde.FieldByName('NOCDE').AsInteger := FDMemTableEntcde.FieldByName('NOCDE').AsInteger;
      FDMemTableLigcde.FieldByName('DATE_').AsDateTime := FDMemTableEntcde.FieldByName('DATE_').AsDateTime;
      FDMemTableLigcde.FieldByName('CODFOU').AsString := FDMemTableEntcde.FieldByName('CODFOU').AsString;

      // Si l'utilisateur clique sur Valider
      Continuer := (FormLigcde.ShowModal = mrOk);
      if Continuer then
      begin
        // Le .Post a DEJA été fait à l'intérieur de la fiche
        CalculCompletPiece;
      end
      else
      begin
        // Si l'utilisateur a annulé, on annule l'insertion
        FDMemTableLigcde.Cancel;
      end;
    finally
      FormLigcde.Free;
    end;
  until not Continuer; // La boucle tourne tant que l'utilisateur valide (mrOk)
  JvDBGridLignes.SetFocus;
end;


procedure TFormFicheEntcde.BtnModifierLigneClick(Sender: TObject);
begin
  // Vérifie qu'une ligne est bien sélectionnée
  if FDMemTableLigcde.IsEmpty then Exit;

    // Si le focus est sur la grille et qu'on appuie sur Entrée
  if FDMemTableEntcde.FieldByName('ETAT').AsString = 'C' then
      Exit;

  FormLigcde := TFormLigcde.Create(Self);
  try
    FormLigcde.DSLigcde.DataSet := FDMemTableLigcde;
    FormLigcde.ModeSaisieLigne := U_FicheLigcde.msModification;
    FormLigcde.Caption := 'Modifier la ligne de la pièce';

    if FormLigcde.ShowModal = mrOk then
    begin
      // 1. On s'assure que le post est bien effectif et fermé
      if FDMemTableLigcde.State in [dsEdit, dsInsert] then
        FDMemTableLigcde.Post;

      CalculCompletPiece;
      // 2. On repositionne et rafraîchit proprement le dataset
      DM_Olivier.RefreshDataSetWithBookmark(FDMemTableLigcde)
    end
    else
    begin
      // Si annulé, on s'assure juste proprement de remettre le dataset en état stable
      // S'il était en édit/insert, on l'annule, mais on protège avec un try/except pour éviter tout plantage visuel
      try
        if FDMemTableLigcde.State in [dsEdit, dsInsert] then
          FDMemTableLigcde.Cancel;
      except
        // On ignore silencieusement si le dataset était déjà fermé/sorti du mode édit
      end;
    end;
  finally
    FormLigcde.Free;
    JvDBGridLignes.SetFocus;
  end;

end;

procedure TFormFicheEntcde.BtnSupprimerLigneClick(Sender: TObject);
var
  i: Integer;
  BookmarkList: TBookmarkList;
  NbLignesSupprimees: Integer;
begin
  // Garde-fou existant
  if FDMemTableEntcde.FieldByName('ETAT').AsString = 'C' then
    Exit;

  // 1. Vérification si la table est vide
  if FDMemTableLigcde.IsEmpty then
  begin
    ShowMessage('Aucune ligne à supprimer.');
    JvDBGridLignes.SetFocus;
    Exit;
  end;

  // 2. Vérifier si des lignes sont sélectionnées dans la JvDBGrid
  BookmarkList := JvDBGridLignes.SelectedRows;
  if BookmarkList.Count = 0 then
  begin
    ShowMessage('Veuillez sélectionner au moins une ligne à supprimer.');
    JvDBGridLignes.SetFocus;
    Exit;
  end;

  // 3. Demande de confirmation globale
  if MessageDlg('Voulez-vous vraiment supprimer les ' + IntToStr(BookmarkList.Count) + ' ligne(s) sélectionnée(s) ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    NbLignesSupprimees := 0;
    try
      // Désactiver le rafraîchissement visuel pendant la suppression en masse
      FDMemTableLigcde.DisableControls;
      try
        // Parcours à l'envers (de la fin vers le début) pour préserver la validité des signets
        for i := BookmarkList.Count - 1 downto 0 do
        begin
          if FDMemTableLigcde.BookmarkValid(TBookmark(BookmarkList[i])) then
          begin
            FDMemTableLigcde.GotoBookmark(TBookmark(BookmarkList[i]));
            FDMemTableLigcde.Delete;
            Inc(NbLignesSupprimees);
          end;
        end;
      finally
        // Réactiver l'affichage de la grille
        FDMemTableLigcde.EnableControls;
      end;

      // 4. Recalcul unique de la pièce après la suppression des lignes
      if NbLignesSupprimees > 0 then
        CalculCompletPiece;

    except
      on E: Exception do
      begin
        // S'assurer de réactiver les contrôles en cas d'erreur
        if FDMemTableLigcde.ControlsDisabled then
          FDMemTableLigcde.EnableControls;

        MessageDlg('Erreur lors de la suppression des lignes : ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;

  JvDBGridLignes.SetFocus;

end;

procedure TFormFicheEntcde.BtnValiderClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  Numero: Integer;
  VNoCde: Integer;
  WAnnuleSaisie: Boolean;
  iNolig: Integer;

begin
  //Controle fournisseur
  if DBCODFOU.Field.Text='' then
  begin
    DBCODFOUExit(Sender);
    Exit;
  end;

  //Calcul de securite
  CalculCompletPiece;

  // 1. S'assurer que les saisies en cours dans les grilles/champs sont validées (Post)
  if FDMemTableEntcde.State in [dsEdit, dsInsert] then
    FDMemTableEntcde.Post;

  if FDMemTableLigcde.State in [dsEdit, dsInsert] then
    FDMemTableLigcde.Post;

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
        QryExec.SQL.Text := 'SELECT NOCDE FROM `entcde` ORDER BY NOCDE DESC LIMIT 1';
        QryExec.Open;
        QryExec.first;
        Numero:=1;
        if QryExec.Eof=false then
          Numero := QryExec.FieldByName('NOCDE').AsInteger + 1;

        FNumeroCree := Numero;

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
        QryExec.ParamByName('OBSERV').AsString  := FDMemTableEntcde.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('NOCDE').AsInteger  := Numero;
        QryExec.ParamByName('CODFOU').AsString   := FDMemTableEntcde.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('ETAT').AsString     := 'S';
        QryExec.ParamByName('DATE_').AsDateTime  := FDMemTableEntcde.FieldByName('DATE_').AsDateTime;
        //QryExec.ParamByName('DATE_ARRIVEE').AsDateTime  := FDMemTableEntcde.FieldByName('DATE_ARRIVEE').AsDateTime;
        QryExec.ParamByName('TOT_DEVISE').AsFloat     := FDMemTableEntcde.FieldByName('TOT_DEVISE').AsFloat;
        QryExec.ParamByName('TOT_CFP').AsInteger    := FDMemTableEntcde.FieldByName('TOT_CFP').AsInteger;
        QryExec.ParamByName('TOT_FRET').AsInteger  := FDMemTableEntcde.FieldByName('TOT_FRET').AsInteger;
        QryExec.ParamByName('TOT_COMM_DOU').AsInteger  := FDMemTableEntcde.FieldByName('TOT_COMM_DOU').AsInteger;
        QryExec.ParamByName('TOT_DROITS').AsInteger  := FDMemTableEntcde.FieldByName('TOT_DROITS').AsInteger;
        QryExec.ParamByName('TOT_ASSUR').AsInteger  := FDMemTableEntcde.FieldByName('TOT_ASSUR').AsInteger;
        QryExec.ParamByName('TOT_TVA').AsInteger  := FDMemTableEntcde.FieldByName('TOT_TVA').AsInteger;
        QryExec.ParamByName('DOSSIER').AsString    := FDMemTableEntcde.FieldByName('DOSSIER').AsString;
        QryExec.ParamByName('DEVISE').AsString    := FDMemTableEntcde.FieldByName('DEVISE').AsString;
        QryExec.ParamByName('TAUX').AsFloat     := FDMemTableEntcde.FieldByName('TAUX').AsFloat;
        QryExec.ParamByName('COEF_PR').AsFloat     := FDMemTableEntcde.FieldByName('COEF_PR').AsFloat;
        QryExec.ParamByName('COEF_PV').AsFloat     := FDMemTableEntcde.FieldByName('COEF_PV').AsFloat;
        QryExec.ParamByName('PRC_MARG').AsFloat     := FDMemTableEntcde.FieldByName('PRC_MARG').AsFloat;
        QryExec.ParamByName('CODDEP').AsInteger  := FDMemTableEntcde.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('ASSUR').AsString   := FDMemTableEntcde.FieldByName('ASSUR').AsString;
        QryExec.ParamByName('TRANSP').AsString   := FDMemTableEntcde.FieldByName('TRANSP').AsString;
        QryExec.ParamByName('COM_DOU').AsString   := FDMemTableEntcde.FieldByName('COM_DOU').AsString;
        QryExec.ParamByName('EXPED').AsString   := FDMemTableEntcde.FieldByName('EXPED').AsString;
        QryExec.ExecSQL;

      end
      else
      begin
        // UPDATE pour l'en-tête en modification
        Numero := FDMemTableEntcde.FieldByName('NOCDE').AsInteger;

        QryExec.SQL.Text := 'UPDATE `entcde` SET '+
            '`NOCDE` = :NOCDE, '+
            '`DOSSIER` = :DOSSIER, '+
            '`CODFOU` = :CODFOU, '+
            '`DATE_` = :DATE_, '+
            '`DEVISE` = :DEVISE, '+
            '`TAUX` = :TAUX, '+
            '`ASSUR` = :ASSUR, '+
            '`TRANSP` = :TRANSP, '+
            '`COM_DOU` = :COM_DOU, '+
            '`EXPED` = :EXPED, '+
            '`ETAT` = :ETAT, '+
//            '`DATE_ARRIVEE` = :DATE_ARRIVEE, '+
            '`TOT_DEVISE` = :TOT_DEVISE, '+
            '`TOT_CFP` = :TOT_CFP, '+
            '`TOT_FRET` = :TOT_FRET, '+
            '`TOT_COMM_DOU` = :TOT_COMM_DOU, '+
            '`TOT_DROITS` = :TOT_DROITS, '+
            '`TOT_ASSUR` = :TOT_ASSUR, '+
            '`TOT_TVA` = :TOT_TVA, '+
            '`COEF_PR` = :COEF_PR, '+
            '`COEF_PV` = :COEF_PV, '+
            '`CODDEP` = :CODDEP, '+
            '`OBSERV` = :OBSERV, '+
            '`PRC_MARG` = :PRC_MARG '+
            'WHERE `NOCDE` = :NOCDE';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('OBSERV').AsString  := FDMemTableEntcde.FieldByName('OBSERV').AsString;
        QryExec.ParamByName('NOCDE').AsInteger  := Numero;
        QryExec.ParamByName('CODFOU').AsString   := FDMemTableEntcde.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('ETAT').AsString     := 'S';
        QryExec.ParamByName('DATE_').AsDateTime  := FDMemTableEntcde.FieldByName('DATE_').AsDateTime;
//        QryExec.ParamByName('DATE_ARRIVEE').AsDateTime  := FDMemTableEntcde.FieldByName('DATE_ARRIVEE').AsDateTime;
        QryExec.ParamByName('TOT_DEVISE').AsFloat     := FDMemTableEntcde.FieldByName('TOT_DEVISE').AsFloat;
        QryExec.ParamByName('TOT_CFP').AsInteger    := FDMemTableEntcde.FieldByName('TOT_CFP').AsInteger;
        QryExec.ParamByName('TOT_FRET').AsInteger  := FDMemTableEntcde.FieldByName('TOT_FRET').AsInteger;
        QryExec.ParamByName('TOT_COMM_DOU').AsInteger  := FDMemTableEntcde.FieldByName('TOT_COMM_DOU').AsInteger;
        QryExec.ParamByName('TOT_DROITS').AsInteger  := FDMemTableEntcde.FieldByName('TOT_DROITS').AsInteger;
        QryExec.ParamByName('TOT_ASSUR').AsInteger  := FDMemTableEntcde.FieldByName('TOT_ASSUR').AsInteger;
        QryExec.ParamByName('TOT_TVA').AsInteger  := FDMemTableEntcde.FieldByName('TOT_TVA').AsInteger;
        QryExec.ParamByName('DOSSIER').AsString    := FDMemTableEntcde.FieldByName('DOSSIER').AsString;
        QryExec.ParamByName('DEVISE').AsString    := FDMemTableEntcde.FieldByName('DEVISE').AsString;
        QryExec.ParamByName('TAUX').AsFloat     := FDMemTableEntcde.FieldByName('TAUX').AsFloat;
        QryExec.ParamByName('COEF_PR').AsFloat     := FDMemTableEntcde.FieldByName('COEF_PR').AsFloat;
        QryExec.ParamByName('COEF_PV').AsFloat     := FDMemTableEntcde.FieldByName('COEF_PV').AsFloat;
        QryExec.ParamByName('PRC_MARG').AsFloat     := FDMemTableEntcde.FieldByName('PRC_MARG').AsFloat;
        QryExec.ParamByName('CODDEP').AsInteger  := FDMemTableEntcde.FieldByName('CODDEP').AsInteger;
        QryExec.ParamByName('ASSUR').AsString   := FDMemTableEntcde.FieldByName('ASSUR').AsString;
        QryExec.ParamByName('TRANSP').AsString   := FDMemTableEntcde.FieldByName('TRANSP').AsString;
        QryExec.ParamByName('COM_DOU').AsString   := FDMemTableEntcde.FieldByName('COM_DOU').AsString;
        QryExec.ParamByName('EXPED').AsString   := FDMemTableEntcde.FieldByName('EXPED').AsString;
        QryExec.ExecSQL;
      end;

      QryExec.Close;

      // ==========================================
      // 4. ENREGISTREMENT DES LIGNES
      // ==========================================
      // Pour faire simple et propre lors d'une modification :
      // on supprime les anciennes lignes de cette facture et on réinsère l'état actuel de la table mémoire.
      if ModeSaisie = msModification then
      begin
        QryExec.Close;
        QryExec.SQL.Text := 'DELETE FROM ligcde WHERE  NOCDE = :NOCDE';
        QryExec.ParamByName('NOCDE').AsInteger := Numero;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des lignes
      iNolig := 0;
      FDMemTableLigcde.First;
      while not FDMemTableLigcde.Eof do
      begin
        iNolig:= iNolig+1;
        //Insertion
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
        QryExec.ParamByName('NOCDE').AsInteger     := Numero;
        QryExec.ParamByName('REF_FOU').AsString    := FDMemTableLigcde.FieldByName('REF_FOU').AsString;
        QryExec.ParamByName('DATE_').AsDateTime  := FDMemTableEntcde.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('CODFOU').AsString    := FDMemTableLigcde.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('CODART').AsString     := FDMemTableLigcde.FieldByName('CODART').AsString;
        QryExec.ParamByName('LIBELLE').AsString     := FDMemTableLigcde.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('UV').AsString     := FDMemTableLigcde.FieldByName('UV').AsString;
        QryExec.ParamByName('UC').AsString     := FDMemTableLigcde.FieldByName('UC').AsString;
        QryExec.ParamByName('QTE_UV').AsFloat         := FDMemTableLigcde.FieldByName('QTE_UV').AsFloat;
        QryExec.ParamByName('QTE_UC').AsFloat         := FDMemTableLigcde.FieldByName('QTE_UC').AsFloat;
        QryExec.ParamByName('ETAT').AsString     := FDMemTableLigcde.FieldByName('ETAT').AsString;
        QryExec.ParamByName('QTE_UV_RC').AsFloat   := FDMemTableLigcde.FieldByName('QTE_UV_RC').AsFloat;
        QryExec.ParamByName('QTE_UC_RC').AsFloat   := FDMemTableLigcde.FieldByName('QTE_UC_RC').AsFloat;
        QryExec.ParamByName('COEF_PR').AsFloat      := FDMemTableLigcde.FieldByName('COEF_PR').AsFloat;
        QryExec.ParamByName('COEF_PV').AsFloat   := FDMemTableLigcde.FieldByName('COEF_PV').AsFloat;
        QryExec.ParamByName('PX_REV').AsFloat       := FDMemTableLigcde.FieldByName('PX_REV').AsFloat;
        QryExec.ParamByName('PX_VTE').AsFloat       := FDMemTableLigcde.FieldByName('PX_VTE').AsFloat;
        QryExec.ParamByName('PX_UC').AsFloat       := FDMemTableLigcde.FieldByName('PX_UC').AsFloat;

        QryExec.ExecSQL;

        //Lecture ligne memoire suivante
        FDMemTableLigcde.Next;
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

procedure TFormFicheEntcde.CalculCompletPiece;
var
  QryExec: TFDQuery;
  QryArticle: TFDQuery;
  pTVA: String;

  MONT: Double;
  wDate: TDateTime;
  AQte: Double;

  SavedBookmark: TBookmark;
begin
  // Sorties anticipées si conditions non remplies
  if FIsLoading then Exit;
  if not (FDMemTableEntcde.State in [dsEdit, dsInsert]) then Exit;
  if not FDMemTableLigcde.Active then Exit;

  QryExec := nil;
  QryArticle := nil;
  SavedBookmark := nil;

  wDate := FDMemTableEntcde.FieldByName('Date_').AsDateTime;

  try
    // Création requêtes temporaires
    QryExec := TFDQuery.Create(nil);
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;

    QryArticle := TFDQuery.Create(nil);
    QryArticle.Connection := DMGesCloud.ConnexionGesCloud;

    FDMemTableLigcde.DisableControls;
    try
      if not FDMemTableLigcde.IsEmpty then
        SavedBookmark := FDMemTableLigcde.GetBookmark;

      // RAZ cumul si lignes pour recalcul
      if FDMemTableLigcde.RecordCount>0 then
      begin
//        FDMemTableEntcde.FieldByName('MT_TTC').AsInteger := 0;
//        FDMemTableEntcde.FieldByName('MT_HT').AsFloat := 0;
//        FDMemTableEntcde.FieldByName('MT_TVA').AsInteger := 0;
//        //FDMemTableEntcde.FieldByName('MT_REM').AsFloat := 0;
      end
      else
      begin
//        if FDMemTableEntcde.FieldByName('MT_TTC').AsInteger <> round(FDMemTableEntcde.FieldByName('MT_HT').AsFloat
//         + FDMemTableEntcde.FieldByName('MT_TVA').AsFloat
//         - FDMemTableEntcde.FieldByName('MT_REM').AsFloat) then
//        begin
//          ShowMessage('⚠ Incohérence dans les montants saisis');
//          Exit;
//        end;
      end;

      FDMemTableLigcde.First;
      while not FDMemTableLigcde.Eof do
      begin
        FDMemTableLigcde.Edit;

        QryArticle.Close;
        QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryArticle.ParamByName('CODART').AsString := FDMemTableLigcde.FieldByName('CODART').AsString;
        QryArticle.Open;

//        FDMemTableEntcde.FieldByName('MT_HT').AsFloat := FDMemTableEntcde.FieldByName('MT_HT').AsFloat + FDMemTableLigcde.FieldByName('TOTHT').AsFloat;
//        FDMemTableEntcde.FieldByName('MT_TVA').AsInteger := FDMemTableEntcde.FieldByName('MT_TVA').AsInteger + FDMemTableLigcde.FieldByName('MT_TVA').AsInteger;
//        FDMemTableEntcde.FieldByName('MT_TTC').AsInteger := FDMemTableEntcde.FieldByName('MT_HT').AsInteger + FDMemTableEntcde.FieldByName('MT_TVA').AsInteger;

        FDMemTableLigcde.Post;
        FDMemTableLigcde.Next;
      end;

      // Arrondis
//      FDMemTableEntcde.FieldByName('MT_HT').AsFloat := RoundTo(FDMemTableEntcde.FieldByName('MT_HT').AsFloat, -2);

    finally
      try
        if Assigned(SavedBookmark) then
        begin
          if FDMemTableLigcde.BookmarkValid(SavedBookmark) then
            FDMemTableLigcde.GotoBookmark(SavedBookmark);
          FDMemTableLigcde.FreeBookmark(SavedBookmark);
        end;
      except
      end;
      FDMemTableLigcde.EnableControls;
    end;

  finally
    QryExec.Free;
    QryArticle.Free;
  end;
end;


procedure TFormFicheEntcde.ValiderChampPrix(Sender: TField);
begin
  if Sender.IsNull then Exit;

  if Sender.AsFloat < 0 then
  begin
    DatabaseError('⚠ Prix négatif interdit.');
  end;
end;

procedure TFormFicheEntcde.CMDialogKey(var Msg: TCMDialogKey);
begin
  //Ctrl+Entree -> Pour valider la fiche
 if (Msg.CharCode = VK_RETURN) and ((GetKeyState(VK_CONTROL) + $8000) <> 0) then
 begin
  if FDMemTableEntcde.FieldByName('TOP_').AsString = 'C' then
    Exit;

    BtnValider.Click;
    Msg.Result := 1;
    Exit;
 end;
  // Si le focus est sur la grille et qu'on appuie sur Entrée
 if (ActiveControl = JvDBGridLignes) and (Msg.CharCode = VK_RETURN) then
 begin
  if FDMemTableEntcde.FieldByName('TOP_').AsString = 'C' then
    Exit;

  BtnModifierLigne.Click;
  Msg.Result := 1; // Indique que le message a été traité
  Exit;
 end;

  inherited; // Laisse le comportement par défaut pour le reste
end;

end.
