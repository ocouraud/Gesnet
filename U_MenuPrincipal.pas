unit U_MenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.IniFiles, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, JvgPage, Vcl.CategoryButtons, RzTabs, Vcl.Menus,
  System.UITypes, Vcl.BaseImageCollection, Vcl.ImageCollection,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.ExtCtrls,
  Vcl.WinXCtrls; // Pour TSplitView

type
  TFormMenuPrincipal = class(TForm)
    BtnQuitter: TBitBtn;
    CategoryButtonsGral: TCategoryButtons;
    RzPageControl1: TRzPageControl;
    PopupMenuParametres: TPopupMenu;
    Familles1: TMenuItem;
    Sousfamilles1: TMenuItem;
    Dpartements1: TMenuItem;
    Modesderglements1: TMenuItem;
    TVA: TMenuItem;
    Devises1: TMenuItem;
    Secteursgographiques1: TMenuItem;
    Dpotsdemarchandises1: TMenuItem;
    Postesachats1: TMenuItem;
    Catgoriestarifaires1: TMenuItem;
    Nodechronopices1: TMenuItem;
    arifsgnraux1: TMenuItem;
    Infoscomplmentaires1: TMenuItem;
    Paramtressocit1: TMenuItem;
    Paramtreposte1: TMenuItem;
    DSCtrstock: TDataSource;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    PanelEntete: TPanel;
    BtnToggleMenu: TSpeedButton;
    SplitViewMenu: TSplitView;
    Gestiondesutilisateurs1: TMenuItem;
    Modifmotdepasseutilisateur1: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnToggleMenuClick(Sender: TObject);
    procedure FichiersQuitter(Sender: TObject);
    procedure FichiersParametres(Sender: TObject);
    procedure RzPageControl1Close(Sender: TObject; var AllowClose: Boolean);

    procedure FichiersClients(Sender: TObject);
    procedure FichiersFournisseurs(Sender: TObject);
    procedure FichiersRepresentants(Sender: TObject);
    procedure TravauxCommandesClients(Sender: TObject);
    procedure Familles1Click(Sender: TObject);
    procedure Sousfamilles1Click(Sender: TObject);
    procedure Dpartements1Click(Sender: TObject);
    procedure Modesderglements1Click(Sender: TObject);
    procedure TVAClick(Sender: TObject);
    procedure Devises1Click(Sender: TObject);
    procedure Secteursgographiques1Click(Sender: TObject);
    procedure Dpotsdemarchandises1Click(Sender: TObject);
    procedure Postesachats1Click(Sender: TObject);
    procedure Catgoriestarifaires1Click(Sender: TObject);
    procedure Nodechronopices1Click(Sender: TObject);
    procedure Tarifsgnraux1Click(Sender: TObject);
    procedure Infoscomplmentaires1Click(Sender: TObject);
    procedure Paramtressocit1Click(Sender: TObject);
    procedure Paramtreposte1Click(Sender: TObject);
    procedure Gestiondesutilisateurs1Click(Sender: TObject);
    procedure Modifmotdepasseutilisateur1Click(Sender: TObject);
    procedure FichiersArticles(Sender: TObject);
    procedure TravauxRecalculStockClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FacturationClick(Sender: TObject);
  private
    function ChercherEtActiverOnglet(const ACaption: string): Boolean;
    function OuvrirOnglet<T: TControl>(const ACaption: string; const AImageName: string = ''; AOnCreate: TProc<T> = nil): T;
  public
    { Déclarations publiques }
  end;

var
  FormMenuPrincipal: TFormMenuPrincipal;

implementation

{$R *.dfm}

uses
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  U_DM_Olivier, U_DataModule_H, U_DataModule, U_TableClients, U_TableFamilles,
  U_Learning, U_TableFournis, U_TablePaiement, U_TableParameTVA, U_TableParameDevises,
  U_TableRepres, U_TableGeo, U_TableDepots, U_TablePostesAchats, U_TableActivite,
  U_TableSousfam, U_TableDepart, U_TableChrono, U_TableTarif, U_TableInfoscompl,
  U_FicheCtrstock, U_FicheCaisse, U_FormGestionDroits, U_TableArticles, U_TableEntvtejj;

procedure TFormMenuPrincipal.FormCreate(Sender: TObject);
begin
  Caption := Format('%s - Poste n°%d', [Caption, DM_Olivier.NumeroPoste]);
end;

procedure TFormMenuPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    // Simule un clic sur Quitter
    BtnQuitter.Click;
  end;
end;


procedure TFormMenuPrincipal.FormShow(Sender: TObject);
begin
  if not DM_Olivier.FDQueryCtrstock.Active then
    DM_Olivier.FDQueryCtrstock.Open;

  if not DM_Olivier.FDQueryCtrstock.IsEmpty then
    Caption := 'Revatel - Gesnet - ' + DM_Olivier.FDQueryCtrstock.FieldByName('nom').AsString
  else
    Caption := 'Menu général';

  Caption := Format('%s - Poste n°%d', [Caption, DM_Olivier.NumeroPoste]);

  // Vérification directe pour l'utilisateur courant :
  //Gestiondesutilisateurs1.Enabled := True;

  // Exemple 1 : Masquer ou désactiver l'accès à la gestion des utilisateurs
  // si l'utilisateur courant n'a pas le code 'gestion_utilisateurs'
  GestionDesUtilisateurs1.Visible := DMGesCloud.HasPermission('superviseur');

  // Exemple 2 : Restreindre l'accès à la configuration serveur
  //ConfigurationServeur1.Enabled := HasPermission('server_configuration');

  // Exemple 3 : Restreindre l'accès à la caisse
  //AccesCaisse1.Visible := HasPermission('acces_caisse');
end;

procedure TFormMenuPrincipal.Gestiondesutilisateurs1Click(Sender: TObject);
begin
// Rafraîchir les données pour charger les dernières permissions enregistrées
//  DMGesCloud.QrySecPermissions.Close;
//  DMGesCloud.QrySecPermissions.Open;
//  // Ouvre l'IHM TMS d'administration des utilisateurs et rôles
//  DMGesCloud.uilSecurityDlg1.Execute;
  OuvrirOnglet<TFrameGestionDroits>('Gestion des utilisateurs', 'server_configuration');
end;

procedure TFormMenuPrincipal.BtnToggleMenuClick(Sender: TObject);
begin
  // Animation d'ouverture / fermeture du volet
  if SplitViewMenu.Opened then
    SplitViewMenu.Close
  else
    SplitViewMenu.Open;
end;

procedure TFormMenuPrincipal.FichiersQuitter(Sender: TObject);
begin
  if MessageDlg('Voulez-vous vraiment quitter l''application ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Close;
end;

procedure TFormMenuPrincipal.FichiersParametres(Sender: TObject);
var
  Pt: TPoint;
begin
  GetCursorPos(Pt);
  PopupMenuParametres.Popup(Pt.X, Pt.Y);
end;

procedure TFormMenuPrincipal.RzPageControl1Close(Sender: TObject; var AllowClose: Boolean);
var
  Page: TRzTabSheet;
begin
  Page := RzPageControl1.ActivePage;
  if (Page <> nil) and (Page.ControlCount > 0) then
    Page.Controls[0].Free;

  AllowClose := True;
end;

function TFormMenuPrincipal.ChercherEtActiverOnglet(const ACaption: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to RzPageControl1.PageCount - 1 do
  begin
    if SameText(RzPageControl1.Pages[i].Caption, ACaption) then
    begin
      RzPageControl1.ActivePageIndex := i;
      Exit(True);
    end;
  end;
end;

function TFormMenuPrincipal.OuvrirOnglet<T>(const ACaption: string; const AImageName: string; AOnCreate: TProc<T>): T;
var
  NouvelOnglet: TRzTabSheet;
  Contenu: T;
  IdxImage: Integer;
begin
  if ChercherEtActiverOnglet(ACaption) then
    Exit(nil);

  LockWindowUpdate(RzPageControl1.Handle);
  try
    NouvelOnglet := TRzTabSheet.Create(RzPageControl1);
    NouvelOnglet.PageControl := RzPageControl1;
    NouvelOnglet.Caption := ACaption;
    NouvelOnglet.PageIndex := 0;

    if AImageName <> '' then
    begin
      IdxImage := VirtualImageList1.GetIndexByName(AImageName);
      if IdxImage <> -1 then
        NouvelOnglet.ImageIndex := IdxImage;
    end;

    Contenu := T(T.Create(NouvelOnglet));
    Contenu.Parent := NouvelOnglet;
    Contenu.Align := alClient;

    if Assigned(AOnCreate) then
      AOnCreate(Contenu);

    Contenu.Show;
    RzPageControl1.ActivePage := NouvelOnglet;
    Result := Contenu;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TFormMenuPrincipal.FichiersClients(Sender: TObject);
begin
  OuvrirOnglet<TFormTableClients>('Table Clients', 'client_account_template');
end;

procedure TFormMenuPrincipal.FichiersArticles(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableArticles>('Table Articles', 'produit');
end;

procedure TFormMenuPrincipal.FichiersFournisseurs(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableFournis>('Table Fournisseurs', 'qip_at_work');
end;

procedure TFormMenuPrincipal.FichiersRepresentants(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableRepres>('Table Représentants', 'meeting_workspace');
end;

procedure TFormMenuPrincipal.TravauxCommandesClients(Sender: TObject);
begin
  OuvrirOnglet<TRzTabSheet>('Commandes clients');
end;

procedure TFormMenuPrincipal.Dpartements1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableDepart>('Départements', 'server_configuration');
end;

procedure TFormMenuPrincipal.Dpotsdemarchandises1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableDepots>('Dépots de marchandises', 'server_configuration');
end;

procedure TFormMenuPrincipal.Familles1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableFamilles>('Table Familles', 'server_configuration');
end;

procedure TFormMenuPrincipal.Sousfamilles1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableSousfam>('Sous-familles', 'server_configuration');
end;

procedure TFormMenuPrincipal.Modesderglements1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTablePaiement>('Modes de paiements', 'server_configuration');
end;

procedure TFormMenuPrincipal.Modifmotdepasseutilisateur1Click(Sender: TObject);
begin
  DMGesCloud.uilChangePasswordDlg1.Execute;
end;

procedure TFormMenuPrincipal.TVAClick(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableTVA>('Paramétrage TVA', 'server_configuration');
end;

procedure TFormMenuPrincipal.Devises1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableDevises>('Table Devises', 'server_configuration');
end;

procedure TFormMenuPrincipal.Secteursgographiques1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableGeo>('Secteurs géographiques', 'server_configuration');
end;

procedure TFormMenuPrincipal.Postesachats1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTablePostesAchats>('Postes achats', 'server_configuration');
end;

procedure TFormMenuPrincipal.TravauxRecalculStockClick(Sender: TObject);
begin
  // 1. Confirmation pour éviter un clic accidentel
  if MessageDlg('Êtes-vous sûr de vouloir lancer le recalcul complet de tous les stocks ?' + #13 +
                'Cette opération peut prendre quelques instants.',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // 2. Curseur d'attente pour informer l'utilisateur que le système travaille
    Screen.Cursor := crHourGlass;
    try
      // 3. Appel de la procédure
      DM_Olivier.RecalculerToutLeStock;

      // 4. Message de succès
      MessageDlg('Le recalcul de tous les stocks a été effectué avec succès.', mtInformation, [mbOk], 0);
    finally
      // 5. Restauration du curseur quoiqu'il arrive
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFormMenuPrincipal.FacturationClick(Sender: TObject);
var
  MonFrame: TFrameTableEntvtejj;
begin
  // Votre méthode qui crée ou ouvre l'onglet/frame
  MonFrame := OuvrirOnglet<TFrameTableEntvtejj>('Factures du jour', 'invoice_12560218');

  // Rediriger le focus sur le frame ou un composant précis à l'intérieur
  if Assigned(MonFrame) then
  begin
    // Si vous souhaitez cibler un composant en particulier (ex: une grille ou un champ de recherche) :
    MonFrame.JvDBGridEntvtejj.SetFocus;

    // Ou donner le focus global au frame s'il peut l'accepter :
    //if MonFrame.CanFocus then
    //  MonFrame.SetFocus;
  end;
end;


procedure TFormMenuPrincipal.Catgoriestarifaires1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableActivite>('Catégories tarifaires', 'server_configuration');
end;

procedure TFormMenuPrincipal.Nodechronopices1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableChrono>('Chrono pièces', 'server_configuration');
end;

procedure TFormMenuPrincipal.Tarifsgnraux1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableTarif>('Tarifs généraux', 'server_configuration');
end;

procedure TFormMenuPrincipal.Infoscomplmentaires1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameTableInfoscompl>('Infos Complémentaires', '',
    procedure(Fiche: TFrameTableInfoscompl)
    begin
      Fiche.ChargerArbreInfocompl;
    end);
end;

procedure TFormMenuPrincipal.Paramtressocit1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameFicheCtrstock>('Paramètres société', 'server_configuration');
end;

procedure TFormMenuPrincipal.Paramtreposte1Click(Sender: TObject);
begin
  OuvrirOnglet<TFrameFicheCaisse>('Paramètres du poste ' + IntToStr(DM_Olivier.NumeroPoste), 'server_configuration');
end;

end.
