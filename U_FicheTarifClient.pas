unit U_FicheTarifClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,FireDAC.Comp.Client;

type
  TFicheTarifClient = class(TForm)
    DSTarifcli: TDataSource;
    DSArticles: TDataSource;
    Label1: TLabel;
    DBCodcli: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBPrixvte: TDBEdit;
    Label4: TLabel;
    DBPrcremise: TDBEdit;
    DBLookupComboBoxArticles: TDBLookupComboBox;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification);
  end;

var
  FicheTarifClient: TFicheTarifClient;

implementation

uses U_DataModule;

{$R *.dfm}



procedure TFicheTarifClient.BtnAnnulerClick(Sender: TObject);
begin
  // Si des modifications étaient en cours, on les annule proprement
  if DMGesCloud.ReqSaisieTarif.State in [dsEdit, dsInsert] then
    DMGesCloud.ReqSaisieTarif.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;


procedure TFicheTarifClient.BtnValiderClick(Sender: TObject);
begin
//  ModalResult := mrOk;
  // 1. (Optionnel) Vos vérifications rapides côté interface
  if VarIsNull(DBLookupComboBoxArticles.KeyValue) or (DBLookupComboBoxArticles.KeyValue = Unassigned) then
  begin
    ShowMessage('Veuillez sélectionner un article.');
    if DBLookupComboBoxArticles.CanFocus then
     DBLookupComboBoxArticles.SetFocus;
    Exit; // On bloque la fermeture
  end;

  // 2. Tentative d'enregistrement sécurisée
  try
    // On force la validation dans le buffer du tarif
    // (Cela va déclencher le BeforePost du DataModule pour le tarif)
    DMGesCloud.ReqSaisieTarif.Post;

    // Si tout est OK, on autorise la fermeture de la fiche
    Self.ModalResult := mrOk;

  except
    on E: Exception do
    begin
      // Si une erreur/doublon est détecté par la base ou le BeforePost :
      MessageDlg('Erreur sur le tarif :'#13#10 + E.Message, mtError, [mbOK], 0);
      // La fiche reste ouverte pour que l'utilisateur corrige son prix ou son article !
    end;
  end;
end;





procedure TFicheTarifClient.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  // Si l'utilisateur utilise la roulette alors que le curseur est dans le combo articles
  if DBLookupComboBoxArticles.Focused then
  begin
    Handled := True; // On intercepte le message pour éviter que la fiche ne défile

    if WheelDelta > 0 then
    begin
      // Roulette vers le haut : on monte dans les articles
      if not DMGesCloud.ReqArticlesOuverts.Bof then
        DMGesCloud.ReqArticlesOuverts.Prior;
    end
    else
    begin
      // Roulette vers le bas : on descend dans les articles
      if not DMGesCloud.ReqArticlesOuverts.Eof then
        DMGesCloud.ReqArticlesOuverts.Next;
    end;
  end;
end;

procedure TFicheTarifClient.FormShow(Sender: TObject);
begin
  DMGesCloud.ReqArticlesOuverts.Close;
  DMGesCloud.ReqArticlesOuverts.Open;

end;

end.
