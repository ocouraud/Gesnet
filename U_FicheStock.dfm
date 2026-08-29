object FormFicheStock: TFormFicheStock
  Left = 0
  Top = 0
  Caption = 'Mouvement de stock'
  ClientHeight = 187
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label3: TLabel
    Left = 22
    Top = 8
    Width = 24
    Height = 15
    Caption = 'Date'
    FocusControl = DBDate
  end
  object Label5: TLabel
    Left = 22
    Top = 64
    Width = 46
    Height = 15
    Caption = 'Quantit'#233
    FocusControl = DBQte
  end
  object Label6: TLabel
    Left = 111
    Top = 64
    Width = 75
    Height = 15
    Caption = 'Valeur unitaire'
    FocusControl = DBValunit
  end
  object Label7: TLabel
    Left = 22
    Top = 121
    Width = 34
    Height = 15
    Caption = 'Libell'#233
    FocusControl = DBLibelle
  end
  object DBCodart: TDBEdit
    Left = 309
    Top = 161
    Width = 89
    Height = 23
    DataField = 'CODART'
    DataSource = DSStock
    ReadOnly = True
    TabOrder = 6
    Visible = False
  end
  object DBCoddep: TDBEdit
    Left = 404
    Top = 161
    Width = 31
    Height = 23
    DataField = 'CODDEP'
    DataSource = DSStock
    ReadOnly = True
    TabOrder = 7
    Visible = False
  end
  object DBDate: TDBEdit
    Left = 22
    Top = 24
    Width = 97
    Height = 23
    DataField = 'DATE_'
    DataSource = DSStock
    ReadOnly = True
    TabOrder = 0
  end
  object DBQte: TDBEdit
    Left = 22
    Top = 80
    Width = 65
    Height = 23
    DataField = 'QTE'
    DataSource = DSStock
    TabOrder = 2
  end
  object DBValunit: TDBEdit
    Left = 111
    Top = 80
    Width = 82
    Height = 23
    DataField = 'VALUNIT'
    DataSource = DSStock
    TabOrder = 3
  end
  object DBLibelle: TDBEdit
    Left = 22
    Top = 138
    Width = 424
    Height = 23
    DataField = 'LIBELLE'
    DataSource = DSStock
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 477
    Top = 0
    Width = 105
    Height = 187
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 5
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
  object RadioNature: TDBRadioGroup
    Left = 309
    Top = 8
    Width = 113
    Height = 105
    Caption = 'Nature'
    DataField = 'TYPE_'
    DataSource = DSStock
    Items.Strings = (
      'Entr'#233'e'
      'Sortie'
      'Redressement'
      'Inventaire')
    TabOrder = 1
    Values.Strings = (
      'E'
      'S'
      'R'
      'I')
    OnClick = RadioNatureClick
  end
  object DSStock: TDataSource
    DataSet = FormFicheArticle.FDQueryStock
    Left = 248
    Top = 8
  end
end
