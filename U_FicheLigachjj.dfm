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
