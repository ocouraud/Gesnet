unit U_FicheFamille;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, RzPanel, RzRadGrp, JvExDBGrids, JvDBGrid,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormFicheFamille = class(TForm)
    DSFamilles: TDataSource;
    FDQueryTest: TFDQuery;
    PageControl1: TPageControl;
    Général: TTabSheet;
    Label1: TLabel;
    DBcodfam: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BtnAnnuler: TBitBtn;
    Remise: TTabSheet;
    TabSheet1: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    FDQueryStatis: TFDQuery;
    FDQueryStatisTYPE_: TStringField;
    FDQueryStatisCODE: TStringField;
    FDQueryStatisANNEE: TIntegerField;
    FDQueryStatisCA1: TLargeintField;
    FDQueryStatisCA2: TLargeintField;
    FDQueryStatisCA3: TLargeintField;
    FDQueryStatisCA4: TLargeintField;
    FDQueryStatisCA5: TLargeintField;
    FDQueryStatisCA6: TLargeintField;
    FDQueryStatisCA7: TLargeintField;
    FDQueryStatisCA8: TLargeintField;
    FDQueryStatisCA9: TLargeintField;
    FDQueryStatisCA10: TLargeintField;
    FDQueryStatisCA11: TLargeintField;
    FDQueryStatisCA12: TLargeintField;
    FDQueryStatisDER_MODIF: TSQLTimeStampField;
    DSStatis: TDataSource;
    FDQueryFamrem: TFDQuery;
    DSFamrem: TDataSource;
    JvDBGrid2: TJvDBGrid;
    Panel2: TPanel;
    FDQueryFamremNUMFAR: TIntegerField;
    FDQueryFamremCODFAM: TStringField;
    FDQueryFamremPRC_REM: TBCDField;
    FDQueryFamremDAT_DEB: TDateField;
    FDQueryFamremDAT_FIN: TDateField;
    AjouterRemise: TBitBtn;
    ModifierRemise: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure AjouterRemiseClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure ConfigurerOnglets;
    procedure ChargerDonneesLiees;
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification);
  end;

var
  FormFicheFamille: TFormFicheFamille;

implementation

{$R *.dfm}

uses U_DataModule, U_FicheFamrem;

procedure TFormFicheFamille.ConfigurerOnglets;
var
  EstEnModification: Boolean;
begin
  EstEnModification := (ModeSaisie = msModification);

  // Masque ou affiche les onglets selon le mode
  Remise.TabVisible := EstEnModification;
  TabSheet1.TabVisible := EstEnModification; // Chiffres d'affaires

  // Se positionne toujours sur le premier onglet
  PageControl1.ActivePage := Général;
end;

procedure TFormFicheFamille.ChargerDonneesLiees;
var
  CodeFamille: string;
begin
  // Assurer la liaison entre les composants de données et les grilles
  DSFamrem.DataSet := FDQueryFamrem;
  JvDBGrid2.DataSource := DSFamrem;

  DSStatis.DataSet := FDQueryStatis;
  JvDBGrid1.DataSource := DSStatis;

  // Si on est en modification, on filtre et on ouvre la liste des remises
  if (ModeSaisie = msModification) and Assigned(DMGesCloud) then
  begin
    CodeFamille := DMGesCloud.FDQueryFamilles.FieldByName('CODFAM').AsString;

    // 1. Chargement des remises de la famille
    FDQueryFamrem.Close;
    FDQueryFamrem.SQL.Text := 'SELECT * FROM FAMREM WHERE CODFAM = :CODFAM';
    FDQueryFamrem.ParamByName('CODFAM').AsString := CodeFamille;
    FDQueryFamrem.Open;

    // 2. Chargement des statistiques / Chiffres d'affaires si nécessaire
    FDQueryStatis.Close;
    FDQueryStatis.SQL.Text := 'SELECT * FROM STATIS WHERE CODE = :CODFAM AND TYPE_ = ''F''';
    FDQueryStatis.ParamByName('CODFAM').AsString := CodeFamille;
    FDQueryStatis.Open;
  end;
end;

procedure TFormFicheFamille.FormShow(Sender: TObject);
begin
  ConfigurerOnglets;
  ChargerDonneesLiees;
end;

procedure TFormFicheFamille.AjouterRemiseClick(Sender: TObject);
var
  FormRemise: TFormFicheFamrem;
begin
  FormRemise := TFormFicheFamrem.Create(Self);
  try
    if FormRemise.ShowModal = mrOk then
    begin
      FDQueryFamrem.Refresh;
    end;
  finally
    FormRemise.Free;
  end;
end;

procedure TFormFicheFamille.BitBtn1Click(Sender: TObject);
var
  ReqVerification: TFDQuery;
begin
  // --- 1. CONTRÔLES DE SURFACE ---
  if ModeSaisie = msAjout then
  begin
    ReqVerification := DMGesCloud.CreerRequeteTemp;
    try
      if DMGesCloud.ExisteEnregistrement('famille', ['CODFAM'], [DBcodfam.Field.AsString], ReqVerification) then
      begin
        ShowMessage('Ce code famille existe déjà !');
        DBcodfam.SetFocus;
        Exit;
      end;
    finally
      DMGesCloud.LibererRequeteTemp(ReqVerification);
    end;
  end;

  // --- 2. ENREGISTREMENT ---
  try
    DMGesCloud.FDQueryFamilles.Post;
    Self.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ShowMessage('Validation impossible : ' + sLineBreak + E.Message);
    end;
  end;
end;

end.
