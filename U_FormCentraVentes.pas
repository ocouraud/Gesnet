unit U_FormCentraVentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvDBControls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExStdCtrls, JvCombobox,
  JvDBCombobox, Vcl.DBCtrls;

type
  TFormCentraVentes = class(TForm)
    BtnValid: TButton;
    COMBO_Depot: TDBLookupComboBox;
    DSDepot: TDataSource;
    JvDate_Valid: TJvDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    LabelMessage: TLabel;
    procedure BtnValidClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function FactureDejaCentralisee(const ACodFac: Integer): Boolean;
    function ValiderCoherenceLignes(const ACodFac: Integer;
      AttenduHT: Double): Boolean;
    function ValiderCoherenceReglements(const ACodFac: Integer;
      AttenduTTC: Double): Boolean;
    procedure MettreAJourStatis(const AType, ACode: string; Annee,
      Mois: Integer; Montant: Double);
    procedure InsererEnteteMensuelle(QrySource: TFDQuery;
      ADateValid: TDateTime; ACodven: Integer);
    procedure MettreAJourCumulArticle(const ACodArt: string; Annee,
      Mois: Integer; MontantHT, MontantTVA, Qte, Marge, Poids: Double);
    procedure MettreAJourStaCliArt(CodCli: Integer; const ACodArt: string;
      Annee, Mois: Integer; MontantHT, Qte: Double);
    procedure InsererLigneMensuelle(QrySourceLigne, QryEntite: TFDQuery; Annee,
      Mois: Integer; const ALibelle: string; ADateValid: TDateTime);
    procedure TraiterLignesFacture(const ACodFac: Integer; Annee, Mois: Integer;
      QryEntite: TFDQuery; ADateValid: TDateTime);
    procedure InsererReglementMensuel(QrySource: TFDQuery; ADateValid: TDateTime);
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormCentraVentes: TFormCentraVentes;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule;


// 1. Vérifie si la facture existe déjà dans la table d'archive/mensuelle (ENTVTEAA)
function TFormCentraVentes.FactureDejaCentralisee(const ACodFac: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMGesCloud.ConnexionGesCloud;
    Qry.SQL.Text := 'SELECT COUNT(*) FROM ENTVTEAA WHERE CODFAC = :CodFac';
    Qry.ParamByName('CodFac').AsInteger := ACodFac;
    Qry.Open;
    Result := Qry.Fields[0].AsInteger > 0;
  finally
    Qry.Free;
  end;
end;

procedure TFormCentraVentes.FormShow(Sender: TObject);
begin
  DM_Olivier.FDQueryDepot.Open;
  COMBO_Depot.KeyValue:=DM_Olivier.gCoddep_defaut;
end;

// 2. Contrôle de cohérence sur le total des lignes
function TFormCentraVentes.ValiderCoherenceLignes(const ACodFac: Integer; AttenduHT: Double): Boolean;
var
  Qry: TFDQuery;
  SumTotHT: Double;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMGesCloud.ConnexionGesCloud;
    Qry.SQL.Text := 'SELECT SUM(totht) as sumtotht FROM ligvtejj WHERE codfac = :CodFac';
    Qry.ParamByName('CodFac').AsInteger := ACodFac;
    Qry.Open;

    SumTotHT := Qry.FieldByName('sumtotht').AsFloat;

    // Reproduction de la tolérance à +/- 1 de ton code WinDev d'origine
    Result := (Round(SumTotHT) = Round(AttenduHT)) or
              (Round(SumTotHT) + 1 = Round(AttenduHT)) or
              (Round(SumTotHT) - 1 = Round(AttenduHT));
  finally
    Qry.Free;
  end;
end;

// 3. Contrôle de cohérence sur les règlements
function TFormCentraVentes.ValiderCoherenceReglements(const ACodFac: Integer; AttenduTTC: Double): Boolean;
var
  Qry: TFDQuery;
  SumTTC: Double;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMGesCloud.ConnexionGesCloud;
    Qry.SQL.Text := 'SELECT SUM(montant) as sumttt FROM regljj WHERE codfac = :CodFac';
    Qry.ParamByName('CodFac').AsInteger := ACodFac;
    Qry.Open;

    SumTTC := Qry.FieldByName('sumttt').AsFloat;
    Result := (SumTTC = AttenduTTC);
  finally
    Qry.Free;
  end;
end;

procedure TFormCentraVentes.MettreAJourStatis(const AType, ACode: string; Annee, Mois: Integer; Montant: Double);
var
  Qry: TFDQuery;
  ChampMois: string;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMGesCloud.ConnexionGesCloud;

    // --- AJOUTER CES LIGNES POUR INDIquer LA TABLE ET LA CLÉ À FIREDAC ---
    Qry.UpdateOptions.UpdateTableName := 'statis';
    Qry.UpdateOptions.KeyFields := 'type_;code;annee';
    Qry.UpdateOptions.UpdateChangedFields := False;
    Qry.UpdateOptions.RefreshMode := rmManual;

    // Vérifie si l'enregistrement statistique existe déjà (clé primaire type + code + annee)
    Qry.SQL.Text := 'SELECT * FROM statis WHERE type_ = :PType AND code = :PCode AND annee = :PAnnee';
    Qry.ParamByName('PType').AsString := AType;
    Qry.ParamByName('PCode').AsString := ACode;
    Qry.ParamByName('PAnnee').AsInteger := Annee;
    Qry.Open;

    if Qry.Eof then
    begin
      // Insertion si inexistant
      Qry.Insert;
      Qry.FieldByName('type_').AsString := AType;
      Qry.FieldByName('code').AsString := ACode;
      Qry.FieldByName('annee').AsInteger := Annee;
    end
    else
    begin
      Qry.Edit;
    end;

    // Détermination dynamique du champ CA du mois (ca1, ca2, ..., ca12)
    ChampMois := 'ca' + IntToStr(Mois);
    Qry.FieldByName(ChampMois).AsFloat := Qry.FieldByName(ChampMois).AsFloat + Round(Montant);
    Qry.Post;
  finally
    Qry.Free;
  end;
end;

procedure TFormCentraVentes.InsererEnteteMensuelle(QrySource: TFDQuery; ADateValid: TDateTime; ACodven: Integer);
var
  QryInsert: TFDQuery;
  Annee, Mois, Jour: Word;
begin
  QryInsert := TFDQuery.Create(nil);
  try
    QryInsert.Connection := DMGesCloud.ConnexionGesCloud;
    QryInsert.UpdateOptions.UpdateChangedFields := False;
    QryInsert.UpdateOptions.RefreshMode := rmManual;
    QryInsert.SQL.Text := 'SELECT * FROM entvteaa WHERE 1=0'; // Juste pour récupérer la structure vide
    QryInsert.Open;
    QryInsert.Insert;

    DecodeDate(QrySource.FieldByName('date_').AsDateTime, Annee, Mois, Jour);

    QryInsert.FieldByName('coddev').AsInteger := QrySource.FieldByName('coddev').AsInteger;
    QryInsert.FieldByName('annee').AsInteger := Annee;
    QryInsert.FieldByName('mois').AsInteger := Mois;
    QryInsert.FieldByName('codfac').AsInteger := QrySource.FieldByName('codfac').AsInteger;
    QryInsert.FieldByName('codcai').AsString := QrySource.FieldByName('codcai').AsString;
    QryInsert.FieldByName('coddep').AsInteger := QrySource.FieldByName('coddep').AsInteger;
    QryInsert.FieldByName('type_').AsString := QrySource.FieldByName('type_').AsString;
    QryInsert.FieldByName('codrep').AsInteger := QrySource.FieldByName('codrep').AsInteger;
    QryInsert.FieldByName('codven').AsInteger := ACodven;
    QryInsert.FieldByName('codcli').AsInteger := QrySource.FieldByName('codcli').AsInteger;
    QryInsert.FieldByName('codgeo').AsString := QrySource.FieldByName('codgeo').AsString;
    QryInsert.FieldByName('nom').AsString := QrySource.FieldByName('nom').AsString;
    QryInsert.FieldByName('date_').AsDateTime := QrySource.FieldByName('date_').AsDateTime;
    QryInsert.FieldByName('heure').AsString := QrySource.FieldByName('heure').AsString;
    QryInsert.FieldByName('reference_').AsString := QrySource.FieldByName('reference_').AsString;
    QryInsert.FieldByName('exo_tva').AsInteger := QrySource.FieldByName('exo_tva').AsInteger;
    QryInsert.FieldByName('mt_ttc').AsInteger := QrySource.FieldByName('mt_ttc').AsInteger;
    QryInsert.FieldByName('totht').AsFloat := QrySource.FieldByName('totht').AsFloat;
    QryInsert.FieldByName('marge').AsFloat := QrySource.FieldByName('marge').AsFloat;
    QryInsert.FieldByName('prc_remise').AsFloat := QrySource.FieldByName('prc_remise').AsFloat;
    QryInsert.FieldByName('mt_remise').AsFloat := QrySource.FieldByName('mt_remise').AsFloat;
    QryInsert.FieldByName('mt_ht0').AsFloat := QrySource.FieldByName('mt_ht0').AsFloat;
    QryInsert.FieldByName('mt_ht1').AsFloat := QrySource.FieldByName('mt_ht1').AsFloat;
    QryInsert.FieldByName('mt_ht2').AsFloat := QrySource.FieldByName('mt_ht2').AsFloat;
    QryInsert.FieldByName('mt_ht3').AsFloat := QrySource.FieldByName('mt_ht3').AsFloat;
    QryInsert.FieldByName('mt_hti').AsFloat := QrySource.FieldByName('mt_hti').AsFloat;
    QryInsert.FieldByName('mt_tva1').AsFloat := QrySource.FieldByName('mt_tva1').AsFloat;
    QryInsert.FieldByName('mt_tva2').AsFloat := QrySource.FieldByName('mt_tva2').AsFloat;
    QryInsert.FieldByName('mt_tva3').AsFloat := QrySource.FieldByName('mt_tva3').AsFloat;
    QryInsert.FieldByName('mt_tvai').AsFloat := QrySource.FieldByName('mt_tvai').AsFloat;
    QryInsert.FieldByName('mt_tva').AsFloat := QrySource.FieldByName('mt_tva').AsFloat;
    QryInsert.FieldByName('observ').AsString := QrySource.FieldByName('observ').AsString;
    QryInsert.FieldByName('codpai').AsString := QrySource.FieldByName('codpai').AsString;
    QryInsert.FieldByName('jrscrd').AsInteger := QrySource.FieldByName('jrscrd').AsInteger;
    QryInsert.FieldByName('fin_mois').AsInteger := QrySource.FieldByName('fin_mois').AsInteger;
    QryInsert.FieldByName('libreg').AsString := QrySource.FieldByName('libreg').AsString;
    QryInsert.FieldByName('crd_force').AsInteger := QrySource.FieldByName('crd_force').AsInteger;
    QryInsert.FieldByName('date_oper').AsDateTime := ADateValid;
    QryInsert.FieldByName('regl').AsInteger := QrySource.FieldByName('regl').AsInteger;
    QryInsert.FieldByName('acompte').AsInteger := QrySource.FieldByName('acompte').AsInteger;
    QryInsert.FieldByName('nomven').AsString := QrySource.FieldByName('nomven').AsString;
    QryInsert.FieldByName('mt_tsoc').AsFloat := QrySource.FieldByName('mt_tsoc').AsFloat;
    QryInsert.FieldByName('mt_htsoc').AsFloat := QrySource.FieldByName('mt_htsoc').AsFloat;
    QryInsert.FieldByName('tx_tsoc').AsFloat := QrySource.FieldByName('tx_tsoc').AsFloat;
    QryInsert.FieldByName('exo_cps').AsInteger := QrySource.FieldByName('exo_cps').AsInteger;
    QryInsert.FieldByName('tva_iles').AsBoolean := QrySource.FieldByName('tva_iles').AsBoolean;
    QryInsert.FieldByName('flag_tax').AsInteger := QrySource.FieldByName('flag_tax').AsInteger;

    QryInsert.Post;
  finally
    QryInsert.Free;
  end;
end;

// 1. Fonction principale de traitement des lignes pour une facture donnée
procedure TFormCentraVentes.TraiterLignesFacture(const ACodFac: Integer; Annee, Mois: Integer; QryEntite: TFDQuery; ADateValid: TDateTime);
var
  QryLignes: TFDQuery;
  QryArticle: TFDQuery;
  NetHT, NetTTC: Double;
  Garantie: Integer;
  LibelleFinal: string;
begin
  QryLignes := TFDQuery.Create(nil);
  QryArticle := TFDQuery.Create(nil);
  try
    QryLignes.Connection := DMGesCloud.ConnexionGesCloud;
    QryLignes.SQL.Text := 'SELECT * FROM ligvtejj WHERE codfac = :CodFac';
    QryLignes.ParamByName('CodFac').AsInteger := ACodFac;
    QryLignes.Open;

    QryArticle.Connection := DMGesCloud.ConnexionGesCloud;

    while not QryLignes.Eof do
    begin
      // Calculs intermédiaires (si besoin dans la boucle)
      NetHT := QryLignes.FieldByName('totht').AsFloat;
      NetTTC := NetHT + QryLignes.FieldByName('mt_tva').AsFloat + QryLignes.FieldByName('mt_tsoc').AsFloat;

      // Lecture de la table ARTICLE pour vérifier la garantie
      Garantie := 0;
      QryArticle.SQL.Text := 'SELECT garantie FROM article WHERE codart = :CodArt';
      QryArticle.ParamByName('CodArt').AsString := QryLignes.FieldByName('codart').AsString;
      QryArticle.Open;

      if not QryArticle.Eof then
        Garantie := QryArticle.FieldByName('garantie').AsInteger;

      // Gestion du libellé avec la garantie (équivalent de SansEspace en Windev -> Trim)
      LibelleFinal := Trim(QryLignes.FieldByName('libelle').AsString);
      if Garantie > 0 then
        LibelleFinal := LibelleFinal + ' - Garantie ' + IntToStr(Garantie) + ' jrs.';

      // Insertion de la ligne dans LIGVTEAA
      InsererLigneMensuelle(QryLignes, QryEntite, Annee, Mois, LibelleFinal, ADateValid);

      // Cumul Article (CA_ART)
      MettreAJourCumulArticle(QryLignes.FieldByName('codart').AsString, Annee, Mois, NetHT,
                               QryLignes.FieldByName('mt_tva').AsFloat,
                               QryLignes.FieldByName('qte').AsFloat,
                               QryLignes.FieldByName('marge').AsFloat,
                               QryLignes.FieldByName('poids').AsFloat);

      // STACLIART (Statistique Client / Article)
      MettreAJourStaCliArt(QryEntite.FieldByName('codcli').AsInteger,
                           QryLignes.FieldByName('codart').AsString,
                           Annee, Mois, NetHT, QryLignes.FieldByName('qte').AsFloat);

      // STAT_ART, STAT_FAM, STAT_FOURNISSEUR, STAT_DEPARTEMENT
      MettreAJourStatis('A', QryLignes.FieldByName('codart').AsString, Annee, Mois, NetHT);
      MettreAJourStatis('F', QryLignes.FieldByName('codfam').AsString, Annee, Mois, NetHT);
      MettreAJourStatis('O', QryLignes.FieldByName('codfou').AsString, Annee, Mois, NetHT);
      MettreAJourStatis('D', QryLignes.FieldByName('coddpt').AsString, Annee, Mois, NetHT);

      QryLignes.Next;
    end;
  finally
    QryLignes.Free;
    QryArticle.Free;
  end;
end;

// 2. Sous-routine d'insertion de la ligne mensuelle (copie exacte des champs de ton code WinDev)
procedure TFormCentraVentes.InsererLigneMensuelle(QrySourceLigne: TFDQuery; QryEntite: TFDQuery; Annee, Mois: Integer; const ALibelle: string; ADateValid: TDateTime);
var
  QryInsert: TFDQuery;
begin
  QryInsert := TFDQuery.Create(nil);
  try
    QryInsert.Connection := DMGesCloud.ConnexionGesCloud;
    QryInsert.UpdateOptions.UpdateChangedFields := False;
    QryInsert.UpdateOptions.RefreshMode := rmManual;
    QryInsert.SQL.Text := 'SELECT * FROM ligvteaa WHERE 1=0'; // Juste pour récupérer la structure vide
    QryInsert.Open;
    QryInsert.Insert;

    QryInsert.FieldByName('annee').AsInteger := Annee;
    QryInsert.FieldByName('mois').AsInteger := Mois;
    QryInsert.FieldByName('date_').AsDateTime := QryEntite.FieldByName('date_').AsDateTime;
    QryInsert.FieldByName('heure').AsString := QryEntite.FieldByName('heure').AsString;
    QryInsert.FieldByName('codfac').AsInteger := QrySourceLigne.FieldByName('codfac').AsInteger;
    QryInsert.FieldByName('coddev').AsInteger := QrySourceLigne.FieldByName('coddev').AsInteger;
    QryInsert.FieldByName('codcai').AsString := QrySourceLigne.FieldByName('codcai').AsString;
    QryInsert.FieldByName('codfou').AsString := QrySourceLigne.FieldByName('codfou').AsString;
    QryInsert.FieldByName('codfam').AsString := QrySourceLigne.FieldByName('codfam').AsString;
    QryInsert.FieldByName('coddpt').AsString := QrySourceLigne.FieldByName('coddpt').AsString;
    QryInsert.FieldByName('codssf').AsString := QrySourceLigne.FieldByName('codssf').AsString;
    QryInsert.FieldByName('coddep').AsInteger := QrySourceLigne.FieldByName('coddep').AsInteger;
    QryInsert.FieldByName('type_').AsString := QryEntite.FieldByName('type_').AsString;
    QryInsert.FieldByName('codrep').AsInteger := QrySourceLigne.FieldByName('codrep').AsInteger;
    QryInsert.FieldByName('codven').AsInteger := DM_Olivier.FDQueryEntvtejj.FieldByName('codven').AsInteger;
    QryInsert.FieldByName('codcli').AsInteger := QryEntite.FieldByName('codcli').AsInteger;
    QryInsert.FieldByName('codart').AsString := QrySourceLigne.FieldByName('codart').AsString;
    QryInsert.FieldByName('codbar').AsString := QrySourceLigne.FieldByName('codbar').AsString;
    QryInsert.FieldByName('qte').AsFloat := QrySourceLigne.FieldByName('qte').AsFloat;
    QryInsert.FieldByName('poids').AsFloat := QrySourceLigne.FieldByName('poids').AsFloat;
    QryInsert.FieldByName('prixht').AsFloat := QrySourceLigne.FieldByName('prixht').AsFloat;
    QryInsert.FieldByName('codtar').AsString := QrySourceLigne.FieldByName('codtar').AsString;
    QryInsert.FieldByName('prixttc').AsFloat := QrySourceLigne.FieldByName('prixttc').AsFloat;
    QryInsert.FieldByName('prixnet').AsFloat := QrySourceLigne.FieldByName('prixnet').AsFloat;
    QryInsert.FieldByName('prixrev').AsFloat := QrySourceLigne.FieldByName('prixrev').AsFloat;
    QryInsert.FieldByName('totht').AsFloat := QrySourceLigne.FieldByName('totht').AsFloat;
    QryInsert.FieldByName('marge').AsFloat := QrySourceLigne.FieldByName('marge').AsFloat;
    QryInsert.FieldByName('prc_remise').AsFloat := QrySourceLigne.FieldByName('prc_remise').AsFloat;
    QryInsert.FieldByName('mt_remise').AsFloat := QrySourceLigne.FieldByName('mt_remise').AsFloat;
    QryInsert.FieldByName('tx_tva').AsFloat := QrySourceLigne.FieldByName('tx_tva').AsFloat;
    QryInsert.FieldByName('mt_tva').AsFloat := QrySourceLigne.FieldByName('mt_tva').AsFloat;
    QryInsert.FieldByName('mt_ttc').AsFloat := QrySourceLigne.FieldByName('mt_ttc').AsFloat;
    QryInsert.FieldByName('no_tva').AsInteger := QrySourceLigne.FieldByName('no_tva').AsInteger;
    QryInsert.FieldByName('no_sem').AsInteger := 0;
    QryInsert.FieldByName('no_jour').AsInteger := 0;
    QryInsert.FieldByName('noenr').AsInteger := QrySourceLigne.FieldByName('noenr').AsInteger;
    QryInsert.FieldByName('libelle').AsString := ALibelle;
    QryInsert.FieldByName('date_oper').AsDateTime := ADateValid;
    QryInsert.FieldByName('det_ppt').AsFloat := QrySourceLigne.FieldByName('det_ppt').AsFloat;
    QryInsert.FieldByName('det_ile').AsFloat := QrySourceLigne.FieldByName('det_ile').AsFloat;
    QryInsert.FieldByName('tx_tsoc').AsFloat := QrySourceLigne.FieldByName('tx_tsoc').AsFloat;
    QryInsert.FieldByName('mt_tsoc').AsFloat := QrySourceLigne.FieldByName('mt_tsoc').AsFloat;

    QryInsert.Post;
  finally
    QryInsert.Free;
  end;
end;

// 2. Mise à jour du cumul article (CA_ART)
procedure TFormCentraVentes.MettreAJourCumulArticle(const ACodArt: string; Annee, Mois: Integer; MontantHT, MontantTVA, Qte, Marge, Poids: Double);
var
  Qry: TFDQuery;
  ChampMoisCA, ChampMoisQte, ChampMoisMarge, ChampMoisPoids: string;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMGesCloud.ConnexionGesCloud;
    // --- AJOUTER CES OPTIONS POUR ÉVITER LES ERREURS DE STRUCTURE ---
    Qry.UpdateOptions.UpdateTableName := 'ca_art';
    Qry.UpdateOptions.KeyFields := 'codart;annee;mois';
    Qry.UpdateOptions.UpdateChangedFields := False;
    Qry.UpdateOptions.RefreshMode := rmManual;
    // ----------------------------------------------------------------
    Qry.SQL.Text := 'SELECT * FROM ca_art WHERE codart = :CodArt AND annee = :Annee AND mois = :Mois';
    Qry.ParamByName('CodArt').AsString := ACodArt;
    Qry.ParamByName('Annee').AsInteger := Annee;
    Qry.ParamByName('Mois').AsInteger := Mois;
    Qry.Open;

    if Qry.Eof then
    begin
      Qry.Insert;
      Qry.FieldByName('codart').AsString := ACodArt;
      Qry.FieldByName('annee').AsInteger := Annee;
      Qry.FieldByName('mois').AsInteger := Mois;
    end
    else
    begin
      Qry.Edit;
    end;

    Qry.FieldByName('CA').AsFloat := Qry.FieldByName('CA').AsFloat + MontantHT;
    Qry.FieldByName('Qte').AsFloat := Qry.FieldByName('Qte').AsFloat + Qte;
    Qry.FieldByName('Marge').AsFloat := Qry.FieldByName('Marge').AsFloat + Marge;
    Qry.FieldByName('Poids').AsFloat := Qry.FieldByName('Poids').AsFloat + Poids;

    Qry.Post;
  finally
    Qry.Free;
  end;
end;

// 3. Mise à jour des statistiques Client / Article (STACLIART)
procedure TFormCentraVentes.MettreAJourStaCliArt(CodCli: Integer; const ACodArt: string; Annee, Mois: Integer; MontantHT, Qte: Double);
var
  Qry: TFDQuery;
  ChampMoisCA, ChampMoisQte: string;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DMGesCloud.ConnexionGesCloud;
    // --- AJOUTER CES OPTIONS POUR ÉVITER LES ERREURS DE STRUCTURE ---
    Qry.UpdateOptions.UpdateTableName := 'stacliart';
    Qry.UpdateOptions.KeyFields := 'codcli;codart;annee';
    Qry.UpdateOptions.UpdateChangedFields := False;
    Qry.UpdateOptions.RefreshMode := rmManual;
    // ----------------------------------------------------------------
    Qry.SQL.Text := 'SELECT * FROM stacliart WHERE codcli = :CodCli AND codart = :CodArt AND annee = :Annee';
    Qry.ParamByName('CodCli').AsInteger := CodCli;
    Qry.ParamByName('CodArt').AsString := ACodArt;
    Qry.ParamByName('Annee').AsInteger := Annee;
    Qry.Open;

    if Qry.Eof then
    begin
      Qry.Insert;
      Qry.FieldByName('codcli').AsInteger := CodCli;
      Qry.FieldByName('codart').AsString := ACodArt;
      Qry.FieldByName('annee').AsInteger := Annee;
    end
    else
    begin
      Qry.Edit;
    end;

    ChampMoisCA := 'ca' + IntToStr(Mois);
    ChampMoisQte := 'qte' + IntToStr(Mois);

    Qry.FieldByName(ChampMoisCA).AsFloat := Qry.FieldByName(ChampMoisCA).AsFloat + MontantHT;
    Qry.FieldByName(ChampMoisQte).AsFloat := Qry.FieldByName(ChampMoisQte).AsFloat + Qte;

    Qry.Post;
  finally
    Qry.Free;
  end;
end;


procedure TFormCentraVentes.InsererReglementMensuel(QrySource: TFDQuery; ADateValid: TDateTime);
var
  QryInsert: TFDQuery;
  Annee, Mois, Jour: Word;
begin
  QryInsert := TFDQuery.Create(nil);
  try
    QryInsert.Connection := DMGesCloud.ConnexionGesCloud;
    QryInsert.UpdateOptions.UpdateChangedFields := False;
    QryInsert.UpdateOptions.RefreshMode := rmManual;
    QryInsert.SQL.Text := 'SELECT * FROM reglaa WHERE 1=0';
    QryInsert.Open;
    QryInsert.Insert;

    DecodeDate(QrySource.FieldByName('date_').AsDateTime, Annee, Mois, Jour);

    QryInsert.FieldByName('codfac').AsInteger := QrySource.FieldByName('codfac').AsInteger;
    QryInsert.FieldByName('codcai').AsString := QrySource.FieldByName('codcai').AsString;
    QryInsert.FieldByName('libelle').AsString := QrySource.FieldByName('libelle').AsString;
    QryInsert.FieldByName('date_').AsDateTime := QrySource.FieldByName('date_').AsDateTime;
    QryInsert.FieldByName('date_ech').AsDateTime := QrySource.FieldByName('date_ech').AsDateTime;
    QryInsert.FieldByName('montant').AsFloat := QrySource.FieldByName('montant').AsFloat;
    QryInsert.FieldByName('codpai').AsString := QrySource.FieldByName('codpai').AsString;
    QryInsert.FieldByName('type_').AsString := QrySource.FieldByName('type_').AsString;
    QryInsert.FieldByName('date_oper').AsDateTime := ADateValid;
    QryInsert.FieldByName('codven').AsInteger := QrySource.FieldByName('codven').AsInteger;
    QryInsert.FieldByName('top_').AsString := 'Z';
    // Ajoute ou ajuste ici les autres champs spécifiques de la table des règlements (regljj -> reglaa)

    QryInsert.Post;
  finally
    QryInsert.Free;
  end;
end;


procedure TFormCentraVentes.BtnValidClick(Sender: TObject);
var
  DateValid: TDateTime;
  Alt: Boolean;
  QryVentesValidees: TFDQuery;
  ACodFac: Integer;
  ANetHT: Double;
  ANetTTC: Double;
  ACodven: Integer;
  ANbFactures: Integer;
  Annee, Mois, Jour: Word;
  QryReglements: TFDQuery;
  QryReglMensuel: TFDQuery;
  QryDel: TFDQuery;
  QryVerifFacture: TFDQuery;
  QryDelRegl: TFDQuery;
  WCumMvt: Integer;
  WSolde: Integer;
  WDateEch: TDateTime;
  QryTresor: TFDQuery;
  QryPaiement: TFDQuery;
  QryCrdCli: TFDQuery;
  QryUpdClient: TFDQuery;
  QryReglLoop: TFDQuery;
  QryClient: TFDQuery;
  QryOrphan: TFDQuery;
  QryStock: TFDQuery;
  QryDepot: TFDQuery;
  QryStodep: TFDQuery;
  QryArticle: TFDQuery;
  QryCaisse: TFDQuery;
  NLSolde: Double;
begin
  // 1. Récupération directe de la date depuis le JvDBDateEdit
  if VarIsNull(JvDate_Valid.Date) or (JvDate_Valid.Date = 0) then
    DateValid := Date
  else
    DateValid := JvDate_Valid.Date;

  // 2. Boîte de dialogue de confirmation
  if MessageDlg('Attention, vous êtes sur le point de centraliser les ventes du jour - Plus personne ne doit travailler sur l''application Gesnet.',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    ShowMessage('Procédure annulée');
    Exit;
  end;

  // 3. Contrôle du verrouillage (ctrstock)
  Alt := False;
  DMGesCloud.FDQueryCtrstock.Open;
  DMGesCloud.FDQueryCtrstock.First;

  if not DMGesCloud.FDQueryCtrstock.Eof then
  begin
    if DMGesCloud.FDQueryCtrstock.FieldByName('flag_clo').AsInteger = 1 then
    begin
      Alt := True;
      ShowMessage('Centralisation déjà en cours !');
    end;
  end;

  if Alt then
  begin
    ShowMessage('Procédure annulée !');
    Exit;
  end;

  // 4. Ouverture de la transaction (FireDAC)
  try
    if not DMGesCloud.ConnexionGesCloud.InTransaction then
      DMGesCloud.ConnexionGesCloud.StartTransaction;
  except
    on E: Exception do
    begin
      ShowMessage('Erreur de transaction : ' + E.Message);
      Exit;
    end;
  end;

  LabelMessage.Caption:='Controles de cohérence...';

  // 5. Marquage du verrouillage en cours
  DMGesCloud.FDQueryCtrstock.Edit;
  DMGesCloud.FDQueryCtrstock.FieldByName('flag_clo').AsInteger := 1;
  DMGesCloud.FDQueryCtrstock.FieldByName('err_sync').AsInteger := 0;
  DMGesCloud.FDQueryCtrstock.Post;

  // OUVERTURE DU TRY GLOBAL POUR GÉRER LE ROLLBACK EN CAS D'ERREUR
  try

    // 6. Boucle principale de validation et de contrôle des factures (entvtejj)
    DM_Olivier.FDQueryEntVteJJ.Close;   //Pour reinitialiser avant de lire
    DM_Olivier.FDQueryEntVteJJ.Open;
    DM_Olivier.FDQueryEntVteJJ.DisableControls;
    try
      DM_Olivier.FDQueryEntVteJJ.First;
      while not DM_Olivier.FDQueryEntVteJJ.Eof do
      begin
        // Ignorer si top_ = 'M'
        if DM_Olivier.FDQueryEntVteJJ.FieldByName('top_').AsString = 'M' then
        begin
          DM_Olivier.FDQueryEntVteJJ.Next;
          Continue;
        end;

        // Filtrer par dépôt
        if DM_Olivier.FDQueryEntVteJJ.FieldByName('coddep').AsString <> COMBO_Depot.KeyValue then
        begin
          DM_Olivier.FDQueryEntVteJJ.Next;
          Continue;
        end;

        // Vérifier si la facture existe déjà dans ENTVTEAA (déjà centralisée)
        if FactureDejaCentralisee(DM_Olivier.FDQueryEntVteJJ.FieldByName('codfac').AsInteger) then
        begin
          ShowMessage('Facture deja centralisée '+inttostr(DM_Olivier.FDQueryEntVteJJ.FieldByName('codfac').AsInteger));

          DM_Olivier.FDQueryEntVteJJ.Delete;
          Continue;
        end;

        // Factures non réglées -> suspendues
        if DM_Olivier.FDQueryEntVteJJ.FieldByName('regl').AsInteger = 0 then
        begin
          DM_Olivier.FDQueryEntVteJJ.Edit;
          DM_Olivier.FDQueryEntVteJJ.FieldByName('top_').AsString := 'S';
          DM_Olivier.FDQueryEntVteJJ.Post;
        end;

        if DM_Olivier.FDQueryEntVteJJ.FieldByName('top_').AsString = 'S' then
        begin
          DM_Olivier.FDQueryEntVteJJ.Edit;
          DM_Olivier.FDQueryEntVteJJ.FieldByName('sel').AsInteger := 0;
          DM_Olivier.FDQueryEntVteJJ.Post;
        end
        else
        begin
          // Contrôle de cohérence lignes
          if not ValiderCoherenceLignes(DM_Olivier.FDQueryEntVteJJ.FieldByName('codfac').AsInteger,
                                       DM_Olivier.FDQueryEntVteJJ.FieldByName('totht').AsFloat +
                                       DM_Olivier.FDQueryEntVteJJ.FieldByName('mt_remise').AsFloat) then
          begin
            ShowMessage('Echec cohérence lignes facture '+inttostr(DM_Olivier.FDQueryEntVteJJ.FieldByName('codfac').AsInteger));
            DM_Olivier.FDQueryEntVteJJ.Next;
            Continue;
          end;

          // Contrôle de cohérence règlements
          if not ValiderCoherenceReglements(DM_Olivier.FDQueryEntVteJJ.FieldByName('codfac').AsInteger,
                                            DM_Olivier.FDQueryEntVteJJ.FieldByName('mt_ttc').AsFloat) then
          begin
            ShowMessage('Echec cohérence règlements facture '+inttostr(DM_Olivier.FDQueryEntVteJJ.FieldByName('codfac').AsInteger));
            DM_Olivier.FDQueryEntVteJJ.Next;
            Continue;
          end;

          // Si tout est ok, on valide l'étape
          //ShowMessage('Ok facture '+inttostr(DM_Olivier.FDQueryEntVteJJ.FieldByName('codfac').AsInteger));
          DM_Olivier.FDQueryEntVteJJ.Edit;
          DM_Olivier.FDQueryEntVteJJ.FieldByName('top_').AsString := 'F';
          DM_Olivier.FDQueryEntVteJJ.FieldByName('sel').AsInteger := 1;
          DM_Olivier.FDQueryEntVteJJ.Post;
        end;

        DM_Olivier.FDQueryEntVteJJ.Next;
      end;
    finally
      DM_Olivier.FDQueryEntVteJJ.EnableControls;
    end;

    // 7. Deuxième boucle : Traitement et centralisation des factures validées (top_ = 'F' et sel = 1)
    QryVentesValidees := TFDQuery.Create(nil);
    QryClient := TFDQuery.Create(nil);
    QryPaiement := TFDQuery.Create(nil);
    QryTresor := TFDQuery.Create(nil);
    QryCrdCli := TFDQuery.Create(nil);
    QryUpdClient := TFDQuery.Create(nil);
    try
      QryVentesValidees.Connection := DMGesCloud.ConnexionGesCloud;
      QryClient.Connection := DMGesCloud.ConnexionGesCloud;
      QryPaiement.Connection := DMGesCloud.ConnexionGesCloud;
      QryTresor.Connection := DMGesCloud.ConnexionGesCloud;
      QryCrdCli.Connection := DMGesCloud.ConnexionGesCloud;
      QryUpdClient.Connection := DMGesCloud.ConnexionGesCloud;

      QryVentesValidees.SQL.Text := 'SELECT * FROM entvtejj WHERE top_ = ''F'' AND sel = 1 AND coddep = :CodDep';
      QryVentesValidees.ParamByName('CodDep').AsString := COMBO_Depot.KeyValue;
      QryVentesValidees.Open;
      ANbFactures:=0;

      while not QryVentesValidees.Eof do
      begin
        LabelMessage.Caption:='Traitement de la facture '+inttostr(QryVentesValidees.FieldByName('codfac').AsInteger);
        ANbFactures:=ANbFactures+1;
        ACodFac := QryVentesValidees.FieldByName('codfac').AsInteger;
        ANetHT := QryVentesValidees.FieldByName('totht').AsFloat;
        ANetTTC := QryVentesValidees.FieldByName('totht').AsFloat +
                   QryVentesValidees.FieldByName('mt_tva').AsFloat +
                   QryVentesValidees.FieldByName('mt_tsoc').AsFloat;
        ACodven := QryVentesValidees.FieldByName('codven').AsInteger;

        DecodeDate(QryVentesValidees.FieldByName('date_').AsDateTime, Annee, Mois, Jour);

        // --- STATISTIQUES ---
        MettreAJourStatis('S', 'A', Annee, Mois, ANetHT);
        MettreAJourStatis('I', QryVentesValidees.FieldByName('codcai').AsString, Annee, Mois, ANetHT);
        MettreAJourStatis('V', QryVentesValidees.FieldByName('codven').AsString, Annee, Mois, ANetHT);
        MettreAJourStatis('C', QryVentesValidees.FieldByName('codcli').AsString, Annee, Mois, ANetHT);
        MettreAJourStatis('R', QryVentesValidees.FieldByName('codrep').AsString, Annee, Mois, ANetHT);

        if QryVentesValidees.FieldByName('mt_tva1').AsFloat <> 0 then
          MettreAJourStatis('T', 'TVA1', Annee, Mois, QryVentesValidees.FieldByName('mt_tva1').AsFloat);
        if QryVentesValidees.FieldByName('mt_tva2').AsFloat <> 0 then
          MettreAJourStatis('T', 'TVA2', Annee, Mois, QryVentesValidees.FieldByName('mt_tva2').AsFloat);
        if QryVentesValidees.FieldByName('mt_tva3').AsFloat <> 0 then
          MettreAJourStatis('T', 'TVA3', Annee, Mois, QryVentesValidees.FieldByName('mt_tva3').AsFloat);
//        if QryVentesValidees.FieldByName('mt_tsoc').AsFloat <> 0 then
//          MettreAJourStatis('X', 'TS', Annee, Mois, QryVentesValidees.FieldByName('mt_tsoc').AsFloat);
        if QryVentesValidees.FieldByName('mt_tvai').AsFloat <> 0 then
          MettreAJourStatis('T', 'TVAI', Annee, Mois, QryVentesValidees.FieldByName('mt_tvai').AsFloat);

        //INSERTION ENTVTEAA ++
        InsererEnteteMensuelle(QryVentesValidees, DateValid, ACodven);
        //INSERTION LIGVTEAA ++
        TraiterLignesFacture(ACodFac, Annee, Mois, QryVentesValidees, DateValid);

        // --- ÉCRITURE DE VENTES ET GÉRANCE TRÉSORERIE / RÈGLEMENTS ---
        QryClient.SQL.Text := 'SELECT * FROM client WHERE codcli = :CodCli';
        QryClient.ParamByName('CodCli').AsInteger := QryVentesValidees.FieldByName('codcli').AsInteger;
        QryClient.Open;
        WCumMvt := QryClient.FieldByName('cum_mvt').AsInteger;

        // --- Indicateur WSOLDE (Facture réglée au comptant / lettrable) ---
        WSolde := 0;
        QryPaiement.SQL.Text := 'SELECT * from regljj where type_=''D'' and codfac=:codfac';
        QryPaiement.ParamByName('CodFac').AsInteger := ACodFac;
        QryPaiement.Open;
        if QryPaiement.eof then
            WSolde := 1;    //Si pas de credit c'est donc soldé


        // --- ÉCRITURE DE VENTES DANS TRESOR
        //  (sauf si client centralisateur combine facture entierement comptant) ---
        if not ((WCumMvt = 1) and (WSolde = 1)) then
        begin
          QryTresor.UpdateOptions.UpdateChangedFields := False;
          QryTresor.UpdateOptions.RefreshMode := rmManual;
          QryTresor.SQL.Text := 'SELECT * FROM tresor WHERE 1=0';
          QryTresor.Open;
          QryTresor.Insert;

          QryTresor.FieldByName('codcli').AsInteger := QryVentesValidees.FieldByName('codcli').AsInteger;
          QryTresor.FieldByName('codrep').AsString := QryVentesValidees.FieldByName('codrep').AsString;
          QryTresor.FieldByName('date_').AsDateTime := QryVentesValidees.FieldByName('date_').AsDateTime;
          QryTresor.FieldByName('date_ech').AsDateTime := WDateEch;
          QryTresor.FieldByName('date_oper').AsDateTime := DateValid;
          QryTresor.FieldByName('annee').AsInteger := Annee;
          QryTresor.FieldByName('mois').AsInteger := Mois;
          QryTresor.FieldByName('top_').AsString := 'Z';
          QryTresor.FieldByName('type_').AsString := 'V';
          QryTresor.FieldByName('origin').AsString := 'V';

          if QryVentesValidees.FieldByName('reference_').AsString = '' then
            QryTresor.FieldByName('reference_').AsString := IntToStr(QryVentesValidees.FieldByName('codfac').AsInteger)
          else
            QryTresor.FieldByName('reference_').AsString := QryVentesValidees.FieldByName('reference_').AsString;

          QryTresor.FieldByName('credit').AsFloat := 0;
          QryTresor.FieldByName('debit').AsFloat := 0;

          if ANetTTC > 0 then
          begin
            QryTresor.FieldByName('libelle').AsString := 'Facture No ' + IntToStr(QryVentesValidees.FieldByName('codfac').AsInteger);
            QryTresor.FieldByName('debit').AsFloat := ANetTTC;
          end;

          if ANetTTC < 0 then
          begin
            QryTresor.FieldByName('libelle').AsString := 'Avoir No ' + IntToStr(QryVentesValidees.FieldByName('codfac').AsInteger);
            QryTresor.FieldByName('credit').AsFloat := -ANetTTC;
          end;

          QryTresor.FieldByName('solde').AsInteger := WSolde;

          if ANetTTC <> 0 then
            QryTresor.Post;
        end;

        // --- GÉNÉRATION DES RÈGLEMENTS (regljj -> tresor / crd_cli) ---
        QryReglLoop := TFDQuery.Create(nil);
        try
          QryReglLoop.Connection := DMGesCloud.ConnexionGesCloud;
          QryReglLoop.SQL.Text := 'SELECT * FROM regljj WHERE codfac = :CodFac AND montant <> 0';
          QryReglLoop.ParamByName('CodFac').AsInteger := ACodFac;
          QryReglLoop.Open;

          while not QryReglLoop.Eof do
          begin

            //INSERTION REGLAA
            InsererReglementMensuel(QryReglLoop, DateValid);

            //PUIS crd_cli, TRESOR
            QryPaiement.SQL.Text := 'SELECT * FROM paiement WHERE codpai = :CodPai';
            QryPaiement.ParamByName('CodPai').AsString := QryReglLoop.FieldByName('codpai').AsString;
            QryPaiement.Open;

            if WCumMvt = 0 then
            begin
              if QryPaiement.FieldByName('type_').AsString = 'D' then
              begin
                QryCrdCli.SQL.Text := 'SELECT * FROM crd_cli WHERE codcli = :CodCli AND annee = :Annee AND mois = :Mois';
                QryCrdCli.ParamByName('CodCli').AsInteger := QryVentesValidees.FieldByName('codcli').AsInteger;
                QryCrdCli.ParamByName('Annee').AsInteger := Annee;
                QryCrdCli.ParamByName('Mois').AsInteger := Mois;
                QryCrdCli.Open;

                if QryCrdCli.IsEmpty then
                begin
                  QryCrdCli.Insert;
                  QryCrdCli.FieldByName('codcli').AsInteger := QryVentesValidees.FieldByName('codcli').AsInteger;
                  QryCrdCli.FieldByName('annee').AsInteger := Annee;
                  QryCrdCli.FieldByName('mois').AsInteger := Mois;
                end
                else
                  QryCrdCli.Edit;

                QryCrdCli.FieldByName('credit').AsFloat := QryCrdCli.FieldByName('credit').AsFloat + QryReglLoop.FieldByName('montant').AsFloat;
                QryCrdCli.Post;

                QryUpdClient.SQL.Text := 'UPDATE client SET credit = credit + :Montant WHERE codcli = :CodCli';
                QryUpdClient.ParamByName('Montant').AsFloat := QryReglLoop.FieldByName('montant').AsFloat;
                QryUpdClient.ParamByName('CodCli').AsInteger := QryVentesValidees.FieldByName('codcli').AsInteger;
                QryUpdClient.ExecSQL;
              end
              else
              begin
                QryTresor.UpdateOptions.UpdateChangedFields := False;
                QryTresor.UpdateOptions.RefreshMode := rmManual;
                QryTresor.SQL.Text := 'SELECT * FROM tresor WHERE 1=0';
                QryTresor.Open;
                QryTresor.Insert;

                QryTresor.FieldByName('codcli').AsInteger := QryVentesValidees.FieldByName('codcli').AsInteger;
                QryTresor.FieldByName('codrep').AsString := QryVentesValidees.FieldByName('codrep').AsString;
                QryTresor.FieldByName('date_').AsDateTime := QryReglLoop.FieldByName('date_').AsDateTime;
                QryTresor.FieldByName('date_ech').AsDateTime := QryReglLoop.FieldByName('date_ech').AsDateTime;
                QryTresor.FieldByName('date_oper').AsDateTime := DateValid;
                QryTresor.FieldByName('codpai').AsString := QryReglLoop.FieldByName('codpai').AsString;
                QryTresor.FieldByName('annee').AsInteger := Annee;
                QryTresor.FieldByName('mois').AsInteger := Mois;
                QryTresor.FieldByName('top_').AsString := 'Z';
                QryTresor.FieldByName('type_').AsString := 'R';
                QryTresor.FieldByName('origin').AsString := 'V';

                if QryVentesValidees.FieldByName('reference_').AsString = '' then
                  QryTresor.FieldByName('reference_').AsString := IntToStr(QryVentesValidees.FieldByName('codfac').AsInteger)
                else
                  QryTresor.FieldByName('reference_').AsString := QryVentesValidees.FieldByName('reference_').AsString;

                QryTresor.FieldByName('solde').AsInteger := WSolde;
                QryTresor.FieldByName('credit').AsFloat := 0;
                QryTresor.FieldByName('debit').AsFloat := 0;

                if QryReglLoop.FieldByName('montant').AsFloat > 0 then
                begin
                  QryTresor.FieldByName('libelle').AsString := QryReglLoop.FieldByName('libelle').AsString;
                  QryTresor.FieldByName('credit').AsFloat := QryReglLoop.FieldByName('montant').AsFloat;
                end;

                if QryReglLoop.FieldByName('montant').AsFloat < 0 then
                begin
                  QryTresor.FieldByName('libelle').AsString := QryReglLoop.FieldByName('libelle').AsString;
                  QryTresor.FieldByName('debit').AsFloat := -QryReglLoop.FieldByName('montant').AsFloat;
                end;

                QryTresor.Post;
              end;
            end;

            QryReglLoop.Next;
          end;
        finally
          QryReglLoop.Free;
        end;

        // 9. Nettoyage immédiat des tables journalières pour chaque facture validée
        QryDel := TFDQuery.Create(nil);
        try
          QryDel.Connection := DMGesCloud.ConnexionGesCloud;

          QryDel.SQL.Text := 'DELETE FROM regljj WHERE codfac = :CodFac';
          QryDel.ParamByName('CodFac').AsInteger := ACodFac;
          QryDel.ExecSQL;

          QryDel.SQL.Text := 'DELETE FROM ligvtejj WHERE codfac = :CodFac';
          QryDel.ParamByName('CodFac').AsInteger := ACodFac;
          QryDel.ExecSQL;

          QryDel.SQL.Text := 'DELETE FROM entvtejj WHERE codfac = :CodFac';
          QryDel.ParamByName('CodFac').AsInteger := ACodFac;
          QryDel.ExecSQL;
        finally
          QryDel.Free;
        end;

        QryVentesValidees.Next;
      end;
    finally
      QryVentesValidees.Free;
      QryClient.Free;
      QryPaiement.Free;
      QryTresor.Free;
      QryCrdCli.Free;
      QryUpdClient.Free;
    end;

    // 8. Traitement et archivage des règlements isolés (regljj -> reglaa) - (cas improbables)
    LabelMessage.Caption:='Traitement des règlements isolés...';
    QryReglements := TFDQuery.Create(nil);
    QryReglMensuel := TFDQuery.Create(nil);
    QryVerifFacture := TFDQuery.Create(nil);
    QryDelRegl := TFDQuery.Create(nil);
    try
      QryReglements.Connection := DMGesCloud.ConnexionGesCloud;
      QryReglMensuel.Connection := DMGesCloud.ConnexionGesCloud;
      QryVerifFacture.Connection := DMGesCloud.ConnexionGesCloud;
      QryDelRegl.Connection := DMGesCloud.ConnexionGesCloud;

      QryReglements.SQL.Text := 'SELECT * FROM regljj';
      QryReglements.Open;

      while not QryReglements.Eof do
      begin
        QryVerifFacture.SQL.Text := 'SELECT * FROM entvtejj WHERE codfac = :CodFac';
        QryVerifFacture.ParamByName('CodFac').AsInteger := QryReglements.FieldByName('codfac').AsInteger;
        QryVerifFacture.Open;
        //Regljj orphelin de entvtejj
        if QryVerifFacture.Eof then
        begin
          QryVerifFacture.SQL.Text := 'SELECT * FROM entvteaa WHERE codfac = :CodFac';
          QryVerifFacture.ParamByName('CodFac').AsInteger := QryReglements.FieldByName('codfac').AsInteger;
          QryVerifFacture.Open;
          //Regljj orphelin de entvteaa
          if QryVerifFacture.Eof then
          begin
            QryDelRegl.SQL.Text := 'DELETE FROM regljj WHERE codfac = :CodFac AND Noenr = :Noenr';
            QryDelRegl.ParamByName('CodFac').AsInteger := QryReglements.FieldByName('codfac').AsInteger;
            QryDelRegl.ParamByName('Noenr').AsInteger := QryReglements.FieldByName('Noenr').AsInteger;
            QryDelRegl.ExecSQL;

            QryReglements.Next;
            Continue;
          end;

          QryReglMensuel.UpdateOptions.UpdateChangedFields := False;
          QryReglMensuel.UpdateOptions.RefreshMode := rmManual;
          QryReglMensuel.SQL.Text := 'SELECT * FROM reglaa WHERE 1=0';
          QryReglMensuel.Open;
          QryReglMensuel.Insert;

          QryReglMensuel.FieldByName('codfac').AsInteger := QryReglements.FieldByName('codfac').AsInteger;
          QryReglMensuel.FieldByName('codcai').AsString := QryReglements.FieldByName('codcai').AsString;
          QryReglMensuel.FieldByName('codven').AsInteger := QryReglements.FieldByName('codven').AsInteger;
          QryReglMensuel.FieldByName('date_').AsDateTime := QryReglements.FieldByName('date_').AsDateTime;
          QryReglMensuel.FieldByName('top_').AsString := 'Z';
          QryReglMensuel.FieldByName('libelle').AsString := QryReglements.FieldByName('libelle').AsString;
          QryReglMensuel.FieldByName('montant').AsFloat := QryReglements.FieldByName('montant').AsFloat;
          QryReglMensuel.FieldByName('date_ech').AsDateTime := QryReglements.FieldByName('date_ech').AsDateTime;
          QryReglMensuel.FieldByName('codpai').AsString := QryReglements.FieldByName('codpai').AsString;
          QryReglMensuel.FieldByName('type_').AsString := QryReglements.FieldByName('type_').AsString;
          QryReglMensuel.FieldByName('select_').AsString := '';
          QryReglMensuel.FieldByName('date_oper').AsDateTime := DateValid;
          QryReglMensuel.FieldByName('date_compta').AsString := '';

          QryReglMensuel.Post;

          //Suppression du regljj isolé (cas improbable)
          QryDelRegl.SQL.Text := 'DELETE FROM regljj WHERE codfac = :CodFac AND Noenr = :Noenr';
          QryDelRegl.ParamByName('CodFac').AsInteger := QryReglements.FieldByName('codfac').AsInteger;
          QryDelRegl.ParamByName('Noenr').AsInteger := QryReglements.FieldByName('Noenr').AsInteger;
          QryDelRegl.ExecSQL;
        end;

        QryReglements.Next;
      end;
    finally
      QryReglements.Free;
      QryReglMensuel.Free;
      QryVerifFacture.Free;
      QryDelRegl.Free;
    end;

    // --- NETTOYAGE DES LIGNES ORPHELINES (ligvtejj) ET REMISE EN STOCK ---
    LabelMessage.Caption:='Traitement des lignes ophelines...';
    QryOrphan := TFDQuery.Create(nil);
    QryStock := TFDQuery.Create(nil);
    QryDepot := TFDQuery.Create(nil);
    QryStodep := TFDQuery.Create(nil);
    QryArticle := TFDQuery.Create(nil);
    try
      QryOrphan.Connection := DMGesCloud.ConnexionGesCloud;
      QryStock.Connection := DMGesCloud.ConnexionGesCloud;
      QryDepot.Connection := DMGesCloud.ConnexionGesCloud;
      QryStodep.Connection := DMGesCloud.ConnexionGesCloud;
      QryArticle.Connection := DMGesCloud.ConnexionGesCloud;

      QryOrphan.SQL.Text := 'SELECT l.* FROM ligvtejj l LEFT JOIN entvtejj e ON l.codfac = e.codfac WHERE e.codfac IS NULL';
      QryOrphan.Open;

      while not QryOrphan.Eof do
      begin
        if QryOrphan.FieldByName('noenr').AsInteger <> 0 then
        begin
          QryStock.SQL.Text := 'SELECT * FROM stock WHERE noenr = :Noenr';
          QryStock.ParamByName('Noenr').AsInteger := QryOrphan.FieldByName('noenr').AsInteger;
          QryStock.Open;

          if not QryStock.IsEmpty and (QryStock.FieldByName('codart').AsString = QryOrphan.FieldByName('codart').AsString) then
          begin
            QryStock.Delete;

            QryStodep.SQL.Text := 'SELECT * FROM stodep WHERE coddep = :CodDep AND codart = :CodArt';
            QryStodep.ParamByName('CodDep').AsString := QryOrphan.FieldByName('coddep').AsString;
            QryStodep.ParamByName('CodArt').AsString := QryOrphan.FieldByName('codart').AsString;
            QryStodep.Open;

            if not QryStodep.IsEmpty then
            begin
              QryDepot.SQL.Text := 'SELECT * FROM depot WHERE coddep = :CodDep';
              QryDepot.ParamByName('CodDep').AsString := QryOrphan.FieldByName('coddep').AsString;
              QryDepot.Open;

              if not QryDepot.IsEmpty and not QryDepot.FieldByName('fictif').IsNull
              and (QryDepot.FieldByName('fictif').AsVariant = 0) then
              begin
                QryStodep.Edit;
                if QryStodep.FieldByName('rapport').AsFloat <> 0 then
                  QryStodep.FieldByName('qte').AsFloat := QryStodep.FieldByName('qte').AsFloat + (QryOrphan.FieldByName('qte').AsFloat / QryStodep.FieldByName('rapport').AsFloat);
                QryStodep.FieldByName('poids').AsFloat := QryStodep.FieldByName('poids').AsFloat + QryOrphan.FieldByName('poids').AsFloat;
                QryStodep.Post;

                QryArticle.SQL.Text := 'SELECT * FROM article WHERE codart = :CodArt';
                QryArticle.ParamByName('CodArt').AsString := QryOrphan.FieldByName('codart').AsString;
                QryArticle.Open;

                if not QryArticle.IsEmpty then
                begin
                  QryArticle.Edit;
                  QryArticle.FieldByName('qte').AsFloat := QryArticle.FieldByName('qte').AsFloat + QryOrphan.FieldByName('qte').AsFloat;
                  QryArticle.Post;
                end;
              end;
            end;
          end;
        end;

        // Supprimer la ligne orpheline ligvtejj
        with TFDQuery.Create(nil) do
        try
          Connection := DMGesCloud.ConnexionGesCloud;
          SQL.Text := 'DELETE FROM ligvtejj WHERE noenr = :Noenr';
          ParamByName('Noenr').AsInteger := QryOrphan.FieldByName('noenr').AsInteger;
          ExecSQL;
        finally
          Free;
        end;

        QryOrphan.Next;
      end;
    finally
      QryOrphan.Free;
      QryStock.Free;
      QryDepot.Free;
      QryStodep.Free;
      QryArticle.Free;
    end;

    // --- CENTRALISATION DE LA TRÉSORERIE ---
    LabelMessage.Caption:='Centralisation de la trésorerie...';
    with TFDQuery.Create(nil) do
    try
      Connection := DMGesCloud.ConnexionGesCloud;
      SQL.Text := 'UPDATE tresor SET top_ = ''Z'' WHERE top_ <> ''Z''';
      ExecSQL;
    finally
      Free;
    end;

    // --- CENTRALISATION DES SORTIES DE CAISSES ---
    LabelMessage.Caption:='Centralisation de la caisse...';
    with TFDQuery.Create(nil) do
    try
      Connection := DMGesCloud.ConnexionGesCloud;
      SQL.Text := 'UPDATE depense SET top_ = ''Z'' WHERE top_ = ''J''';
      ExecSQL;
    finally
      Free;
    end;

    // --- RECALCUL DU SOLDE CLIENTS ---
    LabelMessage.Caption:='Calcul du solde des clients...';
    var
      QryUpdate: TFDQuery;
    begin
      QryUpdate := TFDQuery.Create(nil);
      try
        QryUpdate.Connection := DMGesCloud.ConnexionGesCloud;
        QryUpdate.SQL.Text :=
          'UPDATE client c ' +
          'SET c.credit = ( ' +
          '  SELECT COALESCE(SUM(COALESCE(t.debit, 0) - COALESCE(t.credit, 0)), 0) ' +
          '  FROM tresor t ' +
          '  WHERE t.codcli = c.codcli AND t.solde = 0 ' +
          ') ' +
          'WHERE c.ferme = 0';
        QryUpdate.ExecSQL;
      finally
        QryUpdate.Free;
      end;
    end;

    // --- VALIDATION COMPTAGE DE CAISSE DU JOUR ---
    LabelMessage.Caption:='Validation du comptage de la caisse du jour...';
    QryCaisse := TFDQuery.Create(nil);
    try
      QryCaisse.Connection := DMGesCloud.ConnexionGesCloud;
      QryCaisse.SQL.Text := 'SELECT * FROM zcaisse WHERE date_ = :DateVal';
      QryCaisse.ParamByName('DateVal').AsDateTime := DateValid;
      QryCaisse.Open;

      if not QryCaisse.IsEmpty then
      begin
        QryCaisse.Edit;
        QryCaisse.FieldByName('top_').AsString := 'C';
        QryCaisse.Post;
      end;
    finally
      QryCaisse.Free;
    end;

    // 10. Clôture du verrouillage et Validation de la transaction (Commit)
    LabelMessage.Caption:='Validation globale de la transaction...';
    DMGesCloud.FDQueryCtrstock.Edit;
    DMGesCloud.FDQueryCtrstock.FieldByName('flag_clo').AsInteger := 0;
    DMGesCloud.FDQueryCtrstock.FieldByName('err_sync').AsInteger := 0;
    DMGesCloud.FDQueryCtrstock.Post;

    if DMGesCloud.ConnexionGesCloud.InTransaction then
    DMGesCloud.ConnexionGesCloud.Commit;
    LabelMessage.Caption:='Centralisation terminée.';
    ShowMessage('Centralisation des ventes effectuée sur '+ IntToStr(ANbFactures) +' factures avec succès !');

  except
    on E: Exception do
    begin
      if DMGesCloud.ConnexionGesCloud.InTransaction then
        DMGesCloud.ConnexionGesCloud.Rollback;

      try
        DMGesCloud.FDQueryCtrstock.Edit;
        DMGesCloud.FDQueryCtrstock.FieldByName('flag_clo').AsInteger := 0;
        DMGesCloud.FDQueryCtrstock.Post;
      except
      end;

      ShowMessage('Erreur durant la centralisation (Annulation effectuée) : ' + E.Message);
    end;
  end;
  //close;

end;

end.
