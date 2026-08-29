object FrameTablePaiement: TFrameTablePaiement
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object EdtCherche_CODPAI: TEdit
      Left = 16
      Top = 12
      Width = 49
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CODPAIChange
    end
    object EdtCherche_LIBELLE: TEdit
      Left = 71
      Top = 12
      Width = 226
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par libell'#233'...'
      OnChange = EdtCherche_NOMChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 640
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
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
  object JvDBGridPaiement: TJvDBGrid
    Left = 0
    Top = 41
    Width = 640
    Height = 410
    HelpType = htKeyword
    Align = alClient
    DataSource = DSPaiement
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = JvDBGridPaiementDblClick
    AutoAppend = False
    TitleButtons = True
    OnTitleBtnClick = JvDBGridPaiementTitleBtnClick
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
        FieldName = 'CODPAI'
        Title.Caption = 'CODE'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Title.Caption = 'Libell'#233
        Width = 258
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCPT'
        Title.Caption = 'Cpte Compta'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODJAL'
        Title.Caption = 'Jnal compta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NatureText'
        Title.Caption = 'Genre'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDEV'
        Title.Caption = 'Devise'
        Visible = True
      end>
  end
  object DSPaiement: TDataSource
    DataSet = DM_Olivier.FDQueryPaiement
    Left = 96
    Top = 296
  end
end
