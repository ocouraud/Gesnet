object FormFicheAchat: TFormFicheAchat
  Left = 0
  Top = 0
  Caption = 'FormFicheAchat'
  ClientHeight = 534
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  TextHeight = 15
  object JvDBGridLigcde_cli: TJvDBGrid
    Left = 0
    Top = 193
    Width = 640
    Height = 237
    Align = alClient
    DataSource = DSMemTableLigcde_cli
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnModifierLigneClick
    OnKeyDown = JvDBGridLigcde_cliKeyDown
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
        FieldName = 'NOREC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOCDE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODCLI'
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
        FieldName = 'LIBELLE'
        Title.Caption = 'D'#233'signation'
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'QTE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantit'#233
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIXHT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prix HT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIXTTC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prix TTC'
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
        FieldName = 'TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TX_TVA'
        Title.Alignment = taCenter
        Title.Caption = 'Tx TVA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Mont. TVA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TTC'
        Title.Caption = 'Mont. TTC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_VALID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOLIG'
        Title.Caption = 'No ligne'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERV'
        Visible = False
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 430
    Width = 758
    Height = 104
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      758
      104)
    object Label14: TLabel
      Left = 439
      Top = 9
      Width = 55
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'TOTAL HT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 697
      ExplicitTop = 38
    end
    object Label16: TLabel
      Left = 439
      Top = 38
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
      ExplicitTop = 67
    end
    object Label15: TLabel
      Left = 439
      Top = 67
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
      ExplicitTop = 96
    end
    object DBTOTHT: TDBEdit
      Left = 530
      Top = 6
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'TOTHT'
      DataSource = DSMemTableEntcde_cli
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBMT_TVA: TDBEdit
      Left = 529
      Top = 35
      Width = 87
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TVA'
      DataSource = DSMemTableEntcde_cli
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBMT_TTC: TDBEdit
      Left = 529
      Top = 64
      Width = 87
      Height = 29
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TTC'
      DataSource = DSMemTableEntcde_cli
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 193
    Align = alTop
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 93
      Width = 127
      Height = 15
      Caption = 'Nom sur facture . . . . . >'
    end
    object Label21: TLabel
      Left = 8
      Top = 69
      Width = 48
      Height = 15
      Caption = 'No client'
    end
    object Label17: TLabel
      Left = 8
      Top = 40
      Width = 52
      Height = 15
      Caption = 'Reference'
    end
    object Label10: TLabel
      Left = 245
      Top = 11
      Width = 24
      Height = 15
      Caption = 'Date'
    end
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 80
      Height = 15
      Caption = 'No commande'
    end
    object JvDBDate_: TJvDBDateEdit
      Left = 275
      Top = 8
      Width = 104
      Height = 23
      DataField = 'DATE_'
      DataSource = DSMemTableEntcde_cli
      ShowNullDate = False
      TabOrder = 0
    end
    object DBREFERENCE_: TDBEdit
      Left = 95
      Top = 37
      Width = 146
      Height = 23
      DataField = 'REFERENCE_'
      DataSource = DSMemTableEntcde_cli
      TabOrder = 1
    end
    object DBNOM: TDBEdit
      Left = 154
      Top = 90
      Width = 423
      Height = 23
      DataField = 'NOMCLI'
      DataSource = DSMemTableEntcde_cli
      TabOrder = 2
    end
    object DBNOCDE: TDBEdit
      Left = 95
      Top = 6
      Width = 53
      Height = 25
      DataField = 'NOCDE'
      DataSource = DSMemTableEntcde_cli
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBMemoObserv: TDBMemo
      Left = 154
      Top = 126
      Width = 423
      Height = 60
      DataField = 'OBSERV'
      DataSource = DSMemTableEntcde_cli
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DBLookupComboBoxClient: TDBLookupComboBox
      Left = 154
      Top = 66
      Width = 423
      Height = 23
      DataField = 'CODCLI'
      DataSource = DSMemTableEntcde_cli
      KeyField = 'CODCLI'
      ListField = 'CODCLI;NOM'
      ListFieldIndex = 1
      ListSource = DSClient
      TabOrder = 5
    end
    object DBCODCLI: TDBEdit
      Left = 95
      Top = 66
      Width = 53
      Height = 23
      DataField = 'CODCLI'
      DataSource = DSMemTableEntcde_cli
      TabOrder = 6
      OnExit = DBCODCLIExit
    end
    object Panel12: TPanel
      Left = 640
      Top = 1
      Width = 117
      Height = 191
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 7
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
  end
  object Panel5: TPanel
    Left = 640
    Top = 193
    Width = 118
    Height = 237
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
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
  object FDQueryClientsOuverts: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from client where ferme<>1')
    Left = 60
    Top = 386
    object FDQueryClientsOuvertsOBSERV: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      BlobType = ftMemo
    end
    object FDQueryClientsOuvertsCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryClientsOuvertsCPTAUX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPTAUX'
      Origin = 'CPTAUX'
      Size = 13
    end
    object FDQueryClientsOuvertsNOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      Size = 50
    end
    object FDQueryClientsOuvertsCODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQueryClientsOuvertsPRC_REMISE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object FDQueryClientsOuvertsNOTEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTEL'
      Origin = 'NOTEL'
      Size = 15
    end
    object FDQueryClientsOuvertsNOTAHITI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI'
      Origin = 'NOTAHITI'
      Size = 10
    end
    object FDQueryClientsOuvertsNOFAX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOFAX'
      Origin = 'NOFAX'
      Size = 15
    end
    object FDQueryClientsOuvertsJRSCRD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object FDQueryClientsOuvertsCREDIT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
    end
    object FDQueryClientsOuvertsplaf_crd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'plaf_crd'
      Origin = 'plaf_crd'
    end
    object FDQueryClientsOuvertsCODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQueryClientsOuvertsFIN_MOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS'
      Origin = 'FIN_MOIS'
    end
    object FDQueryClientsOuvertsNB_EX: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NB_EX'
      Origin = 'NB_EX'
    end
    object FDQueryClientsOuvertsCAAN: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CAAN'
      Origin = 'CAAN'
    end
    object FDQueryClientsOuvertsAD1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD1'
      Origin = 'AD1'
      Size = 30
    end
    object FDQueryClientsOuvertsAD2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD2'
      Origin = 'AD2'
      Size = 30
    end
    object FDQueryClientsOuvertsAD3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AD3'
      Origin = 'AD3'
      Size = 30
    end
    object FDQueryClientsOuvertsCUM_MVT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CUM_MVT'
      Origin = 'CUM_MVT'
    end
    object FDQueryClientsOuvertsMT_CPTA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_CPTA'
      Origin = 'MT_CPTA'
    end
    object FDQueryClientsOuvertsEXO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA'
      Origin = 'EXO_TVA'
    end
    object FDQueryClientsOuvertsBLOQUE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'BLOQUE'
      Origin = 'BLOQUE'
    end
    object FDQueryClientsOuvertsCODGEO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO'
      Origin = 'CODGEO'
    end
    object FDQueryClientsOuvertsEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object FDQueryClientsOuvertsCODTAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR'
      Origin = 'CODTAR'
      Size = 1
    end
    object FDQueryClientsOuvertsADM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ADM'
      Origin = 'ADM'
    end
    object FDQueryClientsOuvertsFLAG_TAX: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX'
      Origin = 'FLAG_TAX'
    end
    object FDQueryClientsOuvertsCODFAC_ADM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC_ADM'
      Origin = 'CODFAC_ADM'
    end
    object FDQueryClientsOuvertsFERME: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FERME'
      Origin = 'FERME'
    end
    object FDQueryClientsOuvertsDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryClientsOuvertsSPEC_GOUV: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SPEC_GOUV'
      Origin = 'SPEC_GOUV'
    end
    object FDQueryClientsOuvertsNOGSM: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NOGSM'
      Origin = 'NOGSM'
    end
    object FDQueryClientsOuvertsPLV: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PLV'
      Origin = 'PLV'
    end
    object FDQueryClientsOuvertsINTIT_BQ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INTIT_BQ'
      Origin = 'INTIT_BQ'
      Size = 30
    end
    object FDQueryClientsOuvertsCODE_BQ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODE_BQ'
      Origin = 'CODE_BQ'
      Size = 5
    end
    object FDQueryClientsOuvertsCODE_GUI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODE_GUI'
      Origin = 'CODE_GUI'
      Size = 5
    end
    object FDQueryClientsOuvertsNOCPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOCPT'
      Origin = 'NOCPT'
      Size = 11
    end
    object FDQueryClientsOuvertsCLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLE'
      Origin = 'CLE'
      Size = 2
    end
    object FDQueryClientsOuvertsCOEF_MAJ_PR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COEF_MAJ_PR'
      Origin = 'COEF_MAJ_PR'
      Precision = 5
      Size = 2
    end
    object FDQueryClientsOuvertsEXO_CPS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS'
      Origin = 'EXO_CPS'
    end
    object FDQueryClientsOuvertsPAS_REM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PAS_REM'
      Origin = 'PAS_REM'
    end
    object FDQueryClientsOuvertsREM_FAM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REM_FAM'
      Origin = 'REM_FAM'
    end
    object FDQueryClientsOuvertsRELEVE_EMAIL: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'RELEVE_EMAIL'
      Origin = 'RELEVE_EMAIL'
    end
    object FDQueryClientsOuvertsSELECT_: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
    end
    object FDQueryClientsOuvertsAPP_TARIFCLI: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'APP_TARIFCLI'
      Origin = 'APP_TARIFCLI'
    end
    object FDQueryClientsOuvertsTVA_ILES: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES'
      Origin = 'TVA_ILES'
    end
  end
  object DSClient: TDataSource
    DataSet = FDQueryClientsOuverts
    Left = 116
    Top = 365
  end
  object DSMemTableEntcde_cli: TDataSource
    DataSet = FDMemTableEntcde_cli
    Left = 528
    Top = 354
  end
  object FDMemTableEntcde_cli: TFDMemTable
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
  object FDMemTableLigcde_cli: TFDMemTable
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
  object DSMemTableLigcde_cli: TDataSource
    DataSet = FDMemTableLigcde_cli
    Left = 524
    Top = 277
  end
  object FDQueryEntcde_cli: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    Left = 48
    Top = 208
  end
  object FDQueryLigcde_cli: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ligcde_cli WHERE nocde=:nocde ')
    Left = 40
    Top = 272
    ParamData = <
      item
        Name = 'NOCDE'
        ParamType = ptInput
      end>
  end
end
