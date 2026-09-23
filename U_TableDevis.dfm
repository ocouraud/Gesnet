object FrameTableDevis: TFrameTableDevis
  Left = 0
  Top = 0
  Width = 821
  Height = 480
  TabOrder = 0
  OnResize = FrameResize
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 821
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnTransformer: TBitBtn
      Left = 90
      Top = 32
      Width = 176
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Transformer en facture'
      TabOrder = 0
      OnClick = BtnTransformerClick
    end
    object BtnFermer: TBitBtn
      Left = 734
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Fermer'
      ModalResult = 8
      TabOrder = 1
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 734
      Top = 0
      Width = 87
      Height = 29
      Caption = 'Aide'
      TabOrder = 2
      OnClick = BtnAideClick
    end
    object BtnImprimer: TButton
      Left = 275
      Top = 0
      Width = 87
      Height = 29
      Caption = '&Imprimer'
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
      Caption = '&Ajouter'
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
      Caption = '&Supprimer'
      TabOrder = 5
      StyleElements = [seClient, seBorder]
      OnClick = BtnSupprimerClick
    end
    object BtnOublier: TBitBtn
      Left = 0
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = 'Ou&blier'
      TabOrder = 6
      StyleElements = [seClient, seBorder]
      OnClick = BtnOublierClick
    end
    object BtnOuvrir: TBitBtn
      Left = 90
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Ouvrir'
      Default = True
      TabOrder = 7
      OnClick = BtnOuvrirClick
    end
    object BtnDupliquer: TBitBtn
      Left = 275
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Dupliquer'
      TabOrder = 8
      StyleElements = [seClient, seBorder]
      OnClick = BtnDupliquerClick
    end
  end
  object JvDBGridEnt_prof: TJvDBGrid
    Left = 0
    Top = 73
    Width = 821
    Height = 343
    Align = alClient
    DataSource = DSEnt_prof
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnOuvrirClick
    TitleButtons = True
    OnTitleBtnClick = JvDBGridEnt_profTitleBtnClick
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
        Title.Caption = 'Etat'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDEV'
        Title.Caption = 'No Devis'
        Width = 80
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
        FieldName = 'CODFAC'
        Title.Caption = 'No Facture'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCLI'
        Title.Caption = 'No Client'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM'
        Title.Caption = 'Non du client'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCAI'
        Title.Caption = 'No Poste'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDEP'
        Title.Caption = 'Depot'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODVEN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOTAHITI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EXO_TVA'
        Visible = False
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
        FieldName = 'PRC_REMISE'
        Title.Caption = '% remise'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_REMISE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TOTHT'
        Title.Caption = 'Total HT'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TTC'
        Title.Caption = 'Total TTC'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_HT0'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HT1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HT2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HT3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MARGE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_'
        Title.Caption = 'Reference'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREP'
        Title.Caption = 'Repres.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_SEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_JOUR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REGL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODPAI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'JRSCRD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FIN_MOIS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LIBREG'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CRD_FORCE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'date_ech'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ACOMPTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODGEO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FLAG_TAX'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOMVEN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TSOC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HTSOC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TX_TSOC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EXO_CPS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVAI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HTI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TVA_ILES'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object EdtCherche_CODDEV: TEdit
      Left = 42
      Top = 46
      Width = 76
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_CODDEVChange
    end
    object EdtCherche_NOM: TEdit
      Left = 338
      Top = 46
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
    object CheckBoxToutesFactures: TCheckBox
      Left = 641
      Top = 10
      Width = 101
      Height = 30
      Caption = 'Tous les postes'
      TabOrder = 2
      OnClick = CheckBoxToutesFacturesClick
    end
    object EditCherche_DATE_: TEdit
      Left = 123
      Top = 46
      Width = 61
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par date'
      OnChange = EdtCherche_CODDEVChange
    end
    object EditCherche_CODCLI: TEdit
      Left = 272
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 4
      TextHint = 'Filtrer par no client'
      OnChange = EdtCherche_CODDEVChange
    end
    object EditCherche_CODCAI: TEdit
      Left = 641
      Top = 46
      Width = 34
      Height = 23
      TabOrder = 5
      TextHint = 'Filtrer par no poste'
      OnChange = EdtCherche_CODDEVChange
    end
    object RadioGroupEtat: TRadioGroup
      Left = 16
      Top = 0
      Width = 441
      Height = 40
      Caption = 'Etat'
      Columns = 3
      Items.Strings = (
        'Devis factur'#233's'
        'Devis non factur'#233's'
        'Devis oubli'#233's')
      ParentShowHint = False
      RadioTabStop = False
      ShowHint = False
      TabOrder = 6
      OnClick = RadioGroupEtatClick
    end
    object EdtCherche_CODFAC: TEdit
      Left = 190
      Top = 46
      Width = 76
      Height = 23
      TabOrder = 7
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_CODDEVChange
    end
  end
  object FDQueryEnt_prof: TFDQuery
    OnCalcFields = FDQueryEnt_profCalcFields
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ent_prof')
    Left = 32
    Top = 136
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      Size = 1000
    end
    object LargeintField1: TLargeintField
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object LargeintField2: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
    end
    object ShortintField1: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      Size = 50
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI'
      Origin = 'NOTAHITI'
      Size = 10
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object SmallintField2: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA'
      Origin = 'EXO_TVA'
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object SmallintField3: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'HEURE'
      Origin = 'HEURE'
    end
    object BCDField1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object IntegerField4: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object BCDField2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object LargeintField3: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object BCDField3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT0'
      Origin = 'MT_HT0'
      Precision = 11
      Size = 2
    end
    object BCDField4: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT1'
      Origin = 'MT_HT1'
      Precision = 11
      Size = 2
    end
    object BCDField5: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT2'
      Origin = 'MT_HT2'
      Precision = 11
      Size = 2
    end
    object BCDField6: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT3'
      Origin = 'MT_HT3'
      Precision = 11
      Size = 2
    end
    object BCDField7: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA1'
      Origin = 'MT_TVA1'
      Precision = 9
      Size = 2
    end
    object BCDField8: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA2'
      Origin = 'MT_TVA2'
      Precision = 9
      Size = 2
    end
    object BCDField9: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA3'
      Origin = 'MT_TVA3'
      Precision = 9
      Size = 2
    end
    object BCDField10: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object LargeintField4: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 15
    end
    object SmallintField4: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object SmallintField5: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object SmallintField6: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object SmallintField7: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REGL'
      Origin = 'REGL'
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object SmallintField8: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object SmallintField9: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS'
      Origin = 'FIN_MOIS'
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBREG'
      Origin = 'LIBREG'
      Size = 50
    end
    object SmallintField10: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CRD_FORCE'
      Origin = 'CRD_FORCE'
    end
    object DateField2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'date_ech'
      Origin = 'date_ech'
    end
    object StringField10: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO'
      Origin = 'CODGEO'
      Size = 1
    end
    object SmallintField11: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX'
      Origin = 'FLAG_TAX'
    end
    object SQLTimeStampField1: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object BCDField12: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTSOC'
      Origin = 'MT_HTSOC'
      Precision = 11
      Size = 2
    end
    object BCDField13: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object SmallintField13: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS'
      Origin = 'EXO_CPS'
    end
    object BCDField14: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVAI'
      Origin = 'MT_TVAI'
      Precision = 9
      Size = 2
    end
    object BCDField15: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTI'
      Origin = 'MT_HTI'
      Precision = 11
      Size = 2
    end
    object BooleanField1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES'
      Origin = 'TVA_ILES'
    end
    object StringField12: TStringField
      FieldKind = fkCalculated
      FieldName = 'HeureLisible'
      Size = 12
      Calculated = True
    end
    object FDQueryEnt_profMT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
  end
  object DSEnt_prof: TDataSource
    DataSet = FDQueryEnt_prof
    Left = 32
    Top = 216
  end
  object frxReportDevis: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46280.575471794000000000
    ReportOptions.LastChange = 46287.655581354160000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReportDevisBeforePrint
    Left = 448
    Top = 152
    Datasets = <
      item
        DataSet = frxDBDatasetDevis
        DataSetName = 'frxDBDatasetDevis'
      end
      item
        DataSet = frxDBDatasetTVA
        DataSetName = 'frxDBDatasetTVA'
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
        Value = ''
      end
      item
        Name = 'VarTotalAlpha'
        Value = ''
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
    object Page1: TfrxReportPage
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
        Child = frxReportDevis.Child1
        Condition = '<frxDBDatasetDevis."CODDEV">'
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'DEVIS No [frxDBDatasetDevis."CODDEV"] du [frxDBDatasetDevis."DAT' +
              'E_"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Frame.Typ = []
          Memo.UTF8W = (
            'Client: [frxDBDatasetDevis."CODCLI"]'
            'No TAHITI: [frxDBDatasetDevis."NOTAHITI"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetDevis."NOM"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Frame.Typ = []
          Memo.UTF8W = (
            'R'#233'f'#233'rence : [frxDBDatasetDevis."REFERENCE_"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Observations: [frxDBDatasetDevis."OBSERV"]')
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
        DataSet = frxDBDatasetDevis
        DataSetName = 'frxDBDatasetDevis'
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetDevis."CODART"]')
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
          DataField = 'LIBELLE'
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[frxDBDatasetDevis."LIBELLE"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetDevis."QTE"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetDevis."PRIXHT"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
          Memo.UTF8W = (
            '[frxDBDatasetDevis."PRC_REMISE_2"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetDevis."PRIXNET"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetDevis."TOTHT_1"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetDevis."MT_TTC_1"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
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
            '[frxDBDatasetDevis."PRIXTTC"]')
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
          DataSet = frxDBDatasetDevis
          DataSetName = 'frxDBDatasetDevis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetDevis."NO_TVA"]')
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
        object Subreport1: TfrxSubreport
          AllowVectorExport = True
          Left = 3.779530050000000000
          Top = 26.456701020000000000
          Width = 362.834876440000000000
          Height = 102.047304040000000000
          Page = frxReportDevis.Page2
          PrintOnParent = True
        end
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
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 155.779541450000000000
          Top = 7.779530230000000000
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
          Top = 7.779530660000000000
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
          Top = 7.779530660000000000
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
          Top = 7.779530000000000000
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
          Top = 7.779530000000000000
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
          Top = 34.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TOTHT'
          DataSet = frxDBDatasetDevis
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
            '[frxDBDatasetDevis."TOTHT"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisPRC_REMISE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 15.118120000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'PRC_REMISE'
          DataSet = frxDBDatasetDevis
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
            '[frxDBDatasetDevis."PRC_REMISE"]')
          ParentFont = False
        end
        object MemofrxDBDatasetDevisMT_REMISE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 591.165740000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'MT_REMISE'
          DataSet = frxDBDatasetDevis
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
            '[frxDBDatasetDevis."MT_REMISE"]')
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
          DataField = 'MT_TVA'
          DataSet = frxDBDatasetDevis
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
            '[frxDBDatasetDevis."MT_TVA"]')
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
          DataField = 'MT_TTC'
          DataSet = frxDBDatasetDevis
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
            '[frxDBDatasetDevis."MT_TTC"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441241020000000000
          Top = 15.118113540000000000
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
          Left = 461.102653540000000000
          Top = 7.559051020000000000
          Width = 222.992270730000000000
          Height = 90.708714040000000000
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
          Width = 755.905511811023600000
          Height = 30.236218780000000000
          Frame.Typ = []
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 739.118602820000000000
          Top = 30.236240000000000000
          Width = 16.629921259842520000
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
            '[SUM(<frxDBDatasetDevis."TOTHT_1">,MasterData1)]')
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
            '[SUM(<frxDBDatasetDevis."QTE">,MasterData1)]')
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
        end
      end
    end
    object Page2: TfrxReportPage
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
          DataField = 'Taux'
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
  end
  object frxDBDatasetDevis: TfrxDBDataset
    UserName = 'frxDBDatasetDevis'
    CloseDataSource = False
    DataSet = FDQueryDevis
    BCDToCurrency = False
    DataSetOptions = []
    Left = 552
    Top = 152
    FieldDefs = <
      item
        FieldName = 'OBSERV'
        FieldType = fftString
        Size = 1000
      end
      item
        FieldName = 'TYPE_'
        FieldType = fftString
      end
      item
        FieldName = 'CODDEV'
      end
      item
        FieldName = 'CODCLI'
      end
      item
        FieldName = 'CODFAC'
      end
      item
        FieldName = 'CODCAI'
        FieldType = fftString
      end
      item
        FieldName = 'CODDEP'
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
        FieldName = 'CODGEO'
        FieldType = fftString
      end
      item
        FieldName = 'FLAG_TAX'
      end
      item
        FieldName = 'DER_MODIF'
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
        FieldName = 'SELECT_'
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
        FieldName = 'NOENR'
      end
      item
        FieldName = 'ANNEE_1'
      end
      item
        FieldName = 'MOIS_1'
      end
      item
        FieldName = 'CODREP_2'
      end
      item
        FieldName = 'CODFOU'
        FieldType = fftString
      end
      item
        FieldName = 'CODSSF'
        FieldType = fftString
      end
      item
        FieldName = 'CODFAM'
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
        FieldName = 'DET_PPT'
      end
      item
        FieldName = 'DET_ILE'
      end
      item
        FieldName = 'NOENRF'
      end
      item
        FieldName = 'DER_MODIF_2'
      end
      item
        FieldName = 'IMP_CODE'
      end
      item
        FieldName = 'TX_TSOC_1'
      end
      item
        FieldName = 'MT_TSOC_1'
      end>
  end
  object FDQueryDevis: TFDQuery
    MasterSource = DSEnt_prof
    MasterFields = 'CODDEV'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT '
      '  -- Donn'#233'es de l'#39'en-t'#234'te (vont se r'#233'p'#233'ter sur chaque ligne SQL)'
      '*'
      'FROM ent_prof e'
      'JOIN Client c ON e.CODCLI = c.CODCLI'
      'JOIN lig_prof l ON e.CODDEV = l.CODDEV'
      'WHERE e.CODDEV = :CODDEV'
      
        'ORDER BY e.CODDEV ASC, l.NOENRF ASC -- Le tri obligatoire pour l' +
        'a rupture'
      '')
    Left = 152
    Top = 136
    ParamData = <
      item
        Name = 'CODDEV'
        ParamType = ptInput
      end>
    object FDQueryDevisOBSERV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      Size = 1000
    end
    object FDQueryDevisTYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQueryDevisCODDEV: TLargeintField
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryDevisCODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQueryDevisCODFAC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
    end
    object FDQueryDevisCODCAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object FDQueryDevisCODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryDevisNOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      Size = 50
    end
    object FDQueryDevisNOTAHITI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI'
      Origin = 'NOTAHITI'
      Size = 10
    end
    object FDQueryDevisEXO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA'
      Origin = 'EXO_TVA'
    end
    object FDQueryDevisANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQueryDevisMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQueryDevisDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryDevisHEURE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'HEURE'
      Origin = 'HEURE'
    end
    object FDQueryDevisMT_REMISE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object FDQueryDevisPRC_REMISE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object FDQueryDevisTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object FDQueryDevisMT_TTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryDevisMT_HT0: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT0'
      Origin = 'MT_HT0'
      Precision = 11
      Size = 2
    end
    object FDQueryDevisMT_HT1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT1'
      Origin = 'MT_HT1'
      Precision = 11
      Size = 2
    end
    object FDQueryDevisMT_HT2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT2'
      Origin = 'MT_HT2'
      Precision = 11
      Size = 2
    end
    object FDQueryDevisMT_HT3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT3'
      Origin = 'MT_HT3'
      Precision = 11
      Size = 2
    end
    object FDQueryDevisMT_TVA1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA1'
      Origin = 'MT_TVA1'
      Precision = 9
      Size = 2
    end
    object FDQueryDevisMT_TVA2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA2'
      Origin = 'MT_TVA2'
      Precision = 9
      Size = 2
    end
    object FDQueryDevisMT_TVA3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA3'
      Origin = 'MT_TVA3'
      Precision = 9
      Size = 2
    end
    object FDQueryDevisMT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object FDQueryDevisMARGE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object FDQueryDevisREFERENCE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 15
    end
    object FDQueryDevisCODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQueryDevisNO_SEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object FDQueryDevisNO_JOUR: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object FDQueryDevisCODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQueryDevisJRSCRD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object FDQueryDevisFIN_MOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS'
      Origin = 'FIN_MOIS'
    end
    object FDQueryDevisLIBREG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBREG'
      Origin = 'LIBREG'
      Size = 50
    end
    object FDQueryDevisCRD_FORCE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CRD_FORCE'
      Origin = 'CRD_FORCE'
    end
    object FDQueryDevisDATE_ECH: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_ECH'
      Origin = 'DATE_ECH'
    end
    object FDQueryDevisREGL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REGL'
      Origin = 'REGL'
    end
    object FDQueryDevisCODGEO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO'
      Origin = 'CODGEO'
      Size = 1
    end
    object FDQueryDevisFLAG_TAX: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX'
      Origin = 'FLAG_TAX'
    end
    object FDQueryDevisDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryDevisMT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
    object FDQueryDevisMT_HTSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTSOC'
      Origin = 'MT_HTSOC'
      Precision = 11
      Size = 2
    end
    object FDQueryDevisTX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object FDQueryDevisEXO_CPS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS'
      Origin = 'EXO_CPS'
    end
    object FDQueryDevisMT_TVAI: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVAI'
      Origin = 'MT_TVAI'
      Precision = 9
      Size = 2
    end
    object FDQueryDevisMT_HTI: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTI'
      Origin = 'MT_HTI'
      Precision = 11
      Size = 2
    end
    object FDQueryDevisTVA_ILES: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES'
      Origin = 'TVA_ILES'
    end
    object FDQueryDevisOBSERV_1: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV_1'
      Origin = 'OBSERV'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object FDQueryDevisCODCLI_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI_1'
      Origin = 'CODCLI'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCPTAUX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPTAUX'
      Origin = 'CPTAUX'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryDevisNOM_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_1'
      Origin = 'NOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryDevisCODREP_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP_1'
      Origin = 'CODREP'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisPRC_REMISE_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE_1'
      Origin = 'PRC_REMISE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryDevisNOTEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTEL'
      Origin = 'NOTEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FDQueryDevisNOTAHITI_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI_1'
      Origin = 'NOTAHITI'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FDQueryDevisNOFAX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOFAX'
      Origin = 'NOFAX'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FDQueryDevisJRSCRD_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD_1'
      Origin = 'JRSCRD'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCREDIT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisplaf_crd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'plaf_crd'
      Origin = 'plaf_crd'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODPAI_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI_1'
      Origin = 'CODPAI'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object FDQueryDevisFIN_MOIS_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS_1'
      Origin = 'FIN_MOIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisNB_EX: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NB_EX'
      Origin = 'NB_EX'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCAAN: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CAAN'
      Origin = 'CAAN'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisAD1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD1'
      Origin = 'AD1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryDevisAD2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD2'
      Origin = 'AD2'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryDevisAD3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD3'
      Origin = 'AD3'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryDevisCUM_MVT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CUM_MVT'
      Origin = 'CUM_MVT'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisMT_CPTA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_CPTA'
      Origin = 'MT_CPTA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisEXO_TVA_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA_1'
      Origin = 'EXO_TVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisBLOQUE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'BLOQUE'
      Origin = 'BLOQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODGEO_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO_1'
      Origin = 'CODGEO'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryDevisCODTAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR'
      Origin = 'CODTAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryDevisADM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ADM'
      Origin = 'ADM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisFLAG_TAX_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX_1'
      Origin = 'FLAG_TAX'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODFAC_ADM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC_ADM'
      Origin = 'CODFAC_ADM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisFERME: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FERME'
      Origin = 'FERME'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisDER_MODIF_1: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF_1'
      Origin = 'DER_MODIF'
    end
    object FDQueryDevisSPEC_GOUV: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SPEC_GOUV'
      Origin = 'SPEC_GOUV'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisNOGSM: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NOGSM'
      Origin = 'NOGSM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisPLV: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PLV'
      Origin = 'PLV'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisINTIT_BQ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INTIT_BQ'
      Origin = 'INTIT_BQ'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQueryDevisCODE_BQ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODE_BQ'
      Origin = 'CODE_BQ'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object FDQueryDevisCODE_GUI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODE_GUI'
      Origin = 'CODE_GUI'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object FDQueryDevisNOCPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOCPT'
      Origin = 'NOCPT'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object FDQueryDevisCLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLE'
      Origin = 'CLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object FDQueryDevisCOEF_MAJ_PR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COEF_MAJ_PR'
      Origin = 'COEF_MAJ_PR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryDevisEXO_CPS_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS_1'
      Origin = 'EXO_CPS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisPAS_REM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PAS_REM'
      Origin = 'PAS_REM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisREM_FAM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REM_FAM'
      Origin = 'REM_FAM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisRELEVE_EMAIL: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'RELEVE_EMAIL'
      Origin = 'RELEVE_EMAIL'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisSELECT_: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisAPP_TARIFCLI: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'APP_TARIFCLI'
      Origin = 'APP_TARIFCLI'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisTVA_ILES_1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES_1'
      Origin = 'TVA_ILES'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisLIBELLE: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object FDQueryDevisCODFAC_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC_1'
      Origin = 'CODFAC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODCLI_2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI_2'
      Origin = 'CODCLI'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODCAI_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI_1'
      Origin = 'CODCAI'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object FDQueryDevisCODDEV_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV_1'
      Origin = 'CODDEV'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODDEP_1: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP_1'
      Origin = 'CODDEP'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisNOENR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisANNEE_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE_1'
      Origin = 'ANNEE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisMOIS_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS_1'
      Origin = 'MOIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODREP_2: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP_2'
      Origin = 'CODREP'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
    object FDQueryDevisCODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object FDQueryDevisCODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      ProviderFlags = []
      ReadOnly = True
      Size = 6
    end
    object FDQueryDevisCODDPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODDPT'
      Origin = 'CODDPT'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryDevisTYPE__1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE__1'
      Origin = 'TYPE_'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryDevisCODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryDevisCODBAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODBAR'
      Origin = 'CODBAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object FDQueryDevisQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 3
    end
    object FDQueryDevisPOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 7
      Size = 3
    end
    object FDQueryDevisCODTAR_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR_1'
      Origin = 'CODTAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object FDQueryDevisPRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryDevisPRIXTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXTTC'
      Origin = 'PRIXTTC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisPRIXNET: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXNET'
      Origin = 'PRIXNET'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryDevisTOTHT_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT_1'
      Origin = 'TOTHT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryDevisMT_TTC_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC_1'
      Origin = 'MT_TTC'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisPRC_REMISE_2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE_2'
      Origin = 'PRC_REMISE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryDevisMT_REMISE_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE_1'
      Origin = 'MT_REMISE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisTX_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TVA'
      Origin = 'TX_TVA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryDevisMT_TVA_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA_1'
      Origin = 'MT_TVA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object FDQueryDevisNO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_TVA'
      Origin = 'NO_TVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisPRIXREV: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXREV'
      Origin = 'PRIXREV'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object FDQueryDevisMARGE_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE_1'
      Origin = 'MARGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisNO_SEM_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM_1'
      Origin = 'NO_SEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisNO_JOUR_1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR_1'
      Origin = 'NO_JOUR'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisDET_PPT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_PPT'
      Origin = 'DET_PPT'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisDET_ILE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_ILE'
      Origin = 'DET_ILE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisNOENRF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENRF'
      Origin = 'NOENRF'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisDER_MODIF_2: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF_2'
      Origin = 'DER_MODIF'
    end
    object FDQueryDevisIMP_CODE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'IMP_CODE'
      Origin = 'IMP_CODE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDevisTX_TSOC_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC_1'
      Origin = 'TX_TSOC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object FDQueryDevisMT_TSOC_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC_1'
      Origin = 'MT_TSOC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 9
      Size = 2
    end
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
  object FDQueryTVA: TFDQuery
    MasterSource = DSEnt_prof
    MasterFields = 'CODDEV'
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
      'FROM ent_prof ep'
      'WHERE ep.CODDEV = :CODDEV AND ep.mt_ht0 <> 0'
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
      'FROM ent_prof ep'
      'WHERE ep.CODDEV = :CODDEV AND ep.mt_ht1 <> 0'
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
      'FROM ent_prof ep'
      'WHERE ep.CODDEV = :CODDEV AND ep.mt_ht2 <> 0'
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
      'FROM ent_prof ep'
      'WHERE ep.CODDEV = :CODDEV AND ep.mt_ht3 <> 0'
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
      'FROM ent_prof ep'
      'WHERE ep.CODDEV = :CODDEV AND ep.mt_hti <> 0'
      '')
    Left = 256
    Top = 136
    ParamData = <
      item
        Name = 'CODDEV'
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
  object frxDBDatasetTVA: TfrxDBDataset
    UserName = 'frxDBDatasetTVA'
    CloseDataSource = False
    DataSet = FDQueryTVA
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
end
