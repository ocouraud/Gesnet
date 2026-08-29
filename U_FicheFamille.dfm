object FormFicheFamille: TFormFicheFamille
  Left = 0
  Top = 0
  Caption = 'Fiche Famille'
  ClientHeight = 278
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 584
    Height = 229
    ActivePage = Remise
    Align = alClient
    TabOrder = 0
    object Général: TTabSheet
      Caption = 'G'#233'n'#233'ral'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 34
        Height = 15
        Caption = 'Code :'
        FocusControl = DBcodfam
      end
      object Label2: TLabel
        Left = 16
        Top = 59
        Width = 40
        Height = 15
        Caption = 'Libell'#233' :'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 101
        Width = 81
        Height = 15
        Caption = 'Compte vente :'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 143
        Width = 90
        Height = 15
        Caption = 'Compte Remise :'
        FocusControl = DBEdit4
      end
      object DBcodfam: TDBEdit
        Left = 118
        Top = 13
        Width = 94
        Height = 23
        DataField = 'CODFAM'
        DataSource = DSFamilles
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 118
        Top = 55
        Width = 454
        Height = 23
        DataField = 'LIBELLE'
        DataSource = DSFamilles
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 118
        Top = 97
        Width = 199
        Height = 23
        DataField = 'CPTVTE'
        DataSource = DSFamilles
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 118
        Top = 140
        Width = 199
        Height = 23
        DataField = 'CPTREM'
        DataSource = DSFamilles
        TabOrder = 3
      end
    end
    object Remise: TTabSheet
      Caption = 'Remise'
      ImageIndex = 1
      object JvDBGrid2: TJvDBGrid
        Left = 0
        Top = 0
        Width = 392
        Height = 199
        Align = alClient
        DataSource = DSFamrem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAliceblue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMFAR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRC_REM'
            Title.Caption = '% Remise'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'DAT_DEB'
            Title.Alignment = taCenter
            Title.Caption = 'Du'
            Width = 83
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'DAT_FIN'
            Title.Alignment = taCenter
            Title.Caption = 'Au'
            Width = 79
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 392
        Top = 0
        Width = 184
        Height = 199
        Align = alRight
        TabOrder = 1
        object AjouterRemise: TBitBtn
          Left = 32
          Top = 24
          Width = 130
          Height = 35
          Caption = '&Ajouter'
          TabOrder = 0
          OnClick = AjouterRemiseClick
        end
        object ModifierRemise: TBitBtn
          Left = 32
          Top = 83
          Width = 130
          Height = 35
          Caption = '&Modifier'
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Chiffres D'#39'affaires'
      ImageIndex = 2
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 0
        Width = 576
        Height = 199
        Align = alClient
        DataSource = DSStatis
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        AlternateRowColor = clAliceblue
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
            Title.Caption = 'Ann'#233'e'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA1'
            Title.Caption = 'Janvier'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA2'
            Title.Caption = 'F'#233'vrier'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA3'
            Title.Caption = 'Mars'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA4'
            Title.Caption = 'Avril'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA5'
            Title.Caption = 'Mai'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA6'
            Title.Caption = 'Juin'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA7'
            Title.Caption = 'Juillet'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA8'
            Title.Caption = 'Ao'#251't'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA9'
            Title.Caption = 'Septembre'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA10'
            Title.Caption = 'Octobre'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA11'
            Title.Caption = 'November'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CA12'
            Title.Caption = 'D'#233'cembre'
            Width = 65
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 229
    Width = 584
    Height = 49
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 301
      Top = 6
      Width = 129
      Height = 34
      Caption = '&Valider'
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BtnAnnuler: TBitBtn
      Left = 447
      Top = 6
      Width = 129
      Height = 34
      Cancel = True
      Caption = '&Annuler'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DSFamilles: TDataSource
    DataSet = DMGesCloud.FDQueryFamilles
    Left = 496
    Top = 296
  end
  object FDQueryTest: TFDQuery
    MasterSource = DSFamilles
    MasterFields = 'CODFAM'
    SQL.Strings = (
      'SELECT * FROM Famille WHERE CODFAM = :CODFAM;')
    Left = 568
    Top = 320
    ParamData = <
      item
        Name = 'CODFAM'
        DataType = ftString
        ParamType = ptInput
        Size = 6
        Value = Null
      end>
  end
  object FDQueryStatis: TFDQuery
    MasterFields = 'CODCLI'
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'select * from statis where type_='#39'F'#39' and code = :CODFAM order by' +
        ' annee')
    Left = 244
    Top = 194
    ParamData = <
      item
        Name = 'CODFAM'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    object FDQueryStatisTYPE_: TStringField
      FieldName = 'TYPE_'
      Origin = 'TYPE_'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object FDQueryStatisCODE: TStringField
      FieldName = 'CODE'
      Origin = 'CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object FDQueryStatisANNEE: TIntegerField
      FieldName = 'ANNEE'
      Origin = 'ANNEE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryStatisCA1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA1'
      Origin = 'CA1'
    end
    object FDQueryStatisCA2: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA2'
      Origin = 'CA2'
    end
    object FDQueryStatisCA3: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA3'
      Origin = 'CA3'
    end
    object FDQueryStatisCA4: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA4'
      Origin = 'CA4'
    end
    object FDQueryStatisCA5: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA5'
      Origin = 'CA5'
    end
    object FDQueryStatisCA6: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA6'
      Origin = 'CA6'
    end
    object FDQueryStatisCA7: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA7'
      Origin = 'CA7'
    end
    object FDQueryStatisCA8: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA8'
      Origin = 'CA8'
    end
    object FDQueryStatisCA9: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA9'
      Origin = 'CA9'
    end
    object FDQueryStatisCA10: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA10'
      Origin = 'CA10'
    end
    object FDQueryStatisCA11: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA11'
      Origin = 'CA11'
    end
    object FDQueryStatisCA12: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CA12'
      Origin = 'CA12'
    end
    object FDQueryStatisDER_MODIF: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DER_MODIF'
      Origin = 'DER_MODIF'
    end
  end
  object DSStatis: TDataSource
    DataSet = FDQueryStatis
    Left = 252
    Top = 138
  end
  object FDQueryFamrem: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'Select * From Famrem where codfam = :codfam;')
    Left = 468
    Top = 178
    ParamData = <
      item
        Name = 'CODFAM'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    object FDQueryFamremNUMFAR: TIntegerField
      DisplayLabel = 'Num'#233'ro'
      FieldName = 'NUMFAR'
      Origin = 'NUMFAR'
      Required = True
    end
    object FDQueryFamremCODFAM: TStringField
      FieldName = 'CODFAM'
      Origin = 'CODFAM'
      Size = 6
    end
    object FDQueryFamremPRC_REM: TBCDField
      FieldName = 'PRC_REM'
      Origin = 'PRC_REM'
      Precision = 5
      Size = 2
    end
    object FDQueryFamremDAT_DEB: TDateField
      FieldName = 'DAT_DEB'
      Origin = 'DAT_DEB'
    end
    object FDQueryFamremDAT_FIN: TDateField
      FieldName = 'DAT_FIN'
      Origin = 'DAT_FIN'
    end
  end
  object DSFamrem: TDataSource
    DataSet = FDQueryFamrem
    Left = 468
    Top = 138
  end
end
