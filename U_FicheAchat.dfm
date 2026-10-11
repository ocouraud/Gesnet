object FormFicheAchat: TFormFicheAchat
  Left = 0
  Top = 0
  Caption = 'FormFicheAchat'
  ClientHeight = 661
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  TextHeight = 15
  object JvDBGridLignes: TJvDBGrid
    Left = 0
    Top = 131
    Width = 766
    Height = 397
    Align = alClient
    DataSource = DSMemTableLigachjj
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnModifierLigneClick
    OnKeyDown = JvDBGridLignesKeyDown
    MultiSelect = True
    TitleButtons = True
    AlternateRowColor = clAzure
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
        FieldName = 'CODACH'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODFOU'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODART'
        Title.Caption = 'Code article'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'libelle'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE'
        Title.Alignment = taCenter
        Title.Caption = 'Quantit'#233
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIXHT'
        Title.Alignment = taCenter
        Title.Caption = 'Prix HT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIXTTC'
        Title.Alignment = taCenter
        Title.Caption = 'Prix TTC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTHT'
        Title.Alignment = taCenter
        Title.Caption = 'Total HT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TX_TVA'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Title.Alignment = taCenter
        Title.Caption = 'Mont. TVA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'mt_ttc'
        Title.Alignment = taCenter
        Title.Caption = 'Total TTC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOENR'
        Title.Caption = 'No ligne'
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 528
    Width = 884
    Height = 133
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      884
      133)
    object Label14: TLabel
      Left = 565
      Top = 9
      Width = 57
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'TOTAL HT.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 565
      Top = 67
      Width = 84
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'MONTANT TVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 697
    end
    object Label15: TLabel
      Left = 565
      Top = 96
      Width = 77
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'TOTAL TTC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 697
    end
    object Label3: TLabel
      Left = 565
      Top = 38
      Width = 42
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'REMISE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBMT_HT: TDBEdit
      Left = 655
      Top = 6
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_HT'
      DataSource = DSMemTableAchat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnExit = DBMT_HTExit
    end
    object DBMT_TVA: TDBEdit
      Left = 655
      Top = 64
      Width = 87
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TVA'
      DataSource = DSMemTableAchat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnExit = DBMT_TVAExit
      ExplicitLeft = 529
      ExplicitTop = 35
    end
    object DBMT_TTC: TDBEdit
      Left = 655
      Top = 93
      Width = 87
      Height = 29
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TTC'
      DataSource = DSMemTableAchat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      OnExit = DBMT_TTCExit
      ExplicitLeft = 529
      ExplicitTop = 64
    end
    object DBMT_REM: TDBEdit
      Left = 656
      Top = 35
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_REM'
      DataSource = DSMemTableAchat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnExit = DBMT_HTExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 131
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 758
    object Label21: TLabel
      Left = 8
      Top = 69
      Width = 68
      Height = 15
      Caption = 'Code fournis'
    end
    object Label17: TLabel
      Left = 8
      Top = 40
      Width = 52
      Height = 15
      Caption = 'Reference'
    end
    object Label10: TLabel
      Left = 291
      Top = 11
      Width = 24
      Height = 15
      Caption = 'Date'
    end
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 48
      Height = 15
      Caption = 'No achat'
    end
    object Label2: TLabel
      Left = 8
      Top = 98
      Width = 34
      Height = 15
      Caption = 'Libell'#233
    end
    object JvDBDate_: TJvDBDateEdit
      Left = 321
      Top = 8
      Width = 104
      Height = 23
      DataField = 'DATE_'
      DataSource = DSMemTableAchat
      ShowNullDate = False
      TabOrder = 1
    end
    object DBREFERENCE_: TDBEdit
      Left = 95
      Top = 37
      Width = 146
      Height = 23
      DataField = 'REFER'
      DataSource = DSMemTableAchat
      TabOrder = 2
    end
    object DBCODACH: TDBEdit
      Left = 95
      Top = 6
      Width = 53
      Height = 25
      DataField = 'CODACH'
      DataSource = DSMemTableAchat
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBLookupComboBoxFournis: TDBLookupComboBox
      Left = 154
      Top = 66
      Width = 423
      Height = 23
      DataField = 'CODFOU'
      DataSource = DSMemTableAchat
      DropDownRows = 20
      KeyField = 'CODFOU'
      ListField = 'CODFOU;NOM'
      ListFieldIndex = 1
      ListSource = DSFournis
      TabOrder = 4
      OnExit = DBCODFOUExit
    end
    object DBCODFOU: TDBEdit
      Left = 95
      Top = 66
      Width = 53
      Height = 23
      DataField = 'CODFOU'
      DataSource = DSMemTableAchat
      TabOrder = 3
      OnExit = DBCODFOUExit
    end
    object Panel12: TPanel
      Left = 766
      Top = 1
      Width = 117
      Height = 129
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 6
      ExplicitLeft = 640
      ExplicitHeight = 191
      object BtnValider: TBitBtn
        Left = 0
        Top = 0
        Width = 117
        Height = 30
        Align = alTop
        Anchors = [akTop]
        Caption = '&Valider '#10004
        Default = True
        TabOrder = 0
        OnClick = BtnValiderClick
      end
      object BtnAide: TBitBtn
        Left = 0
        Top = 60
        Width = 117
        Height = 30
        Align = alTop
        Caption = 'Aide '#10067
        TabOrder = 2
        OnClick = BtnAideClick
      end
      object BtnAnnuler: TBitBtn
        Left = 0
        Top = 30
        Width = 117
        Height = 30
        Align = alTop
        Cancel = True
        Caption = '&Annuler '#10060
        ModalResult = 2
        TabOrder = 1
      end
    end
    object DBLibelle: TDBLabeledEdit
      Left = 95
      Top = 95
      Width = 330
      Height = 23
      DataField = 'LIBELLE'
      DataSource = DSMemTableAchat
      TabOrder = 5
      EditLabel.Width = 49
      EditLabel.Height = 15
    end
  end
  object Panel5: TPanel
    Left = 766
    Top = 131
    Width = 118
    Height = 397
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 640
    ExplicitTop = 193
    ExplicitHeight = 237
    object BtnAjouterLigne: TButton
      Left = 0
      Top = 0
      Width = 118
      Height = 30
      Align = alTop
      Caption = 'Nouvelle ligne '#10133
      TabOrder = 0
      OnClick = BtnAjouterLigneClick
    end
    object BtnSupprimerLigne: TButton
      Left = 0
      Top = 60
      Width = 118
      Height = 30
      Align = alTop
      Caption = 'Supprimer lignes '#55357#56785#65039
      TabOrder = 2
      OnClick = BtnSupprimerLigneClick
    end
    object BtnModifierLigne: TButton
      Left = 0
      Top = 30
      Width = 118
      Height = 30
      Align = alTop
      Caption = 'Modifier ligne '#55357#56514
      TabOrder = 1
      OnClick = BtnModifierLigneClick
    end
  end
  object FDQueryFournis: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from fournis ')
    Left = 60
    Top = 386
  end
  object DSFournis: TDataSource
    DataSet = FDQueryFournis
    Left = 116
    Top = 365
  end
  object DSMemTableAchat: TDataSource
    DataSet = FDMemTableAchat
    Left = 528
    Top = 354
  end
  object FDMemTableAchat: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 364
    Top = 354
  end
  object FDMemTableLigachjj: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 376
    Top = 277
  end
  object DSMemTableLigachjj: TDataSource
    DataSet = FDMemTableLigachjj
    Left = 524
    Top = 277
  end
  object FDQueryAchat: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    Left = 48
    Top = 208
  end
  object FDQueryLigachjj: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT '
      '    ligachjj.*, '
      '    article.libelle, '
      '    (ligachjj.totht + ligachjj.mt_tva) AS mt_ttc '
      'FROM ligachjj'
      'INNER JOIN article ON article.codart = ligachjj.codart'
      'WHERE ligachjj.CODACH = :CODACH')
    Left = 40
    Top = 272
    ParamData = <
      item
        Name = 'CODACH'
        ParamType = ptInput
      end>
    object FDQueryLigachjjCODACH: TLargeintField
      FieldName = 'CODACH'
      Origin = 'CODACH'
      Required = True
    end
    object FDQueryLigachjjREFER: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFER'
      Origin = 'REFER'
      Size = 15
    end
    object FDQueryLigachjjDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryLigachjjCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQueryLigachjjCODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      Size = 4
    end
    object FDQueryLigachjjCODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      Size = 6
    end
    object FDQueryLigachjjCODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      Size = 13
    end
    object FDQueryLigachjjCODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryLigachjjQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      Precision = 10
      Size = 3
    end
    object FDQueryLigachjjPRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      Precision = 9
      Size = 2
    end
    object FDQueryLigachjjPRIXTTC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXTTC'
      Origin = 'PRIXTTC'
    end
    object FDQueryLigachjjTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object FDQueryLigachjjTX_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TVA'
      Origin = 'TX_TVA'
      Precision = 5
      Size = 2
    end
    object FDQueryLigachjjMT_TVA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
    end
    object FDQueryLigachjjNO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_TVA'
      Origin = 'NO_TVA'
    end
    object FDQueryLigachjjPOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      Precision = 9
      Size = 3
    end
    object FDQueryLigachjjNOENR: TFDAutoIncField
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQueryLigachjjDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryLigachjjTX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object FDQueryLigachjjMT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
    object FDQueryLigachjjNOENR_STO: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR_STO'
      Origin = 'NOENR_STO'
    end
    object FDQueryLigachjjlibelle: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'libelle'
      Origin = 'LIBELLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryLigachjjmt_ttc: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'mt_ttc'
      Origin = 'mt_ttc'
      ProviderFlags = []
      ReadOnly = True
      Precision = 12
      Size = 2
    end
  end
  object DSLigachjj: TDataSource
    DataSet = FDQueryLigachjj
    Left = 120
    Top = 272
  end
end
