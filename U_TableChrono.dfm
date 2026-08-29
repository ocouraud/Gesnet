object FrameTableChrono: TFrameTableChrono
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
  ParentBackground = False
  TabOrder = 0
  OnEnter = FrameEnter
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
    object BtnSupprimer: TBitBtn
      Left = 0
      Top = 0
      Width = 86
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Supprimer'
      Enabled = False
      TabOrder = 2
      OnClick = BtnSupprimerClick
    end
  end
  object JvDBGridChrono: TJvDBGrid
    Left = 0
    Top = 0
    Width = 640
    Height = 451
    Align = alClient
    DataSource = DSChrono
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyPress = JvDBGridChronoKeyPress
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
        FieldName = 'TYPE_'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PREFIX'
        ReadOnly = True
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHRONO'
        Width = 115
        Visible = True
      end>
  end
  object DSChrono: TDataSource
    DataSet = DM_Olivier.FDQueryChrono
    Left = 376
    Top = 336
  end
end
