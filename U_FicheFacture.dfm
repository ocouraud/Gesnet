object FormFicheFacture: TFormFicheFacture
  Left = 0
  Top = 0
  Caption = 'Facture'
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
    Width = 56
    Height = 15
    Caption = 'No facture'
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
  object Label3: TLabel
    Left = 213
    Top = 40
    Width = 46
    Height = 15
    Caption = 'No devis'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 69
    Width = 32
    Height = 15
    Caption = 'Depot'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 213
    Top = 69
    Width = 43
    Height = 15
    Caption = 'Vendeur'
    FocusControl = DBEdit5
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
    Top = 98
    Width = 48
    Height = 15
    Caption = 'No client'
    FocusControl = DBEdit21
  end
  object DBEdit1: TDBEdit
    Left = 84
    Top = 6
    Width = 97
    Height = 25
    DataField = 'CODFAC'
    DataSource = DSEntvteaa
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
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 265
    Top = 37
    Width = 154
    Height = 23
    DataField = 'CODDEV'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 84
    Top = 66
    Width = 34
    Height = 23
    DataField = 'CODDEP'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 265
    Top = 66
    Width = 42
    Height = 23
    DataField = 'CODVEN'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 156
    Top = 95
    Width = 414
    Height = 23
    DataField = 'NOM'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 84
    Top = 119
    Width = 110
    Height = 23
    DataField = 'NOTAHITI'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit10: TDBEdit
    Left = 265
    Top = 8
    Width = 84
    Height = 23
    DataField = 'DATE_'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit11: TDBEdit
    Left = 355
    Top = 8
    Width = 64
    Height = 23
    DataField = 'HEURE'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit17: TDBEdit
    Left = 84
    Top = 37
    Width = 110
    Height = 23
    DataField = 'REFERENCE_'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit18: TDBEdit
    Left = 84
    Top = 145
    Width = 35
    Height = 23
    DataField = 'CODREP'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 10
  end
  object DBCheckBox1: TDBCheckBox
    Left = 208
    Top = 953
    Width = 97
    Height = 17
    Caption = 'TVA_ILES'
    DataField = 'TVA_ILES'
    DataSource = FormFicheClient.DSEntvteaa
    TabOrder = 11
  end
  object DBEdit21: TDBEdit
    Left = 84
    Top = 95
    Width = 66
    Height = 23
    DataField = 'CODCLI'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 12
  end
  object DBEdit19: TDBEdit
    Left = 311
    Top = 66
    Width = 258
    Height = 23
    DataField = 'NOMVEN'
    DataSource = DSEntvteaa
    Enabled = False
    ReadOnly = True
    TabOrder = 13
  end
  object JvDBGridLigvteaa: TJvDBGrid
    Left = 8
    Top = 174
    Width = 746
    Height = 259
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSLigvteaa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 14
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
    TabOrder = 15
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
      DataSource = DSEntvteaa
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
      DataSource = DSEntvteaa
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
      DataSource = DSEntvteaa
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
      DataSource = DSEntvteaa
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
      DataSource = DSEntvteaa
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
    object JvDBGrid1: TJvDBGrid
      Left = 8
      Top = 6
      Width = 456
      Height = 95
      Anchors = [akLeft, akBottom]
      DataSource = DSReglaa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      AlternateRowColor = clInfoBk
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 19
      TitleRowHeight = 19
      Columns = <
        item
          Expanded = False
          FieldName = 'CODPAI'
          Title.Caption = 'MODE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIBELLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTANT'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_'
          Title.Caption = 'DATE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_ECH'
          Title.Caption = 'ECHEANCE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TYPE_'
          Title.Caption = 'TYPE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOENR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONT_ARR'
          Visible = True
        end>
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
    TabOrder = 16
  end
  object RzDBRadioGroupType: TRzDBRadioGroup
    Left = 631
    Top = 42
    Width = 123
    Height = 84
    DataField = 'TYPE_'
    DataSource = DSEntvteaa
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
    TabOrder = 17
  end
  object RzDBCheckBox1: TRzDBCheckBox
    Left = 649
    Top = 132
    Width = 87
    Height = 18
    DataField = 'EXO_TVA'
    DataSource = DSEntvteaa
    ReadOnly = True
    ValueChecked = '1'
    ValueUnchecked = '0'
    Anchors = [akTop, akRight]
    Caption = 'Exonere TVA'
    Enabled = False
    TabOrder = 18
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
    TabOrder = 19
  end
  object RzDBCheckBox2: TRzDBCheckBox
    Left = 649
    Top = 150
    Width = 62
    Height = 18
    DataField = 'TVA_ILES'
    DataSource = DSEntvteaa
    ReadOnly = True
    ValueChecked = '1'
    ValueUnchecked = '0'
    Anchors = [akTop, akRight]
    Caption = 'TVA Iles'
    Enabled = False
    TabOrder = 20
  end
  object DSEntvteaa: TDataSource
    DataSet = DMGesCloud.FDQueryPrintEntvteaa
    Left = 32
    Top = 320
  end
  object FDQueryLigvteaa: TFDQuery
    MasterSource = DSEntvteaa
    MasterFields = 'CODFAC'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ligvteaa where codfac = :codfac')
    Left = 128
    Top = 312
    ParamData = <
      item
        Name = 'CODFAC'
        ParamType = ptInput
      end>
  end
  object DSLigvteaa: TDataSource
    DataSet = FDQueryLigvteaa
    Left = 232
    Top = 328
  end
  object DSReglaa: TDataSource
    DataSet = FDQueryReglaa
    Left = 336
    Top = 320
  end
  object FDQueryReglaa: TFDQuery
    MasterSource = DSEntvteaa
    MasterFields = 'CODFAC'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM reglaa WHERE CODFAC = :CODFAC')
    Left = 492
    Top = 278
    ParamData = <
      item
        Name = 'CODFAC'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object DSRepres: TDataSource
    DataSet = FDQueryRepres
    Left = 616
    Top = 296
  end
  object FDQueryRepres: TFDQuery
    MasterSource = DSEntvteaa
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
