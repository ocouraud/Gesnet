unit U_TableJournal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, RzTabs, System.UITypes;

type
  TFrameTableJournaux = class(TFrame)
    FDQueryJournal: TFDQuery;
    DSJournal: TDataSource;
    JvDBGrid1: TJvDBGrid;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnSupprimer: TBitBtn;
    procedure BtnAideClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure FDQueryJournalBeforePost(DataSet: TDataSet);
    procedure BtnSupprimerClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DM_Olivier, U_DataModule, U_FormAide;

procedure TFrameTableJournaux.BtnAideClick(Sender: TObject);
begin
   // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('journal_liste.html');
end;

procedure TFrameTableJournaux.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableJournaux.BtnSupprimerClick(Sender: TObject);
var
  QryExec: TFDQuery;
begin
  // 1. Vérifier qu'il y a bien un enregistrement à supprimer
  if FDQueryJournal.IsEmpty then Exit;

  // Controle si pre-existance journal en tresorerie
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryJournal.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'select codjal FROM tresor WHERE codjal = :codjal limit 1';
    QryExec.ParamByName('codjal').AsString := FDQueryJournal.FieldByName('CODJAL').AsString;
    QryExec.Open;
    QryExec.First;
    if not QryExec.Eof then
    begin
      ShowMessage('Suppression impossible, journal utilisé en écritures');
      exit;
    end;

  finally
    QryExec.Free;
  end;

  // Controle si pre-existance journal en paiement
  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDQueryJournal.Connection; // Utilise la même connexion
    QryExec.SQL.Text := 'select codjal FROM paiement WHERE codjal = :codjal limit 1';
    QryExec.ParamByName('codjal').AsString := FDQueryJournal.FieldByName('CODJAL').AsString;
    QryExec.Open;
    QryExec.First;
    if not QryExec.Eof then
    begin
      ShowMessage('Suppression impossible, journal utilisé (paramétrage paiement)');
      exit;
    end;

  finally
    QryExec.Free;
  end;
  // 2. Demander une confirmation à l'utilisateur (recommandé)
  if MessageDlg('Voulez-vous vraiment supprimer cet enregistrement ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      // 3. Supprimer l'enregistrement actif de la requête/table
      FDQueryJournal.Delete;

      // 4. Appliquer les modifications en base si nécessaire
      // FDQueryJournal.ApplyUpdates(0);
    except
      on E: Exception do
        ShowMessage('Erreur lors de la suppression : ' + E.Message);
    end;
  end;
end;

constructor TFrameTableJournaux.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table journal comptable (vous devez déjà avoir cette ligne ou similaire)
  FDQueryJournal.Open;
end;

procedure TFrameTableJournaux.FDQueryJournalBeforePost(DataSet: TDataSet);
begin
  // Vérifie si le type (Nature) est égal à 'T'
  if DataSet.FieldByName('TYPE_').AsString = 'T' then
  begin
    // Vérifie si le champ NOCPT est vide ou rempli uniquement d'espaces
    if Trim(DataSet.FieldByName('NOCPT').AsString) = '' then
    begin
      // Donne le focus au champ fautif (si un contrôle visuel y est lié)
      DataSet.FieldByName('NOCPT').FocusControl;

      // Interrompt l'enregistrement et lève une exception explicite
      raise Exception.Create('Le numéro de compte est obligatoire lorsque la nature est de type "Trésorerie".');
    end;
  end;
end;


end.
