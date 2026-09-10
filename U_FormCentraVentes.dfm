object FormCentraVentes: TFormCentraVentes
  Left = 0
  Top = 0
  Caption = 'FormCentraVentes'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object BtnValid: TButton
    Left = 230
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Valider'
    TabOrder = 0
    OnClick = BtnValidClick
  end
  object COMBO_Depot: TDBLookupComboBox
    Left = 200
    Top = 88
    Width = 144
    Height = 23
    KeyField = 'CODDEP'
    ListField = 'CODDEP;NOM'
    ListFieldIndex = 1
    ListSource = DSDepot
    TabOrder = 1
  end
  object JvDate_Valid: TJvDateEdit
    Left = 200
    Top = 48
    Width = 121
    Height = 23
    DefaultToday = True
    ShowNullDate = False
    TabOrder = 2
  end
  object DSDepot: TDataSource
    DataSet = DM_Olivier.FDQueryDepot
    Left = 120
    Top = 288
  end
end
