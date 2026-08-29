object FormLearning: TFormLearning
  Left = 0
  Top = 0
  Caption = 'Learning'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object BtnLister: TBitBtn
    Left = 212
    Top = 8
    Width = 173
    Height = 27
    Margins.Left = 6
    Margins.Right = 6
    Caption = '&Lister clients geo Faka'
    TabOrder = 0
    OnClick = BtnListerClick
  end
  object DSClients: TDataSource
    DataSet = DMGesCloud.ReqClients
    Left = 24
    Top = 368
  end
end
