object FormFacturePrint: TFormFacturePrint
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
    DataSource = DSEntvteaa
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
        Width = 104
        Height = 18
        Caption = 'FACTURE No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBTextNumFac: TRLDBText
        Left = 416
        Top = 15
        Width = 90
        Height = 18
        DataField = 'CODFAC'
        DataSource = DSEntvteaa
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
        DataSource = DSEntvteaa
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
        DataSource = DSEntvteaa
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
        DataSource = DSEntvteaa
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
        DataSource = DSEntvteaa
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
      DataSource = DSLigvteaa
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
          DataSource = DSLigvteaa
          Text = ''
        end
        object RLDBTextArtDes: TRLDBMemo
          Left = 90
          Top = 3
          Width = 230
          Height = 15
          Behavior = [beSiteExpander]
          DataField = 'LIBELLE'
          DataSource = DSLigvteaa
        end
        object RLDBTextArtQte: TRLDBText
          Left = 326
          Top = 3
          Width = 51
          Height = 15
          Alignment = taRightJustify
          DataField = 'QTE'
          DataSource = DSLigvteaa
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
          DataSource = DSLigvteaa
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
          DataSource = DSLigvteaa
          Text = ''
        end
        object RLDBTextArtNetHT: TRLDBText
          Left = 511
          Top = 3
          Width = 69
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTHT'
          DataSource = DSLigvteaa
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
          DataSource = DSLigvteaa
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
          DataSource = DSLigvteaa
          Text = ''
        end
      end
    end
    object RLBandSummary: TRLBand
      Left = 38
      Top = 332
      Width = 718
      Height = 303
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
      object JvShape4: TJvShape
        Left = 10
        Top = 111
        Width = 367
        Height = 93
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
      object RLLblTitreReglement: TRLLabel
        Left = 13
        Top = 114
        Width = 161
        Height = 14
        Caption = 'MODALITES DE REGLEMENT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTitreRegMnt: TRLLabel
        Left = 187
        Top = 114
        Width = 82
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Montants'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblTitreRegEch: TRLLabel
        Left = 275
        Top = 114
        Width = 100
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Dates '#233'ch'#233'ance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLblRegL1_Lib: TRLLabel
        Left = 13
        Top = 134
        Width = 105
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL1_Mnt: TRLLabel
        Left = 164
        Top = 134
        Width = 105
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL1_Ech: TRLLabel
        Left = 286
        Top = 134
        Width = 85
        Height = 15
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL2_Lib: TRLLabel
        Left = 13
        Top = 151
        Width = 105
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL2_Mnt: TRLLabel
        Left = 164
        Top = 151
        Width = 105
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL2_Ech: TRLLabel
        Left = 286
        Top = 151
        Width = 85
        Height = 15
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL3_Lib: TRLLabel
        Left = 13
        Top = 168
        Width = 105
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL3_Mnt: TRLLabel
        Left = 164
        Top = 168
        Width = 105
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL3_Ech: TRLLabel
        Left = 286
        Top = 168
        Width = 85
        Height = 15
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL4_Lib: TRLLabel
        Left = 13
        Top = 185
        Width = 105
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL4_Mnt: TRLLabel
        Left = 164
        Top = 185
        Width = 105
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
      end
      object RLLblRegL4_Ech: TRLLabel
        Left = 286
        Top = 185
        Width = 85
        Height = 15
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
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
        Height = 40
        Behavior = [beSiteExpander]
        DataField = 'MEMO_FAC'
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
      Top = 635
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
  object DSEntvteaa: TDataSource
    DataSet = DMGesCloud.FDQueryPrintEntvteaa
    Left = 40
    Top = 670
  end
  object DSLigvteaa: TDataSource
    DataSet = DMGesCloud.FDQueryLigvteaa
    Left = 120
    Top = 670
  end
  object DSReglaa: TDataSource
    DataSet = DMGesCloud.FDQueryReglaa
    Left = 200
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
end
