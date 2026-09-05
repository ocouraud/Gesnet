object FormLigvtejj: TFormLigvtejj
  Left = 0
  Top = 0
  Caption = 'Ligne de facture'
  ClientHeight = 334
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
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
    ExplicitLeft = 829
    ExplicitHeight = 475
    object BtnValider: TBitBtn
      Left = 0
      Top = 0
      Width = 105
      Height = 28
      Align = alTop
      Caption = '&Valider'
      Default = True
      TabOrder = 0
      OnClick = BtnValiderClick
    end
    object BtnAnnuler: TBitBtn
      Left = 0
      Top = 31
      Width = 105
      Height = 32
      Cancel = True
      Caption = '&Annuler'
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
    ExplicitTop = -8
    ExplicitHeight = 475
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
      Width = 42
      Height = 15
      Caption = 'PRIX HT'
    end
    object Label5: TLabel
      Left = 319
      Top = 159
      Width = 66
      Height = 15
      Caption = 'PRIX NET HT'
      FocusControl = DBPrixnet
    end
    object Label6: TLabel
      Left = 398
      Top = 159
      Width = 46
      Height = 15
      Caption = 'PRIX TTC'
    end
    object Label7: TLabel
      Left = 506
      Top = 159
      Width = 53
      Height = 15
      Caption = 'TOTAL HT.'
      FocusControl = DBTotht
    end
    object Label8: TLabel
      Left = 621
      Top = 159
      Width = 54
      Height = 15
      Caption = 'TOTAL TTC'
      FocusControl = DBMt_ttc
    end
    object Label9: TLabel
      Left = 247
      Top = 159
      Width = 52
      Height = 15
      Caption = '% REMISE'
    end
    object Label14: TLabel
      Left = 251
      Top = 288
      Width = 61
      Height = 15
      Caption = 'PX DET ILES'
      Enabled = False
      FocusControl = DBDET_ILE
    end
    object Label15: TLabel
      Left = 410
      Top = 288
      Width = 90
      Height = 15
      Caption = 'PX LIMIT VTE TTC'
      Enabled = False
      FocusControl = DBPXLVTTC
    end
    object Label16: TLabel
      Left = 6
      Top = 159
      Width = 29
      Height = 15
      Caption = 'TARIF'
      FocusControl = DBEdit15
    end
    object Label2: TLabel
      Left = 359
      Top = 8
      Width = 40
      Height = 15
      Caption = 'LIBELLE'
      FocusControl = DBLibelle
    end
    object Label3: TLabel
      Left = 43
      Top = 159
      Width = 55
      Height = 15
      Caption = 'QUANTITE'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 47
      Height = 15
      Caption = 'CODBAR'
      FocusControl = DBCodbar
    end
    object Label10: TLabel
      Left = 251
      Top = 240
      Width = 62
      Height = 15
      Caption = 'MT. REMISE'
      Enabled = False
      FocusControl = DBMt_remise
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
      Left = 457
      Top = 240
      Width = 43
      Height = 15
      Caption = 'MT. TVA'
      Enabled = False
      FocusControl = DBMt_tva
    end
    object Label13: TLabel
      Left = 252
      Top = 264
      Width = 60
      Height = 15
      Caption = 'PX DET PPT'
      Enabled = False
      FocusControl = DBDET_PPT
    end
    object JvDBLookupComboCodbar: TJvDBLookupCombo
      Left = 115
      Top = 29
      Width = 234
      Height = 22
      DropDownCount = 25
      DropDownWidth = 550
      DataField = 'CODBAR'
      DataSource = DSLigvtejj
      LookupField = 'codbar'
      LookupDisplay = 'codbar;libelle;prixvte'
      LookupDisplayIndex = 1
      LookupSource = DSCodbar
      TabOrder = 1
      OnChange = DBCodbarExit
      OnEnter = DBCodbarEnter
      OnExit = DBCodbarExit
    end
    object DBPrc_remise: TJvDBSpinEdit
      Left = 249
      Top = 180
      Width = 54
      Height = 25
      ValueType = vtFloat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnChange = DBPrc_remiseChange
      OnEnter = DBPrc_remiseEnter
      OnExit = DBPrc_remiseExit
      DataField = 'PRC_REMISE'
      DataSource = DSLigvtejj
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
      DataSource = DSLigvtejj
    end
    object DBPrixnet: TDBEdit
      Left = 319
      Top = 180
      Width = 73
      Height = 25
      DataField = 'PRIXNET'
      DataSource = DSLigvtejj
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object DBPrixttc: TJvDBCalcEdit
      Left = 398
      Top = 180
      Width = 97
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      DecimalPlacesAlwaysShown = False
      OnExit = DBPrixttcExit
      DataField = 'PRIXTTC'
      DataSource = DSLigvtejj
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
      TabOrder = 6
      DecimalPlacesAlwaysShown = False
      OnEnter = DBQteEnter
      OnExit = DBQteExit
      DataField = 'QTE'
      DataSource = DSLigvtejj
    end
    object DBMt_ttc: TDBEdit
      Left = 621
      Top = 175
      Width = 95
      Height = 29
      DataField = 'MT_TTC'
      DataSource = DSLigvtejj
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object DBMt_tva: TDBEdit
      Left = 506
      Top = 238
      Width = 92
      Height = 23
      DataField = 'MT_TVA'
      DataSource = DSLigvtejj
      Enabled = False
      TabOrder = 8
    end
    object DBTotht: TDBEdit
      Left = 506
      Top = 180
      Width = 92
      Height = 25
      DataField = 'TOTHT'
      DataSource = DSLigvtejj
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object DBTx_tva: TDBEdit
      Left = 200
      Top = 237
      Width = 35
      Height = 23
      DataField = 'TX_TVA'
      DataSource = DSLigvtejj
      Enabled = False
      TabOrder = 10
    end
    object DBCodbar: TDBEdit
      Left = 8
      Top = 29
      Width = 101
      Height = 23
      DataField = 'CODBAR'
      DataSource = DSLigvtejj
      TabOrder = 0
      OnEnter = DBCodbarEnter
      OnExit = DBCodbarExit
    end
    object DBDET_PPT: TDBEdit
      Left = 318
      Top = 261
      Width = 74
      Height = 23
      DataField = 'DET_PPT'
      DataSource = DSLigvtejj
      Enabled = False
      TabOrder = 11
    end
    object DBDET_ILE: TDBEdit
      Left = 318
      Top = 285
      Width = 74
      Height = 23
      DataField = 'DET_ILE'
      DataSource = DSLigvtejj
      Enabled = False
      TabOrder = 12
    end
    object DBPXLVTTC: TDBEdit
      Left = 506
      Top = 285
      Width = 92
      Height = 23
      DataField = 'PXLVTTC'
      DataSource = DSLigvtejj
      Enabled = False
      TabOrder = 13
    end
    object DBEdit15: TDBEdit
      Left = 12
      Top = 180
      Width = 19
      Height = 25
      DataField = 'CODTAR'
      DataSource = DSLigvtejj
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object DBMt_remise: TDBEdit
      Left = 319
      Top = 237
      Width = 73
      Height = 23
      DataField = 'MT_REMISE'
      DataSource = DSLigvtejj
      Enabled = False
      TabOrder = 15
    end
    object DBLibelle: TDBMemo
      Left = 355
      Top = 29
      Width = 357
      Height = 108
      DataField = 'LIBELLE'
      DataSource = DSLigvtejj
      ScrollBars = ssVertical
      TabOrder = 16
    end
  end
  object DSLigvtejj: TDataSource
    DataSet = FormEntvtejj.FDMemTableLigvtejj
    Left = 24
    Top = 208
  end
  object FDQuery1: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ligvtejj')
    Left = 32
    Top = 264
    object FDQuery1LIBELLE: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      BlobType = ftMemo
    end
    object FDQuery1CODFAC: TLargeintField
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
      Required = True
    end
    object FDQuery1CODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQuery1CODCAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object FDQuery1CODDEV: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
    end
    object FDQuery1CODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQuery1NOENR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR'
      Origin = 'NOENR'
    end
    object FDQuery1ANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQuery1MOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQuery1CODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQuery1CODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQuery1CODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      Size = 4
    end
    object FDQuery1CODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      Size = 6
    end
    object FDQuery1CODDPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODDPT'
      Origin = 'CODDPT'
      Size = 1
    end
    object FDQuery1TYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQuery1CODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      Size = 13
    end
    object FDQuery1CODBAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODBAR'
      Origin = 'CODBAR'
      Size = 13
    end
    object FDQuery1QTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      Precision = 9
      Size = 3
    end
    object FDQuery1POIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      Precision = 7
      Size = 3
    end
    object FDQuery1CODTAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR'
      Origin = 'CODTAR'
      Size = 1
    end
    object FDQuery1PRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      Precision = 11
      Size = 2
    end
    object FDQuery1PRIXTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXTTC'
      Origin = 'PRIXTTC'
    end
    object FDQuery1PRIXNET: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXNET'
      Origin = 'PRIXNET'
      Precision = 11
      Size = 2
    end
    object FDQuery1TOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object FDQuery1MT_TTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQuery1PRC_REMISE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object FDQuery1MT_REMISE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object FDQuery1TX_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TVA'
      Origin = 'TX_TVA'
      Precision = 5
      Size = 2
    end
    object FDQuery1MT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object FDQuery1NO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_TVA'
      Origin = 'NO_TVA'
    end
    object FDQuery1PRIXREV: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXREV'
      Origin = 'PRIXREV'
      Precision = 11
      Size = 2
    end
    object FDQuery1MARGE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object FDQuery1NO_SEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object FDQuery1NO_JOUR: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object FDQuery1DET_PPT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_PPT'
      Origin = 'DET_PPT'
    end
    object FDQuery1DET_ILE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_ILE'
      Origin = 'DET_ILE'
    end
    object FDQuery1NOENRF: TFDAutoIncField
      FieldName = 'NOENRF'
      Origin = 'NOENRF'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQuery1PXLVTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PXLVTTC'
      Origin = 'PXLVTTC'
    end
    object FDQuery1DER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQuery1TX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object FDQuery1MT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 88
    Top = 208
  end
  object FDQueryCodbar: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT article.*, codbar.codbar '
      'FROM article '
      'JOIN codbar ON codbar.codart = article.codart '
      'WHERE article.ferme <> 1 OR article.ferme IS NULL '
      'ORDER BY article.libelle;')
    Left = 104
    Top = 280
    object FDQueryCodbarOBSERV: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV'
      Origin = 'OBSERV'
      BlobType = ftMemo
    end
    object FDQueryCodbarCODART: TStringField
      FieldName = 'CODART'
      Origin = 'CODART'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object FDQueryCodbarFERME: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FERME'
      Origin = 'FERME'
    end
    object FDQueryCodbarLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryCodbarCODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      Size = 6
    end
    object FDQueryCodbarCODDPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODDPT'
      Origin = 'CODDPT'
      Size = 1
    end
    object FDQueryCodbarCODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      Size = 4
    end
    object FDQueryCodbarCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQueryCodbarREF_FOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REF_FOU'
      Origin = 'REF_FOU'
    end
    object FDQueryCodbarCOND: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COND'
      Origin = 'COND'
    end
    object FDQueryCodbarQTEMIN: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTEMIN'
      Origin = 'QTEMIN'
    end
    object FDQueryCodbarUNIMIN: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'UNIMIN'
      Origin = 'UNIMIN'
    end
    object FDQueryCodbarPRIXVTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXVTE'
      Origin = 'PRIXVTE'
      Precision = 10
      Size = 2
    end
    object FDQueryCodbarPMP: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PMP'
      Origin = 'PMP'
      Precision = 11
      Size = 2
    end
    object FDQueryCodbarPRIXACH: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXACH'
      Origin = 'PRIXACH'
      Precision = 9
      Size = 2
    end
    object FDQueryCodbarCOM_PR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COM_PR'
      Origin = 'COM_PR'
      Precision = 7
      Size = 2
    end
    object FDQueryCodbarQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      Precision = 9
      Size = 3
    end
    object FDQueryCodbarUNIT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'UNIT'
      Origin = 'UNIT'
    end
    object FDQueryCodbarQTECDE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTECDE'
      Origin = 'QTECDE'
    end
    object FDQueryCodbarCODEMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEMP'
      Origin = 'CODEMP'
    end
    object FDQueryCodbarVOLUME: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Precision = 7
      Size = 2
    end
    object FDQueryCodbarUC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UC'
      Origin = 'UC'
      Size = 10
    end
    object FDQueryCodbarQTE_UV_UC: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'QTE_UV_UC'
      Origin = 'QTE_UV_UC'
    end
    object FDQueryCodbarPOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      Precision = 7
      Size = 3
    end
    object FDQueryCodbarTVA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TVA'
      Origin = 'TVA'
      Size = 5
    end
    object FDQueryCodbarPREST: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'PREST'
      Origin = 'PREST'
    end
    object FDQueryCodbarG_STO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'G_STO'
      Origin = 'G_STO'
    end
    object FDQueryCodbarDET_PPT: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DET_PPT'
      Origin = 'DET_PPT'
    end
    object FDQueryCodbarCODPRIX: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPRIX'
      Origin = 'CODPRIX'
      Size = 1
    end
    object FDQueryCodbarSELECT_: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
    end
    object FDQueryCodbarLOT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'LOT'
      Origin = 'LOT'
    end
    object FDQueryCodbarGARANTIE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'GARANTIE'
      Origin = 'GARANTIE'
    end
    object FDQueryCodbarQTE_AUTO: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'QTE_AUTO'
      Origin = 'QTE_AUTO'
    end
    object FDQueryCodbarDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryCodbarOBSERV_FAC: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'OBSERV_FAC'
      Origin = 'OBSERV_FAC'
    end
    object FDQueryCodbarIMAGE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IMAGE'
      Origin = 'IMAGE'
      Size = 128
    end
    object FDQueryCodbarCODFAM_WEB: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM_WEB'
      Origin = 'CODFAM_WEB'
      Size = 5
    end
    object FDQueryCodbarLIBCOURT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBCOURT'
      Origin = 'LIBCOURT'
    end
    object FDQueryCodbarPXLVHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PXLVHT'
      Origin = 'PXLVHT'
      Precision = 11
      Size = 2
    end
    object FDQueryCodbarLIBRE_PPT: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'LIBRE_PPT'
      Origin = 'LIBRE_PPT'
    end
    object FDQueryCodbarTAX_SOC: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TAX_SOC'
      Origin = 'TAX_SOC'
    end
    object FDQueryCodbarEXCLU_TVA1: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'EXCLU_TVA1'
      Origin = 'EXCLU_TVA1'
    end
    object FDQueryCodbarcodbar: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codbar'
      Origin = 'CODBAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
  object DSCodbar: TDataSource
    DataSet = FDQueryCodbar
    Left = 144
    Top = 272
  end
  object BalloonHint1: TBalloonHint
    HideAfter = 2000
    Left = 632
    Top = 176
  end
end
