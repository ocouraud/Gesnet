object FormFicheDevis: TFormFicheDevis
  Left = 0
  Top = 0
  Caption = 'Devis'
  ClientHeight = 545
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    762
    545)
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 46
    Height = 15
    Caption = 'No devis'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 481
    Top = 148
    Width = 48
    Height = 15
    Caption = 'No poste'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 8
    Top = 69
    Width = 32
    Height = 15
    Caption = 'Depot'
    FocusControl = DBEdit4
  end
  object Label7: TLabel
    Left = 8
    Top = 122
    Width = 53
    Height = 15
    Caption = 'No TAHITI'
    FocusControl = DBEdit7
  end
  object Label10: TLabel
    Left = 213
    Top = 11
    Width = 24
    Height = 15
    Caption = 'Date'
    FocusControl = DBEdit10
  end
  object Label17: TLabel
    Left = 8
    Top = 40
    Width = 52
    Height = 15
    Caption = 'Reference'
    FocusControl = DBEdit17
  end
  object Label18: TLabel
    Left = 8
    Top = 148
    Width = 69
    Height = 15
    Caption = 'Representant'
    FocusControl = DBEdit18
  end
  object Label21: TLabel
    Left = 8
    Top = 96
    Width = 48
    Height = 15
    Caption = 'No client'
    FocusControl = DBEdit21
  end
  object DBEdit1: TDBEdit
    Left = 84
    Top = 6
    Width = 110
    Height = 25
    DataField = 'CODDEV'
    DataSource = DSEnt_prof
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
  object DBEdit2: TDBEdit
    Left = 535
    Top = 145
    Width = 34
    Height = 23
    DataField = 'CODCAI'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 84
    Top = 66
    Width = 34
    Height = 23
    DataField = 'CODDEP'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit6: TDBEdit
    Left = 156
    Top = 93
    Width = 414
    Height = 23
    DataField = 'NOM'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit7: TDBEdit
    Left = 84
    Top = 119
    Width = 110
    Height = 23
    DataField = 'NOTAHITI'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit10: TDBEdit
    Left = 265
    Top = 8
    Width = 84
    Height = 23
    DataField = 'DATE_'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit11: TDBEdit
    Left = 355
    Top = 8
    Width = 64
    Height = 23
    DataField = 'HEURE'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit17: TDBEdit
    Left = 84
    Top = 37
    Width = 110
    Height = 23
    DataField = 'REFERENCE_'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit18: TDBEdit
    Left = 84
    Top = 145
    Width = 35
    Height = 23
    DataField = 'CODREP'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 8
  end
  object DBCheckBox1: TDBCheckBox
    Left = 208
    Top = 953
    Width = 97
    Height = 17
    Caption = 'TVA_ILES'
    DataField = 'TVA_ILES'
    DataSource = FormFicheClient.DSEntvteaa
    TabOrder = 9
  end
  object DBEdit21: TDBEdit
    Left = 84
    Top = 93
    Width = 66
    Height = 23
    DataField = 'CODCLI'
    DataSource = DSEnt_prof
    Enabled = False
    ReadOnly = True
    TabOrder = 10
  end
  object JvDBGridLig_prof: TJvDBGrid
    Left = 8
    Top = 174
    Width = 746
    Height = 259
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSLig_prof
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    AlternateRowColor = clAliceblue
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'CODART'
        Title.Caption = 'CODE ARTICLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Width = 325
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODTAR'
        Title.Caption = 'TARIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRIXHT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRC_REMISE'
        Title.Caption = '% REM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIXNET'
        Title.Caption = 'PRIX NET'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIXTTC'
        Title.Caption = 'PRIX TTC'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTHT'
        Title.Caption = 'TOTAL HT'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TTC'
        Title.Caption = 'TOTAL TTC'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_REMISE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TX_TVA'
        Title.Caption = 'TX TVA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DET_PPT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DET_ILE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOENR'
        Title.Caption = 'No ENR STOCK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOENRF'
        Title.Caption = 'No RANG'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 439
    Width = 762
    Height = 106
    Align = alBottom
    TabOrder = 12
    DesignSize = (
      762
      106)
    object Label13: TLabel
      Left = 470
      Top = 7
      Width = 55
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = '% REMISE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 588
      Top = 7
      Width = 65
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'MT. REMISE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 598
      Top = 32
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
    end
    object Label16: TLabel
      Left = 569
      Top = 55
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
    end
    object Label15: TLabel
      Left = 593
      Top = 80
      Width = 60
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'TOTAL TTC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit13: TDBEdit
      Left = 535
      Top = 4
      Width = 35
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'PRC_REMISE'
      DataSource = DSEnt_prof
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
    object DBEdit12: TDBEdit
      Left = 659
      Top = 4
      Width = 85
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_REMISE'
      DataSource = DSEnt_prof
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
    object DBEdit14: TDBEdit
      Left = 659
      Top = 28
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'TOTHT'
      DataSource = DSEnt_prof
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit16: TDBEdit
      Left = 659
      Top = 52
      Width = 87
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TVA'
      DataSource = DSEnt_prof
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit15: TDBEdit
      Left = 659
      Top = 76
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TTC'
      DataSource = DSEnt_prof
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object DBEdit22: TDBEdit
    Left = 125
    Top = 145
    Width = 300
    Height = 23
    DataField = 'NOM'
    DataSource = DSRepres
    Enabled = False
    TabOrder = 13
  end
  object RzDBRadioGroupType: TRzDBRadioGroup
    Left = 631
    Top = 42
    Width = 123
    Height = 84
    DataField = 'TYPE_'
    DataSource = DSEnt_prof
    Items.Strings = (
      'Facture'
      'Avoir'
      'Avoir financier')
    ReadOnly = True
    Values.Strings = (
      'F'
      'A'
      'P')
    Anchors = [akTop, akRight]
    Caption = 'Nature'
    Color = 15658734
    Enabled = False
    TabOrder = 14
  end
  object RzDBCheckBox1: TRzDBCheckBox
    Left = 649
    Top = 132
    Width = 87
    Height = 18
    DataField = 'EXO_TVA'
    DataSource = DSEnt_prof
    ReadOnly = True
    ValueChecked = '1'
    ValueUnchecked = '0'
    Anchors = [akTop, akRight]
    Caption = 'Exonere TVA'
    Enabled = False
    TabOrder = 15
  end
  object BtnAnnuler: TBitBtn
    Left = 631
    Top = 4
    Width = 123
    Height = 32
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = '&Fermer'
    ModalResult = 8
    TabOrder = 16
  end
  object RzDBCheckBox2: TRzDBCheckBox
    Left = 649
    Top = 150
    Width = 62
    Height = 18
    DataField = 'TVA_ILES'
    DataSource = DSEnt_prof
    ReadOnly = True
    ValueChecked = '1'
    ValueUnchecked = '0'
    Anchors = [akTop, akRight]
    Caption = 'TVA Iles'
    Enabled = False
    TabOrder = 17
  end
  object DSEnt_prof: TDataSource
    DataSet = DM_Olivier.FDQueryEnt_prof
    Left = 32
    Top = 320
  end
  object FDQueryLig_prof: TFDQuery
    MasterSource = DSEnt_prof
    MasterFields = 'CODDEV'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from lig_prof where coddev = :coddev')
    Left = 128
    Top = 312
    ParamData = <
      item
        Name = 'CODDEV'
        ParamType = ptInput
      end>
  end
  object DSLig_prof: TDataSource
    DataSet = FDQueryLig_prof
    Left = 232
    Top = 328
  end
  object DSRepres: TDataSource
    DataSet = FDQueryRepres
    Left = 616
    Top = 296
  end
  object FDQueryRepres: TFDQuery
    MasterSource = DSEnt_prof
    MasterFields = 'CODREP'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM repres  WHERE CODREP = :CODREP')
    Left = 464
    Top = 344
    ParamData = <
      item
        Name = 'CODREP'
        ParamType = ptInput
      end>
    object FDQueryRepresCODREP: TSmallintField
      FieldName = 'CODREP'
      Origin = 'CODREP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryRepresNOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      Size = 30
    end
  end
end
