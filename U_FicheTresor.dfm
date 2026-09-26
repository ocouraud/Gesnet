object FormFicheTresor: TFormFicheTresor
  Left = 0
  Top = 0
  Caption = 'Ecriture client'
  ClientHeight = 247
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 24
    Height = 15
    Caption = 'Date'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 34
    Height = 15
    Caption = 'Libell'#233
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 268
    Top = 173
    Width = 30
    Height = 15
    Caption = 'DEBIT'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 368
    Top = 173
    Width = 38
    Height = 15
    Caption = 'CREDIT'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 8
    Top = 173
    Width = 77
    Height = 15
    Caption = 'Date '#233'ch'#233'ance'
  end
  object Label7: TLabel
    Left = 8
    Top = 120
    Width = 52
    Height = 15
    Caption = 'R'#233'f'#233'rence'
    FocusControl = DBEdit7
  end
  object Label5: TLabel
    Left = 126
    Top = 8
    Width = 68
    Height = 15
    Caption = 'Code journal'
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 85
    Width = 454
    Height = 23
    DataField = 'LIBELLE'
    DataSource = DSTresor
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 268
    Top = 194
    Width = 94
    Height = 23
    DataField = 'DEBIT'
    DataSource = DSTresor
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 368
    Top = 194
    Width = 94
    Height = 23
    DataField = 'CREDIT'
    DataSource = DSTresor
    TabOrder = 2
  end
  object DBEdit7: TDBEdit
    Left = 8
    Top = 141
    Width = 154
    Height = 23
    DataField = 'REFERENCE_'
    DataSource = DSTresor
    TabOrder = 3
  end
  object BtnAnnuler: TBitBtn
    Left = 511
    Top = 32
    Width = 105
    Height = 32
    Cancel = True
    Caption = '&Annuler'
    ModalResult = 2
    TabOrder = 4
  end
  object BtnValider: TBitBtn
    Left = 511
    Top = 1
    Width = 105
    Height = 28
    Caption = '&Valider'
    Default = True
    TabOrder = 5
  end
  object DBLookupComboBoxJournal: TDBLookupComboBox
    Left = 124
    Top = 29
    Width = 145
    Height = 23
    DataField = 'CODJAL'
    DataSource = DSTresor
    KeyField = 'CODJAL'
    ListField = 'CODJAL;LIBELLE'
    ListFieldIndex = 1
    ListSource = DSJournal
    TabOrder = 6
  end
  object JvDBDateEditDate_: TJvDBDateEdit
    Left = 8
    Top = 29
    Width = 97
    Height = 23
    DataField = 'DATE_'
    DataSource = DSTresor
    ShowNullDate = False
    TabOrder = 7
  end
  object JvDBDateEditDate_ech: TJvDBDateEdit
    Left = 8
    Top = 194
    Width = 94
    Height = 23
    DataField = 'DATE_ECH'
    DataSource = DSTresor
    ShowNullDate = False
    TabOrder = 8
  end
  object DSTresor: TDataSource
    DataSet = FDQueryTresor
    Left = 456
    Top = 8
  end
  object FDQueryTresor: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from tresor where noenr=:noenr and codcli=:codcli')
    Left = 368
    Top = 16
    ParamData = <
      item
        Name = 'NOENR'
        ParamType = ptInput
      end
      item
        Name = 'CODCLI'
        ParamType = ptInput
      end>
    object FDQueryTresorCODCLI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLI'
      Origin = 'CODCLI'
    end
    object FDQueryTresorDATE_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_'
      Origin = 'DATE_'
    end
    object FDQueryTresorTOP_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TOP_'
      Origin = 'TOP_'
      Size = 1
    end
    object FDQueryTresorLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryTresorDEBIT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'DEBIT'
      Origin = 'DEBIT'
    end
    object FDQueryTresorCREDIT: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
    end
    object FDQueryTresorANNEE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
    end
    object FDQueryTresorMOIS: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'MOIS'
      Origin = 'MOIS'
    end
    object FDQueryTresorDATE_ECH: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_ECH'
      Origin = 'DATE_ECH'
    end
    object FDQueryTresorCODPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPAI'
      Origin = 'CODPAI'
      Size = 5
    end
    object FDQueryTresorSOLDE: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SOLDE'
      Origin = 'SOLDE'
    end
    object FDQueryTresorSELECT_: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'SELECT_'
      Origin = 'SELECT_'
    end
    object FDQueryTresorDATE_OPER: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_OPER'
      Origin = 'DATE_OPER'
    end
    object FDQueryTresorDATE_COMPTA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_COMPTA'
      Origin = 'DATE_COMPTA'
    end
    object FDQueryTresorREFERENCE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE_'
      Origin = 'REFERENCE_'
      Size = 15
    end
    object FDQueryTresorTYPE_: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      Size = 1
    end
    object FDQueryTresorCODREP: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'CODREP'
      Origin = 'CODREP'
    end
    object FDQueryTresorORIGIN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ORIGIN'
      Origin = 'ORIGIN'
      Size = 1
    end
    object FDQueryTresorLETTRE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LETTRE'
      Origin = 'LETTRE'
      Size = 2
    end
    object FDQueryTresorNOENR: TFDAutoIncField
      FieldName = 'NOENR'
      Origin = 'NOENR'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQueryTresorDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
    object FDQueryTresorCODJAL: TStringField
      FieldName = 'CODJAL'
      Size = 5
    end
  end
  object DSJournal: TDataSource
    DataSet = FDQueryJournal
    Left = 529
    Top = 192
  end
  object FDQueryJournal: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from journal where type_<>'#39'V'#39' and type_<>'#39'A'#39)
    Left = 520
    Top = 128
  end
end
