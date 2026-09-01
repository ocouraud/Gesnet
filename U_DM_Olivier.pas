unit U_DM_Olivier;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Variants, Vcl.Dialogs, System.IniFiles, System.Math,
  Vcl.Forms;

type
  TDM_Olivier = class(TDataModule)
    FDQueryFournis: TFDQuery;
    FDQueryPaiement: TFDQuery;
    FDQueryParameTVA: TFDQuery;
    FDQueryParameDevise: TFDQuery;
    FDQueryRepres: TFDQuery;
    FDQueryGeo: TFDQuery;
    FDQueryDepot: TFDQuery;
    FDQueryPoste: TFDQuery;
    FDQueryActivite: TFDQuery;
    FDQueryCtrstock: TFDQuery;
    FDQuerySousFam: TFDQuery;
    FDQueryDepart: TFDQuery;
    FDQueryChrono: TFDQuery;
    FDQueryCaisse: TFDQuery;
    FDQueryClient: TFDQuery;
    FDQueryArticle: TFDQuery;
    FDQueryCalcul: TFDQuery;
    FDQueryEnt_prof: TFDQuery;
    FDQueryEntvtejj: TFDQuery;
    FDQueryLigvtejj: TFDQuery;
    FDQueryReglJJ: TFDQuery;
    procedure FDQueryParameDeviseNewRecord(DataSet: TDataSet);
    procedure UpperCaseSetText(Sender: TField; const Text: string);
    procedure FDQueryDepotNewRecord(DataSet: TDataSet);
    procedure FDQueryGeoNewRecord(DataSet: TDataSet);
    procedure FDQueryPosteNewRecord(DataSet: TDataSet);
    procedure FDQueryPosteBeforePost(DataSet: TDataSet);
    procedure FDQueryPosteAfterOpen(DataSet: TDataSet);

  private
    { Déclarations privées }
    FNumeroPoste: Integer;
    procedure ChargerOuCreerNumeroPoste;
    procedure VerifierOuCreerCaisse(ANumeroPoste: Integer);
  public
    { Déclarations publiques }
    PMPGlobalMode: Integer; // Variable globale de l'application
    gCodCai: string;
    gCoddep_defaut: Integer;
    gCodcli_defaut: Integer;
    function GetEAN13CheckDigitFrom13(const A13Digits: string): string;
    procedure ChargerParametresStock;
    property NumeroPoste: Integer read FNumeroPoste;
    function CreerRequeteTemp: TFDQuery;
    procedure LibererRequeteTemp(var QueryOutil: TFDQuery);
    function GetProchainCodRep: Integer;
    procedure RefreshDataSetWithBookmark(ADataSet: TDataSet);
    constructor Create(AOwner: TComponent); override;
    function CalculerTTC(const MontantHT: Double; const TauxTVA: Double): Double;
    function CalculerHT(const MontantTTC: Double; const TauxTVA: Double): Double;
    procedure RecalculerStockStodep(const CodeArt: string; const CodeDep: Integer);
    procedure RecalculerStockArticle(const CodeArt: string);
    procedure RecalculerToutLeStock;
    function CentièmesVersHeureLisible(ACentièmes: Int64): string;
    function fgTxTaxe(const DateCtrl: TDateTime; const CodeTVA: String): Double;
   end;

var
  DM_Olivier: TDM_Olivier;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses U_DataModule; // Permet d'accéder à DMGesCloud


{ Remplacer DataModuleCreate par ceci : }
constructor TDM_Olivier.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // Exécute le Create standard du DataModule
  ChargerOuCreerNumeroPoste; // Exécute la logique du poste.ini
  ChargerParametresStock;
end;


function TDM_Olivier.CentièmesVersHeureLisible(ACentièmes: Int64): string;
var
  TotalSecondes: Int64;
  Centièmes: Integer;
  Secondes: Integer;
  Minutes: Integer;
  Heures: Integer;
begin
  // 1 seconde = 100 centièmes
  TotalSecondes := ACentièmes div 100;
  Centièmes     := ACentièmes mod 100;

  Secondes      := TotalSecondes mod 60;
  TotalSecondes := TotalSecondes div 60;

  Minutes       := TotalSecondes mod 60;
  Heures        := TotalSecondes div 60;

  // Formatage du résultat (ex: 01:25:45,50)
  //Result := Format('%.2d:%.2d:%.2d,%.2d', [Heures, Minutes, Secondes, Centièmes]);
  Result := Format('%.2d:%.2d:%.2d', [Heures, Minutes, Secondes]);
end;


procedure TDM_Olivier.ChargerOuCreerNumeroPoste;
var
  FichierIni: TIniFile;
  CheminIni: string;
  SaisieNumero: string;
begin
  CheminIni := ExtractFilePath(ParamStr(0)) + 'poste.ini';
  FichierIni := TIniFile.Create(CheminIni);
  try
    FNumeroPoste := FichierIni.ReadInteger('Poste', 'Numero', 0);

    // Si le fichier/clé n'existe pas
    if FNumeroPoste = 0 then
    begin
      SaisieNumero := '1';
      if InputQuery('Configuration du Poste', 'Veuillez saisir le numéro de ce poste :', SaisieNumero) then
        FNumeroPoste := StrToIntDef(SaisieNumero, 1)
      else
        FNumeroPoste := 1;

      // Sauvegarde dans le .ini
      FichierIni.WriteInteger('Poste', 'Numero', FNumeroPoste);
    end;
    // --- VÉRIFICATION & CRÉATION DANS LA TABLE CAISSE MYSQL---
    VerifierOuCreerCaisse(FNumeroPoste);
  finally
    FichierIni.Free;
  end;
end;

procedure TDM_Olivier.VerifierOuCreerCaisse(ANumeroPoste: Integer);
var
  Qry: TFDQuery;
  CodCai: string;
begin
  // Formatage du numéro sur 2 caractères (ex: 1 -> '01', 2 -> '02')
  CodCai := Format('%.2d', [ANumeroPoste]);
  //Affectation globale
  gCodCai := Format('%d', [ANumeroPoste]);

  Qry := CreerRequeteTemp;
  try
    // 1. Vérifier si le code caisse existe déjà
    Qry.SQL.Text := 'SELECT * FROM caisse WHERE CODCAI = :CodCai';
    Qry.ParamByName('CodCai').AsString := CodCai;
    Qry.Open;

    // 2. Si la caisse n'existe pas, on l'insère
    if Qry.IsEmpty then
    begin
      Qry.Close;
      Qry.SQL.Text := 'INSERT INTO caisse (CODCAI) VALUES (:CodCai)';
      Qry.ParamByName('CodCai').AsString := CodCai;
      Qry.ExecSQL;
    end;
    gCodcli_defaut:=Qry.FieldByName('CODCLI').AsInteger;
    gCoddep_defaut:=Qry.FieldByName('CODDEP').AsInteger;
  finally
    LibererRequeteTemp(Qry);
  end;
end;

procedure TDM_Olivier.RefreshDataSetWithBookmark(ADataSet: TDataSet);
var
  BM: TBookmark;
begin
  if not Assigned(ADataSet) or not ADataSet.Active then Exit;

  BM := ADataSet.GetBookmark;
  try
    ADataSet.Refresh;
    if ADataSet.BookmarkValid(BM) then
      ADataSet.GotoBookmark(BM);
  finally
    ADataSet.FreeBookmark(BM);
  end;
end;

procedure TDM_Olivier.FDQueryDepotNewRecord(DataSet: TDataSet);
begin
  // Selon que le champ est géré en Boolean ou Integer
  DataSet.FieldByName('FICTIF').AsBoolean := False;
  // Ou : DataSet.FieldByName('FICTIF').AsInteger := 0;
end;

procedure TDM_Olivier.FDQueryGeoNewRecord(DataSet: TDataSet);
begin
  // Selon que le champ est géré en Boolean ou Integer
  DataSet.FieldByName('TVA_ILES').AsBoolean := False;
  // Ou : DataSet.FieldByName('FICTIF').AsInteger := 0;
end;

procedure TDM_Olivier.FDQueryParameDeviseNewRecord(DataSet: TDataSet);
begin
  // Affecte la valeur 'D' au champ type_ dès la création d'un enregistrement
  DataSet.FieldByName('type_').AsString := 'D';
end;


procedure TDM_Olivier.FDQueryPosteAfterOpen(DataSet: TDataSet);
var
  FieldBool: TField;
begin
  FieldBool := DataSet.FindField('STOCK_BOOL');
  if Assigned(FieldBool) then
  begin
    FieldBool.ReadOnly := False;
    FieldBool.ProviderFlags := [];
  end;
end;

procedure TDM_Olivier.FDQueryPosteBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('STOCK_BOOL').AsBoolean then
    DataSet.FieldByName('STOCK').AsString := 'O'
  else
    DataSet.FieldByName('STOCK').AsString := 'N';
end;

procedure TDM_Olivier.FDQueryPosteNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('STOCK').AsString := 'N';
  if Assigned(DataSet.FindField('STOCK_BOOL')) then
    DataSet.FieldByName('STOCK_BOOL').AsBoolean := False;
end;

procedure TDM_Olivier.UpperCaseSetText(Sender: TField; const Text: string);
begin
  Sender.AsString := UpperCase(Text);
end;

function TDM_Olivier.CreerRequeteTemp: TFDQuery;
begin
  // On crée l'objet en mémoire
  Result := TFDQuery.Create(nil);
  // On lui attribue tout de suite la connexion pour qu'il soit prêt à l'emploi
  Result.Connection := DMGesCloud.ConnexionGesCloud;
end;

procedure TDM_Olivier.LibererRequeteTemp(var QueryOutil: TFDQuery);
begin
  if Assigned(QueryOutil) then
  begin
    QueryOutil.Close;
    QueryOutil.Free;
    QueryOutil := nil; // Sécurité : évite les pointeurs "fantômes"
  end;
end;


//Super exemple de creation de requete de manipulation de donnees avec retour de fonction.
function TDM_Olivier.GetProchainCodRep: Integer;
var
  Qry: TFDQuery;
begin
  Result := 1; // Valeur par défaut si la table est vide
  Qry := CreerRequeteTemp;
  try
    // IFNULL / COALESCE selon MySQL
    Qry.SQL.Text := 'SELECT COALESCE(MAX(CODREP), 0) + 1 AS Suivant FROM repres';
    Qry.Open;
    if not Qry.IsEmpty then
      Result := Qry.FieldByName('Suivant').AsInteger;
  finally
    LibererRequeteTemp(Qry);
  end;
end;

function TDM_Olivier.fgTxTaxe(const DateCtrl: TDateTime; const CodeTVA: String): Double;
var
  wtx: Double;
  QryExec: TFDQuery;
begin
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.SQL.Text := 'SELECT * FROM par_effet WHERE CODE=:CODE ORDER BY DAT_DEB';
  QryExec.ParamByName('CODE').AsString := CodeTVA;
  QryExec.Open;
  QryExec.First;
  while not QryExec.Eof do
  begin
    IF (DateCtrl>=QryExec.FieldByName('DAT_DEB').AsDateTime) and (DateCtrl<=QryExec.FieldByName('DAT_FIN').AsDateTime) then
    begin
       wtx := QryExec.FieldByName('TAUX').AsFloat;
       break;
    end;
    QryExec.Next;
  end;
  Result := wtx;
end;

function TDM_Olivier.CalculerTTC(const MontantHT: Double; const TauxTVA: Double): Double;
var
  PrixTTC: Double;
begin
  // Calcul du TTC brut
  PrixTTC := MontantHT * (1 + (TauxTVA / 100));

  // Arrondi à 2 décimales via multiplication/division par 100 et Round
  Result := Round(PrixTTC * 100) / 100;
end;

function TDM_Olivier.CalculerHT(const MontantTTC: Double; const TauxTVA: Double): Double;
begin
  // Formule : HT = TTC / (1 + TauxTVA / 100)
  Result := MontantTTC / (1 + (TauxTVA / 100));
  // On arrondit également le résultat HT pour éviter les décimales infinies
  Result := Round(Result * 100) / 100;
end;


procedure TDM_Olivier.RecalculerStockStodep(const CodeArt: string; const CodeDep: Integer);
var
  QteTotale, ValeurTotale, QteMvt, PrixMvt: Double;
  QteDepot: Double;
  Nature: string;
  SqlStr: string;
  PmpGlobal: Double;
begin
  // 1. On récupère tous les mouvements triés chronologiquement
  if PMPGlobalMode = 1 then
    SqlStr := 'SELECT QTE, VALUNIT, TYPE_, CODDEP FROM Stock WHERE CODART = :art ORDER BY DATE_ ASC, NOENR ASC'
  else
    SqlStr := 'SELECT QTE, VALUNIT, TYPE_, CODDEP FROM Stock WHERE CODART = :art AND CODDEP = :dep ORDER BY DATE_ ASC, NOENR ASC';

  FDQueryCalcul.SQL.Text := SqlStr;
  FDQueryCalcul.ParamByName('art').AsString := CodeArt;
  if PMPGlobalMode <> 1 then
    FDQueryCalcul.ParamByName('dep').AsInteger := CodeDep;
  FDQueryCalcul.Open;

  QteTotale := 0;
  ValeurTotale := 0;

  while not FDQueryCalcul.Eof do
  begin
    QteMvt := FDQueryCalcul.FieldByName('QTE').AsFloat;
    PrixMvt := FDQueryCalcul.FieldByName('VALUNIT').AsFloat;
    Nature := FDQueryCalcul.FieldByName('TYPE_').AsString;

    if Nature = 'I' then
    begin
      // L'inventaire redéfinit totalement la quantité et la valeur à cet instant précis
      QteTotale := QteMvt;
      ValeurTotale := QteMvt * PrixMvt;
    end
    else
    begin
      if QteMvt <> 0 then
      begin
        if QteMvt > 0 then // Entrée
        begin
          ValeurTotale := ValeurTotale + (QteMvt * PrixMvt);
          QteTotale := QteTotale + QteMvt;
        end
        else // Sortie (négatif)
        begin
          if QteTotale > 0 then
            ValeurTotale := ValeurTotale + (QteMvt * (ValeurTotale / QteTotale));
          QteTotale := QteTotale + QteMvt;
        end;
      end;
    end;

    if QteTotale <= 0 then
    begin
      QteTotale := 0;
      ValeurTotale := 0;
    end;
    FDQueryCalcul.Next;
  end;

  FDQueryCalcul.Close;

  // Calcul du PMP final global
  PmpGlobal := ifthen(QteTotale > 0, ValeurTotale / QteTotale, 0);

  // 2. Calcul propre de la quantité du dépôt
  QteDepot := QteTotale; // En mode dépôt strict, QteTotale est la quantité du dépôt.

  if PMPGlobalMode = 1 then
  begin
    // En mode global, on recalcule la quantité propre de ce dépôt spécifique
    // en prenant en compte son dernier inventaire et ce qui suit.
    // Le plus simple est de s'appuyer sur la logique de la boucle si on filtre par dépôt,
    // mais en mode global, la boucle mélange les dépôts.
    // Recalculons proprement pour CE dépôt :

    // On cherche s'il y a un inventaire pour ce dépôt et à quel NOENR/Date il est :
    FDQueryCalcul.SQL.Text := 'SELECT QTE, DATE_, NOENR FROM Stock WHERE CODART = :art AND CODDEP = :dep AND TYPE_ = ''I'' ORDER BY DATE_ DESC, NOENR DESC LIMIT 1';
    FDQueryCalcul.ParamByName('art').AsString := CodeArt;
    FDQueryCalcul.ParamByName('dep').AsInteger := CodeDep;
    FDQueryCalcul.Open;

    if not FDQueryCalcul.Eof then
    begin
      // S'il y a un inventaire, la quantité du dépôt = Inventaire + Somme(Mouvements après l'inventaire)
      // On récupère la date et le no enr de l'inventaire
      var InvDate := FDQueryCalcul.FieldByName('DATE_').AsDateTime;
      var InvNoEnr := FDQueryCalcul.FieldByName('NOENR').AsInteger;
      var InvQte := FDQueryCalcul.FieldByName('QTE').AsFloat;
      FDQueryCalcul.Close;

      // On somme les mouvements après cet inventaire pour ce dépôt
      FDQueryCalcul.SQL.Text := 'SELECT COALESCE(SUM(QTE), 0) AS QTE_APRES FROM Stock WHERE CODART = :art AND CODDEP = :dep AND ((DATE_ > :d) OR (DATE_ = :d AND NOENR > :n))';
      FDQueryCalcul.ParamByName('art').AsString := CodeArt;
      FDQueryCalcul.ParamByName('dep').AsInteger := CodeDep;
      FDQueryCalcul.ParamByName('d').AsDateTime := InvDate;
      FDQueryCalcul.ParamByName('n').AsInteger := InvNoEnr;
      FDQueryCalcul.Open;

      QteDepot := InvQte + FDQueryCalcul.FieldByName('QTE_APRES').AsFloat;
      FDQueryCalcul.Close;
    end
    else
    begin
      // Pas d'inventaire sur ce dépôt, somme classique
      FDQueryCalcul.SQL.Text := 'SELECT COALESCE(SUM(QTE), 0) AS QTE_DEP FROM Stock WHERE CODART = :art AND CODDEP = :dep';
      FDQueryCalcul.ParamByName('art').AsString := CodeArt;
      FDQueryCalcul.ParamByName('dep').AsInteger := CodeDep;
      FDQueryCalcul.Open;
      QteDepot := FDQueryCalcul.FieldByName('QTE_DEP').AsFloat;
      FDQueryCalcul.Close;
    end;
  end;

  // Mise à jour de STODEP pour le dépôt concerné
  FDQueryCalcul.SQL.Text := 'UPDATE STODEP SET QTE = :q, PMP = :p WHERE CODART = :a AND CODDEP = :d';
  FDQueryCalcul.Params.ParamByName('q').AsFloat := ifthen(PMPGlobalMode = 1, QteDepot, QteTotale);
  FDQueryCalcul.Params.ParamByName('p').AsFloat := PmpGlobal; // PMP spécifique au dépôt ou mode global
  FDQueryCalcul.Params.ParamByName('a').AsString := CodeArt;
  FDQueryCalcul.Params.ParamByName('d').AsInteger := CodeDep;
  FDQueryCalcul.ExecSQL;

  // 3. MISE À JOUR GLOBALE DE LA TABLE ARTICLE (AVEC UN VRAI PMP PONDÉRÉ GLOBAL)
  FDQueryCalcul.SQL.Text :=
    'UPDATE ARTICLE SET ' +
    'QTE = (SELECT COALESCE(SUM(QTE), 0) FROM STODEP WHERE CODART = :a), ' +
    'PMP = CASE ' +
    '        WHEN (SELECT COALESCE(SUM(QTE), 0) FROM STODEP WHERE CODART = :a) > 0 ' +
    '        THEN (SELECT COALESCE(SUM(QTE * PMP), 0) FROM STODEP WHERE CODART = :a) / (SELECT SUM(QTE) FROM STODEP WHERE CODART = :a) ' +
    '        ELSE 0 ' +
    '      END ' +
    'WHERE CODART = :a';

  FDQueryCalcul.Params.ParamByName('a').AsString := CodeArt;
  FDQueryCalcul.ExecSQL;
end;


procedure TDM_Olivier.ChargerParametresStock;
var
  FDQueryParam: TFDQuery;
begin
  FDQueryParam := TFDQuery.Create(nil);
  try
    FDQueryParam.Connection := DMGesCloud.ConnexionGesCloud; // Votre connexion active
    FDQueryParam.SQL.Text := 'SELECT PMP_GLO FROM ctrstock';
    FDQueryParam.Open;

    if not FDQueryParam.Eof then
      PMPGlobalMode := FDQueryParam.FieldByName('PMP_GLO').AsInteger
    else
      PMPGlobalMode := 0; // Valeur par défaut si la table est vide

    FDQueryParam.Close;
  finally
    FDQueryParam.Free;
  end;
end;


procedure TDM_Olivier.RecalculerToutLeStock;
var
  QQueryTemp: TFDQuery;
  ArtCode: string;
  DepCode: Integer;
begin
  QQueryTemp := TFDQuery.Create(nil);
  try
    QQueryTemp.Connection := DMGesCloud.ConnexionGesCloud; // Assurez-vous d'utiliser votre composant de connexion

    // On sélectionne tous les couples uniques Article / Dépôt présents dans les stocks ou dépôts
    // pour s'assurer de recalculer chaque dépôt existant pour chaque article.
    QQueryTemp.SQL.Text := 'SELECT DISTINCT CODART, CODDEP FROM STODEP ORDER BY CODART, CODDEP';
    QQueryTemp.Open;

    // Désactivation temporaire des événements/rafraîchissements si nécessaire pour la performance
    while not QQueryTemp.Eof do
    begin
      ArtCode := QQueryTemp.FieldByName('CODART').AsString;
      DepCode := QQueryTemp.FieldByName('CODDEP').AsInteger;

      // Appel de votre procédure unitaire pour chaque couple
      RecalculerStockStodep(ArtCode, DepCode);

      QQueryTemp.Next;
    end;
    QQueryTemp.Close;

    // Optionnel : Si certains articles ont des mouvements mais pas d'entrée dans STODEP,
    // on peut aussi balayer la table Stock au cas où :
    QQueryTemp.SQL.Text := 'SELECT DISTINCT s.CODART, s.CODDEP ' +
                           'FROM Stock s ' +
                           'LEFT JOIN STODEP d ON d.CODART = s.CODART AND d.CODDEP = s.CODDEP ' +
                           'WHERE s.CODDEP IS NOT NULL AND d.CODART IS NULL';
    QQueryTemp.Open;
    while not QQueryTemp.Eof do
    begin
      ArtCode := QQueryTemp.FieldByName('CODART').AsString;
      DepCode := QQueryTemp.FieldByName('CODDEP').AsInteger;

      RecalculerStockStodep(ArtCode, DepCode);

      QQueryTemp.Next;
    end;

  finally
    QQueryTemp.Free;
  end;
end;

procedure TDM_Olivier.RecalculerStockArticle(const CodeArt: string);
var
  QQueryTemp: TFDQuery;
  ArtCode: string;
  DepCode: Integer;
begin
  QQueryTemp := TFDQuery.Create(nil);
  try
    QQueryTemp.Connection := DMGesCloud.ConnexionGesCloud; // Assurez-vous d'utiliser votre composant de connexion

    // On sélectionne tous les couples uniques Article / Dépôt présents dans les stocks ou dépôts
    // pour s'assurer de recalculer chaque dépôt existant pour chaque article.
    QQueryTemp.SQL.Text := 'SELECT DISTINCT CODART, CODDEP FROM STODEP WHERE CODART=:ART ORDER BY CODART, CODDEP';
    QQueryTemp.Params.ParamByName('art').AsString := CodeArt;
    QQueryTemp.Open;

    // Désactivation temporaire des événements/rafraîchissements si nécessaire pour la performance
    while not QQueryTemp.Eof do
    begin
      ArtCode := QQueryTemp.FieldByName('CODART').AsString;
      DepCode := QQueryTemp.FieldByName('CODDEP').AsInteger;

      // Appel de la procédure unitaire pour chaque couple
      RecalculerStockStodep(ArtCode, DepCode);

      QQueryTemp.Next;
    end;
    QQueryTemp.Close;

  finally
    QQueryTemp.Free;
  end;
end;


function TDM_Olivier.GetEAN13CheckDigitFrom13(const A13Digits: string): string;
var
  i, sum: Integer;
  Base12: string;
  CalculatedKey: Char;
begin
  // On s'assure de ne garder que les 12 premiers chiffres
  Base12 := Copy(A13Digits, 1, 12);

  sum := 0;
  for i := 1 to 12 do
  begin
    if (i mod 2 = 0) then
      sum := sum + (Ord(Base12[i]) - Ord('0')) * 3
    else
      sum := sum + (Ord(Base12[i]) - Ord('0'));
  end;

  CalculatedKey := Chr(Ord('0') + ((10 - (sum mod 10)) mod 10));

  // Renvoie le code complet de 13 chiffres avec la bonne clé recalculée
  Result := Base12 + CalculatedKey;
end;

end.
