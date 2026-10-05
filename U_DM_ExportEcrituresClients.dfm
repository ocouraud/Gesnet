object DM_ExportEcrituresClients: TDM_ExportEcrituresClients
  Height = 480
  Width = 640
  object FDQueryImp_cpta: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from imp_cpta')
    Left = 104
    Top = 224
  end
  object FDQueryEcr_cpt: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'select * from ecr_cpt')
    Left = 264
    Top = 232
  end
end
