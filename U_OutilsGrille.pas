unit U_OutilsGrille;

interface

uses
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client;

procedure AppliquerFiltresCumules(PanneauRecherche: TPanel; QueryAFiltrer: TFDQuery);

implementation

uses
  System.SysUtils, Vcl.Controls;


procedure AppliquerFiltresCumules(PanneauRecherche: TPanel; QueryAFiltrer: TFDQuery);
var
  i: Integer;
  Composant: TControl;
  UnEdit: TEdit;
  NomComposant: string;
  ChampMySQL: string;
  ClauseFiltre: string;
  FiltreGlobal: string;
  PositionUnderscore: Integer;
begin
  if (PanneauRecherche = nil) or (QueryAFiltrer = nil) then Exit;

  FiltreGlobal := '';

  // On boucle sur tous les composants du TPanel
  for i := 0 to PanneauRecherche.ControlCount - 1 do
  begin
    Composant := PanneauRecherche.Controls[i];

    if Composant is TEdit then
    begin
      UnEdit := TEdit(Composant);
      NomComposant := UnEdit.Name; // Exemple: "EdtCherche_CODCLI"

      // On cherche la position du caractère "_"
      PositionUnderscore := Pos('_', NomComposant);

      // Si on trouve le "_" et que le champ n'est pas vide
      if (PositionUnderscore > 0) and (UnEdit.Text <> '') then
      begin
        // On extrait tout ce qui se trouve APRÈS le "_"
        ChampMySQL := Copy(NomComposant, PositionUnderscore + 1, Length(NomComposant));

        if ChampMySQL <> '' then
        begin
          ClauseFiltre := ChampMySQL + ' LIKE ' + QuotedStr(UnEdit.Text + '%');

          if FiltreGlobal <> '' then
            FiltreGlobal := FiltreGlobal + ' AND ';

          FiltreGlobal := FiltreGlobal + ClauseFiltre;
        end;
      end;
    end;
  end;

  // Application à FireDAC
  if FiltreGlobal <> '' then
  begin
    QueryAFiltrer.Filter := FiltreGlobal;
    QueryAFiltrer.Filtered := True;
  end
  else
  begin
    QueryAFiltrer.Filtered := False;
  end;
end;

end.
