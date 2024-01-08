object PBMaintSalesInvPayFrm: TPBMaintSalesInvPayFrm
  Left = 160
  Top = 132
  BorderStyle = bsDialog
  Caption = 'Invoice Payment Details'
  ClientHeight = 401
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object btnOK: TBitBtn
    Left = 165
    Top = 369
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
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 253
    Top = 369
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 115
    Width = 481
    Height = 54
    Caption = 'Payment Details'
    ParentBackground = False
    TabOrder = 2
    object Label5: TLabel
      Left = 267
      Top = 22
      Width = 50
      Height = 13
      Caption = 'Total Paid'
    end
    object Label10: TLabel
      Left = 8
      Top = 22
      Width = 49
      Height = 13
      Caption = 'Paid Date'
    end
    object btnDate: TSpeedButton
      Left = 216
      Top = 16
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      OnClick = btnDateClick
    end
    object edtDatePaid: TEdit
      Left = 112
      Top = 18
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 0
      OnExit = edtDatePaidExit
    end
    object memTotalPaid: TMemo
      Left = 345
      Top = 17
      Width = 80
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = enableOK
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object chkbxPaid: TCheckBox
      Left = 112
      Top = -3
      Width = 97
      Height = 17
      Caption = 'Fully Paid ?'
      TabOrder = 2
      OnClick = chkbxPaidClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 481
    Height = 113
    Caption = 'Invoice Details'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 28
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Invoice No'
    end
    object Label3: TLabel
      Left = 267
      Top = 56
      Width = 63
      Height = 13
      Caption = 'Invoice Date'
    end
    object Label4: TLabel
      Left = 267
      Top = 84
      Width = 62
      Height = 13
      Caption = 'Total Goods'
    end
    object Label6: TLabel
      Left = 8
      Top = 84
      Width = 59
      Height = 13
      Caption = 'Sales Order'
    end
    object edtCustomer: TEdit
      Left = 112
      Top = 24
      Width = 353
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtInvoiceNo: TEdit
      Left = 112
      Top = 52
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtInvoiceDate: TEdit
      Left = 344
      Top = 52
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtTotalGoods: TEdit
      Left = 344
      Top = 80
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edtReference: TEdit
      Left = 112
      Top = 80
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object grpbxCreditCard: TGroupBox
    Left = 8
    Top = 258
    Width = 481
    Height = 105
    Caption = 'Credit Card Details'
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label7: TLabel
      Left = 10
      Top = 24
      Width = 86
      Height = 13
      Caption = 'Account Number'
    end
    object Label8: TLabel
      Left = 10
      Top = 52
      Width = 74
      Height = 13
      Caption = 'Account Name'
    end
    object Label9: TLabel
      Left = 10
      Top = 84
      Width = 57
      Height = 13
      Caption = 'Expiry Date'
    end
    object Label13: TLabel
      Left = 164
      Top = 84
      Width = 4
      Height = 13
      Caption = '/'
    end
    object cmbbxMonth: TComboBox
      Left = 112
      Top = 76
      Width = 49
      Height = 21
      TabOrder = 0
      OnChange = enableOK
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
    end
    object edtAccountName: TEdit
      Left = 112
      Top = 46
      Width = 249
      Height = 21
      TabOrder = 1
      OnChange = enableOK
    end
    object edtAccountNumber: TEdit
      Left = 112
      Top = 18
      Width = 249
      Height = 21
      TabOrder = 2
      OnChange = enableOK
    end
    object cmbbxYear: TComboBox
      Left = 176
      Top = 76
      Width = 69
      Height = 21
      TabOrder = 3
      OnChange = enableOK
      Items.Strings = (
        '2005'
        '2006'
        '2007'
        '2008'
        '2009'
        '2010')
    end
  end
  object rdgrpPaymentType: TRadioGroup
    Left = 8
    Top = 173
    Width = 121
    Height = 79
    Caption = 'Payment Type'
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Credit Card'
      'Cheque'
      'BACS')
    ParentBackground = False
    TabOrder = 5
    OnClick = rdgrpPaymentTypeClick
  end
  object qryGetInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct'
      'Sales_Invoice.Customer,'
      'Sales_Invoice.Branch_no,'
      'Sales_Invoice.Sales_Invoice,'
      'Customer_Branch.Account_Code,'
      'Customer.Name as Customer_Name,'
      'Rep.Name AS Rep_Name,'
      'Rep.Rep,'
      'Sales_Invoice.Sales_Invoice_No,'
      'Sales_Invoice.Goods_Value,'
      'Sales_Invoice.Sales_Invoice_type,'
      'Sales_Invoice.Vat_Value,'
      
        'Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Total_Value' +
        ','
      'Sales_Invoice.Invoice_Date,'
      'Sales_Invoice.Invoice_or_Credit,'
      'Sales_Invoice.Paid_Date,'
      'Sales_Invoice.Paid_Amount,'
      'Sales_Invoice.Paid_Status,'
      'Sales_Invoice.Reference,'
      'Sales_Invoice.Invoice_Description,'
      'Sales_Invoice.Payment_Method,'
      'Contact_Name,'
      'Account_Number,'
      'Account_Month,'
      'Account_Year,'
      '(Account_Month + '#39'/'#39' + Account_Year) as Expiry_Date'
      'FROM Sales_Invoice, Customer_Branch, Customer, Rep'
      'WHERE (Sales_Invoice.Sales_invoice = :Sales_Invoice) and'
      '    ((Sales_invoice.Customer = Customer_Branch.Customer) and'
      '    (Sales_invoice.Branch_no = Customer_Branch.Branch_no)) and'
      '    (Customer_Branch.Customer = Customer.Customer) and'
      '    (Sales_invoice.Rep = Rep.Rep)')
    Left = 248
    Top = 72
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryUpInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update sales_invoice'
      'Set Account_Number = :Account_Number,'
      'Contact_Name = :Contact_Name,'
      'Account_Month = :Account_Month,'
      'Account_Year = :Account_Year,'
      'Paid_Amount = :Paid_Amount,'
      'Paid_Date = :Paid_Date,'
      'Paid_Status = :Paid_Status,'
      'Payment_Method = :Payment_Method'
      'WHERE Sales_invoice = :Sales_invoice')
    Left = 424
    Top = 171
    ParamData = <
      item
        Name = 'Account_Number'
        DataType = ftString
      end
      item
        Name = 'Contact_Name'
        DataType = ftString
      end
      item
        Name = 'Account_Month'
        DataType = ftString
      end
      item
        Name = 'Account_Year'
        DataType = ftString
      end
      item
        Name = 'Paid_Amount'
        DataType = ftFloat
      end
      item
        Name = 'Paid_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Paid_Status'
        DataType = ftString
      end
      item
        Name = 'Payment_Method'
      end
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryGetSILines: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Sales_invoice_Line'
      'where sales_invoice = :sales_invoice')
    Left = 152
    Top = 176
    ParamData = <
      item
        Name = 'sales_invoice'
      end>
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Job_bag_Line_Dets'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 224
    Top = 176
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryUpdJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag'
      'set On_Hold = :On_Hold'
      'where Job_Bag = :Job_Bag')
    Left = 296
    Top = 176
    ParamData = <
      item
        Name = 'On_Hold'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetPOdelivLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Delivery_Detail'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line'
      'Order By Delivery_No')
    Left = 152
    Top = 224
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryUpdPODeliv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Delivery_Detail'
      'set Qty_Delivered = Qty_to_Deliver,'
      'Date_Deliv_Actual = :Date_Deliv_Actual'
      'Where Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      'Delivery_No = :Delivery_No ')
    Left = 296
    Top = 224
    ParamData = <
      item
        Name = 'Date_Deliv_Actual'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Delivery_No'
      end>
  end
  object qryUpdPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'set ready_to_invoice = '#39'N'#39
      'Where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 424
    Top = 224
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
end
