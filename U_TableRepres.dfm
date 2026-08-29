object FrameTableRepres: TFrameTableRepres
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 640
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnAjouter: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Ajouter'
      TabOrder = 0
      OnClick = BtnAjouterClick
    end
    object BtnOuvrir: TBitBtn
      Left = 87
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Ouvrir'
      Default = True
      TabOrder = 1
      OnClick = BtnOuvrirClick
    end
    object BtnSupprimer: TBitBtn
      Left = 174
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Supprimer'
      TabOrder = 2
      OnClick = BtnSupprimerClick
    end
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
      TabOrder = 3
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 466
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 4
      OnClick = BtnAideClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 8
    object EdtCherche_CODFOU: TEdit
      Left = 16
      Top = 12
      Width = 57
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CODFOUChange
    end
    object EdtCherche_NOM: TEdit
      Left = 76
      Top = 12
      Width = 218
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
  end
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 41
    Width = 640
    Height = 410
    Align = alClient
    DataSource = DSRepres
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnOuvrirClick
    AutoAppend = False
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
        FieldName = 'CODREP'
        Title.Caption = 'NUMERO'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMVTE'
        Title.Caption = 'COMM VTE'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMENC'
        Title.Caption = 'COMM ENC'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMRG'
        Title.Caption = 'COMM MRG'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPTCLI'
        Title.Caption = 'CPTE CENTRA'
        Width = 83
        Visible = True
      end>
  end
  object DSRepres: TDataSource
    DataSet = DM_Olivier.FDQueryRepres
    Left = 168
    Top = 320
  end
end
