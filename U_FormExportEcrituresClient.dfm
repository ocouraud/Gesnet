object FormExportEcrituresClient: TFormExportEcrituresClient
  Left = 0
  Top = 0
  Caption = 'Param'#232'tres de l'#39'export comptable des '#233'critures clients'
  ClientHeight = 315
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 159
    Top = 19
    Width = 74
    Height = 15
    Caption = 'Date de d'#233'but'
  end
  object Label2: TLabel
    Left = 159
    Top = 48
    Width = 57
    Height = 15
    Caption = 'Date de fin'
  end
  object Panel2: TPanel
    Left = 336
    Top = 111
    Width = 193
    Height = 124
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 7
    object JvRadioGroup3: TJvRadioGroup
      Left = 16
      Top = 0
      Width = 169
      Height = 110
      Caption = 'Nature des mouvements'
      TabOrder = 0
    end
    object JvRadioButtonPasInterf: TJvRadioButton
      Left = 39
      Top = 24
      Width = 98
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pas d'#39'interface'
      TabOrder = 1
      LinkedControls = <>
    end
    object JvRadioButtonRevatel: TJvRadioButton
      Left = 38
      Top = 70
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Revatel'
      TabOrder = 2
      LinkedControls = <>
    end
    object JvRadioButtonSaari: TJvRadioButton
      Left = 39
      Top = 47
      Width = 74
      Height = 17
      Alignment = taLeftJustify
      Caption = 'SAARI 100'
      TabOrder = 3
      LinkedControls = <>
    end
  end
  object Panel1: TPanel
    Left = 22
    Top = 168
    Width = 204
    Height = 93
    BevelEdges = []
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 6
    object JvRadioGroup1: TJvRadioGroup
      Left = 11
      Top = 8
      Width = 185
      Height = 81
      Caption = 'Etendue'
      TabOrder = 0
    end
    object JvRadioButtonTous: TJvRadioButton
      Left = 21
      Top = 56
      Width = 127
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Reprise et nouveaux'
      TabOrder = 1
      LinkedControls = <>
    end
    object JvRadioButtonNouveaux: TJvRadioButton
      Left = 21
      Top = 33
      Width = 159
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Non encore comptabilis'#233's'
      TabOrder = 2
      LinkedControls = <>
    end
  end
  object JvRadioGroup2: TJvRadioGroup
    Left = 33
    Top = 90
    Width = 185
    Height = 72
    Caption = 'Nature des mouvements'
    TabOrder = 5
  end
  object BtnGenerer: TButton
    Left = 413
    Top = 266
    Width = 169
    Height = 33
    Caption = 'G'#233'n'#233'rer le fichier '#9654#65039
    TabOrder = 0
    OnClick = BtnGenererClick
  end
  object JvDateEditDu: TJvDateEdit
    Left = 255
    Top = 16
    Width = 105
    Height = 23
    ShowNullDate = False
    TabOrder = 1
  end
  object JvDateEditAu: TJvDateEdit
    Left = 255
    Top = 45
    Width = 105
    Height = 23
    ShowNullDate = False
    TabOrder = 2
  end
  object JvCheckBoxVentes: TJvCheckBox
    Left = 43
    Top = 111
    Width = 114
    Height = 17
    Caption = 'Ecritures de vente'
    TabOrder = 3
    LinkedControls = <>
  end
  object JvCheckBoxTresor: TJvCheckBox
    Left = 43
    Top = 134
    Width = 134
    Height = 17
    Caption = 'Ecritures de tresorerie'
    TabOrder = 4
    LinkedControls = <>
  end
  object Button1: TButton
    Left = 493
    Top = 11
    Width = 89
    Height = 33
    Caption = 'Fermer '#10060
    ModalResult = 8
    TabOrder = 8
  end
end
