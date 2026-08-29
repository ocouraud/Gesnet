object DMGesCloud: TDMGesCloud
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object ConnexionGesCloud: TFDConnection
    Params.Strings = (
      'Database=boulafaa'
      'User_Name=delphi'
      'Password=delphi'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 392
    Top = 367
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\DelphiProj\Gescloud\Win32\Debug\libmysql.dll'
    Left = 240
    Top = 313
  end
  object ReqClients: TFDQuery
    BeforePost = ReqClientsBeforePost
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM client')
    Left = 40
    Top = 344
  end
  object ReqRepres: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from repres')
    Left = 128
    Top = 304
  end
  object ReqGeo: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from geo')
    Left = 352
    Top = 252
  end
  object ReqVerification: TFDQuery
    Connection = ConnexionGesCloud
    Left = 328
    Top = 164
  end
  object ReqPaiement: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from paiement')
    Left = 436
    Top = 264
  end
  object ReqTarif: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from tarif')
    Left = 144
    Top = 208
  end
  object ReqTarifcli: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from tarifcli')
    Left = 228
    Top = 136
  end
  object ReqArticlesOuverts: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from article where ferme=0')
    Left = 228
    Top = 256
  end
  object ReqSaisieTarif: TFDQuery
    BeforePost = ReqSaisieTarifBeforePost
    Connection = ConnexionGesCloud
    UpdateOptions.KeyFields = 'CODCLI;CODART'
    SQL.Strings = (
      'SELECT * FROM tarifcli WHERE 1=0')
    Left = 316
    Top = 96
  end
  object FDQueryPrintEntvteaa: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM entvteaa WHERE CODFAC = :CODFAC')
    Left = 428
    Top = 94
    ParamData = <
      item
        Name = 'CODFAC'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object FDQueryLigvteaa: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM ligvteaa WHERE CODFAC = :CODFAC ORDER BY Noenrf')
    Left = 560
    Top = 94
    ParamData = <
      item
        Name = 'CODFAC'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object FDQueryReglaa: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM reglaa WHERE CODFAC = :CODFAC')
    Left = 564
    Top = 166
    ParamData = <
      item
        Name = 'CODFAC'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object FDQueryCtrstock: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from ctrstock where codsoc='#39'A'#39)
    Left = 560
    Top = 260
  end
  object FDQueryParameTVA: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from parame where type_='#39'V'#39)
    Left = 552
    Top = 352
  end
  object FDQueryRepres: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'select * from repres WHERE CODREP = :CODREP')
    Left = 56
    Top = 200
    ParamData = <
      item
        Name = 'CODREP'
        ParamType = ptInput
      end>
  end
  object FDQueryFamilles: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM famille;')
    Left = 448
    Top = 161
  end
  object uilLoginDlg1: TuilLoginDlg
    SecurityManager = uilSecurityManager1
    TitleCaption = 'Login'
    UsernameCaption = '&Username'
    PasswordCaption = '&Password'
    LoginButtonCaption = 'Login'
    CancelButtonCaption = 'Cancel'
    ButtonColor = 12091981
    ButtonColorDown = 9003321
    ButtonColorHover = 14528642
    ButtonColorDisabled = clSilver
    ButtonTextColor = clWhite
    ButtonTextColorDown = clWhite
    ButtonTextColorHover = clWhite
    ButtonTextColorDisabled = clMedGray
    Left = 432
    Top = 40
  end
  object uilSecurityDlg1: TuilSecurityDlg
    FormCaption = 'Users and Permissions Management'
    UsersCaption = 'Users'
    GroupsCaption = 'Groups'
    CloseBtnCaption = 'Close'
    MembershipCaption = 'Membership'
    AddUserBtnCaption = 'Add User...'
    EditUserBtnCaption = 'Edit User...'
    AddGroupBtnCaption = 'Add Group...'
    EditGroupBtnCaption = 'Edit Group...'
    RemoveUserBtnCaption = 'Delete User'
    RemoveGroupBtnCaption = 'Delete Group'
    RemoveMembershipBtnCaption = 'Remove'
    AddUserBtnHint = 'Add a user to the system.'
    EditUserBtnHint = 'Change the configuration of the selected user.'
    AddGroupBtnHint = 'Add a group to the system.'
    EditGroupBtnHint = 'Change the name and description of the selected group.'
    SecurityManager = uilSecurityManager1
    RegistryKey = 'Software\tmssoftware\Security System'
    SaveToRegistry = False
    EditUserTitleCaption = 'Edit User'
    AddUserTitleCaption = 'Add User'
    PasswordCaption = '&Password'
    VerifyPasswordCaption = '&Verify Password'
    FullNameCaption = '&Full Name'
    UsernameCaption = '&Username'
    AccessCountCaption = 'Access count:'
    CreatedDateCaption = 'Created Date: '
    LastAccesCaption = 'Last Access:'
    EnabledCaption = 'Enabled'
    EditGroupTitleCaption = 'Edit Group'
    AddGroupTitleCaption = 'Add Group'
    GroupDescriptionCaption = 'Group &Description'
    GroupNameCaption = 'Group &Name'
    OKButtonCaption = 'OK'
    CancelButtonCaption = 'Cancel'
    DeleteUserHint = 'Remove selected user.'
    DeleteGroupHint = 'Remove selected group.'
    RemovePermissionsBtnHint = 'Remove selected user from group.'
    AddUserPopUpCaption = 'Add User...'
    EditUserPopUpCaption = 'Edit User...'
    DeleteUserPopUpCaption = 'Delete'
    AddGroupPopUpCaption = 'Add Group...'
    EditGroupPopUpCaption = 'Edit Group'
    DeleteGroupPopUpCaption = 'Delete'
    CopyPermissionsPopUpCaption = '&Copy Permissions'
    PastePermissionsPopUpCaption = '&Paste Permissions'
    UsersPageUsersTreeViewCaption = '&Users:'
    UsersPagePermissionsTreeViewCaption = '&Permissions:'
    GroupsPageGroupsTreeViewCaption = '&Groups:'
    GroupsPagePermissionsTreeViewCaption = 'P&ermissions:'
    MembershipPageGroupsTreeViewCaption = 'G&roups:'
    MembershipPageUsersTreeViewCaption = 'U&sers:'
    PasswordsNotMatchMessage = 'Passwords do not match'
    ConfirmDeleteMessage = 'Are you sure you want to delete'
    FromMessage = 'from'
    ButtonColor = 12091981
    ButtonColorDown = 9003321
    ButtonColorHover = 14528642
    ButtonColorDisabled = clSilver
    ButtonTextColor = clWhite
    ButtonTextColorDown = clWhite
    ButtonTextColorHover = clWhite
    ButtonTextColorDisabled = clMedGray
    Left = 480
  end
  object uilChangePasswordDlg1: TuilChangePasswordDlg
    SecurityManager = uilSecurityManager1
    TitleCaption = 'Change Password'
    CurrentPasswordCaption = '&Current Password'
    NewPasswordCaption = '&New Password'
    ConfirmPasswordCaption = 'C&onfirm Password'
    OKButtonCaption = 'OK'
    CancelButtonCaption = 'Cancel'
    ButtonColor = 12091981
    ButtonColorDown = 9003321
    ButtonColorHover = 14528642
    ButtonColorDisabled = clSilver
    ButtonTextColor = clWhite
    ButtonTextColorDown = clWhite
    ButtonTextColorHover = clWhite
    ButtonTextColorDisabled = clMedGray
    Left = 560
    Top = 16
  end
  object uilSecurityManager1: TuilSecurityManager
    UserBindary.DataSource = dsUsers
    UserBindary.UserNameField = 'UserName'
    UserBindary.FullNameField = 'FullName'
    UserBindary.PasswordField = 'Password'
    UserBindary.AccessCountField = 'ACCESSCOUNT'
    UserBindary.CreatedDateField = 'CreatedDate'
    UserBindary.CreatedTimeField = 'CreatedTime'
    UserBindary.EnabledField = 'Enabled'
    UserBindary.LastAccessField = 'LastAccess'
    UserBindary.LastAccessTimeField = 'LastAccTime'
    UserBindary.UserPermissions.DataSource = dsPermissions
    UserBindary.UserPermissions.PermissionField = 'PERMISSION_NAME'
    UserBindary.UserPermissions.UserNameField = 'USER_ID'
    GroupBindary.DataSource = dsGroups
    GroupBindary.GroupNameField = 'GROUP_NAME'
    GroupBindary.GroupDescriptionField = 'DESCRIPTION'
    GroupBindary.GroupPermissions.DataSource = dsPermissions
    GroupBindary.GroupPermissions.PermissionField = 'PERMISSION_NAME'
    GroupBindary.GroupPermissions.GroupNameField = 'GROUP_ID'
    GroupBindary.GroupMembershipBindary.DataSource = dsUserGroups
    GroupBindary.GroupMembershipBindary.GroupNameField = 'GROUP_ID'
    GroupBindary.GroupMembershipBindary.UserNameField = 'USER_ID'
    PermissionBindary.DataSource = dsPermissions
    PermissionBindary.PermissionField = 'PERMISSION_NAME'
    PermissionBindary.ActionField = 'ACTION'
    PermissionBindary.ItemField = 'ITEM_NAME'
    PermissionBindary.FormNameField = 'FORM_NAME'
    PermissionBindary.Storage = psForm
    Version = '4.2.2.0'
    Left = 360
    Top = 16
  end
  object QrySecUsers: TFDQuery
    OnNewRecord = QrySecUsersNewRecord
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM sec_users')
    Left = 24
    Top = 16
  end
  object dsUsers: TDataSource
    DataSet = QrySecUsers
    Left = 80
    Top = 16
  end
  object dsPermissions: TDataSource
    DataSet = QrySecPermissions
    Left = 232
    Top = 80
  end
  object dsGroups: TDataSource
    DataSet = QrySecGroups
    Left = 88
    Top = 72
  end
  object dsUserGroups: TDataSource
    DataSet = QrySecUserGroups
    Left = 224
    Top = 16
  end
  object QrySecGroups: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM sec_groups')
    Left = 24
    Top = 72
  end
  object QrySecPermissions: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM sec_permissions')
    Left = 168
    Top = 80
  end
  object QrySecUserGroups: TFDQuery
    Connection = ConnexionGesCloud
    SQL.Strings = (
      'SELECT * FROM sec_user_groups')
    Left = 168
    Top = 16
  end
  object QryUserRights: TFDQuery
    Connection = ConnexionGesCloud
    Left = 208
    Top = 368
  end
end
