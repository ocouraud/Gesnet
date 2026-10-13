object FrameTableAchat: TFrameTableAchat
  Left = 0
  Top = 0
  Width = 1000
  Height = 480
  TabOrder = 0
  OnResize = FrameResize
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 1000
    Height = 343
    Align = alClient
    DataSource = DSAchat
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
        FieldName = 'CODACH'
        Title.Alignment = taRightJustify
        Title.Caption = 'No achat'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFOU'
        Title.Caption = 'Code fournis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDEP'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'p'#244't'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTE'
        Title.Caption = 'Poste'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Title.Caption = 'Libell'#233
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFER'
        Title.Caption = 'R'#233'f'#233'rence'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Title.Caption = 'Date achat'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_COMPTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_ECH'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total HT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_REM'
        Title.Alignment = taRightJustify
        Title.Caption = 'Remise'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total TVA'
        Visible = True
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
        FieldName = 'CODPAI'
        Title.Caption = 'Mode paiement'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBPAI'
        Title.Caption = 'Libell'#233' paiement'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOP_'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'JRSCRD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FINMOIS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REGL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IMPORT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TSOC'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object EdtCherche_CODACH: TEdit
      Left = 15
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_CODACHChange
    end
    object EdtCherche_LIBELLE: TEdit
      Left = 240
      Top = 46
      Width = 185
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_LIBELLEChange
    end
    object EditCherche_DATE_: TEdit
      Left = 568
      Top = 46
      Width = 81
      Height = 23
      TabOrder = 2
      TextHint = 'Filtrer par date'
      OnChange = EditCherche_DATE_Change
    end
    object EditCherche_CODFOU: TEdit
      Left = 80
      Top = 46
      Width = 73
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par no client'
      OnChange = EditCherche_CODFOUChange
    end
    object RadioGroupEtat: TRadioGroup
      Left = 16
      Top = 0
      Width = 441
      Height = 40
      Caption = 'Etat'
      Columns = 2
      Items.Strings = (
        'Achats non centralis'#233's'
        'Achats centralis'#233's')
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
    Width = 1000
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnFermer: TBitBtn
      Left = 729
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Fermer '#10060
      ModalResult = 8
      TabOrder = 0
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 729
      Top = 0
      Width = 87
      Height = 29
      Caption = 'Aide '#10067
      TabOrder = 1
      OnClick = BtnAideClick
    end
    object BtnImprimer: TButton
      Left = 179
      Top = 32
      Width = 87
      Height = 29
      Caption = '&Imprimer '#55357#56744#65039
      TabOrder = 2
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
      TabOrder = 3
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
      TabOrder = 4
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
      TabOrder = 5
      OnClick = BtnOuvrirClick
    end
    object BtnDupliquer: TBitBtn
      Left = 0
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Dupliquer '#55357#56523
      TabOrder = 6
      StyleElements = [seClient, seBorder]
      OnClick = BtnDupliquerClick
    end
    object BtnCentraliser: TBitBtn
      Left = 90
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Centraliser '#9654#65039
      TabOrder = 7
      StyleElements = [seClient, seBorder]
      OnClick = BtnCentraliserClick
    end
  end
  object FDQueryAchat: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from achat')
    Left = 72
    Top = 216
    object FDQueryAchatCODACH: TLargeintField
      FieldName = 'CODACH'
      Origin = 'CODACH'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryAchatCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQueryAchatCODDEP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryAchatPOSTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'POSTE'
      Origin = 'POSTE'
      Size = 10
    end
    object FDQueryAchatLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryAchatREFER: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFER'
      Origin = 'REFER'
      Size = 15
    end
    object FDQueryAchatDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryAchatDATE_COMPTA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_COMPTA'
      Origin = 'DATE_COMPTA'
    end
    object FDQueryAchatDATE_ECH: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_ECH'
      Origin = 'DATE_ECH'
    end
    object FDQueryAchatMT_HT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT'
      Origin = 'MT_HT'
      Precision = 11
      Size = 2
    end
    object FDQueryAchatMT_REM: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REM'
      Origin = 'MT_REM'
      Precision = 9
      Size = 2
    end
    object FDQueryAchatMT_TVA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
    end
    object FDQueryAchatMT_TTC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryAchatCODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQueryAchatLIBPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBPAI'
      Origin = 'LIBPAI'
      Size = 30
    end
    object FDQueryAchatTOP_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TOP_'
      Origin = 'TOP_'
      Size = 1
    end
    object FDQueryAchatJRSCRD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object FDQueryAchatFINMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FINMOIS'
      Origin = 'FINMOIS'
    end
    object FDQueryAchatREGL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REGL'
      Origin = 'REGL'
    end
    object FDQueryAchatIMPORT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'IMPORT'
      Origin = '`IMPORT`'
    end
    object FDQueryAchatDER_MODIF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryAchatMT_TSOC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
    end
  end
  object DSAchat: TDataSource
    DataSet = FDQueryAchat
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
  object frxDBDatasetFactureAchat: TfrxDBDataset
    UserName = 'frxDBDatasetFactureAchat'
    CloseDataSource = False
    DataSet = FDQueryFactureAchat
    BCDToCurrency = False
    DataSetOptions = []
    Left = 560
    Top = 128
  end
  object frxReportFactureAchat: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46280.575471794000000000
    ReportOptions.LastChange = 46307.507316296290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 424
    Top = 168
    Datasets = <
      item
        DataSet = frxDBDatasetFactureAchat
        DataSetName = 'frxDBDatasetFactureAchat'
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
    object PageAchat: TfrxReportPage
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
        Child = frxReportFactureAchat.Child1
        Condition = 'frxDBDatasetFactureAchat."CODACH"'
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
            
              'ACHAT No [frxDBDatasetFactureAchat."CODACH"] du frxDBDatasetFact' +
              'ureAchat."DATE_"]')
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
          Top = 90.708720000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Frame.Typ = []
          Memo.UTF8W = (
            'Fournisseur : [frxDBDatasetFactureAchat."CODFOU"]')
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
            '[frxDBDatasetFactureAchat."NOM"]'
            '[frxDBDatasetFactureAchat."AD1"]'
            '[frxDBDatasetFactureAchat."AD2"]'
            '[frxDBDatasetFactureAchat."AD3"]')
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
            'R'#233'f'#233'rence : [frxDBDatasetFactureAchat."REFER"]')
        end
        object MemofrxDBDataset1OBSERV: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 136.063080000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
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
            'Objet : [frxDBDatasetFactureAchat."LIBELLE"]')
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
        DataSet = frxDBDatasetFactureAchat
        DataSetName = 'frxDBDatasetFactureAchat'
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
            '[frxDBDatasetFactureAchat."CODART_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1LIBELLE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 272.126160000000000000
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
            '[frxDBDatasetFactureAchat."LIBELLE_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1QTE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 358.716760000000000000
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
            '[frxDBDatasetFactureAchat."QTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1PRIXHT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 415.409710000000000000
          Width = 64.252010000000000000
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
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFactureAchat."PRIXHT"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
              FormatStr = '%2.2n'
              Kind = fkNumeric
            end
            item
            end>
        end
        object MemofrxDBDataset1TOTHT_1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 542.488560000000000000
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
            '[frxDBDatasetFactureAchat."TOTHT"]')
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
            '[frxDBDatasetFactureAchat."tot_ttc"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemofrxDBDataset1PRIXTTC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 481.007874020000000000
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
            '[frxDBDatasetFactureAchat."PRIXTTC"]')
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
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetFactureAchat."TX_TVA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 606.504330000000000000
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
            '[frxDBDatasetFactureAchat."MT_TVA_1"]')
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
        Height = 268.346630000000000000
        Top = 411.968770000000000000
        Width = 755.906000000000000000
        PrintOnFirstPage = False
        PrintOnSinglePage = True
        object VarMEMO_DEV: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 196.535560000000000000
          Width = 714.331170000000000000
          Height = 64.252010000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[VarMEMO_DEV]')
        end
        object MemofrxDBDatasetDevisTOTHT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 14.118120000000000000
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
            '[frxDBDatasetFactureAchat."MT_HT"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisMT_TVA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 51.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = FrameTableDevis.frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetFactureAchat."MT_TVA"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2n'
              Kind = fkNumeric
            end
            item
            end>
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
            '[frxDBDatasetFactureAchat."MT_TTC"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 14.118121130000000000
          Width = 94.488281250000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'Total brut HT')
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 51.811076190000000000
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
          Left = 461.102653540000000000
          Top = 3.779521020000000000
          Width = 222.992270730000000000
          Height = 94.488244040000000000
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
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 32.677180000000000000
          Width = 94.488281250000000000
          Height = 18.897644040000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            'Remise')
        end
        object Memo13: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.118110240000000000
          Top = 32.677180000000000000
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
            '[frxDBDatasetFactureAchat."MT_REM"]')
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
          Left = 481.007874020000000000
          Top = 30.236406640000000000
          Width = 61.228346456692910000
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
          Left = 542.362204724409400000
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
          Left = 358.677165350000000000
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
          Left = 415.370078740000000000
          Top = 30.236414220000000000
          Width = 65.385826770000000000
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
          Left = 83.370123060000000000
          Top = 30.236403210000000000
          Width = 275.905690730000000000
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
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 606.504330000000000000
          Top = 30.236240000000000000
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
            'Total TVA')
          ParentFont = False
          VAlign = vaCenter
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
          Left = 358.685107720000000000
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
            '[SUM(<frxDBDatasetFactureAchat."QTE">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object FDQueryFactureAchat: TFDQuery
    OnCalcFields = FDQueryFactureAchatCalcFields
    MasterSource = DSAchat
    MasterFields = 'CODACH'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT '
      '  -- Donn'#233'es de l'#39'en-t'#234'te (vont se r'#233'p'#233'ter sur chaque ligne SQL)'
      '*'
      'FROM achat a'
      'JOIN fournis f ON f.CODFOU = a.CODFOU'
      'JOIN ligachjj l ON l.CODACH = a.CODACH'
      'JOIN article i ON i.codart = l.codart '
      'WHERE a.CODACH = :CODACH'
      '')
    Left = 296
    Top = 128
    ParamData = <
      item
        Name = 'CODACH'
        ParamType = ptInput
      end>
    object FDQueryFactureAchatCODACH: TLargeintField
      FieldName = 'CODACH'
      Origin = 'CODACH'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryFactureAchatCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQueryFactureAchatCODDEP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryFactureAchatPOSTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'POSTE'
      Origin = 'POSTE'
      Size = 10
    end
    object FDQueryFactureAchatLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryFactureAchatREFER: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFER'
      Origin = 'REFER'
      Size = 15
    end
    object FDQueryFactureAchatDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryFactureAchatDATE_COMPTA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_COMPTA'
      Origin = 'DATE_COMPTA'
    end
    object FDQueryFactureAchatDATE_ECH: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_ECH'
      Origin = 'DATE_ECH'
    end
    object FDQueryFactureAchatMT_HT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT'
      Origin = 'MT_HT'
      Precision = 11
      Size = 2
    end
    object FDQueryFactureAchatMT_REM: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REM'
      Origin = 'MT_REM'
      Precision = 9
      Size = 2
    end
    object FDQueryFactureAchatMT_TVA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
    end
    object FDQueryFactureAchatMT_TTC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryFactureAchatCODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQueryFactureAchatLIBPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBPAI'
      Origin = 'LIBPAI'
      Size = 30
    end
    object FDQueryFactureAchatTOP_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TOP_'
      Origin = 'TOP_'
      Size = 1
    end
    object FDQueryFactureAchatJRSCRD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object FDQueryFactureAchatFINMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FINMOIS'
      Origin = 'FINMOIS'
    end
    object FDQueryFactureAchatREGL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REGL'
      Origin = 'REGL'
    end
    object FDQueryFactureAchatIMPORT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'IMPORT'
      Origin = '`IMPORT`'
    end
    object FDQueryFactureAchatDER_MODIF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryFactureAchatMT_TSOC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
    end
    object FDQueryFactureAchatCODFOU_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU_1'
      Origin = 'CODFOU'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
    object FDQueryFactureAchatNOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryFactureAchatNOTEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTEL'
      Origin = 'NOTEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatNOFAX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOFAX'
      Origin = 'NOFAX'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatAD1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD1'
      Origin = 'AD1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryFactureAchatAD2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD2'
      Origin = 'AD2'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryFactureAchatAD3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD3'
      Origin = 'AD3'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryFactureAchatDEVISE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DEVISE'
      Origin = 'DEVISE'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object FDQueryFactureAchatNOCPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOCPT'
      Origin = 'NOCPT'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryFactureAchatJRSCRD_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD_1'
      Origin = 'JRSCRD'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatFIN_MOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS'
      Origin = 'FIN_MOIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryFactureAchatCOM_VTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COM_VTE'
      Origin = 'COM_VTE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureAchatDER_MODIF_1: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF_1'
      Origin = 'DER_MODIF'
    end
    object FDQueryFactureAchatCODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryFactureAchatPRC_MARG: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_MARG'
      Origin = 'PRC_MARG'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureAchatCODACH_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODACH_1'
      Origin = 'CODACH'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatREFER_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFER_1'
      Origin = 'REFER'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FDQueryFactureAchatDATE__1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE__1'
      Origin = 'DATE_'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatCODFOU_2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU_2'
      Origin = 'CODFOU'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
    object FDQueryFactureAchatCODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object FDQueryFactureAchatCODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      ProviderFlags = []
      ReadOnly = True
      Size = 6
    end
    object FDQueryFactureAchatCODART_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART_1'
      Origin = 'CODART'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryFactureAchatCODDEP_1: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP_1'
      Origin = 'CODDEP'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object FDQueryFactureAchatPRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object FDQueryFactureAchatPRIXTTC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXTTC'
      Origin = 'PRIXTTC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryFactureAchatTX_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TVA'
      Origin = 'TX_TVA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureAchatMT_TVA_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA_1'
      Origin = 'MT_TVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatNO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_TVA'
      Origin = 'NO_TVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatPOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 3
    end
    object FDQueryFactureAchatNOENR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchatDER_MODIF_2: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF_2'
      Origin = 'DER_MODIF'
    end
    object FDQueryFactureAchatTX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryFactureAchatMT_TSOC_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC_1'
      Origin = 'MT_TSOC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object FDQueryFactureAchatNOENR_STO: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR_STO'
      Origin = 'NOENR_STO'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryFactureAchattot_ttc: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'tot_ttc'
    end
    object FDQueryFactureAchatLIBELLE_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE_1'
      Origin = 'LIBELLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
end
