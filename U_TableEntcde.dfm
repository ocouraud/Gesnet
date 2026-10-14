object FrameTableEntcde: TFrameTableEntcde
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
    DataSource = DSEntcde
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
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOSSIER'
        Title.Caption = 'No dossier'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFOU'
        Title.Caption = 'Code Fournis'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM'
        Title.Caption = 'Nom fournisseur'
        Width = 262
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Title.Caption = 'Date commande'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVISE'
        Title.Caption = 'Devise'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAUX'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ASSUR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TRANSP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COM_DOU'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EXPED'
        Title.Caption = 'Mode exped.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ETAT'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_ARRIVEE'
        Title.Caption = 'Date arriv'#233'e'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOT_DEVISE'
        Title.Caption = 'Total devise'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOT_CFP'
        Title.Caption = 'Total CFP'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOT_FRET'
        Title.Caption = 'Total Fret'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOT_COMM_DOU'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TOT_DROITS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TOT_ASSUR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TOT_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COEF_PR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COEF_PV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODDEP'
        Title.Caption = 'D'#233'p'#244't'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRC_MARG'
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
    object EdtCherche_NOCDE: TEdit
      Left = 15
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_NOCDEChange
    end
    object EdtCherche_DOSSIER: TEdit
      Left = 80
      Top = 46
      Width = 70
      Height = 23
      TabOrder = 2
      TextHint = 'Filtrer par dossier...'
      OnChange = EdtCherche_DOSSIERChange
    end
    object EditCherche_DATE_: TEdit
      Left = 490
      Top = 46
      Width = 95
      Height = 23
      TabOrder = 5
      TextHint = 'Filtrer par date'
      OnChange = EditCherche_DATE_Change
    end
    object EditCherche_CODFOU: TEdit
      Left = 152
      Top = 46
      Width = 73
      Height = 23
      TabOrder = 4
      TextHint = 'Filtrer par code frn'
      OnChange = EditCherche_CODFOUChange
    end
    object RadioGroupEtat: TRadioGroup
      Left = 16
      Top = 0
      Width = 657
      Height = 40
      Caption = 'Etat'
      Columns = 3
      Items.Strings = (
        'Commandes en cours de saisie'
        'Commandes en attente '
        'Commandes termin'#233'es')
      ParentShowHint = False
      RadioTabStop = False
      ShowHint = False
      TabOrder = 0
      OnClick = RadioGroupEtatClick
    end
    object EditCherche_NOM: TEdit
      Left = 225
      Top = 46
      Width = 265
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par nom fournisseur'
      OnChange = EditCherche_CODFOUChange
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
  object FDQueryEntcde: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select e.*, f.NOM from entcde e join fournis f where f.codfou = ' +
        'e.codfou')
    Left = 72
    Top = 216
  end
  object DSEntcde: TDataSource
    DataSet = FDQueryEntcde
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
    MasterSource = DSEntcde
    MasterFields = 'NOCDE'
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
  end
end
