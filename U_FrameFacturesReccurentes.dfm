object FrameFacturesReccurentes: TFrameFacturesReccurentes
  Left = 0
  Top = 0
  Width = 1000
  Height = 549
  TabOrder = 0
  object JvDBGridLot_eva: TJvDBGrid
    Left = 0
    Top = 41
    Width = 462
    Height = 471
    Align = alLeft
    DataSource = DSLot_eva
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = JvDBGridLot_evaCellClick
    OnDrawColumnCell = JvDBGridLot_evaDrawColumnCell
    TitleButtons = True
    AlternateRowColor = clAliceblue
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'NOLOT'
        ReadOnly = True
        Title.Caption = 'No lot'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIBELLE'
        Title.Caption = 'Libell'#233
        Width = 231
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DAT_DER_GEN'
        ReadOnly = True
        Title.Caption = 'G'#233'n'#233'r'#233' le'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOCOULEUR'
        Title.Caption = 'Couleur'
        Visible = True
      end>
  end
  object JvDBGridLot_eva_det: TJvDBGrid
    Left = 462
    Top = 41
    Width = 538
    Height = 471
    Align = alClient
    DataSource = DSLot_eva_det
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    MultiSelect = True
    TitleButtons = True
    AlternateRowColor = clInfoBk
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 19
    TitleRowHeight = 19
    Columns = <
      item
        Expanded = False
        FieldName = 'IDlot_eva_det'
        Title.Caption = 'No s'#233'lection'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOLOT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODFAC'
        Title.Caption = 'No facture'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nom'
        Title.Caption = 'Nom client'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mt_ttc'
        Title.Alignment = taCenter
        Title.Caption = 'Total TTC'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFAC_DER_GEN'
        Title.Caption = 'No fact g'#233'n'#233'r'#233
        Visible = True
      end>
  end
  object TPanel1: TPanel
    Left = 0
    Top = 512
    Width = 1000
    Height = 37
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 462
      Top = 10
      Width = 249
      Height = 15
      Alignment = taCenter
      Caption = 'Ctrl+Suppr pour supprimer (multi-s'#233'lection) '#55357#56785#65039
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsUnderline]
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object Label2: TLabel
      Left = 288
      Top = 10
      Width = 145
      Height = 15
      Caption = 'Curseur bas pour ajouter '#10133
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object BtnSupprimer: TButton
      Left = 2
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Supprimer '#55357#56785#65039
      TabOrder = 0
      OnClick = BtnSupprimerClick
    end
    object BtnSelection: TButton
      Left = 736
      Top = 6
      Width = 241
      Height = 25
      Caption = 'S'#233'lection des factures '#224' associer '#55357#56514
      TabOrder = 1
      OnClick = BtnSelectionClick
    end
    object BtnGenerer: TButton
      Left = 83
      Top = 6
      Width = 182
      Height = 25
      Caption = 'G'#233'n'#233'rer les factures du lot '#9889
      TabOrder = 2
      OnClick = BtnGenererClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 41
    Align = alTop
    TabOrder = 3
    object Label3: TLabel
      Left = 0
      Top = 14
      Width = 168
      Height = 21
      Caption = 'Table des lots reccurents'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 468
      Top = 14
      Width = 191
      Height = 21
      Caption = 'Table des factures associ'#233'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object BtnFermer: TBitBtn
      Left = 910
      Top = 6
      Width = 87
      Height = 29
      Margins.Left = 6
      Margins.Right = 6
      Caption = '&Fermer '#10060
      ModalResult = 8
      TabOrder = 0
      OnClick = BtnFermerClick
    end
    object BtnAide: TBitBtn
      Left = 822
      Top = 6
      Width = 87
      Height = 29
      Caption = 'Aide '#10067
      TabOrder = 1
      OnClick = BtnAideClick
    end
  end
  object FDQueryLot_eva: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from lot_eva')
    Left = 40
    Top = 256
    object FDQueryLot_evaNOLOT: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOLOT'
      Origin = 'NOLOT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryLot_evaLIBELLE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LIBELLE'
      Origin = 'LIBELLE'
      Size = 30
    end
    object FDQueryLot_evaDAT_DER_GEN: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DAT_DER_GEN'
      Origin = 'DAT_DER_GEN'
    end
    object FDQueryLot_evaNOCOULEUR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOCOULEUR'
      Origin = 'NOCOULEUR'
    end
  end
  object DSLot_eva: TDataSource
    DataSet = FDQueryLot_eva
    Left = 56
    Top = 336
  end
  object ColorDialog1: TColorDialog
    Left = 272
    Top = 272
  end
  object FDQueryLot_eva_det: TFDQuery
    MasterSource = DSLot_eva
    MasterFields = 'NOLOT'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select l.*, e.nom, e.date_, e.mt_ttc from lot_eva_det l, entvtea' +
        'a e where l.nolot=:nolot and e.codfac=l.codfac')
    Left = 536
    Top = 288
    ParamData = <
      item
        Name = 'NOLOT'
        ParamType = ptInput
      end>
    object FDQueryLot_eva_detIDlot_eva_det: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDlot_eva_det'
      Origin = 'IDlot_eva_det'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQueryLot_eva_detNOLOT: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NOLOT'
      Origin = 'NOLOT'
    end
    object FDQueryLot_eva_detCODFAC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC'
      Origin = 'CODFAC'
    end
    object FDQueryLot_eva_detCODFAC_DER_GEN: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAC_DER_GEN'
      Origin = 'CODFAC_DER_GEN'
    end
    object FDQueryLot_eva_detnom: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom'
      Origin = 'NOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQueryLot_eva_detdate_: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'date_'
      Origin = 'DATE_'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryLot_eva_detmt_ttc: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'mt_ttc'
      Origin = 'MT_TTC'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSLot_eva_det: TDataSource
    DataSet = FDQueryLot_eva_det
    Left = 528
    Top = 376
  end
end
