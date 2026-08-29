object FormFicheFamrem: TFormFicheFamrem
  Left = 0
  Top = 0
  Caption = 'Fiche Remise'
  ClientHeight = 166
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 322
    Top = 63
    Width = 57
    Height = 15
    Caption = '% Remise :'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 21
    Height = 15
    Caption = 'Du :'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 174
    Top = 64
    Width = 21
    Height = 15
    Caption = 'Au :'
    FocusControl = DBEdit3
  end
  object BitBtn1: TBitBtn
    Left = 65
    Top = 123
    Width = 130
    Height = 35
    Caption = '&Valider'
    ModalResult = 1
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 400
    Top = 60
    Width = 38
    Height = 23
    DataField = 'PRC_REM'
    DataSource = FormFicheFamille.DSFamrem
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 59
    Top = 60
    Width = 82
    Height = 23
    DataField = 'DAT_DEB'
    DataSource = FormFicheFamille.DSFamrem
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 211
    Top = 60
    Width = 78
    Height = 23
    DataField = 'DAT_FIN'
    DataSource = FormFicheFamille.DSFamrem
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 275
    Top = 123
    Width = 130
    Height = 35
    Caption = '&Annuler'
    ModalResult = 2
    TabOrder = 4
  end
end
