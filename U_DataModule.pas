unit U_DataModule;

interface

uses
  System.IOUtils, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Variants, Vcl.Dialogs, System.IniFiles, Vcl.Forms,
  uChangePasswordDlg, uSecDlg, uLoginDlg, uSecControl;


type
  // 1. Déclarer le type ICI (AVANT la classe)
  TProcLigne = reference to procedure(AQuery: TFDQuery);

  // 2. puis la classe
  TDMGesCloud = class(TDataModule)
    ConnexionGesCloud: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    ReqClients: TFDQuery;
    ReqRepres: TFDQuery;
    ReqGeo: TFDQuery;
    ReqVerification: TFDQuery;
    ReqPaiement: TFDQuery;
    ReqTarif: TFDQuery;
    ReqTarifcli: TFDQuery;
    ReqArticlesOuverts: TFDQuery;
    ReqSaisieTarif: TFDQuery;
    FDQueryPrintEntvteaa: TFDQuery;
    FDQueryLigvteaa: TFDQuery;
    FDQueryReglaa: TFDQuery;
    FDQueryCtrstock: TFDQuery;
    FDQueryParameTVA: TFDQuery;
    FDQueryRepres: TFDQuery;
    FDQueryFamilles: TFDQuery;
    uilLoginDlg1: TuilLoginDlg;
    uilSecurityDlg1: TuilSecurityDlg;
    uilChangePasswordDlg1: TuilChangePasswordDlg;
    uilSecurityManager1: TuilSecurityManager;
    QrySecUsers: TFDQuery;
    dsUsers: TDataSource;
    dsPermissions: TDataSource;
    dsGroups: TDataSource;
    dsUserGroups: TDataSource;
    QrySecGroups: TFDQuery;
    QrySecPermissions: TFDQuery;
    QrySecUserGroups: TFDQuery;
    QryUserRights: TFDQuery;

    procedure ReqSaisieTarifBeforePost(DataSet: TDataSet);
    procedure ReqClientsBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure QrySecUsersNewRecord(DataSet: TDataSet);


  private
    { Déclarations privées }
    function OnGlobalHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure InitialiserTypesDocuments;

  public
    FUserRights: TStringList;
    LoggedUser: string;
    { Déclarations publiques }
    function ExisteEnregistrement(const NomTable: string; const Champs: array of string; const Valeurs: array of string; QueryOutil: TFDQuery): Boolean;
    function CreerRequeteTemp: TFDQuery;
    procedure LibererRequeteTemp(var QueryOutil: TFDQuery);
    function LireEnregistrements(const NomTable: string; const Champs: array of string; const Valeurs: array of string): TFDQuery;
    function MontantEnLettres(Montant: Double): string;
    procedure Parcourir(const ASQL: string; AAction: TProcLigne);
    procedure ExecuteSQL(const ASQL: string);
    function GetValue(const ASQL: string): Variant;
    function GetProchainCodCli: Integer;
    function HasPermission(const Code: string): Boolean;
    procedure ChargerDroitsUtilisateur(const AUsername: string);
    procedure InitialiserBaseSecurite;
  end;

var
  DMGesCloud: TDMGesCloud;

implementation

{$R *.dfm}

uses U_FormAide;



procedure TDMGesCloud.InitialiserTypesDocuments;
begin
  ConnexionGesCloud.ExecSQL(
    'INSERT IGNORE INTO chrono (type_, prefix, chrono) VALUES ' +
    '(''F'', ''DEV01'', 0), ' +
    '(''F'', ''FAC01'', 0), ' +
    '(''A'', ''CBR01'', 1000000000000)'
  );
end;

//procedure TDMGesCloud.RegisterPermission(const APermissionName, ADescription: string);
//var
//  QryCheck: TFDQuery;
//begin
//  QryCheck := TFDQuery.Create(nil);
//  try
//    QryCheck.Connection := ConnexionGesCloud;
//
//    // 1. Vérification si la permission existe déjà dans sec_permissions
//    QryCheck.SQL.Text := 'SELECT 1 FROM sec_permissions WHERE PERMISSION_NAME = :PERM LIMIT 1';
//    QryCheck.ParamByName('PERM').AsString := APermissionName;
//    QryCheck.Open;
//
//    // 2. Si elle n'existe pas, on l'ajoute en BDD
//    if QryCheck.IsEmpty then
//    begin
//      ConnexionGesCloud.ExecSQL(
//        'INSERT INTO sec_permissions (PERMISSION_NAME) VALUES (:PERM)',
//        [APermissionName]
//      );
//
//      // Rafraîchissement du dataset si ouvert
//      if QrySecPermissions.Active then
//        QrySecPermissions.Refresh;
//    end;
//  finally
//    QryCheck.Free;
//  end;
//end;

function TDMGesCloud.OnGlobalHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
var
  PageAide: string;
  BaseURL: string;
begin
  CallHelp := False; // Désactive le système d'aide Windows legacy (WinHelp/CHM)

  // URL de base (peut être un site distant ou un dossier local "Help" à côté de l'exe)
  BaseURL := ExtractFilePath(ParamStr(0)) + 'Aide\';
  // Ou en ligne : BaseURL := 'https://mon-aide-en-ligne.com/doc/';

  // On récupère le mot-clé d'aide de la fiche active
  if (Screen.ActiveForm <> nil) and (Screen.ActiveForm.HelpKeyword <> '') then
    PageAide := Screen.ActiveForm.HelpKeyword
  else
    PageAide := 'index.html'; // Page par défaut si non spécifié

  // Création et affichage de la fiche d'aide
  if not Assigned(FormAide) then
    FormAide := TFormAide.Create(Application);

  FormAide.AfficherAide(BaseURL + PageAide);

  Result := True;
end;

 //Super exemple de creation de requete de manipulation de donnees avec retour de fonction.
function TDMGesCloud.GetProchainCodCli: Integer;
var
  Qry: TFDQuery;
begin
  Result := 1; // Valeur par défaut si la table est vide
  Qry := CreerRequeteTemp;
  try
    // IFNULL / COALESCE selon MySQL
    Qry.SQL.Text := 'SELECT COALESCE(MAX(CODCLI), 0) + 1 AS Suivant FROM client';
    Qry.Open;
    if not Qry.IsEmpty then
      Result := Qry.FieldByName('Suivant').AsInteger;
  finally
    LibererRequeteTemp(Qry);
  end;
end;



function TDMGesCloud.ExisteEnregistrement(const NomTable: string; const Champs: array of string; const Valeurs: array of string; QueryOutil: TFDQuery): Boolean;
var
  i: Integer;
  ClauseWhere: string;
  begin
    Result := False;

    // 1. Sécurité
    if Length(Champs) <> Length(Valeurs) then
      raise Exception.Create('Erreur : Le nombre de champs et de valeurs ne correspond pas.');

    // 2. Construction de la clause WHERE
    ClauseWhere := '';
    for i := 0 to High(Champs) do
    begin
      if i > 0 then ClauseWhere := ClauseWhere + ' AND ';
      ClauseWhere := ClauseWhere + Champs[i] + ' = :p' + IntToStr(i);
    end;

    // 3. Préparation de la requête
    QueryOutil.Close;
    QueryOutil.SQL.Text := 'SELECT * FROM ' + NomTable + ' WHERE ' + ClauseWhere;

    // 4. Injection des paramètres
    for i := 0 to High(Valeurs) do
    begin
      QueryOutil.Params[i].AsString := Valeurs[i];
    end;

    // 5. Ouverture
    QueryOutil.Open;

    Result := not QueryOutil.IsEmpty;
  end;


function TDMGesCloud.CreerRequeteTemp: TFDQuery;
begin
  // On crée l'objet en mémoire
  Result := TFDQuery.Create(nil);
  // On lui attribue tout de suite la connexion pour qu'il soit prêt à l'emploi
  Result.Connection := ConnexionGesCloud;
end;

procedure TDMGesCloud.LibererRequeteTemp(var QueryOutil: TFDQuery);
begin
  if Assigned(QueryOutil) then
  begin
    QueryOutil.Close;
    QueryOutil.Free;
    QueryOutil := nil; // Sécurité : évite les pointeurs "fantômes"
  end;
end;

function TDMGesCloud.LireEnregistrements(const NomTable: string; const Champs: array of string; const Valeurs: array of string): TFDQuery;
var
  i: Integer;
  ClauseWhere: string;
begin
  // 1. On crée la requête en mémoire
  Result := TFDQuery.Create(nil);
  try
    Result.Connection := ConnexionGesCloud;

    // 2. Construction de la clause WHERE
    ClauseWhere := '';
    for i := 0 to High(Champs) do
    begin
      if i > 0 then ClauseWhere := ClauseWhere + ' AND ';
      ClauseWhere := ClauseWhere + Champs[i] + ' = :p' + IntToStr(i);
    end;

    // 3. Préparation et injection des paramètres
    Result.SQL.Text := 'SELECT * FROM ' + NomTable + ' WHERE ' + ClauseWhere;
    for i := 0 to High(Valeurs) do
    begin
      Result.Params[i].AsString := Valeurs[i];
    end;

    // 4. On ouvre le lot d'enregistrements
    Result.Open;

  except
    // Sécurité : si le SQL plante à l'ouverture, on libère la mémoire
    Result.Free;
    raise;
  end;
end;


//BEFOREPOST ReqClients
procedure TDMGesCloud.ReqClientsBeforePost(DataSet: TDataSet);
begin
  // Exemple de contrôle : le nom du client est obligatoire
  if Trim(DataSet.FieldByName('NOM').AsString) = '' then
    raise Exception.Create('Le nom du client ne peut pas être vide.');

  // Exemple : forcer la mise en majuscules du NOM client
  DataSet.FieldByName('NOM').AsString := UpperCase(DataSet.FieldByName('NOM').AsString);
end;



//BEFOREPOST ReqSaisieTarif
procedure TDMGesCloud.ReqSaisieTarifBeforePost(DataSet: TDataSet);
var
  Prix, Remise: Double;
  ReqVerification: TFDQuery;
  CodCli, CodArt: string;
begin
  // 1. Contrôle de cohérence : Prix vs Remise
  Prix := DataSet.FieldByName('PRIXVTE').AsFloat;
  Remise := DataSet.FieldByName('PRC_REMISE').AsFloat;

  if (Prix = 0) and (Remise = 0) then
    raise Exception.Create('Veuillez saisir soit un Prix de vente, soit une Remise.');

  if (Prix > 0) and (Remise > 0) then
    raise Exception.Create('Vous ne pouvez pas cumuler un Prix ET une Remise. Choisissez-en un seul.');


  // 2. Contrôle des doublons (uniquement en mode Insertion/Ajout)
  if DataSet.State = dsInsert then
  begin
    CodCli := DataSet.FieldByName('CODCLI').AsString;
    CodArt := DataSet.FieldByName('CODART').AsString;

    ReqVerification := CreerRequeteTemp;
    try
      if ExisteEnregistrement('tarifcli', ['CODCLI', 'CODART'], [CodCli, CodArt], ReqVerification) then
      begin
        // Le raise Exception va couper le Post, afficher ce message propre
        // et empêcher la fiche de se fermer !
        raise Exception.Create('Un tarif existe déjà pour cet article chez ce client !');
      end;
    finally
      LibererRequeteTemp(ReqVerification);
    end;
  end;
end;


function TDMGesCloud.MontantEnLettres(Montant: Double): string;
var
  Valeur: Int64;

  function ConvertirCentaine(N: Integer): string;
  var
    Unites, Dizaines, Centaines: Integer;
    Res: string;
    TabUnites: array[0..19] of string;
    TabDizaines: array[0..9] of string;
  begin
    TabUnites[0] := ''; TabUnites[1] := 'un'; TabUnites[2] := 'deux'; TabUnites[3] := 'trois';
    TabUnites[4] := 'quatre'; TabUnites[5] := 'cinq'; TabUnites[6] := 'six'; TabUnites[7] := 'sept';
    TabUnites[8] := 'huit'; TabUnites[9] := 'neuf'; TabUnites[10] := 'dix'; TabUnites[11] := 'onze';
    TabUnites[12] := 'douze'; TabUnites[13] := 'treize'; TabUnites[14] := 'quatorze';
    TabUnites[15] := 'quinze'; TabUnites[16] := 'seize'; TabUnites[17] := 'dix-sept';
    TabUnites[18] := 'dix-huit'; TabUnites[19] := 'dix-neuf';

    TabDizaines[0] := ''; TabDizaines[1] := 'dix'; TabDizaines[2] := 'vingt'; TabDizaines[3] := 'trente';
    TabDizaines[4] := 'quarante'; TabDizaines[5] := 'cinquante'; TabDizaines[6] := 'soixante';
    TabDizaines[7] := 'soixante-dix'; TabDizaines[8] := 'quatre-vingt'; TabDizaines[9] := 'quatre-vingt-dix';

    Centaines := N div 100;
    Dizaines  := (N mod 100) div 10;
    Unites    := N mod 10;

    // CORRECTION ICI : Gestion rigoureuse des centaines uniques et multiples
    Res := '';
    if Centaines > 0 then
    begin
      if Centaines = 1 then
        Res := 'cent'
      else
      begin
        // Met un "s" à cents si c'est une centaine pile (ex: deux cents)
        if (Dizaines = 0) and (Unites = 0) then
          Res := TabUnites[Centaines] + ' cents'
        else
          Res := TabUnites[Centaines] + ' cent';
      end;
    end;

    // Gestion des dizaines et unités
    if Dizaines in [7, 9] then
    begin
      if Res <> '' then Res := Res + ' ';
      Res := Res + TabDizaines[Dizaines - 1];
      if (Dizaines = 7) and (Unites = 1) then
        Res := Res + ' et onze'
      else
        Res := Res + '-' + TabUnites[Unites + 10];
    end
    else
    begin
      if (Dizaines > 0) or (Unites > 0) then
      begin
        if Res <> '' then Res := Res + ' ';

        if (Dizaines > 0) and (Unites = 0) and (Dizaines = 8) then
          Res := Res + 'quatre-vingts'
        else if Dizaines > 0 then
        begin
          Res := Res + TabDizaines[Dizaines];
          if (Unites = 1) and (Dizaines <> 8) then
            Res := Res + ' et un'
          else if Unites > 0 then
            Res := Res + '-' + TabUnites[Unites];
        end
        else
          Res := Res + TabUnites[Unites];
      end;
    end;

    Result := Res;
  end;

var
  Milliards, Millions, Milliers, Reste: Integer;
  StrMilliards, StrMillions, StrMilliers, StrReste: string;
begin
  Valeur := Round(Montant);

  if Valeur = 0 then
  begin
    Result := 'zéro';
    Exit;
  end;

  Milliards := Valeur div 1000000000;
  Millions  := (Valeur mod 1000000000) div 1000000;
  Milliers  := (Valeur mod 1000000) div 1000;
  Reste     := Valeur mod 1000;

  StrMilliards := ConvertirCentaine(Milliards);
  StrMillions  := ConvertirCentaine(Millions);
  StrMilliers  := ConvertirCentaine(Milliers);
  StrReste     := ConvertirCentaine(Reste);

  Result := '';

  if StrMilliards <> '' then
  begin
    if Milliards > 1 then
      Result := StrMilliards + ' milliards'
    else
      Result := StrMilliards + ' milliard';
  end;

  if StrMillions <> '' then
  begin
    if Result <> '' then Result := Result + ' ';
    if Millions > 1 then
      Result := Result + StrMillions + ' millions'
    else
      Result := Result + StrMillions + ' million';
  end;

  if StrMilliers <> '' then
  begin
    if Result <> '' then Result := Result + ' ';
    if Milliers = 1 then
      Result := Result + 'mille' // On dit "mille", jamais "un mille"
    else
      Result := Result + StrMilliers + ' mille';
  end;

  if StrReste <> '' then
  begin
    if Result <> '' then Result := Result + ' ';
    Result := Result + StrReste;
  end;

  if Result <> '' then
    Result := UpperCase(Result[1]) + Copy(Result, 2, MaxInt);
end;



//Pour executer une requete dans une VCL (fenetre) HLITRECHERCHE...
function TDMGesCloud.GetValue(const ASQL: string): Variant;
begin
  // ExecSQLScalar exécute la requête et renvoie directement la 1ère colonne de la 1ère ligne
  Result := ConnexionGesCloud.ExecSQLScalar(ASQL);

  //EXEMPLE UTILISATION:
  // Récupère le nom du client 12 en une ligne :
  //NomClient := DMGesCloud.GetValue('SELECT nom FROM clients WHERE id = 12');

end;

procedure TDMGesCloud.InitialiserBaseSecurite;
begin
  if not ConnexionGescloud.Connected then Exit;

  // Init chronos
  InitialiserTypesDocuments;

  // 1. Table Utilisateurs
  ConnexionGescloud.ExecSQL(
    'CREATE TABLE IF NOT EXISTS sec_users (' +
    '  ID INT AUTO_INCREMENT PRIMARY KEY, ' +
    '  USERNAME VARCHAR(50) NOT NULL UNIQUE, ' +
    '  PASSWORD VARCHAR(250), ' +
    '  FULLNAME VARCHAR(100), ' +
    '  ENABLED TINYINT(1) DEFAULT 1, ' +
    '  CREATEDDATE DATE, ' +
    '  CREATEDTIME TIME, ' +
    '  LASTACCESS DATE, ' +
    '  LASTACCTIME TIME, ' +
    '  ACCESSCOUNT INT DEFAULT 0)'
  );

  // Insertion de quelques droits par défaut si la table est vide (pour test)
  ConnexionGescloud.ExecSQL(
    'INSERT IGNORE INTO sec_users (USERNAME, ENABLED, CREATEDDATE, CREATEDTIME) VALUES ' +
    '(''Administrator'', 1, Curdate(), Curtime())'
  );

  // 2. Table Groupes
  ConnexionGescloud.ExecSQL(
    'CREATE TABLE IF NOT EXISTS sec_groups (' +
    '  ID INT AUTO_INCREMENT PRIMARY KEY, ' +
    '  GROUP_NAME VARCHAR(50), ' +
    '  DESCRIPTION VARCHAR(255))'
  );

  // 3. Table de référence de toutes les permissions disponibles dans l'application
  ConnexionGescloud.ExecSQL(
    'CREATE TABLE IF NOT EXISTS sec_permissions_name (' +
    '  ID INT AUTO_INCREMENT PRIMARY KEY, ' +
    '  PERMISSION_CODE VARCHAR(100) NOT NULL UNIQUE, ' +
    '  DESCRIPTION VARCHAR(255))'
  );

  // Insertion de quelques droits par défaut si la table est vide (pour test)
  ConnexionGescloud.ExecSQL(
    'INSERT IGNORE INTO sec_permissions_name (PERMISSION_CODE, DESCRIPTION) VALUES ' +
    '(''application_configuration'', ''Gestion des paramètres généraux''), ' +
    '(''superviseur'', ''Tout accès''), ' +
    '(''acces_caisse'', ''Ouverture et gestion des postes de caisse'')'
  );

  // 4. Table Permissions (USER_ID en VARCHAR pour stocker le login)
  ConnexionGescloud.ExecSQL(
    'CREATE TABLE IF NOT EXISTS sec_permissions (' +
    '  ID INT AUTO_INCREMENT PRIMARY KEY, ' +
    '  USER_ID VARCHAR(50), ' +
    '  GROUP_ID INT, ' +
    '  PERMISSION_NAME VARCHAR(100), ' +
    '  FORM_NAME VARCHAR(100), ' +
    '  ITEM_NAME VARCHAR(100), ' +
    '  ACTION VARCHAR(50))'
  );

  // Insertion automatique du droit 'superviseur' pour l'Administrator par défaut
  ConnexionGescloud.ExecSQL(
    'INSERT INTO sec_permissions (USER_ID, PERMISSION_NAME) ' +
    'SELECT u.ID, ''superviseur'' FROM sec_users u WHERE u.USERNAME = ''Administrator'' ' +
    'AND NOT EXISTS (' +
    '  SELECT 1 FROM sec_permissions p WHERE p.USER_ID = u.ID AND p.PERMISSION_NAME = ''superviseur''' +
    ')'
  );

  // 5. Table de liaison Utilisateurs <-> Groupes
  ConnexionGescloud.ExecSQL(
    'CREATE TABLE IF NOT EXISTS sec_user_groups (' +
    '  ID INT AUTO_INCREMENT PRIMARY KEY, ' +
    '  USER_ID VARCHAR(50), ' +
    '  GROUP_ID INT)'
  );

  // Ouvrir impérativement toutes les requêtes de sécurité pour TMS
  QrySecUsers.Open;
  QrySecGroups.Open;
  QrySecPermissions.Open;
  QrySecUserGroups.Open;
end;

procedure TDMGesCloud.DataModuleCreate(Sender: TObject);
var
  FichierIni: TIniFile;
  CheminIni: string;
begin
  {$IFNDEF DEBUG}
//  // --- MODE RELEASE (Exécution chez le client) ---
//  // On lit le fichier config.ini uniquement hors mode Debug
//  CheminIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
//
//  if FileExists(CheminIni) then
//  begin
//    ConnexionGescloud.Connected := False;
//    FichierIni := TIniFile.Create(CheminIni);
//    try
//      if FichierIni.ValueExists('Database', 'Server') then
//        ConnexionGescloud.Params.Values['Server'] := FichierIni.ReadString('Database', 'Server', '');
//
//      if FichierIni.ValueExists('Database', 'User') then
//        ConnexionGescloud.Params.Values['User_Name'] := FichierIni.ReadString('Database', 'User', '');
//
//      if FichierIni.ValueExists('Database', 'Password') then
//        ConnexionGescloud.Params.Values['Password'] := FichierIni.ReadString('Database', 'Password', '');
//
//      if FichierIni.ValueExists('Database', 'Database') then
//        ConnexionGescloud.Params.Values['Database'] := FichierIni.ReadString('Database', 'Database', '');
//    finally
//      FichierIni.Free;
//    end;
//  end;
  {$ENDIF}

  // --- OUVERTURE DE LA CONNEXION ---
  // S'exécute aussi bien en Debug (avec paramètres FireDAC) qu'en Release (avec config.ini)
  try
    if not ConnexionGescloud.Connected then
      ConnexionGescloud.Connected := True;
  except
    on E: Exception do
      ShowMessage('Impossible de se connecter à la base de données : ' + E.Message);
  end;

  // Redirection de la touche F1 vers votre procédure d'aide
  Application.OnHelp := OnGlobalHelp;

end;

procedure TDMGesCloud.ChargerDroitsUtilisateur(const AUsername: string);
begin
  LoggedUser := AUsername;

  if not Assigned(FUserRights) then
  begin
    FUserRights := TStringList.Create;
    FUserRights.Sorted := True;
    FUserRights.Duplicates := dupIgnore;
  end;

  FUserRights.Clear;
  try
    QryUserRights.Close;
    // Jointure pour retrouver les permissions via le USERNAME de sec_users
    QryUserRights.SQL.Text :=
      'SELECT p.PERMISSION_NAME ' +
      'FROM sec_permissions p ' +
      'JOIN sec_users u ON u.ID = p.USER_ID ' +
      'WHERE u.USERNAME = :uname';

    QryUserRights.ParamByName('uname').AsString := LoggedUser;
    QryUserRights.Open;

    while not QryUserRights.Eof do
    begin
      FUserRights.Add(UpperCase(QryUserRights.FieldByName('PERMISSION_NAME').AsString));
      QryUserRights.Next;
    end;
    QryUserRights.Close;
  except
    on E: Exception do
      ShowMessage('Erreur chargement des droits : ' + E.Message);
  end;
  //ShowMessage('Nombre de droits chargés : ' + IntToStr(DMGesCloud.FUserRights.Count));
end;


function TDMGesCloud.HasPermission(const Code: string): Boolean;
begin
  if DMGesCloud.FUserRights.Count <> 0 then
     Result := FUserRights.IndexOf(UpperCase(Code)) <> -1
  else
     Result := True;
end;

procedure TDMGesCloud.DataModuleDestroy(Sender: TObject);
begin
  FUserRights.Free;
end;


//HMODIFIE , HAJOUTE , HSUPPRIME
procedure TDMGesCloud.ExecuteSQL(const ASQL: string);
begin
  ConnexionGesCloud.ExecSQL(ASQL);

  // Exemple: Met à jour un statut directement :
  //DMGesCloud.ExecuteSQL('UPDATE clients SET actif = 1 WHERE id = 12');

end;


//Parcourir une Table SQL
procedure TDMGesCloud.Parcourir(const ASQL: string; AAction: TProcLigne);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := ConnexionGesCloud;
    Qry.SQL.Text := ASQL;
    Qry.Open;

    Qry.First;
    while not Qry.Eof do
    begin
      // Exécute le traitement spécifique transmis
      AAction(Qry);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDMGesCloud.QrySecUsersNewRecord(DataSet: TDataSet);
begin
  // Attribuer la date du jour (champ CREATEDDATE)
  DataSet.FieldByName('CREATEDDATE').AsDateTime := Date;

  // Attribuer l'heure actuelle (champ CREATEDTIME)
  DataSet.FieldByName('CREATEDTIME').AsDateTime := Time;

  // Activer par défaut l'utilisateur (champ ENABLED)
  DataSet.FieldByName('ENABLED').AsBoolean := True;
end;



//Et son utilisation (par exemple)
//Exemple : Lister le nom de tous les clients actifs
//DMGesCloud.Parcourir('SELECT nom, ville FROM clients WHERE actif = 1',
//  procedure(Qry: TFDQuery)
//  begin
//    // Ce code est exécuté automatiquement pour CHAQUE ligne :
//    ListBox1.Items.Add(Qry.FieldByName('nom').AsString + ' - ' + Qry.FieldByName('ville').AsString);
//  end
//);
//Synthèse de votre boîte à outils FireDAC / WinDev
//Dans votre DataModule, vous disposez désormais de 3 méthodes ultra-condensées :
//
//GetValue('SELECT ...') : Récupère une valeur unique (style HLitRecherche).
//
//ExecuteSQL('UPDATE / INSERT ...') : Modifie la base sans retour de données (style HAjoute / HModifie).
//
//Parcourir('SELECT ...', ...) : Parcourt une table ligne par ligne (style HLitPremier / HLitSuivant).

end.
