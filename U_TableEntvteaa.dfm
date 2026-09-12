object FrameTableEntvteaa: TFrameTableEntvteaa
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
    object BtnOuvrir: TBitBtn
      Left = 0
      Top = 0
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Align = alLeft
      Caption = '&Ouvrir'
      Default = True
      TabOrder = 0
      OnClick = BtnOuvrirClick
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
      Left = 96
      Top = 0
      Width = 75
      Height = 29
      Caption = 'Imprimer'
      TabOrder = 3
      OnClick = BtnImprimerClick
    end
  end
  object JvDBGridEntvteaa: TJvDBGrid
    Left = 0
    Top = 57
    Width = 821
    Height = 394
    Align = alClient
    DataSource = DSEntvteaa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBGridEntvteaaDrawColumnCell
    OnDblClick = BtnOuvrirClick
    TitleButtons = True
    OnTitleBtnClick = JvDBGridEntvteaaTitleBtnClick
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
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object EdtCherche_CODFAC: TEdit
      Left = 85
      Top = 28
      Width = 76
      Height = 23
      TabOrder = 0
      TextHint = 'Filtrer par numero'
      OnChange = EdtCherche_CODFACChange
    end
    object EdtCherche_NOM: TEdit
      Left = 368
      Top = 28
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Filtrer par nom...'
      OnChange = EdtCherche_NOMChange
    end
    object CheckBoxToutesFactures: TCheckBox
      Left = 680
      Top = 0
      Width = 141
      Height = 57
      Align = alRight
      Caption = 'Toutes les factures'
      TabOrder = 2
      Visible = False
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
      Left = 164
      Top = 28
      Width = 61
      Height = 23
      TabOrder = 4
      TextHint = 'Filtrer par date'
      OnChange = EdtCherche_CODFACChange
    end
    object EditCherche_CODCLI: TEdit
      Left = 304
      Top = 28
      Width = 65
      Height = 23
      TabOrder = 5
      TextHint = 'Filtrer par no client'
      OnChange = EdtCherche_CODFACChange
    end
    object EditCherche_CODCAI: TEdit
      Left = 680
      Top = 28
      Width = 34
      Height = 23
      TabOrder = 6
      TextHint = 'Filtrer par no poste'
      OnChange = EdtCherche_CODFACChange
    end
  end
  object FDQueryEntvteaa: TFDQuery
    OnCalcFields = FDQueryEntvtejjCalcFields
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from entvteaa')
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
    object SmallintField1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODVEN'
      Origin = 'CODVEN'
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
    object IntegerField5: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ACOMPTE'
      Origin = 'ACOMPTE'
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
    object StringField11: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMVEN'
      Origin = 'NOMVEN'
      Size = 30
    end
    object BCDField11: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
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
  end
  object DSEntvteaa: TDataSource
    DataSet = FDQueryEntvteaa
    Left = 360
    Top = 344
  end
end
