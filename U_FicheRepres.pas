unit U_FicheRepres;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TFormFicheRepres = class(TForm)
    DSRepres: TDataSource;
    Label1: TLabel;
    DBCodrep: TDBEdit;
    Label2: TLabel;
    DBNom: TDBEdit;
    PageControlRepres: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    DBComvte: TDBEdit;
    Label4: TLabel;
    DBComenc: TDBEdit;
    Label5: TLabel;
    DBCommrg: TDBEdit;
    Label6: TLabel;
    DBCptcli: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    BtnAide: TBitBtn;
    FDQueryStatis: TFDQuery;
    DSStatis: TDataSource;
    JvDBGridStatis: TJvDBGrid;
    FDQueryEntvteaa: TFDQuery;
    DSEntvteaa: TDataSource;
    JvDBGridEVA: TJvDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
    procedure JvDBGridStatisTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure JvDBGridEVATitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure JvDBGridEVADblClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification);
  end;

var
  FormFicheRepres: TFormFicheRepres;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_DataModule, U_TableRepres, U_FormAide, U_FicheFacture;

procedure TFormFicheRepres.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('representant.html');

end;

procedure TFormFicheRepres.BtnValiderClick(Sender: TObject);
var
  ReqVerification: TFDQuery;
begin
  // ==========================================
  // 1. CONTRÔLES COMMUNS (AJOUT ET MODIFICATION)
  // ==========================================

  if Trim(DBCodrep.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un code représentant.');
    if DBCodrep.CanFocus then
      DBCodrep.SetFocus;
    Exit;
  end;

  if Trim(DBNom.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un nom.');
    if DBCodrep.CanFocus then
      DBCodrep.SetFocus;
    Exit;
  end;

  // ==========================================
  // 2. CONTRÔLE D'UNICITÉ (UNIQUEMENT EN AJOUT)
  // ==========================================

  if ModeSaisie = msAjout then
  begin
    ReqVerification := DMGesCloud.CreerRequeteTemp;
    try
      if DMGesCloud.ExisteEnregistrement('repres', ['CODREP'], [DBCodrep.Field.AsString], ReqVerification) then
      begin
        ShowMessage('Ce numero de représentant existe déjà !');
        if DBCodrep.CanFocus then
          DBCodrep.SetFocus;
        Exit; // On bloque ici, la fiche ne se ferme pas
      end;
    finally
      DMGesCloud.LibererRequeteTemp(ReqVerification);
    end;
  end;

  // --- 2. LA TENTATIVE D'ENREGISTREMENT SÉCURISÉE ---
  try
    // On force l'enregistrement dans le Dataset (ce qui va déclencher le BeforePost du DataModule)
   DM_Olivier.FDQueryRepres.Post;

    // SI TOUT S'EST BIEN PASSÉ :
    // On ferme la fiche par code en renvoyant mrOk à la fenêtre parente
    Self.ModalResult := mrOk;

  except
    on E: Exception do
    begin
      // SI LE BEFOREPOST (OU LA BDD) LEVE UNE ERREUR :
      MessageDlg('Validation impossible :'#13#10 + E.Message, mtError, [mbOK], 0);
    end;
  end;
 end;


procedure TFormFicheRepres.FormShow(Sender: TObject);
begin
  // 1. Désactivation du champ code représentant en mode modification
  DBCodrep.ReadOnly := (ModeSaisie = msModification);

  if ModeSaisie = msAjout then
  begin
    // Si la requête est déjà en mode insertion (Append/Insert)
    if DM_Olivier.FDQueryRepres.State in [dsInsert] then
    begin
      // On affecte le numéro automatique calculé par le DataModule
      DM_Olivier.FDQueryRepres.FieldByName('CODREP').AsInteger := DM_Olivier.GetProchainCodRep;

      // On donne directement le focus au champ Nom (DBNom)
      // pour que l'utilisateur n'ait pas à retaper le numéro
     end;
  end;

  DBNom.SetFocus;
  FDQueryStatis.Close;
  FDQueryStatis.Open;

  FDQueryEntvteaa.Close;
  FDQueryEntvteaa.Open;

end;


procedure TFormFicheRepres.JvDBGridEVADblClick(Sender: TObject);
begin
  if FDQueryEntvteaa.IsEmpty then Exit;

  FormFicheFacture := TFormFicheFacture.Create(Self);
  try
    // 1. Branchement du DataSource (lecture seule / consultation)
    FormFicheFacture.DSEntvteaa.DataSet := FDQueryEntvteaa;

    // 2. Titre explicite
    FormFicheFacture.Caption := 'Consultation Facture N° ' + FDQueryEntvteaa.FieldByName('CODFAC').AsString;

    // 3. Affichage en simple consultation (Modal)
    FormFicheFacture.ShowModal;
  finally
    FormFicheFacture.Free;
  end;

end;

procedure TFormFicheRepres.JvDBGridEVATitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryEntvteaa.IndexFieldNames = Field.FieldName then
      FDQueryEntvteaa.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryEntvteaa.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;


end;

procedure TFormFicheRepres.JvDBGridStatisTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if FDQueryStatis.IndexFieldNames = Field.FieldName then
      FDQueryStatis.IndexFieldNames := Field.FieldName + ':D'
    else
      FDQueryStatis.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;
end;

end.
