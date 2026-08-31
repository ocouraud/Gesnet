object FormEntvtejj: TFormEntvtejj
  Left = 0
  Top = 0
  Caption = 'FormEntvtejj'
  ClientHeight = 661
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  DesignSize = (
    984
    661)
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 56
    Height = 15
    Caption = 'No facture'
  end
  object Label2: TLabel
    Left = 481
    Top = 148
    Width = 48
    Height = 15
    Caption = 'No poste'
  end
  object Label3: TLabel
    Left = 213
    Top = 40
    Width = 46
    Height = 15
    Caption = 'No devis'
  end
  object Label4: TLabel
    Left = 8
    Top = 69
    Width = 32
    Height = 15
    Caption = 'Depot'
  end
  object Label5: TLabel
    Left = 213
    Top = 69
    Width = 43
    Height = 15
    Caption = 'Vendeur'
  end
  object Label7: TLabel
    Left = 8
    Top = 122
    Width = 53
    Height = 15
    Caption = 'No TAHITI'
  end
  object Label10: TLabel
    Left = 213
    Top = 11
    Width = 24
    Height = 15
    Caption = 'Date'
  end
  object Label17: TLabel
    Left = 8
    Top = 40
    Width = 52
    Height = 15
    Caption = 'Reference'
  end
  object Label18: TLabel
    Left = 8
    Top = 148
    Width = 69
    Height = 15
    Caption = 'Representant'
  end
  object Label21: TLabel
    Left = 8
    Top = 98
    Width = 48
    Height = 15
    Caption = 'No client'
  end
  object DBCODFAC: TDBEdit
    Left = 84
    Top = 6
    Width = 97
    Height = 25
    DataField = 'CODFAC'
    DataSource = DSMemTableEntvtejj
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
  object DBCODCAI: TDBEdit
    Left = 535
    Top = 145
    Width = 34
    Height = 23
    DataField = 'CODCAI'
    DataSource = DSMemTableEntvtejj
    Enabled = False
    ReadOnly = True
    TabOrder = 10
  end
  object DBCODDEV: TDBEdit
    Left = 265
    Top = 37
    Width = 84
    Height = 23
    DataField = 'CODDEV'
    DataSource = DSMemTableEntvtejj
    TabOrder = 3
  end
  object DBCODDEP: TDBEdit
    Left = 84
    Top = 66
    Width = 34
    Height = 23
    DataField = 'CODDEP'
    DataSource = DSMemTableEntvtejj
    Enabled = False
    TabOrder = 4
  end
  object DBCODVEN: TDBEdit
    Left = 265
    Top = 66
    Width = 42
    Height = 23
    DataField = 'CODVEN'
    DataSource = DSMemTableEntvtejj
    TabOrder = 5
  end
  object DBNOM: TDBEdit
    Left = 156
    Top = 95
    Width = 414
    Height = 23
    DataField = 'NOM'
    DataSource = DSMemTableEntvtejj
    TabOrder = 7
  end
  object DBNOTAHITI: TDBEdit
    Left = 84
    Top = 119
    Width = 110
    Height = 23
    DataField = 'NOTAHITI'
    DataSource = DSMemTableEntvtejj
    TabOrder = 8
  end
  object DBDATE_: TDBEdit
    Left = 265
    Top = 8
    Width = 84
    Height = 23
    DataField = 'DATE_'
    DataSource = DSMemTableEntvtejj
    TabOrder = 1
  end
  object DBHEURE: TDBEdit
    Left = 355
    Top = 8
    Width = 64
    Height = 23
    DataField = 'HEURE'
    DataSource = DSMemTableEntvtejj
    Enabled = False
    ReadOnly = True
    TabOrder = 11
  end
  object DBREFERENCE_: TDBEdit
    Left = 84
    Top = 37
    Width = 110
    Height = 23
    DataField = 'REFERENCE_'
    DataSource = DSMemTableEntvtejj
    TabOrder = 2
  end
  object DBCODREP: TDBEdit
    Left = 84
    Top = 145
    Width = 35
    Height = 23
    DataField = 'CODREP'
    DataSource = DSMemTableEntvtejj
    TabOrder = 9
  end
  object DBCODCLI: TDBEdit
    Left = 84
    Top = 95
    Width = 66
    Height = 23
    DataField = 'CODCLI'
    DataSource = DSMemTableEntvtejj
    TabOrder = 6
  end
  object DNOMVEN: TDBEdit
    Left = 311
    Top = 66
    Width = 258
    Height = 23
    DataField = 'NOMVEN'
    DataSource = DSMemTableEntvtejj
    Enabled = False
    ReadOnly = True
    TabOrder = 12
  end
  object JvDBGridLigvtejj: TJvDBGrid
    Left = 8
    Top = 174
    Width = 873
    Height = 379
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSMemTableLigvtejj
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 16
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
    Top = 555
    Width = 984
    Height = 106
    Align = alBottom
    TabOrder = 18
    DesignSize = (
      984
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
    object DBPRC_REMISE: TDBEdit
      Left = 535
      Top = 4
      Width = 35
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'PRC_REMISE'
      DataSource = DSMemTableEntvtejj
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
    end
    object DBMT_REMISE: TDBEdit
      Left = 659
      Top = 4
      Width = 85
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_REMISE'
      DataSource = DSMemTableEntvtejj
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
    object DBTOTHT: TDBEdit
      Left = 659
      Top = 28
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'TOTHT'
      DataSource = DSMemTableEntvtejj
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
    object DBMT_TVA: TDBEdit
      Left = 659
      Top = 52
      Width = 87
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TVA'
      DataSource = DSMemTableEntvtejj
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
    object DBMT_TTC: TDBEdit
      Left = 659
      Top = 76
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      DataField = 'MT_TTC'
      DataSource = DSMemTableEntvtejj
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
    object JvDBGridRegljj: TJvDBGrid
      Left = 8
      Top = 6
      Width = 456
      Height = 95
      Anchors = [akLeft, akBottom]
      DataSource = DSMemTableRegljj
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
  object DBNOM_REP: TDBEdit
    Left = 125
    Top = 145
    Width = 300
    Height = 23
    DataField = 'NOM'
    Enabled = False
    TabOrder = 13
  end
  object RzDBRadioGroupType: TRzDBRadioGroup
    Left = 735
    Top = 8
    Width = 123
    Height = 84
    DataField = 'TYPE_'
    DataSource = DSMemTableEntvtejj
    Items.Strings = (
      'Facture'
      'Avoir'
      'Avoir financier')
    Values.Strings = (
      'F'
      'A'
      'P')
    Anchors = [akTop, akRight]
    Caption = 'Nature'
    Color = 15658734
    TabOrder = 14
  end
  object RzDBCheckBoxEXO_TVA: TRzDBCheckBox
    Left = 735
    Top = 132
    Width = 87
    Height = 18
    DataField = 'EXO_TVA'
    DataSource = DSMemTableEntvtejj
    ValueChecked = '1'
    ValueUnchecked = '0'
    Anchors = [akTop, akRight]
    Caption = 'Exonere TVA'
    TabOrder = 15
  end
  object RzDBCheckBoxTVA_ILES: TRzDBCheckBox
    Left = 735
    Top = 150
    Width = 62
    Height = 18
    DataField = 'TVA_ILES'
    DataSource = DSMemTableEntvtejj
    ValueChecked = '1'
    ValueUnchecked = '0'
    Anchors = [akTop, akRight]
    Caption = 'TVA Iles'
    TabOrder = 17
  end
  object Panel2: TPanel
    Left = 880
    Top = 0
    Width = 104
    Height = 555
    Align = alRight
    TabOrder = 19
    object BtnValider: TBitBtn
      Left = 1
      Top = 1
      Width = 102
      Height = 30
      Align = alTop
      Anchors = [akTop]
      Caption = '&Valider'
      Default = True
      TabOrder = 0
      OnClick = BtnValiderClick
    end
    object BtnAide: TBitBtn
      Left = 1
      Top = 61
      Width = 102
      Height = 30
      Align = alTop
      Caption = 'Aide'
      TabOrder = 1
    end
    object BtnAnnuler: TBitBtn
      Left = 1
      Top = 31
      Width = 102
      Height = 30
      Align = alTop
      Cancel = True
      Caption = '&Annuler'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object FDMemTableEntvtejj: TFDMemTable
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
    Left = 488
    Top = 32
  end
  object DSMemTableEntvtejj: TDataSource
    DataSet = FDMemTableEntvtejj
    Left = 480
    Top = 88
  end
  object FDMemTableLigvtejj: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 872
    Top = 208
  end
  object DSMemTableLigvtejj: TDataSource
    DataSet = FDMemTableLigvtejj
    Left = 808
    Top = 264
  end
  object FDMemTableRegljj: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 840
    Top = 352
  end
  object DSMemTableRegljj: TDataSource
    DataSet = FDMemTableRegljj
    Left = 856
    Top = 416
  end
end
