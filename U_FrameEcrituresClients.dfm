object FrameEcrituresClients: TFrameEcrituresClients
  Left = 0
  Top = 0
  Width = 1000
  Height = 578
  TabOrder = 0
  object JvDBGridClients: TJvDBGrid
    Left = 0
    Top = 73
    Width = 521
    Height = 423
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
        Alignment = taRightJustify
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
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object EdtCherche_CODCLI: TEdit
      Left = 90
      Top = 41
      Width = 65
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CODCLIChange
    end
    object EdtCherche_NOM: TEdit
      Left = 154
      Top = 41
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
    object CheckBoxFermes: TCheckBox
      Left = 351
      Top = 42
      Width = 104
      Height = 17
      Caption = 'Clients ferm'#233's'
      TabOrder = 2
    end
    object EdtCherche_CPTAUX: TEdit
      Left = 14
      Top = 41
      Width = 77
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CPTAUXChange
    end
    object rgFiltreEcritures: TRzRadioGroup
      Left = 522
      Top = 19
      Width = 334
      Height = 48
      Caption = ''
      Color = 15658734
      Columns = 4
      HorizontalSpacing = 20
      ItemIndex = 3
      Items.Strings = (
        'Toutes'
        'Non sold'#233'es'
        'Sold'#233'es'
        'Aucune')
      TabOrder = 4
      Transparent = True
      OnClick = rgFiltreEcrituresClick
    end
    object BtnFermer: TBitBtn
      Left = 913
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Fermer'
      ModalResult = 8
      TabOrder = 5
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 913
      Top = 35
      Width = 87
      Height = 29
      Caption = 'Aide'
      TabOrder = 6
      OnClick = BtnAideClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 496
    Width = 1000
    Height = 82
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      1000
      82)
    object LblTotalCredit: TLabel
      Left = 904
      Top = 6
      Width = 73
      Height = 15
      Alignment = taRightJustify
      Caption = 'LblTotalCredit'
    end
    object LblTotalDebit: TLabel
      Left = 829
      Top = 6
      Width = 69
      Height = 15
      Alignment = taRightJustify
      Caption = 'LblTotalDebit'
    end
    object TLabelSolde: TLabel
      Left = 829
      Top = 27
      Width = 7
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 788
      Top = 27
      Width = 35
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Solde :'
    end
    object LettrageCR: TLabel
      Left = 656
      Top = 6
      Width = 73
      Height = 15
      Alignment = taRightJustify
      Caption = 'LblTotalCredit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object LettrageDB: TLabel
      Left = 581
      Top = 6
      Width = 69
      Height = 15
      Alignment = taRightJustify
      Caption = 'LblTotalDebit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object Label1: TLabel
      Left = 521
      Top = 27
      Width = 35
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Solde :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object LettrageSolde: TLabel
      Left = 562
      Top = 27
      Width = 7
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object Label2: TLabel
      Left = 521
      Top = 6
      Width = 54
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'S'#233'lection :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object Label3: TLabel
      Left = 785
      Top = 6
      Width = 38
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Totaux:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object BtnOuvrir: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Ouvrir'
      Default = True
      TabOrder = 0
      OnClick = BtnOuvrirClick
    end
    object BtnSupprimer: TBitBtn
      Left = 707
      Top = 48
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Supprimer'
      TabOrder = 1
    end
    object BtnModifier: TBitBtn
      Left = 614
      Top = 48
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Modifier'
      TabOrder = 2
      OnClick = BtnModifierClick
    end
    object BtnAjouter: TBitBtn
      Left = 522
      Top = 48
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Ajouter'
      TabOrder = 3
      OnClick = BtnAjouterClick
    end
  end
  object JvDBGridTresor: TJvDBGrid
    Left = 521
    Top = 73
    Width = 479
    Height = 423
    Align = alClient
    DataSource = DSTresor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = JvDBGridTresorCellClick
    OnKeyUp = JvDBGridTresorKeyUp
    AutoAppend = False
    MultiSelect = True
    TitleButtons = True
    OnTitleBtnClick = JvDBGridTresorTitleBtnClick
    AlternateRowColor = clInfoBk
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
        FieldName = 'DATE_'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOP_'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Title.Caption = 'Libell'#233
        Width = 146
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
        FieldName = 'CODJAL'
        Title.Caption = 'Journal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_ECH'
        Title.Caption = 'Ech'#233'ance'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODPAI'
        Title.Caption = 'Paiement'
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
  end
  object DSTresor: TDataSource
    DataSet = FDQueryTresor
    Left = 592
    Top = 272
  end
end
