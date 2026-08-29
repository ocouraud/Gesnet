object FrameTableDevises: TFrameTableDevises
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
  ParentBackground = False
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 640
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnFermer: TBitBtn
      Left = 553
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alRight
      Caption = '&Fermer'
      ModalResult = 8
      TabOrder = 0
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 466
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 1
      OnClick = BtnAideClick
    end
  end
  object JvDBGridParameDevises: TJvDBGrid
    Left = 0
    Top = 0
    Width = 358
    Height = 262
    DataSource = DSParameDevises
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyPress = JvDBGridParameDevisesKeyPress
    AlternateRowColor = clAliceblue
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAUX'
        Title.Caption = 'Taux convers XPF'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYPE_'
        Title.Caption = 'Type'
        Visible = False
      end>
  end
  object BtnSupprimer: TBitBtn
    Left = 272
    Top = 268
    Width = 86
    Height = 26
    Margins.Left = 6
    Margins.Right = 6
    Caption = '&Supprimer'
    TabOrder = 2
    OnClick = BtnSupprimerClick
  end
  object DSParameDevises: TDataSource
    DataSet = DM_Olivier.FDQueryParameDevise
    Left = 112
    Top = 312
  end
end
