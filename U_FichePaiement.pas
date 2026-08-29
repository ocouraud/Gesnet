unit U_FichePaiement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, RzPanel, RzRadGrp, RzDBRGrp, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons;

type
  TFormFichePaiement = class(TForm)
    DSPaiement: TDataSource;
    Label1: TLabel;
    DBCodpai: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBCheckBoxActif: TDBCheckBox;
    DBCheckBoxCheque: TDBCheckBox;
    RzDBRadioGroupType_: TRzDBRadioGroup;
    FDQueryParameDevise: TFDQuery;
    DSParame: TDataSource;
    DBCheckBoxArrondi: TDBCheckBox;
    DBLookupComboBoxDevise: TDBLookupComboBox;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    BtnAide: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure RzDBRadioGroupType_Change(Sender: TObject);
    procedure DSPaiementDataChange(Sender: TObject; Field: TField);
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAideClick(Sender: TObject);
  private
    procedure MettreAJourVisibiliteType_;
    { Déclarations privées }
  public
    { Déclarations publiques }
    ModeSaisie: (msAjout, msModification);
  end;

var
  FormFichePaiement: TFormFichePaiement;

implementation

uses U_TablePaiement, U_FormAide, U_DataModule, U_DM_Olivier;

{$R *.dfm}


//procedure TFormFichePaiement.MettreAJourVisibiliteType_;
//var
//  EstVisible: Boolean;
//begin
//  // On rend visible uniquement si l'index N'EST PAS 2 (c'est-à-dire quand ItemIndex <> 2)
//  EstVisible := (RzDBRadioGroupType_.ItemIndex <> 2);
//
//  // Masquage / Affichage des Labels et DBEdit
//  Label3.Visible := EstVisible;
//  Label4.Visible := EstVisible;
//  DBEdit3.Visible := EstVisible;
//  DBEdit4.Visible := EstVisible;
//  DBCheckBoxCheque.Visible := EstVisible
//end;
procedure TFormFichePaiement.MettreAJourVisibiliteType_;
var
  ValeurType: string;
  EstVisible: Boolean;
begin
  // 1. Récupération de la valeur sélectionnée dans le RzDBRadioGroup
  ValeurType := '';
  if RzDBRadioGroupType_.ItemIndex >= 0 then
    ValeurType := RzDBRadioGroupType_.Value
  // Sécurité : si la valeur n'est pas lue par le composant, on va la chercher dans le DataSet
  else if Assigned(DSPaiement.DataSet) and DSPaiement.DataSet.Active then
    ValeurType := DSPaiement.DataSet.FieldByName('TYPE_').AsString;

  // 2. On rend visible les champs SAUF si la valeur est 'D' (DEBIT)
  EstVisible := not SameText(Trim(ValeurType), 'D');

  // 3. Masquage / Affichage des Labels et DBEdit
  Label3.Visible := EstVisible;
  Label4.Visible := EstVisible;
  DBEdit3.Visible := EstVisible;
  DBEdit4.Visible := EstVisible;

  // 4. On rend visible Impression cheque uniquement si la valeur est 'C' (COMPTANT)
  DBCheckBoxCheque.Visible := false;
  DBCheckBoxArrondi.Visible := false;
  EstVisible := SameText(Trim(ValeurType), 'C');
  DBCheckBoxCheque.Visible := EstVisible;
  DBCheckBoxArrondi.Visible := EstVisible;
end;

procedure TFormFichePaiement.RzDBRadioGroupType_Change(Sender: TObject);
begin
  MettreAJourVisibiliteType_;
end;

procedure TFormFichePaiement.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('paiement.html');

end;

procedure TFormFichePaiement.BtnValiderClick(Sender: TObject);
var
  ReqVerification: TFDQuery;
begin
  // ==========================================
  // 1. CONTRÔLES COMMUNS (AJOUT ET MODIFICATION)
  // ==========================================

  if Trim(DBCodpai.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver un code règlement.');
    if DBCodpai.CanFocus then
      DBCodpai.SetFocus;
    Exit;
  end;

    if Trim(DBLookupComboBoxDevise.Text) = '' then
  begin
    ShowMessage('Veuillez saisir ou conserver le code devise par défaut.');
    if DBLookupComboBoxDevise.CanFocus then
     DBLookupComboBoxDevise.SetFocus;
    Exit;
  end;

  // ==========================================
  // 2. CONTRÔLE D'UNICITÉ (UNIQUEMENT EN AJOUT)
  // ==========================================

  if ModeSaisie = msAjout then
  begin
    ReqVerification := DMGesCloud.CreerRequeteTemp;
    try
      if DMGesCloud.ExisteEnregistrement('paiement', ['CODPAI'], [DBCodpai.Field.AsString], ReqVerification) then
      begin
        ShowMessage('Ce code règlement existe déjà !');
        DBCodpai.SetFocus;
        Exit; // On bloque ici, la fiche ne se ferme pas
      end;
    finally
      DMGesCloud.LibererRequeteTemp(ReqVerification);
    end;
  end;

  // --- 2. LA TENTATIVE D'ENREGISTREMENT SÉCURISÉE ---
  try
    // On force l'enregistrement dans le Dataset (ce qui va déclencher le BeforePost du DataModule)
    DM_Olivier.FDQueryPaiement.Post;

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


procedure TFormFichePaiement.DSPaiementDataChange(Sender: TObject;
  Field: TField);
begin
  //ShowMessage('Valeur brute du champ TYPE_ : "' + DM_Olivier.FDQueryPaiement.FieldByName('TYPE_').AsString + '"');
  // On met à jour la visibilité dès que la donnée du champ TYPE_ change ou au changement de ligne
  if (Field = nil) or (Field.FieldName = 'TYPE_') then
    MettreAJourVisibiliteType_;
end;

procedure TFormFichePaiement.FormShow(Sender: TObject);
begin
   // 1. Désactivation du champ code en mode modification
  DBCodpai.ReadOnly := (ModeSaisie = msModification);

   if ModeSaisie = msAjout then
  begin
    if DM_Olivier.FDQueryPaiement.State in [dsInsert] then
    begin
      DBCheckBoxActif.Checked := True;
      DBCheckBoxArrondi.Checked := False;
      DBCheckBoxCheque.Checked := False;
      //On définit le choix par défaut sur "C" (Comptant 1)
      RzDBRadioGroupType_.ItemIndex := 0;
    end;
  end;

  DBEdit2.SetFocus;

  // On force le rafraîchissement de la liste des paiements à l'ouverture de la fiche
  FDQueryParameDevise.Close;
  FDQueryParameDevise.Open;

  // ... le reste de votre code existant au démarrage ...

    //On appelle explicitement la méthode MettreAJourVisibiliteType_
  MettreAJourVisibiliteType_;

end;


end.
