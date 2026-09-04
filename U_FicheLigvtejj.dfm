object FormLigvtejj: TFormLigvtejj
  Left = 0
  Top = 0
  Caption = 'Ligne de facture'
  ClientHeight = 475
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 47
    Height = 15
    Caption = 'CODBAR'
    FocusControl = DBCodbar
  end
  object Label2: TLabel
    Left = 115
    Top = 8
    Width = 40
    Height = 15
    Caption = 'LIBELLE'
    FocusControl = DBMemo1
  end
  object Label3: TLabel
    Left = 350
    Top = 8
    Width = 55
    Height = 15
    Caption = 'QUANTITE'
  end
  object Label4: TLabel
    Left = 435
    Top = 8
    Width = 39
    Height = 15
    Caption = 'PRIXHT'
  end
  object Label5: TLabel
    Left = 617
    Top = 8
    Width = 45
    Height = 15
    Caption = 'PRIXNET'
    FocusControl = DBPrixnet
  end
  object Label6: TLabel
    Left = 696
    Top = 8
    Width = 43
    Height = 15
    Caption = 'PRIXTTC'
  end
  object Label7: TLabel
    Left = 32
    Top = 96
    Width = 34
    Height = 15
    Caption = 'TOTHT'
    FocusControl = DBTotht
  end
  object Label8: TLabel
    Left = 40
    Top = 144
    Width = 41
    Height = 15
    Caption = 'MT_TTC'
    FocusControl = DBMt_ttc
  end
  object Label9: TLabel
    Left = 545
    Top = 8
    Width = 66
    Height = 15
    Caption = 'PRC_REMISE'
  end
  object Label10: TLabel
    Left = 48
    Top = 240
    Width = 61
    Height = 15
    Caption = 'MT_REMISE'
    FocusControl = DBEdit9
  end
  object Label11: TLabel
    Left = 40
    Top = 296
    Width = 38
    Height = 15
    Caption = 'TX_TVA'
    FocusControl = DBTx_tva
  end
  object Label12: TLabel
    Left = 200
    Top = 304
    Width = 42
    Height = 15
    Caption = 'MT_TVA'
    FocusControl = DBMt_tva
  end
  object Label13: TLabel
    Left = 376
    Top = 296
    Width = 45
    Height = 15
    Caption = 'DET_PPT'
    FocusControl = DBEdit12
  end
  object Label14: TLabel
    Left = 384
    Top = 344
    Width = 40
    Height = 15
    Caption = 'DET_ILE'
    FocusControl = DBEdit13
  end
  object Label15: TLabel
    Left = 384
    Top = 384
    Width = 45
    Height = 15
    Caption = 'PXLVTTC'
    FocusControl = DBEdit14
  end
  object Label16: TLabel
    Left = 300
    Top = 8
    Width = 29
    Height = 15
    Caption = 'TARIF'
    FocusControl = DBEdit15
  end
  object DBCodbar: TDBEdit
    Left = 8
    Top = 29
    Width = 101
    Height = 23
    DataField = 'CODBAR'
    DataSource = DSLigvtejj
    TabOrder = 0
    OnEnter = DBCodbarEnter
  end
  object DBMemo1: TDBMemo
    Left = 115
    Top = 29
    Width = 185
    Height = 60
    DataField = 'LIBELLE'
    DataSource = DSLigvtejj
    TabOrder = 1
  end
  object DBPrixnet: TDBEdit
    Left = 617
    Top = 29
    Width = 73
    Height = 23
    DataField = 'PRIXNET'
    DataSource = DSLigvtejj
    Enabled = False
    TabOrder = 2
  end
  object DBTotht: TDBEdit
    Left = 32
    Top = 112
    Width = 184
    Height = 23
    DataField = 'TOTHT'
    DataSource = DSLigvtejj
    Enabled = False
    TabOrder = 3
  end
  object DBMt_ttc: TDBEdit
    Left = 40
    Top = 160
    Width = 304
    Height = 23
    DataField = 'MT_TTC'
    DataSource = DSLigvtejj
    Enabled = False
    TabOrder = 4
  end
  object DBEdit9: TDBEdit
    Left = 48
    Top = 256
    Width = 154
    Height = 23
    DataField = 'MT_REMISE'
    DataSource = DSLigvtejj
    Enabled = False
    TabOrder = 5
  end
  object DBTx_tva: TDBEdit
    Left = 40
    Top = 312
    Width = 94
    Height = 23
    DataField = 'TX_TVA'
    DataSource = DSLigvtejj
    Enabled = False
    TabOrder = 6
  end
  object DBMt_tva: TDBEdit
    Left = 200
    Top = 320
    Width = 154
    Height = 23
    DataField = 'MT_TVA'
    DataSource = DSLigvtejj
    Enabled = False
    TabOrder = 7
  end
  object DBEdit12: TDBEdit
    Left = 376
    Top = 312
    Width = 177
    Height = 23
    DataField = 'DET_PPT'
    DataSource = DSLigvtejj
    TabOrder = 8
  end
  object DBEdit13: TDBEdit
    Left = 384
    Top = 360
    Width = 169
    Height = 23
    DataField = 'DET_ILE'
    DataSource = DSLigvtejj
    TabOrder = 9
  end
  object DBEdit14: TDBEdit
    Left = 384
    Top = 400
    Width = 169
    Height = 23
    DataField = 'PXLVTTC'
    DataSource = DSLigvtejj
    TabOrder = 10
  end
  object DBEdit15: TDBEdit
    Left = 306
    Top = 29
    Width = 19
    Height = 23
    DataField = 'CODTAR'
    DataSource = DSLigvtejj
    TabOrder = 11
  end
  object Panel1: TPanel
    Left = 829
    Top = 0
    Width = 105
    Height = 475
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 12
    ExplicitLeft = 632
    object BtnValider: TBitBtn
      Left = 0
      Top = 0
      Width = 105
      Height = 28
      Align = alTop
      Caption = '&Valider'
      Default = True
      TabOrder = 0
      OnClick = BtnValiderClick
    end
    object BtnAnnuler: TBitBtn
      Left = 0
      Top = 31
      Width = 105
      Height = 32
      Cancel = True
      Caption = '&Annuler'
      ModalResult = 2
      TabOrder = 1
      OnClick = BtnAnnulerClick
    end
  end
  object DBQte: TJvDBCalcEdit
    Left = 350
    Top = 29
    Width = 79
    Height = 23
    TabOrder = 13
    DecimalPlacesAlwaysShown = False
    OnExit = DBQteExit
    DataField = 'QTE'
    DataSource = DSLigvtejj
  end
  object DBPrixht: TJvDBCalcEdit
    Left = 435
    Top = 29
    Width = 106
    Height = 23
    TabOrder = 14
    DecimalPlacesAlwaysShown = False
    OnExit = DBPrixhtExit
    DataField = 'PRIXHT'
    DataSource = DSLigvtejj
  end
  object DBPrixttc: TJvDBCalcEdit
    Left = 696
    Top = 29
    Width = 97
    Height = 23
    TabOrder = 15
    DecimalPlacesAlwaysShown = False
    OnExit = DBPrixttcExit
    DataField = 'PRIXTTC'
    DataSource = DSLigvtejj
  end
  object DBPrc_remise: TJvDBSpinEdit
    Left = 547
    Top = 29
    Width = 54
    Height = 23
    ValueType = vtFloat
    TabOrder = 16
    OnChange = DBPrc_remiseChange
    OnEnter = DBPrc_remiseEnter
    OnExit = DBPrc_remiseExit
    DataField = 'PRC_REMISE'
    DataSource = DSLigvtejj
  end
  object DSLigvtejj: TDataSource
    DataSet = FormEntvtejj.FDMemTableLigvtejj
    Left = 264
    Top = 152
  end
  object FDQuery1: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ligvtejj')
    Left = 352
    Top = 200
    object FDQuery1LIBELLE: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      BlobType = ftMemo
    end
    object FDQuery1CODFAC: TLargeintField
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
      Required = True
    end
    object FDQuery1CODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQuery1CODCAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object FDQuery1CODDEV: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
    end
    object FDQuery1CODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQuery1NOENR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR'
      Origin = 'NOENR'
    end
    object FDQuery1ANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQuery1MOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQuery1CODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQuery1CODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQuery1CODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      Size = 4
    end
    object FDQuery1CODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      Size = 6
    end
    object FDQuery1CODDPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODDPT'
      Origin = 'CODDPT'
      Size = 1
    end
    object FDQuery1TYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQuery1CODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      Size = 13
    end
    object FDQuery1CODBAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODBAR'
      Origin = 'CODBAR'
      Size = 13
    end
    object FDQuery1QTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      Precision = 9
      Size = 3
    end
    object FDQuery1POIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      Precision = 7
      Size = 3
    end
    object FDQuery1CODTAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR'
      Origin = 'CODTAR'
      Size = 1
    end
    object FDQuery1PRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      Precision = 11
      Size = 2
    end
    object FDQuery1PRIXTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXTTC'
      Origin = 'PRIXTTC'
    end
    object FDQuery1PRIXNET: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXNET'
      Origin = 'PRIXNET'
      Precision = 11
      Size = 2
    end
    object FDQuery1TOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object FDQuery1MT_TTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQuery1PRC_REMISE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object FDQuery1MT_REMISE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object FDQuery1TX_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TVA'
      Origin = 'TX_TVA'
      Precision = 5
      Size = 2
    end
    object FDQuery1MT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object FDQuery1NO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_TVA'
      Origin = 'NO_TVA'
    end
    object FDQuery1PRIXREV: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXREV'
      Origin = 'PRIXREV'
      Precision = 11
      Size = 2
    end
    object FDQuery1MARGE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object FDQuery1NO_SEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object FDQuery1NO_JOUR: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object FDQuery1DET_PPT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_PPT'
      Origin = 'DET_PPT'
    end
    object FDQuery1DET_ILE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_ILE'
      Origin = 'DET_ILE'
    end
    object FDQuery1NOENRF: TFDAutoIncField
      FieldName = 'NOENRF'
      Origin = 'NOENRF'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQuery1PXLVTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PXLVTTC'
      Origin = 'PXLVTTC'
    end
    object FDQuery1DER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQuery1TX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object FDQuery1MT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 360
    Top = 144
  end
end
