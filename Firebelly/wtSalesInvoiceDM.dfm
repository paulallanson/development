object dtmdlSalesInvoice: TdtmdlSalesInvoice
  Height = 587
  Width = 1058
  object dsDummy: TDataSource
    Left = 416
    Top = 336
  end
  object qryPEnd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Sales_Profit'
      'where Sales_invoice = :Sales_invoice')
    Left = 16
    Top = 12
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryPOUpLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Purchase_OrderLine'
      'set Purch_Ord_Line_Status = :Purch_Ord_Line_Status,'
      '    Qty_Invoiced = Qty_Invoiced + :Qty_Invoiced'
      'where Purchase_Order = :Purchase_Order AND'
      '      Line = :Line'
      ' ')
    Left = 16
    Top = 104
    ParamData = <
      item
        Name = 'Purch_Ord_Line_Status'
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySIHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select '#9'Sales_Invoice.Sales_Invoice,'
      #9'Sales_Invoice.Invoice_Date,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      #9'Sales_Invoice.Operator,'
      '  Operator.Operator_Name,'
      #9'Sales_Invoice.invoice_no,'
      #9'Sales_Invoice.Customer,'
      #9'Sales_Invoice.Branch_No,'
      '        Customer.Customer_Name as Original_Name,'
      '        Sales_Invoice.Sales_invoice_status,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Sales' +
        '_inv_Status_Desc,'
      '        Sales_Invoice.Invoice_or_Credit,'
      #9'Sales_invoice.Paid_Status,'
      #9'Sales_invoice.Paid_date,'
      #9'Sales_invoice.Paid_Amount,'
      #9'Sales_invoice.Notes,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Account_Code,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Rep,'
      '        Sales_invoice.Internal_Notes,'
      '        Sales_invoice.Invoice_Address,'
      '        Customer.Is_retail_Customer,'
      '        Customer.Customer_is_Speculative,'
      '        Sales_Invoice.Payment_Terms,'
      '        Sales_invoice.Customer_Name,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Account_Manager,'
      '        Sales_Invoice.Revenue_Centre'
      'from Sales_Invoice,'
      '     Customer,'
      '     Sales_Invoice_Status,'
      '     Operator'
      'where'
      '(Sales_invoice = :Sales_invoice) and'
      '(Sales_invoice.Customer = Customer.Customer) and'
      
        '(Sales_invoice.Sales_invoice_Status = Sales_invoice_status.Sales' +
        '_invoice_Status) and'
      '(Sales_Invoice.Operator = Operator.Operator)'
      ' ')
    Left = 432
    Top = 72
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qrySIAllLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_invoice_line.*,'
      '          VAT.VAT_Rate,'
      '          VAT.Description as VAT_Description,'
      '          VAT.Reverse_Charge'
      'from Sales_invoice_line, VAT'
      'where Sales_Invoice = :Sales_invoice and'
      'Sales_Invoice_Line.VAT = VAT.VAT')
    Left = 360
    Top = 128
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qrySILine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_invoice_line.*,'
      '          Price_Unit.Description as Price_Unit_Description,'
      '          Price_Unit.Price_unit_Factor,'
      '          VAT_Code.VAT_Rate,'
      '          VAT_Code.Description as VAT_Description'
      'from Sales_invoice_line, Price_Unit, VAT_Code'
      'where '
      '('
      '(Sales_invoice = :Sales_Invoice) and'
      '(Invoice_Line_no = :Invoice_Line_no)'
      ') and'
      '(Sales_invoice_Line.Price_Unit = Price_unit.Price_unit) and'
      '(Sales_Invoice_Line.VAT_Code = VAT_Code.VAT_Code)')
    Left = 304
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end>
  end
  object qrySIAddLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Sales_Invoice_Line'
      '  (Sales_Invoice,'
      '   Invoice_Line_no,'
      '   Quantity_Invoiced,'
      '   Unit_Price,'
      '   VAT,'
      '   VAT_Value,'
      '   Sell_unit,'
      '   Nominal,'
      '   Notes,'
      '   Job,'
      '   Sales_order,'
      '   Sales_order_Line_no,'
      '   Credit_Type,'
      '   Not_Printed,'
      '   Cost_Price,'
      '   Description)'
      'values'
      '  (:Sales_Invoice,'
      '   :Invoice_Line_no,'
      '   :Quantity_Invoiced,'
      '   :Unit_Price,'
      '   :VAT,'
      '   :VAT_Value,'
      '   :Sell_unit,'
      '   :Nominal,'
      '   :Notes,'
      '   :Job,'
      '   :Sales_order,'
      '   :Sales_order_Line_no,'
      '   :Credit_Type,'
      '   :Not_Printed,'
      '   :Cost_Price,'
      '   :Description)'
      '')
    Left = 432
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'VAT'
      end
      item
        Name = 'VAT_Value'
      end
      item
        Name = 'Sell_unit'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Notes'
        DataType = ftInteger
      end
      item
        Name = 'Job'
        DataType = ftInteger
      end
      item
        Name = 'Sales_order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_order_Line_no'
        DataType = ftInteger
      end
      item
        Name = 'Credit_Type'
        DataType = ftString
      end
      item
        Name = 'Not_Printed'
      end
      item
        Name = 'Cost_Price'
      end
      item
        Name = 'Description'
      end>
  end
  object qrySIGetLast: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Sales_Invoice) as Last_Sales_invoice'
      'from Sales_invoice')
    Left = 176
    Top = 8
  end
  object qrySIAddHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert into Sales_invoice'
      '     (Sales_Invoice,'
      '      Goods_Value, '
      '      VAT_Value,'
      '      Operator,'
      '      Customer,'
      '      Branch_No,'
      '      Account_Code,'
      '      Sales_Invoice_Status,'
      '      Invoice_Date,'
      '      invoice_no,'
      '      Invoice_or_Credit,'
      '      Paid_Status,'
      '      Paid_Amount,'
      '      Paid_Date,'
      '      Notes,'
      '      Inactive,'
      '      Reference,'
      '      Rep,'
      '      Description,'
      '      Internal_Notes,'
      '      Invoice_Address,'
      '      Customer_Name,'
      '      Deposit_Amount,'
      '      Account_Manager,'
      '      Payment_Terms,'
      '      Revenue_Centre)'
      'Values (:Sales_Invoice,'
      '      :Goods_Value,'
      '      :VAT_Value,'
      '      :Operator,'
      '      :Customer,'
      '      :Branch_No,'
      '      :Account_Code,'
      '      :Sales_Invoice_Status,'
      '      :Invoice_Date,'
      '      :Invoice_no,'
      '      :Invoice_or_Credit,'
      '      :Paid_Status,'
      '      :Paid_Amount,'
      '      :Paid_Date,'
      '      :Notes,'
      '      :Inactive,'
      '      :Reference,'
      '      :Rep,'
      '      :Description,'
      '      :Internal_Notes,'
      '      :Invoice_Address,'
      '      :Customer_Name,'
      '      :Deposit_Amount,'
      '      :Account_Manager,'
      '      :Payment_Terms,'
      '      :Revenue_Centre)'
      '')
    Left = 504
    Top = 72
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'VAT_Value'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Invoice_no'
      end
      item
        Name = 'Invoice_or_Credit'
      end
      item
        Name = 'Paid_Status'
        DataType = ftString
      end
      item
        Name = 'Paid_Amount'
      end
      item
        Name = 'Paid_Date'
      end
      item
        Name = 'Notes'
        DataType = ftInteger
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Internal_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Invoice_Address'
        DataType = ftInteger
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Deposit_Amount'
        DataType = ftFloat
      end
      item
        Name = 'Account_Manager'
        DataType = ftInteger
      end
      item
        Name = 'Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 304
    Top = 64
  end
  object qrySICharges: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_invoice_Add_Charge.*,'
      '          Vat_Code.Vat_Rate'
      'from Sales_invoice_Add_Charge, VAT_Code'
      'where Sales_invoice = :Sales_Invoice and'
      'Additional_Charge = :Additional_Charge and'
      'Sales_invoice_Add_Charge.Vat_Code = Vat_Code.Vat_Code')
    Left = 576
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object qrySIAddCharge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Sales_Invoice_Add_Charge'
      '    (Sales_Invoice,'
      '     Additional_Charge,'
      '     Details,'
      '     Amount,'
      '     Nominal,'
      '     VAt_Code, '
      '     cost_price)'
      'Values'
      '    (:Sales_invoice,'
      '     :Additional_Charge,'
      '     :Details,'
      '     :Amount,'
      '     :Nominal,'
      '     :VAt_Code, '
      '     :cost_price)'
      ''
      ''
      ' ')
    Left = 304
    Top = 184
    ParamData = <
      item
        Name = 'Sales_invoice'
      end
      item
        Name = 'Additional_Charge'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'VAt_Code'
      end
      item
        Name = 'cost_price'
      end>
  end
  object qrySILineChgs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  sales_inv_line_add_chg.Additional_Charge,'
      '        sales_inv_line_add_chg.Sales_Invoice,'
      '        sales_inv_line_add_chg.Invoice_Line_No,'
      '        sales_inv_line_add_chg.Details,'
      '        sales_inv_line_add_chg.Amount,'
      '        sales_inv_line_add_chg.Quotation_Price,'
      '        sales_inv_line_add_chg.Nominal,'
      '        sales_inv_line_add_chg.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description'
      'FROM sales_inv_line_add_chg'
      '      LEFT JOIN Vat_Code ON'
      '        sales_inv_line_add_chg.Vat_Code = Vat_Code.Vat_Code'
      'WHERE'
      '      sales_inv_line_add_chg.Sales_Invoice = :Sales_invoice and'
      
        '      sales_inv_line_add_chg.Invoice_line_no = :Invoice_Line_no ' +
        'and'
      
        '      sales_inv_line_add_chg.Additional_Charge = :Additional_Cha' +
        'rge     ')
    Left = 376
    Top = 184
    ParamData = <
      item
        Name = 'Sales_invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object qrySIAddLineChg: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Sales_Inv_Line_Add_Chg'
      '    (Sales_Invoice,'
      #9#9' Invoice_Line_no,'
      '     Additional_Charge,'
      '     Details,'
      '     Quotation_Price,'
      '     Amount,'
      '     Nominal,'
      '     VAT_Code)'
      'values'
      '    (:Invoice,'
      #9#9' :Line,'
      '     :Number,'
      '     :Details,'
      '     :Price,'
      '     :Amount,'
      '     :Nominal,'
      '     :Vat_Code) ')
    Left = 512
    Top = 184
    ParamData = <
      item
        Name = 'Invoice'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Number'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Price'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Vat_Code'
      end>
  end
  object qrySIAllCharges: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_invoice_Add_Charge.*,'
      '          Vat_Code.Vat_Rate'
      'from Sales_invoice_Add_Charge, VAT_Code'
      'where Sales_invoice = :Sales_Invoice and'
      'Sales_invoice_Add_Charge.Vat_Code = Vat_Code.Vat_Code')
    Left = 504
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object dsSIHeaderGrid: TDataSource
    DataSet = qrySIHeaderGrid
    Left = 376
    Top = 8
  end
  object qrySIHeaderGrid: TFDQuery
    OnCalcFields = qrySIHeaderGridCalcFields
    ConnectionName = 'wt'
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      '        Customer.Account_Code,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        (Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) as' +
        ' Total_Value,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Paid_Amount,'
      '        Sales_Invoice.Paid_Status,'
      '        Operator.Operator_Name,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Rep.Rep_Name,'
      '        (SELECT TOP 1 Sales_Order.Date_Required'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Date_Required,'
      '        (SELECT TOP 1 Sales_Order.Reference'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Order_Reference,'
      '        Customer_Branch.Branch_Name,'
      '        Revenue_Centre.Revenue_Centre_Descr'
      'FROM Revenue_Centre'
      '        RIGHT JOIN (Sales_invoice_status'
      '        INNER JOIN (Rep'
      '        INNER JOIN (Operator AS Account_Manager'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN (Customer_Branch'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN Sales_Invoice'
      '          ON Operator.Operator = Sales_Invoice.Operator)'
      
        '          ON (Customer_Branch.Customer = Sales_Invoice.Customer)' +
        ' AND (Customer_Branch.Branch_No = Sales_Invoice.Branch_No))'
      '          ON Customer.Customer = Sales_Invoice.Customer)'
      
        '          ON Account_Manager.Operator = Sales_Invoice.Account_Ma' +
        'nager)'
      '          ON Rep.Rep = Sales_Invoice.Rep)'
      
        '          ON Sales_invoice_status.Sales_invoice_status = Sales_I' +
        'nvoice.Sales_invoice_status)'
      
        '          ON Revenue_Centre.Revenue_Centre = Sales_Invoice.Reven' +
        'ue_Centre'
      'WHERE'
      '('
      '  (Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '  (invoice_or_credit is null)'
      ') AND'
      '('
      
        '  (Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custom' +
        'er.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Ret' +
        'ail_Customer = '#39'A'#39')'
      ') AND'
      
        '    ((Sales_order.Revenue_Centre = :Revenue_Centre) OR (0 = :Rev' +
        'enue_Centre))'
      '')
    Left = 304
    Top = 8
    ParamData = <
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
      end
      item
        Name = 'Is_Commercial_Customer'
        DataType = ftString
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end>
    object qrySIHeaderGridInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySIHeaderGridCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySIHeaderGridInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qrySIHeaderGridInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      Size = 1
    end
    object qrySIHeaderGridCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qrySIHeaderGridStatus_Description: TStringField
      FieldName = 'Status_Description'
      Size = 30
    end
    object qrySIHeaderGridGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      DisplayFormat = '0.00'
    end
    object qrySIHeaderGridVat_Value: TFloatField
      FieldName = 'Vat_Value'
      DisplayFormat = '0.00'
    end
    object qrySIHeaderGridTotal_Value: TFloatField
      FieldName = 'Total_Value'
      DisplayFormat = '0.00'
    end
    object qrySIHeaderGridInvoice_no: TStringField
      FieldName = 'Invoice_no'
      Size = 10
    end
    object qrySIHeaderGridSales_invoice_status: TIntegerField
      FieldName = 'Sales_invoice_status'
    end
    object qrySIHeaderGridSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySIHeaderGridReference: TStringField
      FieldName = 'Reference'
    end
    object qrySIHeaderGridDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object qrySIHeaderGridIs_Retail_Customer: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 3
    end
    object qrySIHeaderGridPaid_Amount: TFloatField
      FieldName = 'Paid_Amount'
      DisplayFormat = '0.00'
    end
    object qrySIHeaderGridPaid_Status: TStringField
      FieldName = 'Paid_Status'
      Size = 1
    end
    object qrySIHeaderGridDeposit_Amount: TFloatField
      FieldName = 'Deposit_Amount'
    end
    object qrySIHeaderGridRep_Name: TStringField
      FieldName = 'Rep_Name'
      Size = 50
    end
    object qrySIHeaderGridOperator_Name: TStringField
      FieldName = 'Operator_Name'
      Size = 50
    end
    object qrySIHeaderGridAccount_Manager_Name: TStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object qrySIHeaderGridOrder_Reference: TStringField
      FieldName = 'Order_Reference'
      Size = 50
    end
    object qrySIHeaderGridAccount_Code: TStringField
      FieldName = 'Account_Code'
    end
    object qrySIHeaderGridBranch_Name: TStringField
      FieldName = 'Branch_Name'
      Size = 50
    end
    object qrySIHeaderGridDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qrySIHeaderGridRevenue_Centre_Descr: TStringField
      FieldName = 'Revenue_Centre_Descr'
      Size = 50
    end
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Operator'
      'Order By Operator_Name')
    Left = 528
    Top = 8
  end
  object dsOperator: TDataSource
    DataSet = qryOperator
    Left = 584
    Top = 8
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer_Name,'
      '          Street,'
      '          Locale,'
      '          Town_City,'
      '          County_State,'
      '          Postcode,'
      '          Account_code'
      'from Customer'
      'where Customer = :Customer')
    Left = 304
    Top = 232
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Purchase_orderLine.Customers_Desc'
      'from Purchase_orderLine'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line')
    Left = 304
    Top = 288
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetSO: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_Order_Line.Product,'
      '      Product.Product_Code,'
      '      Product.Product_description,'
      '      Product.Default_Sales_Nominal'
      'from Sales_Order_Line, Product'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no and'
      'Sales_Order_line.Product = Product.Product')
    Left = 360
    Top = 288
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryGetJB: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job_Bag_Line_Dets.Job_Bag_Line_Descr'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 416
    Top = 288
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qrySIUpHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Sales_invoice'
      'SET Goods_Value = :Goods_Value, '
      '        VAT_Value = :VAT_Value,'
      '        Operator = :Operator,'
      '        Customer = :Customer,'
      '        Branch_No = :Branch_No,'
      '        Account_Code = :Account_Code,'
      '        Sales_Invoice_Status = :Sales_Invoice_Status,'
      '        Invoice_Date = :Invoice_Date,'
      '        Invoice_no = :Invoice_no,'
      '        Invoice_or_Credit = :Invoice_or_Credit,'
      '        Paid_Status = :Paid_Status, '
      '        Paid_Amount = :Paid_Amount,'
      '        Paid_Date = :Paid_date,'
      '        Notes = :Notes,'
      '        Inactive = :Inactive,'
      '        Reference = :Reference,'
      '        Rep = :Rep,'
      '        Description = :Description,'
      '        Internal_Notes = :Internal_Notes,'
      '        Invoice_Address = :Invoice_Address,'
      '        Customer_Name = :Customer_Name,'
      '        Deposit_Amount = :Deposit_Amount,'
      '        Account_Manager = :Account_Manager,'
      '        Payment_Terms = :Payment_Terms,'
      '        Revenue_Centre = :Revenue_Centre'
      'WHERE Sales_Invoice = :Sales_Invoice')
    Left = 576
    Top = 72
    ParamData = <
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'VAT_Value'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Invoice_no'
      end
      item
        Name = 'Invoice_or_Credit'
      end
      item
        Name = 'Paid_Status'
      end
      item
        Name = 'Paid_Amount'
      end
      item
        Name = 'Paid_Date'
      end
      item
        Name = 'Notes'
        DataType = ftInteger
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Internal_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Invoice_Address'
        DataType = ftInteger
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Deposit_Amount'
        DataType = ftFloat
      end
      item
        Name = 'Account_Manager'
        DataType = ftInteger
      end
      item
        Name = 'Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object qryCustReps: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Rep.Name, Rep.Rep'
      'from Reps_Branches, Rep'
      'where Customer = :Customer and '
      'Branch_no =:Branch_no and'
      'Reps_Branches.Rep = Rep.Rep')
    Left = 384
    Top = 232
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end>
  end
  object qrySIAllLineChgs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  sales_inv_line_add_chg.Additional_Charge,'
      '        sales_inv_line_add_chg.Sales_Invoice,'
      '        sales_inv_line_add_chg.Invoice_Line_No,'
      '        sales_inv_line_add_chg.Details,'
      '        sales_inv_line_add_chg.Amount,'
      '        sales_inv_line_add_chg.Quotation_Price,'
      '        sales_inv_line_add_chg.Nominal,'
      '        sales_inv_line_add_chg.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description'
      'FROM sales_inv_line_add_chg'
      '      LEFT JOIN Vat_Code ON'
      '        sales_inv_line_add_chg.Vat_Code = Vat_Code.Vat_Code'
      'WHERE'
      '      sales_inv_line_add_chg.Sales_Invoice = :Sales_invoice and'
      '      sales_inv_line_add_chg.Invoice_line_no = :Invoice_Line_no')
    Left = 448
    Top = 184
    ParamData = <
      item
        Name = 'Sales_invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end>
  end
  object qryGetVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from VAT'
      'where VAT = :VAT')
    Left = 472
    Top = 288
    ParamData = <
      item
        Name = 'VAT'
      end>
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 536
    Top = 288
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company')
    Left = 448
    Top = 232
  end
  object qryPOAllLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Purchase_OrderLine.*,'
      '          (select sum(Qty_Delivered)'
      '            from Delivery_Detail'
      
        #9'          where Delivery_Detail.Purchase_Order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        #9#9'              Delivery_Detail.Line = Purchase_OrderLine.Line a' +
        'nd'
      '                  ('
      '                  (Delivery_Detail.delivery_to_Stock is null) or'
      '                  (Delivery_Detail.delivery_to_Stock = '#39'N'#39')'
      '                  )) as Qty_Delivered,'
      '          (select sum(Qty_Delivered)'
      '            from Delivery_Detail'
      
        #9'          where Delivery_Detail.Purchase_Order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        #9#9'              Delivery_Detail.Line = Purchase_OrderLine.Line) ' +
        'as Total_Delivered,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      
        '          Purch_Ord_Line_Status.Description as Status_Descriptio' +
        'n,'
      '          Vat_code.Vat_Rate,'
      '          Customer.Vat_Code_Def as Customer_Vat_Code,'
      '          Purchase_Order.Currency_Code,'
      '          Price_Unit.Description as Sales_Unit_Desc,'
      '          Price_Unit.Price_Unit_Factor,'
      '         Customer_Branch.Inv_to_Customer,'
      '         Customer_Branch.Inv_to_Branch,'
      '         Purchase_order.Date_point'
      'from Purchase_OrderLine, Purch_Ord_Line_Status,'
      '       Customer, Customer_Branch,'
      '       VAT_Code, Purchase_Order, Price_Unit'
      'where'
      '(Purchase_Orderline.Inactive <> '#39'Y'#39') and'
      '(Customer.Name Like :Code_From) AND'
      '('
      '(Purchase_OrderLine.Supp_Inv_Recd = :Invoiced1) OR'
      '(Purchase_OrderLine.Supp_Inv_Recd = :Invoiced2)'
      ') AND'
      '(Purchase_OrderLine.Purch_Ord_Line_Status >= :Status) AND'
      '(Purchase_OrderLine.Purch_Ord_Line_Status < 30) AND'
      
        '(Purchase_OrderLine.Purch_Ord_Line_Status = Purch_Ord_Line_Statu' +
        's.Purch_Ord_Line_Status) AND'
      '(Purchase_OrderLine.Customer = Customer.Customer) And'
      '('
      '(Purchase_OrderLine.Customer = Customer_Branch.Customer) AND'
      '(Purchase_OrderLine.Branch_no = Customer_Branch.Branch_no)'
      ') AND'
      '(Customer.VAT_Code_Def = VAT_Code.VAT_Code) and'
      
        '(Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_OrderLine.Sell_Unit = Price_Unit.Price_Unit)'
      'ORDER BY Purchase_OrderLine.Purchase_Order desc, Line'
      ' ')
    Left = 304
    Top = 336
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Invoiced1'
        DataType = ftString
      end
      item
        Name = 'Invoiced2'
        DataType = ftString
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end>
  end
  object dsPOLine: TDataSource
    DataSet = qryPOAllLines
    Left = 360
    Top = 336
  end
  object qryPOAll: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Purchase_OrderLine.*,'
      '          (select sum(Qty_Delivered)'
      '            from Delivery_Detail'
      
        #9'          where Delivery_Detail.Purchase_Order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        #9#9'              Delivery_Detail.Line = Purchase_OrderLine.Line) ' +
        'as Qty_Delivered,'
      '          ((select sum(Qty_Delivered)'
      '            from Delivery_Detail'
      
        #9'          where Delivery_Detail.Purchase_Order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        #9#9'              Delivery_Detail.Line = Purchase_OrderLine.Line)-' +
        'Purchase_Orderline.Qty_Invoiced) as Qty_to_be_Invoiced,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      
        '          Purch_Ord_Line_Status.Description as Status_Descriptio' +
        'n,'
      '          Vat_code.Vat_Rate,'
      '          Customer.Vat_Code_Def as Customer_Vat_Code,'
      '          Purchase_Order.Currency_Code,'
      '          Price_Unit.Description as Sales_Unit_Desc,'
      '          Price_Unit.Price_Unit_Factor,'
      '         Customer_Branch.Inv_to_Customer,'
      '         Customer_Branch.Inv_to_Branch,'
      '         Purchase_order.Date_point'
      'from Purchase_OrderLine, Purch_Ord_Line_Status,'
      '       Customer, Customer_Branch,'
      '       VAT_Code, Purchase_Order, Price_Unit'
      'where'
      '(Purchase_Orderline.Inactive <> '#39'Y'#39') and'
      '('
      '(Purchase_OrderLine.Calloff_invoiced_upfront <> '#39'Y'#39') or'
      '(Purchase_OrderLine.Calloff_invoiced_upfront IS NULL)'
      ') and'
      
        '(Purchase_OrderLine.Purch_Ord_Line_Status = Purch_Ord_Line_Statu' +
        's.Purch_Ord_Line_Status) AND'
      '(Purchase_OrderLine.Customer = Customer.Customer) And'
      '('
      '(Purchase_OrderLine.Customer = Customer_Branch.Customer) AND'
      '(Purchase_OrderLine.Branch_no = Customer_Branch.Branch_no)'
      ') AND'
      '(Customer.VAT_Code_Def = VAT_Code.VAT_Code) and'
      
        '(Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_OrderLine.Sell_Unit = Price_Unit.Price_Unit) AND'
      ' '
      ' '
      ' ')
    Left = 472
    Top = 336
  end
  object qryPODeliv: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Purchase_OrderLine.*,'
      '          (select sum(Qty_Delivered)'
      '            from Delivery_Detail'
      
        #9'          where Delivery_Detail.Purchase_Order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        #9#9'              Delivery_Detail.Line = Purchase_OrderLine.Line a' +
        'nd'
      '                  ('
      '                  (Delivery_Detail.delivery_to_Stock is null) or'
      '                  (Delivery_Detail.delivery_to_Stock = '#39'N'#39')'
      '                  )) as Qty_Delivered,'
      '          ((select sum(Qty_Delivered)'
      '            from Delivery_Detail'
      
        #9'          where Delivery_Detail.Purchase_Order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        #9#9'              Delivery_Detail.Line = Purchase_OrderLine.Line a' +
        'nd'
      '                  ('
      '                  (Delivery_Detail.delivery_to_Stock is null) or'
      '                  (Delivery_Detail.delivery_to_Stock = '#39'N'#39')'
      
        '                  ))- Purchase_Orderline.Qty_Invoiced) as Qty_to' +
        '_be_invoiced,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      
        '          Purch_Ord_Line_Status.Description as Status_Descriptio' +
        'n,'
      '          Vat_code.Vat_Rate,'
      '          Customer.Vat_Code_Def as Customer_Vat_Code,'
      '          Purchase_Order.Currency_Code,'
      '          Price_Unit.Description as Sales_Unit_Desc,'
      '          Price_Unit.Price_Unit_Factor,'
      '         Customer_Branch.Inv_to_Customer,'
      '         Customer_Branch.Inv_to_Branch,'
      '         Purchase_order.Date_point'
      'from Purchase_OrderLine, Purch_Ord_Line_Status,'
      '       Customer, Customer_Branch,'
      '       VAT_Code, Purchase_Order, Price_Unit'
      'where'
      '(Purchase_Orderline.Inactive <> '#39'Y'#39') and'
      '('
      '(Purchase_OrderLine.Calloff_invoiced_upfront <> '#39'Y'#39') or'
      '(Purchase_OrderLine.Calloff_invoiced_upfront IS NULL)'
      ') and'
      '(Purchase_OrderLine.selling_price <> 0.00) and'
      
        '(Purchase_OrderLine.Purch_Ord_Line_Status = Purch_Ord_Line_Statu' +
        's.Purch_Ord_Line_Status) AND'
      '(Purchase_OrderLine.Customer = Customer.Customer) And'
      '('
      '(Purchase_OrderLine.Customer = Customer_Branch.Customer) AND'
      '(Purchase_OrderLine.Branch_no = Customer_Branch.Branch_no)'
      ') AND'
      '(Customer.VAT_Code_Def = VAT_Code.VAT_Code) and'
      
        '(Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_OrderLine.Sell_Unit = Price_Unit.Price_Unit) AND'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 528
    Top = 336
  end
  object oldqryPOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Customer_Branch.Name AS Branch_Name,'
      '        Customer.Name AS Customer_Name,'
      '        Purchase_OrderLine.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Product_Type,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Price_Unit.Description as Price_unit_description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Purchase_OrderLine.Rep,'
      '        Customer_Branch.Inv_To_Customer,'
      '        Customer_Branch.Inv_To_Branch,'
      '        InvCustB.Name as InvBranch_Name,'
      '        InvCust.Name as InvCust_Name,'
      '        InvCustB.Account_Code,'
      '        InvCust.Currency_Code_Def,'
      '        Product_Type.Nominal,'
      
        '        (Purchase_OrderLine.Quantity - Purchase_OrderLine.Qty_In' +
        'voiced) as Qty_Outstanding'
      'FROM Customer AS InvCust'
      '      INNER JOIN (Customer_Branch AS InvCustB'
      '      INNER JOIN (Vat_Code'
      '      INNER JOIN (Product_Type'
      '      INNER JOIN (((Currency_Code'
      '      INNER JOIN Customer ON'
      
        '        Currency_Code.Currency_Code = Customer.Currency_Code_Def' +
        ')'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Purchase_OrderLine ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Product_Type.Product_Type = Purchase_OrderLine.Product_T' +
        'ype) ON'
      '        (Vat_Code.Vat_Code = Customer.VAT_Code_Def) AND'
      '        (Vat_Code.Vat_Code = Purchase_OrderLine.Vat_Code)) ON'
      '        (InvCustB.Branch_no = Customer_Branch.Inv_To_Branch) AND'
      
        '        (InvCustB.Customer = Customer_Branch.Inv_To_Customer)) O' +
        'N'
      '        InvCust.Customer = InvCustB.Customer'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line'
      ' ')
    Left = 304
    Top = 384
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetInvStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Sales_invoice_Status'
      'where Sales_invoice_Status = :sales_invoice_Status')
    Left = 472
    Top = 384
    ParamData = <
      item
        Name = 'sales_invoice_Status'
      end>
  end
  object dsSOAll: TDataSource
    DataSet = qrySOAll
    Left = 96
    Top = 152
  end
  object qryJBAll: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job_Bag.*,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name'
      'from  Customer, Customer_Branch,'
      '      Job_Bag'
      'where'
      '(Job_Bag_Status <= 25) and'
      '(Customer.Name Like :Code_From) AND'
      '(Job_Bag.Customer = Customer.Customer) And'
      '('
      '(Job_Bag.Customer = Customer_Branch.Customer) AND'
      '(Job_Bag.Branch_no = Customer_Branch.Branch_no)'
      ')'
      'ORDER BY Job_Bag.Job_Bag desc'
      ' ')
    Left = 16
    Top = 264
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end>
  end
  object dsJBAll: TDataSource
    DataSet = qryJBAll
    Left = 64
    Top = 264
  end
  object qrySOHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_Order.*,'
      
        '        (Sales_Order.Goods_Value + Sales_Order.Vat_Value) as Tot' +
        'al_Value,'
      '        Customer.Vat,'
      '        Customer.Is_retail_customer,'
      '        Customer.Account_code,'
      '        Customer.County_State,'
      '        Customer.Postcode,'
      '        Customer.Town_city,'
      '        Customer.Locale,'
      '        Customer.Street,'
      '        Customer.Customer_name,'
      '        Customer.Invoice_address,'
      '        Customer.Payment_Terms,'
      '        Customer.Customer_is_Speculative'
      'FROM Customer'
      '  INNER JOIN Sales_Order ON'
      '  Customer.Customer = Sales_Order.Customer'
      'WHERE'
      '(Sales_Order.Sales_order = :Sales_order)')
    Left = 16
    Top = 208
    ParamData = <
      item
        Name = 'Sales_order'
        DataType = ftInteger
      end>
  end
  object qrySOLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Sales_Order_Line.Job,'
      '        Sales_Order_Line.Unit_price,'
      '        Sales_Order_Line.Quantity,'
      '        Sales_Order_Line.Unit_cost,'
      '        Sales_Order_Line.Quantity_Allocated,'
      '        Sales_Order_Line.Quantity_Delivered,'
      '        Sales_Order_Line.Quantity_Invoiced,'
      
        '        (Sales_Order_Line.Quantity - Sales_Order_Line.Quantity_I' +
        'nvoiced) as Invoice_Qty,'
      '        Sales_Order_Line.Sell_Unit,'
      '        Sales_Order_Line.Cost_Unit,'
      '        Sales_Order_Line.Nett_Price,'
      '        Sales_Order_Line.Discount_Value,'
      '        Sales_Order_Line.Survey_price,'
      '        Sales_Order_Line.Installation_price,'
      '        Sales_Order_Line.Vat,'
      '        Vat.Vat_Rate,'
      '        Vat.Description as VAT_Description,'
      '        Vat.Reverse_Charge,'
      '        Sales_Order_Line.Description,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order_Line.Product,'
      '        Product.Product_Description,'
      '        Product.Default_sales_nominal'
      'FROM (Sales_Order_Line'
      '      LEFT JOIN Product ON'
      '        Sales_Order_Line.Product = Product.Product)'
      '      LEFT JOIN Vat ON Sales_Order_Line.Vat = Vat.Vat'
      'WHERE'
      '(Sales_Order = :Sales_Order) and'
      '('
      
        '(Sales_Order_Line.Quantity <> Sales_Order_line.Quantity_Invoiced' +
        ') and'
      
        '((Sales_Order_Line.Quantity - Sales_Order_line.Quantity_Invoiced' +
        ') > 0) and'
      '(Sales_Order_Line.Quantity <> 0)'
      ')'
      
        'ORDER BY Sales_Order_line.Sales_Order, Sales_Order_line.Sales_Or' +
        'der_line_no'
      ' '
      '')
    Left = 80
    Top = 208
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object qryJBHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Job_Bag.*,'
      #9'Customer.Name as Customer_Name,'
      #9'Customer_Branch.Name as Branch_Name,'
      '        InvCust.Name as InvCust_Name,'
      '        InvCust.Currency_code_Def,'
      '        InvCustB.Name as InvBranch_Name,'
      '        InvCustB.Account_Code,'
      '        InvCustB.Inv_to_Customer,'
      '        InvCustB.Inv_To_Branch'
      'from  Job_Bag, '
      '      Customer,'
      '      Customer_Branch,'
      '      Customer InvCust,'
      '      Customer_Branch InvCustB'
      'where'
      '(Job_Bag.Job_Bag = :Job_Bag) and'
      '(Job_Bag.Customer = Customer.Customer) and'
      '('
      '(Job_Bag.Customer = Customer_Branch.Customer) and'
      '(Job_Bag.Branch_no = Customer_Branch.Branch_no)'
      ') and'
      '(Customer_Branch.Inv_to_Customer = InvCust.Customer) and'
      '('
      '(Customer_Branch.Inv_to_Customer = InvCustB.Customer) and'
      '(Customer_Branch.Inv_to_Branch = InvCustB.Branch_no)'
      ')'
      ''
      ' ')
    Left = 120
    Top = 264
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryJBLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Job_Bag_Line_Dets.Purchase_Order,'
      '        Job_Bag_Line_Dets.Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Invoiced,'
      '        Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '        Job_Bag_Line_Dets.VAT_Code,'
      '        Job_Bag_Line_Dets.Currency_Code,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        (select Product_type'
      '         from Purchase_OrderLine'
      
        '         where Purchase_OrderLine.Purchase_Order = Job_Bag_Line_' +
        'Dets.Purchase_Order and'
      
        '               Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line)' +
        ' as Product_Type,'
      
        '        (Purchase_OrderLine.Quantity - Purchase_OrderLine.Qty_In' +
        'voiced) as Invoice_qty'
      'FROM Vat_Code'
      '      INNER JOIN (Purchase_OrderLine'
      '      RIGHT JOIN Job_Bag_Line_Dets ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code'
      'WHERE Job_Bag = :Job_Bag and'
      '('
      '(((Purchase_OrderLine.purch_ord_line_status < 30) and'
      '(Purchase_OrderLine.Inactive <> '#39'Y'#39') or'
      '(Purchase_orderLine.Inactive is null)) or'
      'Job_Bag_Line_Dets.Purchase_order is null)'
      ')and'
      '((Job_Bag_Line_Dets.Job_Bag_Line_Invoiced is null) or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'N'#39') or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'P'#39'))'
      ''
      ''
      ' '
      ' ')
    Left = 176
    Top = 264
    ParamData = <
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end>
  end
  object qryGetPType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 536
    Top = 384
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryPOChkStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Purchase_Order, Line'
      'from Purchase_Orderline'
      'where Purchase_Order = :Purchase_Order and'
      '           Purch_Ord_Line_Status <> :Purch_Ord_Line_Status')
    Left = 96
    Top = 106
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Purch_Ord_Line_Status'
      end>
  end
  object qryPOUpHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Purchase_Order'
      'set Purch_Ord_Head_Status = :Purch_Ord_Head_Status'
      'where Purchase_Order = :Purchase_Order')
    Left = 176
    Top = 104
    ParamData = <
      item
        Name = 'Purch_Ord_Head_Status'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qrySOUpLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order_Line'
      'Set Quantity_Invoiced = Quantity_Invoiced + :Quantity_Invoiced'
      'where (Sales_Order_Line_No = :Sales_order_Line) and'
      '  (Sales_Order = :Sales_order)'
      ' '
      ' '
      ' '
      ' ')
    Left = 16
    Top = 56
    ParamData = <
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Sales_order_Line'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object qrySOChkStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Sales_Order.Sales_Order_Status,'
      '       (Select Sum(Quantity - Quantity_Invoiced)'
      '        From Sales_Order_Line'
      
        '        Where (Sales_Order_Line.Sales_Order = Sales_Order.Sales_' +
        'Order)) as Qty_Not_Inv,'
      '       (Select Sum(Quantity_Invoiced)'
      '        From Sales_Order_Line'
      
        '        Where (Sales_Order_Line.Sales_Order = Sales_Order.Sales_' +
        'Order)) as Qty_Inv'
      'From Sales_Order'
      'Where  (Sales_Order.Sales_Order = :Sales_Order)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 680
    Top = 444
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOUpHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Sales_Order_Status = :Sales_Order_Status'
      'where Sales_Order = :Sales_order')
    Left = 176
    Top = 56
    ParamData = <
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object qryJBUpLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Job_Bag_Line_Dets'
      'set Job_Bag_Line_Invoiced = :Job_Bag_Line_Invoiced'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 16
    Top = 312
    ParamData = <
      item
        Name = 'Job_Bag_Line_Invoiced'
      end
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryRep: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Rep')
    Left = 16
    Top = 368
  end
  object dsRep: TDataSource
    DataSet = qryRep
    Left = 56
    Top = 368
  end
  object qryJBChkStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job_Bag,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      
        #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag) as Total_Lin' +
        'es,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      
        #9#9'Job_Bag_Line_dets.Job_Bag_Line_invoiced <> '#39'Y'#39') as Lines_Not_i' +
        'nvoiced'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 96
    Top = 316
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryJBUpHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Job_bag'
      'Set Job_Bag_Status = :Job_Bag_Status'
      'where Job_Bag = :Job_Bag')
    Left = 176
    Top = 312
    ParamData = <
      item
        Name = 'Job_Bag_Status'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Product.Product_code, Sales_Order_Line.Description,'
      
        '        (Sales_Order_Line.Quantity_Delivered-Sales_order_Line.Qu' +
        'antity_Invoiced) as Qty_Outstanding,'
      '        Sales_Order_Line.Sell_Unit,'
      '        Sales_Order_Line.Unit_price'
      'FROM Sales_Order_Line'
      
        '      LEFT JOIN Product ON Sales_Order_Line.Product = Product.Pr' +
        'oduct'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no'
      ' ')
    Left = 360
    Top = 384
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryJBLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job_Bag_Line_Dets.Job_Bag_Line_Descr, '
      'Job_Bag_Quantity as Qty_Outstanding,'
      'Job_Bag_Line_Invoiced'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 416
    Top = 384
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryPOLineChgs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'
      '  Purch_Ord_Line_Add_Chg.Purchase_Order,'
      '  Purch_Ord_Line_Add_Chg.Line,'
      '  Purch_Ord_Line_Add_Chg.Additional_charge,'
      '  Purch_Ord_Line_Add_Chg.Details,'
      '  Purch_Ord_Line_Add_Chg.Amount,'
      '  Purch_Ord_Line_Add_Chg.Quotation_Price,'
      '  Purchase_OrderLine.Customer,'
      '  Customer.VAT_Code_Def as VAT_Code,'
      '  Vat_Code.Vat_Rate,'
      '  Product_Type.Nominal'
      'FROM Product_Type'
      '  INNER JOIN (Vat_Code'
      '  INNER JOIN ((Purchase_OrderLine'
      '  INNER JOIN Customer ON'
      '    Purchase_OrderLine.Customer = Customer.Customer)'
      '  INNER JOIN Purch_Ord_Line_Add_Chg ON'
      '    (Purchase_OrderLine.Line = Purch_Ord_Line_Add_Chg.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_Add_Chg.' +
        'Purchase_Order)) ON'
      '    Vat_Code.Vat_Code = Customer.VAT_Code_Def) ON'
      '    Product_Type.Product_Type = Purchase_OrderLine.Product_Type'
      'WHERE'
      '  Purch_Ord_Line_Add_Chg.Purchase_order = :Purchase_order and'
      '  Purch_Ord_Line_Add_Chg.Line = :Line and'
      '  Purch_Ord_Line_Add_Chg.Quotation_Price <> 0')
    Left = 304
    Top = 432
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryCustInvTo: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer_Branch.Inv_To_Customer,'
      '           Customer_Branch.Inv_To_Branch,'
      '           Customer.Name as Customer_Name,'
      '           CustB.Name as Branch_Name,'
      '           CustB.Account_Code'
      'from Customer_Branch, Customer, Customer_Branch CustB'
      'where '
      '('
      '(Customer_Branch.Customer = :Customer) and'
      '(Customer_Branch.Branch_no = :Branch_no)'
      ') and'
      '(Customer_Branch.Inv_to_Customer = Customer.Customer) and'
      '('
      '(Customer_Branch.Inv_to_Customer = CustB.Customer) and'
      '(Customer_Branch.Inv_to_Branch = CustB.Branch_no)'
      ')')
    Left = 512
    Top = 232
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryPOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Customer_Branch.Name AS Branch_Name,'
      '        Customer.Name AS Customer_Name,'
      '        Customer.VAT_Code_Def as Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Product_Type,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Price_Unit.Description AS Price_unit_description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Purchase_OrderLine.Rep,'
      '        Customer_Branch.Inv_To_Customer,'
      '        Customer_Branch.Inv_To_Branch,'
      '        InvCustB.Name AS InvBranch_Name,'
      '        InvCust.Name AS InvCust_Name,'
      '        InvCustB.Account_Code,'
      '        InvCust.Currency_Code_Def,'
      '        Product_Type.Nominal,'
      
        '        (Purchase_OrderLine.Quantity-Purchase_OrderLine.Qty_Invo' +
        'iced) AS Qty_Outstanding,'
      '        job_bag_line_dets.job_bag,'
      '        job_bag_line_dets.Job_Bag_Line'
      'FROM (Vat_Code'
      '      INNER JOIN (Product_Type'
      '      INNER JOIN (Customer AS InvCust'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN (Customer_Branch AS InvCustB'
      '      INNER JOIN (((Currency_Code'
      '      INNER JOIN Customer ON'
      
        '        Currency_Code.Currency_Code = Customer.Currency_Code_Def' +
        ')'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Purchase_OrderLine ON'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o)) ON'
      
        '        (InvCustB.Customer = Customer_Branch.Inv_To_Customer) AN' +
        'D'
      '        (InvCustB.Branch_no = Customer_Branch.Inv_To_Branch)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      '        InvCust.Customer = InvCustB.Customer) ON'
      
        '        Product_Type.Product_Type = Purchase_OrderLine.Product_T' +
        'ype) ON'
      '        Vat_Code.Vat_Code = Customer.VAT_Code_Def)'
      '       left join job_bag_line_dets on '
      
        '         ((Purchase_OrderLine.Purchase_Order = job_bag_line_dets' +
        '.purchase_order)'
      
        '           and (Purchase_OrderLine.line = job_bag_line_dets.line' +
        '))'
      'WHERE Purchase_OrderLine.Purchase_Order = :Purchase_order and'
      'Purchase_OrderLine.Line = :Line'
      ' '
      ' '
      ' ')
    Left = 232
    Top = 384
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetRep: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 608
    Top = 288
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object qryJBLineChgs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Line_Dets.Job_Bag,'
      #9'Purchase_OrderLine.Purchase_Order, '
      #9'Purchase_OrderLine.Line, '
      #9'Purch_Ord_Line_Add_Chg.Additional_charge, '
      #9'Purch_Ord_Line_Add_Chg.Details, '
      #9'Purch_Ord_Line_Add_Chg.Amount, '
      #9'Purch_Ord_Line_Add_Chg.Quotation_Price, '
      #9'Product_Type.Nominal,'
      '                Purchase_orderLine.customer, '
      #9'Customer.VAT_Code_Def as Vat_Code, '
      #9'Vat_Code.Vat_Rate'
      'FROM Product_Type '
      #9'INNER JOIN (Vat_Code '
      #9'INNER JOIN (((Purchase_OrderLine '
      #9'INNER JOIN Job_Bag_Line_Dets ON '
      #9#9'(Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND '
      
        #9#9'(Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchas' +
        'e_Order)) '
      #9'INNER JOIN Purch_Ord_Line_Add_Chg ON '
      #9#9'(Purchase_OrderLine.Line = Purch_Ord_Line_Add_Chg.Line) AND '
      
        #9#9'(Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_Add_Chg.Pu' +
        'rchase_Order)) '
      #9'INNER JOIN Customer ON '
      #9#9'Purchase_OrderLine.Customer = Customer.Customer) ON '
      #9#9'Vat_Code.Vat_Code = Customer.VAT_Code_Def) ON '
      #9#9'Product_Type.Product_Type = Purchase_OrderLine.Product_Type'
      'where job_bag = :Job_Bag and'
      ' Purch_Ord_Line_Add_Chg.Quotation_Price <> 0 and'
      ' Purchase_orderLine.purch_ord_line_Status <= 25'
      ' ')
    Left = 360
    Top = 432
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object dsJBLines: TDataSource
    DataSet = qryJBLines
    Left = 232
    Top = 264
  end
  object qrySCHeaderGrid: TFDQuery
    OnCalcFields = qrySIHeaderGridCalcFields
    ConnectionName = 'wt'
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        ((Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) *' +
        ' -1) as Total_Credit,'
      '        Sales_invoice.Goods_Value * -1 as Goods_Credit,'
      '        Sales_invoice.Vat_Value * -1 as VAT_Credit,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer'
      '        Sales_invoice.Revenue_Centre,'
      '        Revenue_Centre.Revenue_Centre_Descr'
      'FROM Revenue_Centre'
      '        RIGHT JOIN (Sales_invoice_status'
      '        INNER JOIN (Rep'
      '        INNER JOIN (Operator AS Account_Manager'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN (Customer_Branch'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN Sales_Invoice'
      '          ON Operator.Operator = Sales_Invoice.Operator)'
      
        '          ON (Customer_Branch.Customer = Sales_Invoice.Customer)' +
        ' AND (Customer_Branch.Branch_No = Sales_Invoice.Branch_No))'
      '          ON Customer.Customer = Sales_Invoice.Customer)'
      
        '          ON Account_Manager.Operator = Sales_Invoice.Account_Ma' +
        'nager)'
      '          ON Rep.Rep = Sales_Invoice.Rep)'
      
        '          ON Sales_invoice_status.Sales_invoice_status = Sales_I' +
        'nvoice.Sales_invoice_status)'
      
        '          ON Revenue_Centre.Revenue_Centre = Sales_Invoice.Reven' +
        'ue_Centre'
      'WHERE'
      '(Sales_Invoice.invoice_or_credit = '#39'C'#39') and'
      '('
      '(Sales_Invoice.Customer_Name Like :Code_From) or'
      '(Customer.Account_code Like :Code_From)'
      ') AND'
      '('
      '(Sales_invoice.Sales_invoice_status < :Status) or'
      '(:Status = 0)'
      ') and'
      '('
      '((:Inactive = '#39'N'#39')  and (Sales_Invoice.Inactive is null )) or'
      '(:Inactive = '#39'Y'#39')'
      ') and'
      
        '((Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custome' +
        'r.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Reta' +
        'il_Customer = '#39'A'#39')) AND'
      
        '((Sales_Invoice.Revenue_Centre = :Revenue_Centre) OR (0 = :Reven' +
        'ue_Centre))'
      'ORDER BY Sales_Invoice.Sales_Invoice DESC'
      '')
    Left = 24
    Top = 424
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
      end
      item
        Name = 'Is_Commercial_Customer'
        DataType = ftString
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end>
    object qrySCHeaderGridInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySCHeaderGridCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySCHeaderGridInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qrySCHeaderGridInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      Size = 1
    end
    object qrySCHeaderGridOriginal_Name: TStringField
      FieldName = 'Original_Name'
      Size = 50
    end
    object qrySCHeaderGridStatus_Description: TStringField
      FieldName = 'Status_Description'
      Size = 30
    end
    object qrySCHeaderGridGoods_Value: TFloatField
      FieldName = 'Goods_Value'
    end
    object qrySCHeaderGridVat_Value: TFloatField
      FieldName = 'Vat_Value'
    end
    object qrySCHeaderGridGoods_Credit: TFloatField
      FieldName = 'Goods_Credit'
    end
    object qrySCHeaderGridVAT_Credit: TFloatField
      FieldName = 'VAT_Credit'
    end
    object qrySCHeaderGridInvoice_no: TStringField
      FieldName = 'Invoice_no'
      Size = 10
    end
    object qrySCHeaderGridSales_invoice_status: TIntegerField
      FieldName = 'Sales_invoice_status'
    end
    object qrySCHeaderGridSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySCHeaderGridReference: TStringField
      FieldName = 'Reference'
    end
    object qrySCHeaderGridDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object qrySCHeaderGridCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qrySCHeaderGridTotal_Credit: TFloatField
      FieldName = 'Total_Credit'
    end
    object qrySCHeaderGridIs_Retail_Customer: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 3
    end
    object qrySCHeaderGridRep_Name: TStringField
      FieldName = 'Rep_Name'
      Size = 50
    end
    object qrySCHeaderGridOperator_Name: TStringField
      FieldName = 'Operator_Name'
      Size = 50
    end
    object qrySCHeaderGridAccount_Manager_Name: TStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object qrySCHeaderGridOrder_Reference: TStringField
      FieldName = 'Order_Reference'
      Size = 50
    end
    object qrySCHeaderGridBranch_Name: TStringField
      FieldName = 'Branch_Name'
      Size = 100
    end
    object qrySCHeaderGridRevenue_Centre_Descr: TStringField
      FieldName = 'Revenue_Centre_Descr'
      Size = 50
    end
  end
  object dsSCHeaderGrid: TDataSource
    DataSet = qrySCHeaderGrid
    Left = 80
    Top = 424
  end
  object qrySOChgs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Sales_Order,'
      '        Additional_Charge,'
      '        Details,'
      '        Amount,'
      '        Nominal,'
      '        Sales_order_Add_Charge.Vat_Code,'
      '        Vat_Code.Vat_Rate'
      'from Sales_order_Add_Charge, Vat_Code'
      'where Sales_order = :Sales_order and'
      'Sales_order_add_Charge.Vat_Code = Vat_Code.vat_code')
    Left = 136
    Top = 208
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object qrySOHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select sales_order, '
      '          Replenish_source'
      'from Sales_order'
      'where sales_order = :sales_order')
    Left = 600
    Top = 384
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryPO2bInvoiced: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Supp_Inv_Recd,'
      '        Purchase_OrderLine.Invoice_upfront,'
      
        '        (Sum(Delivery_Detail.Qty_Delivered) - Purchase_orderline' +
        '.Qty_invoiced) AS Qty_to_be_invoiced,'
      '        (select top 1 Date_deliv_actual'
      '         from Delivery_detail'
      
        '         where (Delivery_detail.Purchase_order = Purchase_OrderL' +
        'ine.purchase_order) and'
      
        '               (Delivery_detail.Line = Purchase_OrderLine.Line) ' +
        'and'
      '               (Delivery_detail.Qty_delivered <> 0)'
      
        '         order by Delivery_detail.date_deliv_actual desc, Delive' +
        'ry_detail.Delivery_no) as Last_delivery_date,'
      '        Purchase_Order.Date_Point,'
      '        Customer.Name as Customer_name,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Price_Unit.Description  as Sales_Unit_Desc'
      'FROM Purchase_Order'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Purchase_OrderLine'
      '      INNER JOIN Delivery_Detail ON'
      '        (Purchase_OrderLine.Line=Delivery_Detail.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order =Delivery_Detail.Purc' +
        'hase_Order)) ON'
      
        '        (Customer_Branch.Branch_no=Purchase_OrderLine.Branch_no)' +
        ' AND'
      
        '        (Customer_Branch.Customer=Purchase_OrderLine.Customer)) ' +
        'ON'
      
        '        Customer.Customer=Customer_Branch.Customer) ON Price_Uni' +
        't.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      
        '        Purchase_Order.Purchase_Order=Purchase_OrderLine.Purchas' +
        'e_Order'
      'WHERE  (((Delivery_Detail.Delivery_to_Stock)<>'#39'Y'#39') And'
      '        ((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<30) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null)) Or'
      '        (((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<30) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null) And'
      '        ((Purchase_OrderLine.Invoice_upfront)='#39'Y'#39'))'
      'GROUP BY Purchase_OrderLine.Purchase_Order,'
      '      Purchase_OrderLine.Line,'
      '      Purchase_OrderLine.Quantity,'
      '      Purchase_OrderLine.Selling_Price,'
      '      Purchase_OrderLine.Supp_Inv_Recd,'
      '      Purchase_OrderLine.Invoice_upfront,'
      '      Purchase_OrderLine.Qty_Invoiced,'
      '      Purchase_Order.Date_Point,'
      '      Customer.Name,'
      '      Purchase_OrderLine.Customers_Desc,'
      '      Price_Unit.Description'
      'HAVING'
      
        '      ((Sum(Delivery_Detail.Qty_Delivered) - Purchase_orderline.' +
        'Qty_invoiced) > 0) AND'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 232
    Top = 336
  end
  object qryPeriodEnd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from period'
      'order by Period desc')
    Left = 96
    Top = 8
  end
  object qrySOAll: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Descriptive_Reference,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc, '
      #9#9'    Revenue_Centre.Revenue_Centre_Descr'
      'FROM Revenue_Centre '
      #9#9'RIGHT JOIN (Sales_Order_Status '
      #9#9'INNER JOIN Sales_Order '
      
        #9#9#9'ON Sales_Order_Status.Sales_Order_Status = Sales_Order.Sales_' +
        'Order_Status) '
      #9#9#9'ON Revenue_Centre.Revenue_Centre = Sales_Order.Revenue_Centre'
      'WHERE Customer_Name LIKE :Code_From AND'
      '    (Sales_Order.Sales_Order_Status >= :Status) AND'
      '    (Sales_Order.Sales_Order_Status <= 90) AND'
      
        '    ((Sales_order.inactive is NULL) OR (Sales_Order.inactive = '#39 +
        'N'#39')) AND'
      
        '    ((Sales_order.Do_not_Invoice is NULL) OR (Sales_Order.Do_not' +
        '_Invoice = '#39'N'#39')) AND'
      
        '    ((Sales_order.Revenue_Centre = :Revenue_Centre) OR (0 = :Rev' +
        'enue_Centre)) AND'
      '    (Sales_Order.Date_Required <= :Date_Required)'
      'ORDER BY Sales_Order.Sales_Order desc')
    Left = 24
    Top = 160
    ParamData = <
      item
        Name = 'Code_From'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Date_Required'
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Address_Name,'
      '          Street,'
      '          Locale,'
      '          Town_City,'
      '          County_State,'
      '          Postcode'
      'from Address'
      'where Address = :Address')
    Left = 584
    Top = 232
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryGetSOQuote: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_order_Line_no,'
      '        Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Quote.Material_Type,'
      '        Material_Type.Description,'
      '        Material_Type.Sales_Nominal,'
      '        Worktop_Type.Sales_Nominal as Worktop_Type_Nominal,'
      
        '        Worktop_Type.Sales_Nominal_Retail as Worktop_Type_Nomina' +
        'l_Retail'
      'FROM Worktop_Type'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN (Sales_Order_Line'
      '      INNER JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '        ON Material_Type.Material_Type = Quote.Material_Type)'
      
        '        ON Worktop_Type.Worktop_Type = Material_Type.Worktop_Typ' +
        'e'
      'WHERE Sales_order_Line.Sales_Order = :Sales_Order AND'
      
        '      Sales_Order_Line.Sales_Order_Line_no = :Sales_Order_Line_n' +
        'o')
    Left = 696
    Top = 288
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryPaymentTerms: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from Payment_Terms'
      'Order by Payment_Terms_Description')
    Left = 672
    Top = 8
  end
  object dsPaymentTerms: TDataSource
    DataSet = qryPaymentTerms
    Left = 760
    Top = 8
  end
  object qryGetCustTypeNominal: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Customer_type,'
      '        Customer_Type.Description,'
      '        Customer_type.Sales_Nominal'
      'FROM Customer_Type'
      '      INNER JOIN Customer'
      '        ON Customer_Type.Customer_Type = Customer.Customer_type'
      'WHERE Customer = :Customer')
    Left = 672
    Top = 72
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryCheckInvoice: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Sales_Invoice, invoice_No'
      'from Sales_Invoice'
      'where Invoice_No = :Invoice_No AND'
      'Invoice_no <> '#39' '#39' AND'
      'Sales_Invoice <> :Sales_Invoice AND'
      'Sales_Invoice.Inactive <> '#39'Y'#39)
    Left = 688
    Top = 136
    ParamData = <
      item
        Name = 'Invoice_No'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetSOLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select count(Sales_order) as total_lines,'
      '(select sum(quantity)'
      ' from sales_order_line SOL'
      ' where SOL.Sales_Order = :sales_order) as total_Qty_to_Invoice,'
      '(select sum(QS.quantity)'
      ' from sales_order_line SOL, Quote_Slab QS'
      ' where SOL.Sales_Order = :sales_order AND'
      ' (QS.Quote = SOL.Quote)) as total_Qty_to_Purchase,'
      '(select sum(quantity_invoiced)'
      ' from sales_order_line SOL'
      ' where SOL.Sales_Order = :sales_order) as total_SO_Invoiced,'
      '(select sum(quantity_invoiced)'
      ' from Sales_invoice_line, sales_invoice'
      ' where Sales_invoice_line.Sales_Order = :Sales_order AND'
      
        '       (Sales_Invoice_Line.sales_invoice = Sales_invoice.sales_I' +
        'nvoice) AND'
      
        '       ((Sales_Invoice.inactive IS NULL) OR (Sales_Invoice.inact' +
        'ive = '#39#39')) AND'
      
        '       ((Sales_Invoice_Line.credit_type = '#39#39') or (Sales_Invoice_' +
        'Line.credit_type ='#39'Q'#39'))) as total_invoiced,'
      '(select sum(quantity)'
      ' from Purchase_Orderline, Purchase_Order'
      ' where Purchase_Orderline.Sales_Order = :Sales_order AND'
      
        '       (Purchase_Orderline.Purchase_Order = Purchase_Order.Purch' +
        'ase_Order) AND'
      
        '       ((Purchase_Order.inactive IS NULL) OR (Purchase_Order.ina' +
        'ctive = '#39'N'#39'))) as total_Purchased,'
      '(select count(sales_order)'
      ' from sales_order_line SOL, job'
      
        ' where SOL.Sales_Order = :sales_order and Job.job_status >= 10 a' +
        'nd'
      ' SOL.job = job.job) as total_in_production,'
      '(select count(sales_order)'
      ' from sales_order_line SOL, job'
      
        ' where SOL.Sales_Order = :sales_order and Job.job_status = 40 an' +
        'd'
      ' SOL.job = job.job) as total_waiting_fitting,'
      '(select count(sales_order)'
      ' from sales_order_line SOL, job'
      
        ' where SOL.Sales_Order = :sales_order and Job.job_status = 50 an' +
        'd'
      ' SOL.job = job.job) as total_complete,'
      '(select count(sales_order)'
      ' from sales_order_line SOL'
      ' where SOL.Sales_Order = :sales_order and'
      ' ((SOL.job <> NULL) or (SOL.Quote <> NULL))) as total_job_Lines,'
      '(select sum(Paid_Amount)'
      ' from Payment'
      ' where Payment.Sales_Order = :sales_order) as total_Paid'
      'from Sales_order_line'
      'where Sales_order_line.sales_order = :sales_order')
    Left = 600
    Top = 440
    ParamData = <
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end>
  end
  object qryGetCustomerVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Vat,'
      '        Vat.Reverse_Charge,'
      '        Vat.Description'
      'FROM Vat'
      '    INNER JOIN Customer'
      '      ON Vat.Vat = Customer.Vat'
      'WHERE Customer = :Customer')
    Left = 640
    Top = 232
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qrySIHeaderBase: TFDQuery
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      '        Customer.Account_Code,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        (Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) as' +
        ' Total_Value,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Paid_Amount,'
      '        Sales_Invoice.Paid_Status,'
      '        Operator.Operator_Name,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Rep.Rep_Name,'
      '        (SELECT TOP 1 Sales_Order.Date_Required'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Date_Required,'
      '        (SELECT TOP 1 Sales_Order.Reference'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Order_Reference,'
      '        Customer_Branch.Branch_Name,'
      '        Sales_invoice.Revenue_Centre,'
      '        Revenue_Centre.Revenue_Centre_Descr'
      'FROM Revenue_Centre'
      '        RIGHT JOIN (Sales_invoice_status'
      '        INNER JOIN (Rep'
      '        INNER JOIN (Operator AS Account_Manager'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN (Customer_Branch'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN Sales_Invoice'
      '          ON Operator.Operator = Sales_Invoice.Operator)'
      
        '          ON (Customer_Branch.Customer = Sales_Invoice.Customer)' +
        ' AND (Customer_Branch.Branch_No = Sales_Invoice.Branch_No))'
      '          ON Customer.Customer = Sales_Invoice.Customer)'
      
        '          ON Account_Manager.Operator = Sales_Invoice.Account_Ma' +
        'nager)'
      '          ON Rep.Rep = Sales_Invoice.Rep)'
      
        '          ON Sales_invoice_status.Sales_invoice_status = Sales_I' +
        'nvoice.Sales_invoice_status)'
      
        '          ON Revenue_Centre.Revenue_Centre = Sales_Invoice.Reven' +
        'ue_Centre'
      'WHERE'
      '('
      '  (Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '  (invoice_or_credit is null)'
      ') AND'
      '('
      
        '  (Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custom' +
        'er.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Ret' +
        'ail_Customer = '#39'A'#39')'
      ') AND'
      
        '    ((Sales_Invoice.Revenue_Centre = :Revenue_Centre) OR (0 = :R' +
        'evenue_Centre))'
      ''
      '')
    Left = 448
    Top = 8
    ParamData = <
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Revenue_Centre'
      end
      item
        Name = 'Revenue_Centre'
      end>
  end
  object qrySCHeaderBase: TFDQuery
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        ((Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) *' +
        ' -1) as Total_Credit,'
      '        Sales_invoice.Goods_Value * -1 as Goods_Credit,'
      '        Sales_invoice.Vat_Value * -1 as VAT_Credit,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Paid_Amount,'
      '        Sales_Invoice.Paid_Status,'
      '        Operator.Operator_Name,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Rep.Rep_Name,'
      '        (SELECT TOP 1 Sales_Order.Reference'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Order_Reference,Customer_Branch.Branch_Name,'
      '        Sales_Invoice.Revenue_Centre,'
      '        Revenue_Centre.Revenue_Centre_Descr'
      'FROM Revenue_Centre'
      '      RIGHT JOIN (Sales_invoice_status'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Customer'
      '      INNER JOIN (Customer_Branch'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Sales_Invoice'
      '          ON Operator.Operator = Sales_Invoice.Operator)'
      
        '          ON (Customer_Branch.Customer = Sales_Invoice.Customer)' +
        ' AND (Customer_Branch.Branch_No = Sales_Invoice.Branch_No))'
      '          ON Customer.Customer = Sales_Invoice.Customer)'
      
        '          ON Account_Manager.Operator = Sales_Invoice.Account_Ma' +
        'nager)'
      '          ON Rep.Rep = Sales_Invoice.Rep)'
      
        '          ON Sales_invoice_status.Sales_invoice_status = Sales_I' +
        'nvoice.Sales_invoice_status)'
      
        '          ON Revenue_Centre.Revenue_Centre = Sales_Invoice.Reven' +
        'ue_Centre'
      'WHERE'
      '  (Sales_Invoice.invoice_or_credit = '#39'C'#39') AND'
      '('
      
        '  (Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custom' +
        'er.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Ret' +
        'ail_Customer = '#39'A'#39')'
      ') AND'
      
        '((Sales_Invoice.Revenue_Centre = :Revenue_Centre) OR (0 = :Reven' +
        'ue_Centre))'
      ''
      '')
    Left = 160
    Top = 424
    ParamData = <
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Revenue_Centre'
      end
      item
        Name = 'Revenue_Centre'
      end>
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'ORDER BY Revenue_Centre_Descr')
    Left = 856
    Top = 8
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 944
    Top = 8
  end
  object qrySIHeaderBaseOlder: TFDQuery
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      '        Customer.Account_Code,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        (Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) as' +
        ' Total_Value,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Paid_Amount,'
      '        Sales_Invoice.Paid_Status,'
      '        Operator.Operator_Name,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Rep.Rep_Name,'
      '        (SELECT TOP 1 Sales_Order.Reference'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Order_Reference'
      'FROM Rep'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN (Sales_invoice_status'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Invoice'
      '        ON Customer.Customer = Sales_Invoice.Customer)'
      
        '        ON Sales_invoice_status.Sales_invoice_status = Sales_Inv' +
        'oice.Sales_invoice_status)'
      '        ON Operator.Operator = Sales_Invoice.Operator)'
      
        '        ON Account_Manager.Operator = Sales_Invoice.Account_Mana' +
        'ger)'
      '        ON Rep.Rep = Sales_Invoice.Rep'
      'WHERE'
      '('
      '  (Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '  (invoice_or_credit is null)'
      ') AND'
      '('
      
        '  (Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custom' +
        'er.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Ret' +
        'ail_Customer = '#39'A'#39')'
      ')'
      ''
      '')
    Left = 944
    Top = 72
    ParamData = <
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qrySCHeaderBaseOlderStill: TFDQuery
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        ((Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) *' +
        ' -1) as Total_Credit,'
      '        Sales_invoice.Goods_Value * -1 as Goods_Credit,'
      '        Sales_invoice.Vat_Value * -1 as VAT_Credit,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Paid_Amount,'
      '        Sales_Invoice.Paid_Status,'
      '        Operator.Operator_Name,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Rep.Rep_Name,'
      '        (SELECT TOP 1 Sales_Order.Reference'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Order_Reference'
      'FROM Rep'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN (Sales_invoice_status'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Invoice'
      '        ON Customer.Customer = Sales_Invoice.Customer)'
      
        '        ON Sales_invoice_status.Sales_invoice_status = Sales_Inv' +
        'oice.Sales_invoice_status)'
      '        ON Operator.Operator = Sales_Invoice.Operator)'
      
        '        ON Account_Manager.Operator = Sales_Invoice.Account_Mana' +
        'ger)'
      '        ON Rep.Rep = Sales_Invoice.Rep'
      'WHERE'
      '  (Sales_Invoice.invoice_or_credit = '#39'C'#39') AND'
      '('
      
        '  (Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custom' +
        'er.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Ret' +
        'ail_Customer = '#39'A'#39')'
      ')'
      ''
      '')
    Left = 944
    Top = 352
    ParamData = <
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qrySIHeaderBaseOld: TFDQuery
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      '        Customer.Account_Code,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        (Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) as' +
        ' Total_Value,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Paid_Amount,'
      '        Sales_Invoice.Paid_Status,'
      '        Operator.Operator_Name,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Rep.Rep_Name,'
      '        (SELECT TOP 1 Sales_Order.Date_Required'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Date_Required,'
      '        (SELECT TOP 1 Sales_Order.Reference'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Order_Reference,'
      '        Customer_Branch.Branch_Name'
      'FROM Customer_Branch'
      '        RIGHT JOIN (Sales_invoice_status'
      '        INNER JOIN (Rep'
      '        INNER JOIN (Operator AS Account_Manager'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN (Operator'
      '        INNER JOIN Sales_Invoice'
      '            ON Operator.Operator = Sales_Invoice.Operator)'
      '            ON Customer.Customer = Sales_Invoice.Customer)'
      
        '            ON Account_Manager.Operator = Sales_Invoice.Account_' +
        'Manager)'
      '            ON Rep.Rep = Sales_Invoice.Rep)'
      
        '            ON Sales_invoice_status.Sales_invoice_status = Sales' +
        '_Invoice.Sales_invoice_status)'
      
        '            ON (Customer_Branch.Branch_No = Sales_Invoice.Branch' +
        '_No) AND (Customer_Branch.Customer = Sales_Invoice.Customer)'
      'WHERE'
      '('
      '  (Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '  (invoice_or_credit is null)'
      ') AND'
      '('
      
        '  (Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custom' +
        'er.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Ret' +
        'ail_Customer = '#39'A'#39')'
      ')'
      ''
      '')
    Left = 944
    Top = 128
    ParamData = <
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qrySCHeaderBaseOlder: TFDQuery
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        ((Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) *' +
        ' -1) as Total_Credit,'
      '        Sales_invoice.Goods_Value * -1 as Goods_Credit,'
      '        Sales_invoice.Vat_Value * -1 as VAT_Credit,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Sales_Invoice.Deposit_Amount,'
      '        Sales_Invoice.Paid_Amount,'
      '        Sales_Invoice.Paid_Status,'
      '        Operator.Operator_Name,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Rep.Rep_Name,'
      '        (SELECT TOP 1 Sales_Order.Reference'
      '         FROM Sales_Order, sales_Invoice_line'
      
        '         WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.' +
        'sales_invoice AND'
      
        '                sales_order.sales_order = sales_invoice_line.Sal' +
        'es_order) as Order_Reference,Customer_Branch.Branch_Name'
      'FROM Customer_Branch'
      '      RIGHT JOIN (Sales_invoice_status'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Customer'
      '      INNER JOIN (Operator'
      '      INNER JOIN Sales_Invoice'
      '          ON Operator.Operator = Sales_Invoice.Operator)'
      '          ON Customer.Customer = Sales_Invoice.Customer)'
      
        '          ON Account_Manager.Operator = Sales_Invoice.Account_Ma' +
        'nager)'
      '          ON Rep.Rep = Sales_Invoice.Rep)'
      
        '          ON Sales_invoice_status.Sales_invoice_status = Sales_I' +
        'nvoice.Sales_invoice_status)'
      
        '          ON (Customer_Branch.Branch_No = Sales_Invoice.Branch_N' +
        'o) AND (Customer_Branch.Customer = Sales_Invoice.Customer)'
      'WHERE'
      '  (Sales_Invoice.invoice_or_credit = '#39'C'#39') AND'
      '('
      
        '  (Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custom' +
        'er.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Ret' +
        'ail_Customer = '#39'A'#39')'
      ')'
      ''
      '')
    Left = 944
    Top = 408
    ParamData = <
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qrySCHeaderOld: TFDQuery
    OnCalcFields = qrySIHeaderGridCalcFields
    ConnectionName = 'wt'
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        ((Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) *' +
        ' -1) as Total_Credit,'
      '        Sales_invoice.Goods_Value * -1 as Goods_Credit,'
      '        Sales_invoice.Vat_Value * -1 as VAT_Credit,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Is_Retail_Customer'
      'from Sales_Invoice,'
      '     Customer,'
      '     Sales_Invoice_Status'
      'where'
      '(Sales_Invoice.invoice_or_credit = '#39'C'#39') and'
      '('
      '(Sales_Invoice.Customer_Name Like :Code_From) or'
      '(Customer.Account_code Like :Code_From)'
      ') AND'
      '('
      '(Sales_invoice.Sales_invoice_status < :Status) or'
      '(:Status = 0)'
      ') and'
      '('
      '((:Inactive = '#39'N'#39')  and (Sales_Invoice.Inactive is null )) or'
      '(:Inactive = '#39'Y'#39')'
      ') and'
      '(Sales_invoice.Customer = Customer.Customer) and'
      
        '(Sales_invoice.Sales_invoice_Status = Sales_invoice_status.Sales' +
        '_invoice_Status) and'
      
        '((Customer.Is_Retail_Customer = :Is_Retail_Customer) OR (Custome' +
        'r.Is_Commercial_Customer = :Is_Commercial_Customer) or (:Is_Reta' +
        'il_Customer = '#39'A'#39'))'
      'order by Sales_Invoice.Sales_Invoice desc'
      '')
    Left = 944
    Top = 464
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
      end
      item
        Name = 'Is_Commercial_Customer'
        DataType = ftString
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object IntegerField1: TIntegerField
      FieldName = 'Customer'
    end
    object StringField1: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object StringField2: TStringField
      FieldName = 'Invoice_or_Credit'
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'Original_Name'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'Status_Description'
      Size = 30
    end
    object FloatField1: TFloatField
      FieldName = 'Goods_Value'
    end
    object FloatField2: TFloatField
      FieldName = 'Vat_Value'
    end
    object FloatField3: TFloatField
      FieldName = 'Goods_Credit'
    end
    object FloatField4: TFloatField
      FieldName = 'VAT_Credit'
    end
    object StringField5: TStringField
      FieldName = 'Invoice_no'
      Size = 10
    end
    object IntegerField2: TIntegerField
      FieldName = 'Sales_invoice_status'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object StringField6: TStringField
      FieldName = 'Reference'
    end
    object StringField7: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object FloatField5: TFloatField
      FieldName = 'Total_Credit'
    end
    object StringField9: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 3
    end
    object StringField10: TStringField
      FieldName = 'Rep_Name'
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'Operator_Name'
      Size = 50
    end
    object StringField12: TStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object StringField13: TStringField
      FieldName = 'Order_Reference'
      Size = 50
    end
    object StringField14: TStringField
      FieldName = 'Branch_Name'
      Size = 100
    end
    object StringField15: TStringField
      FieldName = 'Revenue_Centre_Descr'
      Size = 50
    end
  end
end
