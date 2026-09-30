unit U_FormParametresRelevesClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls, frCoreClasses, frxClass, frxDBSet;

type
  TFormParametresRelevesClients = class(TForm)
    DBLookupComboBoxClientDu: TDBLookupComboBox;
    FDQueryClientsDu: TFDQuery;
    DSClientDu: TDataSource;
    DSClientAu: TDataSource;
    DBLookupComboBoxClientAu: TDBLookupComboBox;
    FDQueryClientsAu: TFDQuery;
    CheckBoxSoldees: TCheckBox;
    CheckBoxNonSoldees: TCheckBox;
    BtnImprimer: TButton;
    Button1: TButton;
    JvDateEditDu: TJvDateEdit;
    JvDateEditAu: TJvDateEdit;
    frxReportReleves: TfrxReport;
    FDQueryReleves: TFDQuery;
    frxDBDatasetReleves: TfrxDBDataset;
    FDQueryRelevesCODCLI: TIntegerField;
    FDQueryRelevesDATE_: TDateField;
    FDQueryRelevesTOP_: TStringField;
    FDQueryRelevesLIBELLE: TStringField;
    FDQueryRelevesDEBIT: TLargeintField;
    FDQueryRelevesCREDIT: TLargeintField;
    FDQueryRelevesANNEE: TIntegerField;
    FDQueryRelevesMOIS: TSmallintField;
    FDQueryRelevesDATE_ECH: TDateField;
    FDQueryRelevesCODPAI: TStringField;
    FDQueryRelevesSOLDE: TSmallintField;
    FDQueryRelevesSELECT_: TSmallintField;
    FDQueryRelevesDATE_OPER: TDateField;
    FDQueryRelevesDATE_COMPTA: TDateField;
    FDQueryRelevesREFERENCE_: TStringField;
    FDQueryRelevesTYPE_: TStringField;
    FDQueryRelevesCODREP: TSmallintField;
    FDQueryRelevesORIGIN: TStringField;
    FDQueryRelevesLETTRE: TStringField;
    FDQueryRelevesNOENR: TFDAutoIncField;
    FDQueryRelevesDER_MODIF: TSQLTimeStampField;
    FDQueryRelevesCODJAL: TStringField;
    FDQueryRelevesnom: TStringField;
    FDQueryRelevesad1: TStringField;
    FDQueryRelevesad2: TStringField;
    FDQueryRelevesad3: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnImprimerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBoxClientDuClick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormParametresRelevesClients: TFormParametresRelevesClients;

implementation

{$R *.dfm}
  uses U_DataModule, U_DM_Olivier, U_FrameEcrituresClients;


procedure TFormParametresRelevesClients.BtnImprimerClick(Sender: TObject);
begin

  // 1. Lire vos paramètres globaux (via une requête ou un fichier de config)
  DM_Olivier.FDQueryCtrstock.open;

  if DM_Olivier.FDQueryCtrstock.IsEmpty then
    Exit;

     // 2. Charger le modèle d'état externe
    frxReportReleves.LoadFromFile('RelevesClients.fr3');

  // 2. Vider les variables mémoire pour repartir proprement
  frxReportReleves.Variables.Clear;

  // 3. CRÉER AUTOMATIQUEMENT la catégorie et les variables
  // ATTENTION : FastReport impose de créer au moins une catégorie (commençant par un espace)
  // avant d'y injecter des variables.
  frxReportReleves.Variables[' ' + 'Globales'] := Null;

  // On ajoute les variables à la catégorie qui vient d'être créée
  frxReportReleves.Variables.AddVariable('Globales','VarNomEntreprise',
  ( DM_Olivier.FDQueryCtrstock.FieldByName('Nom').AsString + #13#10 +
    DM_Olivier.FDQueryCtrstock.FieldByName('Nom2').AsString ));
  frxReportReleves.Variables.AddVariable('Globales','VarTelephone', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('Tel').AsString));
  frxReportReleves.Variables.AddVariable('Globales','VarAdresse', DM_Olivier.FDQueryCtrstock.FieldByName('Adresse').AsString);
  frxReportReleves.Variables.AddVariable('Globales','VarNoTAHITI', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('NOTAHITI').AsString));
  frxReportReleves.Variables.AddVariable('Globales','VarLOGO', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('LOGO').AsString));
  frxReportReleves.Variables.AddVariable('Globales','VarEMAIL', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('EMAIL').AsString));
  frxReportReleves.Variables.AddVariable('Globales','VarFAX', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('FAX').AsString));
  frxReportReleves.Variables.AddVariable('Globales','VarRC', QuotedStr(DM_Olivier.FDQueryCtrstock.FieldByName('RC').AsString));
  frxReportReleves.Variables.AddVariable('Globales','VarRef_Bancaire', DM_Olivier.FDQueryCtrstock.FieldByName('BANQUE').AsString);
  frxReportReleves.Variables.AddVariable('Globales','VarDate1', JvDateEditDu.Date);
  frxReportReleves.Variables.AddVariable('Globales','VarDate2', JvDateEditAu.Date);

//  //Lecture representant
//  DM_Olivier.FDQueryRepres.SQL.Text:='select * from repres where codrep=:codrep';
//  DM_Olivier.FDQueryRepres.ParamByName('CODREP').AsInteger:= FDQueryReleves.FieldByName('CODREP').AsInteger;
//  DM_Olivier.FDQueryRepres.Open;
//  frxReportReleves.Variables.AddVariable('Globales','VarRepres', QuotedStr(DM_Olivier.FDQueryRepres.FieldByName('NOM').AsString));

  // 1. Activer la requête SQL contenant les données du devis
  FDQueryReleves.ParamByName('CODCLI1').AsInteger := DBLookupComboBoxClientDu.KeyValue;
  FDQueryReleves.ParamByName('CODCLI2').AsInteger := DBLookupComboBoxClientAu.KeyValue;
  FDQueryReleves.ParamByName('DATE1').AsDateTime := JvDateEditDu.Date;
  FDQueryReleves.ParamByName('DATE2').AsDateTime := JvDateEditAu.Date;

  // 2. Gestion des cases à cocher pour le solde
  if CheckBoxSoldees.Checked and CheckBoxNonSoldees.Checked then
  begin
    // Les deux sont cochées : on désactive le filtre sur le solde (:tout = 1)
    FDQueryReleves.ParamByName('tout').AsInteger := 1;
    FDQueryReleves.ParamByName('valeur_solde').AsInteger := 0; // Valeur neutre
  end
  else if CheckBoxSoldees.Checked then
  begin
    // Uniquement les soldées (solde = 1)
    FDQueryReleves.ParamByName('tout').AsInteger := 0;
    FDQueryReleves.ParamByName('valeur_solde').AsInteger := 1;
  end
  else if CheckBoxNonSoldees.Checked then
    begin
    // Uniquement les non soldées (solde = 0)
    FDQueryReleves.ParamByName('tout').AsInteger := 0;
    FDQueryReleves.ParamByName('valeur_solde').AsInteger := 0;
  end
  else
  begin
    // Aucune n'est cochée : on bloque tout (on force une condition fausse)
    FDQueryReleves.ParamByName('tout').AsInteger := 0;
    FDQueryReleves.ParamByName('valeur_solde').AsInteger := -999; // Valeur impossible
  end;

  // 3. Ouverture de la requête
  FDQueryReleves.Open;
  // 3. Afficher l'aperçu avant impression à l'écran
  frxReportReleves.ShowReport;

end;

procedure TFormParametresRelevesClients.DBLookupComboBoxClientDuClick(
  Sender: TObject);
begin
  DBLookupComboBoxClientAu.KeyValue:=DBLookupComboBoxClientDu.KeyValue;
end;

procedure TFormParametresRelevesClients.FormCreate(Sender: TObject);
begin
  JvDateEditDu.Date := EncodeDate(2000, 1, 1);
  JvDateEditAu.Date:=Now;
  CheckBoxNonSoldees.Checked:=true;
end;

procedure TFormParametresRelevesClients.FormShow(Sender: TObject);
begin
  FDQueryClientsDu.open;
  FDQueryClientsAu.open;
end;

end.
