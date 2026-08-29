object FrameTableFournis: TFrameTableFournis
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  HelpType = htKeyword
  HelpKeyword = 'fournisseurs_liste.html'
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object EdtCherche_CODFOU: TEdit
      Left = 16
      Top = 12
      Width = 71
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CODFOUChange
    end
    object EdtCherche_NOM: TEdit
      Left = 93
      Top = 12
      Width = 210
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
  end
  object JvDBGridFournis: TJvDBGrid
    Left = 0
    Top = 41
    Width = 640
    Height = 410
    Align = alClient
    DataSource = DSFournis
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = JvDBGridFournisDblClick
    AutoAppend = False
    TitleButtons = True
    OnTitleBtnClick = JvDBGridFournisTitleBtnClick
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
        FieldName = 'CODFOU'
        Title.Caption = 'Code'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM'
        Title.Caption = 'Nom'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTEL '
        Title.Caption = 'No TEL '
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AD1'
        Title.Caption = 'Adresse'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVISE'
        Title.Caption = 'Devise'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCPT'
        Title.Caption = 'No compte'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = '@mail'
        Width = 150
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
    TabOrder = 2
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
      OnClick = JvDBGridFournisDblClick
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
  object DSFournis: TDataSource
    DataSet = DM_Olivier.FDQueryFournis
    Left = 72
    Top = 368
  end
end
