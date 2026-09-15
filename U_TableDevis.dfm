object FrameTableDevis: TFrameTableDevis
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
    object BtnTransformer: TBitBtn
      Left = 348
      Top = 0
      Width = 141
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Transformer en facture'
      TabOrder = 0
      OnClick = BtnTransformerClick
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
      TabOrder = 1
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 647
      Top = 0
      Width = 87
      Height = 29
      Align = alRight
      Caption = 'Aide'
      TabOrder = 2
      OnClick = BtnAideClick
    end
    object BtnImprimer: TButton
      Left = 489
      Top = 0
      Width = 75
      Height = 29
      Align = alLeft
      Caption = '&Imprimer'
      TabOrder = 3
      OnClick = BtnImprimerClick
      ExplicitLeft = 500
    end
    object BtnAjouter: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Ajouter'
      TabOrder = 4
      OnClick = BtnAjouterClick
    end
    object BtnSupprimer: TBitBtn
      Left = 261
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Supprimer'
      TabOrder = 5
      StyleElements = [seClient, seBorder]
      OnClick = BtnSupprimerClick
      ExplicitLeft = 260
    end
    object BtnOublier: TBitBtn
      Left = 174
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = 'Ou&blier'
      TabOrder = 6
      StyleElements = [seClient, seBorder]
      OnClick = BtnOublierClick
      ExplicitLeft = 260
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
      TabOrder = 7
      OnClick = BtnOuvrirClick
    end
  end
  object JvDBGridEnt_prof: TJvDBGrid
    Left = 0
    Top = 73
    Width = 821
    Height = 378
    Align = alClient
    DataSource = DSEnt_prof
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BtnOuvrirClick
    TitleButtons = True
    OnTitleBtnClick = JvDBGridEnt_profTitleBtnClick
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
        FieldName = 'TYPE_'
        Title.Caption = 'Etat'
        Width = 28
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
        Width = 30
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
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT_TTC'
        Title.Caption = 'Total TTC'
        Width = 84
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
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object EdtCherche_CODDEV: TEdit
      Left = 42
      Top = 46
      Width = 76
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_CODDEVChange
    end
    object EdtCherche_NOM: TEdit
      Left = 338
      Top = 46
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
    object CheckBoxToutesFactures: TCheckBox
      Left = 641
      Top = 10
      Width = 101
      Height = 30
      Caption = 'Tous les postes'
      TabOrder = 2
      OnClick = CheckBoxToutesFacturesClick
    end
    object EditCherche_DATE_: TEdit
      Left = 123
      Top = 46
      Width = 61
      Height = 23
      TabOrder = 3
      TextHint = 'Filtrer par date'
      OnChange = EdtCherche_CODDEVChange
    end
    object EditCherche_CODCLI: TEdit
      Left = 272
      Top = 46
      Width = 65
      Height = 23
      TabOrder = 4
      TextHint = 'Filtrer par no client'
      OnChange = EdtCherche_CODDEVChange
    end
    object EditCherche_CODCAI: TEdit
      Left = 641
      Top = 46
      Width = 34
      Height = 23
      TabOrder = 5
      TextHint = 'Filtrer par no poste'
      OnChange = EdtCherche_CODDEVChange
    end
    object RadioGroupEtat: TRadioGroup
      Left = 16
      Top = 0
      Width = 441
      Height = 40
      Caption = 'Etat'
      Columns = 3
      Items.Strings = (
        'Devis factur'#233's'
        'Devis non factur'#233's'
        'Devis oubli'#233's')
      ParentShowHint = False
      RadioTabStop = False
      ShowHint = False
      TabOrder = 6
      OnClick = RadioGroupEtatClick
    end
  end
  object FDQueryEnt_prof: TFDQuery
    OnCalcFields = FDQueryEnt_profCalcFields
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ent_prof')
    Left = 192
    Top = 336
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      Size = 1000
    end
    object LargeintField1: TLargeintField
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object LargeintField2: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
    end
    object ShortintField1: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM'
      Origin = 'NOM'
      Size = 50
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAHITI'
      Origin = 'NOTAHITI'
      Size = 10
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object SmallintField2: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_TVA'
      Origin = 'EXO_TVA'
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object SmallintField3: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'HEURE'
      Origin = 'HEURE'
    end
    object BCDField1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object IntegerField4: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object BCDField2: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object LargeintField3: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object BCDField3: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT0'
      Origin = 'MT_HT0'
      Precision = 11
      Size = 2
    end
    object BCDField4: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT1'
      Origin = 'MT_HT1'
      Precision = 11
      Size = 2
    end
    object BCDField5: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT2'
      Origin = 'MT_HT2'
      Precision = 11
      Size = 2
    end
    object BCDField6: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HT3'
      Origin = 'MT_HT3'
      Precision = 11
      Size = 2
    end
    object BCDField7: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA1'
      Origin = 'MT_TVA1'
      Precision = 9
      Size = 2
    end
    object BCDField8: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA2'
      Origin = 'MT_TVA2'
      Precision = 9
      Size = 2
    end
    object BCDField9: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA3'
      Origin = 'MT_TVA3'
      Precision = 9
      Size = 2
    end
    object BCDField10: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object LargeintField4: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 15
    end
    object SmallintField4: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object SmallintField5: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object SmallintField6: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object SmallintField7: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'REGL'
      Origin = 'REGL'
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object SmallintField8: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'JRSCRD'
      Origin = 'JRSCRD'
    end
    object SmallintField9: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FIN_MOIS'
      Origin = 'FIN_MOIS'
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBREG'
      Origin = 'LIBREG'
      Size = 50
    end
    object SmallintField10: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CRD_FORCE'
      Origin = 'CRD_FORCE'
    end
    object DateField2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'date_ech'
      Origin = 'date_ech'
    end
    object StringField10: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODGEO'
      Origin = 'CODGEO'
      Size = 1
    end
    object SmallintField11: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FLAG_TAX'
      Origin = 'FLAG_TAX'
    end
    object SQLTimeStampField1: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object BCDField12: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTSOC'
      Origin = 'MT_HTSOC'
      Precision = 11
      Size = 2
    end
    object BCDField13: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object SmallintField13: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'EXO_CPS'
      Origin = 'EXO_CPS'
    end
    object BCDField14: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVAI'
      Origin = 'MT_TVAI'
      Precision = 9
      Size = 2
    end
    object BCDField15: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_HTI'
      Origin = 'MT_HTI'
      Precision = 11
      Size = 2
    end
    object BooleanField1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'TVA_ILES'
      Origin = 'TVA_ILES'
    end
    object StringField12: TStringField
      FieldKind = fkCalculated
      FieldName = 'HeureLisible'
      Size = 12
      Calculated = True
    end
    object FDQueryEnt_profMT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
  end
  object DSEnt_prof: TDataSource
    DataSet = FDQueryEnt_prof
    Left = 360
    Top = 344
  end
end
