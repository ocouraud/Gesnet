unit U_TableFamilles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrameTableFamilles = class(TFrame)
    DSFamilles: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    BtnNouveau: TBitBtn;
    ModifierFamille: TBitBtn;
    procedure JvDBGrid1TitleBtnClick(Sender: TObject; ACol: LongInt;
      Field: TField);
    procedure BtnNouveauClick(Sender: TObject);
    procedure BtnModifierFamilleClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses U_DataModule, U_FicheFamille;

{$R *.dfm}

procedure TFrameTableFamilles.BtnNouveauClick(Sender: TObject);
var
  FormFiche: TFormFicheFamille;
begin
  FormFiche := TFormFicheFamille.Create(Self);
  try
    FormFiche.DSFamilles.DataSet := DMGesCloud.FDQueryFamilles;

    // Configuration de la fiche
    FormFiche.ModeSaisie := msAjout;
    FormFiche.Caption := 'Créer une nouvelle famille';

    // Passage en mode insertion
    DMGesCloud.FDQueryFamilles.Insert;

    // Si l'utilisateur valide :
    if FormFiche.ShowModal = mrOk then
    begin
      // Le .Post a été fait dans la fiche
    end
    else
    begin
      // Annulation
      DMGesCloud.FDQueryFamilles.Cancel;
    end;
  finally
    FormFiche.Free;
  end;
end;

procedure TFrameTableFamilles.BtnModifierFamilleClick(Sender: TObject);
var
  FormFiche: TFormFicheFamille;
begin
  // Sécurité : Vérifier qu'il y a bien une ligne sélectionnée
  if DMGesCloud.FDQueryFamilles.IsEmpty then Exit;

  // Passage du dataset en édition
  DMGesCloud.FDQueryFamilles.Edit;

  FormFiche := TFormFicheFamille.Create(Self);
  try
    // Définition du mode et du titre
    FormFiche.ModeSaisie := msModification;
    FormFiche.Caption := 'Modifier la famille';

    // Affichage modale
    if FormFiche.ShowModal = mrOk then
    begin
      // Traitement si besoin
    end
    else
    begin
      // Annulation
      DMGesCloud.FDQueryFamilles.Cancel;
    end;
  finally
    FormFiche.Free;
  end;
end;

constructor TFrameTableFamilles.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  if Assigned(DMGesCloud) and Assigned(DMGesCloud.FDQueryFamilles) then
  begin
    if not DMGesCloud.FDQueryFamilles.Active then
      DMGesCloud.FDQueryFamilles.Open;
  end;
end;

procedure TFrameTableFamilles.JvDBGrid1TitleBtnClick(Sender: TObject;
  ACol: LongInt; Field: TField);
begin
  if Assigned(Field) then
  begin
    // Tri dynamique FireDAC
    if DMGesCloud.FDQueryFamilles.IndexFieldNames = Field.FieldName then
      DMGesCloud.FDQueryFamilles.IndexFieldNames := Field.FieldName + ':D'
    else
      DMGesCloud.FDQueryFamilles.IndexFieldNames := Field.FieldName;
  end;
end;

end.
