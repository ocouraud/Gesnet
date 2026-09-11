object FormCentraVentes: TFormCentraVentes
  Left = 0
  Top = 0
  Caption = 'FormCentraVentes'
  ClientHeight = 193
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 95
    Height = 15
    Caption = 'Date de validation'
  end
  object Label2: TLabel
    Left = 24
    Top = 61
    Width = 82
    Height = 15
    Caption = 'Choix du d'#233'p'#244't'
  end
  object LabelMessage: TLabel
    Left = 125
    Top = 170
    Width = 143
    Height = 15
    Caption = 'En attente de centralisation'
  end
  object BtnValid: TButton
    Left = 64
    Top = 112
    Width = 89
    Height = 33
    Caption = 'Executer'
    ModalResult = 1
    TabOrder = 0
    OnClick = BtnValidClick
  end
  object COMBO_Depot: TDBLookupComboBox
    Left = 125
    Top = 58
    Width = 214
    Height = 23
    KeyField = 'CODDEP'
    ListField = 'CODDEP;NOM'
    ListFieldIndex = 1
    ListSource = DSDepot
    TabOrder = 1
  end
  object JvDate_Valid: TJvDateEdit
    Left = 125
    Top = 29
    Width = 121
    Height = 23
    DefaultToday = True
    ShowNullDate = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 224
    Top = 112
    Width = 89
    Height = 33
    Cancel = True
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 3
  end
  object DSDepot: TDataSource
    DataSet = DM_Olivier.FDQueryDepot
    Left = 288
    Top = 16
  end
end
