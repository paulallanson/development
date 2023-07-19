object frmwtMaintCustomerConts: TfrmwtMaintCustomerConts
  Left = 283
  Top = 85
  Caption = 'Contact details'
  ClientHeight = 376
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object lbldelete: TLabel
    Left = 128
    Top = 326
    Width = 129
    Height = 16
    Caption = 'Delete this contact'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 268
    Top = 320
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 356
    Top = 320
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object pnlDetails: TPanel
    Left = 8
    Top = 8
    Width = 457
    Height = 297
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 100
      Width = 57
      Height = 13
      Caption = 'Full Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 159
      Width = 37
      Height = 13
      Caption = 'Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 189
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label4: TLabel
      Left = 16
      Top = 219
      Width = 31
      Height = 13
      Caption = 'Mobile'
    end
    object Label5: TLabel
      Left = 16
      Top = 249
      Width = 25
      Height = 13
      Caption = 'Email'
    end
    object Label7: TLabel
      Left = 16
      Top = 50
      Width = 61
      Height = 13
      Caption = 'First Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 18
      Width = 20
      Height = 13
      Caption = 'Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 127
      Width = 50
      Height = 13
      Caption = 'Job Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 314
      Top = 123
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object Label6: TLabel
      Left = 16
      Top = 74
      Width = 42
      Height = 13
      Caption = 'Surname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dblkpJobTitle: TDBLookupComboBox
      Left = 88
      Top = 123
      Width = 217
      Height = 21
      KeyField = 'Contact_Type'
      ListField = 'Contact_Type_Description'
      ListSource = frmWTSrchCustContacts.dtsContactType
      TabOrder = 4
      OnClick = dblkpJobTitleClick
    end
    object edtTitle: TEdit
      Left = 88
      Top = 14
      Width = 73
      Height = 21
      TabOrder = 0
      Text = 'edtTitle'
    end
    object edtForename: TEdit
      Left = 88
      Top = 46
      Width = 161
      Height = 21
      TabOrder = 1
      Text = 'edtForename'
      OnChange = edtSurnameChange
      OnEnter = edtFirstNameEnter
    end
    object edtSurname: TEdit
      Left = 88
      Top = 70
      Width = 161
      Height = 21
      TabOrder = 2
      Text = 'edtSurname'
      OnChange = edtSurnameChange
      OnEnter = edtFirstNameEnter
    end
    object edtContactName: TEdit
      Left = 88
      Top = 96
      Width = 289
      Height = 21
      TabOrder = 3
      Text = 'edtContactName'
      OnChange = EnableOK
    end
    object edtTelephoneNumber: TEdit
      Left = 88
      Top = 155
      Width = 161
      Height = 21
      TabOrder = 5
      Text = 'edtTelephoneNumber'
      OnChange = EnableOK
    end
    object edtFaxNumber: TEdit
      Left = 88
      Top = 185
      Width = 161
      Height = 21
      TabOrder = 6
      Text = 'edtFaxNumber'
    end
    object edtMobileNumber: TEdit
      Left = 88
      Top = 215
      Width = 161
      Height = 21
      TabOrder = 7
      Text = 'edtMobileNumber'
    end
    object edtEmailAddress: TEdit
      Left = 88
      Top = 245
      Width = 289
      Height = 21
      TabOrder = 8
      Text = 'edtEmailAddress'
    end
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer_Contact'
      'SET'
      '  Title = :Title,'
      '  Forename = :Forename,'
      '  Surname = :Surname,'
      '  Contact_Name = :Contact_Name,'
      '  Telephone_Number = :Telephone_Number,'
      '  Fax_Number = :Fax_Number,'
      '  Mobile_Number = :Mobile_Number,'
      '  Email_Address = :Email_Address,'
      '  Contact_Type = :Contact_Type'
      'WHERE'
      '  Customer = :Customer AND'
      '  Contact_No = :Contact_No')
    Left = 136
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Forename'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Surname'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telephone_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mobile_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer, Contact_no,'
      '        Contact_Name, Email_Address)'
      'Select :Customer, Max(Contact_no)+1, '#39'NAME'#39', :GUID'
      'From Customer_Contact'
      'Where Customer = :Customer')
    Left = 192
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From Customer_Contact'
      'Where'
      '(Customer = :Customer) AND (Contact_no = :Contact_No)')
    Left = 248
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Contact_No'
      'From Customer_Contact'
      'Where Customer = :Customer AND Email_Address = :GUID')
    Left = 304
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'GUID'
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
    Left = 368
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Commission_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Immediately'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cleared_Funds_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Use_Separate_Invoice_Seq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
end
