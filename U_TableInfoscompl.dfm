object FrameTableInfoscompl: TFrameTableInfoscompl
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object TreeViewIC: TTreeView
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Indent = 19
    PopupMenu = PopupMenuTree
    TabOrder = 0
    OnDblClick = TreeViewICDblClick
    OnMouseDown = TreeViewICMouseDown
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 537
    ExplicitHeight = 369
  end
  object FDQueryTree: TFDQuery
    Connection = DMGesCloud.ConnexionGesCloud
    Left = 264
    Top = 400
  end
  object PopupMenuTree: TPopupMenu
    Left = 368
    Top = 352
    object pmNouveau: TMenuItem
      Caption = 'Nouveau'
      OnClick = pmNouveauClick
    end
    object pmModifier: TMenuItem
      Caption = 'Modifier'
      OnClick = pmModifierClick
    end
    object pmSupprimer: TMenuItem
      Caption = 'Supprimer'
      OnClick = pmSupprimerClick
    end
  end
end
