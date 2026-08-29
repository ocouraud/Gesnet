object FormDevisPrint: TFormDevisPrint
  Left = 0
  Top = 0
  Caption = 'Impression Facture'
  ClientHeight = 749
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DSEnt_prof
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBandHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 244
      BandType = btHeader
      BeforePrint = RLBandHeaderBeforePrint
      object JvShape1: TJvShape
        Left = 400
        Top = 101
        Width = 297
        Height = 124
        Shape = stRoundRect
      end
      object JvShape6: TJvShape
        Left = 300
        Top = 4
        Width = 241
        Height = 82
        Shape = stRoundRect
      end
      object RLImgLogo: TRLImage
        Left = 587
        Top = 4
        Width = 120
        Height = 92
        Center = True
        Scaled = True
      end
      object RLDBMemoSocAdresse: TRLDBMemo
        Left = 10
        Top = 24
        Width = 274
        Height = 57
        AutoSize = False
        Behavior = [beSiteExpander]
        DataField = 'ADRESSE'
        DataSource = DSCtrstock
      end
      object RLLabelTel: TRLLabel
        Left = 10
        Top = 86
        Width = 40
        Height = 15
        Caption = 'Tel :'
      end
      object RLDBTextSocTel: TRLDBText
        Left = 56
        Top = 86
        Width = 204
        Height = 15
        DataField = 'TEL'
        DataSource = DSCtrstock
        Text = ''
      end
      object RLLabelFax: TRLLabel
        Left = 10
        Top = 101
        Width = 40
        Height = 15
        Caption = 'Fax :'
      end
      object RLDBTextSocFax: TRLDBText
        Left = 55
        Top = 101
        Width = 205
        Height = 15
        DataField = 'FAX'
        DataSource = DSCtrstock
        Text = ''
      end
      object RLLabelRC: TRLLabel
        Left = 10
        Top = 116
        Width = 40
        Height = 15
        Caption = 'No RC :'
      end
      object RLDBTextSocRC: TRLDBText
        Left = 55
        Top = 116
        Width = 205
        Height = 15
        DataField = 'RC'
        DataSource = DSCtrstock
        Text = ''
      end
      object RLLabelTahitiSoc: TRLLabel
        Left = 10
        Top = 131
        Width = 65
        Height = 15
        Caption = 'No TAHITI :'
      end
      object RLDBTextSocTahiti: TRLDBText
        Left = 80
        Top = 131
        Width = 100
        Height = 15
        DataField = 'NOTAHITI'
        DataSource = DSCtrstock
        Text = ''
      end
      object RLLabelTitreFacture: TRLLabel
        Left = 306
        Top = 15
        Width = 72
        Height = 18
        Caption = 'DEVIS No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBTextCoddev: TRLDBText
        Left = 416
        Top = 15
        Width = 68
        Height = 18
        DataField = 'CODDEV'
        DataSource = DSEnt_prof
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabelDateFac: TRLLabel
        Left = 306
        Top = 39
        Width = 45
        Height = 15
        Caption = 'DATE :'
      end
      object RLDBTextDateFac: TRLDBText
        Left = 357
        Top = 39
        Width = 80
        Height = 15
        DataField = 'DATE_'
        DataSource = DSEnt_prof
        Text = ''
      end
      object RLLabelRef: TRLLabel
        Left = 306
        Top = 60
        Width = 66
        Height = 15
        Caption = 'Reference :'
      end
      object RLDBTextRef: TRLDBText
        Left = 381
        Top = 60
        Width = 120
        Height = 15
        DataField = 'REFERENCE_'
        DataSource = DSEnt_prof
        Text = ''
      end
      object RLLabelNumCli: TRLLabel
        Left = 410
        Top = 111
        Width = 60
        Height = 15
        Caption = 'No Client :'
      end
      object RLDBTextCodCli: TRLDBText
        Left = 475
        Top = 111
        Width = 50
        Height = 15
        DataField = 'CODCLI'
        DataSource = DSClient
        Text = ''
      end
      object RLDBTextCliNom: TRLDBText
        Left = 410
        Top = 129
        Width = 275
        Height = 16
        AutoSize = False
        DataField = 'NOM'
        DataSource = DSClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBTextCliAd1: TRLDBText
        Left = 410
        Top = 147
        Width = 275
        Height = 15
        AutoSize = False
        DataField = 'AD1'
        DataSource = DSClient
        Text = ''
      end
      object RLDBTextCliAd3: TRLDBText
        Left = 410
        Top = 182
        Width = 275
        Height = 15
        AutoSize = False
        DataField = 'AD3'
        DataSource = DSClient
        Text = ''
      end
      object RLLabelCliTahiti: TRLLabel
        Left = 410
        Top = 200
        Width = 65
        Height = 15
        Caption = 'No TAHITI :'
      end
      object RLDBTextCliTahiti: TRLDBText
        Left = 480
        Top = 200
        Width = 100
        Height = 15
        DataField = 'NOTAHITI'
        DataSource = DSClient
        Text = ''
      end
      object RLLabelRepres: TRLLabel
        Left = 10
        Top = 225
        Width = 52
        Height = 15
        AutoSize = False
        Caption = 'Vendeur:'
      end
      object RLDBTextRepres: TRLDBText
        Left = 97
        Top = 211
        Width = 252
        Height = 15
        AutoSize = False
        DataField = 'NOM'
        DataSource = DSRepres
        Text = ''
      end
      object RLDBMemoNomSoc: TRLDBMemo
        Left = 8
        Top = 4
        Width = 276
        Height = 18
        Behavior = [beSiteExpander]
        DataField = 'NOM'
        DataSource = DSCtrstock
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBTextCliAd2: TRLDBText
        Left = 410
        Top = 164
        Width = 275
        Height = 15
        AutoSize = False
        DataField = 'AD2'
        DataSource = DSClient
        Text = ''
      end
      object RLDBTextVendeur: TRLDBText
        Left = 97
        Top = 225
        Width = 252
        Height = 15
        AutoSize = False
        DataField = 'NOMVEN'
        DataSource = DSEnt_prof
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 10
        Top = 211
        Width = 81
        Height = 15
        AutoSize = False
        Caption = 'Representant:'
      end
      object RLDBMemoObserv: TRLDBMemo
        Left = 10
        Top = 147
        Width = 380
        Height = 58
        AutoSize = False
        Behavior = [beSiteExpander]
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        DataField = 'OBSERV'
        DataSource = DSEnt_prof
      end
    end
    object RLBandColumnHeader: TRLBand
      Left = 38
      Top = 282
      Width = 718
      Height = 25
      BandType = btColumnHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object JvShape2: TJvShape
        Left = 0
        Top = 0
        Width = 717
        Height = 22
        Shape = stRoundRect
      end
      object RLLblColRef: TRLLabel
        Left = 5
        Top = 5
        Width = 60
        Height = 15
        Caption = 'REFERENCE'
      end
      object RLLblColDes: TRLLabel
        Left = 90
        Top = 5
        Width = 220
        Height = 15
        Caption = 'DESIGNATION'
      end
      object RLLblColQte: TRLLabel
        Left = 326
        Top = 5
        Width = 51
        Height = 15
        Alignment = taRightJustify
        Caption = 'QTE'
      end
      object RLLblColPxHT: TRLLabel
        Left = 432
        Top = 5
        Width = 73
        Height = 15
        Alignment = taRightJustify
        Caption = 'PRIX NET HT'
      end
      object RLLblColRem: TRLLabel
        Left = 382
        Top = 5
        Width = 39
        Height = 15
        Alignment = taRightJustify
        Caption = '% REM'
      end
      object RLLblColNetHT: TRLLabel
        Left = 520
        Top = 5
        Width = 55
        Height = 15
        Alignment = taRightJustify
        Caption = 'NET HT'
      end
      object RLLblColTotalTTC: TRLLabel
        Left = 600
        Top = 5
        Width = 70
        Height = 15
        Alignment = taRightJustify
        Caption = 'TOTAL TTC'
      end
      object RLLblColTVA: TRLLabel
        Left = 685
        Top = 5
        Width = 30
        Height = 15
        Alignment = taCenter
        Caption = 'TVA'
      end
    end
    object RLSubDetailLignes: TRLSubDetail
      Left = 38
      Top = 307
      Width = 718
      Height = 25
      DataSource = DSLig_prof
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLBandDetailLignes: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 18
        AutoSize = True
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BeforePrint = RLBandDetailLignesBeforePrint
        object RLDBTextArtRef: TRLDBText
          Left = 5
          Top = 3
          Width = 79
          Height = 15
          DataField = 'CODART'
          DataSource = DSLig_prof
          Text = ''
        end
        object RLDBTextArtDes: TRLDBMemo
          Left = 90
          Top = 3
          Width = 230
          Height = 15
          Behavior = [beSiteExpander]
          DataField = 'LIBELLE'
          DataSource = DSLig_prof
        end
        object RLDBTextArtQte: TRLDBText
          Left = 326
          Top = 3
          Width = 51
          Height = 15
          Alignment = taRightJustify
          DataField = 'QTE'
          DataSource = DSLig_prof
          DisplayMask = '#,##0.00'
          Text = ''
        end
        object RLDBTextArtPxHT: TRLDBText
          Left = 427
          Top = 3
          Width = 78
          Height = 15
          Alignment = taRightJustify
          DataField = 'PRIXNET'
          DataSource = DSLig_prof
          DisplayMask = '#,##0.00'
          Text = ''
        end
        object RLDBTextArtRem: TRLDBText
          Left = 382
          Top = 3
          Width = 39
          Height = 15
          Alignment = taRightJustify
          DataField = 'PRC_REMISE'
          DataSource = DSLig_prof
          Text = ''
        end
        object RLDBTextArtNetHT: TRLDBText
          Left = 511
          Top = 3
          Width = 69
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTHT'
          DataSource = DSLig_prof
          DisplayMask = '#,##0.00'
          Text = ''
        end
        object RLDBTextArtTotTTC: TRLDBText
          Left = 586
          Top = 3
          Width = 84
          Height = 15
          Alignment = taRightJustify
          DataField = 'MT_TTC'
          DataSource = DSLig_prof
          DisplayMask = '#,##0'
          Text = ''
        end
        object RLDBTextArtNoTVA: TRLDBText
          Left = 684
          Top = 3
          Width = 31
          Height = 15
          Alignment = taCenter
          DataField = 'NO_TVA'
          DataSource = DSLig_prof
          Text = ''
        end
      end
    end
    object RLBandSummary: TRLBand
      Left = 38
      Top = 332
      Width = 718
      Height = 278
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = RLBandSummaryBeforePrint
      object JvShape3: TJvShape
        Left = 10
        Top = 25
        Width = 367
        Height = 83
        Shape = stRoundRect
      end
      object JvShape5: TJvShape
        Left = 444
        Top = 25
        Width = 238
        Height = 77
        Shape = stRoundRect
      end
      object RLLabelTotalHT: TRLLabel
        Left = 453
        Top = 45
        Width = 100
        Height = 15
        Caption = 'TOTAL HT :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabelRemise: TRLLabel
        Left = 453
        Top = 28
        Width = 52
        Height = 15
        Caption = 'REMISE :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabelTotalTTC: TRLLabel
        Left = 453
        Top = 83
        Width = 72
        Height = 15
        Caption = 'TOTAL TTC :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTotalHT: TRLLabel
        Left = 578
        Top = 45
        Width = 92
        Height = 15
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTotalTTC: TRLLabel
        Left = 568
        Top = 83
        Width = 102
        Height = 15
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTotalTaxes: TRLLabel
        Left = 578
        Top = 64
        Width = 92
        Height = 15
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTvaAcquittee: TRLLabel
        Left = 10
        Top = 240
        Width = 250
        Height = 15
        Caption = 'TVA ACQUITTEE SUR LES DEBITS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBMemoGarantie: TRLDBMemo
        Left = 10
        Top = 260
        Width = 690
        Height = 15
        Behavior = [beSiteExpander]
        DataField = 'MEMO_DEV'
        DataSource = DSCtrstock
      end
      object RLLabel1: TRLLabel
        Left = 453
        Top = 64
        Width = 88
        Height = 15
        Caption = 'TOTAL TAXES :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTotalRemise: TRLLabel
        Left = 578
        Top = 28
        Width = 92
        Height = 15
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLPrc_remise: TRLLabel
        Left = 528
        Top = 28
        Width = 37
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTitreTva: TRLLabel
        Left = 13
        Top = 29
        Width = 275
        Height = 12
        Caption = 'REPARTITION TVA                  Mont. HT    Mont. TVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -10
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLMemoArreteSomme: TRLMemo
        Left = 10
        Top = 210
        Width = 705
        Height = 15
        Behavior = [beSiteExpander]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object RLDBResultQte: TRLLabel
        Left = 326
        Top = 4
        Width = 51
        Height = 15
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResultTOTHT: TRLLabel
        Left = 511
        Top = 4
        Width = 69
        Height = 15
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTVADesignation: TRLMemo
        Left = 13
        Top = 45
        Width = 343
        Height = 12
        Behavior = [beSiteExpander]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -10
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = False
      end
    end
    object RLBandPageFooter: TRLBand
      Left = 38
      Top = 610
      Width = 718
      Height = 32
      BandType = btFooter
      object RLSystemInfoPage: TRLSystemInfo
        Left = 650
        Top = 5
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Info = itPageNumber
        Text = 'Page '
      end
    end
  end
  object DSEnt_prof: TDataSource
    DataSet = DM_Olivier.FDQueryEnt_prof
    Left = 40
    Top = 670
  end
  object DSLig_prof: TDataSource
    DataSet = FDQueryLig_prof
    Left = 120
    Top = 670
  end
  object DSClient: TDataSource
    DataSet = DMGesCloud.ReqClients
    Left = 280
    Top = 670
  end
  object DSCtrstock: TDataSource
    DataSet = DMGesCloud.FDQueryCtrstock
    Left = 360
    Top = 670
  end
  object DSParameTVA: TDataSource
    DataSet = DMGesCloud.FDQueryParameTVA
    Left = 448
    Top = 668
  end
  object DSRepres: TDataSource
    DataSet = DMGesCloud.FDQueryRepres
    Left = 524
    Top = 672
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'PDF Document'
    Left = 510
    Top = 443
  end
  object FDQueryLig_prof: TFDQuery
    MasterSource = DSEnt_prof
    MasterFields = 'CODDEV'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from lig_prof where coddev = :coddev')
    Left = 192
    Top = 672
    ParamData = <
      item
        Name = 'CODDEV'
        ParamType = ptInput
      end>
    object FDQueryLig_profLIBELLE: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      BlobType = ftMemo
    end
    object FDQueryLig_profCODFAC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
    end
    object FDQueryLig_profCODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQueryLig_profCODCAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCAI'
      Origin = 'CODCAI'
      Size = 2
    end
    object FDQueryLig_profCODDEV: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEV'
      Origin = 'CODDEV'
    end
    object FDQueryLig_profCODDEP: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'CODDEP'
      Origin = 'CODDEP'
    end
    object FDQueryLig_profNOENR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOENR'
      Origin = 'NOENR'
    end
    object FDQueryLig_profANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQueryLig_profMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQueryLig_profCODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQueryLig_profCODFOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFOU'
      Origin = 'CODFOU'
      Size = 7
    end
    object FDQueryLig_profCODSSF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODSSF'
      Origin = 'CODSSF'
      Size = 4
    end
    object FDQueryLig_profCODFAM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      Size = 6
    end
    object FDQueryLig_profCODDPT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODDPT'
      Origin = 'CODDPT'
      Size = 1
    end
    object FDQueryLig_profTYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQueryLig_profCODART: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODART'
      Origin = 'CODART'
      Size = 13
    end
    object FDQueryLig_profCODBAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODBAR'
      Origin = 'CODBAR'
      Size = 13
    end
    object FDQueryLig_profQTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTE'
      Origin = 'QTE'
      Precision = 9
      Size = 3
    end
    object FDQueryLig_profPOIDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'POIDS'
      Origin = 'POIDS'
      Precision = 7
      Size = 3
    end
    object FDQueryLig_profCODTAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODTAR'
      Origin = 'CODTAR'
      Size = 1
    end
    object FDQueryLig_profPRIXHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXHT'
      Origin = 'PRIXHT'
      Precision = 11
      Size = 2
    end
    object FDQueryLig_profPRIXTTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXTTC'
      Origin = 'PRIXTTC'
    end
    object FDQueryLig_profPRIXNET: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXNET'
      Origin = 'PRIXNET'
      Precision = 11
      Size = 2
    end
    object FDQueryLig_profTOTHT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTHT'
      Origin = 'TOTHT'
      Precision = 11
      Size = 2
    end
    object FDQueryLig_profMT_TTC: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TTC'
      Origin = 'MT_TTC'
    end
    object FDQueryLig_profPRC_REMISE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRC_REMISE'
      Origin = 'PRC_REMISE'
      Precision = 5
      Size = 2
    end
    object FDQueryLig_profMT_REMISE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MT_REMISE'
      Origin = 'MT_REMISE'
    end
    object FDQueryLig_profTX_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TVA'
      Origin = 'TX_TVA'
      Precision = 5
      Size = 2
    end
    object FDQueryLig_profMT_TVA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TVA'
      Origin = 'MT_TVA'
      Precision = 9
      Size = 2
    end
    object FDQueryLig_profNO_TVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_TVA'
      Origin = 'NO_TVA'
    end
    object FDQueryLig_profPRIXREV: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRIXREV'
      Origin = 'PRIXREV'
      Precision = 11
      Size = 2
    end
    object FDQueryLig_profMARGE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'MARGE'
      Origin = 'MARGE'
    end
    object FDQueryLig_profNO_SEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_SEM'
      Origin = 'NO_SEM'
    end
    object FDQueryLig_profNO_JOUR: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NO_JOUR'
      Origin = 'NO_JOUR'
    end
    object FDQueryLig_profDET_PPT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_PPT'
      Origin = 'DET_PPT'
    end
    object FDQueryLig_profDET_ILE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DET_ILE'
      Origin = 'DET_ILE'
    end
    object FDQueryLig_profNOENRF: TFDAutoIncField
      FieldName = 'NOENRF'
      Origin = 'NOENRF'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQueryLig_profDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryLig_profIMP_CODE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'IMP_CODE'
      Origin = 'IMP_CODE'
    end
    object FDQueryLig_profTX_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TX_TSOC'
      Origin = 'TX_TSOC'
      Precision = 5
      Size = 2
    end
    object FDQueryLig_profMT_TSOC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MT_TSOC'
      Origin = 'MT_TSOC'
      Precision = 9
      Size = 2
    end
  end
end
