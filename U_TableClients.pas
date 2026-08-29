unit U_TableClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls, RzTabs, RLReport, JvExDBGrids, JvDBGrid,
  System.Actions, Vcl.ActnList, JvComponentBase, JvAppHotKey;

type
  TFormTableClients = class(TFrame)
    DSClients: TDataSource;
    Panel1: TPanel;
    EdtCherche_CODCLI: TEdit;
    EdtCherche_NOM: TEdit;
    CheckBoxFermes: TCheckBox;
    Panel2: TPanel;
    BtnAjouter: TBitBtn;
    BtnOuvrir: TBitBtn;
    BtnSupprimer: TBitBtn;
    BtnFermer: TBitBtn;
    JvDBGridClients: TJvDBGrid;
    BtnAide: TBitBtn;
    procedure EdtCherche_CODCLIChange(Sender: TObject);
    procedure EdtCherche_NOMChange(Sender: TObject);
    procedure CheckBoxFermesClick(Sender: TObject);
    constructor Create(AOwner: TComponent); override;
    procedure BtnAjouterClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnFermerClick(Sender: TObject);
    procedure DSClientsDataChange(Sender: TObject; Field: TField);
    procedure JvDBGridClientsDblClick(Sender: TObject);
    procedure JvDBGridClientsTitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnAideClick(Sender: TObject);

    //procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
    //  DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Déclarations privées }
    procedure AppliquerFiltreMaitre;
    //et pour exemple...
    //procedure FiltrerChampDynamique(EditDeRecherche: TEdit; const NomDuChampMySQL: string);

  public
    { Déclarations publiques }
  end;


implementation

{$R *.dfm}

uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FicheClient, U_FormAide;


constructor TFormTableClients.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi

  // On ouvre la table des clients (vous devez déjà avoir cette ligne ou similaire)
  DMGesCloud.ReqClients.Close;
  DMGesCloud.ReqClients.Open;

  // OBLIGATOIRE : On ouvre la table des représentants pour alimenter le Combo !
  DMGesCloud.ReqRepres.Open;

  // OBLIGATOIRE : On ouvre la table des secteurs geo pour alimenter le Combo !
  DMGesCloud.ReqGeo.Open;

  // FORCE le masquage de la colonne OBSERV à l'exécution, peu importe les bugs de l'IHM
  //DBGrid1.Columns[0].Visible := False;
  //ou
  DMGesCloud.ReqClients.FieldByName('OBSERV').Visible := False;

end;



procedure TFormTableClients.BtnFermerClick(Sender: TObject);
var
  OngletParent: TRzTabSheet;
begin
  if Assigned(Self.Parent) and (Self.Parent is TRzTabSheet) then
  begin
    OngletParent := TRzTabSheet(Self.Parent);

    // Repousse la destruction de l'onglet à la fin du traitement du clic
    TThread.ForceQueue(nil, procedure
    begin
      OngletParent.Free;
    end);
  end;
end;


procedure TFormTableClients.BtnSupprimerClick(Sender: TObject);
begin
  // 1. On vérifie d'abord si la table n'est pas vide
  if DMGesCloud.ReqClients.IsEmpty then
  begin
    ShowMessage('Il n''y a aucun client à supprimer.');
    Exit;
  end;

  // 2. On demande une confirmation claire à l'utilisateur
  if MessageDlg('Voulez-vous vraiment supprimer le client ' +
                DMGesCloud.ReqClients.FieldByName('NOM').AsString + ' ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMGesCloud.ReqClients.DisableControls; // On évite les clignotements visuels
    try
      // 3. On procède à la suppression dans MySQL
      DMGesCloud.ReqClients.Delete;

      // 4. On rafraîchit pour que la grille soit à jour avec le serveur
      DMGesCloud.ReqClients.Refresh;
    finally
      DMGesCloud.ReqClients.EnableControls; // On réactive l'affichage
    end;
  end;
end;


procedure TFormTableClients.BtnAideClick(Sender: TObject);
begin
  // 1. On s'assure que la fiche d'aide existe en mémoire
  if not Assigned(FormAide) then
    Application.CreateForm(TFormAide, FormAide);

  // 2. On affiche la page
  FormAide.AfficherAide('clients_liste.html');
end;


procedure TFormTableClients.BtnAjouterClick(Sender: TObject);
var
  BM: TBookmark;
begin
  FormFicheClient := TFormFicheClient.Create(Self);
  try
    FormFicheClient.DSClients.DataSet := DMGesCloud.ReqClients;
    FormFicheClient.ModeSaisie := msAjout;
    FormFicheClient.Caption := 'Créer un nouveau client';

    DMGesCloud.ReqClients.Insert;

    if FormFicheClient.ShowModal = mrOk then
    begin
      BM := DMGesCloud.ReqClients.GetBookmark;
      try
        DMGesCloud.ReqClients.Refresh;
        if DMGesCloud.ReqClients.BookmarkValid(BM) then
          DMGesCloud.ReqClients.GotoBookmark(BM);
      finally
        DMGesCloud.ReqClients.FreeBookmark(BM);
      end;
    end
    else
      DMGesCloud.ReqClients.Cancel;
  finally
    FormFicheClient.Free;
  end;
end;



//SI FERMES ou PAS FERMES
procedure TFormTableClients.CheckBoxFermesClick(Sender: TObject);
begin
     AppliquerFiltreMaitre();
end;



procedure TFormTableClients.DSClientsDataChange(Sender: TObject; Field: TField);
begin

end;

//Procedures de Recherches
procedure TFormTableClients.EdtCherche_NOMChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DMGesCloud.ReqClients);
end;

procedure TFormTableClients.EdtCherche_CODCLIChange(Sender: TObject);
begin
  // Si la Frame est en train d'être détruite, on quitte immédiatement !
  if (csDestroying in ComponentState) then Exit;

  AppliquerFiltresCumules(Panel1, DMGesCloud.ReqClients);
end;



//Procedure de FILTRAGE
procedure TFormTableClients.AppliquerFiltreMaitre;
var
  FiltreSQL: string;
begin
  FiltreSQL := '';

  //On raffraichit la requete si modifiee entre temps
  DM_Olivier.FDQueryClient.Refresh;

  if not CheckBoxFermes.Checked then FiltreSQL := 'ferme = 0' else FiltreSQL := 'ferme = 1';


  // 2. On vérifie si le champ Nom contient du texte
  //if EdtCherche_Nom.Text <> '' then
  //begin
  //  if FiltreSQL <> '' then FiltreSQL := FiltreSQL + ' AND '; // On cumule les filtres
  //  FiltreSQL := FiltreSQL + 'nom LIKE ' + QuotedStr(EdtCherche_Nom.Text + '%');
  //end;

  // 3. On applique le filtre résultant à FireDAC
  if FiltreSQL <> '' then
  begin
    DMGesCloud.ReqClients.Filter := FiltreSQL;
    DMGesCloud.ReqClients.Filtered := True;
  end
  else
  begin
    // Si les deux champs sont vides, on coupe le filtre
    DMGesCloud.ReqClients.Filtered := False;
  end;
end;



//OBSOLETE, on garde pour l'exemple
//procedure TFormTableClients.FiltrerChampDynamique(EditDeRecherche: TEdit; const NomDuChampMySQL: string);
//var
//  FiltreActuel: string;
//begin
//  // On commence par désactiver le filtre pour travailler sur les données propres
//  DMGesCloud.ReqClients.Filtered := False;
//
//  // Si le champ de recherche n'est pas vide, on prépare la condition LIKE
//  if EditDeRecherche.Text <> '' then
//  begin
//    FiltreActuel := NomDuChampMySQL + ' LIKE ' + QuotedStr(EditDeRecherche.Text + '%');
//
//    // On applique le filtre au composant FireDAC
//    DMGesCloud.ReqClients.Filter := FiltreActuel;
//    DMGesCloud.ReqClients.Filtered := True;
//  end;
//end;


procedure TFormTableClients.JvDBGridClientsDblClick(Sender: TObject);
begin
  // Vérifie qu'un client est bien sélectionné
  if DMGesCloud.ReqClients.IsEmpty then Exit;

  FormFicheClient := TFormFicheClient.Create(Self);
  try
    FormFicheClient.DSClients.DataSet := DMGesCloud.ReqClients;
    FormFicheClient.ModeSaisie := msModification;
    FormFicheClient.Caption := 'Modifier le client';

    DMGesCloud.ReqClients.Edit; // <-- Passage en édition

  if FormFicheClient.ShowModal = mrOk then
    DM_Olivier.RefreshDataSetWithBookmark(DMGesCloud.ReqClients)
  else
    DMGesCloud.ReqClients.Cancel;
  finally
    FormFicheClient.Free;
  end;
end;


procedure TFormTableClients.JvDBGridClientsTitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Si la colonne est déjà triée en A-Z, on la passe en Z-A (:D = Descending dans FireDAC)
    if DMGesCloud.ReqClients.IndexFieldNames = Field.FieldName then
      DMGesCloud.ReqClients.IndexFieldNames := Field.FieldName + ':D'
    else
      DMGesCloud.ReqClients.IndexFieldNames := Field.FieldName; // Tri A-Z
  end;

end;

//FIN PROGRAMME
end.
