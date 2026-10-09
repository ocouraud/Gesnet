unit U_TableEntcde_cli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  RzTabs, RzPanel, RzRadGrp,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrameTableEntcde_cli = class(TFrame)
    FDQueryEntcde_cli: TFDQuery;
    DSEntcde_cli: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_NOCDE: TEdit;
    EdtCherche_NOMCLI: TEdit;
    EditCherche_DATE_: TEdit;
    EditCherche_CODCLI: TEdit;
    RadioGroupEtat: TRadioGroup;
    Panel2: TPanel;
    BtnTransformer: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    BtnImprimer: TButton;
    BtnAjouter: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnDupliquer: TBitBtn;
    FDQueryEntcde_cliNOCDE: TIntegerField;
    FDQueryEntcde_cliREFERENCE_: TStringField;
    FDQueryEntcde_cliCODCLI: TStringField;
    FDQueryEntcde_cliNOMCLI: TStringField;
    FDQueryEntcde_cliDATE_: TDateField;
    FDQueryEntcde_cliTOTHT: TBCDField;
    FDQueryEntcde_cliMT_TVA: TBCDField;
    FDQueryEntcde_cliMT_TTC: TIntegerField;
    FDQueryEntcde_cliSTATUT: TSmallintField;
    FDQueryEntcde_cliOBSERV: TStringField;
    FDQueryEntcde_cliDATE_VALID: TDateField;
    FDQueryEntcde_cliDER_MODIF: TSQLTimeStampField;
    FDQueryEntcde_cliDATE_LIVR: TDateField;
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure RadioGroupEtatClick(Sender: TObject);
    procedure EdtCherche_NOCDEChange(Sender: TObject);
    procedure EditCherche_CODCLIChange(Sender: TObject);
    procedure EdtCherche_NOMCLIChange(Sender: TObject);
    procedure EditCherche_DATE_Change(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure BtnTransformerClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure AppliquerFiltreMaitre;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule, U_OutilsGrille, U_FormAide, U_FicheEntcde_cli;

procedure TFrameTableEntcde_cli.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('entcde_cli_liste.html');
end;

procedure TFrameTableEntcde_cli.BtnAjouterClick(Sender: TObject);
begin
  // On crée la fiche en passant le mode Création et le numéro 0 pour nouveau
  FormFicheEntcde_cli := TFormFicheEntcde_cli.Create(Self, msAjout, 0);
  try
    FormFicheEntcde_cli.Caption := 'Créer une nouvelle commande';

    if FormFicheEntcde_cli.ShowModal = mrOk then
    begin
      // La validation a réussi (INSERT en base effectué), on rafraîchit la liste
      FDQueryEntcde_cli.Refresh;

      // Se positionner sur la nouvelle facture créée dans la grille
      if not FDQueryEntcde_cli.IsEmpty then
        FDQueryEntcde_cli.Locate('NOCDE', FormFicheEntcde_cli.NocdeCree, []);
    end;
  finally
    FormFicheEntcde_cli.Free;
  end;
end;

procedure TFrameTableEntcde_cli.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableEntcde_cli.BtnOuvrirClick(Sender: TObject);
var
  Nocde: Integer;
begin
  if FDQueryEntcde_cli.IsEmpty then Exit;

  Nocde := FDQueryEntcde_cli.FieldByName('NOCDE').AsInteger;
  FormFicheEntcde_cli := TFormFicheEntcde_cli.Create(Self, msModification, Nocde);

  try
    FormFicheEntcde_cli.Caption := 'Modifier la commande';

    if FormFicheEntcde_cli.ShowModal = mrOk then
    begin
      // 1. On recharge les données de la table
      FDQueryEntcde_cli.Refresh;

      // 2. On se repositionne proprement sur le devis modifié grâce à sa clé unique
      if not FDQueryEntcde_cli.Locate('NOCDE', Nocde, []) then
      begin
        // Optionnel : si la commande a changé de filtre ou n'est plus visible,
        // Locate renvoie false, gérer un repli si nécessaire.
      end;
    end;
  finally
    FormFicheEntcde_cli.Free;
  end;

end;

procedure TFrameTableEntcde_cli.BtnSupprimerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  NouveauType: string;
  NoCdeCourant: Integer;
begin
  if FDQueryEntcde_cli.IsEmpty then Exit;

  if FDQueryEntcde_cli.FieldByName('TYPE_').AsString = 'F' then
  begin
    ShowMessage('Opération impossible, commande déjà facturée.');
    Exit;
  end;

  // Récupérer la clé unique du devis courant
  NoCdeCourant := FDQueryEntcde_cli.FieldByName('NOCDE').AsInteger;

  if MessageDlg('Supprimer la commande ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Exécution d'un DELETE direct DES LIGNES
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEntcde_cli.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM ligcde_cli WHERE NOCDE = :NOCDE';
    QryExec.ParamByName('NOCDE').AsInteger := NoCdeCourant;
    QryExec.ExecSQL;

  finally
    QryExec.Free;
  end;

  // Suivi d'un DELETE direct et ultra-sécurisé par la clé primaire
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryEntcde_cli.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'DELETE FROM ent_prof WHERE NOCDE = :NOCDE';
    QryExec.ParamByName('NOCDE').AsInteger := NoCdeCourant;
    QryExec.ExecSQL;

    // Rafraîchir la vue pour voir le changement instantanément
    FDQueryEntcde_cli.Refresh;
    JvDBGrid1.SetFocus;
  finally
    QryExec.Free;
  end;


end;

procedure TFrameTableEntcde_cli.BtnTransformerClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExec2: TFDQuery;
  Qrylig: TFDQuery;
  Qrycli: TFDQuery;
  Qryart: TFDQuery;

  NumFacture: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;
  wTotregl: Integer;
  WAnnuleSaisie: Boolean;
  CodCdeCourant: Integer;

begin

  if FDQueryEntcde_cli.IsEmpty then Exit;

  if FDQueryEntcde_cli.FieldByName('STATUT').AsInteger = 2 then
  begin
    ShowMessage('Opération impossible, commande déjà facturée.');
    Exit;
  end;

  // Récupérer la clé unique de la commande
  CodCdeCourant := FDQueryEntcde_cli.FieldByName('NOCDE').AsInteger;

  if MessageDlg('Transformer la commande ' + IntToStr(CodCdeCourant) + ' en facture ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
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
  Qrycli := TFDQuery.Create(nil);
  Qryart := TFDQuery.Create(nil);

  try
    Screen.Cursor := crHourGlass; // Change le curseur en sablier

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;
    Qrylig.Connection := DMGesCloud.ConnexionGesCloud;
    Qrycli.Connection := DMGesCloud.ConnexionGesCloud;
    Qryart.Connection := DMGesCloud.ConnexionGesCloud;

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

      //Lecture client
      Qrycli.SQL.Text := 'SELECT * FROM client WHERE CODCLI=:CODCLI';
      Qrycli.ParamByName('CODCLI').AsInteger := FDQueryEntcde_cli.FieldByName('CODCLI').AsInteger;
      Qrycli.Open;

      //Ecriture entvtejj
      QryExec.close;
      QryExec.SQL.Text :=
        'INSERT INTO `entvtejj` (' +
        '`OBSERV`, `CODFAC`, `TOP_`, `CODCLI`, `CODCAI`, `CODDEV`, `CODDEP`, `CODVEN`, `NOM`, `NOTAHITI`, ' +
        '`TYPE_`, `EXO_TVA`, `ANNEE`, `MOIS`, `DATE_`, `HEURE`, `PRC_REMISE`, `MT_REMISE`, `TOTHT`, `MT_TTC`, ' +
        '`MT_HT0`, `MT_HT1`, `MT_HT2`, `MT_HT3`, `MT_TVA1`, `MT_TVA2`, `MT_TVA3`, `MT_TVA`, `MARGE`, `REFERENCE_`, ' +
        '`CODREP`, `NO_SEM`, `NO_JOUR`, `REGL`, `CODPAI`, `JRSCRD`, `FIN_MOIS`, `LIBREG`, `CRD_FORCE`, `date_ech`, ' +
        '`ACOMPTE`, `CODGEO`, `FLAG_TAX`, `SEL`, `DER_MODIF`, `NOMVEN`, `MT_TSOC`, `MT_HTSOC`, `TX_TSOC`, `EXO_CPS`, ' +
        '`MT_TVAI`, `MT_HTI`, `TVA_ILES`) VALUES (' +
        ':OBSERV, :CODFAC, :TOP_, :CODCLI, :CODCAI, :CODDEV, :CODDEP, :CODVEN, :NOM, :NOTAHITI, ' +
        ':TYPE_, :EXO_TVA, :ANNEE, :MOIS, :DATE_, :HEURE, :PRC_REMISE, :MT_REMISE, :TOTHT, :MT_TTC, ' +
        ':MT_HT0, :MT_HT1, :MT_HT2, :MT_HT3, :MT_TVA1, :MT_TVA2, :MT_TVA3, :MT_TVA, :MARGE, :REFERENCE_, ' +
        ':CODREP, :NO_SEM, :NO_JOUR, :REGL, :CODPAI, :JRSCRD, :FIN_MOIS, :LIBREG, :CRD_FORCE, :date_ech, ' +
        ':ACOMPTE, :CODGEO, :FLAG_TAX, :SEL, CURRENT_TIMESTAMP, :NOMVEN, :MT_TSOC, :MT_HTSOC, :TX_TSOC, :EXO_CPS, ' +
        ':MT_TVAI, :MT_HTI, :TVA_ILES)';

      // Affectation des paramètres depuis la source
      QryExec.ParamByName('OBSERV').AsString      := FDQueryEntcde_cli.FieldByName('OBSERV').AsString;
      QryExec.ParamByName('CODFAC').AsInteger     := NumFacture;
      QryExec.ParamByName('TOP_').AsString        := 'S';
      QryExec.ParamByName('CODCLI').AsInteger     := FDQueryEntcde_cli.FieldByName('CODCLI').AsInteger;
      QryExec.ParamByName('CODCAI').AsString      := DM_Olivier.gCodCai;
      QryExec.ParamByName('CODDEV').AsInteger     := 0;
      QryExec.ParamByName('CODDEP').AsInteger     := DM_Olivier.gCoddep_defaut;
      QryExec.ParamByName('CODVEN').AsInteger     := DMGesCloud.gCodven_defaut;
      QryExec.ParamByName('NOM').AsString         := FDQueryEntcde_cli.FieldByName('NOMCLI').AsString;
      QryExec.ParamByName('NOTAHITI').AsString    := Qrycli.FieldByName('NOTAHITI').AsString;
      QryExec.ParamByName('TYPE_').AsString       := 'F';
      QryExec.ParamByName('EXO_TVA').AsInteger    := Qrycli.FieldByName('EXO_TVA').AsInteger;
      QryExec.ParamByName('ANNEE').AsInteger      := CurrentYear;
      QryExec.ParamByName('MOIS').AsInteger       := Strtoint(FormatDateTime('mm', Now));
      QryExec.ParamByName('DATE_').AsDateTime     := Now;
      QryExec.ParamByName('HEURE').AsInteger      := Round(Time * 8640000); //.AsInteger;
      QryExec.ParamByName('PRC_REMISE').AsFloat   := 0; //Qrycli.FieldByName('PRC_REMISE').AsFloat;
      QryExec.ParamByName('MT_REMISE').AsFloat    := 0;  //FDQueryEntcde_cli.FieldByName('MT_REMISE').AsFloat;
      QryExec.ParamByName('TOTHT').AsFloat        := FDQueryEntcde_cli.FieldByName('TOTHT').AsFloat;
      QryExec.ParamByName('MT_TTC').AsInteger     := FDQueryEntcde_cli.FieldByName('MT_TTC').AsInteger;
      QryExec.ParamByName('MT_HT0').AsFloat       := 0; //FDQueryEntcde_cli.FieldByName('MT_HT0').AsFloat;
      QryExec.ParamByName('MT_HT1').AsFloat       := 0; //FDQueryEntcde_cli.FieldByName('MT_HT1').AsFloat;
      QryExec.ParamByName('MT_HT2').AsFloat       := 0; //FDQueryEntcde_cli.FieldByName('MT_HT2').AsFloat;
      QryExec.ParamByName('MT_HT3').AsFloat       := 0; //FDQueryEntcde_cli.FieldByName('MT_HT3').AsFloat;
      QryExec.ParamByName('MT_TVA1').AsFloat      := 0; //FDQueryEntcde_cli.FieldByName('MT_TVA1').AsFloat;
      QryExec.ParamByName('MT_TVA2').AsFloat      := 0; //FDQueryEntcde_cli.FieldByName('MT_TVA2').AsFloat;
      QryExec.ParamByName('MT_TVA3').AsFloat      := 0; //FDQueryEntcde_cli.FieldByName('MT_TVA3').AsFloat;
      QryExec.ParamByName('MT_TVA').AsFloat       := 0; //FDQueryEntcde_cli.FieldByName('MT_TVA').AsFloat;
      QryExec.ParamByName('MARGE').AsFloat        := 0; //FDQueryEntcde_cli.FieldByName('MARGE').AsFloat;
      QryExec.ParamByName('REFERENCE_').AsString  := FDQueryEntcde_cli.FieldByName('REFERENCE_').AsString;
      QryExec.ParamByName('CODREP').AsInteger     := 0; //FDQueryEntcde_cli.FieldByName('CODREP').AsInteger;
      QryExec.ParamByName('NO_SEM').AsInteger     := 0; //FDQueryEntcde_cli.FieldByName('NO_SEM').AsInteger;
      QryExec.ParamByName('NO_JOUR').AsInteger    := 0; //FDQueryEntcde_cli.FieldByName('NO_JOUR').AsInteger;
      QryExec.ParamByName('REGL').AsInteger       := 0; //FDQueryEntcde_cli.FieldByName('REGL').AsInteger;
      QryExec.ParamByName('CODPAI').AsString      := ''; //FDQueryEntcde_cli.FieldByName('CODPAI').AsString;
      QryExec.ParamByName('JRSCRD').AsInteger     := 0; //FDQueryEntcde_cli.FieldByName('JRSCRD').AsInteger;
      QryExec.ParamByName('FIN_MOIS').AsInteger   := 0; //FDQueryEntcde_cli.FieldByName('FIN_MOIS').AsInteger;
      QryExec.ParamByName('LIBREG').AsString      := ''; //FDQueryEntcde_cli.FieldByName('LIBREG').AsString;
      QryExec.ParamByName('CRD_FORCE').AsInteger  := 0; //FDQueryEntcde_cli.FieldByName('CRD_FORCE').AsInteger;
      QryExec.ParamByName('date_ech').AsDateTime  := Now; //FDQueryEntcde_cli.FieldByName('date_ech').AsDateTime;
      QryExec.ParamByName('ACOMPTE').AsInteger    := 0;
      QryExec.ParamByName('CODGEO').AsString      := Qrycli.FieldByName('CODGEO').AsString;
      QryExec.ParamByName('FLAG_TAX').AsInteger   := Qrycli.FieldByName('FLAG_TAX').AsInteger;
      QryExec.ParamByName('SEL').AsInteger        := 0;
      QryExec.ParamByName('NOMVEN').AsString      := DMGesCloud.LoggedUser;
      QryExec.ParamByName('MT_TSOC').AsFloat      := 0; //FDQueryEntcde_cli.FieldByName('MT_TSOC').AsFloat;
      QryExec.ParamByName('MT_HTSOC').AsFloat     := 0; //FDQueryEntcde_cli.FieldByName('MT_HTSOC').AsFloat;
      QryExec.ParamByName('TX_TSOC').AsFloat      := 0; //FDQueryEntcde_cli.FieldByName('TX_TSOC').AsFloat;
      QryExec.ParamByName('EXO_CPS').AsInteger    := Qrycli.FieldByName('EXO_CPS').AsInteger;
      QryExec.ParamByName('MT_TVAI').AsFloat      := 0; //FDQueryEntcde_cli.FieldByName('MT_TVAI').AsFloat;
      QryExec.ParamByName('MT_HTI').AsFloat       := 0; //FDQueryEntcde_cli.FieldByName('MT_HTI').AsFloat;
      QryExec.ParamByName('TVA_ILES').AsBoolean   := Qrycli.FieldByName('TVA_ILES').AsBoolean;

      // Exécution finale
      QryExec.ExecSQL;
      QryExec.Close;

      // Parcours de la table mémoire des lignes
      Qrylig.SQL.Text := 'SELECT * FROM ligcde_cli WHERE NOCDE=:NOCDE';
      Qrylig.ParamByName('NOCDE').AsInteger := CodCdeCourant;
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
           //Creation par securite du stodep
           QryExec2.Close;
           QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                            'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
           QryExec2.ParamByName('CODART').AsString :=Qrylig.FieldByName('CODART').AsString;
           QryExec2.ParamByName('CODDEP').AsInteger :=DM_Olivier.gCoddep_defaut;
           QryExec2.ParamByName('PMP').AsFloat :=Qryart.FieldByName('PMP').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString :=Qryart.FieldByName('CODFOU').AsString;
           QryExec2.ExecSQL;

           //Insertion stock
           QryExec2.Close;
           //     ShowMessage(Qrylig_prof.FieldByName('CODART').AsString);
           QryExec2.SQL.Text := 'INSERT INTO stock (CODART, DATE_, ANNEE, MOIS, TYPE_, QTE, VALUNIT, PRIXVTE, CODDEP, CENTRA, LIBELLE, CODFOU, TIME, CODFAC) ' +
                            'VALUES (:CODART, :DATE_, :ANNEE, :MOIS, :TYPE_, :QTE, :VALUNIT, :PRIXVTE, :CODDEP, :CENTRA, :LIBELLE, :CODFOU, :TIME, :CODFAC)';
           QryExec2.ParamByName('CODFAC').AsInteger := NumFacture;
           QryExec2.ParamByName('CODART').AsString := Qrylig.FieldByName('CODART').AsString;
           QryExec2.ParamByName('QTE').AsFloat := -Qrylig.FieldByName('QTE').AsFloat;
           QryExec2.ParamByName('PRIXVTE').AsFloat := Qrylig.FieldByName('PRIXHT').AsFloat;
           QryExec2.ParamByName('VALUNIT').AsFloat := Qryart.FieldByName('PMP').AsFloat;
           QryExec2.ParamByName('CODFOU').AsString := Qryart.FieldByName('CODFOU').AsString;
           QryExec2.ParamByName('DATE_').AsDateTime := Now;
           QryExec2.ParamByName('ANNEE').AsInteger := CurrentYear;
           QryExec2.ParamByName('MOIS').AsInteger := Strtoint(FormatDateTime('mm', Now));
           QryExec2.ParamByName('CODDEP').AsInteger := DM_Olivier.gCoddep_defaut;
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
           DM_Olivier.RecalculerStockStodep(Qrylig.FieldByName('CODART').AsString, DM_Olivier.gCoddep_defaut);

        end;


        QryExec.Close;

        //Insertion ligvtejj par appel de la procédure mutualisée pour chaque ligne
        //DM_Olivier.ExecuterInsertionLigVteJJ(Qrylig, QryExec, CodCdeCourant, NumFacture, VNoEnrStock);
        QryExec.SQL.Text :=
          'INSERT INTO `ligvtejj` (' +
          '`LIBELLE`, `CODFAC`, `CODCLI`, `CODCAI`, `CODDEV`, `CODDEP`, `NOENR`, `ANNEE`, `MOIS`, `CODREP`, ' +
          '`CODFOU`, `CODSSF`, `CODFAM`, `CODDPT`, `TYPE_`, `CODART`, `CODBAR`, `QTE`, `POIDS`, `CODTAR`, ' +
          '`PRIXHT`, `PRIXTTC`, `PRIXNET`, `TOTHT`, `MT_TTC`, `PRC_REMISE`, `MT_REMISE`, `TX_TVA`, `MT_TVA`, `NO_TVA`, ' +
          '`PRIXREV`, `MARGE`, `NO_SEM`, `NO_JOUR`, `DET_PPT`, `DET_ILE`, `PXLVTTC`, `DER_MODIF`, `TX_TSOC`, `MT_TSOC`) VALUES (' +
          ':LIBELLE, :CODFAC, :CODCLI, :CODCAI, :CODDEV, :CODDEP, :NOENR, :ANNEE, :MOIS, :CODREP, ' +
          ':CODFOU, :CODSSF, :CODFAM, :CODDPT, :TYPE_, :CODART, :CODBAR, :QTE, :POIDS, :CODTAR, ' +
          ':PRIXHT, :PRIXTTC, :PRIXNET, :TOTHT, :MT_TTC, :PRC_REMISE, :MT_REMISE, :TX_TVA, :MT_TVA, :NO_TVA, ' +
          ':PRIXREV, :MARGE, :NO_SEM, :NO_JOUR, :DET_PPT, :DET_ILE, :PXLVTTC, CURRENT_TIMESTAMP, :TX_TSOC, :MT_TSOC)';

        // Assignation directe des valeurs depuis la source des lignes
        QryExec.ParamByName('LIBELLE').AsString     := Qrylig.FieldByName('LIBELLE').AsString;
        QryExec.ParamByName('CODFAC').AsInteger     := NumFacture;
        QryExec.ParamByName('CODCLI').AsInteger     := Qrylig.FieldByName('CODCLI').AsInteger;
        QryExec.ParamByName('CODCAI').AsString      := DM_Olivier.gCodCai;
        QryExec.ParamByName('CODDEV').AsInteger     := 0; //ACoddev;
        QryExec.ParamByName('CODDEP').AsInteger     := DM_Olivier.gCoddep_defaut;
        QryExec.ParamByName('NOENR').AsInteger      := VNoEnrStock;
        QryExec.ParamByName('ANNEE').AsInteger      := CurrentYear;
        QryExec.ParamByName('MOIS').AsInteger       := Strtoint(FormatDateTime('mm', Now));
        QryExec.ParamByName('CODREP').AsInteger     := Qrycli.FieldByName('CODREP').AsInteger;
        QryExec.ParamByName('CODFOU').AsString      := Qryart.FieldByName('CODFOU').AsString;
        QryExec.ParamByName('CODSSF').AsString      := Qryart.FieldByName('CODSSF').AsString;
        QryExec.ParamByName('CODFAM').AsString      := Qryart.FieldByName('CODFAM').AsString;
        QryExec.ParamByName('CODDPT').AsString      := Qryart.FieldByName('CODDPT').AsString;
        QryExec.ParamByName('TYPE_').AsString       := 'S';
        QryExec.ParamByName('CODART').AsString      := Qrylig.FieldByName('CODART').AsString;
        QryExec.ParamByName('CODBAR').AsString      := Qrylig.FieldByName('CODART').AsString;
        QryExec.ParamByName('QTE').AsFloat          := Qrylig.FieldByName('QTE').AsFloat;
        QryExec.ParamByName('POIDS').AsFloat        := 0;
        QryExec.ParamByName('CODTAR').AsString      := '';  //ASource.FieldByName('CODTAR').AsString;
        QryExec.ParamByName('PRIXHT').AsFloat       := Qrylig.FieldByName('PRIXHT').AsFloat;
        QryExec.ParamByName('PRIXTTC').AsInteger    := Qrylig.FieldByName('PRIXTTC').AsInteger;
        QryExec.ParamByName('PRIXNET').AsFloat      := Qrylig.FieldByName('PRIXHT').AsFloat;
        QryExec.ParamByName('TOTHT').AsFloat        := Qrylig.FieldByName('TOTHT').AsFloat;
        QryExec.ParamByName('MT_TTC').AsInteger     := Qrylig.FieldByName('MT_TTC').AsInteger;
        QryExec.ParamByName('PRC_REMISE').AsFloat   := 0;  //Qrycli.FieldByName('PRC_REMISE').AsFloat;
        QryExec.ParamByName('MT_REMISE').AsFloat    := 0;  //ASource.FieldByName('MT_REMISE').AsFloat;
        QryExec.ParamByName('TX_TVA').AsFloat       := Qrylig.FieldByName('TX_TVA').AsFloat;
        QryExec.ParamByName('MT_TVA').AsFloat       := Qrylig.FieldByName('MT_TVA').AsFloat;
        QryExec.ParamByName('NO_TVA').AsInteger     := StrToInt(Qryart.FieldByName('TVA').AsString[Length(Qryart.FieldByName('TVA').AsString)]);
        QryExec.ParamByName('PRIXREV').AsFloat      := Qryart.FieldByName('PMP').AsFloat;
        QryExec.ParamByName('MARGE').AsFloat        := 0; //ASource.FieldByName('MARGE').AsFloat;
        QryExec.ParamByName('NO_SEM').AsInteger     := 0; //ASource.FieldByName('NO_SEM').AsInteger;
        QryExec.ParamByName('NO_JOUR').AsInteger    := 0; //ASource.FieldByName('NO_JOUR').AsInteger;
        QryExec.ParamByName('DET_PPT').AsFloat      := 0; //ASource.FieldByName('DET_PPT').AsFloat;
        QryExec.ParamByName('DET_ILE').AsFloat      := 0; //ASource.FieldByName('DET_ILE').AsFloat;
        QryExec.ParamByName('PXLVTTC').AsInteger    := 0;
        QryExec.ParamByName('TX_TSOC').AsFloat      := 0; //ASource.FieldByName('TX_TSOC').AsFloat;;
        QryExec.ParamByName('MT_TSOC').AsFloat      := 0; //ASource.FieldByName('MT_TSOC').AsFloat;;

        QryExec.ExecSQL;

        //Lecture ligne memoire suivante
        Qrylig.Next;
      end;

      // Mise a jour TYPE_ Facturé
      QryExec.SQL.Text := 'UPDATE entcde_cli SET STATUT = 2, DATE_VALID = SYSDATE() WHERE NOCDE = :NOCDE';
      QryExec.ParamByName('NOCDE').AsInteger := CodCdeCourant;
      QryExec.ExecSQL;

      QryExec.SQL.Text := 'UPDATE ligcde_cli SET DATE_VALID = SYSDATE() WHERE NOCDE = :NOCDE';
      QryExec.ParamByName('NOCDE').AsInteger := CodCdeCourant;
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
    Qrycli.Free;
    Qryart.Free;

    FDQueryEntcde_cli.Refresh;
    AppliquerFiltreMaitre;

    Screen.Cursor := crDefault; // Restaure le curseur normal
  end;
end;

constructor TFrameTableEntcde_cli.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  FDQueryEntcde_cli.Close;
  FDQueryEntcde_cli.Open;

  RadioGroupEtat.ItemIndex:=0;
  AppliquerFiltreMaitre;

  // FORMATAGE AFFICHAGE NUMERIQUE
  TNumericField(FDQueryEntcde_cli.FieldByName('TOTHT')).DisplayFormat := '#,##0.00';
  TNumericField(FDQueryEntcde_cli.FieldByName('MT_TTC')).DisplayFormat := '#,##0';


end;

procedure TFrameTableEntcde_cli.EditCherche_CODCLIChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde_cli);
end;

procedure TFrameTableEntcde_cli.EditCherche_DATE_Change(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde_cli);
end;

procedure TFrameTableEntcde_cli.EdtCherche_NOCDEChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde_cli);
end;

procedure TFrameTableEntcde_cli.EdtCherche_NOMCLIChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryEntcde_cli);
end;

procedure TFrameTableEntcde_cli.FrameResize(Sender: TObject);
begin
  // On force le bouton Fermer à se caler tout à droite du Panel2
  // (Largeur du Panel - Largeur du bouton - Marge de 10 pixels)
  BtnFermer.Left := Panel2.ClientWidth - BtnFermer.Width - 5;

  // On cale le bouton Aide juste à gauche du bouton Fermer
  BtnAide.Left := Panel2.ClientWidth - BtnAide.Width - 5;
end;

procedure TFrameTableEntcde_cli.AppliquerFiltreMaitre;
var
  FiltreNature: string;
begin
  // On rafraîchit la requête si modifiée entre temps
  FDQueryEntcde_cli.Refresh;

  // 1. Définition du filtre selon l'option sélectionnée dans le TRadioGroup
  // ItemIndex 0 = F (Facturés), 1 = D (Non facturés), 2 = O (Oubliés)
  case RadioGroupEtat.ItemIndex of
    0:
    begin
      FiltreNature := '(statut = 1)';
      BtnSupprimer.Enabled:=True;
      BtnTransformer.Enabled:=True;
    end;
    1:
    begin
      FiltreNature := '(statut = 2)';
      BtnSupprimer.Enabled:=False;
      BtnTransformer.Enabled:=False;
    end;
  else
    FiltreNature := '(1=1)'; // Par sécurité si rien n'est sélectionné
    BtnSupprimer.Enabled:=False;
    BtnTransformer.Enabled:=False;
  end;

  // 3. On combine l'ensemble avec "and" (en minuscules) et des parenthèses
  FDQueryEntcde_cli.Filter := FiltreNature;
  FDQueryEntcde_cli.Filtered := True;
end;


procedure TFrameTableEntcde_cli.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEntcde_cli.IndexFieldNames = Field.FieldName then
      FDQueryEntcde_cli.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEntcde_cli.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFrameTableEntcde_cli.RadioGroupEtatClick(Sender: TObject);
begin
  AppliquerFiltreMaitre();
end;

end.
