unit U_FrameEcrituresClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, RzTabs,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrameEcrituresClients = class(TFrame)
    JvDBGridClients: TJvDBGrid;
    Panel1: TPanel;
    EdtCherche_CODCLI: TEdit;
    EdtCherche_NOM: TEdit;
    CheckBoxFermes: TCheckBox;
    Panel2: TPanel;
    BtnOuvrir: TBitBtn;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    DSClients: TDataSource;
    FDQueryClients: TFDQuery;
    EdtCherche_CPTAUX: TEdit;
    JvDBGridTresor: TJvDBGrid;
    FDQueryTresor: TFDQuery;
    DSTresor: TDataSource;
    FDQueryTresorCODCLI: TIntegerField;
    FDQueryTresorDATE_: TDateField;
    FDQueryTresorTOP_: TStringField;
    FDQueryTresorLIBELLE: TStringField;
    FDQueryTresorDEBIT: TLargeintField;
    FDQueryTresorCREDIT: TLargeintField;
    FDQueryTresorDATE_ECH: TDateField;
    FDQueryTresorSOLDE: TSmallintField;
    FDQueryTresorSELECT_: TSmallintField;
    FDQueryTresorREFERENCE_: TStringField;
    FDQueryTresorLETTRE: TStringField;
    FDQueryTresorNOENR: TFDAutoIncField;
    constructor Create(AOwner: TComponent); override;
    procedure EdtCherche_CODCLIChange(Sender: TObject);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure EdtCherche_CPTAUXChange(Sender: TObject);
    procedure BtnOuvrirClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure JvDBGridClientsCellClick(Column: TColumn);
    procedure BtnFermerClick(Sender: TObject);
    procedure JvDBGridClientsTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure JvDBGridTresorTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
  private
    procedure AppliquerFiltreMaitre;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_FicheClient, U_OutilsGrille, U_FormAide;

procedure TFrameEcrituresClients.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('ecritures_clients_liste.html');
end;

procedure TFrameEcrituresClients.BtnFermerClick(Sender: TObject);
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

procedure TFrameEcrituresClients.BtnOuvrirClick(Sender: TObject);
begin
  // Vérifie qu'un client est bien sélectionné
  if FDQueryClients.IsEmpty then Exit;

  //Open query client pour la fiche
  DMGesCloud.ReqClients.SQL.Text:='select * from client where codcli=:codcli';
  DMGesCloud.ReqClients.ParamByName('CODCLI').AsInteger:=FDQueryClients.FieldByName('CODCLI').AsInteger;
  DMGesCloud.ReqClients.Open;

  FormFicheClient := TFormFicheClient.Create(Self);
  try
    FormFicheClient.DSClients.DataSet := DMGesCloud.ReqClients;
    FormFicheClient.ModeSaisie := msModification;
    FormFicheClient.Caption := 'Modifier le client';

    DMGesCloud.ReqClients.Edit; // <-- Passage en édition

  if FormFicheClient.ShowModal = mrOk then
    DM_Olivier.RefreshDataSetWithBookmark(FDQueryClients)
  else
    DMGesCloud.ReqClients.Cancel;
  finally
    FormFicheClient.Free;
  end;
end;


constructor TFrameEcrituresClients.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table des clients et tresor
  FDQueryClients.Close;
  FDQueryClients.Open;

end;


//Procedure de FILTRAGE
procedure TFrameEcrituresClients.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete si modifiee entre temps
  FDQueryClients.Refresh;

  if not CheckBoxFermes.Checked then FiltreSQL := 'ferme = 0' else FiltreSQL := 'ferme = 1';

  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    FDQueryClients.Filter := FiltreSQL;
    FDQueryClients.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    FDQueryClients.Filtered := False;
  end;
end;


procedure TFrameEcrituresClients.EdtCherche_CODCLIChange(Sender: TObject);
begin
 // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryClients);
end;

procedure TFrameEcrituresClients.EdtCherche_CPTAUXChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryClients);
end;

procedure TFrameEcrituresClients.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, FDQueryClients);
end;

procedure TFrameEcrituresClients.JvDBGridClientsCellClick(Column: TColumn);
begin
  FDQueryTresor.Close;
  FDQueryTresor.ParamByName('CODCLI').AsInteger:=FDQueryClients.FieldByName('CODCLI').AsInteger;
  FDQueryTresor.Open;
  FDQueryTresor.Refresh
end;

procedure TFrameEcrituresClients.JvDBGridClientsTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryClients.IndexFieldNames = Field.FieldName then
      FDQueryClients.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryClients.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

procedure TFrameEcrituresClients.JvDBGridTresorTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryTresor.IndexFieldNames = Field.FieldName then
      FDQueryTresor.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryTresor.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

end.
