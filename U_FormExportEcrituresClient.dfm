object FormExportEcrituresClient: TFormExportEcrituresClient
  Left = 0
  Top = 0
  Caption = 'Param'#232'tres de l'#39'export comptable des '#233'critures clients'
  ClientHeight = 405
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 787
    Height = 405
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 487
    ExplicitHeight = 312
    object TabSheet1: TTabSheet
      Caption = 'Param'#232'tres'
      OnEnter = TabSheet1Enter
      object Label2: TLabel
        Left = 39
        Top = 43
        Width = 57
        Height = 15
        Caption = 'Date de fin'
      end
      object Label1: TLabel
        Left = 39
        Top = 14
        Width = 74
        Height = 15
        Caption = 'Date de d'#233'but'
      end
      object Panel1: TPanel
        Left = 230
        Top = 84
        Width = 204
        Height = 93
        BevelEdges = []
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object JvRadioGroup1: TJvRadioGroup
          Left = 11
          Top = 8
          Width = 185
          Height = 73
          Caption = 'Etendue'
          TabOrder = 0
        end
        object JvRadioButtonTous: TJvRadioButton
          Left = 21
          Top = 52
          Width = 127
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Reprise et nouveaux'
          TabOrder = 1
          LinkedControls = <>
        end
        object JvRadioButtonNouveaux: TJvRadioButton
          Left = 21
          Top = 29
          Width = 159
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Non encore comptabilis'#233's'
          TabOrder = 2
          LinkedControls = <>
        end
      end
      object Panel2: TPanel
        Left = 470
        Top = 90
        Width = 193
        Height = 124
        BevelEdges = []
        BevelOuter = bvNone
        TabOrder = 1
        object JvRadioGroup3: TJvRadioGroup
          Left = 16
          Top = 0
          Width = 169
          Height = 97
          Caption = 'Interface comptable'
          TabOrder = 0
        end
        object JvRadioButtonPasInterf: TJvRadioButton
          Left = 39
          Top = 23
          Width = 98
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Pas d'#39'interface'
          TabOrder = 1
          LinkedControls = <>
        end
        object JvRadioButtonRevatel: TJvRadioButton
          Left = 39
          Top = 69
          Width = 59
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Revatel'
          TabOrder = 2
          LinkedControls = <>
        end
        object JvRadioButtonSaari: TJvRadioButton
          Left = 39
          Top = 46
          Width = 74
          Height = 17
          Alignment = taLeftJustify
          Caption = 'SAARI 100'
          TabOrder = 3
          LinkedControls = <>
        end
      end
      object JvRadioGroup2: TJvRadioGroup
        Left = 39
        Top = 92
        Width = 185
        Height = 73
        Caption = 'Nature des mouvements'
        TabOrder = 2
      end
      object JvDateEditDu: TJvDateEdit
        Left = 135
        Top = 11
        Width = 105
        Height = 23
        ShowNullDate = False
        TabOrder = 3
      end
      object JvDateEditAu: TJvDateEdit
        Left = 135
        Top = 40
        Width = 105
        Height = 23
        ShowNullDate = False
        TabOrder = 4
      end
      object JvCheckBoxVentes: TJvCheckBox
        Left = 49
        Top = 113
        Width = 114
        Height = 17
        Caption = 'Ecritures de vente'
        TabOrder = 5
        LinkedControls = <>
      end
      object JvCheckBoxTresor: TJvCheckBox
        Left = 49
        Top = 136
        Width = 134
        Height = 17
        Caption = 'Ecritures de tresorerie'
        TabOrder = 6
        LinkedControls = <>
      end
      object BtnGenerer: TButton
        Left = 598
        Top = 326
        Width = 169
        Height = 33
        Caption = 'G'#233'n'#233'rer le fichier '#9654#65039
        TabOrder = 7
        OnClick = BtnGenererClick
      end
      object BtnDecompta: TButton
        Left = 3
        Top = 326
        Width = 214
        Height = 33
        Caption = 'D'#233'comptabilisation de factures '#8617
        TabOrder = 8
        OnClick = BtnDecomptaClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'R'#233'sultat de la derni'#232're g'#233'n'#233'ration'
      ImageIndex = 1
      OnEnter = TabSheet2Enter
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 0
        Width = 779
        Height = 375
        Align = alClient
        DataSource = DSEcr_cpt
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AutoAppend = False
        TitleButtons = True
        OnTitleBtnClick = JvDBGrid1TitleBtnClick
        AlternateRowColor = clAliceblue
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
            FieldName = 'noenr'
            Title.Caption = 'no enr'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nopiece'
            Title.Caption = 'no piece'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codjal'
            Title.Caption = 'journal'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_mvt'
            Title.Caption = 'date mvt'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_ech'
            Title.Caption = 'date ech'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'reference'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nocpt'
            Title.Caption = 'no cpt'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'noaux'
            Title.Caption = 'no aux'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'libelle'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'montant'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sens'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pai'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'type'
            Width = 29
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = 787
    Top = 0
    Width = 97
    Height = 405
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 493
    ExplicitHeight = 315
    object BtnFermer: TButton
      Left = 4
      Top = 2
      Width = 89
      Height = 33
      Caption = 'Fermer '#10060
      ModalResult = 8
      TabOrder = 0
    end
    object BtnImprimer: TButton
      Left = 4
      Top = 41
      Width = 89
      Height = 48
      Caption = 'Imprimer'#13#10'les '#233'critures '#55357#56744#65039
      TabOrder = 1
      OnClick = BtnImprimerClick
    end
    object BtnJournal: TButton
      Left = 2
      Top = 95
      Width = 89
      Height = 48
      Caption = 'Imprimer'#13#10'le journal '#55357#56744#65039
      TabOrder = 2
      OnClick = BtnJournalClick
    end
  end
  object FDQueryEcr_cpt: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ecr_cpt order by date_mvt,codjal,noenr')
    Left = 124
    Top = 266
  end
  object DSEcr_cpt: TDataSource
    DataSet = FDQueryEcr_cpt
    Left = 196
    Top = 290
  end
  object frxReportEcr_cpt: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46301.482229583340000000
    ReportOptions.LastChange = 46301.515540150460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 372
    Top = 138
    Datasets = <
      item
        DataSet = frxDBDatasetEcr_cpt
        DataSetName = 'frxDBDatasetEcr_cpt'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 45.354360000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Contr'#244'le de la g'#233'n'#233'ration des '#233'critures clients '
            'Imprim'#233' le [Date]')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 86.929190000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472400000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 61.555491581338890000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'noenr')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 61.555491581338890000
          Width = 67.333291836544150000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'nopiece')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 128.888783417883000000
          Width = 70.888861224362760000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'date_ech')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 199.777644642245800000
          Width = 91.777691326133640000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'reference')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 291.555335968379400000
          Width = 77.222106377019080000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'nocpt')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 368.777442345398500000
          Width = 78.555444897451060000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'noaux')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 447.332887242849600000
          Width = 143.666350253649100000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'libelle')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 590.999237496498700000
          Width = 68.666630356976130000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'montant')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 659.665867853474800000
          Width = 58.444368366997600000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'sens')
          ParentFont = False
          Style = 'Header'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetEcr_cpt."date_mvt"'
        object Memo12: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          DataField = 'date_mvt'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."date_mvt"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetEcr_cpt."codjal"'
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          DataField = 'codjal'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."codjal"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetEcr_cpt
        DataSetName = 'frxDBDatasetEcr_cpt'
        RowCount = 0
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Width = 61.555491580000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'noenr'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."noenr"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 61.555491580000000000
          Width = 67.333291840000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nopiece'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."nopiece"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 128.888783420000000000
          Width = 70.888861220000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'date_ech'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."date_ech"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 199.777644640000000000
          Width = 91.777691330000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'reference'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."reference"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 291.555335970000000000
          Width = 77.222106380000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nocpt'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."nocpt"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 368.777442350000000000
          Width = 78.555444900000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'noaux'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."noaux"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 447.332887240000000000
          Width = 143.666350250000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'libelle'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."libelle"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 590.999237500000000000
          Width = 68.666630360000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'montant'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."montant"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 659.665867850000000000
          Width = 58.444368370000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'sens'
          DataSet = frxDBDatasetEcr_cpt
          DataSetName = 'frxDBDatasetEcr_cpt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetEcr_cpt."sens"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 332.598640000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 309.921460000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 393.071120000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo25: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object frxDBDatasetEcr_cpt: TfrxDBDataset
    UserName = 'frxDBDatasetEcr_cpt'
    CloseDataSource = False
    DataSet = FDQueryEcr_cpt
    BCDToCurrency = False
    DataSetOptions = []
    Left = 372
    Top = 74
    FieldDefs = <
      item
        FieldName = 'noenr'
      end
      item
        FieldName = 'nopiece'
        FieldType = fftString
      end
      item
        FieldName = 'codjal'
        FieldType = fftString
      end
      item
        FieldName = 'date_mvt'
        FieldType = fftDateTime
      end
      item
        FieldName = 'date_ech'
        FieldType = fftDateTime
      end
      item
        FieldName = 'reference'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'nocpt'
        FieldType = fftString
        Size = 14
      end
      item
        FieldName = 'noaux'
        FieldType = fftString
        Size = 14
      end
      item
        FieldName = 'libelle'
        FieldType = fftString
        Size = 30
      end
      item
        FieldName = 'montant'
      end
      item
        FieldName = 'sens'
        FieldType = fftString
      end
      item
        FieldName = 'pai'
        FieldType = fftString
      end
      item
        FieldName = 'type'
        FieldType = fftString
      end>
  end
  object frxDBDatasetImp_cpta: TfrxDBDataset
    UserName = 'frxDBDatasetImp_cpta'
    CloseDataSource = False
    DataSet = FDQueryImp_cpta
    BCDToCurrency = False
    DataSetOptions = []
    Left = 60
    Top = 154
    FieldDefs = <
      item
        FieldName = 'jal'
        FieldType = fftString
      end
      item
        FieldName = 'nocpt'
        FieldType = fftString
        Size = 15
      end
      item
        FieldName = 'libelle'
        FieldType = fftString
        Size = 25
      end
      item
        FieldName = 'date_tri'
      end
      item
        FieldName = 'date_cpt'
        FieldType = fftString
      end
      item
        FieldName = 'date_ech'
        FieldType = fftString
      end
      item
        FieldName = 'debit'
      end
      item
        FieldName = 'credit'
      end>
  end
  object FDQueryImp_cpta: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT '
      '    jal, '
      '    nocpt, '
      '    libelle,'
      '    date_cpt as date_tri, '
      
        '    DATE_FORMAT(DATE_ADD('#39'1899-12-30'#39', INTERVAL date_cpt DAY), '#39 +
        '%d-%m-%Y'#39') AS date_cpt,'
      
        '    DATE_FORMAT(DATE_ADD('#39'1899-12-30'#39', INTERVAL date_ech DAY), '#39 +
        '%d-%m-%Y'#39') AS date_ech,'
      '    debit, '
      '    credit '
      'FROM imp_cpta order by date_tri, jal')
    Left = 52
    Top = 82
  end
  object frxReportImp_cpta: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46301.519814085640000000
    ReportOptions.LastChange = 46301.612625300930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 52
    Top = 210
    Datasets = <
      item
        DataSet = frxDBDatasetImp_cpta
        DataSetName = 'frxDBDatasetImp_cpta'
      end>
    Variables = <
      item
        Name = ' Globales'
        Value = Null
      end
      item
        Name = 'NomSociete'
        Value = ''
      end
      item
        Name = 'DateDebut'
        Value = ''
      end
      item
        Name = 'DateFin'
        Value = ''
      end>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 718.110717773437500000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Fichier d'#39'impression du journal comptable clients'
            'du [DateDebut] au [DateFin]')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = -0.000000330000000000
          Top = 3.779530820000000000
          Width = 377.953003590000000000
          Height = 18.897647860000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[NomSociete]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472400000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 114.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'no cpt')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 114.000000000000000000
          Width = 188.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'libelle')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 302.000000000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'date ech')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 380.000000000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'debit')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 458.000000000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'credit')
          ParentFont = False
          Style = 'Header'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetImp_cpta."date_tri"'
        object Memo8: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetImp_cpta
          DataSetName = 'frxDBDatasetImp_cpta'
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'ECRITURES DU [frxDBDatasetImp_cpta."date_cpt"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetImp_cpta."jal"'
        object Memo9: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetImp_cpta
          DataSetName = 'frxDBDatasetImp_cpta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Journal [frxDBDatasetImp_cpta."jal"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetImp_cpta
        DataSetName = 'frxDBDatasetImp_cpta'
        RowCount = 0
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Width = 114.000000000000000000
          Height = 18.897650000000000000
          DataField = 'nocpt'
          DataSet = frxDBDatasetImp_cpta
          DataSetName = 'frxDBDatasetImp_cpta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetImp_cpta."nocpt"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 114.000000000000000000
          Width = 188.000000000000000000
          Height = 18.897650000000000000
          DataField = 'libelle'
          DataSet = frxDBDatasetImp_cpta
          DataSetName = 'frxDBDatasetImp_cpta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetImp_cpta."libelle"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 302.000000000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetImp_cpta
          DataSetName = 'frxDBDatasetImp_cpta'
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetImp_cpta."date_ech"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 380.000000000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'debit'
          DataSet = frxDBDatasetImp_cpta
          DataSetName = 'frxDBDatasetImp_cpta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetImp_cpta."debit"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 458.000000000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'credit'
          DataSet = frxDBDatasetImp_cpta
          DataSetName = 'frxDBDatasetImp_cpta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetImp_cpta."credit"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897637795275590000
        Top = 393.071120000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 11.338582677165350000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 472.441250000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo17: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
end
