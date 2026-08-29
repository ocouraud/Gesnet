object FrameTableFamilles: TFrameTableFamilles
  Left = 0
  Top = 0
  Width = 421
  Height = 480
  TabOrder = 0
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 421
    Height = 439
    Align = alClient
    DataSource = DSFamilles
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnModifierFamilleClick
    TitleButtons = True
    OnTitleBtnClick = JvDBGrid1TitleBtnClick
    AlternateRowColor = clAliceblue
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'CODFAM'
        Title.Caption = 'Code'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Title.Caption = 'Libell'#233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPTVTE'
        Title.Caption = 'Compte Vente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPTREM'
        Title.Caption = 'Compte Remise'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 439
    Width = 421
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
    object BtnNouveau: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Nouveau'
      TabOrder = 0
      OnClick = BtnNouveauClick
    end
    object ModifierFamille: TBitBtn
      Left = 120
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Modifier'
      TabOrder = 1
      OnClick = BtnModifierFamilleClick
    end
  end
  object DSFamilles: TDataSource
    DataSet = DMGesCloud.FDQueryFamilles
    Left = 208
    Top = 360
  end
end
