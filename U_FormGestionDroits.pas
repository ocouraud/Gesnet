unit U_FormGestionDroits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.ExtCtrls;

type
  TFrameGestionDroits = class(TFrame)
    CheckListBoxPermissions: TCheckListBox;
    BtnEnregistrer: TButton;
    FDQueryUpdate: TFDQuery;
    FDQueryPerms: TFDQuery;
    FDQueryUsers: TFDQuery;
    ComboBoxUtilisateurs: TComboBox;
    PanelCatalogue: TPanel;
    EditNouveauCode: TEdit;
    EditDescription: TEdit;
    BtnAjouterDroit: TButton;
    BtnSupprimerDroit: TButton;
    BtnUsers: TButton;
    procedure ComboBoxUtilisateursChange(Sender: TObject);
    procedure BtnEnregistrerClick(Sender: TObject);
    procedure BtnAjouterDroitClick(Sender: TObject);
    procedure BtnSupprimerDroitClick(Sender: TObject);
    procedure BtnUsersClick(Sender: TObject);

  private
    { Déclarations privées }
    procedure ChargerCataloguePermissions;
    procedure ChargerUtilisateurs;
    procedure ChargerDroitsUtilisateur(const AUserId: Integer);

  public
    { Déclarations publiques }
  constructor Create(AOwner: TComponent); override;
  end;

var
  FormGestionDroits: TFrameGestionDroits;

implementation

{$R *.dfm}
uses U_DataModule, U_MenuPrincipal, U_TableUsers;


constructor TFrameGestionDroits.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Self.DoubleBuffered := True;

    DisableAlign;
  try
    ChargerCataloguePermissions;
    ChargerUtilisateurs;
  finally
    EnableAlign;
  end;

  if ComboBoxUtilisateurs.Items.Count > 0 then
  begin
    ComboBoxUtilisateurs.ItemIndex := 0;
    ComboBoxUtilisateursChange(Self); // Force le chargement des droits du 1er user
  end;
end;

procedure TFrameGestionDroits.BtnAjouterDroitClick(Sender: TObject);
begin
  if Trim(EditNouveauCode.Text) = '' then
  begin
    ShowMessage('Veuillez saisir un code de permission.');
    Exit;
  end;

  try
    FDQueryUpdate.Connection := DMGesCloud.ConnexionGescloud;
    FDQueryUpdate.SQL.Text := 'INSERT INTO sec_permissions_name (PERMISSION_CODE, DESCRIPTION) VALUES (:code, :desc)';
    FDQueryUpdate.ParamByName('code').AsString := Trim(EditNouveauCode.Text);
    FDQueryUpdate.ParamByName('desc').AsString := Trim(EditDescription.Text);
    FDQueryUpdate.ExecSQL;

    EditNouveauCode.Clear;
    EditDescription.Clear;

    // On recharge le catalogue pour afficher le nouveau droit
    ChargerCataloguePermissions;
    if ComboBoxUtilisateurs.ItemIndex <> -1 then
      ComboBoxUtilisateursChange(ComboBoxUtilisateurs);

    ShowMessage('Nouveau droit ajouté au catalogue avec succès !');
  except
    on E: Exception do
      ShowMessage('Erreur lors de l''ajout (le code existe peut-être déjà) : ' + E.Message);
  end;
end;

procedure TFrameGestionDroits.BtnEnregistrerClick(Sender: TObject);
var
  I: Integer;
  UserId: Integer;
  PermCode: string;
begin
  if ComboBoxUtilisateurs.ItemIndex = -1 then Exit;

  UserId := Integer(ComboBoxUtilisateurs.Items.Objects[ComboBoxUtilisateurs.ItemIndex]);

  // Transaction pour propreté et atomicité
  DMGesCloud.ConnexionGescloud.StartTransaction;
  try
    // 1. On supprime tous les droits actuels de cet utilisateur
    FDQueryUpdate.Connection := DMGesCloud.ConnexionGescloud;
    FDQueryUpdate.SQL.Text := 'DELETE FROM sec_permissions WHERE USER_ID = :uid';
    FDQueryUpdate.ParamByName('uid').AsInteger := UserId;
    FDQueryUpdate.ExecSQL;

    // 2. On réinsère uniquement les droits cochés
    FDQueryUpdate.SQL.Text := 'INSERT INTO sec_permissions (USER_ID, PERMISSION_NAME) VALUES (:uid, :pname)';

    for I := 0 to CheckListBoxPermissions.Items.Count - 1 do
    begin
      if CheckListBoxPermissions.Checked[I] then
      begin
        PermCode := CheckListBoxPermissions.Items[I];
        FDQueryUpdate.ParamByName('uid').AsInteger := UserId;
        FDQueryUpdate.ParamByName('pname').AsString := PermCode;
        FDQueryUpdate.ExecSQL;
      end;
    end;

    DMGesCloud.ConnexionGescloud.Commit;
    ShowMessage('Droits mis à jour avec succès !');
  except
    DMGesCloud.ConnexionGescloud.Rollback;
    raise;
  end;
end;


procedure TFrameGestionDroits.BtnSupprimerDroitClick(Sender: TObject);
var
  CodeASupprimer: string;
begin
  // 1. Vérifier si un élément est sélectionné
  if CheckListBoxPermissions.ItemIndex = -1 then
  begin
    ShowMessage('Veuillez sélectionner une permission dans la liste pour la supprimer.');
    Exit;
  end;

  // 2. Récupérer directement le texte de l'élément sélectionné
  CodeASupprimer := Trim(CheckListBoxPermissions.Items[CheckListBoxPermissions.ItemIndex]);

  if MessageDlg('Supprimer la permission "' + CodeASupprimer + '" ?' + sLineBreak +
                'Cela ne fonctionnera que si elle n''a jamais été attribuée à un utilisateur.',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

  // 3. Exécution de la suppression
  try
    FDQueryUpdate.Connection := DMGesCloud.ConnexionGescloud;
    FDQueryUpdate.SQL.Text :=
      'DELETE FROM sec_permissions_name ' +
      'WHERE PERMISSION_CODE = :code ' +
      'AND NOT EXISTS (SELECT 1 FROM sec_permissions WHERE PERMISSION_NAME = :code)';

    FDQueryUpdate.ParamByName('code').AsString := CodeASupprimer;
    FDQueryUpdate.ExecSQL;

    if FDQueryUpdate.RowsAffected > 0 then
    begin
      ShowMessage('Permission supprimée avec succès.');
      ChargerCataloguePermissions;
    end
    else
    begin
      ShowMessage('Impossible de supprimer : cette permission est déjà utilisée ou n''existe pas.');
    end;
  except
    on E: Exception do
      ShowMessage('Erreur technique : ' + E.Message);
  end;
end;

procedure TFrameGestionDroits.BtnUsersClick(Sender: TObject);
begin
  // Rafraîchir les données pour charger les dernières permissions enregistrées
  //DMGesCloud.QrySecPermissions.Close;
  //DMGesCloud.QrySecPermissions.Open;
  // Ouvre l'IHM TMS d'administration des utilisateurs et rôles
  //DMGesCloud.uilSecurityDlg1.Execute;

  // Créer et afficher la table des utilisateurs avec ShowModal
  with TFormTableUsers.Create(Self) do
  begin
    try
      ShowModal; // ou Show; selon le comportement souhaité
    finally
      Free; // Libère la mémoire proprement à la fermeture (si ShowModal)
    end;
  end;

 // Recharger complètement le contenu de votre frame pour refléter les changements
  ChargerCataloguePermissions;
  ChargerUtilisateurs;
  if ComboBoxUtilisateurs.Items.Count > 0 then
  begin
    ComboBoxUtilisateurs.ItemIndex := 0;
    ComboBoxUtilisateursChange(ComboBoxUtilisateurs);
  end;
end;

procedure TFrameGestionDroits.ChargerCataloguePermissions;
begin
  CheckListBoxPermissions.Items.Clear;

  // On remplit la CheckListBox avec le catalogue officiel de sec_permissions_name
  FDQueryPerms.SQL.Text := 'SELECT PERMISSION_CODE, DESCRIPTION FROM sec_permissions_name ORDER BY PERMISSION_CODE';
  FDQueryPerms.Open;

  while not FDQueryPerms.Eof do
  begin
    // On ajoute le code (vous pouvez aussi concaténer la description si besoin)
    CheckListBoxPermissions.Items.Add(FDQueryPerms.FieldByName('PERMISSION_CODE').AsString);
    FDQueryPerms.Next;
  end;
  FDQueryPerms.Close;
end;

procedure TFrameGestionDroits.ChargerUtilisateurs;
begin
  ComboBoxUtilisateurs.Items.Clear;
  FDQueryUsers.SQL.Text := 'SELECT ID, USERNAME FROM sec_users ORDER BY USERNAME';
  FDQueryUsers.Open;

  while not FDQueryUsers.Eof do
  begin
    // On stocke l'ID de l'utilisateur dans l'objet associé de la ComboBox
    ComboBoxUtilisateurs.AddItem(
      FDQueryUsers.FieldByName('USERNAME').AsString,
      TObject(FDQueryUsers.FieldByName('ID').AsInteger)
    );
    FDQueryUsers.Next;
  end;
  FDQueryUsers.Close;

  if ComboBoxUtilisateurs.Items.Count > 0 then
    ComboBoxUtilisateurs.ItemIndex := 0;
end;

procedure TFrameGestionDroits.ComboBoxUtilisateursChange(Sender: TObject);
var
  UserId: Integer;
begin
  if ComboBoxUtilisateurs.ItemIndex = -1 then Exit;

  UserId := Integer(ComboBoxUtilisateurs.Items.Objects[ComboBoxUtilisateurs.ItemIndex]);
  ChargerDroitsUtilisateur(UserId);
end;

procedure TFrameGestionDroits.ChargerDroitsUtilisateur(const AUserId: Integer);
var
  I: Integer;
  PermCode: string;
  FDQueryCheck: TFDQuery;
begin
  // Décocher tout par défaut
  for I := 0 to CheckListBoxPermissions.Items.Count - 1 do
    CheckListBoxPermissions.Checked[I] := False;

  // Interroger les droits effectifs de l'utilisateur dans sec_permissions
  FDQueryCheck := TFDQuery.Create(nil);
  try
    FDQueryCheck.Connection := DMGesCloud.ConnexionGescloud;
    FDQueryCheck.SQL.Text := 'SELECT PERMISSION_NAME FROM sec_permissions WHERE USER_ID = :uid';
    FDQueryCheck.ParamByName('uid').AsInteger := AUserId;
    FDQueryCheck.Open;

    while not FDQueryCheck.Eof do
    begin
      PermCode := FDQueryCheck.FieldByName('PERMISSION_NAME').AsString;

      // Cocher la case correspondante dans la CheckListBox
      I := CheckListBoxPermissions.Items.IndexOf(PermCode);
      if I <> -1 then
        CheckListBoxPermissions.Checked[I] := True;

      FDQueryCheck.Next;
    end;
  finally
    FDQueryCheck.Free;
  end;
end;

end.

