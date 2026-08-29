object FrameGestionDroits: TFrameGestionDroits
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object CheckListBoxPermissions: TCheckListBox
    Left = 176
    Top = 24
    Width = 225
    Height = 305
    ItemHeight = 17
    TabOrder = 0
  end
  object BtnEnregistrer: TButton
    Left = 407
    Top = 24
    Width = 162
    Height = 44
    Caption = 'Enregistrer les attributions'#13#10'de l'#39'utilisateur'
    TabOrder = 1
    OnClick = BtnEnregistrerClick
  end
  object ComboBoxUtilisateurs: TComboBox
    Left = 16
    Top = 24
    Width = 145
    Height = 23
    TabOrder = 2
    Text = 'ComboBoxUtilisateurs'
    OnChange = ComboBoxUtilisateursChange
  end
  object PanelCatalogue: TPanel
    Left = 176
    Top = 335
    Width = 225
    Height = 73
    TabOrder = 3
    object EditNouveauCode: TEdit
      Left = 8
      Top = 8
      Width = 209
      Height = 23
      Enabled = False
      TabOrder = 0
      Text = 'Nouveau _code'
    end
    object EditDescription: TEdit
      Left = 127
      Top = 8
      Width = 242
      Height = 23
      TabOrder = 1
      Text = 'Description_permission'
      Visible = False
    end
    object BtnAjouterDroit: TButton
      Left = 78
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Ajouter'
      Enabled = False
      TabOrder = 2
      OnClick = BtnAjouterDroitClick
    end
  end
  object BtnSupprimerDroit: TButton
    Left = 407
    Top = 74
    Width = 162
    Height = 44
    Caption = 'Supprimer la '#13#10'permission selectionn'#233'e'
    Enabled = False
    TabOrder = 4
    OnClick = BtnSupprimerDroitClick
  end
  object BtnUsers: TButton
    Left = 16
    Top = 56
    Width = 145
    Height = 25
    Caption = 'Gestion des utilisateurs'
    TabOrder = 5
    OnClick = BtnUsersClick
  end
  object FDQueryUpdate: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    Left = 40
    Top = 408
  end
  object FDQueryPerms: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM sec_permissions')
    Left = 144
    Top = 408
  end
  object FDQueryUsers: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM sec_users')
    Left = 24
    Top = 352
  end
end
