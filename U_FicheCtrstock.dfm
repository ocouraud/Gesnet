object FrameFicheCtrstock: TFrameFicheCtrstock
  Left = 0
  Top = 0
  Width = 741
  Height = 573
  Align = alClient
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 76
    Width = 741
    Height = 497
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 76
    Width = 741
    Height = 497
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'G'#233'n'#233'ral'
      object Label3: TLabel
        Left = 3
        Top = 13
        Width = 47
        Height = 15
        Caption = 'ADRESSE'
        FocusControl = DBMemo1Adresse
      end
      object Label2: TLabel
        Left = 3
        Top = 109
        Width = 15
        Height = 15
        Caption = 'RC'
        FocusControl = DBEdit1
      end
      object Label4: TLabel
        Left = 3
        Top = 138
        Width = 51
        Height = 15
        Caption = 'NOTAHITI'
        FocusControl = DBEdit2
      end
      object Label5: TLabel
        Left = 3
        Top = 167
        Width = 18
        Height = 15
        Caption = 'TEL'
        FocusControl = DBEdit3
      end
      object Label6: TLabel
        Left = 3
        Top = 196
        Width = 20
        Height = 15
        Caption = 'FAX'
        FocusControl = DBEdit4
      end
      object Label7: TLabel
        Left = 3
        Top = 225
        Width = 34
        Height = 15
        Caption = 'EMAIL'
        FocusControl = DBEdit5
      end
      object Label8: TLabel
        Left = 3
        Top = 255
        Width = 47
        Height = 15
        Caption = 'BANQUE'
        FocusControl = DBMemo1
      end
      object Label9: TLabel
        Left = 3
        Top = 334
        Width = 53
        Height = 30
        Caption = 'Lieu de '#13#10'   livraison'
        FocusControl = DBEdit6
      end
      object Label10: TLabel
        Left = 3
        Top = 370
        Width = 69
        Height = 30
        Caption = 'Utilitaire de'#13#10'   sauvegarde'
        FocusControl = DBEdit7
      end
      object DBMemo1Adresse: TDBMemo
        Left = 81
        Top = 10
        Width = 504
        Height = 89
        DataField = 'ADRESSE'
        DataSource = DSCtrstock
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 81
        Top = 106
        Width = 104
        Height = 23
        DataField = 'RC'
        DataSource = DSCtrstock
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 81
        Top = 135
        Width = 104
        Height = 23
        DataField = 'NOTAHITI'
        DataSource = DSCtrstock
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 81
        Top = 164
        Width = 154
        Height = 23
        DataField = 'TEL'
        DataSource = DSCtrstock
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 81
        Top = 193
        Width = 154
        Height = 23
        DataField = 'FAX'
        DataSource = DSCtrstock
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 81
        Top = 222
        Width = 504
        Height = 23
        DataField = 'EMAIL'
        DataSource = DSCtrstock
        TabOrder = 5
      end
      object DBMemo1: TDBMemo
        Left = 81
        Top = 252
        Width = 504
        Height = 81
        DataField = 'BANQUE'
        DataSource = DSCtrstock
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 81
        Top = 341
        Width = 304
        Height = 23
        DataField = 'LIEU'
        DataSource = DSCtrstock
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 81
        Top = 377
        Width = 504
        Height = 23
        DataField = 'PROG_EXT'
        DataSource = DSCtrstock
        TabOrder = 8
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Param. Facturation/Achats/Stock'
      ImageIndex = 2
      DesignSize = (
        733
        467)
      object Label19: TLabel
        Left = 8
        Top = 281
        Width = 106
        Height = 15
        Caption = 'Texte bas de Facture'
        FocusControl = DBMemo2
      end
      object Label20: TLabel
        Left = 8
        Top = 379
        Width = 156
        Height = 15
        Caption = 'Texte bas de Devis / Proforma'
        FocusControl = DBMemo3
      end
      object DBCheckBoxTVAHT: TDBCheckBox
        Left = 8
        Top = 8
        Width = 137
        Height = 17
        Caption = 'Calcul TVA sur HT.'
        DataField = 'FLAG_TAX'
        DataSource = DSCtrstock
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBoxPMPGlobal: TDBCheckBox
        Left = 8
        Top = 31
        Width = 137
        Height = 17
        Caption = 'PMP global'
        DataField = 'PMP_GLO'
        DataSource = DSCtrstock
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object RzDBRadioGroupAlertStock: TRzDBRadioGroup
        Left = 476
        Top = 3
        Width = 153
        Height = 81
        DataField = 'ALERT_STO'
        DataSource = DSCtrstock
        Items.Strings = (
          'Rejet'
          'Choix utilisateur'
          'Accepte')
        Values.Strings = (
          'R'
          'D'
          'A')
        Caption = 'Si d'#233'passement de stock'
        Color = 15658734
        TabOrder = 2
      end
      object RzDBRadioGroupNqture: TRzDBRadioGroup
        Left = 317
        Top = 3
        Width = 153
        Height = 62
        DataField = 'NATURE'
        DataSource = DSCtrstock
        Items.Strings = (
          'D'#233'taillant'
          'Grossiste')
        Values.Strings = (
          'D'
          'G')
        Caption = 'Nature de l'#39'activit'#233
        Color = 15658734
        TabOrder = 3
      end
      object DBCheckBoxBCF: TDBCheckBox
        Left = 8
        Top = 54
        Width = 209
        Height = 17
        Caption = 'Blocage client d'#233'passement cr'#233'dit'
        DataField = 'BLOQ_CLI_FAC'
        DataSource = DSCtrstock
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object RzDBRadioGroup1: TRzDBRadioGroup
        Left = 0
        Top = 91
        Width = 153
        Height = 102
        DataField = 'INTER_CPTA'
        DataSource = DSCtrstock
        Items.Strings = (
          'Pas d'#39'interface'
          'Saari ligne 100'
          'Revatel 116'
          'Excel')
        Values.Strings = (
          '0'
          '1'
          '4'
          '8')
        Caption = 'Interface comptable'
        Color = 15658734
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 159
        Top = 91
        Width = 470
        Height = 198
        Caption = 'Affectations comptables'
        TabOrder = 6
        object Label11: TLabel
          Left = 13
          Top = 24
          Width = 96
          Height = 15
          Caption = 'Journal des Ventes'
          FocusControl = DBEdit8
        end
        object Label12: TLabel
          Left = 13
          Top = 53
          Width = 98
          Height = 15
          Caption = 'Journal des Achats'
          FocusControl = DBEdit9
        end
        object Label13: TLabel
          Left = 188
          Top = 24
          Width = 123
          Height = 15
          Caption = 'Cpte centra fournisseur'
          FocusControl = DBEdit10
        end
        object Label14: TLabel
          Left = 188
          Top = 53
          Width = 101
          Height = 15
          Caption = 'Cpte TVA d'#233'caiss'#233'e'
          FocusControl = DBEdit11
        end
        object Label15: TLabel
          Left = 188
          Top = 82
          Width = 106
          Height = 15
          Caption = 'Cpte produits divers'
          FocusControl = DBEdit12
        end
        object Label17: TLabel
          Left = 188
          Top = 111
          Width = 121
          Height = 15
          Caption = 'Compte charges divers'
          FocusControl = DBEdit14
        end
        object Label18: TLabel
          Left = 188
          Top = 169
          Width = 105
          Height = 15
          Caption = 'Cpte remise globale'
          FocusControl = DBEdit15
        end
        object Label16: TLabel
          Left = 188
          Top = 140
          Width = 103
          Height = 15
          Caption = 'Compte Tax Sociale'
          FocusControl = DBEdit13
        end
        object DBEdit9: TDBEdit
          Left = 117
          Top = 50
          Width = 34
          Height = 23
          DataField = 'JAL_ACH'
          DataSource = DSCtrstock
          TabOrder = 0
        end
        object DBEdit15: TDBEdit
          Left = 326
          Top = 166
          Width = 134
          Height = 23
          DataField = 'CPTREMIS'
          DataSource = DSCtrstock
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 117
          Top = 21
          Width = 34
          Height = 23
          DataField = 'JAL_VTE'
          DataSource = DSCtrstock
          TabOrder = 2
        end
        object DBEdit14: TDBEdit
          Left = 326
          Top = 108
          Width = 134
          Height = 23
          DataField = 'CPT_CHAR_ARR'
          DataSource = DSCtrstock
          TabOrder = 3
        end
        object DBEdit13: TDBEdit
          Left = 326
          Top = 137
          Width = 134
          Height = 23
          DataField = 'CPT_CPS_DEC'
          DataSource = DSCtrstock
          TabOrder = 4
        end
        object DBEdit12: TDBEdit
          Left = 326
          Top = 79
          Width = 134
          Height = 23
          DataField = 'CPT_PROD_ARR'
          DataSource = DSCtrstock
          TabOrder = 5
        end
        object DBEdit11: TDBEdit
          Left = 326
          Top = 50
          Width = 134
          Height = 23
          DataField = 'CPT_TVA_DEC'
          DataSource = DSCtrstock
          TabOrder = 6
        end
        object DBEdit10: TDBEdit
          Left = 326
          Top = 21
          Width = 134
          Height = 23
          DataField = 'CPT_CENT_FOU'
          DataSource = DSCtrstock
          TabOrder = 7
        end
      end
      object DBMemo2: TDBMemo
        Left = 8
        Top = 302
        Width = 611
        Height = 67
        DataField = 'MEMO_FAC'
        DataSource = DSCtrstock
        TabOrder = 7
      end
      object DBMemo3: TDBMemo
        Left = 8
        Top = 400
        Width = 611
        Height = 62
        Anchors = [akLeft, akTop, akBottom]
        DataField = 'MEMO_DEV'
        DataSource = DSCtrstock
        TabOrder = 8
      end
    end
    object TabSheetSMTP: TTabSheet
      Caption = 'Param'#232'tres SMTP'
      ImageIndex = 4
      object Label22: TLabel
        Left = 3
        Top = 14
        Width = 126
        Height = 15
        Caption = 'AdresseEmailExpediteur'
        FocusControl = DBEdit17
      end
      object Label23: TLabel
        Left = 3
        Top = 69
        Width = 130
        Height = 15
        Caption = 'AdresseEmailDestination'
        FocusControl = DBEdit18
      end
      object Label24: TLabel
        Left = 3
        Top = 136
        Width = 69
        Height = 15
        Caption = 'ServeurSMTP'
        FocusControl = DBEdit19
      end
      object Label25: TLabel
        Left = 3
        Top = 192
        Width = 60
        Height = 15
        Caption = 'LoginSMTP'
        FocusControl = DBEdit20
      end
      object Label26: TLabel
        Left = 3
        Top = 248
        Width = 81
        Height = 15
        Caption = 'MotPasseSMTP'
        FocusControl = DBEditPass
      end
      object Label27: TLabel
        Left = 3
        Top = 304
        Width = 52
        Height = 15
        Caption = 'PortSMTP'
        FocusControl = DBEdit22
      end
      object DBEdit17: TDBEdit
        Left = 3
        Top = 35
        Width = 500
        Height = 23
        DataField = 'AdresseEmailExpediteur'
        DataSource = DSgpu_parame
        TabOrder = 0
      end
      object DBEdit18: TDBEdit
        Left = 3
        Top = 90
        Width = 500
        Height = 23
        DataField = 'AdresseEmailDestination'
        DataSource = DSgpu_parame
        TabOrder = 1
      end
      object DBEdit19: TDBEdit
        Left = 3
        Top = 152
        Width = 500
        Height = 23
        DataField = 'ServeurSMTP'
        DataSource = DSgpu_parame
        TabOrder = 2
      end
      object DBEdit20: TDBEdit
        Left = 3
        Top = 208
        Width = 500
        Height = 23
        DataField = 'LoginSMTP'
        DataSource = DSgpu_parame
        TabOrder = 3
      end
      object DBEditPass: TDBEdit
        Left = 3
        Top = 264
        Width = 125
        Height = 23
        DataField = 'MotPasseSMTP'
        DataSource = DSgpu_parame
        PasswordChar = '*'
        TabOrder = 4
      end
      object DBEdit22: TDBEdit
        Left = 3
        Top = 320
        Width = 104
        Height = 23
        DataField = 'PortSMTP'
        DataSource = DSgpu_parame
        TabOrder = 5
      end
      object CheckBoxMDP: TCheckBox
        Left = 152
        Top = 267
        Width = 169
        Height = 17
        Caption = 'Afficher le mot de passe'
        TabOrder = 6
        OnMouseDown = CheckBoxMDPMouseDown
        OnMouseUp = CheckBoxMDPMouseUp
      end
      object DBCheckBox1: TDBCheckBox
        Left = 152
        Top = 323
        Width = 137
        Height = 17
        Caption = 'Connexion Securisee'
        DataField = 'ConnexionSecurisee'
        DataSource = DSgpu_parame
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 152
        Top = 346
        Width = 137
        Height = 17
        Caption = 'Activation par Email'
        DataField = 'ActivationParEmail'
        DataSource = DSgpu_parame
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 152
        Top = 369
        Width = 137
        Height = 17
        Caption = 'Saisie Securisee'
        DataField = 'SaisieSecurisee'
        DataSource = DSgpu_parame
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Chiffres d'#39'affaires'
      ImageIndex = 1
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 0
        Width = 733
        Height = 467
        Align = alClient
        Anchors = []
        DataSource = DSStatis
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AutoAppend = False
        TitleButtons = True
        AlternateRowColor = clAliceblue
        TitleArrow = True
        AutoSizeColumns = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'ANNEE'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA1'
            Title.Caption = 'JANVIER'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA2'
            Title.Caption = 'FEVRIER'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA3'
            Title.Caption = 'MARS'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA4'
            Title.Caption = 'AVRIL'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA5'
            Title.Caption = 'MAI'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA6'
            Title.Caption = 'JUIN'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA7'
            Title.Caption = 'JUILLET'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA8'
            Title.Caption = 'AOUT'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA9'
            Title.Caption = 'SEPTEMBRE'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA10'
            Title.Caption = 'OCTOBRE'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA11'
            Title.Caption = 'NOVEMBRE'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA12'
            Title.Caption = 'DECEMBRE'
            Width = 60
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Logo soci'#233't'#233
      ImageIndex = 3
      object Label21: TLabel
        Left = 24
        Top = 24
        Width = 32
        Height = 15
        Caption = 'LOGO'
        FocusControl = DBEdit16
      end
      object SpeedButton1: TSpeedButton
        Left = 632
        Top = 40
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object ImageLogo: TImage
        Left = 24
        Top = 69
        Width = 105
        Height = 105
        Proportional = True
        Stretch = True
      end
      object DBEdit16: TDBEdit
        Left = 24
        Top = 40
        Width = 604
        Height = 23
        DataField = 'LOGO'
        DataSource = DSCtrstock
        TabOrder = 0
        OnChange = DBEdit16Change
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 76
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 3
      Top = 11
      Width = 29
      Height = 15
      Caption = 'NOM'
      FocusControl = DBEditNom
    end
    object Panel1: TPanel
      Left = 639
      Top = 1
      Width = 101
      Height = 74
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
    object DBEditNom: TDBEdit
      Left = 58
      Top = 8
      Width = 459
      Height = 23
      DataField = 'NOM'
      DataSource = DSCtrstock
      TabOrder = 1
    end
    object DBEdit1Nom2: TDBEdit
      Left = 58
      Top = 37
      Width = 459
      Height = 23
      DataField = 'NOM2'
      DataSource = DSCtrstock
      TabOrder = 2
    end
  end
  object DSCtrstock: TDataSource
    DataSet = DM_Olivier.FDQueryCtrstock
    Left = 672
    Top = 136
  end
  object FDQueryStatis: TFDQuery
    MasterSource = DSCtrstock
    MasterFields = 'CODSOC'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select * from statis where type_='#39'S'#39' and code = :CODSOC order by' +
        ' annee')
    Left = 668
    Top = 266
    ParamData = <
      item
        Name = 'CODSOC'
        ParamType = ptInput
      end>
  end
  object DSStatis: TDataSource
    DataSet = FDQueryStatis
    Left = 676
    Top = 346
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Images (*.jpg;*.png;*.bmp)|*.jpg;*.jpeg;*.png;*.bmp'
    Left = 668
    Top = 190
  end
  object FDQuerygpu_parame: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from gpu_parametres limit 1')
    Left = 660
    Top = 422
    object FDQuerygpu_parameIDParametres: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDParametres'
      Origin = 'IDParametres'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQuerygpu_parameAdresseEmailExpediteur: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AdresseEmailExpediteur'
      Origin = 'AdresseEmailExpediteur'
      Size = 255
    end
    object FDQuerygpu_parameAdresseEmailDestination: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AdresseEmailDestination'
      Origin = 'AdresseEmailDestination'
      Size = 255
    end
    object FDQuerygpu_parameServeurSMTP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ServeurSMTP'
      Origin = 'ServeurSMTP'
      Size = 255
    end
    object FDQuerygpu_parameLoginSMTP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LoginSMTP'
      Origin = 'LoginSMTP'
      Size = 255
    end
    object FDQuerygpu_parameMotPasseSMTP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MotPasseSMTP'
      Origin = 'MotPasseSMTP'
      Size = 255
    end
    object FDQuerygpu_paramePortSMTP: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'PortSMTP'
      Origin = 'PortSMTP'
    end
    object FDQuerygpu_parameConnexionSecurisee: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'ConnexionSecurisee'
      Origin = 'ConnexionSecurisee'
    end
    object FDQuerygpu_parameActivationParEmail: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'ActivationParEmail'
      Origin = 'ActivationParEmail'
    end
    object FDQuerygpu_parameSaisieSecurisee: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'SaisieSecurisee'
      Origin = 'SaisieSecurisee'
    end
  end
  object DSgpu_parame: TDataSource
    DataSet = FDQuerygpu_parame
    Left = 652
    Top = 486
  end
end
