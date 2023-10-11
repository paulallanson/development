object PBMaintContactOnlineFrm: TPBMaintContactOnlineFrm
  Left = 344
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Maintain Online User Details'
  ClientHeight = 241
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object btnOK: TBitBtn
    Left = 206
    Top = 208
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 302
    Top = 208
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 273
    Height = 177
    Caption = 'Stock Calloffs'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 53
      Height = 13
      Caption = 'User Name'
    end
    object Label2: TLabel
      Left = 16
      Top = 60
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label4: TLabel
      Left = 16
      Top = 92
      Width = 47
      Height = 13
      Caption = 'User Role'
    end
    object edtUserName: TEdit
      Left = 80
      Top = 24
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = EnableOK
    end
    object edtPassword: TEdit
      Left = 80
      Top = 56
      Width = 177
      Height = 21
      TabOrder = 1
      OnChange = EnableOK
    end
    object chkbxActive: TCheckBox
      Left = 16
      Top = 145
      Width = 177
      Height = 17
      Caption = 'Enabled'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object dblkpWebRole: TDBLookupComboBox
      Left = 80
      Top = 88
      Width = 145
      Height = 21
      KeyField = 'Web_User_Role_Id'
      ListField = 'Description'
      ListSource = dtsWebRole
      TabOrder = 2
    end
    object chkbxCanEnterRetail: TCheckBox
      Left = 16
      Top = 120
      Width = 225
      Height = 17
      Caption = 'Can enter Retail Prices'
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 296
    Top = 16
    Width = 265
    Height = 177
    Caption = 'Stationery'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 28
      Width = 61
      Height = 13
      Caption = 'Consumer ID'
    end
    object edtConsumerID: TEdit
      Left = 72
      Top = 24
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = EnableOK
    end
  end
  object qryNextWebUserID: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Web_User_ID) +1 as '#39'Web_User_ID'#39' '
      'from Web_Users'
      '')
    Left = 272
    Top = 8
  end
  object qryInsWebUser: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Web_Users'
      
        '(Web_User_ID, Web_User_Role, User_Name, Password, Active_User, C' +
        'onsumer_ID, Enter_Retail_price)'
      'values'
      
        '(:Web_User_ID, :Web_User_Role, :User_Name, :Password, :Active_Us' +
        'er, :Consumer_ID, :Enter_Retail_Price)')
    Left = 360
    Top = 8
    ParamData = <
      item
        Name = 'Web_User_ID'
      end
      item
        Name = 'Web_User_Role'
      end
      item
        Name = 'User_Name'
      end
      item
        Name = 'Password'
      end
      item
        Name = 'Active_User'
      end
      item
        Name = 'Consumer_ID'
      end
      item
        Name = 'Enter_Retail_Price'
      end>
  end
  object qryGetContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Web_User_ID'
      'from Customer_Contact'
      
        'where Customer = :Customer and Branch_no = :Branch_no and Contac' +
        't_no = :Contact_no')
    Left = 456
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'set Web_User_ID = :Web_User_ID'
      
        'where Customer = :Customer and Branch_no = :Branch_no and Contac' +
        't_no = :Contact_no')
    Left = 456
    Top = 72
    ParamData = <
      item
        Name = 'Web_User_ID'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qrySelWebUserID: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Web_Users.*'
      'from Web_Users'
      'where Web_User_ID = :Web_User_ID')
    Left = 336
    Top = 56
    ParamData = <
      item
        Name = 'Web_User_ID'
      end>
  end
  object qryUpdWebUser: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Web_Users'
      'set User_name = :User_name,'
      'Password = :Password,'
      'Consumer_ID = :Consumer_ID,'
      'Active_User = :Active_User,'
      'Web_User_Role = :Web_User_Role,'
      'Enter_retail_Price = :Enter_Retail_Price'
      'where Web_User_ID = :Web_User_ID')
    Left = 408
    Top = 8
    ParamData = <
      item
        Name = 'User_name'
      end
      item
        Name = 'Password'
      end
      item
        Name = 'Consumer_ID'
      end
      item
        Name = 'Active_User'
      end
      item
        Name = 'Web_User_Role'
      end
      item
        Name = 'Enter_Retail_Price'
      end
      item
        Name = 'Web_User_ID'
      end>
  end
  object qryCheckUserName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select User_Name,'
      #9'customer_contact.name as Contact_name,'
      #9'customer.name as Customer_Name,'
      #9'customer.customer'
      'from web_users, customer_contact, customer'
      'where user_name = :user_Name and'
      #9'customer.customer <> :Customer and'
      #9'Web_Users.web_user_id = customer_contact.web_user_id and '
      #9'customer_contact.customer = customer.customer')
    Left = 328
    Top = 88
    ParamData = <
      item
        Name = 'user_Name'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryWebRole: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Web_user_Roles')
    Left = 248
    Top = 104
  end
  object dtsWebRole: TDataSource
    DataSet = qryWebRole
    Left = 296
    Top = 104
  end
end
