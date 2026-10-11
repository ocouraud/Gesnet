unit U_FicheAchat;

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
  TFormFicheAchat = class(TForm)
    FDQueryFournis: TFDQuery;
    DSFournis: TDataSource;
    DSMemTableAchat: TDataSource;
    FDMemTableAchat: TFDMemTable;
    FDMemTableLigachjj: TFDMemTable;
    DSMemTableLigachjj: TDataSource;
    FDQueryAchat: TFDQuery;
    FDQueryLigachjj: TFDQuery;
    DBLookupComboBoxFournis: TDBLookupComboBox;
    DBCODFOU: TDBEdit;
    Label21: TLabel;
    DBREFERENCE_: TDBEdit;
    Label17: TLabel;
    JvDBDate_: TJvDBDateEdit;
    Label10: TLabel;
    DBCODACH: TDBEdit;
    Label1: TLabel;
    JvDBGridLignes: TJvDBGrid;
    Panel3: TPanel;
    Label14: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    DBMT_HT: TDBEdit;
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
    Label2: TLabel;
    DSLigachjj: TDataSource;
    FDQueryLigachjjCODACH: TLargeintField;
    FDQueryLigachjjREFER: TStringField;
    FDQueryLigachjjDATE_: TDateField;
    FDQueryLigachjjCODFOU: TStringField;
    FDQueryLigachjjCODSSF: TStringField;
    FDQueryLigachjjCODFAM: TStringField;
    FDQueryLigachjjCODART: TStringField;
    FDQueryLigachjjCODDEP: TShortintField;
    FDQueryLigachjjQTE: TBCDField;
    FDQueryLigachjjPRIXHT: TBCDField;
    FDQueryLigachjjPRIXTTC: TIntegerField;
    FDQueryLigachjjTOTHT: TBCDField;
    FDQueryLigachjjTX_TVA: TBCDField;
    FDQueryLigachjjMT_TVA: TIntegerField;
    FDQueryLigachjjNO_TVA: TSmallintField;
    FDQueryLigachjjPOIDS: TBCDField;
    FDQueryLigachjjNOENR: TFDAutoIncField;
    FDQueryLigachjjDER_MODIF: TSQLTimeStampField;
    FDQueryLigachjjTX_TSOC: TBCDField;
    FDQueryLigachjjMT_TSOC: TBCDField;
    FDQueryLigachjjNOENR_STO: TLargeintField;
    FDQueryLigachjjlibelle: TStringField;
    FDQueryLigachjjmt_ttc: TBCDField;
    DBLibelle: TDBLabeledEdit;
    DBMT_REM: TDBEdit;
    Label3: TLabel;
    procedure DBCODFOUExit(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure JvDBGridLignesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnAjouterLigneClick(Sender: TObject);
    procedure BtnModifierLigneClick(Sender: TObject);
    procedure BtnSupprimerLigneClick(Sender: TObject);
    procedure DBMT_HTExit(Sender: TObject);
    procedure DBMT_TVAExit(Sender: TObject);
    procedure DBMT_TTCExit(Sender: TObject);
  private
    { Déclarations privées }
    FIsLoading: Boolean;
    FCodAchCree: Integer;
    procedure ValiderChampPrix(Sender: TField);
    procedure CalculCompletPiece;
    procedure CMDialogKey(var Msg: TCMDialogKey);   //Juste pour louverture
  public
    { Déclarations publiques }
    ModeSaisie: TModeSaisie;
    ModeSaisieLigne: TModeSaisie;
    constructor Create(AOwner: TComponent; AMode: TModeSaisie; ACodach: Integer); reintroduce;
    property CodAchCree: Integer read FCodAchCree;
  end;

var
  FormFicheAchat: TFormFicheAchat;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_TableEntcde_cli, U_DataModule, U_FormAide, U_FicheLigachjj;


constructor TFormFicheAchat.Create(AOwner: TComponent; AMode: TModeSaisie; ACodach: Integer);
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
    FDQueryAchat.Close;
    FDQueryAchat.SQL.Text := 'select * from achat where codach = :codach';
    FDQueryAchat.ParamByName('CODACH').AsInteger := Acodach;
    FDQueryAchat.Open;

    FDMemTableAchat.Close;
    FDMemTableAchat.FieldDefs.Assign(FDQueryAchat.FieldDefs);
    FDMemTableAchat.CreateDataSet;
    FDMemTableAchat.Open;

    if ModeSaisie = msAjout then
    begin
      FDMemTableAchat.Append;
      FDMemTableAchat.FieldByName('CODACH').AsInteger := ACodach;
      FDMemTableAchat.FieldByName('DATE_').AsDateTime := Date;
      //FDMemTableEntcde_cli.FieldByName('HEURE').AsLargeInt := Round(Frac(Now) * 86400 * 100);
      FDMemTableAchat.FieldByName('TOP_').AsString := 'J';

      FDMemTableAchat.Post;
      FDMemTableAchat.Edit;
    end
    else
    begin
      FDMemTableAchat.CopyDataSet(FDQueryAchat, [coAppend]);
      FDMemTableAchat.First;
    end;

    // 2. Gestion des Lignes de détails
    FDQueryLigachjj.Close;
    FDQueryLigachjj.Sql.Text := 'SELECT ligachjj.*, article.libelle, (ligachjj.totht + ligachjj.mt_tva) AS mt_ttc '+
    'FROM ligachjj INNER JOIN article ON article.codart = ligachjj.codart '+
    'WHERE ligachjj.CODACH = :CODACH';

    // On charge la requête source
    FDQueryLigachjj.ParamByName('CODACH').AsInteger := ACodach;
    FDQueryLigachjj.Open();
    FDQueryLigachjj.FetchAll;

    FDMemTableLigachjj.Close;

    if ModeSaisie = msModification then
    begin
      // Mode Modification : On récupère structure et données d'un coup
      FDMemTableLigachjj.Data := FDQueryLigachjj.Data;
      FDMemTableLigachjj.First;
    end
    else
    begin
      // Mode Création : On initialise une structure vide basée sur la requête
      FDMemTableLigachjj.FieldDefs.Assign(FDQueryLigachjj.FieldDefs);
      FDMemTableLigachjj.CreateDataSet;
      FDMemTableLigachjj.Open;
      FDMemTableLigachjj.EmptyDataSet;
    end;

    // 2. Attachement dynamique des événements (OBLIGATOIREMENT APRÈS le chargement/création)
    if FDMemTableLigachjj.FindField('PRIXHT') <> nil then
      FDMemTableLigachjj.FieldByName('PRIXHT').OnValidate := ValiderChampPrix;

    if FDMemTableLigachjj.FindField('PRIXTTC') <> nil then
      FDMemTableLigachjj.FieldByName('PRIXTTC').OnValidate := ValiderChampPrix;

    FDQueryFournis.Open;

    FDMemTableAchat.Edit;

    if ModeSaisie = msAjout then
//      DBCODFOUExit(self)
    else
    begin
      var i: Integer;
      if FDMemTableAchat.FieldByName('TOP_').AsString = 'C' then
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

//    if DM_Olivier.fgTxTaxe(FDMemTableAchat.FieldByName('DATE_').AsDateTime, 'TVAI') = 0 then
//    begin
//      RzDBCheckBoxTVA_ILES.Visible := False;
//      FDMemTableEntcde_cli.FieldByName('TVA_ILES').AsBoolean := False;
//    end
//    else
//    begin
//      RzDBCheckBoxTVA_ILES.Visible := True;
//    end;

  finally
    QryExec.Free;
    if ModeSaisie = msModification then
      FIsLoading := False;
  end;
end;

procedure TFormFicheAchat.DBCODFOUExit(Sender: TObject);
var
  QryExec: TFDQuery;
  Values: array of string;
  MotDePasse: string;
begin
  // On ne fait rien si la table est simplement en train d'être lue/initialisée (sinon plantage)
  if not (FDMemTableAchat.State in [dsEdit, dsInsert]) then
    Exit;
  if not FDMemTableAchat.Active then
    Exit;

  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  try
    QryExec.Close;
    QryExec.SQL.Text := 'SELECT * FROM fournis WHERE CODFOU=:CODFOU';
    QryExec.ParamByName('CODFOU').AsString := FDMemTableAchat.FieldByName('CODFOU').AsString;
    QryExec.Open;
    IF QryExec.Eof then
    begin
      ShowMessage('Fournisseur inconnu !');
      if ModeSaisie = msModification then
        FDMemTableAchat.FieldByName('CODFOU').AsString:=FDMemTableAchat.FieldByName('CODFOU').OldValue;

      DBLookupComboBoxFournis.SetFocus;     //Focus sur le champ sur lequel on est positionné
      Exit;
    end;
    if ModeSaisie = msAjout then
      FDMemTableAchat.FieldByName('LIBELLE').AsString := 'Achat ' + FDQueryFournis.FieldByName('nom').AsString;

  finally
    //QryExec.Free;
  end;

  CalculCompletPiece;
  QryExec.Free;
end;


procedure TFormFicheAchat.DBMT_TTCExit(Sender: TObject);
begin
  FDMemTableAchat.FieldByName('MT_HT').AsFloat := Round(FDMemTableAchat.FieldByName('MT_TTC').AsInteger
  - FDMemTableAchat.FieldByName('MT_TVA').AsInteger + FDMemTableAchat.FieldByName('MT_REM').AsFloat);
end;

procedure TFormFicheAchat.DBMT_TVAExit(Sender: TObject);
begin
  FDMemTableAchat.FieldByName('MT_TTC').AsInteger := Round(FDMemTableAchat.FieldByName('MT_HT').AsFloat)
   + FDMemTableAchat.FieldByName('MT_TVA').AsInteger - Round(FDMemTableAchat.FieldByName('MT_REM').AsFloat);
end;

procedure TFormFicheAchat.DBMT_HTExit(Sender: TObject);
begin
  FDMemTableAchat.FieldByName('MT_TTC').AsInteger := Round(FDMemTableAchat.FieldByName('MT_HT').AsFloat)
   + FDMemTableAchat.FieldByName('MT_TVA').AsInteger - Round(FDMemTableAchat.FieldByName('MT_REM').AsFloat);
end;

procedure TFormFicheAchat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // Si l'utilisateur essaie d'annuler/fermer la fiche
  if ModalResult = mrCancel then
  begin
    if FDMemTableAchat.FieldByName('TOP_').AsString<>'C' then
    begin
      if MessageDlg('⚠ Etes-vous sûr de vouloir annuler les modifications ?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      begin
        CanClose := False; // On bloque la fermeture, l'utilisateur reste dans le formulaire
      end;
    end;
  end;
end;

procedure TFormFicheAchat.JvDBGridLignesKeyDown(Sender: TObject;
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
procedure TFormFicheAchat.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entcde_cli_fiche.html');
end;

procedure TFormFicheAchat.BtnAjouterLigneClick(Sender: TObject);
var
  Continuer: Boolean;
begin

  if FDMemTableAchat.FieldByName('TOP_').AsString = 'C' then
      Exit;

  repeat
    // Création et affichage de la fiche de saisie
    FormLigachjj := TFormLigachjj.Create(Self);
    try
      FormLigachjj.DSlig_prof.DataSet := FDMemTableLigachjj;

      // Configuration de la fiche
      FormLigachjj.ModeSaisieLigne := U_FicheLigachjj.msAjout;
      FormLigachjj.Caption := 'Nouvelle ligne d''achat';

      // Passage en mode insertion
      FDMemTableLigachjj.Insert;

      // Pré-remplir les champs correctement
      FDMemTableLigachjj.FieldByName('CODACH').AsInteger := FDMemTableAchat.FieldByName('CODACH').AsInteger;
      FDMemTableLigachjj.FieldByName('CODFOU').AsString := FDMemTableAchat.FieldByName('CODFOU').AsString;

      // Si l'utilisateur clique sur Valider
      Continuer := (FormLigachjj.ShowModal = mrOk);
      if Continuer then
      begin
        // Le .Post a DEJA été fait à l'intérieur de la fiche
        CalculCompletPiece;
      end
      else
      begin
        // Si l'utilisateur a annulé, on annule l'insertion
        FDMemTableLigachjj.Cancel;
      end;
    finally
      FormLigachjj.Free;
    end;
  until not Continuer; // La boucle tourne tant que l'utilisateur valide (mrOk)

  JvDBGridLignes.SetFocus;
end;


procedure TFormFicheAchat.BtnModifierLigneClick(Sender: TObject);
begin
  // Vérifie qu'une ligne est bien sélectionnée
  if FDMemTableLigachjj.IsEmpty then Exit;

    // Si le focus est sur la grille et qu'on appuie sur Entrée
  if FDMemTableAchat.FieldByName('TOP_').AsString = 'C' then
      Exit;

  FormLigachjj := TFormLigachjj.Create(Self);
  try
    FormLigachjj.DSlig_prof.DataSet := FDMemTableLigachjj;
    FormLigachjj.ModeSaisieLigne := U_FicheLigachjj.msModification;
    FormLigachjj.Caption := 'Modifier la ligne de la pièce';

    if FormLigachjj.ShowModal = mrOk then
    begin
      // 1. On s'assure que le post est bien effectif et fermé
      if FDMemTableLigachjj.State in [dsEdit, dsInsert] then
        FDMemTableLigachjj.Post;

      CalculCompletPiece;
      // 2. On repositionne et rafraîchit proprement le dataset
      DM_Olivier.RefreshDataSetWithBookmark(FDMemTableLigachjj)
    end
    else
    begin
      // Si annulé, on s'assure juste proprement de remettre le dataset en état stable
      // S'il était en édit/insert, on l'annule, mais on protège avec un try/except pour éviter tout plantage visuel
      try
        if FDMemTableLigachjj.State in [dsEdit, dsInsert] then
          FDMemTableLigachjj.Cancel;
      except
        // On ignore silencieusement si le dataset était déjà fermé/sorti du mode édit
      end;
    end;
  finally
    FormLigachjj.Free;
    JvDBGridLignes.SetFocus;
  end;

end;

procedure TFormFicheAchat.BtnSupprimerLigneClick(Sender: TObject);
var
  i: Integer;
  BookmarkList: TBookmarkList;
  NbLignesSupprimees: Integer;
begin
  // Garde-fou existant
  if FDMemTableAchat.FieldByName('TOP_').AsString = 'C' then
    Exit;

  // 1. Vérification si la table est vide
  if FDMemTableLigachjj.IsEmpty then
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
      FDMemTableLigachjj.DisableControls;
      try
        // Parcours à l'envers (de la fin vers le début) pour préserver la validité des signets
        for i := BookmarkList.Count - 1 downto 0 do
        begin
          if FDMemTableLigachjj.BookmarkValid(TBookmark(BookmarkList[i])) then
          begin
            FDMemTableLigachjj.GotoBookmark(TBookmark(BookmarkList[i]));
            FDMemTableLigachjj.Delete;
            Inc(NbLignesSupprimees);
          end;
        end;
      finally
        // Réactiver l'affichage de la grille
        FDMemTableLigachjj.EnableControls;
      end;

      // 4. Recalcul unique de la pièce après la suppression des lignes
      if NbLignesSupprimees > 0 then
        CalculCompletPiece;

    except
      on E: Exception do
      begin
        // S'assurer de réactiver les contrôles en cas d'erreur
        if FDMemTableLigachjj.ControlsDisabled then
          FDMemTableLigachjj.EnableControls;

        MessageDlg('Erreur lors de la suppression des lignes : ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;

  JvDBGridLignes.SetFocus;

end;

procedure TFormFicheAchat.BtnValiderClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  NumACH: Integer;
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
  if FDMemTableAchat.State in [dsEdit, dsInsert] then
    FDMemTableAchat.Post;
  if FDMemTableLigachjj.State in [dsEdit, dsInsert] then
    FDMemTableLigachjj.Post;

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
        QryExec.SQL.Text := 'SELECT CODACH FROM `achat` ORDER BY CODACH DESC LIMIT 1';
        QryExec.Open;
        QryExec.first;
        NumACH:=1;
        if QryExec.Eof=false then
          NumACH := QryExec.FieldByName('CODACH').AsInteger + 1;

        FCodAchCree := NumACH;

        // INSERT pour l'en-tête
        QryExec.close;
        QryExec.SQL.Text := 'INSERT INTO `achat` ('+
        '`CODACH`, `REFER`, `CODFOU`, `DATE_`, `MT_HT`, `MT_TVA`, `MT_REM`, '+
        '`MT_TTC`, `TOP_`, `LIBELLE`) '+
        'VALUES '+
        '(:CODACH, :REFER, :CODFOU, :DATE_, :MT_HT, :MT_TVA, :MT_REM, :MT_TTC, :TOP_, :LIBELLE)';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('LIBELLE').AsString     := FDMemTableAchat.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('CODACH').AsInteger     := NumACH;
        QryExec.ParamByName('CODFOU').AsString    := FDMemTableAchat.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('TOP_').AsString     := 'J';
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableAchat.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('MT_HT').AsFloat       := FDMemTableAchat.FieldByName('MT_HT').AsFloat;
        QryExec.ParamByName('MT_REM').AsFloat    := FDMemTableAchat.FieldByName('MT_REM').AsFloat;
        QryExec.ParamByName('MT_TVA').AsInteger      := FDMemTableAchat.FieldByName('MT_TVA').AsInteger;
        QryExec.ParamByName('MT_TTC').AsInteger      := FDMemTableAchat.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('REFER').AsString := FDMemTableAchat.FieldByName('REFER').AsString;
        QryExec.ExecSQL;

      end
      else
      begin
        // UPDATE pour l'en-tête en modification
        NumACH := FDMemTableAchat.FieldByName('CODACH').AsInteger;

        QryExec.SQL.Text := 'UPDATE `achat` SET '+
        '`CODACH` = :CODACH ,'+
        '`REFER` = :REFER ,'+
        '`CODFOU` = :CODFOU ,'+
        '`DATE_` = :DATE_ ,'+
        '`MT_HT` = :MT_HT ,'+
        '`MT_TVA` = :MT_TVA ,'+
        '`MT_TTC` = :MT_TTC ,'+
        '`MT_REM` = :MT_REM ,'+
        '`TOP_` = :TOP_ ,'+
        '`LIBELLE` = :LIBELLE '+
        'WHERE `CODACH` = :CODACH';

        // Assignation directe des valeurs depuis la table mémoire
        QryExec.ParamByName('LIBELLE').AsString     := FDMemTableAchat.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('CODACH').AsInteger     := NumACH;
        QryExec.ParamByName('CODFOU').AsString    := FDMemTableAchat.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('TOP_').AsString     := 'J';
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableAchat.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('MT_HT').AsFloat       := FDMemTableAchat.FieldByName('MT_HT').AsFloat;
        QryExec.ParamByName('MT_REM').AsFloat    := FDMemTableAchat.FieldByName('MT_REM').AsFloat;
        QryExec.ParamByName('MT_TVA').AsInteger      := FDMemTableAchat.FieldByName('MT_TVA').AsInteger;
        QryExec.ParamByName('MT_TTC').AsInteger      := FDMemTableAchat.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('REFER').AsString := FDMemTableAchat.FieldByName('REFER').AsString;
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
        QryExec.SQL.Text := 'DELETE FROM ligachjj WHERE CODACH = :CODACH';
        QryExec.ParamByName('CODACH').AsInteger := NumACH;
        QryExec.ExecSQL;
      end;

      // Parcours de la table mémoire des lignes
      iNolig := 0;
      FDMemTableLigachjj.First;
      while not FDMemTableLigachjj.Eof do
      begin
        iNolig:= iNolig+1;
        //Insertion lig_prof
        QryExec.Close;
        QryExec.SQL.Text := 'INSERT INTO `ligachjj` ('+
        '`CODACH`,'+
        '`CODFOU`,'+
        '`CODDEP`,'+
        '`CODFAM`,'+
        '`CODSSF`,'+
        '`CODART`,'+
        '`REFER`,'+
        '`DATE_`,'+
        '`QTE`,'+
        '`PRIXHT`,'+
        '`PRIXTTC`,'+
        '`TOTHT`,'+
        '`NO_TVA`,'+
        '`TX_TVA`,'+
        '`MT_TVA`) '+
        'VALUES ('+
        ':CODACH,'+
        ':CODFOU,'+
        ':CODDEP,'+
        ':CODFAM,'+
        ':CODSSF,'+
        ':CODART,'+
        ':REFER,'+
        ':DATE_,'+
        ':QTE,'+
        ':PRIXHT,'+
        ':PRIXTTC,'+
        ':TOTHT,'+
        ':NO_TVA,'+
        ':TX_TVA,'+
        ':MT_TVA)';

        // Assignation directe des valeurs depuis la table mémoire des lignes
        QryExec.ParamByName('CODACH').AsInteger     := NumACH;
        QryExec.ParamByName('REFER').AsString    := FDMemTableLigachjj.FieldByName('REFER').AsString;
        QryExec.ParamByName('CODFOU').AsString    := FDMemTableLigachjj.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('CODART').AsString     := FDMemTableLigachjj.FieldByName('CODART').AsString;
        QryExec.ParamByName('QTE').AsFloat         := FDMemTableLigachjj.FieldByName('QTE').AsFloat;
        QryExec.ParamByName('PRIXHT').AsFloat      := FDMemTableLigachjj.FieldByName('PRIXHT').AsFloat;
        QryExec.ParamByName('PRIXTTC').AsInteger   := FDMemTableLigachjj.FieldByName('PRIXTTC').AsInteger;
        QryExec.ParamByName('TOTHT').AsFloat       := FDMemTableLigachjj.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('NO_TVA').AsInteger    := FDMemTableLigachjj.FieldByName('NO_TVA').AsInteger;
        QryExec.ParamByName('TX_TVA').AsFloat      := FDMemTableLigachjj.FieldByName('TX_TVA').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat      := FDMemTableLigachjj.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('CODFAM').AsString     := FDMemTableLigachjj.FieldByName('CODFAM').AsString;
        QryExec.ParamByName('DATE_').AsDateTime    := FDMemTableLigachjj.FieldByName('DATE_').AsDateTime;
        QryExec.ParamByName('CODSSF').AsString     := FDMemTableLigachjj.FieldByName('CODSSF').AsString;;
        QryExec.ParamByName('CODDEP').AsInteger   := FDMemTableLigachjj.FieldByName('CODDEP').AsInteger;

        QryExec.ExecSQL;

        //Lecture ligne memoire suivante
        FDMemTableLigachjj.Next;
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

procedure TFormFicheAchat.CalculCompletPiece;
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
  if not (FDMemTableAchat.State in [dsEdit, dsInsert]) then Exit;
  if not FDMemTableLigachjj.Active then Exit;

  QryExec := nil;
  QryArticle := nil;
  SavedBookmark := nil;

  wDate := FDMemTableAchat.FieldByName('Date_').AsDateTime;

  try
    // Création requêtes temporaires
    QryExec := TFDQuery.Create(nil);
    QryExec.Connection := DMGesCloud.ConnexionGesCloud;

    QryArticle := TFDQuery.Create(nil);
    QryArticle.Connection := DMGesCloud.ConnexionGesCloud;

    FDMemTableLigachjj.DisableControls;
    try
      if not FDMemTableLigachjj.IsEmpty then
        SavedBookmark := FDMemTableLigachjj.GetBookmark;

      // Si exonéré de TVA
      FDMemTableLigachjj.First;
      while not FDMemTableLigachjj.Eof do
      begin
      FDMemTableLigachjj.Edit;

      // Lecture article
      QryArticle.Close;
      QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
      QryArticle.ParamByName('CODART').AsString := FDMemTableLigachjj.FieldByName('CODART').AsString;
      QryArticle.Open;
      FDMemTableLigachjj.FieldByName('NO_TVA').AsInteger := StrToIntDef(StringReplace(QryArticle.FieldByName('TVA').AsString, 'TVA', '', [rfReplaceAll, rfIgnoreCase]), 0);
      pTVA := QryArticle.FieldByName('TVA').AsString;

      FDMemTableLigachjj.FieldByName('TX_TVA').AsFloat := DM_Olivier.fgTxTaxe(wDate,pTVA);

      // Sécurité anti-division par zéro sur la quantité
      AQte := FDMemTableLigachjj.FieldByName('QTE').AsFloat;
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
        FDMemTableLigachjj.FieldByName('PRIXTTC').AsInteger := Round(DM_Olivier.CalculerTTC(FDMemTableLigachjj.FieldByName('PRIXHT').AsFloat, FDMemTableLigachjj.FieldByName('TX_TVA').AsFloat));
        FDMemTableLigachjj.FieldByName('TOTHT').AsFloat := FDMemTableLigachjj.FieldByName('PRIXHT').AsFloat * FDMemTableLigachjj.FieldByName('QTE').AsFloat;
        FDMemTableLigachjj.FieldByName('MT_TVA').AsFloat := (FDMemTableLigachjj.FieldByName('TOTHT').AsFloat / 100) * FDMemTableLigachjj.FieldByName('TX_TVA').AsFloat;
//      end;

      // Arrondis
      FDMemTableLigachjj.FieldByName('PRIXHT').AsFloat := RoundTo(FDMemTableLigachjj.FieldByName('PRIXHT').AsFloat, -2);
      FDMemTableLigachjj.FieldByName('TOTHT').AsFloat := RoundTo(FDMemTableLigachjj.FieldByName('TOTHT').AsFloat, -2);
      FDMemTableLigachjj.FieldByName('MT_TVA').AsFloat := RoundTo(FDMemTableLigachjj.FieldByName('MT_TVA').AsFloat, -2);

      FDMemTableLigachjj.Post;
      FDMemTableLigachjj.Next;
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

      // CAL_EVP - RAZ cumul si lignes pour recalcul
      if FDMemTableLigachjj.RecordCount>0 then
      begin
        FDMemTableAchat.FieldByName('MT_TTC').AsInteger := 0;
        FDMemTableAchat.FieldByName('MT_HT').AsFloat := 0;
        FDMemTableAchat.FieldByName('MT_TVA').AsInteger := 0;
        FDMemTableAchat.FieldByName('MT_REM').AsFloat := 0;
      end;

      wHT0 := 0; wHT0r := 0;
      wHT1 := 0; wHT1r := 0;
      wHT2 := 0; wHT2r := 0;
      wHT3 := 0; wHT3r := 0;
      wHT4 := 0; wHT4r := 0;
      wTVA1 := 0; wTVA2 := 0; wTVA3 := 0; wTVA4 := 0;

      FDMemTableLigachjj.First;
      while not FDMemTableLigachjj.Eof do
      begin
        FDMemTableLigachjj.Edit;

        QryArticle.Close;
        QryArticle.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryArticle.ParamByName('CODART').AsString := FDMemTableLigachjj.FieldByName('CODART').AsString;
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

        FDMemTableAchat.FieldByName('MT_HT').AsFloat := FDMemTableAchat.FieldByName('MT_HT').AsFloat + FDMemTableLigachjj.FieldByName('TOTHT').AsFloat;
        FDMemTableAchat.FieldByName('MT_TVA').AsInteger := FDMemTableAchat.FieldByName('MT_TVA').AsInteger + FDMemTableLigachjj.FieldByName('MT_TVA').AsInteger;

        FDMemTableLigachjj.Post;
        FDMemTableLigachjj.Next;
      end;



      // Arrondis
      FDMemTableAchat.FieldByName('MT_HT').AsFloat := RoundTo(FDMemTableAchat.FieldByName('MT_HT').AsFloat, -2);
      FDMemTableAchat.FieldByName('MT_TTC').AsInteger := Round(FDMemTableAchat.FieldByName('MT_HT').AsFloat + FDMemTableAchat.FieldByName('MT_TVA').AsFloat)


    finally
      try
        if Assigned(SavedBookmark) then
        begin
          if FDMemTableLigachjj.BookmarkValid(SavedBookmark) then
            FDMemTableLigachjj.GotoBookmark(SavedBookmark);
          FDMemTableLigachjj.FreeBookmark(SavedBookmark);
        end;
      except
      end;
      FDMemTableLigachjj.EnableControls;
    end;

  finally
    QryExec.Free;
    QryArticle.Free;
  end;
end;


procedure TFormFicheAchat.ValiderChampPrix(Sender: TField);
begin
  if Sender.IsNull then Exit;

  if Sender.AsFloat < 0 then
  begin
    DatabaseError('⚠ Prix négatif interdit.');
  end;
end;

procedure TFormFicheAchat.CMDialogKey(var Msg: TCMDialogKey);
begin
  //Ctrl+Entree -> Pour valider la fiche
 if (Msg.CharCode = VK_RETURN) and ((GetKeyState(VK_CONTROL) + $8000) <> 0) then
 begin
  if FDMemTableAchat.FieldByName('TOP_').AsString = 'C' then
    Exit;

    BtnValider.Click;
    Msg.Result := 1;
    Exit;
 end;
  // Si le focus est sur la grille et qu'on appuie sur Entrée
 if (ActiveControl = JvDBGridLignes) and (Msg.CharCode = VK_RETURN) then
 begin
  if FDMemTableAchat.FieldByName('TOP_').AsString = 'C' then
    Exit;

  BtnModifierLigne.Click;
  Msg.Result := 1; // Indique que le message a été traité
  Exit;
 end;

  inherited; // Laisse le comportement par défaut pour le reste
end;

end.
