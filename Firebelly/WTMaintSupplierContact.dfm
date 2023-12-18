object frmWTMaintSupplierContact: TfrmWTMaintSupplierContact
  Left = 507
  Top = 86
  BorderStyle = bsDialog
  Caption = 'Supplier Contact'
  ClientHeight = 345
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object pnlDetails: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 438
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 106
      Width = 57
      Height = 13
      Caption = 'Full Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 314
      Top = 131
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
    object Label8: TLabel
      Left = 16
      Top = 18
      Width = 20
      Height = 13
      Caption = 'Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 47
      Width = 61
      Height = 13
      Caption = 'First Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 77
      Width = 42
      Height = 13
      Caption = 'Surname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 136
      Width = 50
      Height = 13
      Caption = 'Job Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 225
      Width = 25
      Height = 13
      Caption = 'Email'
    end
    object Label10: TLabel
      Left = 16
      Top = 195
      Width = 31
      Height = 13
      Caption = 'Mobile'
    end
    object Label11: TLabel
      Left = 16
      Top = 165
      Width = 31
      Height = 13
      Caption = 'Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object dblkpJobTitle: TDBLookupComboBox
      Left = 88
      Top = 132
      Width = 217
      Height = 21
      DataField = 'Contact_type'
      KeyField = 'Contact_Type'
      ListField = 'Contact_Type_Description'
      ListSource = frmWTLUSupplierContacts.dtsContactType
      TabOrder = 4
      OnClick = EnableOK
    end
    object chkbxSendPurchaseOrders: TCheckBox
      Left = 16
      Top = 256
      Width = 241
      Height = 17
      Caption = 'Copy in Emails of Purchase Orders'
      TabOrder = 8
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
      Top = 73
      Width = 161
      Height = 21
      TabOrder = 2
      Text = 'edtSurname'
      OnChange = edtSurnameChange
      OnEnter = edtFirstNameEnter
    end
    object edtContactName: TEdit
      Left = 88
      Top = 102
      Width = 289
      Height = 21
      TabOrder = 3
      Text = 'edtContactName'
      OnChange = EnableOK
    end
    object edtTelephoneNumber: TEdit
      Left = 88
      Top = 163
      Width = 161
      Height = 21
      TabOrder = 5
      Text = 'edtTelephoneNumber'
    end
    object edtMobileNumber: TEdit
      Left = 88
      Top = 191
      Width = 161
      Height = 21
      TabOrder = 6
      Text = 'edtMobileNumber'
    end
    object edtEmailAddress: TEdit
      Left = 88
      Top = 221
      Width = 289
      Height = 21
      TabOrder = 7
      Text = 'edtEmailAddress'
    end
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 304
    Width = 438
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      438
      41)
    object lbldelete: TLabel
      Left = 118
      Top = 12
      Width = 129
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete this contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 258
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 346
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Supplier_Contact'
      'SET'
      '  Title = :Title,'
      '  Forename = :Forename,'
      '  Surname = :Surname,'
      '  Contact_Name = :Contact_Name,'
      '  Telephone_Number = :Telephone_Number,'
      '  Mobile_Number = :Mobile_Number,'
      '  Email_Address = :Email_Address,'
      '  Contact_Type = :Contact_Type'
      'WHERE'
      '  Supplier = :Supplier AND'
      '  Contact_No = :Contact_No')
    Left = 136
    Top = 264
    ParamData = <
      item
        Name = 'Title'
      end
      item
        Name = 'Forename'
      end
      item
        Name = 'Surname'
      end
      item
        Name = 'Contact_Name'
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
        Name = 'Contact_Type'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Supplier_Contact'
      '        (Supplier, Contact_no,'
      '        Contact_Name, Email_Address)'
      'Select :Supplier, Max(Contact_no)+1, '#39'NAME'#39', :GUID'
      'From Supplier_Contact'
      'Where Supplier = :Supplier')
    Left = 192
    Top = 264
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Supplier'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From Supplier_Contact'
      'Where'
      '(Supplier = :Supplier) AND (Contact_no = :Contact_No)')
    Left = 248
    Top = 264
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Contact_No'
      'From Supplier_Contact'
      'Where Supplier = :Supplier AND Email_Address = :GUID')
    Left = 304
    Top = 264
    ParamData = <
      item
        Name = 'Supplier'
      end
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
    Left = 368
    Top = 264
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
end
