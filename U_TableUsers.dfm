object FormTableUsers: TFormTableUsers
  Left = 0
  Top = 0
  Caption = 'Table des utilisateurs'
  ClientHeight = 441
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 757
    Height = 412
    Align = alClient
    DataSource = DMGesCloud.dsUsers
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    AlternateRowColor = clAzure
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        ReadOnly = True
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USERNAME'
        Title.Caption = 'LOGIN'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PASSWORD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FULLNAME'
        Title.Caption = 'NOM COMPLET'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENABLED'
        Title.Caption = 'ACTIF'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATEDDATE'
        ReadOnly = True
        Title.Caption = 'DATE CREATION'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATEDTIME'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LASTACCESS'
        ReadOnly = True
        Title.Caption = 'DATE DERNIER ACCES'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTACCTIME'
        ReadOnly = True
        Title.Caption = 'HEURE DERNIER ACCES'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCESSCOUNT'
        ReadOnly = True
        Title.Caption = 'NBRE ACCES'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 757
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BtnFermer: TBitBtn
      Left = 670
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alRight
      Caption = '&Fermer'
      ModalResult = 8
      TabOrder = 0
    end
    object BtnAide: TBitBtn
      Left = 583
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 1
      OnClick = BtnAideClick
    end
    object BtnSupprimer: TBitBtn
      Left = 0
      Top = 0
      Width = 86
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Supprimer'
      TabOrder = 2
      OnClick = BtnSupprimerClick
    end
  end
end
