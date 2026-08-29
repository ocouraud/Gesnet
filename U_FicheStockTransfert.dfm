object FormFicheStockTransfert: TFormFicheStockTransfert
  Left = 0
  Top = 0
  Caption = 'Transfert de stock'
  ClientHeight = 201
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Label3: TLabel
    Left = 22
    Top = 8
    Width = 24
    Height = 15
    Caption = 'Date'
  end
  object Label5: TLabel
    Left = 22
    Top = 64
    Width = 46
    Height = 15
    Caption = 'Quantit'#233
  end
  object Label6: TLabel
    Left = 135
    Top = 64
    Width = 75
    Height = 15
    Caption = 'Valeur unitaire'
  end
  object Label7: TLabel
    Left = 22
    Top = 121
    Width = 34
    Height = 15
    Caption = 'Libell'#233
  end
  object Label1: TLabel
    Left = 135
    Top = 8
    Width = 49
    Height = 15
    Caption = 'Du d'#233'pot'
  end
  object Label2: TLabel
    Left = 303
    Top = 5
    Width = 67
    Height = 15
    Caption = 'Vers le d'#233'pot'
  end
  object Panel1: TPanel
    Left = 477
    Top = 0
    Width = 105
    Height = 201
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
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
  object DBLookupComboBoxStodepDu: TDBLookupComboBox
    Left = 135
    Top = 24
    Width = 162
    Height = 23
    KeyField = 'CODDEP'
    ListField = 'CODDEP;NOM;QTE;PMP'
    ListFieldIndex = 1
    ListSource = DSStodepDu
    TabOrder = 1
    OnClick = DBLookupComboBoxStodepDuClick
  end
  object DBLookupComboBoxStodepVers: TDBLookupComboBox
    Left = 303
    Top = 24
    Width = 162
    Height = 23
    KeyField = 'CODDEP'
    ListField = 'CODDEP;NOM;QTE'
    ListFieldIndex = 1
    ListSource = DSStodepVers
    TabOrder = 2
    OnClick = DBLookupComboBoxStodepVersClick
  end
  object EditLibelle: TEdit
    Left = 22
    Top = 136
    Width = 443
    Height = 23
    TabOrder = 3
    Text = 'Libell'#233
  end
  object JvCalcQte: TJvCalcEdit
    Left = 22
    Top = 80
    Width = 91
    Height = 23
    TabOrder = 4
    DecimalPlacesAlwaysShown = False
  end
  object JvCalcValunit: TJvCalcEdit
    Left = 135
    Top = 80
    Width = 91
    Height = 23
    ReadOnly = True
    TabOrder = 5
    DecimalPlacesAlwaysShown = False
  end
  object JvDate: TJvDateEdit
    Left = 16
    Top = 24
    Width = 97
    Height = 23
    DefaultToday = True
    ShowNullDate = False
    TabOrder = 6
  end
  object EditCodart: TEdit
    Left = 24
    Top = 160
    Width = 89
    Height = 23
    ReadOnly = True
    TabOrder = 7
    Text = 'Code article'
  end
  object FDQueryStodepDu: TFDQuery
    MasterSource = FormFicheArticle.DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select * from stodep, depot where stodep.codart = :codart and de' +
        'pot.coddep=stodep.coddep')
    Left = 520
    Top = 72
    ParamData = <
      item
        Name = 'CODART'
        DataType = ftString
        ParamType = ptInput
        Size = 13
        Value = Null
      end>
  end
  object FDQueryStodepVers: TFDQuery
    MasterSource = FormFicheArticle.DSArticle
    MasterFields = 'CODART'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select * from stodep, depot where stodep.codart = :codart and de' +
        'pot.coddep=stodep.coddep')
    Left = 525
    Top = 128
    ParamData = <
      item
        Name = 'CODART'
        ParamType = ptInput
      end>
  end
  object DSStodepDu: TDataSource
    DataSet = FDQueryStodepDu
    Left = 477
    Top = 72
  end
  object DSStodepVers: TDataSource
    DataSet = FDQueryStodepVers
    Left = 485
    Top = 136
  end
end
