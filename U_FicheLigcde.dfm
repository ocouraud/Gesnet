object FormLigcde: TFormLigcde
  Left = 0
  Top = 0
  Caption = 'Ligne commande fournisseur'
  ClientHeight = 253
  ClientWidth = 662
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
    Left = 557
    Top = 0
    Width = 105
    Height = 253
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    StyleElements = [seFont, seBorder]
    ExplicitLeft = 740
    ExplicitHeight = 334
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
    Width = 557
    Height = 253
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 24
    ExplicitTop = -32
    object Shape2: TShape
      Left = 223
      Top = 148
      Width = 298
      Height = 72
      Brush.Style = bsClear
    end
    object Shape1: TShape
      Left = 8
      Top = 148
      Width = 209
      Height = 72
      Brush.Style = bsClear
    end
    object Label4: TLabel
      Left = 21
      Top = 159
      Width = 76
      Height = 15
      Alignment = taCenter
      Caption = 'Unit'#233' de Vente'
    end
    object Label3: TLabel
      Left = 120
      Top = 159
      Width = 46
      Height = 15
      Alignment = taCenter
      Caption = 'Quantit'#233
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 63
      Height = 15
      Caption = 'Code article'
      FocusControl = DBCodart
    end
    object Label2: TLabel
      Left = 8
      Top = 60
      Width = 82
      Height = 15
      Caption = 'R'#233'f. fournisseur'
    end
    object Label5: TLabel
      Left = 359
      Top = 60
      Width = 81
      Height = 15
      Caption = 'Rapport UV/UC'
    end
    object Label9: TLabel
      Left = 239
      Top = 159
      Width = 79
      Height = 15
      Alignment = taCenter
      Caption = 'Unit'#233' de Cmde'
    end
    object Label10: TLabel
      Left = 338
      Top = 159
      Width = 46
      Height = 15
      Alignment = taCenter
      Caption = 'Quantit'#233
    end
    object Label6: TLabel
      Left = 423
      Top = 159
      Width = 39
      Height = 15
      Alignment = taCenter
      Caption = 'Prix UC'
    end
    object JvDBLookupComboCodbar: TJvDBLookupCombo
      Left = 115
      Top = 29
      Width = 385
      Height = 22
      DropDownCount = 25
      DropDownWidth = 700
      DataField = 'CODART'
      DataSource = DSLigcde
      LookupField = 'CODART'
      LookupDisplay = 'codart;libelle;pmp;qte'
      LookupDisplayIndex = 1
      LookupSource = DSArticle
      TabOrder = 1
      OnChange = DBCodartExit
      OnEnter = DBCodartEnter
      OnExit = DBCodartExit
    end
    object DBQte_UV: TJvDBCalcEdit
      Left = 120
      Top = 180
      Width = 79
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DecimalPlacesAlwaysShown = False
      OnEnter = DBQte_UVEnter
      OnExit = DBQte_UVExit
      DataField = 'QTE_UV'
      DataSource = DSLigcde
    end
    object DBCodart: TDBEdit
      Left = 8
      Top = 29
      Width = 101
      Height = 23
      DataField = 'CODART'
      DataSource = DSLigcde
      TabOrder = 0
      OnEnter = DBCodartEnter
      OnExit = DBCodartExit
    end
    object DBEditRef_fou: TDBEdit
      Left = 115
      Top = 57
      Width = 121
      Height = 23
      DataField = 'REF_FOU'
      DataSource = DSLigcde
      TabOrder = 3
    end
    object DBEditUV: TDBEdit
      Left = 21
      Top = 180
      Width = 93
      Height = 23
      DataField = 'UV'
      DataSource = DSLigcde
      TabOrder = 4
    end
    object DBEditUC: TDBEdit
      Left = 239
      Top = 180
      Width = 93
      Height = 23
      DataField = 'UC'
      DataSource = DSLigcde
      TabOrder = 5
    end
    object DBQte_UC: TJvDBCalcEdit
      Left = 338
      Top = 180
      Width = 79
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      DecimalPlacesAlwaysShown = False
      OnEnter = DBQte_UCEnter
      OnExit = DBQte_UCExit
      DataField = 'QTE_UC'
      DataSource = DSLigcde
    end
    object DBPx_UC: TJvDBCalcEdit
      Left = 423
      Top = 180
      Width = 79
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      DecimalPlacesAlwaysShown = False
      OnEnter = DBQte_UVEnter
      OnExit = DBQte_UVExit
      DataField = 'PX_UC'
      DataSource = DSLigcde
    end
    object JvCalcEditQte_UV_UC: TJvCalcEdit
      Left = 446
      Top = 57
      Width = 54
      Height = 23
      TabOrder = 8
      DecimalPlacesAlwaysShown = False
    end
  end
  object DSLigcde: TDataSource
    DataSet = FormFicheEntcde.FDMemTableLigcde
    Left = 16
    Top = 88
  end
  object FDQueryArticle: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT * '
      'FROM article '
      'WHERE article.ferme <> 1 OR article.ferme IS NULL '
      'ORDER BY libelle;')
    Left = 272
    Top = 72
  end
  object DSArticle: TDataSource
    DataSet = FDQueryArticle
    Left = 408
    Top = 96
  end
  object BalloonHint1: TBalloonHint
    HideAfter = 2000
    Left = 152
    Top = 88
  end
end
