object FormLigachjj: TFormLigachjj
  Left = 0
  Top = 0
  Caption = 'Ligne achat'
  ClientHeight = 334
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 740
    Top = 0
    Width = 105
    Height = 334
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    StyleElements = [seFont, seBorder]
    object BtnValider: TBitBtn
      Left = 0
      Top = 0
      Width = 105
      Height = 28
      Align = alTop
      Caption = '&Valider '#10004
      Default = True
      TabOrder = 0
      OnClick = BtnValiderClick
      ExplicitLeft = 6
      ExplicitTop = -3
    end
    object BtnAnnuler: TBitBtn
      Left = 0
      Top = 31
      Width = 105
      Height = 28
      Cancel = True
      Caption = '&Annuler '#10060
      ModalResult = 2
      TabOrder = 1
      OnClick = BtnAnnulerClick
    end
  end
  object PanelFond: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 334
    Align = alClient
    TabOrder = 0
    object Shape1: TShape
      Left = 2
      Top = 148
      Width = 732
      Height = 72
      Brush.Style = bsClear
    end
    object Label4: TLabel
      Left = 133
      Top = 159
      Width = 45
      Height = 15
      Alignment = taCenter
      Caption = 'PRIX HT.'
    end
    object Label6: TLabel
      Left = 305
      Top = 159
      Width = 46
      Height = 15
      Alignment = taCenter
      Caption = 'PRIX TTC'
    end
    object Label7: TLabel
      Left = 408
      Top = 159
      Width = 53
      Height = 15
      Alignment = taCenter
      Caption = 'TOTAL HT.'
      FocusControl = DBTotht
    end
    object Label8: TLabel
      Left = 604
      Top = 159
      Width = 54
      Height = 15
      Alignment = taCenter
      Caption = 'TOTAL TTC'
    end
    object Label3: TLabel
      Left = 43
      Top = 159
      Width = 55
      Height = 15
      Alignment = taCenter
      Caption = 'QUANTITE'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 63
      Height = 15
      Caption = 'Code article'
      FocusControl = DBCodart
    end
    object Label11: TLabel
      Left = 158
      Top = 240
      Width = 36
      Height = 15
      Caption = 'TX TVA'
      Enabled = False
      FocusControl = DBTx_tva
    end
    object Label12: TLabel
      Left = 506
      Top = 159
      Width = 43
      Height = 15
      Alignment = taCenter
      Caption = 'MT. TVA'
      FocusControl = DBMt_tva
    end
    object JvDBLookupComboCodbar: TJvDBLookupCombo
      Left = 115
      Top = 29
      Width = 385
      Height = 22
      DropDownCount = 25
      DropDownWidth = 700
      DataField = 'CODART'
      DataSource = DSLigachjj
      LookupField = 'CODART'
      LookupDisplay = 'codart;libelle;pmp;qte'
      LookupDisplayIndex = 1
      LookupSource = DSArticle
      TabOrder = 1
      OnChange = DBCodartExit
      OnEnter = DBCodartEnter
      OnExit = DBCodartExit
    end
    object DBPrixht: TJvDBCalcEdit
      Left = 133
      Top = 180
      Width = 106
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      DecimalPlacesAlwaysShown = False
      OnExit = DBPrixhtExit
      DataField = 'PRIXHT'
      DataSource = DSLigachjj
      EmptyIsNull = False
    end
    object DBPrixttc: TJvDBCalcEdit
      Left = 305
      Top = 180
      Width = 97
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      DecimalPlacesAlwaysShown = False
      OnExit = DBPrixttcExit
      DataField = 'PRIXTTC'
      DataSource = DSLigachjj
    end
    object DBQte: TJvDBCalcEdit
      Left = 43
      Top = 180
      Width = 79
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      DecimalPlacesAlwaysShown = False
      OnEnter = DBQteEnter
      OnExit = DBQteExit
      DataField = 'QTE'
      DataSource = DSLigachjj
    end
    object DBMt_tva: TDBEdit
      Left = 506
      Top = 180
      Width = 92
      Height = 25
      BiDiMode = bdRightToLeft
      DataField = 'MT_TVA'
      DataSource = DSLigachjj
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 6
      OnExit = DBMt_tvaExit
    end
    object DBTotht: TDBEdit
      Left = 408
      Top = 180
      Width = 92
      Height = 25
      BiDiMode = bdRightToLeft
      DataField = 'TOTHT'
      DataSource = DSLigachjj
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 5
      OnExit = DBTothtExit
    end
    object DBTx_tva: TDBEdit
      Left = 200
      Top = 237
      Width = 35
      Height = 23
      DataField = 'TX_TVA'
      DataSource = DSLigachjj
      Enabled = False
      TabOrder = 7
    end
    object DBCodart: TDBEdit
      Left = 8
      Top = 29
      Width = 101
      Height = 23
      DataField = 'CODART'
      DataSource = DSLigachjj
      TabOrder = 0
      OnEnter = DBCodartEnter
      OnExit = DBCodartExit
    end
    object JvCalcEditMT_TTC: TJvCalcEdit
      Left = 604
      Top = 180
      Width = 97
      Height = 25
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      DecimalPlacesAlwaysShown = False
      OnExit = JvCalcEditMT_TTCExit
    end
  end
  object DSLigachjj: TDataSource
    DataSet = FormFicheAchat.FDMemTableLigachjj
    Left = 48
    Top = 72
  end
  object FDQueryArticle: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT * '
      'FROM article '
      'WHERE article.ferme <> 1 OR article.ferme IS NULL '
      'ORDER BY libelle;')
    Left = 32
    Top = 248
    object FDQueryArticleOBSERV: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      BlobType = ftMemo
    end
    object FDQueryArticleCODART: TStringField
      FieldName = 'CODART'
      Origin = 'CODART'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object FDQueryArticleFERME: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FERME'
      Origin = 'FERME'
    end
    object FDQueryArticleLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryArticleCODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      Size = 6
    end
    object FDQueryArticleCODDPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODDPT'
      Origin = 'CODDPT'
      Size = 1
    end
    object FDQueryArticleCODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      Size = 4
    end
    object FDQueryArticleCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQueryArticleREF_FOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REF_FOU'
      Origin = 'REF_FOU'
    end
    object FDQueryArticleCOND: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COND'
      Origin = 'COND'
    end
    object FDQueryArticleQTEMIN: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTEMIN'
      Origin = 'QTEMIN'
    end
    object FDQueryArticleUNIMIN: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'UNIMIN'
      Origin = 'UNIMIN'
    end
    object FDQueryArticlePRIXVTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXVTE'
      Origin = 'PRIXVTE'
      Precision = 10
      Size = 2
    end
    object FDQueryArticlePMP: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PMP'
      Origin = 'PMP'
      Precision = 11
      Size = 2
    end
    object FDQueryArticlePRIXACH: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXACH'
      Origin = 'PRIXACH'
      Precision = 9
      Size = 2
    end
    object FDQueryArticleCOM_PR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COM_PR'
      Origin = 'COM_PR'
      Precision = 7
      Size = 2
    end
    object FDQueryArticleQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      Precision = 9
      Size = 3
    end
    object FDQueryArticleUNIT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'UNIT'
      Origin = 'UNIT'
    end
    object FDQueryArticleQTECDE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTECDE'
      Origin = 'QTECDE'
    end
    object FDQueryArticleCODEMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
    end
    object FDQueryArticleVOLUME: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Precision = 7
      Size = 2
    end
    object FDQueryArticleUC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UC'
      Origin = 'UC'
      Size = 10
    end
    object FDQueryArticleQTE_UV_UC: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'QTE_UV_UC'
      Origin = 'QTE_UV_UC'
    end
    object FDQueryArticlePOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      Precision = 7
      Size = 3
    end
    object FDQueryArticleTVA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TVA'
      Origin = 'TVA'
      Size = 5
    end
    object FDQueryArticlePREST: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PREST'
      Origin = 'PREST'
    end
    object FDQueryArticleG_STO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'G_STO'
      Origin = 'G_STO'
    end
    object FDQueryArticleDET_PPT: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DET_PPT'
      Origin = 'DET_PPT'
    end
    object FDQueryArticleCODPRIX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPRIX'
      Origin = 'CODPRIX'
      Size = 1
    end
    object FDQueryArticleSELECT_: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
    end
    object FDQueryArticleLOT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'LOT'
      Origin = 'LOT'
    end
    object FDQueryArticleGARANTIE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'GARANTIE'
      Origin = 'GARANTIE'
    end
    object FDQueryArticleQTE_AUTO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'QTE_AUTO'
      Origin = 'QTE_AUTO'
    end
    object FDQueryArticleDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryArticleOBSERV_FAC: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV_FAC'
      Origin = 'OBSERV_FAC'
    end
    object FDQueryArticleIMAGE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IMAGE'
      Origin = 'IMAGE'
      Size = 128
    end
    object FDQueryArticleCODFAM_WEB: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM_WEB'
      Origin = 'CODFAM_WEB'
      Size = 5
    end
    object FDQueryArticleLIBCOURT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBCOURT'
      Origin = 'LIBCOURT'
    end
    object FDQueryArticlePXLVHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PXLVHT'
      Origin = 'PXLVHT'
      Precision = 11
      Size = 2
    end
    object FDQueryArticleLIBRE_PPT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'LIBRE_PPT'
      Origin = 'LIBRE_PPT'
    end
    object FDQueryArticleTAX_SOC: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAX_SOC'
      Origin = 'TAX_SOC'
    end
    object FDQueryArticleEXCLU_TVA1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'EXCLU_TVA1'
      Origin = 'EXCLU_TVA1'
    end
  end
  object DSArticle: TDataSource
    DataSet = FDQueryArticle
    Left = 144
    Top = 272
  end
  object BalloonHint1: TBalloonHint
    HideAfter = 2000
    Left = 664
    Top = 240
  end
end
