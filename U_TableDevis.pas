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
    BtnTransformer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    JvDBGridEnt_prof: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODDEV: TEdit;
    EdtCherche_NOM: TEdit;
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
    RadioGroupEtat: TRadioGroup;
    BtnSupprimer: TBitBtn;
    BtnOublier: TBitBtn;
    BtnOuvrir: TBitBtn;
    FDQueryEnt_profMT_TSOC: TBCDField;
    procedure CheckBoxToutesFacturesClick(Sender: TObject);
    procedure JvDBGridEnt_profTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CODDEVChange(Sender: TObject);
    procedure EditCherche_SELChange(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure FDQueryEnt_profCalcFields(DataSet: TDataSet);
    procedure BtnImprimerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure CheckBoxNatureClick(Sender: TObject);
    procedure RadioGroupEtatClick(Sender: TObject);
    procedure BtnOublierClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnTransformerClick(Sender: TObject);
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
    FormEnt_prof.Caption := 'Créer un nouveau devis';

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


procedure TFrameTableDevis.BtnOublierClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauType: string;
  CodDevCourant: Integer;
begin
  if FDQueryEnt_prof.IsEmpty then Exit;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'F' then
  begin
    ShowMessage('Opération impossible, devis déjà facturé.');
    Exit;
  end;

  // Récupérer la clé unique du devis courant (suppose que le champ s'appelle CODDEV)
  CodDevCourant := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'D' then
  begin
    if MessageDlg('Oublier le devis ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
    NouveauType := 'O';
  end
  else
  begin
    if MessageDlg('Rappeler le devis ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
    NouveauType := 'D';
  end;

  // Exécution d'un UPDATE direct et ultra-sécurisé par la clé primaire
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEnt_prof.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'UPDATE ent_prof SET TYPE_ = :NOUVEAU_TYPE WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('NOUVEAU_TYPE').AsString := NouveauType;
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

    QryExec.SQL.Text := 'UPDATE lig_prof SET TYPE_ = :NOUVEAU_TYPE WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('NOUVEAU_TYPE').AsString := NouveauType;
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

    // Rafraîchir la vue pour voir le changement instantanément
    FDQueryEnt_prof.Refresh;
    JvDBGridEnt_prof.SetFocus;
  finally
    QryExec.Free;
  end;
end;

procedure TFrameTableDevis.BtnOuvrirClick(Sender: TObject);
var
  NumDevis: Integer;
  Bookmark: TBookmark; // Variable pour mémoriser la position
begin
  if FDQueryEnt_prof.IsEmpty then Exit;

  NumDevis := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;
  FormEnt_prof := TFormEnt_prof.Create(Self, msModification, NumDevis);

  try
    FormEnt_prof.Caption := 'Modifier le devis';

    if FormEnt_prof.ShowModal = mrOk then
    begin
      // 1. On mémorise la position actuelle avant le rafraîchissement
      Bookmark := FDQueryEnt_prof.GetBookmark;
      try
        FDQueryEnt_prof.Refresh;

        // 2. On tente de se reposer sur l'enregistrement mémorisé
        if FDQueryEnt_prof.BookmarkValid(Bookmark) then
          FDQueryEnt_prof.GotoBookmark(Bookmark);
      except
        // Si l'enregistrement a été supprimé entre-temps, on ignore l'erreur
      end;

      // 3. On libère le signet proprement
      FDQueryEnt_prof.FreeBookmark(Bookmark);
    end;
  finally
    FormEnt_prof.Free;
  end;
end;


procedure TFrameTableDevis.BtnSupprimerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauType: string;
  CodDevCourant: Integer;
begin
  if FDQueryEnt_prof.IsEmpty then Exit;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'F' then
  begin
    ShowMessage('Opération impossible, devis déjà facturé.');
    Exit;
  end;

  // Récupérer la clé unique du devis courant
  CodDevCourant := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if MessageDlg('Supprimer le devis ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Exécution d'un DELETE direct DES LIGNES
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEnt_prof.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM lig_prof WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

  finally
    QryExec.Free;
  end;

  // Suivi d'un DELETE direct et ultra-sécurisé par la clé primaire
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEnt_prof.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM ent_prof WHERE CODDEV = :CODDEV';
    QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
    QryExec.ExecSQL;

    // Rafraîchir la vue pour voir le changement instantanément
    FDQueryEnt_prof.Refresh;
    JvDBGridEnt_prof.SetFocus;
  finally
    QryExec.Free;
  end;
end;


procedure TFrameTableDevis.BtnTransformerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  Qrylig_prof: TFDQuery;
  NumFacture: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;
  wTotregl: Integer;
  WAnnuleSaisie: Boolean;
  CodDevCourant: Integer;

begin

  if FDQueryEnt_prof.IsEmpty then Exit;

  if FDQueryEnt_prof.FieldByName('TYPE_').AsString = 'F' then
  begin
    ShowMessage('Opération impossible, devis déjà facturé.');
    Exit;
  end;

  // Récupérer la clé unique du devis courant
  CodDevCourant := FDQueryEnt_prof.FieldByName('CODDEV').AsInteger;

  if MessageDlg('Transformer le devis ' + IntToStr(CodDevCourant) + ' en facture ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
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
  Qrylig_prof := TFDQuery.Create(nil);

  try
    Screen.Cursor := crHourGlass; // Change le curseur en sablier

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;
    Qrylig_prof.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la TRANSACTION MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      // ==========================================
      // ENREGISTREMENT DE L'EN-TÊTE
      // ==========================================
      // Incrementation numero de facture + 1 dans chrono
      QryExec.SQL.Text := 'UPDATE chrono set CHRONO=CHRONO+1 WHERE PREFIX=:PREFIX';
      QryExec.ParamByName('PREFIX').AsString := 'FAC01';
      QryExec.ExecSQL;
      QryExec.Close;
      //Recuperation nouveau numero chrono
      QryExec.SQL.Text := 'SELECT * FROM chrono WHERE PREFIX=:PREFIX';
      QryExec.ParamByName('PREFIX').AsString := 'FAC01';
      QryExec.Open;
      NumFacture := QryExec.FieldByName('CHRONO').AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

      // Appel de la procédure mutualisée
      QryExec.close;
      DM_Olivier.ExecuterInsertionEntVteJJ(FDQueryEnt_prof, QryExec, CodDevCourant, NumFacture);


      QryExec.Close;

      // Parcours de la table mémoire des lignes
      Qrylig_prof.SQL.Text := 'SELECT * FROM lig_prof WHERE CODDEV=:CODDEV';
      Qrylig_prof.ParamByName('CODDEV').AsInteger := CodDevCourant;
      Qrylig_prof.Open;
      Qrylig_prof.First;
      while not Qrylig_prof.Eof do
      begin
        //Génération du mouvement de stock associé a la ligne
        VNoEnrStock :=0;
        //Controle si article géré en stock
        QryExec.Close;
        QryExec.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
        QryExec.ParamByName('CODART').AsString :=Qrylig_prof.FieldByName('CODART').AsString;
        QryExec.Open;
        if QryExec.FieldByName('G_STO').AsInteger=1 then
        begin
           //Creation par securite du stodep
           QryExec2.Close;
           QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                            'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
           QryExec2.ParamByName('CODART').AsString :=Qrylig_prof.FieldByName('CODART').AsString;
           QryExec2.ParamByName('CODDEP').AsInteger :=FDQueryEnt_prof.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('PMP').AsFloat :=QryExec.FieldByName('PMP').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString :=QryExec.FieldByName('CODFOU').AsString;
           QryExec2.ExecSQL;

           //Insertion stock
           QryExec2.Close;
           //     ShowMessage(Qrylig_prof.FieldByName('CODART').AsString);
           QryExec2.SQL.Text := 'INSERT INTO stock (CODART, DATE_, ANNEE, MOIS, TYPE_, QTE, VALUNIT, PRIXVTE, CODDEP, CENTRA, LIBELLE, CODFOU, TIME, CODFAC) ' +
                            'VALUES (:CODART, :DATE_, :ANNEE, :MOIS, :TYPE_, :QTE, :VALUNIT, :PRIXVTE, :CODDEP, :CENTRA, :LIBELLE, :CODFOU, :TIME, :CODFAC)';
           QryExec2.ParamByName('CODFAC').AsInteger := NumFacture;
           QryExec2.ParamByName('CODART').AsString := Qrylig_prof.FieldByName('CODART').AsString;
           QryExec2.ParamByName('QTE').AsFloat := -Qrylig_prof.FieldByName('QTE').AsFloat;
           QryExec2.ParamByName('PRIXVTE').AsFloat := Qrylig_prof.FieldByName('PRIXNET').AsFloat;
           QryExec2.ParamByName('VALUNIT').AsFloat := Qrylig_prof.FieldByName('PRIXREV').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := Qrylig_prof.FieldByName('CODFOU').AsString;
           QryExec2.ParamByName('DATE_').AsDateTime := Now;
           QryExec2.ParamByName('ANNEE').AsInteger := Qrylig_prof.FieldByName('ANNEE').AsInteger;
           QryExec2.ParamByName('MOIS').AsInteger := Qrylig_prof.FieldByName('MOIS').AsInteger;
           QryExec2.ParamByName('CODDEP').AsInteger := FDQueryEnt_prof.FieldByName('CODDEP').AsInteger;
           QryExec2.ParamByName('CENTRA').AsString := 'C';
           QryExec2.ParamByName('LIBELLE').AsString := 'Facture DELPHI n°' + IntToStr(NumFacture);
           QryExec2.ParamByName('TYPE_').AsString := 'V';
           QryExec2.ParamByName('TIME').AsInteger := ResultHeure;
           QryExec2.ExecSQL;

           // 2. Récupération du NOENR tout juste généré par MySQL pour la table stock
           QryExec2.Close;
           QryExec2.SQL.Text := 'SELECT LAST_INSERT_ID()';
           QryExec2.Open;
           VNoEnrStock := QryExec2.Fields[0].AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

           //On recalcul le stock du depot et de l'article
           DM_Olivier.RecalculerStockStodep(Qrylig_prof.FieldByName('CODART').AsString, FDQueryEnt_prof.FieldByName('CODDEP').AsInteger);

        end;


        QryExec.Close;

        //Insertion ligvtejj par appel de la procédure mutualisée pour chaque ligne
        DM_Olivier.ExecuterInsertionLigVteJJ(Qrylig_prof, QryExec, CodDevCourant, NumFacture, VNoEnrStock);

        //Lecture ligne memoire suivante
        Qrylig_prof.Next;
      end;

      // Mise a jour TYPE_ Facturé
      QryExec.SQL.Text := 'UPDATE ent_prof SET TYPE_ = ''F'', CODFAC = :CODFAC WHERE CODDEV = :CODDEV';
      QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
      QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
      QryExec.ExecSQL;

      QryExec.SQL.Text := 'UPDATE lig_prof SET TYPE_ = ''F'', CODFAC = :CODFAC WHERE CODDEV = :CODDEV';
      QryExec.ParamByName('CODDEV').AsInteger := CodDevCourant;
      QryExec.ParamByName('CODFAC').AsInteger := NumFacture;
      QryExec.ExecSQL;

      // TRANSACTION: Si tout s'est déroulé sans erreur, on valide définitivement dans MySQL
      DMGesCloud.ConnexionGesCloud.Commit;

    except
      on E: Exception do
      begin
        // TRANSACTION: En cas d'erreur, on annule tout (ni l'en-tête ni les lignes ne sont modifiés)
        DMGesCloud.ConnexionGesCloud.Rollback;
        ShowMessage('Erreur lors de l''enregistrement : ' + E.Message);;
      end;
    end;
  finally
    QryExec.Free;
    QryExec2.Free;
    Qrylig_prof.Free;

    FDQueryEnt_prof.Refresh;

    Screen.Cursor := crDefault; // Restaure le curseur normal
  end;
end;


procedure TFrameTableDevis.CheckBoxNatureClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;

procedure TFrameTableDevis.CheckBoxToutesFacturesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;


procedure TFrameTableDevis.AppliquerFiltreMaitre;
var
  FiltreNature, FiltreCaisse: string;
begin
  // On rafraîchit la requête si modifiée entre temps
  FDQueryEnt_prof.Refresh;

  // 1. Définition du filtre selon l'option sélectionnée dans le TRadioGroup
  // ItemIndex 0 = F (Facturés), 1 = D (Non facturés), 2 = O (Oubliés)
  case RadioGroupEtat.ItemIndex of
    0:
    begin
      FiltreNature := '(type_ = ''F'')';
      BtnOublier.Caption:='Oublier';
      BtnOublier.Enabled:=False;
      BtnSupprimer.Enabled:=False;
    end;
    1:
    begin
      FiltreNature := '(type_ = ''D'')';
      BtnOublier.Caption:='Oublier';
      BtnOublier.Enabled:=True;
      BtnSupprimer.Enabled:=True;
    end;
    2:
    begin
      FiltreNature := '(type_ = ''O'')';
      BtnOublier.Caption:='Rappeler';
      BtnOublier.Enabled:=True;
      BtnSupprimer.Enabled:=True;
    end
  else
    FiltreNature := '(1=1)'; // Par sécurité si rien n'est sélectionné
    BtnOublier.Caption:='Oublier';
    BtnOublier.Enabled:=True;
    BtnSupprimer.Enabled:=True;
  end;

  // 2. Définition du filtre sur la caisse
  if CheckBoxToutesFactures.Checked then
    FiltreCaisse := '(codcai <> ''ZZ'')'
  else
    FiltreCaisse := '(codcai = ' + QuotedStr(DM_Olivier.Gcodcai) + ')';

  // 3. On combine l'ensemble avec "and" (en minuscules) et des parenthèses
  FDQueryEnt_prof.Filter := FiltreNature + ' and ' + FiltreCaisse;
  FDQueryEnt_prof.Filtered := True;
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

procedure TFrameTableDevis.EdtCherche_CODDEVChange(Sender: TObject);
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

procedure TFrameTableDevis.RadioGroupEtatClick(Sender: TObject);
begin
  AppliquerFiltreMaitre();
end;

end.
