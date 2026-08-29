unit U_FicheStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TStockModeSaisie = (msAjout, msModification); // Type nommé global à l'unité
  TFormFicheStock = class(TForm)
    DSStock: TDataSource;
    DBCodart: TDBEdit;
    DBCoddep: TDBEdit;
    Label3: TLabel;
    DBDate: TDBEdit;
    Label5: TLabel;
    DBQte: TDBEdit;
    Label6: TLabel;
    DBValunit: TDBEdit;
    Label7: TLabel;
    DBLibelle: TDBEdit;
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    RadioNature: TDBRadioGroup;
    procedure BtnValiderClick(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
    procedure RadioNatureClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  ModeSaisie: TStockModeSaisie; // On utilise ce type ici
  end;

var
  FormFicheStock: TFormFicheStock;

implementation

{$R *.dfm}
uses U_FicheArticle, U_DM_Olivier;


procedure TFormFicheStock.BtnAnnulerClick(Sender: TObject);
begin
  // Si des modifications étaient en cours, on les annule proprement
  if FormFicheArticle.FDQueryStock.State in [dsEdit, dsInsert] then
    FormFicheArticle.FDQueryStock.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;

procedure TFormFicheStock.BtnValiderClick(Sender: TObject);
begin

  if DBQte.Field.AsFloat = 0 then
  begin
    ShowMessage('Erreur quantité.');
    if DBQte.CanFocus then
     DBQte.SetFocus;
    Exit; // On bloque la fermeture
  end;

  if (DBQte.Field.AsFloat < 0) and (RadioNature.ItemIndex = 0) then
  begin
    ShowMessage('Erreur quantité.');
    if DBQte.CanFocus then
     DBQte.SetFocus;
    Exit; // On bloque la fermeture
  end;

  // 2. Tentative d'enregistrement sécurisée
  try
    // On force la validation dans le buffer du tarif
    // (Cela va déclencher le BeforePost du DataModule pour le stock)
   FormFicheArticle.FDQueryStock.Post;

    // Si tout est OK, on autorise la fermeture de la fiche
    Self.ModalResult := mrOk;

  except
    on E: Exception do
    begin
      // Si une erreur/doublon est détecté par la base ou le BeforePost :
      MessageDlg('Erreur sur le mouvement :'#13#10 + E.Message, mtError, [mbOK], 0);
      // La fiche reste ouverte pour que l'utilisateur corrige l'erreur !
    end;
  end;
end;



procedure TFormFicheStock.RadioNatureClick(Sender: TObject);
begin
  try
    // S'assurer que le dataset est en mode Edition ou Insertion
    if Assigned(DSStock) and Assigned(DSStock.DataSet) then
      if not (DSStock.DataSet.State in [dsEdit, dsInsert]) then
        Exit;

    case RadioNature.ItemIndex of
      0: // Entree
        begin
          DBLibelle.Text := 'Entrée en stock';
        end;

      1: // Sortie
        begin
          DBLibelle.Text := 'Sortie de stock';

          // Force la quantité en négatif (Valeur absolue * -1)
          // Si vous utilisez un TDBEdit lié au champ QTE :
          if Assigned(DBQte.Field) and not DBQte.Field.IsNull then
            DBQte.Field.AsFloat := -Abs(DBQte.Field.AsFloat);
        end;

      2: // Redressement
        begin
          DBLibelle.Text := 'Redressement';
        end;

      3: // Inventaire
        begin
          DBLibelle.Text := 'Inventaire';
        end;
    end;
  finally
  end;
end;

end.
