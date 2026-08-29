object FicheTarifClient: TFicheTarifClient
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ajouter / Modifier un tarif'
  ClientHeight = 103
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 80
    Width = 42
    Height = 15
    Caption = 'CODCLI'
    FocusControl = DBCodcli
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 20
    Width = 63
    Height = 15
    Caption = 'Code article'
  end
  object Label3: TLabel
    Left = 8
    Top = 53
    Width = 73
    Height = 15
    Caption = 'Prix vente HT.'
    FocusControl = DBPrixvte
  end
  object Label4: TLabel
    Left = 267
    Top = 53
    Width = 51
    Height = 15
    Caption = 'Remise %'
    FocusControl = DBPrcremise
  end
  object DBCodcli: TDBEdit
    Left = 64
    Top = 74
    Width = 154
    Height = 23
    DataField = 'CODCLI'
    DataSource = DSTarifcli
    TabOrder = 0
    Visible = False
  end
  object DBPrixvte: TDBEdit
    Left = 85
    Top = 50
    Width = 104
    Height = 23
    DataField = 'PRIXVTE'
    DataSource = DSTarifcli
    TabOrder = 1
  end
  object DBPrcremise: TDBEdit
    Left = 324
    Top = 50
    Width = 65
    Height = 23
    DataField = 'PRC_REMISE'
    DataSource = DSTarifcli
    TabOrder = 2
  end
  object DBLookupComboBoxArticles: TDBLookupComboBox
    Left = 85
    Top = 17
    Width = 304
    Height = 23
    DataField = 'CODART'
    DataSource = DSTarifcli
    KeyField = 'CODART'
    ListField = 'CODART;LIBELLE'
    ListFieldIndex = 1
    ListSource = DSArticles
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 520
    Top = 0
    Width = 105
    Height = 68
    BevelOuter = bvNone
    TabOrder = 4
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
      Top = 36
      Width = 105
      Height = 32
      Align = alBottom
      Cancel = True
      Caption = '&Annuler'
      ModalResult = 2
      TabOrder = 1
      OnClick = BtnAnnulerClick
    end
  end
  object DSTarifcli: TDataSource
    DataSet = DMGesCloud.ReqSaisieTarif
    Left = 464
    Top = 12
  end
  object DSArticles: TDataSource
    DataSet = DMGesCloud.ReqArticlesOuverts
    Left = 420
    Top = 52
  end
end
