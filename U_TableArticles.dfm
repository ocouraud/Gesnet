object FrameTableArticles: TFrameTableArticles
  Left = 0
  Top = 0
  Width = 786
  Height = 480
  TabOrder = 0
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 57
    Width = 786
    Height = 394
    Align = alClient
    DataSource = DSArticle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'CODART'
        Title.Caption = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE_BARRES'
        Title.Caption = 'Code-barres'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FERME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFOU'
        Title.Caption = 'FOURNIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFAM'
        Title.Caption = 'FAMILLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDPT'
        Title.Caption = 'DEPART'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODSSF'
        Title.Caption = 'SOUS-FAM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_FOU'
        Title.Caption = 'REF FOURN'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COND'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'QTEMIN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRIXVTE'
        Title.Caption = 'PRIX VTE HT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PMP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODEMP'
        Title.Caption = 'EMPLAC.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TVA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G_STO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCLU_TVA1'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 786
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
      Left = 699
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
      Left = 612
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
    Width = 786
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object EdtCherche_CODART: TEdit
      Left = 16
      Top = 29
      Width = 81
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par code...'
      OnChange = EdtCherche_CODARTChange
    end
    object EdtCherche_LIBELLE: TEdit
      Left = 99
      Top = 29
      Width = 210
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_LIBELLEChange
    end
    object CheckBoxFermes: TCheckBox
      Left = 16
      Top = 6
      Width = 104
      Height = 17
      Caption = 'Articles ferm'#233's'
      TabOrder = 2
      OnClick = CheckBoxFermesClick
    end
    object EdtCherche_CODFOU: TEdit
      Left = 400
      Top = 29
      Width = 57
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer fourn,'
      OnChange = EdtCherche_CODARTChange
    end
    object EdtCherche_CODFAM: TEdit
      Left = 456
      Top = 29
      Width = 57
      Height = 23
      TabOrder = 4
      TextHint = 'Filtrer famille'
      OnChange = EdtCherche_CODFAMChange
    end
    object EdtCherche_FERME: TEdit
      Left = 400
      Top = 0
      Width = 25
      Height = 23
      TabOrder = 5
      Text = 'EdtCherche_FERME'
      Visible = False
    end
    object EdtCherche_REF_FOU: TEdit
      Left = 619
      Top = 28
      Width = 86
      Height = 23
      TabOrder = 6
      TextHint = 'Filtrer Ref. Fou.'
      OnChange = EdtCherche_REF_FOUChange
    end
    object CheckBoxCB: TCheckBox
      Left = 126
      Top = 6
      Width = 104
      Height = 17
      Caption = 'Code-barres'
      TabOrder = 7
      OnClick = CheckBoxCBClick
    end
  end
  object DSArticle: TDataSource
    DataSet = DM_Olivier.FDQueryArticle
    Left = 56
    Top = 368
  end
end
