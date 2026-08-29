object FormFichePaiement: TFormFichePaiement
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Fiche mode de paiement'
  ClientHeight = 180
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    637
    180)
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 28
    Height = 15
    Caption = 'Code'
    FocusControl = DBCodpai
  end
  object Label2: TLabel
    Left = 109
    Top = 16
    Width = 34
    Height = 15
    Caption = 'Libell'#233
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 27
    Top = 61
    Width = 63
    Height = 15
    Caption = 'No compta.'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 109
    Top = 61
    Width = 54
    Height = 15
    Caption = 'Code jrnal'
    FocusControl = DBEdit4
  end
  object Label8: TLabel
    Left = 27
    Top = 106
    Width = 34
    Height = 15
    Caption = 'Devise'
  end
  object DBCodpai: TDBEdit
    Left = 24
    Top = 32
    Width = 79
    Height = 23
    CharCase = ecUpperCase
    DataField = 'CODPAI'
    DataSource = DSPaiement
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 109
    Top = 32
    Width = 244
    Height = 23
    DataField = 'LIBELLE'
    DataSource = DSPaiement
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 77
    Width = 79
    Height = 23
    DataField = 'NOCPT'
    DataSource = DSPaiement
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 109
    Top = 77
    Width = 49
    Height = 23
    CharCase = ecUpperCase
    DataField = 'CODJAL'
    DataSource = DSPaiement
    TabOrder = 3
  end
  object DBCheckBoxActif: TDBCheckBox
    Left = 359
    Top = 83
    Width = 97
    Height = 17
    Caption = 'Actif'
    DataField = 'ACTIF'
    DataSource = DSPaiement
    TabOrder = 6
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBoxCheque: TDBCheckBox
    Left = 359
    Top = 106
    Width = 97
    Height = 17
    Caption = 'Edition ch'#232'que'
    DataField = 'EDIT_CHQ'
    DataSource = DSPaiement
    TabOrder = 7
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object RzDBRadioGroupType_: TRzDBRadioGroup
    Left = 359
    Top = 8
    Width = 153
    Height = 65
    DataField = 'TYPE_'
    DataSource = DSPaiement
    Items.Strings = (
      'Comptant'
      'Cr'#233'dit'
      'TPE')
    Values.Strings = (
      'C'
      'D'
      'T')
    OnChange = RzDBRadioGroupType_Change
    Caption = 'Nature'
    Color = 15590617
    Columns = 2
    HorizontalSpacing = 15
    TabOrder = 5
  end
  object DBCheckBoxArrondi: TDBCheckBox
    Left = 359
    Top = 129
    Width = 159
    Height = 17
    Caption = 'Affectation de l'#39'arrondi '
    DataField = 'ARRONDI'
    DataSource = DSPaiement
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBLookupComboBoxDevise: TDBLookupComboBox
    Left = 24
    Top = 122
    Width = 145
    Height = 23
    DataField = 'CODDEV'
    DataSource = DSPaiement
    KeyField = 'CODE'
    ListFieldIndex = 1
    ListSource = DSParame
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 525
    Top = 8
    Width = 107
    Height = 81
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 9
    object BtnValider: TBitBtn
      Left = 0
      Top = 0
      Width = 107
      Height = 27
      Align = alTop
      Anchors = [akTop]
      Caption = '&Valider'
      Default = True
      TabOrder = 0
      OnClick = BtnValiderClick
    end
    object BtnAnnuler: TBitBtn
      Left = 0
      Top = 27
      Width = 107
      Height = 27
      Align = alClient
      Cancel = True
      Caption = '&Annuler'
      ModalResult = 2
      TabOrder = 1
    end
    object BtnAide: TBitBtn
      Left = 0
      Top = 54
      Width = 107
      Height = 27
      Align = alBottom
      Anchors = [akBottom]
      Caption = 'Aide'
      TabOrder = 2
      OnClick = BtnAideClick
    end
  end
  object DSPaiement: TDataSource
    DataSet = DM_Olivier.FDQueryPaiement
    OnDataChange = DSPaiementDataChange
    Left = 224
    Top = 72
  end
  object FDQueryParameDevise: TFDQuery
    MasterFields = 'DEVISE'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from parame where type_='#39'D'#39)
    Left = 280
    Top = 104
  end
  object DSParame: TDataSource
    DataSet = FDQueryParameDevise
    Left = 184
    Top = 120
  end
end
