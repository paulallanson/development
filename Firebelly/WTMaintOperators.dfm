object frmWTMaintOperators: TfrmWTMaintOperators
  Left = 366
  Top = 147
  BorderStyle = bsDialog
  Caption = 'Operator details'
  ClientHeight = 496
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    364
    496)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 15
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 57
    Height = 13
    Caption = 'Login Name'
  end
  object Label3: TLabel
    Left = 8
    Top = 169
    Width = 31
    Height = 13
    Caption = 'Mobile'
  end
  object Label5: TLabel
    Left = 8
    Top = 108
    Width = 40
    Height = 13
    Caption = 'Job Title'
  end
  object Label6: TLabel
    Left = 8
    Top = 140
    Width = 51
    Height = 13
    Caption = 'Telephone'
  end
  object Label7: TLabel
    Left = 8
    Top = 198
    Width = 25
    Height = 13
    Caption = 'Email'
  end
  object Label8: TLabel
    Left = 8
    Top = 77
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label9: TLabel
    Left = 8
    Top = 230
    Width = 47
    Height = 26
    Caption = 'Revenue Centre'
    WordWrap = True
  end
  object SpeedButton6: TSpeedButton
    Left = 298
    Top = 230
    Width = 25
    Height = 25
    Hint = 'Clear Default Upstand Size'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton6Click
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 461
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 11
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 461
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 12
  end
  object chkbxEnabled: TCheckBox
    Left = 8
    Top = 465
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Login Enabled'
    TabOrder = 10
  end
  object grpbxReminders: TGroupBox
    Left = 8
    Top = 280
    Width = 337
    Height = 81
    Caption = 'Follow Up Reminders '
    ParentBackground = False
    TabOrder = 7
    object Label4: TLabel
      Left = 16
      Top = 36
      Width = 34
      Height = 13
      Caption = 'Quotes'
    end
    object cmbQuoteFollowUp: TComboBox
      Left = 64
      Top = 32
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'None'
      Items.Strings = (
        'None'
        'Low'
        'Medium'
        'High')
    end
  end
  object chkbxEndUser: TCheckBox
    Left = 8
    Top = 435
    Width = 257
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'This is an end user operator'
    TabOrder = 9
  end
  object grpbxScheduling: TGroupBox
    Left = 8
    Top = 368
    Width = 337
    Height = 57
    Caption = 'Scheduling'
    ParentBackground = False
    TabOrder = 8
    object chkbxCanUpdateSchedule: TCheckBox
      Left = 16
      Top = 24
      Width = 225
      Height = 17
      Caption = 'Can update schedule'
      TabOrder = 0
    end
  end
  object edtOperatorName: TEdit
    Left = 88
    Top = 11
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtOperatorName'
    OnChange = EnableOK
  end
  object edtTelephoneNumber: TEdit
    Left = 88
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'edtTelephoneNumber'
  end
  object edtMobileNumber: TEdit
    Left = 88
    Top = 165
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'edtMobileNumber'
  end
  object edtEmailAddress: TEdit
    Left = 88
    Top = 194
    Width = 265
    Height = 21
    TabOrder = 6
    Text = 'edtEmailAddress'
  end
  object edtLoginPassword: TEdit
    Left = 88
    Top = 73
    Width = 201
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = 'edtLoginPassword'
  end
  object edtJobTitle: TEdit
    Left = 88
    Top = 104
    Width = 201
    Height = 21
    TabOrder = 3
    Text = 'edtJobTitle'
  end
  object edtLoginName: TEdit
    Left = 88
    Top = 40
    Width = 201
    Height = 21
    TabOrder = 1
    Text = 'edtLoginName'
    OnChange = EnableOK
  end
  object dblkpRevenueCentre: TDBLookupComboBox
    Left = 88
    Top = 232
    Width = 201
    Height = 21
    KeyField = 'REvenue_Centre'
    ListField = 'Revenue_Centre_Descr'
    ListSource = dtsRevCentre
    TabOrder = 13
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Operator'
      'SET'
      '  Operator_Name = :Operator_Name,'
      '  Login_Name = :Login_Name,'
      '  Login_Password = :Login_Password,'
      '  Job_Title = :Job_Title,'
      '  Telephone_Number = :Telephone_Number,'
      '  Mobile_Number = :Mobile_Number,'
      '  Email_Address = :Email_Address,'
      '  End_User = :End_User,'
      '  Can_Update_Schedule = :Can_Update_Schedule,'
      '  Operator_Can_Login = :Operator_Can_Login,'
      '  Quote_Follow_Up_Reminder = :Quote_Follow_Up_Reminder,'
      '  Revenue_Centre = :Revenue_Centre'
      'WHERE'
      '  Operator = :Operator')
    Left = 96
    Top = 40
    ParamData = <
      item
        Name = 'Operator_Name'
      end
      item
        Name = 'Login_Name'
      end
      item
        Name = 'Login_Password'
      end
      item
        Name = 'Job_Title'
      end
      item
        Name = 'Telephone_Number'
      end
      item
        Name = 'Mobile_Number'
      end
      item
        Name = 'Email_Address'
      end
      item
        Name = 'End_User'
      end
      item
        Name = 'Can_Update_Schedule'
      end
      item
        Name = 'Operator_Can_Login'
      end
      item
        Name = 'Quote_Follow_Up_Reminder'
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Operator'
      '        (Operator,'
      '        Operator_Name,'
      '        Job_Title,'
      '        Operator_Can_Login)'
      'Select Max(Operator)+1, '#39'NAME'#39', :GUID, '#39'Y'#39
      'From Operator'
      ' ')
    Left = 152
    Top = 40
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Operator'
      'From Operator'
      'Where Job_Title = :GUID')
    Left = 248
    Top = 40
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Category'
      'Set     Description = :Description,'
      '        Commission_rate = :Commission_Rate,'
      '        lnvoice_immediately = :Invoice_Immediately,'
      '        Cleared_Funds_Required = :Cleared_Funds_Required,'
      '        Use_Separate_Invoice_Seq = :Use_Separate_Invoice_Seq,'
      '        Inv_Narrative = :Inv_Narrative'
      'Where'
      '(Category = :Category) '
      '')
    Left = 312
    Top = 40
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Invoice_Immediately'
      end
      item
        Name = 'Cleared_Funds_Required'
      end
      item
        Name = 'Use_Separate_Invoice_Seq'
      end
      item
        Name = 'Inv_Narrative'
      end
      item
        Name = 'Category'
      end>
  end
  object qryRevCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'ORDER BY Revenue_Centre_Descr')
    Left = 264
    Top = 144
  end
  object dtsRevCentre: TDataSource
    DataSet = qryRevCentre
    Left = 320
    Top = 144
  end
end
