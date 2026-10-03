unit U_FrameFacturesReccurentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameFacturesReccurentes = class(TFrame)
    JvDBGridLot_eva: TJvDBGrid;
    FDQueryLot_eva: TFDQuery;
    FDQueryLot_evaNOLOT: TIntegerField;
    FDQueryLot_evaLIBELLE: TStringField;
    FDQueryLot_evaDAT_DER_GEN: TDateTimeField;
    FDQueryLot_evaNOCOULEUR: TIntegerField;
    DSLot_eva: TDataSource;
    ColorDialog1: TColorDialog;
    BtnSupprimer: TButton;
    FDQueryLot_eva_det: TFDQuery;
    DSLot_eva_det: TDataSource;
    JvDBGridLot_eva_det: TJvDBGrid;
    FDQueryLot_eva_detIDlot_eva_det: TLargeintField;
    FDQueryLot_eva_detNOLOT: TIntegerField;
    FDQueryLot_eva_detCODFAC: TIntegerField;
    FDQueryLot_eva_detCODFAC_DER_GEN: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    FDQueryLot_eva_detnom: TStringField;
    FDQueryLot_eva_detdate_: TDateField;
    FDQueryLot_eva_detmt_ttc: TLargeintField;
    TPanel1: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    BtnSelection: TButton;
    BtnGenerer: TButton;
    procedure JvDBGridLot_evaCellClick(Column: TColumn);
    procedure JvDBGridLot_evaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnSupprimerClick(Sender: TObject);
    procedure BtnSelectionClick(Sender: TObject);
    procedure BtnGenererClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses U_DataModule, U_DM_Olivier, U_OutilsGrille, U_FormAide, U_TableEntvteaa;


procedure TFrameFacturesReccurentes.BtnSupprimerClick(Sender: TObject);
var
  iNoLot: Integer;
  QryExec: TFDQuery;
begin
  // 1. Vérifie si le DataSet n'est pas vide
  if not FDQueryLot_eva.IsEmpty then
  begin
    // 2. Demande confirmation à l'utilisateur
    if MessageDlg('Voulez-vous vraiment supprimer ce lot et ses lignes associées ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // Récupération de l'ID du lot courant
      iNoLot := FDQueryLot_eva.FieldByName('NOLOT').AsInteger;

      QryExec := TFDQuery.Create(nil);
      try
         // On associe la connexion si nécessaire (selon ton contexte, ex: QryExec.Connection := FDConnection1;)
        // 1. Lier le query à la même connexion que les autres composants
        QryExec.Connection := FDQueryLot_eva.Connection;
        try
          // Optionnel : Démarrer une transaction pour garantir l'intégrité
          // FDConnection1.StartTransaction;

          // 3. Suppression des lignes de détail
          QryExec.SQL.Text := 'delete from lot_eva_det where nolot = :nolot';
          QryExec.ParamByName('nolot').AsInteger := iNoLot;
          QryExec.ExecSQL;

          // 4. Suppression de l'entête
          QryExec.SQL.Text := 'delete from lot_eva where nolot = :nolot';
          QryExec.ParamByName('nolot').AsInteger := iNoLot;
          QryExec.ExecSQL;

          // FDConnection1.Commit;

          // 5. Rafraîchissement des données à l'écran
          FDQueryLot_eva.Refresh;
          FDQueryLot_eva_det.Refresh;

        except
          on E: Exception do
          begin
            // FDConnection1.Rollback;
            ShowMessage('Erreur lors de la suppression : ' + E.Message);
          end;
        end;

      finally
        // S'exécutera dans tous les cas (succès ou erreur), évitant toute fuite mémoire
        QryExec.Free;
      end;
    end;
  end;
end;


procedure TFrameFacturesReccurentes.BtnGenererClick(Sender: TObject);
var
  QryExec: TFDQuery;
  QryExecLEVAD: TFDQuery;
  QryExec2: TFDQuery;
  QryExecEVA: TFDQuery;
  Qryligvteaa: TFDQuery;
  NumFacture: Integer;
  LHeure: TDateTime;
  H, M, S, MS: Word;
  Centiemes: Integer;
  ResultHeure: Integer;
  VNoEnrStock: Integer;

begin

  if FDQueryLot_eva.IsEmpty then Exit;

  if MessageDlg('Générer les factures du lot ' + IntToStr(FDQueryLot_eva.FieldByName('NOLOT').AsInteger),
   mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Conversion en nombre total de secondes depuis minuit
  LHeure := Now; // ou un champ heure
  DecodeTime(Now, H, M, S, MS);
  Centiemes := MS div 10; // Conversion des millisecondes en centièmes
  // Construction de l'entier : HH * 1000000 + MM * 10000 + SS * 100 + CC
  ResultHeure := (H * 360000) + (M * 6000) + (S * 100) + Centiemes;


  // Création d'une requête temporaire dédiée aux exécutables SQL
  QryExec := TFDQuery.Create(nil);
  QryExecLEVAD := TFDQuery.Create(nil);
  QryExec2 := TFDQuery.Create(nil);
  Qryligvteaa := TFDQuery.Create(nil);
  QryExecEVA := TFDQuery.Create(nil);

  try
    Screen.Cursor := crHourGlass; // Change le curseur en sablier

    QryExec.Connection := DMGesCloud.ConnexionGesCloud;
    QryExecLEVAD.Connection := DMGesCloud.ConnexionGesCloud;
    QryExec2.Connection := DMGesCloud.ConnexionGesCloud;
    Qryligvteaa.Connection := DMGesCloud.ConnexionGesCloud;
    QryExecEVA.Connection := DMGesCloud.ConnexionGesCloud;

    // Démarrage de la TRANSACTION MySQL
   DMGesCloud.ConnexionGesCloud.StartTransaction;
    try
      //LECTURE LOT_EVA_DET
      QryExecLEVAD.SQL.Text := 'SELECT * from lot_eva_det where NOLOT=:NOLOT';
      QryExecLEVAD.ParamByName('NOLOT').AsInteger := FDQueryLot_eva.FieldByName('NOLOT').AsInteger;
      QryExecLEVAD.Open;
      QryExecLEVAD.First;
      while not QryExecLEVAD.Eof do
      begin
        // ==========================================
        // ENREGISTREMENT DE L'EN-TÊTE
        // ==========================================
        // Incrementation numero de facture + 1 dans chrono
        QryExec.SQL.Text := 'UPDATE chrono set CHRONO=CHRONO+1 WHERE PREFIX=:PREFIX';
        QryExec.ParamByName('PREFIX').AsString := 'FAC01';
        QryExec.ExecSQL;
        QryExec.Close;

        //Recuperation nouveau numero chrono
        QryExec.SQL.Text := 'SELECT * FROM chrono WHERE PREFIX=:PREFIX';
        QryExec.ParamByName('PREFIX').AsString := 'FAC01';
        QryExec.Open;
        NumFacture := QryExec.FieldByName('CHRONO').AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

        //Lecture entvteaa
        QryExecEVA.SQL.Text := 'SELECT * FROM entvteaa WHERE CODFAC=:CODFAC';
        QryExecEVA.ParamByName('CODFAC').AsInteger := QryExecLEVAD.FieldByName('CODFAC').AsInteger;
        QryExecEVA.Open;

        // Appel de la procédure mutualisée
        QryExec2.close;
        DM_Olivier.ExecuterInsertionEntVteJJ(QryExecEVA, QryExec2,
          QryExecEVA.ParamByName('CODFAC').AsInteger, NumFacture, FDQueryLot_eva.FieldByName('NOLOT').AsInteger);

        QryExec.Close;

        // Parcours de la table mémoire des lignes
        Qryligvteaa.SQL.Text := 'SELECT * FROM ligvteaa WHERE CODFAC=:CODFAC';
        Qryligvteaa.ParamByName('CODFAC').AsInteger := QryExecLEVAD.FieldByName('CODFAC').AsInteger;
        Qryligvteaa.Open;
        Qryligvteaa.First;
        while not Qryligvteaa.Eof do
        begin
          //Génération du mouvement de stock associé a la ligne
          VNoEnrStock :=0;
          //Controle si article géré en stock
          QryExec.Close;
          QryExec.SQL.Text := 'SELECT * FROM article WHERE CODART=:CODART';
          QryExec.ParamByName('CODART').AsString :=Qryligvteaa.FieldByName('CODART').AsString;
          QryExec.Open;
          if QryExec.FieldByName('G_STO').AsInteger=1 then
          begin
             //Creation par securite du stodep
             QryExec2.Close;
             QryExec2.SQL.Text := 'INSERT IGNORE INTO stodep (CODART, CODDEP, QTE, PMP, CODFOU) ' +
                              'VALUES (:CODART, :CODDEP, 0, :PMP, :CODFOU)';
             QryExec2.ParamByName('CODART').AsString :=Qryligvteaa.FieldByName('CODART').AsString;
             QryExec2.ParamByName('CODDEP').AsInteger :=QryExecEVA.FieldByName('CODDEP').AsInteger;
             QryExec2.ParamByName('PMP').AsFloat :=QryExec.FieldByName('PMP').AsFloat;
             QryExec2.ParamByName('CODFOU').AsString :=QryExec.FieldByName('CODFOU').AsString;
             QryExec2.ExecSQL;

             //Insertion stock
             QryExec2.Close;
             //     ShowMessage(Qrylig_prof.FieldByName('CODART').AsString);
             QryExec2.SQL.Text := 'INSERT INTO stock (CODART, DATE_, ANNEE, MOIS, TYPE_, QTE, VALUNIT, PRIXVTE, CODDEP, CENTRA, LIBELLE, CODFOU, TIME, CODFAC) ' +
                              'VALUES (:CODART, :DATE_, :ANNEE, :MOIS, :TYPE_, :QTE, :VALUNIT, :PRIXVTE, :CODDEP, :CENTRA, :LIBELLE, :CODFOU, :TIME, :CODFAC)';
             QryExec2.ParamByName('CODFAC').AsInteger := NumFacture;
             QryExec2.ParamByName('CODART').AsString := Qryligvteaa.FieldByName('CODART').AsString;
             QryExec2.ParamByName('QTE').AsFloat := -Qryligvteaa.FieldByName('QTE').AsFloat;
             QryExec2.ParamByName('PRIXVTE').AsFloat := Qryligvteaa.FieldByName('PRIXNET').AsFloat;
             QryExec2.ParamByName('VALUNIT').AsFloat := Qryligvteaa.FieldByName('PRIXREV').AsFloat;
             QryExec2.ParamByName('CODFOU').AsString := Qryligvteaa.FieldByName('CODFOU').AsString;
             QryExec2.ParamByName('DATE_').AsDateTime := Now;
             QryExec2.ParamByName('ANNEE').AsInteger := Qryligvteaa.FieldByName('ANNEE').AsInteger;
             QryExec2.ParamByName('MOIS').AsInteger := Qryligvteaa.FieldByName('MOIS').AsInteger;
             QryExec2.ParamByName('CODDEP').AsInteger := QryExecEVA.FieldByName('CODDEP').AsInteger;
             QryExec2.ParamByName('CENTRA').AsString := 'C';
             QryExec2.ParamByName('LIBELLE').AsString := 'Facture DELPHI n°' + IntToStr(NumFacture);
             QryExec2.ParamByName('TYPE_').AsString := 'V';
             QryExec2.ParamByName('TIME').AsInteger := ResultHeure;
             QryExec2.ExecSQL;

             // 2. Récupération du NOENR tout juste généré par MySQL pour la table stock
             QryExec2.Close;
             QryExec2.SQL.Text := 'SELECT LAST_INSERT_ID()';
             QryExec2.Open;
             VNoEnrStock := QryExec2.Fields[0].AsInteger; // Pensez à déclarer VNoEnrStock en Integer dans vos variables

             //On recalcul le stock du depot et de l'article
             DM_Olivier.RecalculerStockStodep(Qryligvteaa.FieldByName('CODART').AsString, QryExecEVA.FieldByName('CODDEP').AsInteger);
          end;

          QryExec.Close;

          //Insertion ligvtejj par appel de la procédure mutualisée pour chaque ligne
          DM_Olivier.ExecuterInsertionLigVteJJ(Qryligvteaa, QryExec, QryExecEVA.ParamByName('CODFAC').AsInteger, NumFacture, VNoEnrStock);

          //Lecture ligne memoire suivante
          Qryligvteaa.Next;
        end;

        // Mise a jour CODFAC_DER_GEN lot_eva_det
        QryExecLEVAD.Edit;
        QryExecLEVAD.FieldByName('CODFAC_DER_GEN').AsInteger := NumFacture;
        QryExecLEVAD.Post;

        //Lecture lot_eva_det suivant
        QryExecLEVAD.Next;
      end;

      // Mise a jour CODFAC_DER_GEN lot_eva_det
      FDQueryLot_eva.Edit;
      FDQueryLot_eva.FieldByName('DAT_DER_GEN').AsDateTime := Date;
      FDQueryLot_eva.Post;

      // TRANSACTION: Si tout s'est déroulé sans erreur, on valide définitivement dans MySQL
      DMGesCloud.ConnexionGesCloud.Commit;

    except
      on E: Exception do
      begin
        // TRANSACTION: En cas d'erreur, on annule tout (ni l'en-tête ni les lignes ne sont modifiés)
        DMGesCloud.ConnexionGesCloud.Rollback;
        ShowMessage('Erreur lors de l''enregistrement : ' + E.Message);;
      end;
    end;
  finally
    QryExec.Free;
    QryExec2.Free;
    Qryligvteaa.Free;
    QryExecLEVAD.Free;
    QryExecEVA.Free;

    FDQueryLot_eva.Refresh;
    FDQueryLot_eva_det.Refresh;

    Screen.Cursor := crDefault; // Restaure le curseur normal
  end;
end;


procedure TFrameFacturesReccurentes.BtnSelectionClick(Sender: TObject);
var
  DlgForm: TForm;
  FiltreFrame: TFrameTableEntvteaa;
  BtnValider: TButton;
  iNoLot: Integer;
  QryInsert: TFDQuery;
  i: Integer;
  sNoFacture: string;
begin
  // 1. S'assurer qu'un lot est sélectionné dans le maître
  if FDQueryLot_eva.IsEmpty then
  begin
    ShowMessage('Veuillez d''abord sélectionner un lot.');
    Exit;
  end;

  iNoLot := FDQueryLot_eva.FieldByName('NOLOT').AsInteger;

  // 2. Création de la Form popup à la volée
  DlgForm := TForm.CreateNew(nil);
  try
    DlgForm.Caption := 'Sélection des factures à associer';
    DlgForm.Width := 950;
    DlgForm.Height := 600;
    DlgForm.Position := poScreenCenter;

    // 3. Création du bouton de validation en bas de la fenêtre popup
    BtnValider := TButton.Create(DlgForm);
    BtnValider.Parent := DlgForm;
    BtnValider.Caption := 'Valider la sélection';
    BtnValider.Align := alBottom;
    BtnValider.Height := 40;
    BtnValider.ModalResult := mrOk; // Clic sur ce bouton ferme la fenêtre avec le code mrOk

    // 4. Intégration de ton Frame dans la Form (au-dessus du bouton)
    FiltreFrame := TFrameTableEntvteaa.Create(DlgForm);
    FiltreFrame.Parent := DlgForm;
    FiltreFrame.Align := alClient;

    // 5. Affichage de la fenêtre en mode modal
    if DlgForm.ShowModal = mrOk then
    begin
      // 6. Vérifier si des lignes sont sélectionnées dans la grille du Frame
      if Assigned(FiltreFrame.JvDBGridEntvteaa.SelectedRows) and
         (FiltreFrame.JvDBGridEntvteaa.SelectedRows.Count > 0) then
      begin
        QryInsert := TFDQuery.Create(nil);
        try
          // Optionnel : FDConnection1.StartTransaction;
          //...
          // 1. Lier le query à la même connexion que les autres composants
          QryInsert.Connection := FDQueryLot_eva.Connection;

          // Parcourir toutes les lignes multi-sélectionnées (Ctrl + Clic)
          for i := 0 to FiltreFrame.JvDBGridEntvteaa.SelectedRows.Count - 1 do
          begin
            FiltreFrame.FDQueryEntvteaa.Bookmark := FiltreFrame.JvDBGridEntvteaa.SelectedRows[i];
            sNoFacture := FiltreFrame.FDQueryEntvteaa.FieldByName('CODFAC').AsString;

            if sNoFacture <> '' then
            begin
              QryInsert.SQL.Text := 'INSERT IGNORE INTO lot_eva_det (nolot, codfac) VALUES (:nolot, :codfac)';
              QryInsert.ParamByName('nolot').AsInteger := iNoLot;
              QryInsert.ParamByName('codfac').AsString := sNoFacture;
              QryInsert.ExecSQL;
            end;
          end;

          // FDConnection1.Commit;

          // 7. Rafraîchir la grille des détails pour afficher les ajouts instantanément
          FDQueryLot_eva_det.Refresh;

          ShowMessage(IntToStr(FiltreFrame.JvDBGridEntvteaa.SelectedRows.Count) + ' facture(s) ajoutée(s) au lot avec succès.');

        except
          on E: Exception do
          begin
            // FDConnection1.Rollback;
            ShowMessage('Erreur lors de l''insertion multiple : ' + E.Message);
          end;
        end;
        QryInsert.Free;
      end
      else
      begin
        ShowMessage('Aucune facture n''a été sélectionnée.');
      end;
    end;
  finally
    DlgForm.Free;
  end;
end;


constructor TFrameFacturesReccurentes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner); // <--- TRÈS IMPORTANT : appelle l'initialisation de Delphi
  // 1. Ouverture de la table principale TVA
  FDQueryLot_eva.Open;

  // 2. Ouverture de la table détail
  FDQueryLot_eva_det.Open;

  JvDBGridLot_eva_det.AlternateRowColor:=FDQueryLot_eva.FieldByName('NOCOULEUR').AsInteger;
end;

procedure TFrameFacturesReccurentes.JvDBGridLot_evaCellClick(Column: TColumn);
begin
  // Vérifie si la colonne active est bien NOCOULEUR
  if Assigned(JvDBGridLot_eva.SelectedField) and
     (CompareText(JvDBGridLot_eva.SelectedField.FieldName, 'NOCOULEUR') = 0) then
  begin
    // 1. Si le champ contient déjà une couleur, on l'injecte dans le dialogue
    if not FDQueryLot_eva.FieldByName('NOCOULEUR').IsNull then
      ColorDialog1.Color := FDQueryLot_eva.FieldByName('NOCOULEUR').AsInteger
    else
      ColorDialog1.Color := clWhite; // Couleur par défaut si c'est vide/NULL

    // 2. Ouvre la palette Windows (elle s'ouvrira directement sur la couleur existante)
    if ColorDialog1.Execute then
    begin
      FDQueryLot_eva.Edit;
      // 3. Enregistre la nouvelle couleur choisie dans MySQL
      FDQueryLot_eva.FieldByName('NOCOULEUR').AsInteger := ColorDialog1.Color;
      FDQueryLot_eva.Post;
    end;
  end;
  JvDBGridLot_eva_det.AlternateRowColor:=FDQueryLot_eva.FieldByName('NOCOULEUR').AsInteger;
end;


procedure TFrameFacturesReccurentes.JvDBGridLot_evaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Personnalisation de l'affichage de la colonne NOCOULEUR
  if (CompareText(Column.FieldName, 'NOCOULEUR') = 0) then
  begin
    if not Column.Field.IsNull then
    begin
      // Remplit le fond de la cellule avec la couleur stockée
      JvDBGridLot_eva.Canvas.Brush.Color := Column.Field.AsInteger;
      JvDBGridLot_eva.Canvas.FillRect(Rect);

      // Optionnel : Dessiner un cadre discret autour de la case couleur
      JvDBGridLot_eva.Canvas.Pen.Color := clSilver;
      JvDBGridLot_eva.Canvas.Rectangle(Rect);
    end;
  end
  else
    JvDBGridLot_eva.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
