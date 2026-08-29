unit U_TableParameTVA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RzTabs, RzPanel, RzRadGrp;

type
  TFrameTableTVA = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnFermer: TBitBtn;
    BtnAide: TBitBtn;
    DSParameTVA: TDataSource;
    JvDBGridTVA: TJvDBGrid;
    JvDBGridPar_effet: TJvDBGrid;
    DSPar_effet: TDataSource;
    FDQueryPar_effet: TFDQuery;
    BtnSupprimer: TBitBtn;

    procedure FDQueryPar_effetNewRecord(DataSet: TDataSet);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);

  private
    { Déclarations privées }
  public
    constructor Create(AOwner: TComponent); override;
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier;


procedure TFrameTableTVA.BtnFermerClick(Sender: TObject);
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

procedure TFrameTableTVA.BtnSupprimerClick(Sender: TObject);
begin
  // 1. Vérifie si le DataSet n'est pas vide et contient des données
  if not FDQueryPar_effet.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer cette date d''effet ?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FDQueryPar_effet.Delete;
    end;
  end;
end;

constructor TFrameTableTVA.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi
// 1. Ouverture de la table principale TVA
  DM_Olivier.FDQueryParameTVA.Open;

  // 2. Ouverture de la table détail (date d'effet)
  FDQueryPar_effet.Open;
end;

procedure TFrameTableTVA.FDQueryPar_effetNewRecord(DataSet: TDataSet);
begin
  // 1. Clé parente (Master-Detail)
  if not DM_Olivier.FDQueryParameTVA.FieldByName('CODE').IsNull then
    DataSet.FieldByName('code').AsString := DM_Olivier.FDQueryParameTVA.FieldByName('CODE').AsString;

  // 2. Date de début = Date du jour
  DataSet.FieldByName('dat_deb').AsDateTime := Date;

  // 3. Date de fin = 31/12/2050
  DataSet.FieldByName('dat_fin').AsDateTime := EncodeDate(2050, 12, 31);
end;

end.
