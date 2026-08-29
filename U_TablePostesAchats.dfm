object FrameTablePostesAchats: TFrameTablePostesAchats
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 640
    Height = 451
    Align = alClient
    DataSource = DSPoste
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyPress = JvDBGrid1KeyPress
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
        FieldName = 'POSTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_BOOL'
        Title.Caption = 'GESTION STOCK'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CPT_DEB'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CPT_CRE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CPT_ACH'
        Title.Caption = 'COMPTE ACHATS'
        Width = 102
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 640
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 24
    ExplicitTop = 416
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
      TabOrder = 2
      OnClick = BtnSupprimerClick
    end
  end
  object DSPoste: TDataSource
    DataSet = DM_Olivier.FDQueryPoste
    Left = 216
    Top = 352
  end
end
