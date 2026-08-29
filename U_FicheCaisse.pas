unit U_FicheCaisse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Printers, RzPanel, RzRadGrp, RzDBRGrp,
  FireDAC.Stan.Param, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrameFicheCaisse = class(TFrame)
    DSCaisse: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    BtnAide: TBitBtn;
    DSClient: TDataSource;
    DBLookupComboBoxClient: TDBLookupComboBox;
    Label5: TLabel;
    DSDepot: TDataSource;
    DBLookupComboBoxDepot: TDBLookupComboBox;
    DBComboBoxFacture: TDBComboBox;
    DBComboBoxTicket: TDBComboBox;
    DBComboBoxAfficheur: TDBComboBox;
    DBComboBoxTiroir: TDBComboBox;
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_FormAide, U_DataModule, RzTabs, U_MenuPrincipal;


procedure TFrameFicheCaisse.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('caisse.html');
end;

procedure TFrameFicheCaisse.BtnAnnulerClick(Sender: TObject);
var
  TabSheetToFree: TRzTabSheet;
begin
  // 1. Annuler les modifications de la table si elle est en édition/insertion
  if DM_Olivier.FDQueryCaisse.State in [dsEdit, dsInsert] then
    DM_Olivier.FDQueryCaisse.Cancel;

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

procedure TFrameFicheCaisse.BtnValiderClick(Sender: TObject);
var
  TabSheetToFree: TRzTabSheet;
begin

  try
    if DM_Olivier.FDQueryCaisse.State in [dsEdit, dsInsert] then
      DM_Olivier.FDQueryCaisse.Post;

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

  except
    on E: Exception do
      MessageDlg('Validation impossible :' + sLineBreak + E.Message, mtError, [mbOK], 0);
  end;
end;

constructor TFrameFicheCaisse.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Self.DoubleBuffered := True;

  // --- CHARGEMENT DES IMPRIMANTES ---
  // Remplacez "DBComboBoxTicket" par le nom exact de vos composants sur la fiche
  DBComboBoxFacture.Items.Assign(Printer.Printers);
  DBComboBoxTicket.Items.Assign(Printer.Printers);
  DBComboBoxTiroir.Items.Assign(Printer.Printers);
  DBComboBoxAfficheur.Items.Assign(Printer.Printers);

  DisableAlign;
  try
    // 1. Fermer au cas où la requête était déjà ouverte
    DM_Olivier.FDQueryCaisse.Close;

    // 2. Transmettre le numéro de poste formaté sur 2 caractères (ex: '01') au paramètre :CODCAI
    DM_Olivier.FDQueryCaisse.ParamByName('CODCAI').AsString := Format('%.2d', [DM_Olivier.NumeroPoste]);

    // 3. Ouvrir la requête filtrée
    DM_Olivier.FDQueryCaisse.Open;

    DM_Olivier.FDQueryClient.Close;
    DM_Olivier.FDQueryClient.Open;

    DM_Olivier.FDQueryDepot.Close;
    DM_Olivier.FDQueryDepot.Open;
  finally
    EnableAlign;
  end;
end;

end.
