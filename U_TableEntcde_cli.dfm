object FrameTableEntcde_cli: TFrameTableEntcde_cli
  Left = 0
  Top = 0
  Width = 816
  Height = 480
  TabOrder = 0
  OnResize = FrameResize
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 816
    Height = 343
    Align = alClient
    DataSource = DSEntcde_cli
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnOuvrirClick
    TitleButtons = True
    OnTitleBtnClick = JvDBGrid1TitleBtnClick
    AlternateRowColor = clAzure
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
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
        FieldName = 'REFERENCE_'
        Title.Caption = 'R'#233'f'#233'rence'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCLI'
        Title.Caption = 'No Client'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMCLI'
        Title.Caption = 'Nom client'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Title.Caption = 'Date cmde'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTHT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total HT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TTC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total TTC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OBSERV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_VALID'
        Title.Caption = 'Date facturation'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_LIVR'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object EdtCherche_NOCDE: TEdit
      Left = 16
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_NOCDEChange
    end
    object EdtCherche_NOMCLI: TEdit
      Left = 273
      Top = 46
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMCLIChange
    end
    object EditCherche_DATE_: TEdit
      Left = 480
      Top = 46
      Width = 73
      Height = 23
      TabOrder = 2
      TextHint = 'Filtrer par date'
      OnChange = EditCherche_DATE_Change
    end
    object EditCherche_CODCLI: TEdit
      Left = 208
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par no client'
      OnChange = EditCherche_CODCLIChange
    end
    object RadioGroupEtat: TRadioGroup
      Left = 16
      Top = 0
      Width = 441
      Height = 40
      Caption = 'Etat'
      Columns = 2
      Items.Strings = (
        'Commandes non factur'#233'es'
        'Commandes factur'#233'es')
      ParentShowHint = False
      RadioTabStop = False
      ShowHint = False
      TabOrder = 4
      OnClick = RadioGroupEtatClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 816
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnTransformer: TBitBtn
      Left = 90
      Top = 32
      Width = 176
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Transformer en facture '#9889
      TabOrder = 0
      OnClick = BtnTransformerClick
    end
    object BtnFermer: TBitBtn
      Left = 729
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Fermer '#10060
      ModalResult = 8
      TabOrder = 1
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 729
      Top = 0
      Width = 87
      Height = 29
      Caption = 'Aide '#10067
      TabOrder = 2
      OnClick = BtnAideClick
    end
    object BtnImprimer: TButton
      Left = 275
      Top = 0
      Width = 87
      Height = 29
      Caption = '&Imprimer '#55357#56744#65039
      TabOrder = 3
      OnClick = BtnImprimerClick
    end
    object BtnAjouter: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Ajouter '#10133
      TabOrder = 4
      OnClick = BtnAjouterClick
    end
    object BtnSupprimer: TBitBtn
      Left = 179
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Supprimer '#55357#56785#65039
      TabOrder = 5
      StyleElements = [seClient, seBorder]
      OnClick = BtnSupprimerClick
    end
    object BtnOuvrir: TBitBtn
      Left = 90
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Ouvrir '#55357#56514
      Default = True
      TabOrder = 6
      OnClick = BtnOuvrirClick
    end
    object BtnDupliquer: TBitBtn
      Left = 275
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Dupliquer '#55357#56523
      TabOrder = 7
      StyleElements = [seClient, seBorder]
      OnClick = BtnDupliquerClick
    end
  end
  object FDQueryEntcde_cli: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from entcde_cli')
    Left = 72
    Top = 216
    object FDQueryEntcde_cliNOCDE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOCDE'
      Origin = 'NOCDE'
    end
    object FDQueryEntcde_cliREFERENCE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 45
    end
    object FDQueryEntcde_cliCODCLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Size = 7
    end
    object FDQueryEntcde_cliNOMCLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMCLI'
      Origin = 'NOMCLI'
      Size = 50
    end
    object FDQueryEntcde_cliDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryEntcde_cliTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 13
      Size = 2
    end
    object FDQueryEntcde_cliMT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 11
      Size = 2
    end
    object FDQueryEntcde_cliMT_TTC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryEntcde_cliSTATUT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'STATUT'
      Origin = 'STATUT'
    end
    object FDQueryEntcde_cliOBSERV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      Size = 150
    end
    object FDQueryEntcde_cliDATE_VALID: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_VALID'
      Origin = 'DATE_VALID'
    end
    object FDQueryEntcde_cliDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryEntcde_cliDATE_LIVR: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_LIVR'
      Origin = 'DATE_LIVR'
    end
  end
  object DSEntcde_cli: TDataSource
    DataSet = FDQueryEntcde_cli
    Left = 72
    Top = 288
  end
  object frxPDFExport1: TfrxPDFExport
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
    Left = 656
    Top = 144
  end
  object frxDBDatasetCde_Client: TfrxDBDataset
    UserName = 'frxDBDatasetCde_Client'
    CloseDataSource = False
    DataSet = FDQueryCmde_Client
    BCDToCurrency = False
    DataSetOptions = []
    Left = 560
    Top = 128
    FieldDefs = <
      item
        FieldName = 'NOCDE'
      end
      item
        FieldName = 'REFERENCE_'
        FieldType = fftString
        Size = 45
      end
      item
        FieldName = 'CODCLI'
        FieldType = fftString
      end
      item
        FieldName = 'NOMCLI'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'DATE_'
        FieldType = fftDateTime
      end
      item
        FieldName = 'TOTHT'
      end
      item
        FieldName = 'MT_TVA'
      end
      item
        FieldName = 'MT_TTC'
      end
      item
        FieldName = 'STATUT'
      end
      item
        FieldName = 'OBSERV'
        FieldType = fftString
        Size = 150
      end
      item
        FieldName = 'DATE_VALID'
        FieldType = fftDateTime
      end
      item
        FieldName = 'DER_MODIF'
      end
      item
        FieldName = 'DATE_LIVR'
        FieldType = fftDateTime
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
        FieldName = 'NOM'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'CODREP'
      end
      item
        FieldName = 'PRC_REMISE'
      end
      item
        FieldName = 'NOTEL'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'NOTAHITI'
        FieldType = fftString
      end
      item
        FieldName = 'NOFAX'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'JRSCRD'
      end
      item
        FieldName = 'CREDIT'
      end
      item
        FieldName = 'plaf_crd'
      end
      item
        FieldName = 'CODPAI'
        FieldType = fftString
      end
      item
        FieldName = 'FIN_MOIS'
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
        FieldName = 'EXO_TVA'
      end
      item
        FieldName = 'BLOQUE'
      end
      item
        FieldName = 'CODGEO'
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
        FieldName = 'FLAG_TAX'
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
        FieldName = 'EXO_CPS'
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
        FieldName = 'SELECT_'
        FieldType = fftBoolean
      end
      item
        FieldName = 'APP_TARIFCLI'
        FieldType = fftBoolean
      end
      item
        FieldName = 'TVA_ILES'
        FieldType = fftBoolean
      end
      item
        FieldName = 'NOREC'
      end
      item
        FieldName = 'NOCDE_1'
      end
      item
        FieldName = 'CODCLI_2'
        FieldType = fftString
      end
      item
        FieldName = 'CODART'
        FieldType = fftString
        Size = 13
      end
      item
        FieldName = 'LIBELLE'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'DATE__1'
        FieldType = fftDateTime
      end
      item
        FieldName = 'QTE'
      end
      item
        FieldName = 'PRIXHT'
      end
      item
        FieldName = 'PRIXTTC'
      end
      item
        FieldName = 'TOTHT_1'
      end
      item
        FieldName = 'TVA'
        FieldType = fftString
      end
      item
        FieldName = 'TX_TVA'
      end
      item
        FieldName = 'MT_TVA_1'
      end
      item
        FieldName = 'MT_TTC_1'
      end
      item
        FieldName = 'DATE_VALID_1'
        FieldType = fftDateTime
      end
      item
        FieldName = 'DER_MODIF_2'
      end
      item
        FieldName = 'NOLIG'
      end
      item
        FieldName = 'OBSERV_2'
        FieldType = fftString
        Size = 150
      end>
  end
  object frxReportCmde_Client: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46280.575471794000000000
    ReportOptions.LastChange = 46304.510709328700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 424
    Top = 168
    Datasets = <
      item
        DataSet = frxDBDatasetCde_Client
        DataSetName = 'frxDBDatasetCde_Client'
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
        Name = 'VarMEMO_DEV'
        Value = #39'memo dev'#39
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
        Value = Null
      end>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PageCde_client: TfrxReportPage
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
        Child = frxReportCmde_Client.Child1
        Condition = 'frxDBDatasetCde_Client."NOCDE"'
        ResetPageNumbers = True
        StartNewPage = True
        Stretched = True
        object MemofrxDBDataset1CODDEV: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 37.795300000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'COMMANDE No [frxDBDatasetCde_Client."NOCDE"] du [frxDBDatasetCde' +
              '_Client."DATE_"]')
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Frame.Typ = []
          Memo.UTF8W = (
            'Client: [frxDBDatasetCde_Client."CODCLI"]'
            'No TAHITI: [frxDBDatasetCde_Client."NOTAHITI"]')
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."NOM"]'
            '[frxDBDatasetCde_Client."AD1"]'
            '[frxDBDatasetCde_Client."AD2"]'
            '[frxDBDatasetCde_Client."AD3"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Frame.Typ = []
          Memo.UTF8W = (
            'R'#233'f'#233'rence : [frxDBDatasetCde_Client."REFERENCE_"]')
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Observations: [frxDBDatasetCde_Client."OBSERV"]')
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
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897637800000000000
        ParentFont = False
        Top = 287.244280000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDatasetCde_Client
        DataSetName = 'frxDBDatasetCde_Client'
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."CODART"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1LIBELLE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."LIBELLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1QTE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 423.716760000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."QTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1PRIXHT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.409710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."PRIXHT"]')
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."TOTHT_1"]')
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."MT_TTC_1"]')
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."PRIXTTC"]')
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
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetCde_Client."TX_TVA"]')
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
        Height = 192.756030000000000000
        Top = 411.968770000000000000
        Width = 755.906000000000000000
        PrintOnFirstPage = False
        PrintOnSinglePage = True
        object MemofrxDBDatasetDevisTOTHT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 34.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetCde_Client."TOTHT"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisMT_TVA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 52.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetCde_Client."MT_TVA"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisMT_TTC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 560.929500000000000000
          Top = 72.047310000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetCde_Client."MT_TTC"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 34.354361130000000000
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
          Top = 52.811076190000000000
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
          Top = 72.047282250000000000
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
          Left = 457.323123540000000000
          Top = 22.677171020000000000
          Width = 226.771800730000000000
          Height = 79.370124040000000000
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object MemoVarRef_Bancaire: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 166.299320000000000000
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
          Top = 139.842610000000000000
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
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 423.937219380000000000
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
          Left = 480.630169380000000000
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
          Width = 336.378170730000000000
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
        object MemoVarRepres: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 3.779530000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          Visible = False
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
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 423.858267720000000000
          Width = 56.692913390000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDatasetCde_Client."QTE">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object FDQueryCmde_Client: TFDQuery
    MasterSource = DSEntcde_cli
    MasterFields = 'NOCDE'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT '
      '  -- Donn'#233'es de l'#39'en-t'#234'te (vont se r'#233'p'#233'ter sur chaque ligne SQL)'
      '*'
      'FROM entcde_cli e'
      'JOIN Client c ON e.CODCLI = c.CODCLI'
      'JOIN ligcde_cli l ON e.NOCDE = l.NOCDE'
      'WHERE e.NOCDE = :NOCDE'
      
        'ORDER BY e.NOCDE ASC, l.NOREC ASC -- Le tri obligatoire pour la ' +
        'rupture'
      '')
    Left = 296
    Top = 128
    ParamData = <
      item
        Name = 'NOCDE'
        ParamType = ptInput
      end>
  end
end
