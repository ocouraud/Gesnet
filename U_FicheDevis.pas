unit U_FicheDevis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzPanel,
  RzRadGrp, RzDBRGrp, RzButton, RzRadChk, RzDBChk, Vcl.Buttons;

type
  TFormFicheDevis = class(TForm)
    DSEnt_prof: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    FDQueryLig_prof: TFDQuery;
    DSLig_prof: TDataSource;
    JvDBGridLig_prof: TJvDBGrid;
    Panel1: TPanel;
    DBEdit13: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit22: TDBEdit;
    RzDBRadioGroupType: TRzDBRadioGroup;
    RzDBCheckBox1: TRzDBCheckBox;
    BtnAnnuler: TBitBtn;
    DSRepres: TDataSource;
    FDQueryRepres: TFDQuery;
    FDQueryRepresCODREP: TSmallintField;
    FDQueryRepresNOM: TStringField;
    RzDBCheckBox2: TRzDBCheckBox;
    procedure FormShow(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification); // <-- CA DOIT ÊTRE ICI !
  end;

var
  FormFicheDevis: TFormFicheDevis;

implementation

uses U_FicheClient, U_DataModule, U_DM_Olivier;

{$R *.dfm}





procedure TFormFicheDevis.FormShow(Sender: TObject);
begin
  FDQueryLig_prof.Close;
  FDQueryLig_prof.Open;

  FDQueryRepres.Close;
  FDQueryRepres.Open;end;

end.
