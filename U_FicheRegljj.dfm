object FormRegljj: TFormRegljj
  Left = 0
  Top = 0
  Caption = 'FormRegljj'
  ClientHeight = 213
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 95
    Height = 15
    Caption = 'DATE REGLEMENT'
  end
  object Label2: TLabel
    Left = 197
    Top = 76
    Width = 127
    Height = 15
    Caption = 'LIBELLE DU REGLEMENT'
    FocusControl = DBLibelle
  end
  object Label3: TLabel
    Left = 8
    Top = 76
    Width = 109
    Height = 15
    Caption = 'MODE DE PAIEMENT'
  end
  object Label4: TLabel
    Left = 392
    Top = 136
    Width = 90
    Height = 15
    Caption = 'DATE ECHEANCE'
  end
  object Label5: TLabel
    Left = 197
    Top = 136
    Width = 57
    Height = 15
    Caption = 'MONTANT'
  end
  object Panel1: TPanel
    Left = 519
    Top = 0
    Width = 105
    Height = 213
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    StyleElements = [seFont, seBorder]
    ExplicitHeight = 441
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
  object DBLibelle: TDBEdit
    Left = 197
    Top = 97
    Width = 316
    Height = 23
    DataField = 'LIBELLE'
    DataSource = DSRegljj
    TabOrder = 5
  end
  object JvDBDate_: TJvDBDateEdit
    Left = 8
    Top = 37
    Width = 121
    Height = 23
    DataField = 'DATE_'
    DataSource = DSRegljj
    ShowNullDate = False
    TabOrder = 3
  end
  object JvDBDate_Ech: TJvDBDateEdit
    Left = 392
    Top = 157
    Width = 121
    Height = 23
    DataField = 'DATE_ECH'
    DataSource = DSRegljj
    ShowNullDate = False
    TabOrder = 1
  end
  object JvDBCalcEditMontant: TJvDBCalcEdit
    Left = 197
    Top = 152
    Width = 140
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DecimalPlacesAlwaysShown = False
    OnExit = ControleReglement
    DataField = 'MONTANT'
    DataSource = DSRegljj
  end
  object JvDBLookupComboPaiement: TJvDBLookupCombo
    Left = 8
    Top = 97
    Width = 183
    Height = 22
    DataField = 'CODPAI'
    DataSource = DSRegljj
    LookupField = 'CODPAI'
    LookupDisplay = 'CODPAI;LIBELLE'
    LookupDisplayIndex = 1
    LookupSource = DSPaiement
    TabOrder = 4
    OnChange = JvDBLookupComboPaiementChange
    OnExit = ControleReglement
  end
  object DSRegljj: TDataSource
    DataSet = FormEntvtejj.FDMemTableRegljj
    Left = 280
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from regljj')
    Left = 184
    Top = 16
    object FDQuery1CODFAC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
    end
    object FDQuery1CODCAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object FDQuery1CODVEN: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODVEN'
      Origin = 'CODVEN'
    end
    object FDQuery1DATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQuery1TOP_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TOP_'
      Origin = 'TOP_'
      Size = 1
    end
    object FDQuery1LIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQuery1MONTANT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MONTANT'
      Origin = 'MONTANT'
    end
    object FDQuery1DATE_ECH: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_ECH'
      Origin = 'DATE_ECH'
    end
    object FDQuery1CODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQuery1TYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQuery1SELECT_: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
    end
    object FDQuery1DATE_OPER: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_OPER'
      Origin = 'DATE_OPER'
    end
    object FDQuery1DATE_COMPTA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_COMPTA'
      Origin = 'DATE_COMPTA'
    end
    object FDQuery1NOENR: TFDAutoIncField
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQuery1DER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQuery1MONT_ARR: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MONT_ARR'
      Origin = 'MONT_ARR'
    end
  end
  object BalloonHint1: TBalloonHint
    HideAfter = 2000
    Left = 472
    Top = 24
  end
  object DSPaiement: TDataSource
    DataSet = DM_Olivier.FDQueryPaiement
    Left = 368
    Top = 16
  end
end
