object FrameTableTVA: TFrameTableTVA
  Left = 0
  Top = 0
  Width = 698
  Height = 480
  Align = alClient
  ParentBackground = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 698
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BtnFermer: TBitBtn
      Left = 611
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
      Left = 524
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 1
    end
  end
  object JvDBGridTVA: TJvDBGrid
    Left = 0
    Top = 0
    Width = 417
    Height = 435
    DataSource = DSParameTVA
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    AutoAppend = False
    TitleButtons = True
    AlternateRowColor = clAzure
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
        FieldName = 'CODE'
        ReadOnly = True
        Title.Caption = 'Code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Title.Caption = 'Libell'#233
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCPT'
        Title.Caption = 'Cpte d'#233'vers.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPTDEC'
        Title.Caption = 'Cpte d'#233'caiss.'
        Width = 84
        Visible = True
      end>
  end
  object JvDBGridPar_effet: TJvDBGrid
    Left = 423
    Top = 0
    Width = 274
    Height = 233
    DataSource = DSPar_effet
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    AlternateRowColor = clAntiquewhite
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'code'
        ReadOnly = True
        Title.Caption = 'Code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dat_deb'
        Title.Caption = 'Date d'#233'but'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dat_fin'
        Title.Caption = 'Date fin'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'taux'
        Title.Caption = 'Taux'
        Visible = True
      end>
  end
  object BtnSupprimer: TBitBtn
    Left = 606
    Top = 239
    Width = 86
    Height = 26
    Margins.Left = 6
    Margins.Right = 6
    Caption = '&Supprimer'
    TabOrder = 4
    OnClick = BtnSupprimerClick
  end
  object DSParameTVA: TDataSource
    DataSet = DM_Olivier.FDQueryParameTVA
    Left = 120
    Top = 312
  end
  object DSPar_effet: TDataSource
    DataSet = FDQueryPar_effet
    Left = 464
    Top = 184
  end
  object FDQueryPar_effet: TFDQuery
    OnNewRecord = FDQueryPar_effetNewRecord
    MasterSource = DSParameTVA
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from par_effet where code=:code')
    Left = 448
    Top = 104
    ParamData = <
      item
        Name = 'CODE'
        ParamType = ptInput
      end>
  end
end
