unit U_DM_ExportEcrituresClients;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Variants, Vcl.Dialogs, System.IniFiles, System.Math,
  System.DateUtils, Vcl.Forms, Vcl.Controls;

type
  TDM_ExportEcrituresClients = class(TDataModule)
    FDQueryImp_cpta: TFDQuery;
    FDQueryEcr_cpt: TFDQuery;

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    function Export_Ecrit_Compta_Clients(
      pDate1, pDate2: TDateTime;
      pModele, pNature, pEtendu: Integer
    ): Boolean;
    function Tresorerie(pDate1, pDate2: TDateTime; pModele, pNature, pEtendu: Integer): string;
  end;

var
  DM_ExportEcrituresClients: TDM_ExportEcrituresClients;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses U_DataModule, U_DM_Olivier;



function PadRight(const AText: string; ALen: Integer; AChar: Char = ' '): string;
begin
  if Length(AText) >= ALen then
    Result := Copy(AText, 1, ALen)
  else
    Result := AText + StringOfChar(AChar, ALen - Length(AText));
end;


function TDM_ExportEcrituresClients.Export_Ecrit_Compta_Clients(
  pDate1, pDate2: TDateTime;
  pModele, pNature, pEtendu: Integer
): Boolean;
var
  ALT: Boolean;
  MONT, NETTTC, NETHT, TOTTTC, DEPNET: Currency;
  DATECPTS, DATECPT, DATEECH: string;
  DATECPT4, DATEECH4, DATEJ: string;
  SENS, TYPJAL, WPAIE: string;
  JJ, MM, AA, AAAA: string;
  lcptcli: string;
  WDATE: TDateTime;
  nbmvt, PIEVTE, PIEREG, VT_TVA: Integer;
  sLigneAEcrire, sContenuFichier: string;
  Qry, QryEntVte, QryLigVte, QryParame, QryClient, QryArticle, QryFamille,
  QryCompta, QryRepres, QryRegLaa, QryTresor, QryPaiement: TFDQuery;
  PathExport: string;
  sContenuTresorerie: string;
  SDateStr, SEchStr: string;

begin
  Result := False;
  ALT := False;

  // 1. Vérification de la centralisation des ventes (ctrstock)[cite: 6]
  if Assigned(DM_Olivier.FDQueryCtrstock) then
  begin
    DM_Olivier.FDQueryCtrstock.Open;
    if DM_Olivier.FDQueryCtrstock.FieldByName('flag_clo').AsInteger = 1 then
    begin
      ALT := True;
      ShowMessage('Centralisation des ventes en cours !');
    end;
    DM_Olivier.FDQueryCtrstock.Close;
  end;

  if not ALT then
  begin
    if MessageDlg('Confirmation du transfert ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      ALT := True;
  end;

  if ALT then
  begin
    ShowMessage('Procédure annulée !');
    Exit;
  end;

  Screen.Cursor := crHourGlass;

  // Démarrage de la transaction FireDAC pour sécuriser l'ensemble des écritures
  DMGesCloud.ConnexionGesCloud.StartTransaction;
  try
    // 2. Initialisation du Qry principal pour le nettoyage des tables de travail[cite: 6]
    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := DMGesCloud.ConnexionGesCloud;

      Qry.ExecSQL('DELETE FROM imp_cpta');
      Qry.ExecSQL('DELETE FROM ecr_cpt');

      if pNature <> 2 then // Mouvements de facturation inclus[cite: 6]
      begin
        PIEVTE := 99999;
        PIEREG := 0;
        WDATE := pDate1;

        // Création et association des requêtes secondaires[cite: 6]
        QryEntVte   := TFDQuery.Create(nil);
        QryLigVte   := TFDQuery.Create(nil);
        QryParame   := TFDQuery.Create(nil);
        QryClient   := TFDQuery.Create(nil);
        QryRepres   := TFDQuery.Create(nil);
        QryRegLaa     := TFDQuery.Create(nil);
        QryPaiement := TFDQuery.Create(nil);
        QryArticle  := TFDQuery.Create(nil);
        QryFamille  := TFDQuery.Create(nil);
        QryCompta   := TFDQuery.Create(nil);
        QryTresor   := TFDQuery.Create(nil);

        try
          QryEntVte.Connection   := DMGesCloud.ConnexionGesCloud;
          QryLigVte.Connection   := DMGesCloud.ConnexionGesCloud;
          QryParame.Connection   := DMGesCloud.ConnexionGesCloud;
          QryClient.Connection   := DMGesCloud.ConnexionGesCloud;
          QryRepres.Connection   := DMGesCloud.ConnexionGesCloud;
          QryRegLaa.Connection   := DMGesCloud.ConnexionGesCloud;
          QryPaiement.Connection := DMGesCloud.ConnexionGesCloud;
          QryArticle.Connection  := DMGesCloud.ConnexionGesCloud;
          QryFamille.Connection  := DMGesCloud.ConnexionGesCloud;
          QryCompta.Connection   := DMGesCloud.ConnexionGesCloud;
          QryTresor.Connection   := DMGesCloud.ConnexionGesCloud;

          // 3. Boucle principale sur la plage de dates (Factures ENTVTEAA)[cite: 6]
          while WDATE <= pDate2 do
          begin
            nbmvt := 0;
            Dec(PIEVTE);
            Inc(PIEREG);

            // RAZ des zones de cumuls COMPTA & PARAME via Qry principal[cite: 6]
            Qry.ExecSQL('DELETE FROM compta');
            Qry.ExecSQL('UPDATE parame SET montant = 0 WHERE type_ IN ("V", "X")');
            Qry.ExecSQL('UPDATE parame SET montant = 0 WHERE code = "TS"');

            DateTimeToString(DATEJ, 'yyyymmdd', WDATE);
            TOTTTC := 0;

            // Recherche des factures de la journée courante[cite: 6]
            QryEntVte.SQL.Text := 'SELECT * FROM entvteaa WHERE date_ = :wdate ORDER BY date_ ASC, codfac ASC';
            QryEntVte.ParamByName('wdate').AsDate := WDATE;
            QryEntVte.Open;

            while not QryEntVte.Eof do
            begin
              if (pEtendu = 1) and (QryEntVte.FieldByName('date_compta').AsString <> '') then
              begin
                QryEntVte.Next;
                Continue;
              end;

              Inc(nbmvt);
              NETHT := QryEntVte.FieldByName('totht').AsCurrency;
              NETTTC := QryEntVte.FieldByName('mt_ttc').AsCurrency;
              TOTTTC := TOTTTC + NETTTC;

              // Récupération Client[cite: 6]
              QryClient.SQL.Text := 'SELECT * FROM client WHERE codcli = :codcli';
              QryClient.ParamByName('codcli').AsString := QryEntVte.FieldByName('codcli').AsString;
              QryClient.Open;
              lcptcli := QryClient.FieldByName('cptaux').AsString;

              // Récupération Représentant[cite: 6]
              QryRepres.SQL.Text := 'SELECT * FROM repres WHERE codrep = :codrep';
              QryRepres.ParamByName('codrep').AsString := QryEntVte.FieldByName('codrep').AsString;
              QryRepres.Open;
              if QryRepres.IsEmpty then
              begin
                QryRepres.Close;
                QryRepres.ParamByName('codrep').AsString := QryClient.FieldByName('codrep').AsString;
                QryRepres.Open;
              end;
              QryClient.Close;

              // Mise en forme des formats de dates[cite: 6]
              JJ := Copy(FormatDateTime('yyyymmdd', WDATE), 7, 2);
              MM := Copy(FormatDateTime('yyyymmdd', WDATE), 5, 2);
              AA := Copy(FormatDateTime('yyyymmdd', WDATE), 3, 2);
              AAAA := Copy(FormatDateTime('yyyymmdd', WDATE), 1, 4);
              DATECPT := JJ + MM + AA;
              DATECPT4 := JJ + MM + AAAA;
              DATECPTS := AAAA + MM + JJ;
              DATEECH := Copy(QryEntVte.FieldByName('date_ech').AsString, 1, 4) + MM + JJ;
              WPAIE := 'S';

              // ------------------------------------------------------------------
              // 1. Écriture cpta VENTE client TTC ou Cumul des ventes[cite: 6]
              // ------------------------------------------------------------------
              if True then
              begin
                if NETTTC > 0 then
                begin
                  MONT := Round(NETTTC);
                  SENS := 'D';
                  TYPJAL := 'FC';

                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('jal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
                  FDQueryImp_cpta.FieldByName('libelle').AsString := 'Fact.:' + FormatFloat('000000009', QryEntVte.FieldByName('codfac').AsInteger);
                  FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                  FDQueryImp_cpta.Post;

                  FDQueryEcr_cpt.Insert;
                  FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                  FDQueryEcr_cpt.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                  FDQueryEcr_cpt.FieldByName('reference').AsString := FormatDateTime('yyyymmdd', WDATE);
                  FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
                  FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
                  FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Facture: ' + FormatFloat('000000009', QryEntVte.FieldByName('codfac').AsInteger);
                  FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                  FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                  FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                  FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                  FDQueryEcr_cpt.Post;
                end;

                if NETTTC < 0 then
                begin
                  MONT := Round(-NETTTC);
                  SENS := 'C';
                  TYPJAL := 'AC';

                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('jal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
                  FDQueryImp_cpta.FieldByName('libelle').AsString := 'Avoir : ' + FormatFloat('0000007', QryEntVte.FieldByName('codfac').AsInteger);
                  FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                  FDQueryImp_cpta.Post;

                  FDQueryEcr_cpt.Insert;
                  FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                  FDQueryEcr_cpt.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                  FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                  FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
                  FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
                  FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Avoir: ' + FormatFloat('0000007', QryEntVte.FieldByName('codfac').AsInteger);
                  FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                  FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                  FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                  FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                  FDQueryEcr_cpt.Post;
                end;
              end
              else
              begin
                FDQueryImp_cpta.Close;
                FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                FDQueryImp_cpta.ParamByName('vtype').AsString := 'VC';
                FDQueryImp_cpta.ParamByName('nocpt').AsString := QryClient.FieldByName('codcli').AsString;
                FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                FDQueryImp_cpta.Open;

                if FDQueryImp_cpta.IsEmpty then
                begin
                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('type_').AsString := 'VC';
                  FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := QryClient.FieldByName('codcli').AsString;
                  FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.Post;
                  FDQueryImp_cpta.Refresh;
                end;

                FDQueryImp_cpta.Edit;
                FDQueryImp_cpta.FieldByName('debit').AsFloat := FDQueryImp_cpta.FieldByName('debit').AsFloat + Round(NETTTC);
                FDQueryImp_cpta.Post;
              end;

              // ------------------------------------------------------------------
              // 2. CUMUL CPTA TVA ET CPS[cite: 6]
              // ------------------------------------------------------------------
              VT_TVA := 0;

              // --- TVA0 ---
              if QryEntVte.FieldByName('mt_ht0').AsFloat <> 0 then
              begin
                QryParame.Close;
                QryParame.SQL.Text := 'SELECT * FROM parame WHERE code = :code';
                QryParame.ParamByName('code').AsString := 'TVA0';
                QryParame.Open;

                if not QryParame.IsEmpty and (QryParame.FieldByName('cptdec').AsString <> '') then
                begin
                  VT_TVA := 1;

                  FDQueryImp_cpta.Close;
                  FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                  FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                  FDQueryImp_cpta.ParamByName('vtype').AsString := 'VV';
                  FDQueryImp_cpta.ParamByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                  FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.Open;

                  if FDQueryImp_cpta.IsEmpty then
                  begin
                    FDQueryImp_cpta.Insert;
                    FDQueryImp_cpta.FieldByName('type_').AsString := 'VV';
                    FDQueryImp_cpta.FieldByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                    FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                    FDQueryImp_cpta.Post;
                    FDQueryImp_cpta.Refresh;
                  end;

                  FDQueryImp_cpta.Edit;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + Round(QryEntVte.FieldByName('mt_ht0').AsFloat);
                  FDQueryImp_cpta.Post;
                end;
              end;

              // --- TVA1 ---
              if QryEntVte.FieldByName('mt_tva1').AsFloat <> 0 then
              begin
                QryParame.Close;
                QryParame.SQL.Text := 'SELECT * FROM parame WHERE code = :code';
                QryParame.ParamByName('code').AsString := 'TVA1';
                QryParame.Open;

                if not QryParame.IsEmpty then
                begin
                  QryParame.Edit;
                  QryParame.FieldByName('montant').AsFloat := QryParame.FieldByName('montant').AsFloat + Round(QryEntVte.FieldByName('mt_tva1').AsFloat);

                  if QryParame.FieldByName('cptdec').AsString <> '' then
                  begin
                    VT_TVA := 1;

                    FDQueryImp_cpta.Close;
                    FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                    FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                    FDQueryImp_cpta.ParamByName('vtype').AsString := 'VV';
                    FDQueryImp_cpta.ParamByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                    FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.Open;

                    if FDQueryImp_cpta.IsEmpty then
                    begin
                      FDQueryImp_cpta.Insert;
                      FDQueryImp_cpta.FieldByName('type_').AsString := 'VV';
                      FDQueryImp_cpta.FieldByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                      FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                      FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                      FDQueryImp_cpta.Post;
                      FDQueryImp_cpta.Refresh;
                    end;

                    FDQueryImp_cpta.Edit;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + Round(QryEntVte.FieldByName('mt_ht1').AsFloat);
                    FDQueryImp_cpta.Post;
                  end;
                  QryParame.Post;
                end;
              end;

              // --- TVA2 ---
              if QryEntVte.FieldByName('mt_tva2').AsFloat <> 0 then
              begin
                QryParame.Close;
                QryParame.SQL.Text := 'SELECT * FROM parame WHERE code = :code';
                QryParame.ParamByName('code').AsString := 'TVA2';
                QryParame.Open;

                if not QryParame.IsEmpty then
                begin
                  QryParame.Edit;
                  QryParame.FieldByName('montant').AsFloat := QryParame.FieldByName('montant').AsFloat + Round(QryEntVte.FieldByName('mt_tva2').AsFloat);

                  if QryParame.FieldByName('cptdec').AsString <> '' then
                  begin
                    VT_TVA := 1;

                    FDQueryImp_cpta.Close;
                    FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                    FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                    FDQueryImp_cpta.ParamByName('vtype').AsString := 'VV';
                    FDQueryImp_cpta.ParamByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                    FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.Open;

                    if FDQueryImp_cpta.IsEmpty then
                    begin
                      FDQueryImp_cpta.Insert;
                      FDQueryImp_cpta.FieldByName('type_').AsString := 'VV';
                      FDQueryImp_cpta.FieldByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                      FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                      FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                      FDQueryImp_cpta.Post;
                      FDQueryImp_cpta.Refresh;
                    end;

                    FDQueryImp_cpta.Edit;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + Round(QryEntVte.FieldByName('mt_ht2').AsFloat);
                    FDQueryImp_cpta.Post;
                  end;
                  QryParame.Post;
                end;
              end;

              // --- TVA3 ---
              if QryEntVte.FieldByName('mt_tva3').AsFloat <> 0 then
              begin
                QryParame.Close;
                QryParame.SQL.Text := 'SELECT * FROM parame WHERE code = :code';
                QryParame.ParamByName('code').AsString := 'TVA3';
                QryParame.Open;

                if not QryParame.IsEmpty then
                begin
                  QryParame.Edit;
                  QryParame.FieldByName('montant').AsFloat := QryParame.FieldByName('montant').AsFloat + Round(QryEntVte.FieldByName('mt_tva3').AsFloat);

                  if QryParame.FieldByName('cptdec').AsString <> '' then
                  begin
                    VT_TVA := 1;

                    FDQueryImp_cpta.Close;
                    FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                    FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                    FDQueryImp_cpta.ParamByName('vtype').AsString := 'VV';
                    FDQueryImp_cpta.ParamByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                    FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.Open;

                    if FDQueryImp_cpta.IsEmpty then
                    begin
                      FDQueryImp_cpta.Insert;
                      FDQueryImp_cpta.FieldByName('type_').AsString := 'VV';
                      FDQueryImp_cpta.FieldByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                      FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                      FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                      FDQueryImp_cpta.Post;
                      FDQueryImp_cpta.Refresh;
                    end;

                    FDQueryImp_cpta.Edit;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + Round(QryEntVte.FieldByName('mt_ht3').AsFloat);
                    FDQueryImp_cpta.Post;
                  end;
                  QryParame.Post;
                end;
              end;

              // --- TVAI ---
              if QryEntVte.FieldByName('mt_tvai').AsFloat <> 0 then
              begin
                QryParame.Close;
                QryParame.SQL.Text := 'SELECT * FROM parame WHERE code = :code';
                QryParame.ParamByName('code').AsString := 'TVAI';
                QryParame.Open;

                if not QryParame.IsEmpty then
                begin
                  QryParame.Edit;
                  QryParame.FieldByName('montant').AsFloat := QryParame.FieldByName('montant').AsFloat + Round(QryEntVte.FieldByName('mt_tvai').AsFloat);

                  if QryParame.FieldByName('cptdec').AsString <> '' then
                  begin
                    VT_TVA := 1;

                    FDQueryImp_cpta.Close;
                    FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                    FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                    FDQueryImp_cpta.ParamByName('vtype').AsString := 'VV';
                    FDQueryImp_cpta.ParamByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                    FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.Open;

                    if FDQueryImp_cpta.IsEmpty then
                    begin
                      FDQueryImp_cpta.Insert;
                      FDQueryImp_cpta.FieldByName('type_').AsString := 'VV';
                      FDQueryImp_cpta.FieldByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                      FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                      FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                      FDQueryImp_cpta.Post;
                      FDQueryImp_cpta.Refresh;
                    end;

                    FDQueryImp_cpta.Edit;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + Round(QryEntVte.FieldByName('mt_hti').AsFloat);
                    FDQueryImp_cpta.Post;
                  end;
                  QryParame.Post;
                end;
              end;

              // --- CONTRIBUTION SOCIALE (TS) ---
              if QryEntVte.FieldByName('mt_tsoc').AsFloat <> 0 then
              begin
                QryParame.Close;
                QryParame.SQL.Text := 'SELECT * FROM parame WHERE code = :code';
                QryParame.ParamByName('code').AsString := 'TS';
                QryParame.Open;

                if not QryParame.IsEmpty then
                begin
                  QryParame.Edit;
                  QryParame.FieldByName('montant').AsFloat := QryParame.FieldByName('montant').AsFloat + Round(QryEntVte.FieldByName('mt_tsoc').AsFloat);

                  if QryParame.FieldByName('cptdec').AsString <> '' then
                  begin
                    VT_TVA := 1;

                    FDQueryImp_cpta.Close;
                    FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                    FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                    FDQueryImp_cpta.ParamByName('vtype').AsString := 'VV';
                    FDQueryImp_cpta.ParamByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                    FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.Open;

                    if FDQueryImp_cpta.IsEmpty then
                    begin
                      FDQueryImp_cpta.Insert;
                      FDQueryImp_cpta.FieldByName('type_').AsString := 'VV';
                      FDQueryImp_cpta.FieldByName('nocpt').AsString := QryParame.FieldByName('cptdec').AsString;
                      FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                      FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                      FDQueryImp_cpta.Post;
                      FDQueryImp_cpta.Refresh;
                    end;

                    FDQueryImp_cpta.Edit;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + Round(QryEntVte.FieldByName('mt_htsoc').AsFloat);
                    FDQueryImp_cpta.Post;
                  end;
                  QryParame.Post;
                end;
              end;

              // ------------------------------------------------------------------
              // 3. Traitement des lignes de vente (par famille)[cite: 6]
              // ------------------------------------------------------------------
              QryLigVte.Close;
              QryLigVte.SQL.Text := 'SELECT * FROM ligvteaa WHERE codfac = :codfac';
              QryLigVte.ParamByName('codfac').AsInteger := QryEntVte.FieldByName('codfac').AsInteger;
              QryLigVte.Open;

              while not QryLigVte.Eof do
              begin
                if VT_TVA = 0 then
                begin
                  NETTTC := QryLigVte.FieldByName('totht').AsFloat + QryLigVte.FieldByName('mt_tva').AsFloat + QryLigVte.FieldByName('mt_tsoc').AsFloat;
                  NETTTC := NETTTC - Round((NETTTC * QryEntVte.FieldByName('prc_remise').AsFloat) / 100);
                  NETHT := Round(QryLigVte.FieldByName('totht').AsFloat);

                  QryArticle.Close;
                  QryArticle.SQL.Text := 'SELECT * FROM article WHERE codart = :codart';
                  QryArticle.ParamByName('codart').AsString := QryLigVte.FieldByName('codart').AsString;
                  QryArticle.Open;

                  QryFamille.Close;
                  QryFamille.SQL.Text := 'SELECT * FROM famille WHERE codfam = :codfam';
                  QryFamille.ParamByName('codfam').AsString := QryLigVte.FieldByName('codfam').AsString;
                  QryFamille.Open;

                  FDQueryImp_cpta.Close;
                  FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                  FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                  FDQueryImp_cpta.ParamByName('vtype').AsString := 'VV';
                  FDQueryImp_cpta.ParamByName('nocpt').AsString := QryFamille.FieldByName('cptvte').AsString;
                  FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.Open;

                  if FDQueryImp_cpta.IsEmpty then
                  begin
                    FDQueryImp_cpta.Insert;
                    FDQueryImp_cpta.FieldByName('type_').AsString := 'VV';
                    FDQueryImp_cpta.FieldByName('nocpt').AsString := QryFamille.FieldByName('cptvte').AsString;
                    FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                    FDQueryImp_cpta.Post;
                    FDQueryImp_cpta.Refresh;
                  end;

                  FDQueryImp_cpta.Edit;
                  if QryFamille.FieldByName('cptrem').AsString = '' then
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + NETHT
                  else
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := FDQueryImp_cpta.FieldByName('credit').AsFloat + NETHT + QryLigVte.FieldByName('mt_remise').AsFloat;
                  FDQueryImp_cpta.Post;

                  if (QryLigVte.FieldByName('mt_remise').AsFloat <> 0) and (QryFamille.FieldByName('cptrem').AsString <> '') then
                  begin
                    FDQueryImp_cpta.Close;
                    FDQueryImp_cpta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                    FDQueryImp_cpta.ParamByName('wdate').AsDate := WDATE;
                    FDQueryImp_cpta.ParamByName('vtype').AsString := 'VR';
                    FDQueryImp_cpta.ParamByName('nocpt').AsString := QryFamille.FieldByName('cptrem').AsString;
                    FDQueryImp_cpta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    FDQueryImp_cpta.Open;

                    if FDQueryImp_cpta.IsEmpty then
                    begin
                      FDQueryImp_cpta.Insert;
                      FDQueryImp_cpta.FieldByName('type_').AsString := 'VR';
                      FDQueryImp_cpta.FieldByName('nocpt').AsString := QryFamille.FieldByName('cptrem').AsString;
                      FDQueryImp_cpta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                      FDQueryImp_cpta.FieldByName('date_').AsDateTime := WDATE;
                      FDQueryImp_cpta.Post;
                      FDQueryImp_cpta.Refresh;
                    end;

                    FDQueryImp_cpta.Edit;
                    FDQueryImp_cpta.FieldByName('debit').AsFloat := FDQueryImp_cpta.FieldByName('debit').AsFloat + QryLigVte.FieldByName('mt_remise').AsFloat;
                    FDQueryImp_cpta.Post;
                  end;
                end;

                QryLigVte.Edit;
                QryLigVte.FieldByName('date_compta').AsDateTime := Date;
                QryLigVte.Post;

                QryLigVte.Next;
              end;
              QryLigVte.Close;

              // ------------------------------------------------------------------
              // 4. Écritures de règlement comptant (REGLAA)[cite: 6]
              // ------------------------------------------------------------------
              TYPJAL := 'RC';
              WPAIE := 'S';

              QryRegLaa.Close;
              QryRegLaa.SQL.Text := 'SELECT * FROM reglaa WHERE type_ = :vtype AND codfac = :codfac';
              QryRegLaa.ParamByName('vtype').AsString := 'C';
              QryRegLaa.ParamByName('codfac').AsInteger := QryEntVte.FieldByName('codfac').AsInteger;
              QryRegLaa.Open;

              while not QryRegLaa.Eof do
              begin
                QryPaiement.Close;
                QryPaiement.SQL.Text := 'SELECT * FROM paiement WHERE codpai = :codpai';
                QryPaiement.ParamByName('codpai').AsString := QryRegLaa.FieldByName('codpai').AsString;
                QryPaiement.Open;

                WPAIE := 'O';

                if QryRegLaa.FieldByName('montant').AsFloat > 0 then
                begin
                  MONT := QryRegLaa.FieldByName('montant').AsFloat;
                  SENS := 'D';

                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('jal').AsString := QryPaiement.FieldByName('codjal').AsString;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := QryPaiement.FieldByName('nocpt').AsString;
                  FDQueryImp_cpta.FieldByName('libelle').AsString := Copy(QryRegLaa.FieldByName('libelle').AsString, 1, 25);
                  FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                  FDQueryImp_cpta.Post;
                end
                else
                begin
                  MONT := -QryRegLaa.FieldByName('montant').AsFloat;
                  SENS := 'C';

                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('jal').AsString := QryPaiement.FieldByName('codjal').AsString;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := QryPaiement.FieldByName('nocpt').AsString;
                  FDQueryImp_cpta.FieldByName('libelle').AsString := Copy(QryRegLaa.FieldByName('libelle').AsString, 1, 25);
                  FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                  FDQueryImp_cpta.Post;
                end;

                TYPJAL := 'RC';
                WPAIE := 'O';

                FDQueryEcr_cpt.Insert;
                FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                FDQueryEcr_cpt.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
                FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryPaiement.FieldByName('nocpt').AsString;
                FDQueryEcr_cpt.FieldByName('noaux').AsString := '';
                FDQueryEcr_cpt.FieldByName('libelle').AsString := QryRegLaa.FieldByName('libelle').AsString;
                FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                FDQueryEcr_cpt.Post;

                if True then
                begin
                  if QryRegLaa.FieldByName('montant').AsFloat > 0 then
                  begin
                    MONT := QryRegLaa.FieldByName('montant').AsFloat;
                    SENS := 'C';

                    FDQueryImp_cpta.Insert;
                    FDQueryImp_cpta.FieldByName('jal').AsString := QryPaiement.FieldByName('codjal').AsString;
                    FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
                    FDQueryImp_cpta.FieldByName('libelle').AsString := Copy(QryRegLaa.FieldByName('libelle').AsString, 1, 25);
                    FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                    FDQueryImp_cpta.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                    FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                    FDQueryImp_cpta.Post;

                    FDQueryEcr_cpt.Insert;
                    FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                    FDQueryEcr_cpt.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
                    FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                    FDQueryEcr_cpt.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                    FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                    FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
                    FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
                    FDQueryEcr_cpt.FieldByName('libelle').AsString := 'REGL FACTURE ' + FormatFloat('000000009', QryEntVte.FieldByName('codfac').AsInteger);
                    FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                    FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                    FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                    FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                    FDQueryEcr_cpt.Post;
                  end;

                  if QryRegLaa.FieldByName('montant').AsFloat < 0 then
                  begin
                    MONT := -QryRegLaa.FieldByName('montant').AsFloat;
                    SENS := 'D';

                    FDQueryImp_cpta.Insert;
                    FDQueryImp_cpta.FieldByName('jal').AsString := QryPaiement.FieldByName('codjal').AsString;
                    FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
                    FDQueryImp_cpta.FieldByName('libelle').AsString := Copy(QryRegLaa.FieldByName('libelle').AsString, 1, 25);
                    FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                    FDQueryImp_cpta.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                    FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                    FDQueryImp_cpta.Post;

                    FDQueryEcr_cpt.Insert;
                    FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                    FDQueryEcr_cpt.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
                    FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                    FDQueryEcr_cpt.FieldByName('date_ech').AsString := QryEntVte.FieldByName('date_ech').AsString;
                    FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                    FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
                    FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
                    FDQueryEcr_cpt.FieldByName('libelle').AsString := 'REGL AVOIR ' + FormatFloat('000000009', QryEntVte.FieldByName('codfac').AsInteger);
                    FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                    FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                    FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                    FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                    FDQueryEcr_cpt.Post;
                  end;
                end;

                QryRegLaa.Edit;
                QryRegLaa.FieldByName('date_compta').AsDateTime := Date;
                QryRegLaa.Post;

                QryRegLaa.Next;
              end;
              QryRegLaa.Close;
              QryRepres.Close;

              QryEntVte.Edit;
              QryEntVte.FieldByName('date_compta').AsDateTime := Now;
              QryEntVte.Post;

              QryEntVte.Next;
            end;
            QryEntVte.Close;

            // ------------------------------------------------------------------
            // 5. Génération des écritures de ventes cumulées, TVA, remises[cite: 6]
            // ------------------------------------------------------------------
            if NBMVT > 0 then
            begin
              // A. VENTE CLIENT (Cumulées)
              QryCompta.Close;
              QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
              QryCompta.ParamByName('vtype').AsString := 'VC';
              QryCompta.Open;

              while not QryCompta.Eof do
              begin
                if QryCompta.FieldByName('debit').AsFloat = 0 then
                begin
                  QryCompta.Next;
                  Continue;
                end;

                NETTTC := QryCompta.FieldByName('debit').AsFloat;

                QryClient.Close;
                QryClient.SQL.Text := 'SELECT * FROM client WHERE codcli = :codcli';
                QryClient.ParamByName('codcli').AsString := QryCompta.FieldByName('nocpt').AsString;
                QryClient.Open;

                LcptCli := QryClient.FieldByName('cptaux').AsString;

                QryRepres.Close;
                QryRepres.SQL.Text := 'SELECT * FROM repres WHERE codrep = :codrep';
                QryRepres.ParamByName('codrep').AsString := QryClient.FieldByName('codrep').AsString;
                QryRepres.Open;

                if NETTTC > 0 then
                begin
                  MONT := Round(NETTTC);
                  SENS := 'D';
                  TYPJAL := 'FC';

                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('jal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
                  FDQueryImp_cpta.FieldByName('libelle').AsString := 'Ventes cumulées du jour';
                  FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                  FDQueryImp_cpta.Post;

                  FDQueryEcr_cpt.Insert;
                  FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                  FDQueryEcr_cpt.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                  FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
                  FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
                  FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Ventes cumulées du jour';
                  FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                  FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                  FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                  FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                  FDQueryEcr_cpt.Post;
                end;

                if NETTTC < 0 then
                begin
                  MONT := Round(-NETTTC);
                  SENS := 'C';
                  TYPJAL := 'AC';

                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('jal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
                  FDQueryImp_cpta.FieldByName('libelle').AsString := 'Ventes cumulées du jour';
                  FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                  FDQueryImp_cpta.Post;

                  FDQueryEcr_cpt.Insert;
                  FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                  FDQueryEcr_cpt.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                  FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
                  FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
                  FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Ventes cumulées du jour';
                  FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                  FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                  FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                  FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                  FDQueryEcr_cpt.Post;
                end;

                QryCompta.Next;
              end;

              // B. Calcul différence arrondi TVA
              DEPNET := 0;

              QryCompta.Close;
              QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
              QryCompta.ParamByName('vtype').AsString := 'VV';
              QryCompta.Open;
              while not QryCompta.Eof do
              begin
                DEPNET := DEPNET + QryCompta.FieldByName('credit').AsFloat;
                QryCompta.Next;
              end;

              QryCompta.Close;
              QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
              QryCompta.ParamByName('vtype').AsString := 'VR';
              QryCompta.Open;
              while not QryCompta.Eof do
              begin
                DEPNET := DEPNET - QryCompta.FieldByName('debit').AsFloat;
                QryCompta.Next;
              end;

              QryParame.Close;
              QryParame.SQL.Text := 'SELECT * FROM parame WHERE type_ = :t1 OR type_ = :t2';
              QryParame.ParamByName('t1').AsString := 'V';
              QryParame.ParamByName('t2').AsString := 'X';
              QryParame.Open;
              while not QryParame.Eof do
              begin
                DEPNET := DEPNET + QryParame.FieldByName('montant').AsFloat;
                QryParame.Next;
              end;

              if DEPNET - TOTTTC <> 0 then
              begin
                if DM_Olivier.FDQueryCtrstock.FieldByName('cptremis').AsString <> '' then
                begin
                  QryCompta.Close;
                  QryCompta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
                  QryCompta.ParamByName('wdate').AsDate := WDATE;
                  QryCompta.ParamByName('vtype').AsString := 'VR';
                  QryCompta.ParamByName('nocpt').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('cptremis').AsString;
                  QryCompta.ParamByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  QryCompta.Open;

                  if QryCompta.IsEmpty then
                  begin
                    QryCompta.Insert;
                    QryCompta.FieldByName('date_').AsDateTime := WDATE;
                    QryCompta.FieldByName('type_').AsString := 'VR';
                    QryCompta.FieldByName('nocpt').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('cptremis').AsString;
                    QryCompta.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                    QryCompta.FieldByName('credit').AsFloat := 0;
                    QryCompta.FieldByName('debit').AsFloat := 0;
                    QryCompta.Post;
                    QryCompta.Refresh;
                  end;

                  QryCompta.Edit;
                  QryCompta.FieldByName('debit').AsFloat := QryCompta.FieldByName('debit').AsFloat + (DEPNET - TOTTTC);
                  QryCompta.Post;
                end
                else
                begin
                  QryCompta.Close;
                  QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
                  QryCompta.ParamByName('vtype').AsString := 'VV';
                  QryCompta.Open;

                  while not QryCompta.Eof do
                  begin
                    if QryCompta.FieldByName('credit').AsFloat <> 0 then
                    begin
                      QryCompta.Edit;
                      QryCompta.FieldByName('credit').AsFloat := QryCompta.FieldByName('credit').AsFloat + (TOTTTC - DEPNET);
                      QryCompta.Post;
                      Break;
                    end;
                    QryCompta.Next;
                  end;
                end;
              end;

              // C. VENTE cumulée par Compte Vente
              QryCompta.Close;
              QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
              QryCompta.ParamByName('vtype').AsString := 'VV';
              QryCompta.Open;

              while not QryCompta.Eof do
              begin
                if QryCompta.FieldByName('credit').AsFloat = 0 then
                begin
                  QryCompta.Next;
                  Continue;
                end;

                if QryCompta.FieldByName('credit').AsFloat > 0 then
                begin
                  MONT := QryCompta.FieldByName('credit').AsFloat;
                  SENS := 'C';
                  TYPJAL := 'FC';
                end
                else
                begin
                  MONT := -QryCompta.FieldByName('credit').AsFloat;
                  SENS := 'D';
                  TYPJAL := 'AC';
                end;

                FDQueryImp_cpta.Insert;
                FDQueryImp_cpta.FieldByName('jal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                FDQueryImp_cpta.FieldByName('nocpt').AsString := QryCompta.FieldByName('nocpt').AsString;
                FDQueryImp_cpta.FieldByName('libelle').AsString := 'Journée du ' + DateToStr(WDATE);
                FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                if SENS = 'C' then
                begin
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                end
                else
                begin
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                end;
                FDQueryImp_cpta.Post;

                FDQueryEcr_cpt.Insert;
                FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                FDQueryEcr_cpt.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryCompta.FieldByName('nocpt').AsString;
                FDQueryEcr_cpt.FieldByName('noaux').AsString := '';
                FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Journée du ' + DateToStr(WDATE);
                FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                FDQueryEcr_cpt.Post;

                QryCompta.Next;
              end;

              // D. REMISE cumulée par Compte Remise
              QryCompta.Close;
              QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
              QryCompta.ParamByName('vtype').AsString := 'VR';
              QryCompta.Open;

              while not QryCompta.Eof do
              begin
                if QryCompta.FieldByName('debit').AsFloat = 0 then
                begin
                  QryCompta.Next;
                  Continue;
                end;

                if QryCompta.FieldByName('debit').AsFloat > 0 then
                begin
                  MONT := QryCompta.FieldByName('debit').AsFloat;
                  SENS := 'D';
                  TYPJAL := 'FC';
                end
                else
                begin
                  MONT := -QryCompta.FieldByName('debit').AsFloat;
                  SENS := 'C';
                  TYPJAL := 'AC';
                end;

                FDQueryImp_cpta.Insert;
                FDQueryImp_cpta.FieldByName('jal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                FDQueryImp_cpta.FieldByName('nocpt').AsString := QryCompta.FieldByName('nocpt').AsString;
                FDQueryImp_cpta.FieldByName('libelle').AsString := 'Remises du ' + DateToStr(WDATE);
                FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                if SENS = 'D' then
                begin
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                end
                else
                begin
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                end;
                FDQueryImp_cpta.Post;

                FDQueryEcr_cpt.Insert;
                FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                FDQueryEcr_cpt.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryCompta.FieldByName('nocpt').AsString;
                FDQueryEcr_cpt.FieldByName('noaux').AsString := '';
                FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Remises du ' + DateToStr(WDATE);
                FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                FDQueryEcr_cpt.Post;

                QryCompta.Next;
              end;

              // E. VENTE TVA et CPS
              QryParame.Close;
              QryParame.SQL.Text := 'SELECT * FROM parame WHERE type_ = :t1 OR type_ = :t2';
              QryParame.ParamByName('t1').AsString := 'V';
              QryParame.ParamByName('t2').AsString := 'X';
              QryParame.Open;

              while not QryParame.Eof do
              begin
                if QryParame.FieldByName('montant').AsFloat = 0 then
                begin
                  QryParame.Next;
                  Continue;
                end;

                if QryParame.FieldByName('montant').AsFloat > 0 then
                begin
                  MONT := QryParame.FieldByName('montant').AsFloat;
                  SENS := 'C';
                end
                else
                begin
                  MONT := -QryParame.FieldByName('montant').AsFloat;
                  SENS := 'D';
                end;
                TYPJAL := 'FC';

                if (QryParame.FieldByName('type_').AsString = 'V') or (QryParame.FieldByName('type_').AsString = 'X') then
                begin
                  FDQueryImp_cpta.Insert;
                  FDQueryImp_cpta.FieldByName('jal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryImp_cpta.FieldByName('nocpt').AsString := QryParame.FieldByName('nocpt').AsString;
                  if QryParame.FieldByName('type_').AsString = 'V' then
                    FDQueryImp_cpta.FieldByName('libelle').AsString := 'TVA du ' + DateToStr(WDATE)
                  else
                    FDQueryImp_cpta.FieldByName('libelle').AsString := 'CPS du ' + DateToStr(WDATE);

                  FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                  FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                  if SENS = 'C' then
                  begin
                    FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                  end
                  else
                  begin
                    FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                    FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                  end;
                  FDQueryImp_cpta.Post;

                  FDQueryEcr_cpt.Insert;
                  FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                  FDQueryEcr_cpt.FieldByName('codjal').AsString := DM_Olivier.FDQueryCtrstock.FieldByName('jal_vte').AsString;
                  FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
                  FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                  FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryParame.FieldByName('nocpt').AsString;
                  FDQueryEcr_cpt.FieldByName('noaux').AsString := '';
                  if QryParame.FieldByName('type_').AsString = 'V' then
                    FDQueryEcr_cpt.FieldByName('libelle').AsString := 'TVA du ' + DateToStr(WDATE)
                  else
                    FDQueryEcr_cpt.FieldByName('libelle').AsString := 'CPS du ' + DateToStr(WDATE);

                  FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                  FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                  FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                  FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                  FDQueryEcr_cpt.Post;
                end;

                QryParame.Next;
              end;

              // F. REGLEMENT CLIENT (Cumulées)
              QryCompta.Close;
              QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
              QryCompta.ParamByName('vtype').AsString := 'RC';
              QryCompta.Open;

              while not QryCompta.Eof do
              begin
                if QryCompta.FieldByName('credit').AsFloat = 0 then
                begin
                  QryCompta.Next;
                  Continue;
                end;

                NETTTC := QryCompta.FieldByName('credit').AsFloat;

                QryClient.Close;
                QryClient.SQL.Text := 'SELECT * FROM client WHERE codcli = :codcli';
                QryClient.ParamByName('codcli').AsString := QryCompta.FieldByName('nocpt').AsString;
                QryClient.Open;

                QryRepres.Close;
                QryRepres.SQL.Text := 'SELECT * FROM repres WHERE codrep = :codrep';
                QryRepres.ParamByName('codrep').AsString := QryClient.FieldByName('codrep').AsString;
                QryRepres.Open;

                if NETTTC > 0 then
                begin
                  MONT := NETTTC;
                  SENS := 'C';
                end
                else
                begin
                  MONT := -NETTTC;
                  SENS := 'D';
                end;
                TYPJAL := 'RC';
                LcptCli := QryClient.FieldByName('cptaux').AsString;

                FDQueryImp_cpta.Insert;
                FDQueryImp_cpta.FieldByName('jal').AsString := QryCompta.FieldByName('codjal').AsString;
                FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
                FDQueryImp_cpta.FieldByName('libelle').AsString := 'Règlements cumules jour';
                FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
                FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
                if SENS = 'C' then
                begin
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
                end
                else
                begin
                  FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
                  FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
                end;
                FDQueryImp_cpta.Post;

                FDQueryEcr_cpt.Insert;
                FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
                FDQueryEcr_cpt.FieldByName('codjal').AsString := QryCompta.FieldByName('codjal').AsString;
                FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
                FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
                FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
                FDQueryEcr_cpt.FieldByName('noaux').AsString := QryClient.FieldByName('cptaux').AsString;
                FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Règlements cumules jour';
                FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
                FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
                FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
                FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
                FDQueryEcr_cpt.Post;

                QryCompta.Next;
              end;
            end;

            WDATE := WDATE + 1;
          end;

        finally
          QryEntVte.Free;
          QryLigVte.Free;
          QryParame.Free;
          QryClient.Free;
          QryRepres.Free;
          QryRegLaa.Free;
          QryPaiement.Free;
          QryArticle.Free;
          QryFamille.Free;
          QryCompta.Free;
          QryTresor.Free;
        end;
      end;

      // 4. Traitement indépendant du fichier TRESOR[cite: 6]
      if pNature <> 1 then
      begin
        sContenuTresorerie := Tresorerie(pDate1, pDate2, pModele, pNature, pEtendu);
      end;

      // 5. Génération finale du fichier texte d'export[cite: 6]
      FDQueryEcr_cpt.Close;
      FDQueryEcr_cpt.SQL.Text := 'SELECT * FROM ecr_cpt ORDER BY codjal';
      FDQueryEcr_cpt.Open;

      if (not FDQueryEcr_cpt.IsEmpty) and (pModele = 1) then
      begin
        SContenuFichier := DM_Olivier.FDQueryCtrstock.FieldByName('nom').AsString + #13#10;
      end;

      FDQueryEcr_cpt.First;
      while not FDQueryEcr_cpt.Eof do
      begin
        SDateStr := FormatDateTime('yyyymmdd', FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime);
        AA := Copy(SDateStr, 3, 2);
        MM := Copy(SDateStr, 5, 2);
        JJ := Copy(SDateStr, 7, 2);
        AAAA := Copy(SDateStr, 1, 4);
        DATEJ := FormatDateTime('yyyymmdd', FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime);
        DATECPT := JJ + MM + AA;
        DATECPT4 := JJ + MM + AAAA;

        SEchStr := FDQueryEcr_cpt.FieldByName('date_ech').AsString;
        if Length(SEchStr) >= 8 then
        begin
          AA := Copy(SEchStr, 3, 2);
          MM := Copy(SEchStr, 5, 2);
          JJ := Copy(SEchStr, 7, 2);
          AAAA := Copy(SEchStr, 1, 4);
          DATEECH := JJ + MM + AA;
          DATEECH4 := JJ + MM + AAAA;
        end
        else
        begin
          DATEECH := DATECPT;
          DATEECH4 := DATECPT4;
        end;

        WPAIE := 'S';
        TYPJAL := FDQueryEcr_cpt.FieldByName('type').AsString;

        case pModele of
          1: // Saari 100[cite: 6]
          begin
            if FDQueryEcr_cpt.FieldByName('noaux').AsString <> '' then
              SLigneAEcrire := PadRight(FDQueryEcr_cpt.FieldByName('codjal').AsString, 3) + DATECPT + '  ' +
                               PadRight(FDQueryEcr_cpt.FieldByName('nocpt').AsString, 13) + 'X' +
                               PadRight(FDQueryEcr_cpt.FieldByName('noaux').AsString, 13) + DATEJ + '    ' +
                               PadRight(FDQueryEcr_cpt.FieldByName('libelle').AsString, 26) + DATEECH +
                               FDQueryEcr_cpt.FieldByName('sens').AsString +
                               FormatFloat('00000000000000000000', FDQueryEcr_cpt.FieldByName('montant').AsFloat * 100) + 'N'
            else
              SLigneAEcrire := PadRight(FDQueryEcr_cpt.FieldByName('codjal').AsString, 3) + DATECPT + '  ' +
                               PadRight(FDQueryEcr_cpt.FieldByName('nocpt').AsString, 13) + '             ' +
                               DATEJ + '    ' + PadRight(FDQueryEcr_cpt.FieldByName('libelle').AsString, 26) + DATEECH +
                               FDQueryEcr_cpt.FieldByName('sens').AsString +
                               FormatFloat('00000000000000000000', FDQueryEcr_cpt.FieldByName('montant').AsFloat * 100) + 'N';
          end;

          2: // Revatel[cite: 6]
          begin
            if FDQueryEcr_cpt.FieldByName('noaux').AsString <> '' then
              SLigneAEcrire := PadRight(FDQueryEcr_cpt.FieldByName('codjal').AsString, 3) + DATECPT4 + TYPJAL +
                               PadRight(FDQueryEcr_cpt.FieldByName('nocpt').AsString, 13) + 'X' +
                               PadRight(FDQueryEcr_cpt.FieldByName('noaux').AsString, 13) + DATEJ + '    ' +
                               PadRight(FDQueryEcr_cpt.FieldByName('libelle').AsString, 25) +
                               FDQueryEcr_cpt.FieldByName('pai').AsString + DATEECH4 +
                               FDQueryEcr_cpt.FieldByName('sens').AsString +
                               FormatFloat('00000000000000000000', FDQueryEcr_cpt.FieldByName('montant').AsFloat * 100) + 'N' +
                               FormatFloat('0000000', FDQueryEcr_cpt.FieldByName('nopiece').AsInteger)
            else
              SLigneAEcrire := PadRight(FDQueryEcr_cpt.FieldByName('codjal').AsString, 3) + DATECPT4 + TYPJAL +
                               PadRight(FDQueryEcr_cpt.FieldByName('nocpt').AsString, 13) + '             ' +
                               DATEJ + '    ' + PadRight(FDQueryEcr_cpt.FieldByName('libelle').AsString, 25) +
                               FDQueryEcr_cpt.FieldByName('pai').AsString + DATEECH4 +
                               FDQueryEcr_cpt.FieldByName('sens').AsString +
                               FormatFloat('00000000000000000000', FDQueryEcr_cpt.FieldByName('montant').AsFloat * 100) + 'N' +
                               FormatFloat('0000000', FDQueryEcr_cpt.FieldByName('nopiece').AsInteger);
          end;
        end;

        SContenuFichier := SContenuFichier + SLigneAEcrire + #13#10;
        FDQueryEcr_cpt.Next;
      end;

      if SContenuFichier <> '' then
      begin
        TFile.WriteAllText(DMGesCloud.GsCheminLocal + '\export\ventes.txt', SContenuFichier, TEncoding.UTF8);
        Result := True;
      end
      else
      begin
        Result := False;
      end;

    finally
      Qry.Free;
    end;

    // Validation définitive de la transaction si tout s'est bien passé
    DMGesCloud.ConnexionGesCloud.Commit;

  except
    on E: Exception do
    begin
      // Annulation globale en cas d'erreur
      if DMGesCloud.ConnexionGesCloud.InTransaction then
        DMGesCloud.ConnexionGesCloud.Rollback;

      Result := False;
      ShowMessage('Erreur lors de l''export comptable : ' + E.Message);
    end;
  end;

  Screen.Cursor := crDefault;
end;

function TDM_ExportEcrituresClients.Tresorerie(pDate1, pDate2: TDateTime; pModele, pNature, pEtendu: Integer): string;
var
  MONT: Double;
  DATECPT, DATEECH: string;
  DATECPT4, DATEECH4: string;
  DATEJ: string;
  SENS: string;
  TYPJAL: string;
  WPAIE: string;
  JJ, MM, AA, AAAA: string;
  LcptCli: string;
  Trelib: string;
  QryTresor: TFDQuery;
  QryClient: TFDQuery;
  QryRepres: TFDQuery;
  QryPaiement: TFDQuery;
  QryCompta: TFDQuery;

  WDATE: TDateTime;
  NBMVT: Integer;
  PIEVTE, PIEREG: Integer;
  SContenuFichier, SLigneAEcrire: string;
  YearVal, MonthVal, DayVal: Word;
  SDateStr, SEchStr: string;
begin
  SContenuFichier := '';
  PIEVTE := 0; // Valeur initiale selon la logique descendante
  PIEREG := 0;

  // ------------------------------------------------------------------
  // 1. Transfert des mouvements de trésorerie (si pNature > 1)
  // ------------------------------------------------------------------
  QryTresor := TFDQuery.Create(nil);
  QryTresor.Connection   := DMGesCloud.ConnexionGesCloud;
  QryClient := TFDQuery.Create(nil);
  QryClient.Connection   := DMGesCloud.ConnexionGesCloud;
  QryRepres := TFDQuery.Create(nil);
  QryRepres.Connection   := DMGesCloud.ConnexionGesCloud;
  QryPaiement := TFDQuery.Create(nil);
  QryPaiement.Connection   := DMGesCloud.ConnexionGesCloud;
  QryCompta := TFDQuery.Create(nil);
  QryCompta.Connection   := DMGesCloud.ConnexionGesCloud;

  WDATE := pDate1;
  while WDATE <= pDate2 do
  begin
    NBMVT := 0;
    Dec(PIEVTE);
    Inc(PIEREG);

    // RAZ des zones de cumuls COMPTA
    DMGesCloud.ConnexionGesCloud.ExecSQL('DELETE FROM compta');

    DecodeDate(WDATE, YearVal, MonthVal, DayVal);
    DATEJ := Format('%.4d-%.2d-%.2d', [YearVal, MonthVal, DayVal]);

    // Traitement des mouvements de trésorerie via FDQueryTresor
    QryTresor.Close;
    QryTresor.SQL.Text := 'SELECT * FROM tresor WHERE date_ = :wdate ORDER BY date_ ASC, codcli ASC';
    QryTresor.ParamByName('wdate').AsDate := WDATE;
    QryTresor.Open;

    while not QryTresor.Eof do
    begin
      if (pEtendu = 1) and (not QryTresor.FieldByName('date_compta').IsNull) and (QryTresor.FieldByName('date_compta').AsString <> '') then
      begin
        QryTresor.Next;
        Continue;
      end;

      if QryTresor.FieldByName('origin').AsString = 'V' then
      begin
        QryTresor.Next;
        Continue;
      end;

      if (QryTresor.FieldByName('debit').AsFloat = 0) and (QryTresor.FieldByName('credit').AsFloat = 0) then
      begin
        QryTresor.Next;
        Continue;
      end;

      Inc(NBMVT);

      // Lecture Client
      QryClient.Close;
      QryClient.SQL.Text := 'SELECT * FROM client WHERE codcli = :codcli';
      QryClient.ParamByName('codcli').AsString := QryTresor.FieldByName('codcli').AsString;
      QryClient.Open;
      LcptCli := QryClient.FieldByName('cptaux').AsString;

      // Lecture Représentant
      QryRepres.Close;
      QryRepres.SQL.Text := 'SELECT * FROM repres WHERE codrep = :codrep';
      QryRepres.ParamByName('codrep').AsString := QryClient.FieldByName('codrep').AsString;
      QryRepres.Open;

      // Mise en forme dates comptables (WDATE)
      SDateStr := FormatDateTime('yyyymmdd', WDATE);
      AA := Copy(SDateStr, 3, 2);
      MM := Copy(SDateStr, 5, 2);
      JJ := Copy(SDateStr, 7, 2);
      AAAA := Copy(SDateStr, 1, 4);
      DATECPT := JJ + MM + AA;
      DATECPT4 := JJ + MM + AAAA;

      // Mise en forme dates échéance (tresor.date_ech)
      SEchStr := QryTresor.FieldByName('date_ech').AsString;
      if Length(SEchStr) >= 8 then
      begin
        AA := Copy(SEchStr, 3, 2);
        MM := Copy(SEchStr, 5, 2);
        JJ := Copy(SEchStr, 7, 2);
        AAAA := Copy(SEchStr, 1, 4);
        DATEECH := JJ + MM + AA;
        DATEECH4 := JJ + MM + AAAA;
      end
      else
      begin
        DATEECH := DATECPT;
        DATEECH4 := DATECPT4;
      end;

      Trelib := QryTresor.FieldByName('libelle').AsString;

      // Lecture PAIEMENT
      QryPaiement.Close;
      QryPaiement.SQL.Text := 'SELECT * FROM paiement WHERE codpai = :codpai';
      QryPaiement.ParamByName('codpai').AsString := QryTresor.FieldByName('codpai').AsString;
      QryPaiement.Open;

      // Cumul Cpte TRESORERIE
      QryCompta.Close;
      QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype AND date_ = :wdate AND nocpt = :nocpt AND codjal = :codjal';
      QryCompta.ParamByName('vtype').AsString := 'RT';
      QryCompta.ParamByName('wdate').AsDate := WDATE;
      QryCompta.ParamByName('nocpt').AsString := QryPaiement.FieldByName('nocpt').AsString;
      QryCompta.ParamByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
      QryCompta.Open;

      if QryCompta.IsEmpty then
      begin
        QryCompta.Insert;
        QryCompta.FieldByName('type_').AsString := 'RT';
        QryCompta.FieldByName('date_').AsDateTime := WDATE;
        QryCompta.FieldByName('nocpt').AsString := QryPaiement.FieldByName('nocpt').AsString;
        QryCompta.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
        QryCompta.FieldByName('debit').AsFloat := 0;
        QryCompta.FieldByName('credit').AsFloat := 0;
        QryCompta.Post;
        QryCompta.Refresh;
      end;

      QryCompta.Edit;
      QryCompta.FieldByName('debit').AsFloat := QryCompta.FieldByName('debit').AsFloat + QryTresor.FieldByName('credit').AsFloat;
      QryCompta.FieldByName('credit').AsFloat := QryCompta.FieldByName('credit').AsFloat + QryTresor.FieldByName('debit').AsFloat;
      QryCompta.Post;

      MONT := QryCompta.FieldByName('credit').AsFloat - QryCompta.FieldByName('debit').AsFloat;
      if MONT > 0 then
      begin
        SENS := 'C';
      end
      else
      begin
        MONT := -MONT;
        SENS := 'D';
      end;
      TYPJAL := 'RC';
      WPAIE := 'O';

      // Fichier d'impression (Trésorerie)
      FDQueryImp_cpta.Insert;
      FDQueryImp_cpta.FieldByName('jal').AsString := QryPaiement.FieldByName('codjal').AsString;
      FDQueryImp_cpta.FieldByName('nocpt').AsString := QryPaiement.FieldByName('nocpt').AsString;
      FDQueryImp_cpta.FieldByName('libelle').AsString := Trelib;
      FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
      FDQueryImp_cpta.FieldByName('date_ech').AsString := QryTresor.FieldByName('date_ech').AsString;
      if SENS = 'C' then
      begin
        FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
        FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
      end
      else
      begin
        FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
        FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
      end;
      FDQueryImp_cpta.Post;

      // Ajout ECR_CPT (Trésorerie)
      FDQueryEcr_cpt.Insert;
      FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
      FDQueryEcr_cpt.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
      FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
      FDQueryEcr_cpt.FieldByName('date_ech').AsString := QryTresor.FieldByName('date_ech').AsString;
      FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
      FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryPaiement.FieldByName('nocpt').AsString;
      FDQueryEcr_cpt.FieldByName('noaux').AsString := '';
      FDQueryEcr_cpt.FieldByName('libelle').AsString := Trelib;
      FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
      FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
      FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
      FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
      FDQueryEcr_cpt.Post;

      // Écriture cpta TRESOR client
      if QryClient.FieldByName('cum_mvt').AsInteger = 0 then
      begin
        if QryTresor.FieldByName('debit').AsFloat <> 0 then
        begin
          MONT := QryTresor.FieldByName('debit').AsFloat;
          SENS := 'D';
        end
        else
        begin
          MONT := QryTresor.FieldByName('credit').AsFloat;
          SENS := 'C';
        end;
        WPAIE := 'O';
        TYPJAL := 'RC';

        // Fichier d'impression
        FDQueryImp_cpta.Insert;
        FDQueryImp_cpta.FieldByName('jal').AsString := QryPaiement.FieldByName('codjal').AsString;
        FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
        FDQueryImp_cpta.FieldByName('libelle').AsString := Trelib;
        FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
        FDQueryImp_cpta.FieldByName('date_ech').AsString := QryTresor.FieldByName('date_ech').AsString;
        if SENS = 'D' then
        begin
          FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
          FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
        end
        else
        begin
          FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
          FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
        end;
        FDQueryImp_cpta.Post;

        // Ajout ECR_CPT
        FDQueryEcr_cpt.Insert;
        FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
        FDQueryEcr_cpt.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
        FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
        FDQueryEcr_cpt.FieldByName('date_ech').AsString := QryTresor.FieldByName('date_ech').AsString;
        FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
        FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
        FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
        FDQueryEcr_cpt.FieldByName('libelle').AsString := Trelib;
        FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
        FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
        FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
        FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
        FDQueryEcr_cpt.Post;
      end
      else
      begin
        // Cumul ventes
        QryCompta.Close;
        QryCompta.SQL.Text := 'SELECT * FROM compta WHERE date_ = :wdate AND type_ = :vtype AND nocpt = :nocpt AND codjal = :codjal';
        QryCompta.ParamByName('wdate').AsDate := WDATE;
        QryCompta.ParamByName('vtype').AsString := 'RC';
        QryCompta.ParamByName('nocpt').AsString := QryTresor.FieldByName('codcli').AsString;
        QryCompta.ParamByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
        QryCompta.Open;

        if QryCompta.IsEmpty then
        begin
          QryCompta.Insert;
          QryCompta.FieldByName('type_').AsString := 'RC';
          QryCompta.FieldByName('date_').AsDateTime := WDATE;
          QryCompta.FieldByName('nocpt').AsString := QryTresor.FieldByName('codcli').AsString;
          QryCompta.FieldByName('codjal').AsString := QryPaiement.FieldByName('codjal').AsString;
          QryCompta.FieldByName('debit').AsFloat := 0;
          QryCompta.FieldByName('credit').AsFloat := 0;
          QryCompta.Post;
          QryCompta.Refresh;
        end;

        QryCompta.Edit;
        QryCompta.FieldByName('debit').AsFloat := QryCompta.FieldByName('debit').AsFloat + QryTresor.FieldByName('debit').AsFloat;
        QryCompta.FieldByName('credit').AsFloat := QryCompta.FieldByName('credit').AsFloat + QryTresor.FieldByName('credit').AsFloat;
        QryCompta.Post;
      end;

      // Marquer trésorerie comme comptabilisée
      QryTresor.Edit;
      QryTresor.FieldByName('date_compta').AsDateTime := Date;
      QryTresor.Post;

      QryTresor.Next;
    end;

    // Si mouvements alors comptabilisation des cumuls
    if NBMVT > 0 then
    begin
      QryCompta.Close;
      QryCompta.SQL.Text := 'SELECT * FROM compta WHERE type_ = :vtype';
      QryCompta.ParamByName('vtype').AsString := 'RC';
      QryCompta.Open;

      while not QryCompta.Eof do
      begin
        if (QryCompta.FieldByName('credit').AsFloat = 0) and (QryCompta.FieldByName('debit').AsFloat = 0) then
        begin
          QryCompta.Next;
          Continue;
        end;

        MONT := QryCompta.FieldByName('credit').AsFloat - QryCompta.FieldByName('debit').AsFloat;
        if MONT = 0 then
        begin
          QryCompta.Next;
          Continue;
        end;

        if MONT > 0 then
        begin
          SENS := 'C';
        end
        else
        begin
          MONT := -MONT;
          SENS := 'D';
        end;

        QryClient.Close;
        QryClient.SQL.Text := 'SELECT * FROM client WHERE codcli = :codcli';
        QryClient.ParamByName('codcli').AsInteger := QryCompta.FieldByName('nocpt').AsInteger;
        QryClient.Open;
        LcptCli := QryClient.FieldByName('cptaux').AsString;

        QryRepres.Close;
        QryRepres.SQL.Text := 'SELECT * FROM repres WHERE codrep = :codrep';
        QryRepres.ParamByName('codrep').AsString := QryClient.FieldByName('codrep').AsString;
        QryRepres.Open;

        // Fichier d'impression
        FDQueryImp_cpta.Insert;
        FDQueryImp_cpta.FieldByName('jal').AsString := QryCompta.FieldByName('codjal').AsString;
        FDQueryImp_cpta.FieldByName('nocpt').AsString := LcptCli;
        FDQueryImp_cpta.FieldByName('libelle').AsString := 'Reglements cumules';
        FDQueryImp_cpta.FieldByName('date_cpt').AsDateTime := WDATE;
        FDQueryImp_cpta.FieldByName('date_ech').AsDateTime := WDATE;
        if SENS = 'C' then
        begin
          FDQueryImp_cpta.FieldByName('debit').AsFloat := 0;
          FDQueryImp_cpta.FieldByName('credit').AsFloat := MONT;
        end
        else
        begin
          FDQueryImp_cpta.FieldByName('debit').AsFloat := MONT;
          FDQueryImp_cpta.FieldByName('credit').AsFloat := 0;
        end;
        FDQueryImp_cpta.Post;

        // Ajout ECR_CPT
        FDQueryEcr_cpt.Insert;
        FDQueryEcr_cpt.FieldByName('nopiece').AsInteger := PIEVTE;
        FDQueryEcr_cpt.FieldByName('codjal').AsString := QryCompta.FieldByName('codjal').AsString;
        FDQueryEcr_cpt.FieldByName('date_mvt').AsDateTime := WDATE;
        FDQueryEcr_cpt.FieldByName('date_ech').AsDateTime := WDATE;
        FDQueryEcr_cpt.FieldByName('reference').AsString := DATEJ;
        FDQueryEcr_cpt.FieldByName('nocpt').AsString := QryRepres.FieldByName('cptcli').AsString;
        FDQueryEcr_cpt.FieldByName('noaux').AsString := LcptCli;
        FDQueryEcr_cpt.FieldByName('libelle').AsString := 'Reglements cumules';
        FDQueryEcr_cpt.FieldByName('montant').AsFloat := MONT;
        FDQueryEcr_cpt.FieldByName('sens').AsString := SENS;
        FDQueryEcr_cpt.FieldByName('pai').AsString := WPAIE;
        FDQueryEcr_cpt.FieldByName('type').AsString := TYPJAL;
        FDQueryEcr_cpt.Post;

        QryCompta.Next;
      end;
    end;

    WDATE := WDATE + 1;
  end;

end;


end.
