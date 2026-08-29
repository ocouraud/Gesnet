object FormSelCodInfoCompl: TFormSelCodInfoCompl
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selection des informations complementaires'
  ClientHeight = 369
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  DesignSize = (
    560
    369)
  TextHeight = 15
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 560
    Height = 330
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSCodinfocompl
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = JvDBGrid1DblClick
    TitleButtons = True
    AlternateRowColor = clAliceblue
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
        FieldName = 'id'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Groupe'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codinfo'
        Title.Caption = 'Code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'libelle'
        Title.Caption = 'Libelle'
        Width = 221
        Visible = True
      end>
  end
  object BtnValider: TBitBtn
    Left = 396
    Top = 336
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Valider'
    ModalResult = 1
    TabOrder = 1
    OnClick = BtnValiderClick
  end
  object BtnAnnuler: TBitBtn
    Left = 477
    Top = 336
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Annuler'
    ModalResult = 2
    TabOrder = 2
  end
  object FDQueryCodinfocompl: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      
        'SELECT p.id, p.libelle as Groupe, i.codinfo, i.libelle FROM codi' +
        'nfocompl i INNER JOIN parinfocompl p ON p.id = i.id AND p.type_ ' +
        '= i.type_  ORDER BY p.libelle, i.libelle')
    Left = 64
    Top = 280
  end
  object DSCodinfocompl: TDataSource
    DataSet = FDQueryCodinfocompl
    Left = 184
    Top = 280
  end
end
