object FrameTableEntcde_cli: TFrameTableEntcde_cli
  Left = 0
  Top = 0
  Width = 816
  Height = 480
  TabOrder = 0
  OnResize = FrameResize
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 73
    Width = 816
    Height = 343
    Align = alClient
    DataSource = DSEntcde_cli
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnOuvrirClick
    TitleButtons = True
    OnTitleBtnClick = JvDBGrid1TitleBtnClick
    AlternateRowColor = clAzure
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'NOCDE'
        Title.Caption = 'No Cmde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_'
        Title.Caption = 'R'#233'f'#233'rence'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCLI'
        Title.Caption = 'No Client'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMCLI'
        Title.Caption = 'Nom client'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Title.Caption = 'Date cmde'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTHT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total HT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TTC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total TTC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OBSERV'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_VALID'
        Title.Caption = 'Date facturation'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_LIVR'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object EdtCherche_NOCDE: TEdit
      Left = 16
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_NOCDEChange
    end
    object EdtCherche_NOMCLI: TEdit
      Left = 273
      Top = 46
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMCLIChange
    end
    object EditCherche_DATE_: TEdit
      Left = 480
      Top = 46
      Width = 73
      Height = 23
      TabOrder = 2
      TextHint = 'Filtrer par date'
      OnChange = EditCherche_DATE_Change
    end
    object EditCherche_CODCLI: TEdit
      Left = 208
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par no client'
      OnChange = EditCherche_CODCLIChange
    end
    object RadioGroupEtat: TRadioGroup
      Left = 16
      Top = 0
      Width = 441
      Height = 40
      Caption = 'Etat'
      Columns = 2
      Items.Strings = (
        'Commandes non factur'#233'es'
        'Commandes factur'#233'es')
      ParentShowHint = False
      RadioTabStop = False
      ShowHint = False
      TabOrder = 4
      OnClick = RadioGroupEtatClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 816
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnTransformer: TBitBtn
      Left = 90
      Top = 32
      Width = 176
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Transformer en facture '#9889
      TabOrder = 0
      OnClick = BtnTransformerClick
    end
    object BtnFermer: TBitBtn
      Left = 729
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Fermer '#10060
      ModalResult = 8
      TabOrder = 1
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 729
      Top = 0
      Width = 87
      Height = 29
      Caption = 'Aide '#10067
      TabOrder = 2
      OnClick = BtnAideClick
    end
    object BtnImprimer: TButton
      Left = 275
      Top = 0
      Width = 87
      Height = 29
      Caption = '&Imprimer '#55357#56744#65039
      TabOrder = 3
    end
    object BtnAjouter: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Ajouter '#10133
      TabOrder = 4
      OnClick = BtnAjouterClick
    end
    object BtnSupprimer: TBitBtn
      Left = 179
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Supprimer '#55357#56785#65039
      TabOrder = 5
      StyleElements = [seClient, seBorder]
      OnClick = BtnSupprimerClick
    end
    object BtnOuvrir: TBitBtn
      Left = 90
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Ouvrir '#55357#56514
      Default = True
      TabOrder = 6
      OnClick = BtnOuvrirClick
    end
    object BtnDupliquer: TBitBtn
      Left = 275
      Top = 32
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Dupliquer '#55357#56523
      TabOrder = 7
      StyleElements = [seClient, seBorder]
    end
  end
  object FDQueryEntcde_cli: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from entcde_cli')
    Left = 72
    Top = 216
    object FDQueryEntcde_cliNOCDE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOCDE'
      Origin = 'NOCDE'
    end
    object FDQueryEntcde_cliREFERENCE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 45
    end
    object FDQueryEntcde_cliCODCLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
      Size = 7
    end
    object FDQueryEntcde_cliNOMCLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMCLI'
      Origin = 'NOMCLI'
      Size = 50
    end
    object FDQueryEntcde_cliDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryEntcde_cliTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 13
      Size = 2
    end
    object FDQueryEntcde_cliMT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 11
      Size = 2
    end
    object FDQueryEntcde_cliMT_TTC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryEntcde_cliSTATUT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'STATUT'
      Origin = 'STATUT'
    end
    object FDQueryEntcde_cliOBSERV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      Size = 150
    end
    object FDQueryEntcde_cliDATE_VALID: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_VALID'
      Origin = 'DATE_VALID'
    end
    object FDQueryEntcde_cliDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryEntcde_cliDATE_LIVR: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_LIVR'
      Origin = 'DATE_LIVR'
    end
  end
  object DSEntcde_cli: TDataSource
    DataSet = FDQueryEntcde_cli
    Left = 72
    Top = 288
  end
end
