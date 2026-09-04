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
    ActivePage = TabSheetStock
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
      
        'select * from ligvteaa, client where codart=:codart and client.c' +
        'odcli=ligvteaa.codcli')
    Left = 516
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
end
