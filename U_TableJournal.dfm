object FrameTableJournaux: TFrameTableJournaux
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 552
    Height = 446
    Align = alClient
    DataSource = DSJournal
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
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
        FieldName = 'CODJAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Title.Caption = 'CODE'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCPT'
        Title.Caption = 'No COMPTE'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TYPE_'
        PickList.Strings = (
          'A'
          'V'
          'T')
        Title.Alignment = taCenter
        Title.Caption = 'NATURE'
        Width = 50
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 552
    Top = 0
    Width = 88
    Height = 446
    Align = alRight
    TabOrder = 1
    object BtnFermer: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Fermer'
      ModalResult = 8
      TabOrder = 0
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 0
      Top = 28
      Width = 87
      Height = 29
      Caption = 'Aide'
      TabOrder = 1
      OnClick = BtnAideClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 446
    Width = 640
    Height = 34
    Align = alBottom
    TabOrder = 2
    object BtnSupprimer: TBitBtn
      Left = 1
      Top = 1
      Width = 87
      Height = 32
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Supprimer'
      TabOrder = 0
      OnClick = BtnSupprimerClick
    end
  end
  object FDQueryJournal: TFDQuery
    BeforePost = FDQueryJournalBeforePost
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from journal')
    Left = 56
    Top = 280
  end
  object DSJournal: TDataSource
    DataSet = FDQueryJournal
    Left = 192
    Top = 344
  end
end
