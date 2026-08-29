object FormTableClients: TFormTableClients
  Left = 0
  Top = 0
  Width = 794
  Height = 521
  HelpType = htKeyword
  HelpKeyword = 'clients_liste.html'
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object EdtCherche_CODCLI: TEdit
      Left = 16
      Top = 12
      Width = 65
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CODCLIChange
    end
    object EdtCherche_NOM: TEdit
      Left = 168
      Top = 12
      Width = 177
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
    object CheckBoxFermes: TCheckBox
      Left = 351
      Top = 13
      Width = 104
      Height = 17
      Caption = 'Clients ferm'#233's'
      TabOrder = 2
      OnClick = CheckBoxFermesClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 492
    Width = 794
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
      OnClick = JvDBGridClientsDblClick
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
      Left = 707
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
      Left = 620
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 4
      OnClick = BtnAideClick
    end
  end
  object JvDBGridClients: TJvDBGrid
    Left = 0
    Top = 41
    Width = 794
    Height = 451
    HelpType = htKeyword
    Align = alClient
    DataSource = DSClients
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = JvDBGridClientsDblClick
    AutoAppend = False
    TitleButtons = True
    OnTitleBtnClick = JvDBGridClientsTitleBtnClick
    AlternateRowColor = clAliceblue
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
  end
  object DSClients: TDataSource
    DataSet = DMGesCloud.ReqClients
    OnDataChange = DSClientsDataChange
    Left = 192
    Top = 280
  end
end
