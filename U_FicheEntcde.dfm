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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 257
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
      Left = 363
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
      Top = 185
      Width = 34
      Height = 15
      Caption = 'Libell'#233
    end
    object Label4: TLabel
      Left = 528
      Top = 67
      Width = 34
      Height = 15
      Caption = 'Devise'
    end
    object Label5: TLabel
      Left = 657
      Top = 69
      Width = 24
      Height = 15
      Caption = 'Taux'
    end
    object Label6: TLabel
      Left = 528
      Top = 98
      Width = 32
      Height = 15
      Caption = 'D'#233'p'#244't'
    end
    object Label7: TLabel
      Left = 8
      Top = 96
      Width = 46
      Height = 15
      Caption = 'Assureur'
    end
    object Label8: TLabel
      Left = 8
      Top = 127
      Width = 66
      Height = 15
      Caption = 'Transporteur'
    end
    object Label9: TLabel
      Left = 8
      Top = 156
      Width = 72
      Height = 15
      Caption = 'Com. douane'
    end
    object JvDBDate_: TJvDBDateEdit
      Left = 393
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
      Width = 343
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
      Height = 255
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 6
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
    object JvDBLookupComboDevise: TJvDBLookupCombo
      Left = 568
      Top = 66
      Width = 81
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
      OnChange = JvDBLookupComboDeviseChange
    end
    object DBLookupComboBoxDepot: TDBLookupComboBox
      Left = 568
      Top = 95
      Width = 192
      Height = 23
      DataField = 'CODDEP'
      DataSource = DSMemTableEntcde
      DropDownWidth = 250
      KeyField = 'CODDEP'
      ListField = 'CODDEP;NOM'
      ListFieldIndex = 1
      ListSource = DSDepot
      TabOrder = 7
      OnClick = DBLookupComboBoxDepotClick
    end
    object JvDBCalcEdit1: TJvDBCalcEdit
      Left = 687
      Top = 66
      Width = 73
      Height = 23
      TabOrder = 8
      DecimalPlacesAlwaysShown = False
      DataField = 'TAUX'
      DataSource = DSMemTableEntcde
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 528
      Top = 0
      Width = 232
      Height = 52
      Caption = 'Mode d'#39'expedition'
      Columns = 3
      DataField = 'EXPED'
      DataSource = DSMemTableEntcde
      Items.Strings = (
        'Avion'
        'Bateau'
        'Autre')
      TabOrder = 9
      Values.Strings = (
        'A'
        'B'
        'X')
    end
    object DBLookupComboBoxASSUR: TDBLookupComboBox
      Left = 95
      Top = 95
      Width = 330
      Height = 23
      DataField = 'ASSUR'
      DataSource = DSMemTableEntcde
      DropDownRows = 20
      KeyField = 'CODFOU'
      ListField = 'CODFOU;NOM'
      ListFieldIndex = 1
      ListSource = DSFournis
      TabOrder = 10
      OnExit = DBCODFOUExit
    end
    object DBLookupComboBoxTRANSP: TDBLookupComboBox
      Left = 95
      Top = 124
      Width = 330
      Height = 23
      DataField = 'TRANSP'
      DataSource = DSMemTableEntcde
      DropDownRows = 20
      KeyField = 'CODFOU'
      ListField = 'CODFOU;NOM'
      ListFieldIndex = 1
      ListSource = DSFournis
      TabOrder = 11
      OnExit = DBCODFOUExit
    end
    object DBLookupComboBoxCOM_DOU: TDBLookupComboBox
      Left = 95
      Top = 153
      Width = 330
      Height = 23
      DataField = 'COM_DOU'
      DataSource = DSMemTableEntcde
      DropDownRows = 20
      KeyField = 'CODFOU'
      ListField = 'CODFOU;NOM'
      ListFieldIndex = 1
      ListSource = DSFournis
      TabOrder = 12
      OnExit = DBCODFOUExit
    end
    object DBMemoObserv: TDBMemo
      Left = 95
      Top = 182
      Width = 402
      Height = 65
      DataField = 'OBSERV'
      DataSource = DSMemTableEntcde
      TabOrder = 13
    end
  end
  object Panel5: TPanel
    Left = 766
    Top = 257
    Width = 118
    Height = 404
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 271
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
  object JvDBGridLignes: TJvDBGrid
    Left = 0
    Top = 257
    Width = 766
    Height = 404
    Align = alClient
    DataSource = DSMemTableLigcde
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnModifierLigneClick
    OnKeyDown = JvDBGridLignesKeyDown
    MultiSelect = True
    TitleButtons = True
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
        FieldName = 'NOCDE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODART'
        Title.Caption = 'Code article'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_FOU'
        Title.Caption = 'Ref. fournisseur'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFOU'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Title.Caption = 'D'#233'signation'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UV'
        Title.Caption = 'Unit. vte'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UC'
        Title.Caption = 'Unit cde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_UC'
        Title.Caption = 'Quantit'#233' UC'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE_UV'
        Title.Caption = 'Quantit'#233' UV'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PX_UC'
        Title.Caption = 'Prix UC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PX_REV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ETAT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'QTE_UV_RC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'QTE_UC_RC'
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
        FieldName = 'PX_VTE'
        Visible = False
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
    Left = 208
    Top = 288
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
