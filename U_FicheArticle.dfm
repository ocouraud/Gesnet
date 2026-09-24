object FormFicheArticle: TFormFicheArticle
  Left = 0
  Top = 0
  Caption = 'Fiche article'
  ClientHeight = 597
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 28
    Height = 15
    Caption = 'Code'
    FocusControl = DBCodart
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 63
    Height = 15
    Caption = 'D'#233'signation'
    FocusControl = DBLibelle
  end
  object Label4: TLabel
    Left = 8
    Top = 69
    Width = 65
    Height = 15
    Caption = 'Libell'#233' court'
    FocusControl = DBLibcourt
  end
  object Label3: TLabel
    Left = 297
    Top = 69
    Width = 20
    Height = 15
    Caption = 'TVA'
    FocusControl = DBCodart
  end
  object DBCodart: TDBEdit
    Left = 88
    Top = 8
    Width = 97
    Height = 23
    DataField = 'CODART'
    DataSource = DSArticle
    TabOrder = 0
  end
  object DBLibelle: TDBEdit
    Left = 88
    Top = 37
    Width = 457
    Height = 23
    DataField = 'LIBELLE'
    DataSource = DSArticle
    TabOrder = 1
  end
  object DBLookupComboBoxTVA: TDBLookupComboBox
    Left = 325
    Top = 66
    Width = 220
    Height = 23
    DataField = 'TVA'
    DataSource = DSArticle
    KeyField = 'CODE'
    ListField = 'CODE;TAUX;LIBELLE'
    ListFieldIndex = 2
    ListSource = DSTVA
    TabOrder = 2
  end
  object DBLibcourt: TDBEdit
    Left = 88
    Top = 66
    Width = 193
    Height = 23
    DataField = 'LIBCOURT'
    DataSource = DSArticle
    TabOrder = 3
  end
  object DBCheckBoxNonTVAIles: TDBCheckBox
    Left = 560
    Top = 69
    Width = 101
    Height = 17
    Caption = 'Exclu TVA Iles'
    DataField = 'EXCLU_TVA1'
    DataSource = DSArticle
    TabOrder = 4
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 104
    Width = 768
    Height = 488
    ActivePage = TabSheetDevis
    TabOrder = 5
    object TabSheetGral: TTabSheet
      Caption = 'G'#233'n'#233'ral'
      object Label5: TLabel
        Left = 3
        Top = 11
        Width = 69
        Height = 15
        Caption = 'D'#233'partement'
      end
      object Label6: TLabel
        Left = 3
        Top = 40
        Width = 38
        Height = 15
        Caption = 'Famille'
      end
      object Label7: TLabel
        Left = 325
        Top = 40
        Width = 66
        Height = 15
        Caption = 'Sous-famille'
      end
      object Label8: TLabel
        Left = 325
        Top = 11
        Width = 61
        Height = 15
        Caption = 'Fournisseur'
      end
      object Label9: TLabel
        Left = 325
        Top = 69
        Width = 82
        Height = 15
        Caption = 'Ref. fournisseur'
        FocusControl = DBEdit2
      end
      object Label10: TLabel
        Left = 3
        Top = 69
        Width = 77
        Height = 15
        Caption = 'Categ. tarifaire'
      end
      object Label11: TLabel
        Left = 3
        Top = 98
        Width = 73
        Height = 15
        Caption = 'Jours garantie'
        FocusControl = DBEdit3
      end
      object Label12: TLabel
        Left = 326
        Top = 98
        Width = 81
        Height = 15
        Caption = 'Rapport UV/UC'
        FocusControl = DBEdit4
      end
      object Label13: TLabel
        Left = 582
        Top = 69
        Width = 46
        Height = 15
        Caption = 'Poids Kg'
        FocusControl = DBEdit5
      end
      object Label14: TLabel
        Left = 582
        Top = 96
        Width = 60
        Height = 15
        Caption = 'Volume m3'
        FocusControl = DBEdit6
      end
      object Label15: TLabel
        Left = 3
        Top = 156
        Width = 69
        Height = 15
        Caption = 'Observations'
        FocusControl = DBMemo1
      end
      object Label16: TLabel
        Left = 3
        Top = 127
        Width = 73
        Height = 15
        Caption = 'Emplacement'
        FocusControl = DBEdit7
      end
      object DBLookupComboBoxDepart: TDBLookupComboBox
        Left = 92
        Top = 8
        Width = 197
        Height = 23
        DataField = 'CODDPT'
        DataSource = DSArticle
        KeyField = 'CODDPT'
        ListField = 'CODDPT;LIBELLE'
        ListFieldIndex = 1
        ListSource = DSDepart
        TabOrder = 0
      end
      object DBLookupComboBoxFamille: TDBLookupComboBox
        Left = 92
        Top = 37
        Width = 197
        Height = 23
        DataField = 'CODFAM'
        DataSource = DSArticle
        KeyField = 'CODFAM'
        ListField = 'CODFAM;LIBELLE'
        ListFieldIndex = 1
        ListSource = DSFamille
        TabOrder = 1
      end
      object DBLookupComboBoxSF: TDBLookupComboBox
        Left = 413
        Top = 37
        Width = 197
        Height = 23
        DataField = 'CODSSF'
        DataSource = DSArticle
        KeyField = 'CODSSF'
        ListField = 'CODSSF;LIBELLE'
        ListFieldIndex = 1
        ListSource = DSSousfam
        TabOrder = 2
      end
      object DBLookupComboBoxFournis: TDBLookupComboBox
        Left = 413
        Top = 8
        Width = 277
        Height = 23
        DataField = 'CODFOU'
        DataSource = DSArticle
        KeyField = 'CODFOU'
        ListField = 'CODFOU;NOM'
        ListFieldIndex = 1
        ListSource = DSFournis
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 413
        Top = 66
        Width = 120
        Height = 23
        DataField = 'REF_FOU'
        DataSource = DSArticle
        TabOrder = 4
      end
      object DBLookupComboBoxActivite: TDBLookupComboBox
        Left = 92
        Top = 66
        Width = 197
        Height = 23
        DataField = 'CODPRIX'
        DataSource = DSArticle
        KeyField = 'CODACT'
        ListField = 'CODACT;LIBELLE'
        ListFieldIndex = 1
        ListSource = DSActivite
        TabOrder = 5
      end
      object DBEdit3: TDBEdit
        Left = 92
        Top = 95
        Width = 29
        Height = 23
        DataField = 'GARANTIE'
        DataSource = DSArticle
        TabOrder = 6
      end
      object DBEdit4: TDBEdit
        Left = 413
        Top = 95
        Width = 36
        Height = 23
        DataField = 'QTE_UV_UC'
        DataSource = DSArticle
        TabOrder = 7
      end
      object DBEdit5: TDBEdit
        Left = 654
        Top = 66
        Width = 36
        Height = 23
        DataField = 'POIDS'
        DataSource = DSArticle
        TabOrder = 8
      end
      object DBEdit6: TDBEdit
        Left = 654
        Top = 92
        Width = 36
        Height = 23
        DataField = 'VOLUME'
        DataSource = DSArticle
        TabOrder = 9
      end
      object DBMemo1: TDBMemo
        Left = 92
        Top = 153
        Width = 441
        Height = 72
        DataField = 'OBSERV'
        DataSource = DSArticle
        TabOrder = 10
      end
      object DBCheckBox1: TDBCheckBox
        Left = 548
        Top = 150
        Width = 101
        Height = 30
        Caption = 'Observations'#13#10'sur facture'
        DataField = 'EXCLU_TVA1'
        DataSource = DSArticle
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit7: TDBEdit
        Left = 92
        Top = 124
        Width = 197
        Height = 23
        DataField = 'CODEMP'
        DataSource = DSArticle
        TabOrder = 12
      end
    end
    object TabSheetStock: TTabSheet
      Caption = 'Stock'
      ImageIndex = 1
      object JvDBGridStock: TJvDBGrid
        Left = 3
        Top = 0
        Width = 754
        Height = 422
        DataSource = DStock
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        TitleButtons = True
        OnTitleBtnClick = JvDBGridStockTitleBtnClick
        AlternateRowColor = clInfoBk
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DATE_'
            Title.Caption = 'DATE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANNEE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MOIS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'LIBELLE'
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TYPE_'
            Title.Caption = 'NATURE'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTE'
            Title.Caption = 'QUANTITE'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIT'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VALUNIT'
            Title.Caption = 'VAL. UNITAIRE'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXVTE'
            Title.Caption = 'PRIX VENTE'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXVTE_UNIT'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODDEP'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CENTRA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODFOU'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOENR'
            Title.Caption = 'RANG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POIDS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DER_MODIF'
            Title.Caption = 'DATE ECR.'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIME'
            Title.Caption = 'HEURE'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODFAC'
            Title.Caption = 'No FACTURE'
            Width = 90
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 3
        Top = 424
        Width = 754
        Height = 33
        TabOrder = 1
        object Label28: TLabel
          Left = 312
          Top = 8
          Width = 253
          Height = 15
          Caption = '* Seul le dernier mouvement peut '#234'tre supprim'#233
        end
        object BtnNewStock: TButton
          Left = 8
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Nouveau'
          TabOrder = 0
          OnClick = BtnNewStockClick
        end
        object BtnSupprimer: TButton
          Left = 89
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Supprimer*'
          TabOrder = 1
          OnClick = BtnSupprimerClick
        end
        object BtnTransfert: TButton
          Left = 170
          Top = 4
          Width = 119
          Height = 25
          Caption = 'Transfert de d'#233'pots'
          TabOrder = 2
          OnClick = BtnTransfertClick
        end
      end
    end
    object TabSheetTarifs: TTabSheet
      Caption = 'Tarifs-Promo'
      ImageIndex = 2
      object JvDBGridTarifart: TJvDBGrid
        Left = 0
        Top = 0
        Width = 353
        Height = 223
        DataSource = DSTarifart
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAliceblue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'CODTAR'
            Title.Caption = 'CODE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'LIBELLE'
            Title.Caption = 'TARIF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'codtar_tarif'
            Title.Caption = 'TARIF GENERAL'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COM_PR'
            Title.Caption = '% PMP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXHT'
            Title.Caption = 'PX VTE HT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DER_MODIF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CalcPrixTTC'
            Title.Caption = 'PRIX TTC'
            Visible = True
          end>
      end
      object JvDBGridPromo: TJvDBGrid
        Left = 364
        Top = 0
        Width = 393
        Height = 223
        DataSource = DSPromo
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAliceblue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMPRO'
            ReadOnly = True
            Title.Caption = 'No PROMO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DAT_DEB'
            Title.Caption = 'DATE DEBUT'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DAT_FIN'
            Title.Caption = 'DATE FIN'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRC_REM'
            Title.Caption = '% REMISE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXHT'
            Title.Caption = 'PRIX VTE HT'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DER_MODIF'
            Visible = False
          end>
      end
      object BtnSuprPromo: TBitBtn
        Left = 673
        Top = 229
        Width = 81
        Height = 26
        Margins.Left = 6
        Margins.Right = 6
        Caption = '&Supprimer'
        TabOrder = 2
        OnClick = BtnSuprPromoClick
      end
      object BtnSuprTarifart: TBitBtn
        Left = 272
        Top = 229
        Width = 81
        Height = 26
        Margins.Left = 6
        Margins.Right = 6
        Caption = '&Supprimer'
        TabOrder = 3
        OnClick = BtnSuprTarifartClick
      end
    end
    object TabSheetCodbar: TTabSheet
      Caption = 'Code-barres'
      ImageIndex = 3
      object ImageCB: TImage
        Left = 344
        Top = 24
        Width = 161
        Height = 86
      end
      object JvDBGridCodbar: TJvDBGrid
        Left = 3
        Top = 3
        Width = 302
        Height = 282
        DataSource = DSCodbar
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = JvDBGridCodbarCellClick
        OnDrawColumnCell = JvDBGridCodbarDrawColumnCell
        AlternateRowColor = clAliceblue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'CODBAR'
            Title.Caption = 'Code-barres / facturation'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TYPE'
            Title.Caption = 'Impression sur factures'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXVTE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DER_MODIF'
            Visible = False
          end>
      end
      object BtnSupprCodbar: TBitBtn
        Left = 224
        Top = 291
        Width = 81
        Height = 26
        Margins.Left = 6
        Margins.Right = 6
        Caption = '&Supprimer'
        TabOrder = 1
        OnClick = BtnSupprCodbarClick
      end
      object BtnGenCodbar: TBitBtn
        Left = 3
        Top = 291
        Width = 81
        Height = 26
        Margins.Left = 6
        Margins.Right = 6
        Caption = '&G'#233'n'#233'rer'
        TabOrder = 2
        OnClick = BtnGenCodbarClick
      end
    end
    object TabSheetCA: TTabSheet
      Caption = 'CA.'
      ImageIndex = 4
      object JvDBGridCa_art: TJvDBGrid
        Left = 0
        Top = 0
        Width = 760
        Height = 458
        Align = alClient
        DataSource = DSCa_art
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAliceblue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ANNEE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNI'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MARGE'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TVA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HP'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'RANG'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'POIDS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DER_MODIF'
            Visible = False
          end>
      end
    end
    object TabSheetLigvteaa: TTabSheet
      Caption = 'Factures'
      ImageIndex = 5
      DesignSize = (
        760
        458)
      object BtnConsulterFacture: TSpeedButton
        Left = 3
        Top = 427
        Width = 72
        Height = 28
        Anchors = [akLeft, akBottom]
        Caption = 'Consulter'
        OnClick = BtnConsulterFactureClick
      end
      object BtnImprimerFacture: TSpeedButton
        Left = 81
        Top = 427
        Width = 72
        Height = 28
        Anchors = [akLeft, akBottom]
        Caption = 'Imprimer'
        OnClick = BtnImprimerFactureClick
      end
      object JvDBGridLigvteaa: TJvDBGrid
        Left = 3
        Top = 3
        Width = 757
        Height = 418
        DataSource = DSLigvteaa
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = BtnConsulterFactureClick
        TitleButtons = True
        OnTitleBtnClick = JvDBGridLigvteaaTitleBtnClick
        AlternateRowColor = clAliceblue
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'TYPE_'
            Title.Caption = 'Nature'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODFAC'
            Title.Caption = 'No Facture'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATE_'
            Title.Caption = 'Date'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODCLI'
            Title.Caption = 'Code client'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM'
            Title.Caption = 'Nom client'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIBELLE'
            Title.Caption = 'Libell'#233
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HEURE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'QTE'
            Title.Caption = 'Quantit'#233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POIDS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODTAR'
            Title.Caption = 'Tarif'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXHT'
            Title.Caption = 'Prix vte HT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRC_REMISE'
            Title.Caption = '% remise'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXNET'
            Title.Caption = 'Prix net'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXTTC'
            Title.Caption = 'Prix TTC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTHT'
            Title.Caption = 'Total HT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MT_TTC'
            Title.Caption = 'Total TTC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MT_REMISE'
            Title.Caption = 'Mont. remise'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_TVA'
            Title.Caption = 'Tx TVA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MT_TVA'
            Title.Caption = 'Mont. TVA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NO_TVA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRIXREV'
            Title.Caption = 'Prix revient'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARGE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DET_PPT'
            Title.Caption = 'Px det PPT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DET_ILE'
            Title.Caption = 'Px det ile'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PXLVTTC'
            Title.Caption = 'Px limite'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODDEV'
            Title.Caption = 'No devis'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODBAR'
            Title.Caption = 'Code-barres'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOENR'
            Title.Caption = 'No stock'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOENRF'
            Title.Caption = 'Rang'
            Visible = True
          end>
      end
    end
    object TabSheetDevis: TTabSheet
      Caption = 'Devis'
      ImageIndex = 6
      DesignSize = (
        760
        458)
      object SBConsultDevis: TSpeedButton
        Left = 0
        Top = 430
        Width = 72
        Height = 28
        Anchors = [akLeft, akBottom]
        Caption = 'Consulter'
        OnClick = SBConsultDevisClick
      end
      object SBImpDevis: TSpeedButton
        Left = 78
        Top = 430
        Width = 72
        Height = 28
        Anchors = [akLeft, akBottom]
        Caption = 'Imprimer'
        OnClick = SBImpDevisClick
      end
      object JvDBGridLig_prof: TJvDBGrid
        Left = 0
        Top = 0
        Width = 757
        Height = 425
        DataSource = DSLig_prof
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = SBConsultDevisClick
        TitleButtons = True
        OnTitleBtnDblClick = JvDBGridLig_profTitleBtnDblClick
        AlternateRowColor = clAliceblue
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'DATE_'
            Title.Caption = 'Date'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODDEV'
            Title.Caption = 'No devis'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODCLI'
            Title.Caption = 'Code client'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM'
            Title.Caption = 'Nom client'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIBELLE'
            Title.Caption = 'Libell'#233
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HEURE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'QTE'
            Title.Caption = 'Quantit'#233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POIDS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODTAR'
            Title.Caption = 'Tarif'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXHT'
            Title.Caption = 'Prix vte HT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRC_REMISE'
            Title.Caption = '% remise'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXNET'
            Title.Caption = 'Prix net'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXTTC'
            Title.Caption = 'Prix TTC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTHT'
            Title.Caption = 'Total HT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MT_TTC'
            Title.Caption = 'Total TTC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MT_REMISE'
            Title.Caption = 'Mont. remise'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_TVA'
            Title.Caption = 'Tx TVA'
            Visible = True
          end>
      end
    end
    object TabSheetCommandes: TTabSheet
      Caption = 'Commandes'
      ImageIndex = 7
      object Label29: TLabel
        Left = 510
        Top = 378
        Width = 116
        Height = 15
        Caption = 'Dernier prix de revient'
      end
      object Label30: TLabel
        Left = 510
        Top = 407
        Width = 106
        Height = 15
        Caption = 'Coef. prix de revient'
      end
      object Label31: TLabel
        Left = 510
        Top = 436
        Width = 131
        Height = 15
        Caption = 'Qt'#233' commande en cours'
      end
      object JvDBGridLigcde: TJvDBGrid
        Left = 3
        Top = 3
        Width = 754
        Height = 366
        DataSource = DSLigcde
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAliceblue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'NOCDE'
            Title.Caption = 'No Cmde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ETAT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODFOU'
            Title.Caption = 'Code Fournis.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REF_FOU'
            Title.Caption = 'Ref. fournis.'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATE_'
            Title.Caption = 'Date cmde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIBELLE'
            Title.Caption = 'Libelle'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'UV'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'QTE_UV'
            Title.Caption = 'Qte unit'#233' vte'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTE_UC'
            Title.Caption = 'Qte unit'#233' cmde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PX_UC'
            Title.Caption = 'Prix unite cmde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UC'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'QTE_UV_RC'
            Title.Caption = 'Qte UV recue'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTE_UC_RC'
            Title.Caption = 'Qte UC recue'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COEF_PR'
            Title.Caption = 'Coef. PR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COEF_PV'
            Title.Caption = 'Coef. PV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PX_REV'
            Title.Caption = 'Prix revient'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PX_VTE'
            Title.Caption = 'Prix vente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOREC'
            Title.Caption = 'Rang'
            Visible = True
          end>
      end
      object EditDerPxRev: TEdit
        Left = 647
        Top = 375
        Width = 81
        Height = 23
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 1
      end
      object EditCoefPR: TEdit
        Left = 647
        Top = 404
        Width = 81
        Height = 23
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 2
      end
      object EditQteCdeEnCours: TEdit
        Left = 647
        Top = 433
        Width = 81
        Height = 23
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 3
      end
    end
    object TabSheetAchats: TTabSheet
      Caption = 'Achats'
      ImageIndex = 8
      object JvDBGridAchats: TJvDBGrid
        Left = 3
        Top = 3
        Width = 754
        Height = 452
        DataSource = DSLigachjj
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAzure
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'CODACH'
            Title.Caption = 'No ACHAT'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFER'
            Title.Caption = 'REFERENCE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATE_'
            Title.Caption = 'DATE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODFOU'
            Title.Caption = 'FOURNIS.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODSSF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODFAM'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODDEP'
            Title.Caption = 'DEPOT'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTE'
            Title.Caption = 'QUANTITE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXHT'
            Title.Caption = 'PRIX HT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIXTTC'
            Title.Caption = 'PRIX TTC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTHT'
            Title.Caption = 'TOTAL HT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_TVA'
            Title.Caption = 'TX TVA'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MT_TVA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NO_TVA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'POIDS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOENR'
            Title.Caption = 'RANG'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DER_MODIF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TX_TSOC'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'MT_TSOC'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOENR_STO'
            Title.Caption = 'RANG STOCK'
            Width = 77
            Visible = True
          end>
      end
    end
    object TabSheetInfocompl: TTabSheet
      Caption = 'Infos. compl'#233'm.'
      ImageIndex = 9
      DesignSize = (
        760
        458)
      object JvDBGridArtinfocompl: TJvDBGrid
        Left = 3
        Top = 3
        Width = 530
        Height = 170
        DataSource = DSArtinfocompl
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAliceblue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codart'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'libelle'
            Title.Caption = 'libell'#233' compl. parent'
            Width = 197
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codinfo'
            Title.Caption = 'Code enfant'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'type_'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'id_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'type__1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'id_2'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'libelle_1'
            Title.Caption = 'Libell'#233' compl. enfant'
            Width = 213
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codinfo_1'
            Visible = False
          end>
      end
      object BtnSupprimerInfo: TBitBtn
        Left = 377
        Top = 179
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Supprimer'
        TabOrder = 1
        OnClick = BtnSupprimerInfoClick
      end
      object BtnAjouterInfo: TBitBtn
        Left = 458
        Top = 179
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Ajouter'
        TabOrder = 2
        OnClick = BtnAjouterInfoClick
      end
    end
    object TabSheetImage: TTabSheet
      Caption = 'Image / Pi'#232'ces jointes'
      ImageIndex = 10
      object Label32: TLabel
        Left = 24
        Top = 24
        Width = 173
        Height = 15
        Caption = 'Image (chemin du fichier image)'
        FocusControl = DBImage
      end
      object ImageLogo: TImage
        Left = 24
        Top = 69
        Width = 200
        Height = 200
        Proportional = True
        Stretch = True
      end
      object SpeedButton1: TSpeedButton
        Left = 632
        Top = 40
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object DBImage: TDBEdit
        Left = 24
        Top = 40
        Width = 604
        Height = 23
        DataField = 'IMAGE'
        DataSource = DSArticle
        TabOrder = 0
        OnChange = DBImageChange
      end
    end
  end
  object Panel2: TPanel
    Left = 782
    Top = 0
    Width = 202
    Height = 597
    Align = alRight
    TabOrder = 6
    DesignSize = (
      202
      597)
    object Label17: TLabel
      Left = 5
      Top = 225
      Width = 46
      Height = 15
      Caption = 'Quantit'#233
      FocusControl = DBEdit8
    end
    object Label18: TLabel
      Left = 5
      Top = 255
      Width = 72
      Height = 15
      Caption = 'Qt'#233' minimale'
      FocusControl = DBEdit9
    end
    object Label19: TLabel
      Left = 5
      Top = 284
      Width = 106
      Height = 15
      Caption = 'Px rev moy pond'#233'r'#233
      FocusControl = DBPMP
    end
    object Label20: TLabel
      Left = 5
      Top = 313
      Width = 62
      Height = 15
      Caption = 'Prix d'#39'achat'
      FocusControl = DBEdit11
    end
    object Label21: TLabel
      Left = 5
      Top = 342
      Width = 47
      Height = 15
      Caption = 'Marge %'
      FocusControl = DBEdit11
    end
    object Label22: TLabel
      Left = 5
      Top = 371
      Width = 84
      Height = 15
      Caption = 'Taux de marque'
      FocusControl = DBEdit11
    end
    object Label23: TLabel
      Left = 5
      Top = 400
      Width = 34
      Height = 15
      Caption = 'Marge'
      FocusControl = DBEdit11
    end
    object Label24: TLabel
      Left = 5
      Top = 429
      Width = 86
      Height = 15
      Caption = 'Prix de vente HT'
      FocusControl = DBPrixvte
    end
    object Label25: TLabel
      Left = 5
      Top = 458
      Width = 87
      Height = 15
      Caption = 'Px vte d'#233'tail PPT'
      FocusControl = DBEdit10
    end
    object Label26: TLabel
      Left = 5
      Top = 514
      Width = 103
      Height = 15
      Caption = 'Prix limite vente HT'
      FocusControl = DBEdit12
    end
    object Label27: TLabel
      Left = 5
      Top = 543
      Width = 90
      Height = 15
      Caption = 'Prix de vente TTC'
      FocusControl = DBPrixvte
    end
    object Panel1: TPanel
      Left = 104
      Top = 0
      Width = 98
      Height = 81
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 0
      object BtnValider: TBitBtn
        Left = 0
        Top = 0
        Width = 98
        Height = 27
        Align = alTop
        Anchors = [akTop]
        Caption = '&Valider'
        Default = True
        TabOrder = 0
        OnClick = BtnValiderClick
      end
      object BtnAnnuler: TBitBtn
        Left = 0
        Top = 27
        Width = 98
        Height = 27
        Align = alClient
        Cancel = True
        Caption = '&Annuler'
        ModalResult = 2
        TabOrder = 1
      end
      object BtnAide: TBitBtn
        Left = 0
        Top = 54
        Width = 98
        Height = 27
        Align = alBottom
        Anchors = [akBottom]
        Caption = 'Aide'
        TabOrder = 2
        OnClick = BtnAideClick
      end
    end
    object DBGridStodep: TDBGrid
      Left = 0
      Top = 87
      Width = 200
      Height = 103
      DataSource = DSStodep
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGridStodepCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODART'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODDEP'
          Title.Caption = 'D'#233'pot'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTE'
          ReadOnly = True
          Title.Caption = 'Quantit'#233
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PMP'
          ReadOnly = True
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAPPORT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CONDIT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODFOU'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'POIDS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DER_MODIF'
          Visible = False
        end>
    end
    object DBCheckBoxG_Sto: TDBCheckBox
      Left = 5
      Top = 37
      Width = 69
      Height = 44
      Caption = 'G'#233'r'#233' en '#13#10'stock'
      DataField = 'G_STO'
      DataSource = DSArticle
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBCheckBoxG_StoClick
    end
    object DBCheckBox2: TDBCheckBox
      Left = 5
      Top = 196
      Width = 193
      Height = 21
      Caption = 'Non remisable en facturation'
      DataField = 'PREST'
      DataSource = DSArticle
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBCheckBoxG_StoClick
    end
    object DBEdit8: TDBEdit
      Left = 128
      Top = 223
      Width = 68
      Height = 23
      Color = clBtnFace
      DataField = 'QTE'
      DataSource = DSArticle
      ReadOnly = True
      TabOrder = 4
      StyleElements = [seFont, seBorder]
    end
    object DBEdit9: TDBEdit
      Left = 128
      Top = 252
      Width = 68
      Height = 23
      DataField = 'QTEMIN'
      DataSource = DSArticle
      TabOrder = 5
    end
    object DBPMP: TDBEdit
      Left = 128
      Top = 281
      Width = 68
      Height = 23
      Color = clBtnFace
      DataField = 'PMP'
      DataSource = DSArticle
      ReadOnly = True
      TabOrder = 6
      StyleElements = [seFont, seBorder]
    end
    object DBEdit11: TDBEdit
      Left = 128
      Top = 310
      Width = 68
      Height = 23
      DataField = 'PRIXACH'
      DataSource = DSArticle
      TabOrder = 7
    end
    object EditPrc_marge: TEdit
      Left = 128
      Top = 339
      Width = 68
      Height = 23
      Alignment = taRightJustify
      TabOrder = 8
      OnExit = EditPrc_margeExit
    end
    object EditTx_marque: TEdit
      Left = 128
      Top = 368
      Width = 68
      Height = 23
      Alignment = taRightJustify
      TabOrder = 9
      OnExit = EditTx_marqueExit
    end
    object EditMarge: TEdit
      Left = 128
      Top = 397
      Width = 68
      Height = 23
      Alignment = taRightJustify
      Color = clBtnFace
      Ctl3D = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 10
      StyleElements = [seFont, seBorder]
    end
    object DBPrixvte: TDBEdit
      Left = 128
      Top = 426
      Width = 68
      Height = 23
      DataField = 'PRIXVTE'
      DataSource = DSArticle
      TabOrder = 11
      OnExit = DBPrixvteExit
    end
    object DBEdit10: TDBEdit
      Left = 128
      Top = 455
      Width = 68
      Height = 23
      DataField = 'DET_PPT'
      DataSource = DSArticle
      TabOrder = 12
    end
    object DBCheckBox3: TDBCheckBox
      Left = 128
      Top = 484
      Width = 60
      Height = 21
      Caption = 'Libre'
      DataField = 'LIBRE_PPT'
      DataSource = DSArticle
      TabOrder = 13
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBCheckBoxG_StoClick
    end
    object DBEdit12: TDBEdit
      Left = 128
      Top = 511
      Width = 68
      Height = 23
      DataField = 'PXLVHT'
      DataSource = DSArticle
      TabOrder = 14
    end
    object EditPRIXTTC: TEdit
      Left = 128
      Top = 540
      Width = 68
      Height = 23
      Alignment = taRightJustify
      TabOrder = 15
      OnExit = EditPRIXTTCExit
    end
    object DBCheckBoxFerme: TDBCheckBox
      Left = 5
      Top = 11
      Width = 69
      Height = 17
      Caption = 'Ferm'#233
      DataField = 'FERME'
      DataSource = DSArticle
      TabOrder = 16
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object DSArticle: TDataSource
    DataSet = DM_Olivier.FDQueryArticle
    Left = 712
    Top = 8
  end
  object FDQueryTVA: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from parame where type_='#39'V'#39' ')
    Left = 40
    Top = 344
  end
  object DSTVA: TDataSource
    DataSet = FDQueryTVA
    Left = 104
    Top = 344
  end
  object FDQueryDepart: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from depart')
    Left = 172
    Top = 346
  end
  object DSDepart: TDataSource
    DataSet = FDQueryDepart
    Left = 244
    Top = 346
  end
  object FDQueryFamille: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from famille')
    Left = 300
    Top = 346
  end
  object DSFamille: TDataSource
    DataSet = FDQueryFamille
    Left = 372
    Top = 346
  end
  object FDQuerySousFam: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from sousfam')
    Left = 428
    Top = 346
  end
  object DSSousfam: TDataSource
    DataSet = FDQuerySousFam
    Left = 492
    Top = 346
  end
  object FDQueryFournis: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from fournis')
    Left = 540
    Top = 346
  end
  object DSFournis: TDataSource
    DataSet = FDQueryFournis
    Left = 596
    Top = 346
  end
  object FDQueryActivite: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from activite')
    Left = 644
    Top = 346
  end
  object DSActivite: TDataSource
    DataSet = FDQueryActivite
    Left = 708
    Top = 346
  end
  object FDQueryStodep: TFDQuery
    BeforePost = FDQueryStodepBeforePost
    OnNewRecord = FDQueryStodepNewRecord
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from stodep where codart = :CODART')
    Left = 486
    Top = 408
    ParamData = <
      item
        Name = 'CODART'
        DataType = ftString
        ParamType = ptInput
        Size = 13
        Value = Null
      end>
  end
  object DSStodep: TDataSource
    DataSet = FDQueryStodep
    Left = 550
    Top = 408
  end
  object FDQueryStock: TFDQuery
    AfterScroll = FDQueryStockAfterScroll
    MasterSource = DSStodep
    MasterFields = 'CODART;CODDEP'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select * from stock where codart = :codart and coddep = :coddep ' +
        'order by DATE_, noenr ')
    Left = 36
    Top = 418
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end
      item
        Name = 'CODDEP'
        ParamType = ptInput
      end>
    object FDQueryStockCODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      Size = 13
    end
    object FDQueryStockDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryStockANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQueryStockMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQueryStockTYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQueryStockQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      DisplayFormat = '#,##0.000'
      Precision = 9
      Size = 3
    end
    object FDQueryStockUNIT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'UNIT'
      Origin = 'UNIT'
    end
    object FDQueryStockVALUNIT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALUNIT'
      Origin = 'VALUNIT'
      DisplayFormat = '#,##0.00'
      Precision = 11
      Size = 2
    end
    object FDQueryStockPRIXVTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXVTE'
      Origin = 'PRIXVTE'
      Precision = 9
      Size = 2
    end
    object FDQueryStockPRIXVTE_UNIT: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXVTE_UNIT'
      Origin = 'PRIXVTE_UNIT'
    end
    object FDQueryStockCODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryStockCENTRA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CENTRA'
      Origin = 'CENTRA'
      Size = 1
    end
    object FDQueryStockLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryStockCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQueryStockNOENR: TFDAutoIncField
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQueryStockPOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      Precision = 9
      Size = 3
    end
    object FDQueryStockDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryStockTIME: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'TIME'
      Origin = '`TIME`'
    end
    object FDQueryStockCODFAC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
    end
  end
  object DStock: TDataSource
    DataSet = FDQueryStock
    Left = 108
    Top = 418
  end
  object FDQueryTarifart: TFDQuery
    OnCalcFields = FDQueryTarifartCalcFields
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from tarifart where tarifart.codart=:codart')
    Left = 180
    Top = 418
    ParamData = <
      item
        Name = 'CODART'
        DataType = ftString
        ParamType = ptInput
        Size = 13
        Value = Null
      end>
    object FDQueryTarifartCODTAR: TStringField
      FieldName = 'CODTAR'
      Origin = 'CODTAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object FDQueryTarifartCODART: TStringField
      FieldName = 'CODART'
      Origin = 'CODART'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object FDQueryTarifartPRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      Precision = 10
      Size = 2
    end
    object FDQueryTarifartCOM_PR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COM_PR'
      Origin = 'COM_PR'
      Precision = 7
      Size = 2
    end
    object FDQueryTarifartDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryTarifartcodtar_tarif: TStringField
      DisplayLabel = 'TARIF'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'codtar_tarif'
      LookupDataSet = DMGesCloud.ReqTarif
      LookupKeyFields = 'CODTAR'
      LookupResultField = 'LIBELLE'
      KeyFields = 'CODTAR'
      Size = 30
      Lookup = True
    end
  end
  object DSTarifart: TDataSource
    DataSet = FDQueryTarifart
    Left = 252
    Top = 410
  end
  object FDQueryPromo: TFDQuery
    BeforePost = FDQueryPromoBeforePost
    OnNewRecord = FDQueryPromoNewRecord
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from promo where codart=:codart')
    Left = 316
    Top = 418
    ParamData = <
      item
        Name = 'CODART'
        DataType = ftString
        ParamType = ptInput
        Size = 13
        Value = Null
      end>
  end
  object DSPromo: TDataSource
    DataSet = FDQueryPromo
    Left = 388
    Top = 418
  end
  object FDQueryCodbar: TFDQuery
    AfterScroll = FDQueryCodbarAfterScroll
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select *'
      'from codbar '
      'where codart=:codart')
    Left = 184
    Top = 488
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
    object FDQueryCodbarCODBAR: TStringField
      FieldName = 'CODBAR'
      Origin = 'CODBAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object FDQueryCodbarCODART: TStringField
      FieldName = 'CODART'
      Origin = 'CODART'
      Required = True
      Visible = False
      Size = 13
    end
    object FDQueryCodbarTYPE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE'
      Origin = '`TYPE`'
      Size = 1
    end
    object FDQueryCodbarPRIXVTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXVTE'
      Origin = 'PRIXVTE'
      Visible = False
    end
    object FDQueryCodbarDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
      Visible = False
    end
  end
  object DSCodbar: TDataSource
    DataSet = FDQueryCodbar
    Left = 268
    Top = 482
  end
  object FDQueryCa_art: TFDQuery
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ca_art where codart=:codart')
    Left = 332
    Top = 474
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
        Value = Null
      end>
  end
  object DSCa_art: TDataSource
    DataSet = FDQueryCa_art
    Left = 428
    Top = 474
  end
  object FDQueryLigvteaa: TFDQuery
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select * from ligvteaa, entvteaa where codart=:codart and entvte' +
        'aa.codfac=ligvteaa.codfac')
    Left = 500
    Top = 466
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
  end
  object DSLigvteaa: TDataSource
    DataSet = FDQueryLigvteaa
    Left = 572
    Top = 466
  end
  object FDQueryLig_prof: TFDQuery
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select * from lig_prof, client where codart=:codart and client.c' +
        'odcli=lig_prof.codcli')
    Left = 644
    Top = 410
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
  end
  object DSLig_prof: TDataSource
    DataSet = FDQueryLig_prof
    Left = 716
    Top = 434
  end
  object FDQueryLigcde: TFDQuery
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ligcde where codart=:codart')
    Left = 36
    Top = 490
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
  end
  object DSLigcde: TDataSource
    DataSet = FDQueryLigcde
    Left = 100
    Top = 482
  end
  object FDQueryLigachjj: TFDQuery
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ligachjj where codart=:codart')
    Left = 644
    Top = 466
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
  end
  object DSLigachjj: TDataSource
    DataSet = FDQueryLigachjj
    Left = 700
    Top = 474
  end
  object FDQueryArtinfocompl: TFDQuery
    MasterSource = DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from artinfocompl,parinfocompl,codinfocompl'
      'where artinfocompl.codart=:codart'
      'AND (parinfocompl.id=artinfocompl.id and parinfocompl.type_='#39'A'#39')'
      
        'AND (codinfocompl.codinfo=artinfocompl.codinfo and codinfocompl.' +
        'type_='#39'A'#39') ')
    Left = 316
    Top = 514
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
  end
  object DSArtinfocompl: TDataSource
    DataSet = FDQueryArtinfocompl
    Left = 364
    Top = 530
  end
  object OpenDialog1: TOpenDialog
    Left = 660
    Top = 266
  end
  object FDQueryFacture: TFDQuery
    MasterSource = DSLigvteaa
    MasterFields = 'CODFAC'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT '
      '  -- Donn'#233'es de l'#39'en-t'#234'te (vont se r'#233'p'#233'ter sur chaque ligne SQL)'
      '*'
      'FROM entvteaa e'
      'JOIN Client c ON e.CODCLI = c.CODCLI'
      'JOIN ligvteaa l ON e.CODFAC = l.CODFAC'
      'WHERE e.CODFAC = :CODFAC'
      
        'ORDER BY e.CODFAC ASC, l.NOENRF ASC -- Le tri obligatoire pour l' +
        'a rupture'
      '')
    Left = 136
    Top = 176
    ParamData = <
      item
        Name = 'CODFAC'
        ParamType = ptInput
      end>
    object FDQueryFactureOBSERV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      Size = 1000
    end
    object FDQueryFactureCODFAC: TLargeintField
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryFactureCODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQueryFactureCODCAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object FDQueryFactureCODDEV: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
    end
    object FDQueryFactureCODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryFactureCODVEN: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODVEN'
      Origin = 'CODVEN'
    end
    object FDQueryFactureNOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      Size = 50
    end
    object FDQueryFactureNOTAHITI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI'
      Origin = 'NOTAHITI'
      Size = 10
    end
    object FDQueryFactureTYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQueryFactureEXO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA'
      Origin = 'EXO_TVA'
    end
    object FDQueryFactureANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQueryFactureMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQueryFactureDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryFactureHEURE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'HEURE'
      Origin = 'HEURE'
    end
    object FDQueryFactureMT_REMISE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object FDQueryFacturePRC_REMISE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object FDQueryFactureTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureMT_TTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryFactureMT_HT0: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT0'
      Origin = 'MT_HT0'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureMT_HT1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT1'
      Origin = 'MT_HT1'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureMT_HT2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT2'
      Origin = 'MT_HT2'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureMT_HT3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT3'
      Origin = 'MT_HT3'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureMT_TVA1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA1'
      Origin = 'MT_TVA1'
      Precision = 9
      Size = 2
    end
    object FDQueryFactureMT_TVA2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA2'
      Origin = 'MT_TVA2'
      Precision = 9
      Size = 2
    end
    object FDQueryFactureMT_TVA3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA3'
      Origin = 'MT_TVA3'
      Precision = 9
      Size = 2
    end
    object FDQueryFactureMT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object FDQueryFactureMARGE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object FDQueryFactureREFERENCE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 15
    end
    object FDQueryFactureCODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQueryFactureNO_SEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object FDQueryFactureNO_JOUR: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object FDQueryFactureCODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQueryFactureJRSCRD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object FDQueryFactureFIN_MOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS'
      Origin = 'FIN_MOIS'
    end
    object FDQueryFactureLIBREG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBREG'
      Origin = 'LIBREG'
      Size = 50
    end
    object FDQueryFactureCRD_FORCE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CRD_FORCE'
      Origin = 'CRD_FORCE'
    end
    object FDQueryFactureDATE_ECH: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_ECH'
      Origin = 'DATE_ECH'
    end
    object FDQueryFactureREGL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REGL'
      Origin = 'REGL'
    end
    object FDQueryFactureDATE_OPER: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_OPER'
      Origin = 'DATE_OPER'
    end
    object FDQueryFactureDATE_COMPTA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_COMPTA'
      Origin = 'DATE_COMPTA'
    end
    object FDQueryFactureACOMPTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ACOMPTE'
      Origin = 'ACOMPTE'
    end
    object FDQueryFactureCODGEO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO'
      Origin = 'CODGEO'
      Size = 1
    end
    object FDQueryFactureFLAG_TAX: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX'
      Origin = 'FLAG_TAX'
    end
    object FDQueryFactureSELECT_: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
    end
    object FDQueryFactureDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryFactureCODADM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODADM'
      Origin = 'CODADM'
    end
    object FDQueryFactureNOMVEN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMVEN'
      Origin = 'NOMVEN'
      Size = 30
    end
    object FDQueryFactureMT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
    object FDQueryFactureMT_HTSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTSOC'
      Origin = 'MT_HTSOC'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureTX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object FDQueryFactureEXO_CPS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS'
      Origin = 'EXO_CPS'
    end
    object FDQueryFactureMT_TVAI: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVAI'
      Origin = 'MT_TVAI'
      Precision = 9
      Size = 2
    end
    object FDQueryFactureMT_HTI: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTI'
      Origin = 'MT_HTI'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureTVA_ILES: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES'
      Origin = 'TVA_ILES'
    end
    object FDQueryFactureOBSERV_1: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV_1'
      Origin = 'OBSERV'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object FDQueryFactureCODCLI_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI_1'
      Origin = 'CODCLI'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCPTAUX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPTAUX'
      Origin = 'CPTAUX'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryFactureNOM_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_1'
      Origin = 'NOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryFactureCODREP_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP_1'
      Origin = 'CODREP'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFacturePRC_REMISE_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE_1'
      Origin = 'PRC_REMISE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureNOTEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTEL'
      Origin = 'NOTEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FDQueryFactureNOTAHITI_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI_1'
      Origin = 'NOTAHITI'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FDQueryFactureNOFAX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOFAX'
      Origin = 'NOFAX'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FDQueryFactureJRSCRD_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD_1'
      Origin = 'JRSCRD'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCREDIT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureplaf_crd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'plaf_crd'
      Origin = 'plaf_crd'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODPAI_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI_1'
      Origin = 'CODPAI'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object FDQueryFactureFIN_MOIS_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS_1'
      Origin = 'FIN_MOIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureNB_EX: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NB_EX'
      Origin = 'NB_EX'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCAAN: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CAAN'
      Origin = 'CAAN'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAD1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD1'
      Origin = 'AD1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryFactureAD2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD2'
      Origin = 'AD2'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryFactureAD3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD3'
      Origin = 'AD3'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryFactureCUM_MVT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CUM_MVT'
      Origin = 'CUM_MVT'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureMT_CPTA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_CPTA'
      Origin = 'MT_CPTA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureEXO_TVA_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA_1'
      Origin = 'EXO_TVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureBLOQUE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'BLOQUE'
      Origin = 'BLOQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODGEO_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO_1'
      Origin = 'CODGEO'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryFactureCODTAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR'
      Origin = 'CODTAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryFactureADM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ADM'
      Origin = 'ADM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureFLAG_TAX_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX_1'
      Origin = 'FLAG_TAX'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODFAC_ADM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC_ADM'
      Origin = 'CODFAC_ADM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureFERME: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FERME'
      Origin = 'FERME'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureDER_MODIF_1: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF_1'
      Origin = 'DER_MODIF'
    end
    object FDQueryFactureSPEC_GOUV: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SPEC_GOUV'
      Origin = 'SPEC_GOUV'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureNOGSM: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NOGSM'
      Origin = 'NOGSM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFacturePLV: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PLV'
      Origin = 'PLV'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureINTIT_BQ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INTIT_BQ'
      Origin = 'INTIT_BQ'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryFactureCODE_BQ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODE_BQ'
      Origin = 'CODE_BQ'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object FDQueryFactureCODE_GUI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODE_GUI'
      Origin = 'CODE_GUI'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object FDQueryFactureNOCPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOCPT'
      Origin = 'NOCPT'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object FDQueryFactureCLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLE'
      Origin = 'CLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object FDQueryFactureCOEF_MAJ_PR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COEF_MAJ_PR'
      Origin = 'COEF_MAJ_PR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureEXO_CPS_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS_1'
      Origin = 'EXO_CPS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFacturePAS_REM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PAS_REM'
      Origin = 'PAS_REM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureREM_FAM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REM_FAM'
      Origin = 'REM_FAM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureRELEVE_EMAIL: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'RELEVE_EMAIL'
      Origin = 'RELEVE_EMAIL'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureSELECT__1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT__1'
      Origin = 'SELECT_'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAPP_TARIFCLI: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'APP_TARIFCLI'
      Origin = 'APP_TARIFCLI'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureTVA_ILES_1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES_1'
      Origin = 'TVA_ILES'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureLIBELLE: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object FDQueryFactureCODFAC_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC_1'
      Origin = 'CODFAC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODCLI_2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI_2'
      Origin = 'CODCLI'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODCAI_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI_1'
      Origin = 'CODCAI'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object FDQueryFactureCODDEV_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV_1'
      Origin = 'CODDEV'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODDEP_1: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP_1'
      Origin = 'CODDEP'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODVEN_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODVEN_1'
      Origin = 'CODVEN'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureNOENR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureANNEE_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE_1'
      Origin = 'ANNEE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureMOIS_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS_1'
      Origin = 'MOIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureDATE__1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE__1'
      Origin = 'DATE_'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureHEURE_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'HEURE_1'
      Origin = 'HEURE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODREP_2: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP_2'
      Origin = 'CODREP'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
    object FDQueryFactureCODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      ProviderFlags = []
      ReadOnly = True
      Size = 6
    end
    object FDQueryFactureCODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object FDQueryFactureCODDPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODDPT'
      Origin = 'CODDPT'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryFactureTYPE__1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE__1'
      Origin = 'TYPE_'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryFactureCODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryFactureCODBAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODBAR'
      Origin = 'CODBAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryFactureQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 3
    end
    object FDQueryFacturePOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 7
      Size = 3
    end
    object FDQueryFactureCODTAR_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR_1'
      Origin = 'CODTAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryFacturePRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryFacturePRIXTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXTTC'
      Origin = 'PRIXTTC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFacturePRIXNET: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXNET'
      Origin = 'PRIXNET'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryFactureTOTHT_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT_1'
      Origin = 'TOTHT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryFactureMT_TTC_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC_1'
      Origin = 'MT_TTC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFacturePRC_REMISE_2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE_2'
      Origin = 'PRC_REMISE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureMT_REMISE_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE_1'
      Origin = 'MT_REMISE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureTX_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TVA'
      Origin = 'TX_TVA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureMT_TVA_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA_1'
      Origin = 'MT_TVA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object FDQueryFactureNO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_TVA'
      Origin = 'NO_TVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFacturePRIXREV: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXREV'
      Origin = 'PRIXREV'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryFactureMARGE_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE_1'
      Origin = 'MARGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureNO_SEM_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM_1'
      Origin = 'NO_SEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureNO_JOUR_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR_1'
      Origin = 'NO_JOUR'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureDATE_OPER_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_OPER_1'
      Origin = 'DATE_OPER'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureDATE_COMPTA_1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_COMPTA_1'
      Origin = 'DATE_COMPTA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureDET_PPT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_PPT'
      Origin = 'DET_PPT'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureDET_ILE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_ILE'
      Origin = 'DET_ILE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureSELECT__2: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT__2'
      Origin = 'SELECT_'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureNOENRF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENRF'
      Origin = 'NOENRF'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFacturePXLVTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PXLVTTC'
      Origin = 'PXLVTTC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureDER_MODIF_2: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF_2'
      Origin = 'DER_MODIF'
    end
    object FDQueryFactureTX_TSOC_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC_1'
      Origin = 'TX_TSOC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureMT_TSOC_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC_1'
      Origin = 'MT_TSOC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 2
    end
  end
  object FDQueryTVAFacture: TFDQuery
    MasterSource = DSLigvteaa
    MasterFields = 'CODFAC'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        '-- 1. Taux Exon'#233'r'#233' (TVA0) -> On utilise une sous-requ'#234'te * 0 pou' +
        'r forcer le type FMTBcd'
      'SELECT 0 as NoTVA,'
      '  (SELECT libelle FROM parame WHERE code = '#39'TVA0'#39') AS Libelle,'
      
        '  (SELECT taux FROM par_effet WHERE code = '#39'TVA0'#39' AND ep.date_ B' +
        'ETWEEN dat_deb AND dat_fin) AS Taux, '
      '  mt_ht0 AS BaseHT, '
      '  0.00 AS MontantTVA '
      'FROM entvteaa ep'
      'WHERE ep.CODFAC = :CODFAC AND ep.mt_ht0 <> 0'
      ''
      'UNION ALL'
      ''
      '-- 2. Zone 1 (TVA1)'
      'SELECT 1 as NoTVA,'
      '  (SELECT libelle FROM parame WHERE code = '#39'TVA1'#39') AS Libelle,'
      
        '  (SELECT taux FROM par_effet WHERE code = '#39'TVA1'#39' AND ep.date_ B' +
        'ETWEEN dat_deb AND dat_fin) AS Taux, '
      '  mt_ht1 AS BaseHT, '
      '  mt_tva1 AS MontantTVA '
      'FROM entvteaa ep'
      'WHERE ep.CODFAC = :CODFAC AND ep.mt_ht1 <> 0'
      ''
      'UNION ALL'
      ''
      '-- 3. Zone 2 (TVA2)'
      'SELECT 2 as NoTVA,'
      '  (SELECT libelle FROM parame WHERE code = '#39'TVA2'#39') AS Libelle,'
      
        '  (SELECT taux FROM par_effet WHERE code = '#39'TVA2'#39' AND ep.date_ B' +
        'ETWEEN dat_deb AND dat_fin) AS Taux, '
      '  mt_ht2 AS BaseHT, '
      '  mt_tva2 AS MontantTVA '
      'FROM entvteaa ep'
      'WHERE ep.CODFAC = :CODFAC AND ep.mt_ht2 <> 0'
      ''
      'UNION ALL'
      ''
      '-- 4. Zone 3 (TVA3)'
      'SELECT 3 as NoTVA,'
      '  (SELECT libelle FROM parame WHERE code = '#39'TVA3'#39') AS Libelle,'
      
        '  (SELECT taux FROM par_effet WHERE code = '#39'TVA3'#39' AND ep.date_ B' +
        'ETWEEN dat_deb AND dat_fin) AS Taux, '
      '  mt_ht3 AS BaseHT, '
      '  mt_tva3 AS MontantTVA '
      'FROM entvteaa ep'
      'WHERE ep.CODFAC = :CODFAC AND ep.mt_ht3 <> 0'
      ''
      'UNION ALL'
      ''
      '-- 5. Zone Interm'#233'diaire / '#206'les (TVAI)'
      'SELECT 4 as NoTVA, '
      '  (SELECT libelle FROM parame WHERE code = '#39'TVAI'#39') AS Libelle,'
      
        '  (SELECT taux FROM par_effet WHERE code = '#39'TVAI'#39' AND ep.date_ B' +
        'ETWEEN dat_deb AND dat_fin) AS Taux, '
      '  mt_hti AS BaseHT, '
      '  mt_tvai AS MontantTVA '
      'FROM entvteaa ep'
      'WHERE ep.CODFAC = :CODFAC AND ep.mt_hti <> 0'
      '')
    Left = 280
    Top = 176
    ParamData = <
      item
        Name = 'CODFAC'
        ParamType = ptInput
      end>
    object FDQueryTVANoTVA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NoTVA'
      Origin = 'NoTVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryTVALibelle: TStringField
      FieldName = 'Libelle'
      Size = 30
    end
    object FDQueryTVATaux: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Taux'
      Origin = 'Taux'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 5
    end
    object FDQueryTVABaseHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BaseHT'
      Origin = 'BaseHT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryTVAMontantTVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MontantTVA'
      Origin = 'MontantTVA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 2
    end
  end
  object FDQueryReglements: TFDQuery
    MasterSource = DSLigvteaa
    MasterFields = 'CODFAC'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from reglaa where codfac=:codfac')
    Left = 200
    Top = 208
    ParamData = <
      item
        Name = 'CODFAC'
        ParamType = ptInput
      end>
  end
  object frxReportFacture: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46280.575471794000000000
    ReportOptions.LastChange = 46287.654891192130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 416
    Top = 184
    Datasets = <
      item
        DataSet = frxDBDatasetTVA
        DataSetName = 'frxDBDatasetTVA'
      end
      item
        DataSet = frxDBDatasetFacture
        DataSetName = 'frxDBDatasetFacture'
      end
      item
        DataSet = frxDBDatasetReglements
        DataSetName = 'frxDBDatasetReglements'
      end>
    Variables = <
      item
        Name = ' Globales'
        Value = Null
      end
      item
        Name = 'VarNomEntreprise'
        Value = #39'Societe'#39
      end
      item
        Name = 'VarTelephone'
        Value = #39'87777600'#39
      end
      item
        Name = 'VarAdresse'
        Value = #39'Kauehi'#39
      end
      item
        Name = 'VarNoTAHITI'
        Value = #39'1234567899'#39
      end
      item
        Name = 'VarFAX'
        Value = #39'123456789'#39
      end
      item
        Name = 'VarEMAIL'
        Value = #39'contact@fai.com'#39
      end
      item
        Name = 'VarMEMO_FAC'
        Value = #39'memo fac'#39
      end
      item
        Name = 'VarRC'
        Value = #39'1000A'#39
      end
      item
        Name = 'VarRepres'
        Value = #39'Commercial'#39
      end
      item
        Name = 'VarRef_Bancaire'
        Value = Null
      end
      item
        Name = 'VarTotalAlpha'
        Value = Null
      end
      item
        Name = 'VarLogo'
        Value = ''
      end>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PageFacture: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 162.519606930000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        Child = frxReportFacture.Child1
        Condition = '<frxDBDatasetFacture."CODFAC">'
        ResetPageNumbers = True
        StartNewPage = True
        Stretched = True
        object MemofrxDBDataset1CODFAC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 37.795300000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'FACTURE No [frxDBDatasetFacture."CODFAC"] du [frxDBDatasetFactur' +
              'e."DATE_"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object MemofrxDBDataset1CODCLI: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 83.149660000000000000
          Width = 192.756030000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Frame.Typ = []
          Memo.UTF8W = (
            'Client: [frxDBDatasetFacture."CODCLI"]'
            'No TAHITI: [frxDBDatasetFacture."NOTAHITI"]')
          Formats = <
            item
            end
            item
            end>
        end
        object MemofrxDBDataset1NOM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 117.165430000000000000
          Width = 389.291590000000000000
          Height = 37.795300000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetFacture."NOM"]')
          ParentFont = False
        end
        object MemoVarNomEntreprise: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetReglements
          DataSetName = 'frxDBDatasetReglements'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[VarNomEntreprise]')
          ParentFont = False
        end
        object MemoVarAdresse: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[VarAdresse]')
        end
        object LogoEntreprise: TfrxPictureView
          AllowVectorExport = True
          Left = 642.520076410000000000
          Top = 7.559060390000000000
          Width = 102.047244090000000000
          Height = 102.047307860000000000
          Center = True
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object VarEMAIL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'email: [VarEMAIL]'
            'T'#233'l: [VarTelephone]'
            'Fax: [VarFAX]'
            'No RC: [VarRC]'
            'No TAHITI: [VarNoTAHITI]')
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object MemofrxDBDataset1REFERENCE_: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 60.472480000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Frame.Typ = []
          Memo.UTF8W = (
            'R'#233'f'#233'rence : [frxDBDatasetFacture."REFERENCE_"]')
        end
        object MemofrxDBDataset1OBSERV: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 86.929190000000000000
          Width = 336.378170000000000000
          Height = 68.031540000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Observations: [frxDBDatasetFacture."OBSERV"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 19.653543310000000000
        ParentFont = False
        Top = 287.244280000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetFacture
        DataSetName = 'frxDBDatasetFacture'
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object MemofrxDBDataset1CODART: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetFacture."CODART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1LIBELLE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[frxDBDatasetFacture."LIBELLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1QTE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.716760000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."QTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1PRIXHT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 374.409710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."PRIXHT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1PRC_REMISE_2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 438.661720000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDatasetFacture."PRC_REMISE_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1PRIXNET: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 484.016080000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."PRIXNET"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1TOTHT_1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 606.488560000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."TOTHT_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1MT_TTC_1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 670.874460000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."MT_TTC_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1PRIXTTC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 545.007874020000000000
          Width = 61.228346460000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."PRIXTTC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1NO_TVA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 738.897637795276000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetFacture."NO_TVA"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 236.330868980000000000
        Top = 411.968770000000000000
        Width = 755.906000000000000000
        PrintOnFirstPage = False
        PrintOnSinglePage = True
        object SubreportTVA: TfrxSubreport
          AllowVectorExport = True
          Left = 3.779530050000000000
          Top = 22.677180000000000000
          Width = 362.834876440000000000
          Height = 30.236234040000000000
          Page = frxReportFacture.PageTVA
          PrintOnParent = True
        end
        object VarMEMO_DEV: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 194.756038980000000000
          Width = 748.346940000000000000
          Height = 34.015770000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[VarMEMO_FAC]')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 155.779541450000000000
          Top = 4.000009210000000000
          Width = 41.574829780000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Taux')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 197.354372550000000000
          Top = 4.000009640000000000
          Width = 79.370126920000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Montant HT.')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 276.724499470000000000
          Top = 4.000009640000000000
          Width = 90.708720730000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Montant TVA')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 4.000008980000000000
          Width = 32.125984250000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TVA')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 36.015781740000000000
          Top = 4.000008980000000000
          Width = 120.188976380000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            'Libell'#233)
          ParentFont = False
        end
        object MemofrxDBDatasetDevisTOTHT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 30.574838980000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."TOTHT"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisPRC_REMISE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 11.338598980000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDatasetFacture."PRC_REMISE"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisMT_REMISE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 11.338598980000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDatasetFacture."MT_REMISE"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisMT_TVA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 49.031548980000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."MT_TVA"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisMT_TTC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 560.929500000000000000
          Top = 68.267788980000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetFacture
          DataSetName = 'frxDBDatasetFacture'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFacture."MT_TTC"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 11.338592520000000000
          Width = 75.590600730000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'Remise %')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 30.574840110000000000
          Width = 94.488281250000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'Total net HT')
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 49.031555170000000000
          Width = 94.488281250000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'Total taxes')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 68.267761230000000000
          Width = 86.929221250000000000
          Height = 18.897705080000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'Total TTC')
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Left = 461.102653540000000000
          Top = 3.779530000000000000
          Width = 222.992270730000000000
          Height = 90.708714040000000000
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object MemoVarRef_Bancaire: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 164.519798980000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[VarRef_Bancaire]')
        end
        object MemoVarTotalAlpha: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 138.063088980000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[VarTotalAlpha]')
          ParentFont = False
        end
        object SubreportReglements: TfrxSubreport
          AllowVectorExport = True
          Left = 3.779530820000000000
          Top = 94.944980230000000000
          Width = 298.582870730000000000
          Height = 34.015764040000000000
          Page = frxReportFacture.PageReglements
          PrintOnParent = True
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 76.047319210000000000
          Width = 68.031544550000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Date')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811073730000000000
          Top = 76.047319400000000000
          Width = 151.181200730000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Libell'#233' r'#232'glement')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992269320000000000
          Top = 76.047318980000000000
          Width = 79.370145990000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Montant')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 60.472629660000000000
        Top = 204.094620000000000000
        Width = 755.906000000000000000
        Stretched = True
        ToNRows = 0
        ToNRowsMode = rmCount
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Top = 30.236410880000000000
          Width = 755.905511811024000000
          Height = 30.236218780000000000
          Frame.Typ = []
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 739.118602820000000000
          Top = 30.236240000000000000
          Width = 16.629921259842500000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TVA ')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 545.007874020000000000
          Top = 30.236406640000000000
          Width = 61.606299210000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prix TTC')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 671.094955530000000000
          Top = 30.236410880000000000
          Width = 68.031510210000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total TTC')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 606.709050470000000000
          Top = 30.236400680000000000
          Width = 64.251980210000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total HT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 438.882201250000000000
          Top = 30.236403210000000000
          Width = 45.354330210000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            '% rem')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 317.937219380000000000
          Top = 30.236409160000000000
          Width = 56.692950730000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            'Qt'#233)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 374.630169380000000000
          Top = 30.236414220000000000
          Width = 64.252010730000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prix HT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 87.149653060000000000
          Top = 30.236403210000000000
          Width = 230.551330730000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            'D'#233'signation')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 0.220470050000000000
          Top = 30.236403210000000000
          Width = 86.929186440000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Code article')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 484.236521350000000000
          Top = 30.236411690000000000
          Width = 60.472511250000000000
          Height = 28.346456690000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prix net')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoVarRepres: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 3.779530000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Repr'#233'sentant: [VarRepres]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 755.906000000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 606.614173230000000000
          Top = 0.000002930000000012
          Width = 64.251968500000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetFacture."TOTHT_1">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 317.858267720000000000
          Width = 56.692913390000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetFacture."QTE">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236545180000000000
          Top = 0.000012309999999988
          Width = 90.708751250000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'Total HT. brut:')
          VAlign = vaCenter
        end
      end
    end
    object PageTVA: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 60.472480000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetTVA
        DataSetName = 'frxDBDatasetTVA'
        PrintIfDetailEmpty = True
        RowCount = 0
        object MemofrxDBDatasetTVATaux: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 152.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetTVA
          DataSetName = 'frxDBDatasetTVA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetTVA."Taux"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDatasetTVABaseHT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 193.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'BaseHT'
          DataSet = frxDBDatasetTVA
          DataSetName = 'frxDBDatasetTVA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetTVA."BaseHT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDatasetTVAMontantTVA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 272.944960000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'MontantTVA'
          DataSet = frxDBDatasetTVA
          DataSetName = 'frxDBDatasetTVA'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetTVA."MontantTVA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDatasetTVANoTVA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 32.125984250000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NoTVA'
          DataSet = frxDBDatasetTVA
          DataSetName = 'frxDBDatasetTVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetTVA."NoTVA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDatasetTVALibelle: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 32.125984250000000000
          Width = 120.188976380000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'Libelle'
          DataSet = frxDBDatasetTVA
          DataSetName = 'frxDBDatasetTVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Memo.UTF8W = (
            '[frxDBDatasetTVA."Libelle"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 5
        Frame.Typ = []
        Height = 18.897650200000000000
        Top = 18.897650000000000000
        Visible = False
        Width = 755.906000000000000000
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 152.000000100000000000
          Width = 41.574829780000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Taux')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 193.574831200000000000
          Top = 0.000000429999999999
          Width = 79.370126920000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Montant HT.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 272.944958120000000000
          Top = 0.000000429999999999
          Width = 90.708720730000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Montant TVA')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = -0.000011350000000000
          Top = -0.000000230000000000
          Width = 32.125984250000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TVA')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 32.236240390000000000
          Top = -0.000000230000000000
          Width = 120.188976380000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            'Libell'#233)
          ParentFont = False
        end
      end
    end
    object PageReglements: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 20.787401574803150000
        Top = 64.252010000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetReglements
        DataSetName = 'frxDBDatasetReglements'
        RowCount = 0
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000001630000000000
          Top = 0.000000809999999997
          Width = 68.031540730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetReglements
          DataSetName = 'frxDBDatasetReglements'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetReglements."DATE_"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031536490000000000
          Width = 151.181200730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetReglements
          DataSetName = 'frxDBDatasetReglements'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[frxDBDatasetReglements."LIBELLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212748150000000000
          Top = 0.000000809999999997
          Width = 79.370130730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetReglements
          DataSetName = 'frxDBDatasetReglements'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetReglements."MONTANT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Visible = False
        Width = 755.906000000000000000
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = -0.000000470000000000
          Width = 68.031544550000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Date')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031543260000000000
          Top = 0.000000190000000001
          Width = 151.181200730000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Libell'#233' r'#232'glement')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212738850000000000
          Top = -0.000000230000000000
          Width = 79.370145990000000000
          Height = 18.897649770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Montant')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetFacture: TfrxDBDataset
    UserName = 'frxDBDatasetFacture'
    CloseDataSource = False
    DataSet = FDQueryFacture
    BCDToCurrency = False
    DataSetOptions = []
    Left = 504
    Top = 192
    FieldDefs = <
      item
        FieldName = 'OBSERV'
        FieldType = fftString
        Size = 1000
      end
      item
        FieldName = 'CODFAC'
      end
      item
        FieldName = 'CODCLI'
      end
      item
        FieldName = 'CODCAI'
        FieldType = fftString
      end
      item
        FieldName = 'CODDEV'
      end
      item
        FieldName = 'CODDEP'
      end
      item
        FieldName = 'CODVEN'
      end
      item
        FieldName = 'NOM'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'NOTAHITI'
        FieldType = fftString
      end
      item
        FieldName = 'TYPE_'
        FieldType = fftString
      end
      item
        FieldName = 'EXO_TVA'
      end
      item
        FieldName = 'ANNEE'
      end
      item
        FieldName = 'MOIS'
      end
      item
        FieldName = 'DATE_'
        FieldType = fftDateTime
      end
      item
        FieldName = 'HEURE'
      end
      item
        FieldName = 'MT_REMISE'
      end
      item
        FieldName = 'PRC_REMISE'
      end
      item
        FieldName = 'TOTHT'
      end
      item
        FieldName = 'MT_TTC'
      end
      item
        FieldName = 'MT_HT0'
      end
      item
        FieldName = 'MT_HT1'
      end
      item
        FieldName = 'MT_HT2'
      end
      item
        FieldName = 'MT_HT3'
      end
      item
        FieldName = 'MT_TVA1'
      end
      item
        FieldName = 'MT_TVA2'
      end
      item
        FieldName = 'MT_TVA3'
      end
      item
        FieldName = 'MT_TVA'
      end
      item
        FieldName = 'MARGE'
      end
      item
        FieldName = 'REFERENCE_'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'CODREP'
      end
      item
        FieldName = 'NO_SEM'
      end
      item
        FieldName = 'NO_JOUR'
      end
      item
        FieldName = 'CODPAI'
        FieldType = fftString
      end
      item
        FieldName = 'JRSCRD'
      end
      item
        FieldName = 'FIN_MOIS'
      end
      item
        FieldName = 'LIBREG'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'CRD_FORCE'
      end
      item
        FieldName = 'DATE_ECH'
        FieldType = fftDateTime
      end
      item
        FieldName = 'REGL'
      end
      item
        FieldName = 'DATE_OPER'
        FieldType = fftDateTime
      end
      item
        FieldName = 'DATE_COMPTA'
        FieldType = fftDateTime
      end
      item
        FieldName = 'ACOMPTE'
      end
      item
        FieldName = 'CODGEO'
        FieldType = fftString
      end
      item
        FieldName = 'FLAG_TAX'
      end
      item
        FieldName = 'SELECT_'
      end
      item
        FieldName = 'DER_MODIF'
      end
      item
        FieldName = 'CODADM'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'NOMVEN'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'MT_TSOC'
      end
      item
        FieldName = 'MT_HTSOC'
      end
      item
        FieldName = 'TX_TSOC'
      end
      item
        FieldName = 'EXO_CPS'
      end
      item
        FieldName = 'MT_TVAI'
      end
      item
        FieldName = 'MT_HTI'
      end
      item
        FieldName = 'TVA_ILES'
        FieldType = fftBoolean
      end
      item
        FieldName = 'OBSERV_1'
        FieldType = fftString
      end
      item
        FieldName = 'CODCLI_1'
      end
      item
        FieldName = 'CPTAUX'
        FieldType = fftString
        Size = 13
      end
      item
        FieldName = 'NOM_1'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'CODREP_1'
      end
      item
        FieldName = 'PRC_REMISE_1'
      end
      item
        FieldName = 'NOTEL'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'NOTAHITI_1'
        FieldType = fftString
      end
      item
        FieldName = 'NOFAX'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'JRSCRD_1'
      end
      item
        FieldName = 'CREDIT'
      end
      item
        FieldName = 'plaf_crd'
      end
      item
        FieldName = 'CODPAI_1'
        FieldType = fftString
      end
      item
        FieldName = 'FIN_MOIS_1'
      end
      item
        FieldName = 'NB_EX'
      end
      item
        FieldName = 'CAAN'
      end
      item
        FieldName = 'AD1'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'AD2'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'AD3'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'CUM_MVT'
      end
      item
        FieldName = 'MT_CPTA'
      end
      item
        FieldName = 'EXO_TVA_1'
      end
      item
        FieldName = 'BLOQUE'
      end
      item
        FieldName = 'CODGEO_1'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'EMAIL'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'CODTAR'
        FieldType = fftString
      end
      item
        FieldName = 'ADM'
      end
      item
        FieldName = 'FLAG_TAX_1'
      end
      item
        FieldName = 'CODFAC_ADM'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'FERME'
      end
      item
        FieldName = 'DER_MODIF_1'
      end
      item
        FieldName = 'SPEC_GOUV'
      end
      item
        FieldName = 'NOGSM'
      end
      item
        FieldName = 'PLV'
      end
      item
        FieldName = 'INTIT_BQ'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'CODE_BQ'
        FieldType = fftString
      end
      item
        FieldName = 'CODE_GUI'
        FieldType = fftString
      end
      item
        FieldName = 'NOCPT'
        FieldType = fftString
        Size = 11
      end
      item
        FieldName = 'CLE'
        FieldType = fftString
      end
      item
        FieldName = 'COEF_MAJ_PR'
      end
      item
        FieldName = 'EXO_CPS_1'
      end
      item
        FieldName = 'PAS_REM'
      end
      item
        FieldName = 'REM_FAM'
      end
      item
        FieldName = 'RELEVE_EMAIL'
        FieldType = fftBoolean
      end
      item
        FieldName = 'SELECT__1'
        FieldType = fftBoolean
      end
      item
        FieldName = 'APP_TARIFCLI'
        FieldType = fftBoolean
      end
      item
        FieldName = 'TVA_ILES_1'
        FieldType = fftBoolean
      end
      item
        FieldName = 'LIBELLE'
        FieldType = fftString
      end
      item
        FieldName = 'CODFAC_1'
      end
      item
        FieldName = 'CODCLI_2'
      end
      item
        FieldName = 'CODCAI_1'
        FieldType = fftString
      end
      item
        FieldName = 'CODDEV_1'
      end
      item
        FieldName = 'CODDEP_1'
      end
      item
        FieldName = 'CODVEN_1'
      end
      item
        FieldName = 'NOENR'
      end
      item
        FieldName = 'ANNEE_1'
      end
      item
        FieldName = 'MOIS_1'
      end
      item
        FieldName = 'DATE__1'
        FieldType = fftDateTime
      end
      item
        FieldName = 'HEURE_1'
      end
      item
        FieldName = 'CODREP_2'
      end
      item
        FieldName = 'CODFOU'
        FieldType = fftString
      end
      item
        FieldName = 'CODFAM'
        FieldType = fftString
      end
      item
        FieldName = 'CODSSF'
        FieldType = fftString
      end
      item
        FieldName = 'CODDPT'
        FieldType = fftString
      end
      item
        FieldName = 'TYPE__1'
        FieldType = fftString
      end
      item
        FieldName = 'CODART'
        FieldType = fftString
        Size = 13
      end
      item
        FieldName = 'CODBAR'
        FieldType = fftString
        Size = 13
      end
      item
        FieldName = 'QTE'
      end
      item
        FieldName = 'POIDS'
      end
      item
        FieldName = 'CODTAR_1'
        FieldType = fftString
      end
      item
        FieldName = 'PRIXHT'
      end
      item
        FieldName = 'PRIXTTC'
      end
      item
        FieldName = 'PRIXNET'
      end
      item
        FieldName = 'TOTHT_1'
      end
      item
        FieldName = 'MT_TTC_1'
      end
      item
        FieldName = 'PRC_REMISE_2'
      end
      item
        FieldName = 'MT_REMISE_1'
      end
      item
        FieldName = 'TX_TVA'
      end
      item
        FieldName = 'MT_TVA_1'
      end
      item
        FieldName = 'NO_TVA'
      end
      item
        FieldName = 'PRIXREV'
      end
      item
        FieldName = 'MARGE_1'
      end
      item
        FieldName = 'NO_SEM_1'
      end
      item
        FieldName = 'NO_JOUR_1'
      end
      item
        FieldName = 'DATE_OPER_1'
        FieldType = fftDateTime
      end
      item
        FieldName = 'DATE_COMPTA_1'
        FieldType = fftDateTime
      end
      item
        FieldName = 'DET_PPT'
      end
      item
        FieldName = 'DET_ILE'
      end
      item
        FieldName = 'SELECT__2'
      end
      item
        FieldName = 'NOENRF'
      end
      item
        FieldName = 'PXLVTTC'
      end
      item
        FieldName = 'DER_MODIF_2'
      end
      item
        FieldName = 'TX_TSOC_1'
      end
      item
        FieldName = 'MT_TSOC_1'
      end>
  end
  object frxPDFExportFacture: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    PDFColorSpace = csDeviceRGB
    Left = 608
    Top = 192
  end
  object frxDBDatasetTVA: TfrxDBDataset
    UserName = 'frxDBDatasetTVA'
    CloseDataSource = False
    DataSet = FDQueryTVAFacture
    BCDToCurrency = False
    DataSetOptions = []
    Left = 552
    Top = 216
    FieldDefs = <
      item
        FieldName = 'NoTVA'
      end
      item
        FieldName = 'Libelle'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'Taux'
      end
      item
        FieldName = 'BaseHT'
      end
      item
        FieldName = 'MontantTVA'
      end>
  end
  object frxDBDatasetReglements: TfrxDBDataset
    UserName = 'frxDBDatasetReglements'
    CloseDataSource = False
    DataSet = FDQueryReglements
    BCDToCurrency = False
    DataSetOptions = []
    Left = 480
    Top = 256
  end
end
