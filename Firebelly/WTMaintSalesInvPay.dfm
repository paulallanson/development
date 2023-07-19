object frmWTMaintSalesInvPay: TfrmWTMaintSalesInvPay
  Left = 289
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Invoice Payment Details'
  ClientHeight = 294
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    494
    294)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TBitBtn
    Left = 165
    Top = 250
    Width = 75
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 0
    OnClick = btnOKClick
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
  end
  object btnCancel: TBitBtn
    Left = 253
    Top = 250
    Width = 75
    Height = 28
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 187
    Width = 481
    Height = 54
    Caption = 'Payment Details'
    Enabled = False
    TabOrder = 2
    object Label5: TLabel
      Left = 267
      Top = 22
      Width = 48
      Height = 13
      Caption = 'Total Paid'
    end
    object Label10: TLabel
      Left = 8
      Top = 22
      Width = 47
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
      Enabled = False
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
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 28
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 52
      Height = 13
      Caption = 'Invoice No'
    end
    object Label3: TLabel
      Left = 267
      Top = 56
      Width = 61
      Height = 13
      Caption = 'Invoice Date'
    end
    object Label4: TLabel
      Left = 267
      Top = 84
      Width = 58
      Height = 13
      Caption = 'Total Goods'
    end
    object Label6: TLabel
      Left = 8
      Top = 84
      Width = 55
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
  object GroupBox3: TGroupBox
    Left = 8
    Top = 123
    Width = 481
    Height = 54
    Caption = 'Deposit Details'
    TabOrder = 4
    object Label7: TLabel
      Left = 11
      Top = 26
      Width = 87
      Height = 13
      Caption = 'Total Deposit Paid'
    end
    object Label8: TLabel
      Left = 267
      Top = 26
      Width = 62
      Height = 13
      Caption = 'Invoice Total'
    end
    object memDepositPaid: TMemo
      Left = 113
      Top = 21
      Width = 80
      Height = 23
      Alignment = taRightJustify
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = enableOK
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object memInvoiceTotal: TMemo
      Left = 345
      Top = 21
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
  end
  object qryGetInvoice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT distinct'
      'Sales_Invoice.Customer,'
      'Sales_Invoice.Sales_Invoice,'
      'Sales_Invoice.Account_Code,'
      'Sales_Invoice.Customer_Name,'
      'Rep.Rep_Name,'
      'Rep.Rep,'
      'Sales_Invoice.Invoice_No,'
      'Sales_Invoice.Goods_Value,'
      'Sales_Invoice.Vat_Value,'
      
        'Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Total_Value' +
        ','
      'Sales_Invoice.Invoice_Date,'
      'Sales_Invoice.Invoice_or_Credit,'
      'Sales_Invoice.Paid_Date,'
      'Sales_Invoice.Paid_Amount,'
      'Sales_Invoice.Deposit_Amount,'
      'Sales_Invoice.Paid_Status,'
      'Sales_Invoice.Reference,'
      'Sales_Invoice.Description'
      'FROM Sales_Invoice, Customer, Rep'
      'WHERE (Sales_Invoice.Sales_invoice = :Sales_Invoice) and'
      '    ((Sales_invoice.Customer = Customer.Customer)) and'
      '    (Sales_invoice.Rep = Rep.Rep)')
    Left = 248
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryUpInvoice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update sales_invoice'
      'Set Paid_Amount = :Paid_Amount,'
      'Deposit_Amount = :Deposit_Amount,'
      'Paid_Date = :Paid_Date,'
      'Paid_Status = :Paid_Status'
      'WHERE Sales_invoice = :Sales_invoice')
    Left = 424
    Top = 171
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Paid_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deposit_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Paid_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Paid_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetSILines: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Sales_invoice_Line'
      'where sales_invoice = :sales_invoice')
    Left = 320
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Job_bag_Line_Dets'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 224
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryUpdJobBag: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Job_Bag'
      'set On_Hold = :On_Hold'
      'where Job_Bag = :Job_Bag')
    Left = 352
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'On_Hold'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOdelivLines: TFDQuery
    ConnectionName = 'WT'
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
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPODeliv: TFDQuery
    ConnectionName = 'WT'
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
        DataType = ftUnknown
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_No'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'set ready_to_invoice = '#39'N'#39
      'Where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 424
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
end
