object frmwtLUPayments: TfrmwtLUPayments
  Left = 283
  Top = 71
  BorderStyle = bsDialog
  Caption = 'Payments'
  ClientHeight = 533
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 89
    Width = 791
    Height = 174
    Align = alClient
    DataSource = srcPayments
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Payment_date'
        Title.Caption = 'Date'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Paid_Amount'
        Title.Caption = 'Amount'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Payment_Method_Description'
        Title.Caption = 'Method'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Payment_Description'
        Title.Caption = 'Description'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_no'
        Title.Caption = 'Invoice'
        Width = 71
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 514
    Width = 791
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 471
    Width = 791
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      791
      43)
    object btnAdd: TBitBtn
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 89
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 170
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 693
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 3
      OnClick = BitBtn4Click
      NumGlyphs = 2
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 392
    Width = 791
    Height = 79
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      791
      79)
    object Label1: TLabel
      Left = 584
      Top = 13
      Width = 92
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Total Payments:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalPayments: TLabel
      Left = 688
      Top = 13
      Width = 80
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'lblTotalPayments'
    end
    object lblDeposit: TLabel
      Left = 8
      Top = 62
      Width = 107
      Height = 13
      Caption = 'Deposit Required: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDepositRequired: TLabel
      Left = 136
      Top = 62
      Width = 89
      Height = 13
      Caption = 'lblDepositRequired'
    end
    object lblTotalValueLabel: TLabel
      Left = 8
      Top = 13
      Width = 105
      Height = 13
      Caption = 'Total Order Value:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrderValue: TLabel
      Left = 136
      Top = 13
      Width = 63
      Height = 13
      Caption = 'lblOrderValue'
    end
    object Label3: TLabel
      Left = 584
      Top = 61
      Width = 73
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Outstanding:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOutstanding: TLabel
      Left = 688
      Top = 61
      Width = 67
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'lblOutstanding'
    end
    object lblCredits: TLabel
      Left = 584
      Top = 38
      Width = 73
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Total Credits'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalCredits: TLabel
      Left = 688
      Top = 38
      Width = 66
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'lblTotalCredits'
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 791
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object lblSalesOrder: TLabel
      Left = 674
      Top = 14
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'lblSalesOrder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescription: TLabel
      Left = 8
      Top = 43
      Width = 457
      Height = 38
      AutoSize = False
      Caption = 'lblDescription'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lblCustomer: TLabel
      Left = 8
      Top = 14
      Width = 66
      Height = 13
      Caption = 'lblCustomer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSalesInvoice: TLabel
      Left = 663
      Top = 43
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'lblSalesInvoice'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAccountCode: TLabel
      Left = 464
      Top = 14
      Width = 90
      Height = 13
      Caption = 'lblAccountCode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dbgCredits: TDBGrid
    Left = 0
    Top = 296
    Width = 791
    Height = 96
    Align = alBottom
    DataSource = srcCreditNotes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgCreditsDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Invoice_Date'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_No'
        Title.Caption = 'Credit Note No.'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 378
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Title.Caption = 'Invoice No.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Value'
        Title.Caption = 'Credit Value'
        Width = 85
        Visible = True
      end>
  end
  object pnlCreditNotes: TPanel
    Left = 0
    Top = 263
    Width = 791
    Height = 33
    Align = alBottom
    TabOrder = 6
    object lblCreditNotes: TLabel
      Left = 8
      Top = 13
      Width = 71
      Height = 13
      Caption = 'Credit Notes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object srcPayments: TDataSource
    DataSet = qryPayments
    Left = 192
    Top = 120
  end
  object qryDelete: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'delete from Payment'
      'where Payment = :Payment')
    Left = 272
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Payment'
        ParamType = ptUnknown
      end>
  end
  object qryPayments: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Payment.Payment,'
      '        Payment.Payment_date,'
      '        Payment.Paid_Amount,'
      '        Payment.Payment_Method,'
      '        Payment.Payment_Description,'
      '        Payment_Method.Payment_Method_Description,'
      '        Payment.Sales_Order,'
      '        Payment.Sales_Invoice,'
      '        Payment.Account_Number,'
      '        Payment.Account_Month,'
      '        Payment.Account_Year,'
      '        Sales_invoice.Invoice_no'
      'FROM Sales_invoice'
      '        RIGHT JOIN (Payment_Method'
      '        INNER JOIN Payment'
      
        '          ON Payment_Method.Payment_Method = Payment.Payment_Met' +
        'hod)'
      '          ON Sales_invoice.Sales_invoice = Payment.Sales_Invoice'
      
        'WHERE ((Payment.Sales_Invoice = :Sales_Invoice) OR (Payment.Sale' +
        's_Order = :Sales_Order))')
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
    object qryPaymentsPayment: TIntegerField
      FieldName = 'Payment'
      Origin = 'WT.Payment.Payment'
    end
    object qryPaymentsPayment_date: TDateTimeField
      FieldName = 'Payment_date'
      Origin = 'WT.Payment.Payment_date'
    end
    object qryPaymentsPaid_Amount: TFloatField
      FieldName = 'Paid_Amount'
      Origin = 'WT.Payment.Paid_Amount'
      DisplayFormat = '0.00'
    end
    object qryPaymentsPayment_Method: TIntegerField
      FieldName = 'Payment_Method'
      Origin = 'WT.Payment.Payment_Method'
    end
    object qryPaymentsPayment_Description: TStringField
      FieldName = 'Payment_Description'
      Origin = 'WT.Payment.Payment_Description'
      Size = 255
    end
    object qryPaymentsPayment_Method_Description: TStringField
      FieldName = 'Payment_Method_Description'
      Origin = 'WT.Payment_Method.Payment_Method_Description'
      Size = 30
    end
    object qryPaymentsSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'WT.Payment.Sales_Order'
    end
    object qryPaymentsSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
      Origin = 'WT.Payment.Sales_Invoice'
    end
    object qryPaymentsAccount_Number: TStringField
      FieldName = 'Account_Number'
      Origin = 'WT.Payment.Account_Number'
      Size = 30
    end
    object qryPaymentsAccount_Month: TStringField
      FieldName = 'Account_Month'
      Origin = 'WT.Payment.Account_Month'
      Size = 2
    end
    object qryPaymentsAccount_Year: TStringField
      FieldName = 'Account_Year'
      Origin = 'WT.Payment.Account_Year'
      Size = 4
    end
    object qryPaymentsInvoice_no: TStringField
      FieldName = 'Invoice_no'
      Origin = 'WT.Sales_invoice.Invoice_no'
      Size = 10
    end
  end
  object qryGetSOPayments: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  SUM(Payment.Paid_Amount) AS Total_Payments'
      'FROM Payment'
      'WHERE ((Payment.Sales_Order = :Sales_Order))')
    Left = 408
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpSOPayments: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_order'
      'Set Deposit_Amount = :Deposit_Amount'
      'WHERE Sales_order = :Sales_Order')
    Left = 272
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Deposit_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpSINVPayments: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Invoice'
      'Set Paid_Amount = :Paid_Amount,'
      '    Paid_Status = :Paid_Status,'
      '    Deposit_Amount = :Deposit_Amount'
      'WHERE Sales_Invoice = :Sales_Invoice')
    Left = 272
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Paid_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deposit_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetTotalPayments: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  SUM(Payment.Paid_Amount) AS Total_Payments'
      'FROM Payment'
      
        'WHERE ((Payment.Sales_Order = :Sales_Order) OR (Payment.Sales_In' +
        'voice = :Sales_Invoice))')
    Left = 408
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryCreditNotes: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT Sales_invoice.Invoice_no,'
      '  Sales_invoice.Invoice_date,'
      '  Sales_invoice.Goods_value,'
      '  Sales_invoice.Vat_Value,'
      '  Sales_invoice.Reference,'
      '  Sales_invoice.description,'
      
        '  ((Sales_invoice.Goods_value + Sales_invoice.Vat_Value) * -1) A' +
        'S Total_Value'
      'FROM Sales_invoice'
      '      RIGHT JOIN Sales_invoice_line'
      
        '        ON Sales_invoice.Sales_invoice = Sales_invoice_line.Sale' +
        's_invoice'
      
        'WHERE (Sales_Invoice.Invoice_or_Credit = '#39'C'#39') AND (Sales_invoice' +
        '_Line.Sales_Order = :Sales_Order) AND (Sales_invoice.Reference =' +
        ' :Invoice_no) AND'
      
        '      ((sales_invoice.inactive = '#39'N'#39') or (sales_invoice.inactive' +
        ' is NULL))')
    Left = 272
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_no'
        ParamType = ptUnknown
      end>
    object qryCreditNotesInvoice_No: TStringField
      FieldName = 'Invoice_No'
      Size = 10
    end
    object qryCreditNotesTotal_Value: TFloatField
      FieldName = 'Total_Value'
      DisplayFormat = '0.00'
    end
    object qryCreditNotesDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object qryCreditNotesReference: TStringField
      FieldName = 'Reference'
    end
    object qryCreditNotesInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
  end
  object srcCreditNotes: TDataSource
    DataSet = qryCreditNotes
    Left = 352
    Top = 312
  end
  object qryGetTotalCredits: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      
        'SELECT  (SUM(Sales_Invoice.Goods_Value + Sales_Invoice.VAT_Value' +
        ')*-1) AS Total_Credits'
      'FROM Sales_invoice'
      '      RIGHT JOIN Sales_invoice_line'
      
        '        ON Sales_invoice.Sales_invoice = Sales_invoice_line.Sale' +
        's_invoice'
      
        'WHERE (Sales_Invoice.Invoice_or_Credit = '#39'C'#39') AND (Sales_invoice' +
        '_Line.Sales_Order = :Sales_Order) AND (Sales_invoice.Reference =' +
        ' :Invoice_no) AND'
      
        '      ((sales_invoice.inactive = '#39'N'#39') or (sales_invoice.inactive' +
        ' is NULL))')
    Left = 440
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetTotalSICredits: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      
        'SELECT  (SUM(Sales_Invoice.Goods_Value + Sales_Invoice.VAT_Value' +
        ')*-1) AS Total_Credits'
      'FROM Sales_invoice'
      '      RIGHT JOIN Sales_invoice_line'
      
        '        ON Sales_invoice.Sales_invoice = Sales_invoice_line.Sale' +
        's_invoice'
      
        'WHERE (Sales_Invoice.Invoice_or_Credit = '#39'C'#39') AND (Sales_invoice' +
        '.Reference = :Invoice_No) AND'
      
        '      ((sales_invoice.inactive = '#39'N'#39') or (sales_invoice.inactive' +
        ' is NULL))'
      '')
    Left = 536
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_No'
        ParamType = ptUnknown
      end>
  end
end
