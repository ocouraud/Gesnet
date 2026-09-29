object FormParametresRelevesClients: TFormParametresRelevesClients
  Left = 0
  Top = 0
  Caption = 'Param'#232'tres relev'#233's clients'
  ClientHeight = 194
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
  object DBLookupComboBoxClientDu: TDBLookupComboBox
    Left = 40
    Top = 31
    Width = 426
    Height = 23
    KeyField = 'CODCLI'
    ListField = 'CODCLI;NOM'
    ListFieldIndex = 1
    ListSource = DSClientDu
    TabOrder = 0
  end
  object DBLookupComboBoxClientAu: TDBLookupComboBox
    Left = 40
    Top = 60
    Width = 426
    Height = 23
    KeyField = 'CODCLI'
    ListField = 'CODCLI;NOM'
    ListFieldIndex = 1
    ListSource = DSClientAu
    TabOrder = 1
  end
  object CheckBoxSoldees: TCheckBox
    Left = 321
    Top = 115
    Width = 121
    Height = 17
    Caption = 'Ecritures sold'#233'es'
    TabOrder = 2
  end
  object CheckBoxNonSoldees: TCheckBox
    Left = 321
    Top = 138
    Width = 145
    Height = 17
    Caption = 'Ecritures non sold'#233'es'
    TabOrder = 3
  end
  object BtnValid: TButton
    Left = 527
    Top = 8
    Width = 89
    Height = 33
    Caption = 'Imprimer'
    ModalResult = 1
    TabOrder = 4
  end
  object Button1: TButton
    Left = 527
    Top = 47
    Width = 89
    Height = 33
    Cancel = True
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 5
  end
  object JvDateEditDu: TJvDateEdit
    Left = 40
    Top = 106
    Width = 105
    Height = 23
    ShowNullDate = False
    TabOrder = 6
  end
  object JvDateEditAu: TJvDateEdit
    Left = 40
    Top = 135
    Width = 105
    Height = 23
    ShowNullDate = False
    TabOrder = 7
  end
  object FDQueryClientsDu: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from client where ferme<>1')
    Left = 96
    Top = 133
  end
  object DSClientDu: TDataSource
    DataSet = FDQueryClientsDu
    Left = 216
    Top = 152
  end
  object DSClientAu: TDataSource
    DataSet = FDQueryClientsAu
    Left = 576
    Top = 149
  end
  object FDQueryClientsAu: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from client where ferme<>1')
    Left = 496
    Top = 146
  end
end
