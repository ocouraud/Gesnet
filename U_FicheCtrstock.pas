unit U_FicheCtrstock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RzPanel, RzRadGrp, RzDBRGrp, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TFrameFicheCtrstock = class(TFrame)
    DSCtrstock: TDataSource;
    DBEditNom: TDBEdit;
    DBEdit1Nom2: TDBEdit;
    Label3: TLabel;
    DBMemo1Adresse: TDBMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    BtnAide: TBitBtn;
    Label1: TLabel;
    Panel2: TPanel;
    TabSheetSMTP: TTabSheet;
    DBCheckBoxTVAHT: TDBCheckBox;
    DBCheckBoxPMPGlobal: TDBCheckBox;
    RzDBRadioGroupAlertStock: TRzDBRadioGroup;
    RzDBRadioGroupNqture: TRzDBRadioGroup;
    DBCheckBoxBCF: TDBCheckBox;
    RzDBRadioGroup1: TRzDBRadioGroup;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    GroupBox1: TGroupBox;
    Label19: TLabel;
    DBMemo2: TDBMemo;
    Label20: TLabel;
    DBMemo3: TDBMemo;
    FDQueryStatis: TFDQuery;
    DSStatis: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel3: TPanel;
    Label21: TLabel;
    DBEdit16: TDBEdit;
    SpeedButton1: TSpeedButton;
    ImageLogo: TImage;
    OpenDialog1: TOpenDialog;
    FDQuerygpu_parame: TFDQuery;
    DSgpu_parame: TDataSource;
    FDQuerygpu_parameIDParametres: TLargeintField;
    FDQuerygpu_parameAdresseEmailExpediteur: TStringField;
    FDQuerygpu_parameAdresseEmailDestination: TStringField;
    FDQuerygpu_parameServeurSMTP: TStringField;
    FDQuerygpu_parameLoginSMTP: TStringField;
    FDQuerygpu_parameMotPasseSMTP: TStringField;
    FDQuerygpu_paramePortSMTP: TLongWordField;
    FDQuerygpu_parameConnexionSecurisee: TShortintField;
    FDQuerygpu_parameActivationParEmail: TShortintField;
    FDQuerygpu_parameSaisieSecurisee: TShortintField;
    Label22: TLabel;
    DBEdit17: TDBEdit;
    Label23: TLabel;
    DBEdit18: TDBEdit;
    Label24: TLabel;
    DBEdit19: TDBEdit;
    Label25: TLabel;
    DBEdit20: TDBEdit;
    Label26: TLabel;
    DBEditPass: TDBEdit;
    Label27: TLabel;
    DBEdit22: TDBEdit;
    CheckBoxMDP: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    procedure BtnValiderClick(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure DBCheckBoxAffMDPClick(Sender: TObject);
    procedure CheckBoxMDPMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBoxMDPMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnAideClick(Sender: TObject);
  private
    FDernierCheminLogo: string;
    procedure ChargerApercuLogo;
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
U_DM_Olivier, U_DataModule, U_FormAide, RzTabs, U_MenuPrincipal;


procedure TFrameFicheCtrstock.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('ctrstock.html');
end;


procedure TFrameFicheCtrstock.BtnAnnulerClick(Sender: TObject);
var
  TabSheetToFree: TRzTabSheet;
begin
  // 1. Annuler les modifications de la table si elle est en édition/insertion
  if DM_Olivier.FDQueryCtrstock.State in [dsEdit, dsInsert] then
    DM_Olivier.FDQueryCtrstock.Cancel;

  // 2. Fermer l'onglet de manière sécurisée
  if Assigned(Self.Parent) and (Self.Parent is TRzTabSheet) then
  begin
    TabSheetToFree := TRzTabSheet(Self.Parent);
    TThread.ForceQueue(nil,
      procedure
      begin
        TabSheetToFree.Free;
      end);
  end;
end;

procedure TFrameFicheCtrstock.BtnValiderClick(Sender: TObject);
var
  TabSheetToFree: TRzTabSheet;
begin
  if Trim(DBEditNom.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un nom.');
    if DBEditNom.CanFocus then
     DBEditNom.SetFocus;
    Exit;
  end;

  try
    if DM_Olivier.FDQueryCtrstock.State in [dsEdit, dsInsert] then
      DM_Olivier.FDQueryCtrstock.Post;

    // Fermeture sécurisée de l'onglet
    if Assigned(Self.Parent) and (Self.Parent is TRzTabSheet) then
    begin
      TabSheetToFree := TRzTabSheet(Self.Parent);
      TThread.ForceQueue(nil,
        procedure
        begin
          TabSheetToFree.Free;
        end);
    end;

    //Charger le mode de calcul duPMP
    DM_Olivier.ChargerParametresStock;

  except
    on E: Exception do
      MessageDlg('Validation impossible :' + sLineBreak + E.Message, mtError, [mbOK], 0);
  end;
end;


constructor TFrameFicheCtrstock.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Self.DoubleBuffered := True;

  // Activer le double tampon sur les panneaux internes
  if Assigned(Panel3) then Panel3.DoubleBuffered := True;
  if Assigned(Panel1) then Panel1.DoubleBuffered := True;

  DisableAlign;
  try
    DM_Olivier.FDQueryCtrstock.Open;
    FDQueryStatis.Open;
// --- GESTION DE LA TABLE DE PARAMÈTRES GPU ---
    FDQuerygpu_parame.Open;
    if FDQuerygpu_parame.IsEmpty then
    begin
      FDQuerygpu_parame.Append;
      // Optionnel : Initialiser des valeurs par défaut si besoin
      FDQuerygpu_parame.FieldByName('AdresseEmailExpediteur').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('email').AsString;
      FDQuerygpu_parame.FieldByName('PortSMTP').AsString := '25';
      FDQuerygpu_parame.Post; // Crée l'enregistrement initial en BDD
    end;

  finally
    EnableAlign;
  end;

  ChargerApercuLogo;
end;


procedure TFrameFicheCtrstock.DBCheckBoxAffMDPClick(Sender: TObject);
begin
// Afficher le mot de passe en clair
DBEditPass.PasswordChar := #0;

// Masquer à nouveau
//DBEditPass.PasswordChar := '*';
end;

procedure TFrameFicheCtrstock.DBEdit16Change(Sender: TObject);
begin
  // On ne charge l'aperçu que si la Frame est effectivement affichée à l'écran
  if Showing then
    ChargerApercuLogo;
end;

procedure TFrameFicheCtrstock.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    // Passer le dataset en édition si ce n'est pas déjà le cas
    if not (DM_Olivier.FDQueryCtrstock.State in [dsEdit, dsInsert]) then
      DM_Olivier.FDQueryCtrstock.Edit;

    // Affecter le chemin au champ BDD connecté à DBEdit16
    DBEdit16.Field.AsString := OpenDialog1.FileName;

    // Charger immédiatement l'aperçu
    ChargerApercuLogo;
  end;
end;

procedure TFrameFicheCtrstock.ChargerApercuLogo;
var
  Chemin: string;
begin
  Chemin := DBEdit16.Text;

  // Ne rien faire si le chemin n'a pas changé
  if Chemin = FDernierCheminLogo then Exit;
  FDernierCheminLogo := Chemin;

  if (Chemin <> '') and FileExists(Chemin) then
  begin
    try
      ImageLogo.Picture.Graphic := nil;
      ImageLogo.Picture.LoadFromFile(Chemin);
    except
      ImageLogo.Picture.Graphic := nil;
    end;
  end
  else
    ImageLogo.Picture.Graphic := nil;
end;

procedure TFrameFicheCtrstock.CheckBoxMDPMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Afficher le mot de passe en clair
  DBEditPass.PasswordChar := #0;
end;

procedure TFrameFicheCtrstock.CheckBoxMDPMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Masquer à nouveau
  DBEditPass.PasswordChar := '*';
  CheckBoxMDP.Checked := False
end;

end.
