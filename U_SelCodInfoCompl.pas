unit U_SelCodInfoCompl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormSelCodInfoCompl = class(TForm)
    FDQueryCodinfocompl: TFDQuery;
    DSCodinfocompl: TDataSource;
    JvDBGrid1: TJvDBGrid;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    procedure BtnValiderClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);

  private
    { Déclarations privées }
    FTypeInfo: string;
    FSelectedId: SmallInt;
    FSelectedCodInfo: string;
  public
    { Déclarations publiques }
    // Méthode de lancement réutilisable qui renvoie l'ID et le Code
    class function SelectionnerCli(ATypeInfo: string; ACodCli: Integer; var AIdInfo: SmallInt; var ACodInfo: string): Boolean;
    class function SelectionnerArt(ATypeInfo: string; ACodArt: string; var AIdInfo: SmallInt; var ACodInfo: string): Boolean;
    property SelectedId: SmallInt read FSelectedId;
    property SelectedCodInfo: string read FSelectedCodInfo;
  end;

var
  FormSelCodInfoCompl: TFormSelCodInfoCompl;

implementation

{$R *.dfm}

uses U_FicheClient, U_DataModule;

class function TFormSelCodInfoCompl.SelectionnerCli(ATypeInfo: string; ACodCli: Integer; var AIdInfo: SmallInt; var ACodInfo: string): Boolean;
var
  Form: TFormSelCodInfoCompl;
begin
  Result := False;
  Form := TFormSelCodInfoCompl.Create(Application);
  try
    Form.FTypeInfo := ATypeInfo;

    Form.FDQueryCodinfocompl.Close;
    Form.FDQueryCodinfocompl.SQL.Text :=
      'SELECT p.id, ' +
      '  p.libelle AS Groupe, ' +
      '  i.codinfo, ' +
      '  i.libelle ' +
      'FROM codinfocompl i ' +
      'INNER JOIN parinfocompl p ON p.id = i.id AND p.type_ = i.type_ ' +
      'WHERE i.type_ = :pType ' +
      '  AND NOT EXISTS (' +
      '    SELECT 1 FROM cliinfocompl c ' +
      '    WHERE c.CODCLI = :pCodCli AND c.id = p.id AND c.codinfo = i.codinfo' +
      '  ) ' +
      'ORDER BY p.libelle, i.libelle';

    Form.FDQueryCodinfocompl.ParamByName('pType').AsString := ATypeInfo;
    Form.FDQueryCodinfocompl.ParamByName('pCodCli').AsInteger := ACodCli;
    Form.FDQueryCodinfocompl.Open;

    if Form.ShowModal = mrOk then
    begin
      AIdInfo := Form.FSelectedId;
      ACodInfo := Form.FSelectedCodInfo;
      Result := True;
    end;
  finally
    Form.Free;
  end;
end;

class function TFormSelCodInfoCompl.SelectionnerArt(ATypeInfo: string; ACodArt: string; var AIdInfo: SmallInt; var ACodInfo: string): Boolean;
var
  Form: TFormSelCodInfoCompl;
begin
  Result := False;
  Form := TFormSelCodInfoCompl.Create(Application);
  try
    Form.FTypeInfo := ATypeInfo;

    Form.FDQueryCodinfocompl.Close;
    Form.FDQueryCodinfocompl.SQL.Text :=
      'SELECT p.id, ' +
      '  p.libelle AS Groupe, ' +
      '  i.codinfo, ' +
      '  i.libelle ' +
      'FROM codinfocompl i ' +
      'INNER JOIN parinfocompl p ON p.id = i.id AND p.type_ = i.type_ ' +
      'WHERE i.type_ = :pType ' +
      '  AND NOT EXISTS (' +
      '    SELECT 1 FROM artinfocompl c ' +
      '    WHERE c.CODART = :pCodArt AND c.id = p.id AND c.codinfo = i.codinfo' +
      '  ) ' +
      'ORDER BY p.libelle, i.libelle';

    Form.FDQueryCodinfocompl.ParamByName('pType').AsString := ATypeInfo;
    Form.FDQueryCodinfocompl.ParamByName('pCodArt').AsString := ACodArt;
    Form.FDQueryCodinfocompl.Open;

    if Form.ShowModal = mrOk then
    begin
      AIdInfo := Form.FSelectedId;
      ACodInfo := Form.FSelectedCodInfo;
      Result := True;
    end;
  finally
    Form.Free;
  end;
end;



procedure TFormSelCodInfoCompl.BtnValiderClick(Sender: TObject);
begin
  if not FDQueryCodinfocompl.IsEmpty then
  begin
    FSelectedId := FDQueryCodinfocompl.FieldByName('id').AsInteger;
    FSelectedCodInfo := FDQueryCodinfocompl.FieldByName('codinfo').AsString;
    ModalResult := mrOk;
  end;
end;

procedure TFormSelCodInfoCompl.JvDBGrid1DblClick(Sender: TObject);
begin
  BtnValiderClick(Sender);
end;

end.
