unit U_FicheRegljj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvExMask, JvToolEdit, JvDBControls, JvBaseEdits, RzBHints,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvDBLookup, JvDBLookupComboEdit,
  JvExControls;

type
  TModeSaisieRegl = (msAjout, msModification); // Type nommé global à l'unité
  TFormRegljj = class(TForm)
    Panel1: TPanel;
    BtnValider: TBitBtn;
    BtnAnnuler: TBitBtn;
    DSRegljj: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery1CODFAC: TLargeintField;
    FDQuery1CODCAI: TStringField;
    FDQuery1CODVEN: TSmallintField;
    FDQuery1DATE_: TDateField;
    FDQuery1TOP_: TStringField;
    FDQuery1LIBELLE: TStringField;
    FDQuery1MONTANT: TLargeintField;
    FDQuery1DATE_ECH: TDateField;
    FDQuery1CODPAI: TStringField;
    FDQuery1TYPE_: TStringField;
    FDQuery1SELECT_: TSmallintField;
    FDQuery1DATE_OPER: TDateField;
    FDQuery1DATE_COMPTA: TDateField;
    FDQuery1NOENR: TFDAutoIncField;
    FDQuery1DER_MODIF: TSQLTimeStampField;
    FDQuery1MONT_ARR: TLargeintField;
    Label1: TLabel;
    Label2: TLabel;
    DBLibelle: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    JvDBDate_: TJvDBDateEdit;
    JvDBDate_Ech: TJvDBDateEdit;
    JvDBCalcEditMontant: TJvDBCalcEdit;
    BalloonHint1: TBalloonHint;
    DSPaiement: TDataSource;
    JvDBLookupComboPaiement: TJvDBLookupCombo;
    procedure BtnAnnulerClick(Sender: TObject);
    procedure BtnValiderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ControleReglement(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBLookupComboPaiementChange(Sender: TObject);
  private
    { Déclarations privées }
    WCodPai: String;
    WType: String;
    procedure ExecuterAnnulation;

  public
    { Déclarations publiques }
    ModeSaisieRegl: TModeSaisieRegl; // On utilise ce type ici
    constructor Create(AOwner: TComponent; ACodPai: String; AType: String); reintroduce;
  end;

var
  FormRegljj: TFormRegljj;

implementation

{$R *.dfm}

uses U_DM_Olivier, U_FicheEntvtejj, U_DataModule;


constructor TFormRegljj.Create(AOwner: TComponent; ACodPai: String; AType: String);
begin
  inherited Create(AOwner);
  WCodPai := ACodPai; // Stockage ou utilisation immédiate du paramètre
  WType := AType;
end;

procedure TFormRegljj.BtnValiderClick(Sender: TObject);
begin
  // Exemple de validation (à décommenter plus tard)
  // if DBQte.Field.AsFloat = 0 then
  // begin
  //   ShowMessage('Erreur quantité.');
  //   if DBQte.CanFocus then DBQte.SetFocus;
  //   Exit;
  // end;
  ControleReglement(Sender);

  try
    // On valide le dataset via son DataSource (plus indépendant)
    if DSRegljj.Dataset.State in [dsEdit, dsInsert] then
    begin
      //Controle si saisie invalide
//      if DSRegljj.dataset.FieldByName('CODPAI').AsString='' then
//      begin
//        ControleReglement(Sender);
//        if DSRegljj.dataset.FieldByName('CODPAI').AsString='' then
//         exit;
//      end;

      DSRegljj.Dataset.Post;
      Self.ModalResult := mrOk;
    end
    else
      Self.ModalResult := mrCancel;


    // Si le Post a réussi sans exception, on autorise la fermeture
    //Self.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      // Si une erreur survient (base, BeforePost, etc.),
      // on n'assigne PAS mrOk, la fiche reste donc ouverte.
      MessageDlg('Erreur sur la ligne :'#13#10 + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;


procedure TformRegljj.ExecuterAnnulation;
begin
      // Si des modifications étaient en cours, on les annule proprement
  if FormEntvtejj.FDMemTableRegljj.State in [dsEdit, dsInsert] then
    FormEntvtejj.FDMemTableRegljj.Cancel;

  ModalResult := mrCancel; // Ferme la fiche en renvoyant "Annulation"
end;


procedure TFormRegljj.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    ExecuterAnnulation;
    Key := 0; // Empêche le bip sonore de Windows lié à la touche Échap
  end;
end;


procedure TFormRegljj.FormShow(Sender: TObject);
begin
  if ModeSaisieRegl = msModification then
  begin
      if not (DSRegljj.DataSet.State in [dsEdit, dsInsert]) then
        DSRegljj.DataSet.Edit;
  end;
  DM_Olivier.FDQueryPaiement.Open;
  //ControleReglement(Sender);
end;


procedure TFormRegljj.JvDBLookupComboPaiementChange(Sender: TObject);
Var
  QryExec: TFDQuery;
begin
  // lECTURE Paiement pour Type_
  QryExec := TFDQuery.Create(nil);
  QryExec.Connection := DMGesCloud.ConnexionGesCloud;
  QryExec.Close;
  QryExec.SQL.Text := 'SELECT * FROM paiement WHERE CODPAI=:CODPAI';
  QryExec.ParamByName('CODPAI').AsString := DSRegljj.DataSet.FieldByName('CODPAI').AsString;
  QryExec.Open;
  DSRegljj.DataSet.FieldByName('TYPE_').AsString := QryExec.FieldByName('TYPE_').AsString;
  ControleReglement(Sender);
end;

procedure TformRegljj.BtnAnnulerClick(Sender: TObject);
begin
  ExecuterAnnulation;
end;


procedure TFormRegljj.ControleReglement(Sender: TObject);
var
  QryExec: TFDQuery;
  QryClient: TFDQuery;
  wTOTREG: Integer;
  wPlaf_crd: Integer;
  Values: array of string;
  MotDePasse: string;
begin
  // Si l'utilisateur clique sur le bouton Annuler, on ne bloque pas la sortie
  if Screen.ActiveControl = BtnAnnuler then
    Exit;

  // Initialisation à nil obligatoire pour sécuriser le bloc finally
  QryClient := nil;
  QryExec := nil;

  try
    // Si client "Comptant"
    if (WType = 'C') and (DSRegljj.DataSet.FieldByName('TYPE_').AsString = 'D') then
    begin
      BalloonHint1.Description := '⚠ Crédit interdit';
      BalloonHint1.ShowHint(JvDBLookupComboPaiement);
      JvDBLookupComboPaiement.SetFocus;
      Exit;
    end;

    // Si CREDIT selectionné
    if DSRegljj.DataSet.FieldByName('TYPE_').AsString = 'D' then
    begin
      // LECTURE CLIENT
      QryClient := TFDQuery.Create(nil);
      QryClient.Connection := DMGesCloud.ConnexionGesCloud;
      QryClient.SQL.Text := 'SELECT * FROM client WHERE CODCLI=:CODCLI';
      QryClient.ParamByName('CODCLI').AsInteger := FormEntvtejj.FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger;
      QryClient.Open;

      // Si client plafonné alors calcul du solde
      if QryClient.FieldByName('PLAF_CRD').AsInteger <> 0 then
      begin
        wPlaf_crd := QryClient.FieldByName('PLAF_CRD').AsInteger;

        QryExec := TFDQuery.Create(nil);
        QryExec.Connection := DMGesCloud.ConnexionGesCloud;
        QryExec.SQL.Text := 'SELECT sum(COALESCE(debit, 0) - COALESCE(credit, 0)) as SoldeClient ' +
                            'FROM tresor WHERE CODCLI=:CODCLI and SOLDE<>1';
        QryExec.ParamByName('CODCLI').AsInteger := FormEntvtejj.FDMemTableEntvtejj.FieldByName('CODCLI').AsInteger;
        QryExec.Open;

        if wPlaf_crd - (QryExec.FieldByName('SoldeClient').AsInteger + JvDBCalcEditMontant.Value) < 0 then
        begin
          BalloonHint1.Description := '⚠ Plafond crédit depassé';
          BalloonHint1.ShowHint(JvDBLookupComboPaiement);
          SetLength(Values, 1);
          Values[0] := '';
          // Le '#1' au début du libellé active le masquage de type mot de passe
          if InputQuery('Contrôle Crédit client', [#1'Mot de passe :'], Values) then
            begin
              MotDePasse := Values[0];
              // Traitement...
              if MotDePasse<>DM_Olivier.gPass_modif_fac then
              begin
                ShowMessage('Erreur mot de passe, Plafond crédit depassé.');
                JvDBLookupComboPaiement.SetFocus;
                exit
              end
              else
              begin
                //Mot de passe correct on accepte la remise
              end;
          end
          else
          begin
            // L'utilisateur a cliqué sur ANNULER
            JvDBLookupComboPaiement.SetFocus;
            exit;
          end;
          //JvDBLookupComboPaiement.SetFocus;
          //Exit;
        end;

        DSRegljj.DataSet.FieldByName('DATE_ECH').AsDateTime := Now;
      end
      else
      begin
        DSRegljj.DataSet.FieldByName('DATE_ECH').AsDateTime := DM_Olivier.CalculDateEcheance(
          DSRegljj.DataSet.FieldByName('DATE_').AsDateTime,
          QryClient.FieldByName('JRSCRD').AsInteger,
          QryClient.FieldByName('FIN_MOIS').AsInteger
        );
      end;
    end;

    DSRegljj.DataSet.FieldByName('LIBELLE').AsString := DM_Olivier.FDQueryPaiement.FieldByName('LIBELLE').AsString;

  finally
    // Le bloc finally s'exécute TOUJOURS (même en cas d'Exit ou d'erreur)
    QryExec.Free;   // Sans danger si QryExec est nil
    QryClient.Free; // Sans danger si QryClient est nil
  end;
end;
end.
