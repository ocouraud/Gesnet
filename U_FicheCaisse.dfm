object FrameFicheCaisse: TFrameFicheCaisse
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
  TabOrder = 0
  object Label1: TLabel
    Left = 8
    Top = 120
    Width = 78
    Height = 15
    Caption = 'Impr. afficheur'
  end
  object Label2: TLabel
    Left = 8
    Top = 176
    Width = 94
    Height = 15
    Caption = 'Imprimante ticket'
  end
  object Label3: TLabel
    Left = 8
    Top = 149
    Width = 92
    Height = 15
    Caption = 'Impr. tiroir-caisse'
  end
  object Label4: TLabel
    Left = 8
    Top = 91
    Width = 102
    Height = 15
    Caption = 'Imprimante facture'
  end
  object Label6: TLabel
    Left = 8
    Top = 51
    Width = 89
    Height = 15
    Caption = 'D'#233'pot par d'#233'faut'
  end
  object Label5: TLabel
    Left = 8
    Top = 24
    Width = 88
    Height = 15
    Caption = 'Client par defaut'
  end
  object Panel1: TPanel
    Left = 539
    Top = 0
    Width = 101
    Height = 480
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object BtnValider: TBitBtn
      Left = 0
      Top = 0
      Width = 101
      Height = 24
      Align = alTop
      Anchors = [akTop]
      Caption = '&Valider'
      Default = True
      TabOrder = 0
      OnClick = BtnValiderClick
    end
    object BtnAnnuler: TBitBtn
      Left = 0
      Top = 24
      Width = 101
      Height = 24
      Cancel = True
      Caption = '&Annuler'
      ModalResult = 2
      TabOrder = 1
      OnClick = BtnAnnulerClick
    end
    object BtnAide: TBitBtn
      Left = 0
      Top = 48
      Width = 101
      Height = 24
      Caption = 'Aide'
      TabOrder = 2
      OnClick = BtnAideClick
    end
  end
  object DBLookupComboBoxClient: TDBLookupComboBox
    Left = 118
    Top = 21
    Width = 173
    Height = 23
    DataField = 'CODCLI'
    DataSource = DSCaisse
    KeyField = 'CODCLI'
    ListField = 'CODCLI;NOM'
    ListFieldIndex = 1
    ListSource = DSClient
    TabOrder = 1
  end
  object DBLookupComboBoxDepot: TDBLookupComboBox
    Left = 118
    Top = 48
    Width = 173
    Height = 23
    DataField = 'CODDEP'
    DataSource = DSCaisse
    KeyField = 'CODDEP'
    ListField = 'CODDEP;NOM'
    ListFieldIndex = 1
    ListSource = DSDepot
    TabOrder = 2
  end
  object DBComboBoxFacture: TDBComboBox
    Left = 118
    Top = 88
    Width = 415
    Height = 23
    DataField = 'IMP_FAC'
    DataSource = DSCaisse
    TabOrder = 3
  end
  object DBComboBoxTicket: TDBComboBox
    Left = 118
    Top = 175
    Width = 415
    Height = 23
    DataField = 'IMP_TICKET'
    DataSource = DSCaisse
    TabOrder = 6
  end
  object DBComboBoxAfficheur: TDBComboBox
    Left = 118
    Top = 117
    Width = 415
    Height = 23
    DataField = 'IMP_AFF'
    DataSource = DSCaisse
    TabOrder = 4
  end
  object DBComboBoxTiroir: TDBComboBox
    Left = 118
    Top = 146
    Width = 415
    Height = 23
    DataField = 'IMP_TIROIR'
    DataSource = DSCaisse
    TabOrder = 5
  end
  object DSCaisse: TDataSource
    DataSet = DM_Olivier.FDQueryCaisse
    Left = 456
    Top = 376
  end
  object DSClient: TDataSource
    DataSet = DM_Olivier.FDQueryClient
    Left = 96
    Top = 392
  end
  object DSDepot: TDataSource
    DataSet = DM_Olivier.FDQueryDepot
    Left = 160
    Top = 384
  end
end
