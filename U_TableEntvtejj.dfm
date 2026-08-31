object FrameTableEntvtejj: TFrameTableEntvtejj
  Left = 0
  Top = 0
  Width = 821
  Height = 480
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 821
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
    end
    object BtnFermer: TBitBtn
      Left = 734
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
      Left = 647
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 4
      OnClick = BtnAideClick
    end
  end
  object JvDBGridEntvtejj: TJvDBGrid
    Left = 0
    Top = 57
    Width = 821
    Height = 394
    Align = alClient
    DataSource = DSEntvtejj
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnOuvrirClick
    TitleButtons = True
    OnTitleBtnClick = JvDBGridEntvtejjTitleBtnClick
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
        FieldName = 'SEL'
        Title.Caption = 'Lot'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYPE_'
        Title.Caption = 'Nature'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFAC'
        Title.Caption = 'No Facture'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HeureLisible'
        Title.Caption = 'Heure'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOP_'
        Title.Caption = 'Etat'
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
        FieldName = 'NOM'
        Title.Caption = 'Non du client'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCAI'
        Title.Caption = 'No Poste'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDEV'
        Title.Caption = 'No Devis'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDEP'
        Title.Caption = 'Depot'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODVEN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOTAHITI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EXO_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ANNEE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MOIS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRC_REMISE'
        Title.Caption = '% remise'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_REMISE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TOTHT'
        Title.Caption = 'Total HT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TTC'
        Title.Caption = 'Total TTC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_HT0'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HT1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HT2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HT3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MARGE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_'
        Title.Caption = 'Reference'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREP'
        Title.Caption = 'Repres.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_SEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_JOUR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REGL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODPAI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'JRSCRD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FIN_MOIS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LIBREG'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CRD_FORCE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'date_ech'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ACOMPTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODGEO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FLAG_TAX'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DER_MODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOMVEN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TSOC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HTSOC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TX_TSOC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EXO_CPS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_TVAI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MT_HTI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TVA_ILES'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object EdtCherche_CODFAC: TEdit
      Left = 85
      Top = 28
      Width = 89
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_CODFACChange
    end
    object EdtCherche_NOM: TEdit
      Left = 392
      Top = 28
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
    object CheckBoxToutesFactures: TCheckBox
      Left = 747
      Top = 0
      Width = 74
      Height = 57
      Align = alRight
      Caption = 'Toutes les'#13#10'factures'
      TabOrder = 2
      OnClick = CheckBoxToutesFacturesClick
    end
    object EditCherche_SEL: TEdit
      Left = 16
      Top = 28
      Width = 34
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par lot'
      OnChange = EditCherche_SELChange
    end
    object EditCherche_DATE_: TEdit
      Left = 172
      Top = 28
      Width = 69
      Height = 23
      TabOrder = 4
      TextHint = 'Filtrer par date'
      OnChange = EdtCherche_CODFACChange
    end
    object EditCherche_CODCLI: TEdit
      Left = 328
      Top = 28
      Width = 65
      Height = 23
      TabOrder = 5
      TextHint = 'Filtrer par no client'
      OnChange = EdtCherche_CODFACChange
    end
    object EditCherche_CODCAI: TEdit
      Left = 695
      Top = 28
      Width = 34
      Height = 23
      TabOrder = 6
      TextHint = 'Filtrer par no poste'
      OnChange = EdtCherche_CODFACChange
    end
  end
  object FDQueryEntvtejj: TFDQuery
    OnCalcFields = FDQueryEntvtejjCalcFields
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from entvtejj')
    Left = 48
    Top = 336
    object FDQueryEntvtejjOBSERV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      Size = 1000
    end
    object FDQueryEntvtejjCODFAC: TLargeintField
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryEntvtejjTOP_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TOP_'
      Origin = 'TOP_'
      Size = 1
    end
    object FDQueryEntvtejjCODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQueryEntvtejjCODCAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object FDQueryEntvtejjCODDEV: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
    end
    object FDQueryEntvtejjCODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryEntvtejjCODVEN: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODVEN'
      Origin = 'CODVEN'
    end
    object FDQueryEntvtejjNOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      Size = 50
    end
    object FDQueryEntvtejjNOTAHITI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI'
      Origin = 'NOTAHITI'
      Size = 10
    end
    object FDQueryEntvtejjTYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQueryEntvtejjEXO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA'
      Origin = 'EXO_TVA'
    end
    object FDQueryEntvtejjANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQueryEntvtejjMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQueryEntvtejjDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryEntvtejjHEURE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'HEURE'
      Origin = 'HEURE'
    end
    object FDQueryEntvtejjPRC_REMISE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object FDQueryEntvtejjMT_REMISE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object FDQueryEntvtejjTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object FDQueryEntvtejjMT_TTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryEntvtejjMT_HT0: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT0'
      Origin = 'MT_HT0'
      Precision = 11
      Size = 2
    end
    object FDQueryEntvtejjMT_HT1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT1'
      Origin = 'MT_HT1'
      Precision = 11
      Size = 2
    end
    object FDQueryEntvtejjMT_HT2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT2'
      Origin = 'MT_HT2'
      Precision = 11
      Size = 2
    end
    object FDQueryEntvtejjMT_HT3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT3'
      Origin = 'MT_HT3'
      Precision = 11
      Size = 2
    end
    object FDQueryEntvtejjMT_TVA1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA1'
      Origin = 'MT_TVA1'
      Precision = 9
      Size = 2
    end
    object FDQueryEntvtejjMT_TVA2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA2'
      Origin = 'MT_TVA2'
      Precision = 9
      Size = 2
    end
    object FDQueryEntvtejjMT_TVA3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA3'
      Origin = 'MT_TVA3'
      Precision = 9
      Size = 2
    end
    object FDQueryEntvtejjMT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object FDQueryEntvtejjMARGE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object FDQueryEntvtejjREFERENCE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 15
    end
    object FDQueryEntvtejjCODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQueryEntvtejjNO_SEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object FDQueryEntvtejjNO_JOUR: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object FDQueryEntvtejjREGL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REGL'
      Origin = 'REGL'
    end
    object FDQueryEntvtejjCODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQueryEntvtejjJRSCRD: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object FDQueryEntvtejjFIN_MOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS'
      Origin = 'FIN_MOIS'
    end
    object FDQueryEntvtejjLIBREG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBREG'
      Origin = 'LIBREG'
      Size = 50
    end
    object FDQueryEntvtejjCRD_FORCE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CRD_FORCE'
      Origin = 'CRD_FORCE'
    end
    object FDQueryEntvtejjdate_ech: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'date_ech'
      Origin = 'date_ech'
    end
    object FDQueryEntvtejjACOMPTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ACOMPTE'
      Origin = 'ACOMPTE'
    end
    object FDQueryEntvtejjCODGEO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO'
      Origin = 'CODGEO'
      Size = 1
    end
    object FDQueryEntvtejjFLAG_TAX: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX'
      Origin = 'FLAG_TAX'
    end
    object FDQueryEntvtejjSEL: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SEL'
      Origin = 'SEL'
    end
    object FDQueryEntvtejjDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryEntvtejjNOMVEN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMVEN'
      Origin = 'NOMVEN'
      Size = 30
    end
    object FDQueryEntvtejjMT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
    object FDQueryEntvtejjMT_HTSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTSOC'
      Origin = 'MT_HTSOC'
      Precision = 11
      Size = 2
    end
    object FDQueryEntvtejjTX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object FDQueryEntvtejjEXO_CPS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS'
      Origin = 'EXO_CPS'
    end
    object FDQueryEntvtejjMT_TVAI: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVAI'
      Origin = 'MT_TVAI'
      Precision = 9
      Size = 2
    end
    object FDQueryEntvtejjMT_HTI: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTI'
      Origin = 'MT_HTI'
      Precision = 11
      Size = 2
    end
    object FDQueryEntvtejjTVA_ILES: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES'
      Origin = 'TVA_ILES'
    end
    object FDQueryEntvtejjHeureLisible: TStringField
      FieldKind = fkCalculated
      FieldName = 'HeureLisible'
      Size = 12
      Calculated = True
    end
  end
  object DSEntvtejj: TDataSource
    DataSet = FDQueryEntvtejj
    Left = 152
    Top = 328
  end
end
