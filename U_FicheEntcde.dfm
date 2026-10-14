object FormFicheEntcde: TFormFicheEntcde
  Left = 0
  Top = 0
  Caption = 'FormFicheEntcde'
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
  object Panel3: TPanel
    Left = 0
    Top = 528
    Width = 884
    Height = 133
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
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
    object DBTot_devise: TDBEdit
      Left = 655
      Top = 6
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'TOT_DEVISE'
      DataSource = DSMemTableEntcde
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnExit = DBTot_deviseExit
    end
    object DBTOT_TVA: TDBEdit
      Left = 655
      Top = 64
      Width = 87
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'TOT_TVA'
      DataSource = DSMemTableEntcde
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnExit = DBTOT_TVAExit
    end
    object DBTOT_FRET: TDBEdit
      Left = 655
      Top = 93
      Width = 87
      Height = 29
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'TOT_FRET'
      DataSource = DSMemTableEntcde
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      OnExit = DBTOT_FRETExit
    end
    object DBTot_cfp: TDBEdit
      Left = 656
      Top = 35
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'TOT_CFP'
      DataSource = DSMemTableEntcde
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnExit = DBTot_deviseExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 131
    Align = alTop
    TabOrder = 0
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
      Width = 56
      Height = 15
      Caption = 'No dossier'
    end
    object Label10: TLabel
      Left = 281
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
    object Label2: TLabel
      Left = 8
      Top = 98
      Width = 34
      Height = 15
      Caption = 'Libell'#233
    end
    object Label4: TLabel
      Left = 281
      Top = 40
      Width = 34
      Height = 15
      Caption = 'Devise'
    end
    object JvDBDate_: TJvDBDateEdit
      Left = 321
      Top = 8
      Width = 104
      Height = 23
      DataField = 'DATE_'
      DataSource = DSMemTableEntcde
      ShowNullDate = False
      TabOrder = 1
    end
    object DBDOSSIER: TDBEdit
      Left = 95
      Top = 37
      Width = 146
      Height = 23
      DataField = 'DOSSIER'
      DataSource = DSMemTableEntcde
      TabOrder = 2
    end
    object DBNOCDE: TDBEdit
      Left = 95
      Top = 6
      Width = 74
      Height = 25
      DataField = 'NOCDE'
      DataSource = DSMemTableEntcde
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
      DataSource = DSMemTableEntcde
      DropDownRows = 20
      KeyField = 'CODFOU'
      ListField = 'CODFOU;NOM'
      ListFieldIndex = 1
      ListSource = DSFournis
      TabOrder = 5
      OnExit = DBCODFOUExit
    end
    object DBCODFOU: TDBEdit
      Left = 95
      Top = 66
      Width = 53
      Height = 23
      DataField = 'CODFOU'
      DataSource = DSMemTableEntcde
      TabOrder = 4
      OnExit = DBCODFOUExit
    end
    object Panel12: TPanel
      Left = 766
      Top = 1
      Width = 117
      Height = 129
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
    object DBObserv: TDBLabeledEdit
      Left = 95
      Top = 95
      Width = 330
      Height = 23
      DataField = 'OBSERV'
      DataSource = DSMemTableEntcde
      TabOrder = 6
      EditLabel.Width = 3
      EditLabel.Height = 15
    end
    object JvDBLookupComboPoste: TJvDBLookupCombo
      Left = 321
      Top = 37
      Width = 104
      Height = 23
      DropDownWidth = 250
      DataField = 'DEVISE'
      DataSource = DSMemTableEntcde
      LookupField = 'CODE'
      LookupDisplay = 'CODE;LIBELLE;TAUX'
      LookupSource = DSParameDevise
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
    end
    object DBLookupComboBoxDepot: TDBLookupComboBox
      Left = 431
      Top = 95
      Width = 146
      Height = 23
      DataField = 'CODDEP'
      DataSource = DSMemTableEntcde
      DropDownWidth = 250
      KeyField = 'CODDEP'
      ListField = 'CODDEP;NOM'
      ListFieldIndex = 1
      ListSource = DSDepot
      TabOrder = 8
      OnClick = DBLookupComboBoxDepotClick
    end
  end
  object Panel5: TPanel
    Left = 766
    Top = 131
    Width = 118
    Height = 397
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
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
  object Panel2: TPanel
    Left = 661
    Top = 131
    Width = 105
    Height = 397
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 0
      Top = 0
      Width = 105
      Height = 28
      Align = alTop
      Caption = '&Valider '#10004
      Default = True
      TabOrder = 0
      OnClick = BtnValiderClick
    end
    object BitBtn2: TBitBtn
      Left = 0
      Top = 31
      Width = 105
      Height = 32
      Cancel = True
      Caption = '&Annuler '#10060
      ModalResult = 2
      TabOrder = 1
    end
  end
  object JvDBGridLignes: TJvDBGrid
    Left = 0
    Top = 131
    Width = 661
    Height = 397
    Align = alClient
    DataSource = DSMemTableLigcde
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
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
        FieldName = 'NOCDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODART'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_FOU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFOU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_UV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PX_UC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_UC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ETAT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_UV_RC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_UC_RC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COEF_PR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COEF_PV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PX_REV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PX_VTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOREC'
        Visible = True
      end>
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
  object DSMemTableEntcde: TDataSource
    DataSet = FDMemTableEntcde
    Left = 528
    Top = 354
  end
  object FDMemTableEntcde: TFDMemTable
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
  object FDMemTableLigcde: TFDMemTable
    OnCalcFields = FDMemTableLigcdeCalcFields
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
  object DSMemTableLigcde: TDataSource
    DataSet = FDMemTableLigcde
    Left = 524
    Top = 277
  end
  object FDQueryEntcde: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    Left = 48
    Top = 208
  end
  object FDQueryLigcde: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT '
      '    ligcde.* '
      'FROM ligcde'
      'WHERE ligcde.nocde = :nocde')
    Left = 40
    Top = 272
    ParamData = <
      item
        Name = 'NOCDE'
        ParamType = ptInput
      end>
  end
  object DSLigcde: TDataSource
    DataSet = FDQueryLigcde
    Left = 120
    Top = 272
  end
  object FDQueryArticle: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from article where codart=:codart')
    Left = 232
    Top = 224
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
  end
  object DSDepot: TDataSource
    DataSet = DM_Olivier.FDQueryDepot
    Left = 224
    Top = 312
  end
  object DSParameDevise: TDataSource
    DataSet = DM_Olivier.FDQueryParameDevise
    Left = 256
    Top = 440
  end
end
