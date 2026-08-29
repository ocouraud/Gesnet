object FormChoixSociete: TFormChoixSociete
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Choix de la soci'#233't'#233
  ClientHeight = 291
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDblClick = BtnValiderClick
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object StringGridSocietes: TStringGrid
    Left = 8
    Top = 8
    Width = 516
    Height = 234
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
    TabOrder = 0
    OnDblClick = BtnValiderClick
    ColWidths = (
      64
      185
      114
      145
      64)
  end
  object BtnValider: TButton
    Left = 206
    Top = 248
    Width = 139
    Height = 35
    Caption = 'Ouvrir'
    Default = True
    TabOrder = 1
    OnClick = BtnValiderClick
  end
end
