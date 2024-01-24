object frmwtLUPayments: TfrmwtLUPayments
  Left = 283
  Top = 71
  BorderStyle = bsDialog
  Caption = 'Payments'
  ClientHeight = 524
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 89
    Width = 785
    Height = 165
    Align = alClient
    DataSource = srcPayments
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
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
    Top = 505
    Width = 785
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
    Top = 462
    Width = 785
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      785
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
      Left = 669
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn4Click
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
    Top = 383
    Width = 785
    Height = 79
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      785
      79)
    object Label1: TLabel
      Left = 560
      Top = 13
      Width = 82
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Total Payments:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 566
    end
    object lblTotalPayments: TLabel
      Left = 664
      Top = 13
      Width = 86
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'lblTotalPayments'
      ExplicitLeft = 670
    end
    object lblDeposit: TLabel
      Left = 8
      Top = 62
      Width = 96
      Height = 13
      Caption = 'Deposit Required: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDepositRequired: TLabel
      Left = 136
      Top = 62
      Width = 100
      Height = 13
      Caption = 'lblDepositRequired'
    end
    object lblTotalValueLabel: TLabel
      Left = 8
      Top = 13
      Width = 91
      Height = 13
      Caption = 'Total Order Value:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrderValue: TLabel
      Left = 136
      Top = 13
      Width = 71
      Height = 13
      Caption = 'lblOrderValue'
    end
    object Label3: TLabel
      Left = 560
      Top = 61
      Width = 68
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Outstanding:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 566
    end
    object lblOutstanding: TLabel
      Left = 664
      Top = 61
      Width = 79
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'lblOutstanding'
      ExplicitLeft = 670
    end
    object lblCredits: TLabel
      Left = 560
      Top = 38
      Width = 64
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Total Credits'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 566
    end
    object lblTotalCredits: TLabel
      Left = 664
      Top = 38
      Width = 74
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'lblTotalCredits'
      ExplicitLeft = 670
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    object lblSalesOrder: TLabel
      Left = 682
      Top = 14
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'lblSalesOrder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
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
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lblCustomer: TLabel
      Left = 8
      Top = 14
      Width = 63
      Height = 13
      Caption = 'lblCustomer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSalesInvoice: TLabel
      Left = 674
      Top = 43
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'lblSalesInvoice'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAccountCode: TLabel
      Left = 464
      Top = 14
      Width = 83
      Height = 13
      Caption = 'lblAccountCode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dbgCredits: TDBGrid
    Left = 0
    Top = 287
    Width = 785
    Height = 96
    Align = alBottom
    DataSource = srcCreditNotes
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgCreditsDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Invoice_date'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_no'
        Title.Caption = 'Credit Note No.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
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
    Top = 254
    Width = 785
    Height = 33
    Align = alBottom
    ParentBackground = False
    TabOrder = 6
    object lblCreditNotes: TLabel
      Left = 8
      Top = 13
      Width = 65
      Height = 13
      Caption = 'Credit Notes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object srcPayments: TDataSource
    DataSet = qryPayments
    Left = 192
    Top = 120
  end
  object qryDelete: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Payment'
      'where Payment = :Payment')
    Left = 272
    Top = 64
    ParamData = <
      item
        Name = 'Payment'
      end>
  end
  object qryPayments: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
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
        Name = 'Sales_Invoice'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPaymentsPayment: TFDAutoIncField
      FieldName = 'Payment'
      Origin = 'Payment'
      ReadOnly = True
    end
    object qryPaymentsPayment_date: TDateTimeField
      FieldName = 'Payment_date'
      Origin = 'Payment_date'
      Required = True
    end
    object qryPaymentsPaid_Amount: TCurrencyField
      FieldName = 'Paid_Amount'
      Origin = 'Paid_Amount'
      Required = True
    end
    object qryPaymentsPayment_Method: TIntegerField
      FieldName = 'Payment_Method'
      Origin = 'Payment_Method'
      Required = True
    end
    object qryPaymentsPayment_Description: TWideStringField
      FieldName = 'Payment_Description'
      Origin = 'Payment_Description'
      Size = 255
    end
    object qryPaymentsPayment_Method_Description: TWideStringField
      FieldName = 'Payment_Method_Description'
      Origin = 'Payment_Method_Description'
      Size = 30
    end
    object qryPaymentsSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
    end
    object qryPaymentsSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
      Origin = 'Sales_Invoice'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPaymentsAccount_Number: TWideStringField
      FieldName = 'Account_Number'
      Origin = 'Account_Number'
      Size = 30
    end
    object qryPaymentsAccount_Month: TWideStringField
      FieldName = 'Account_Month'
      Origin = 'Account_Month'
      Size = 2
    end
    object qryPaymentsAccount_Year: TWideStringField
      FieldName = 'Account_Year'
      Origin = 'Account_Year'
      Size = 4
    end
    object qryPaymentsInvoice_no: TWideStringField
      FieldName = 'Invoice_no'
      Origin = 'Invoice_no'
      Size = 10
    end
  end
  object qryGetSOPayments: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  SUM(Payment.Paid_Amount) AS Total_Payments'
      'FROM Payment'
      'WHERE ((Payment.Sales_Order = :Sales_Order))')
    Left = 408
    Top = 64
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryUpSOPayments: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_order'
      'Set Deposit_Amount = :Deposit_Amount'
      'WHERE Sales_order = :Sales_Order')
    Left = 272
    Top = 120
    ParamData = <
      item
        Name = 'Deposit_Amount'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qryUpSINVPayments: TFDQuery
    ConnectionName = 'WT'
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
        Name = 'Paid_Amount'
      end
      item
        Name = 'Paid_Status'
      end
      item
        Name = 'Deposit_Amount'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetTotalPayments: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  SUM(Payment.Paid_Amount) AS Total_Payments'
      'FROM Payment'
      
        'WHERE ((Payment.Sales_Order = :Sales_Order) OR (Payment.Sales_In' +
        'voice = :Sales_Invoice))')
    Left = 408
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryCreditNotes: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
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
        Name = 'Sales_Order'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Invoice_no'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCreditNotesInvoice_no: TWideStringField
      FieldName = 'Invoice_no'
      Origin = 'Invoice_no'
      Size = 10
    end
    object qryCreditNotesInvoice_date: TDateTimeField
      FieldName = 'Invoice_date'
      Origin = 'Invoice_date'
    end
    object qryCreditNotesGoods_value: TCurrencyField
      FieldName = 'Goods_value'
      Origin = 'Goods_value'
    end
    object qryCreditNotesVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
      Origin = 'Vat_Value'
    end
    object qryCreditNotesReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
    end
    object qryCreditNotesdescription: TWideStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object qryCreditNotesTotal_Value: TCurrencyField
      FieldName = 'Total_Value'
      Origin = 'Total_Value'
      ReadOnly = True
    end
  end
  object srcCreditNotes: TDataSource
    DataSet = qryCreditNotes
    Left = 352
    Top = 312
  end
  object qryGetTotalCredits: TFDQuery
    ConnectionName = 'WT'
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
        Name = 'Sales_Order'
      end
      item
        Name = 'Invoice_no'
      end>
  end
  object qryGetTotalSICredits: TFDQuery
    ConnectionName = 'WT'
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
        Name = 'Invoice_No'
      end>
  end
end
