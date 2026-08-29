unit U_TableInfoscompl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus;

type
  TFrameTableInfoscompl = class(TFrame)
    TreeViewIC: TTreeView;
    FDQueryTree: TFDQuery;
    PopupMenuTree: TPopupMenu;
    pmNouveau: TMenuItem;
    pmModifier: TMenuItem;
    pmSupprimer: TMenuItem;
    procedure TreeViewICMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pmNouveauClick(Sender: TObject);
    procedure pmSupprimerClick(Sender: TObject);
    procedure pmModifierClick(Sender: TObject);
    procedure TreeViewICDblClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure ChargerArbreInfocompl; // <--- À déclarer ici
  end;

implementation

{$R *.dfm}
uses U_DataModule;

procedure TFrameTableInfoscompl.ChargerArbreInfocompl;
var
  NodeA, NodeC, NodeRacine, NodeGroupe: TTreeNode;
  CurrentType: string;
  CurrentGroupeId: Integer;
begin
  TreeViewIC.Items.BeginUpdate;
  try
    TreeViewIC.Items.Clear;

    // 1. Création FIXE des deux catégories racines (toujours présentes)
    NodeA := TreeViewIC.Items.Add(nil, 'A - Articles');
    NodeC := TreeViewIC.Items.Add(nil, 'C - Clients');

    // 2. Lecture des groupes et codes existants
    FDQueryTree.Close;
    FDQueryTree.SQL.Text :=
      'SELECT p.type_, p.id AS groupe_id, p.libelle AS groupe_libelle, ' +
      '       c.codinfo, c.libelle AS code_libelle ' +
      'FROM parinfocompl p ' +
      'LEFT JOIN codinfocompl c ON p.type_ = c.type_ AND p.id = c.id ' +
      'ORDER BY p.type_, p.id, c.codinfo';
    FDQueryTree.Open;

    CurrentType := '';
    CurrentGroupeId := -1;
    NodeGroupe := nil;

    while not FDQueryTree.Eof do
    begin
      // Sélection de la bonne racine selon le type
      if FDQueryTree.FieldByName('type_').AsString = 'A' then
        NodeRacine := NodeA
      else if FDQueryTree.FieldByName('type_').AsString = 'C' then
        NodeRacine := NodeC
      else
        NodeRacine := nil;

      if Assigned(NodeRacine) then
      begin
        // Création du groupe (Niveau 1) si changement de groupe ou de type
        if (FDQueryTree.FieldByName('type_').AsString <> CurrentType) or
           (FDQueryTree.FieldByName('groupe_id').AsInteger <> CurrentGroupeId) then
        begin
          CurrentType := FDQueryTree.FieldByName('type_').AsString;
          CurrentGroupeId := FDQueryTree.FieldByName('groupe_id').AsInteger;

          NodeGroupe := TreeViewIC.Items.AddChild(NodeRacine,
            FDQueryTree.FieldByName('groupe_id').AsString + ' - ' +
            FDQueryTree.FieldByName('groupe_libelle').AsString);
        end;

        // Création du code info (Niveau 2)
        if not FDQueryTree.FieldByName('codinfo').IsNull then
        begin
          TreeViewIC.Items.AddChild(NodeGroupe,
            FDQueryTree.FieldByName('codinfo').AsString + ' : ' +
            FDQueryTree.FieldByName('code_libelle').AsString);
        end;
      end;

      FDQueryTree.Next;
    end;
  finally
    TreeViewIC.Items.EndUpdate;
    TreeViewIC.FullExpand;
  end;
end;


procedure TFrameTableInfoscompl.TreeViewICDblClick(Sender: TObject);
begin
  pmModifierClick(Sender);
end;

procedure TFrameTableInfoscompl.pmModifierClick(Sender: TObject);
var
  Node: TTreeNode;
  TypeStr, CodInfo, LibelleActuel: string;
  GroupeId: Integer;
begin
  Node := TreeViewIC.Selected;
  if not Assigned(Node) or (Node.Level = 0) then Exit;

  // --- Modifier Groupe (Niveau 1) ---
  if Node.Level = 1 then
  begin
    TypeStr := Copy(Node.Parent.Text, 1, 1);
    GroupeId := StrToIntDef(Trim(Copy(Node.Text, 1, Pos('-', Node.Text) - 1)), 0);
    LibelleActuel := Trim(Copy(Node.Text, Pos('-', Node.Text) + 1, Length(Node.Text)));

    if InputQuery('Modifier Groupe', 'Libellé :', LibelleActuel) then
    begin
      FDQueryTree.SQL.Text := 'UPDATE parinfocompl SET libelle = :LIB WHERE type_ = :TP AND id = :ID';
      FDQueryTree.ParamByName('LIB').AsString := LibelleActuel;
      FDQueryTree.ParamByName('TP').AsString := TypeStr;
      FDQueryTree.ParamByName('ID').AsInteger := GroupeId;
      FDQueryTree.ExecSQL;
      ChargerArbreInfocompl;
    end;
  end

  // --- Modifier Code Info (Niveau 2) ---
  else if Node.Level = 2 then
  begin
    TypeStr := Copy(Node.Parent.Parent.Text, 1, 1);
    GroupeId := StrToIntDef(Trim(Copy(Node.Parent.Text, 1, Pos('-', Node.Parent.Text) - 1)), 0);
    CodInfo := Trim(Copy(Node.Text, 1, Pos(':', Node.Text) - 1));
    LibelleActuel := Trim(Copy(Node.Text, Pos(':', Node.Text) + 1, Length(Node.Text)));

    if InputQuery('Modifier Libellé Code Info', 'Libellé :', LibelleActuel) then
    begin
      FDQueryTree.SQL.Text := 'UPDATE codinfocompl SET libelle = :LIB WHERE type_ = :TP AND id = :ID AND codinfo = :COD';
      FDQueryTree.ParamByName('LIB').AsString := LibelleActuel;
      FDQueryTree.ParamByName('TP').AsString := TypeStr;
      FDQueryTree.ParamByName('ID').AsInteger := GroupeId;
      FDQueryTree.ParamByName('COD').AsString := CodInfo;
      FDQueryTree.ExecSQL;
      ChargerArbreInfocompl;
    end;
  end;
end;

procedure TFrameTableInfoscompl.pmNouveauClick(Sender: TObject);
var
  Node: TTreeNode;
  TypeStr, SaisieCode, SaisieLibelle: string;
  GroupeId: Integer;
begin
  Node := TreeViewIC.Selected;
  if not Assigned(Node) then Exit;

  // --- Cas 1 : Créer un GROUPE sur un Type (Niveau 0) ---
  if Node.Level = 0 then
  begin
    TypeStr := Copy(Node.Text, 1, 1); // 'A' ou 'C'
    if InputQuery('Nouveau Groupe', 'Libellé du groupe :', SaisieLibelle) and (Trim(SaisieLibelle) <> '') then
    begin
      // Calcul du nouvel ID groupe
      FDQueryTree.SQL.Text := 'SELECT COALESCE(MAX(id), 0) + 1 AS NEXT_ID FROM parinfocompl WHERE type_ = :TP';
      FDQueryTree.ParamByName('TP').AsString := TypeStr;
      FDQueryTree.Open;
      GroupeId := FDQueryTree.FieldByName('NEXT_ID').AsInteger;

      // Insert MySQL
      FDQueryTree.SQL.Text := 'INSERT INTO parinfocompl (type_, id, libelle) VALUES (:TP, :ID, :LIB)';
      FDQueryTree.ParamByName('TP').AsString := TypeStr;
      FDQueryTree.ParamByName('ID').AsInteger := GroupeId;
      FDQueryTree.ParamByName('LIB').AsString := SaisieLibelle;
      FDQueryTree.ExecSQL;

      ChargerArbreInfocompl; // Rafraîchit l'arbre
    end;
  end

  // --- Cas 2 : Créer un CODE INFO dans un Groupe (Niveau 1) ---
  else if Node.Level = 1 then
  begin
    TypeStr := Copy(Node.Parent.Text, 1, 1);
    GroupeId := StrToIntDef(Trim(Copy(Node.Text, 1, Pos('-', Node.Text) - 1)), 0);

    if InputQuery('Nouveau Code', 'Code Info (ex: LIG9) :', SaisieCode) and (Trim(SaisieCode) <> '') then
    begin
      if InputQuery('Nouveau Code', 'Libellé :', SaisieLibelle) then
      begin
        FDQueryTree.SQL.Text := 'INSERT INTO codinfocompl (type_, id, codinfo, libelle) VALUES (:TP, :ID, :COD, :LIB)';
        FDQueryTree.ParamByName('TP').AsString := TypeStr;
        FDQueryTree.ParamByName('ID').AsInteger := GroupeId;
        FDQueryTree.ParamByName('COD').AsString := UpperCase(SaisieCode);
        FDQueryTree.ParamByName('LIB').AsString := SaisieLibelle;
        FDQueryTree.ExecSQL;

        ChargerArbreInfocompl;
      end;
    end;
  end;
end;

procedure TFrameTableInfoscompl.pmSupprimerClick(Sender: TObject);
var
  Node: TTreeNode;
  TypeStr, CodInfo: string;
  GroupeId: Integer;
begin
  Node := TreeViewIC.Selected;
  if not Assigned(Node) or (Node.Level = 0) then Exit; // On ne supprime pas les racines 'A' et 'C'

  if MessageDlg('Voulez-vous vraiment supprimer cet élément ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  // --- Suppression d'un GROUPE (Niveau 1) ---
  if Node.Level = 1 then
  begin
    TypeStr := Copy(Node.Parent.Text, 1, 1);
    GroupeId := StrToIntDef(Trim(Copy(Node.Text, 1, Pos('-', Node.Text) - 1)), 0);

    // Supprime d'abord les enfants codinfocompl puis le groupe parinfocompl
    FDQueryTree.SQL.Text := 'DELETE FROM codinfocompl WHERE type_ = :TP AND id = :ID';
    FDQueryTree.ParamByName('TP').AsString := TypeStr;
    FDQueryTree.ParamByName('ID').AsInteger := GroupeId;
    FDQueryTree.ExecSQL;

    FDQueryTree.SQL.Text := 'DELETE FROM parinfocompl WHERE type_ = :TP AND id = :ID';
    FDQueryTree.ParamByName('TP').AsString := TypeStr;
    FDQueryTree.ParamByName('ID').AsInteger := GroupeId;
    FDQueryTree.ExecSQL;
  end

  // --- Suppression d'un CODE INFO (Niveau 2) ---
  else if Node.Level = 2 then
  begin
    TypeStr := Copy(Node.Parent.Parent.Text, 1, 1);
    GroupeId := StrToIntDef(Trim(Copy(Node.Parent.Text, 1, Pos('-', Node.Parent.Text) - 1)), 0);
    CodInfo := Trim(Copy(Node.Text, 1, Pos(':', Node.Text) - 1));

    FDQueryTree.SQL.Text := 'DELETE FROM codinfocompl WHERE type_ = :TP AND id = :ID AND codinfo = :COD';
    FDQueryTree.ParamByName('TP').AsString := TypeStr;
    FDQueryTree.ParamByName('ID').AsInteger := GroupeId;
    FDQueryTree.ParamByName('COD').AsString := CodInfo;
    FDQueryTree.ExecSQL;
  end;

  ChargerArbreInfocompl;
end;

procedure TFrameTableInfoscompl.TreeViewICMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
  if Button = mbRight then
  begin
    Node := TreeViewIC.GetNodeAt(X, Y);
    if Assigned(Node) then
      TreeViewIC.Selected := Node;
  end;
end;

end.
