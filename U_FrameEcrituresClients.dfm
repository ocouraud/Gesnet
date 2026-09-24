object FrameEcrituresClients: TFrameEcrituresClients
  Left = 0
  Top = 0
  Width = 1000
  Height = 578
  TabOrder = 0
  object JvDBGridClients: TJvDBGrid
    Left = 0
    Top = 41
    Width = 521
    Height = 508
    HelpType = htKeyword
    Align = alLeft
    DataSource = DSClients
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = JvDBGridClientsCellClick
    OnDblClick = BtnOuvrirClick
    AutoAppend = False
    TitleButtons = True
    OnTitleBtnClick = JvDBGridClientsTitleBtnClick
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
        FieldName = 'CPTAUX'
        Title.Caption = 'No compte'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCLI'
        Title.Caption = 'No client'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM'
        Title.Caption = 'Nom client'
        Width = 290
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CREDIT'
        Title.Caption = 'Solde'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTEL'
        Title.Caption = 'No Tel.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREP'
        Title.Caption = 'No repres.'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 6
    ExplicitTop = 8
    ExplicitWidth = 794
    object EdtCherche_CODCLI: TEdit
      Left = 90
      Top = 12
      Width = 65
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CODCLIChange
    end
    object EdtCherche_NOM: TEdit
      Left = 154
      Top = 12
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
    object CheckBoxFermes: TCheckBox
      Left = 351
      Top = 13
      Width = 104
      Height = 17
      Caption = 'Clients ferm'#233's'
      TabOrder = 2
    end
    object EdtCherche_CPTAUX: TEdit
      Left = 14
      Top = 12
      Width = 77
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CPTAUXChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 549
    Width = 1000
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 12
    ExplicitWidth = 800
    object BtnOuvrir: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Ouvrir'
      Default = True
      TabOrder = 0
      OnClick = BtnOuvrirClick
      ExplicitLeft = 87
    end
    object BtnFermer: TBitBtn
      Left = 913
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alRight
      Caption = '&Fermer'
      ModalResult = 8
      TabOrder = 1
      OnClick = BtnFermerClick
      ExplicitLeft = 713
    end
    object BtnAide: TBitBtn
      Left = 826
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 2
      OnClick = BtnAideClick
      ExplicitLeft = 626
    end
  end
  object JvDBGridTresor: TJvDBGrid
    Left = 530
    Top = 41
    Width = 470
    Height = 508
    Align = alRight
    DataSource = DSTresor
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    TitleButtons = True
    OnTitleBtnClick = JvDBGridTresorTitleBtnClick
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
        FieldName = 'DATE_'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOP_'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBIT'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDIT'
        Width = 72
        Visible = True
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
        FieldName = 'DATE_ECH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODPAI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOLDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SELECT_'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_OPER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_COMPTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYPE_'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LETTRE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOENR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = True
      end>
  end
  object DSClients: TDataSource
    DataSet = FDQueryClients
    Left = 320
    Top = 328
  end
  object FDQueryClients: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from client where ferme<>1 order by nom')
    Left = 96
    Top = 176
  end
  object FDQueryTresor: TFDQuery
    MasterSource = DSClients
    MasterFields = 'CODCLI'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from tresor where codcli=:codcli')
    Left = 592
    Top = 160
    ParamData = <
      item
        Name = 'CODCLI'
        ParamType = ptInput
      end>
    object FDQueryTresorCODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQueryTresorDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryTresorTOP_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TOP_'
      Origin = 'TOP_'
      Size = 1
    end
    object FDQueryTresorLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryTresorDEBIT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DEBIT'
      Origin = 'DEBIT'
    end
    object FDQueryTresorCREDIT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
    end
    object FDQueryTresorDATE_ECH: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_ECH'
      Origin = 'DATE_ECH'
    end
    object FDQueryTresorSOLDE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SOLDE'
      Origin = 'SOLDE'
    end
    object FDQueryTresorSELECT_: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
    end
    object FDQueryTresorREFERENCE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 15
    end
    object FDQueryTresorLETTRE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LETTRE'
      Origin = 'LETTRE'
      Size = 2
    end
    object FDQueryTresorNOENR: TFDAutoIncField
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
  end
  object DSTresor: TDataSource
    DataSet = FDQueryTresor
    Left = 592
    Top = 272
  end
end
