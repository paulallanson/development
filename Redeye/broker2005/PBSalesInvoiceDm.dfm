object dmSalesInvoice: TdmSalesInvoice
  Height = 655
  Width = 1048
  object dsDummy: TDataSource
    Left = 416
    Top = 336
  end
  object qryPEnd: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Purchase_OrderLine'
      'set Purch_Ord_Line_Status = :Purch_Ord_Line_Status,'
      '    Qty_Invoiced = Qty_Invoiced + :Qty_Invoiced,'
      '    Rep = :Rep'
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
        Name = 'Rep'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySIHeader: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Sales_Invoice.Sales_Invoice,'
      #9'      Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Date_Created,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      #9'      Sales_Invoice.Operator,'
      #9'      Sales_Invoice.Sales_invoice_no,'
      #9'      Sales_Invoice.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Customer.Client_Account_Code,'
      '        Customer.Customer_is_Acquired,'
      '        Sales_Invoice.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Sales_Invoice.Sales_invoice_status,'
      
        '        Sales_Invoice_Status.Description as Sales_inv_Status_Des' +
        'c,'
      #9'      Sales_invoice.Currency_Code,'
      '        Sales_invoice.Inv_to_Customer,'
      #9'      InvCust.Name as InvCust_Name,'
      '        Sales_invoice.Inv_to_Branch,'
      '        InvCustB.Name as InvBranch_Name,'
      '        Sales_Invoice.End_User_Customer,'
      '        Sales_Invoice.End_User_Branch_no,'
      '        (select Customer.Name'
      '          from Customer'
      
        '          where Customer.Customer = Sales_Invoice.End_User_Custo' +
        'mer) as End_User_Customer_Name,'
      '        Sales_Invoice.Invoice_or_Credit,'
      #9'      Sales_invoice.Paid_Status,'
      #9'      Sales_invoice.Paid_date,'
      #9'      Sales_invoice.Paid_Amount,'
      #9'      Sales_invoice.Narrative,'
      #9'      Sales_invoice.Sales_invoice_type,'
      '        Sales_Invoice.Inactive,'
      #9'      Sales_invoice.Period_End_run,'
      '        InvCustB.Account_Code,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Invoice_Description,'
      '        Sales_invoice.Rep,'
      '        Sales_invoice.Internal_Narrative,'
      '        Sales_invoice.Cash_Sales,'
      '        Sales_invoice.Account_Number,'
      '        Sales_invoice.Account_Month,'
      '        Sales_invoice.Account_Year,'
      '        Sales_invoice.Contact_no,'
      '        Sales_invoice.Contact_Name,'
      '        Sales_Invoice.Invoice_Location,'
      '        Sales_Invoice.Category,'
      '        Sales_Invoice.Credit_Note_Reason,'
      '        Sales_Invoice.Electronic_Invoice,'
      '        Sales_Invoice.Print_as_Delivery_Note,'
      '        Sales_Invoice.Cust_Order_No,'
      '        Sales_Invoice.Price_Unit,'
      '        Sales_Invoice.Quantity,'
      '        Sales_Invoice.Sub_Rep,'
      '        Sales_Invoice.Alt_Sales_Invoice_no,'
      '        (select Category.description'
      '         from Category'
      
        '         where Category = Sales_Invoice.Category) as Category_De' +
        'scription,'
      '        (select Price_Unit_Factor'
      '         from Price_Unit'
      
        '         where Price_Unit.Price_Unit = Sales_Invoice.Price_Unit)' +
        ' as Price_Unit_Factor'
      'from Sales_Invoice,'
      '     Customer,'
      '     Customer InvCust,'
      '     Customer_Branch,'
      '     Customer_Branch InvCustB,'
      '     Sales_Invoice_Status'
      'where'
      '(Sales_invoice = :Sales_invoice) and'
      '(Sales_invoice.Customer = Customer.Customer) and'
      '('
      '(Sales_invoice.Customer = Customer_Branch.Customer) and'
      '(Sales_invoice.Branch_no = Customer_Branch.Branch_no)'
      ') and'
      '(Sales_invoice.Inv_to_Customer = InvCust.Customer) and'
      '('
      '(Sales_invoice.Inv_to_Customer = InvCustB.Customer) and'
      '(Sales_invoice.Inv_to_Branch = InvCustB.Branch_no)'
      ') and'
      
        '(Sales_invoice.Sales_invoice_Status = Sales_invoice_status.Sales' +
        '_invoice_Status)'
      ' ')
    Left = 432
    Top = 72
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qrySIAllLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_invoice_line.*,'
      '          Price_Unit.Description as Price_Unit_Description,'
      '          Price_Unit.Price_Unit_factor,'
      '          VAT_Code.VAT_Rate'
      'from Sales_invoice_line, Price_Unit, VAT_Code'
      'where Sales_Invoice = :Sales_invoice and'
      'Sales_invoice_Line.Price_Unit = Price_unit.Price_unit and'
      'Sales_Invoice_Line.VAT_Code = VAT_Code.VAT_Code')
    Left = 360
    Top = 128
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qrySILine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_invoice_line.*,'
      '          Price_Unit.Description as Price_Unit_Description,'
      '          Price_Unit.Price_unit_Factor,'
      '          VAT_Code.VAT_Rate'
      'from Sales_invoice_line, Price_Unit, VAT_Code'
      'where '
      '('
      '(Sales_invoice = :Sales_Invoice) and'
      '(Invoice_Line_no = :Invoice_Line_no)'
      ') and'
      '(Sales_invoice_Line.Price_Unit = Price_unit.Price_unit) and'
      '(Sales_Invoice_Line.VAT_Code = VAT_Code.VAT_Code) and')
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Invoice_Line'
      '  (Sales_Invoice,'
      '   Invoice_Line_no,'
      '   Purchase_order,'
      '   Line,'
      '   Qty_Invoiced,'
      '   Goods_Value,'
      '   VAT_Code,'
      '   VAT_Value,'
      '   Product_Type,'
      '   Sales_Invoice_Status,'
      '   Price_unit,'
      '   Nominal,'
      '   Narrative,'
      '   Job_Bag,'
      '   Job_Bag_Line,'
      '   Reference,'
      '   Internal_Narrative,'
      '   Sales_order,'
      '   Sales_order_Line_no,'
      '   Credit_Type,'
      '   Not_Printed,'
      '   Cost_Price,'
      '   Reseller_Price)'
      'values'
      '  (:Sales_Invoice,'
      '   :Invoice_Line_no,'
      '   :Purchase_order,'
      '   :Line,'
      '   :Qty_Invoiced,'
      '   :Goods_Value,'
      '   :VAT_Code,'
      '   :VAT_Value,'
      '   :Product_Type,'
      '   :Sales_Invoice_Status,'
      '   :Price_unit,'
      '   :Nominal,'
      '   :Narrative,'
      '   :Job_Bag,'
      '   :Job_Bag_Line,'
      '   :Reference,'
      '   :Internal_Narrative,'
      '   :Sales_order,'
      '   :Sales_order_Line_no,'
      '   :Credit_Type,'
      '   :Not_Printed,'
      '   :Cost_Price,'
      '   :Reseller_Price)'
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
        Name = 'Purchase_order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'VAT_Code'
      end
      item
        Name = 'VAT_Value'
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_Line'
        DataType = ftInteger
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Internal_Narrative'
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
        Name = 'Reseller_Price'
        DataType = ftFloat
      end>
  end
  object qrySIGetLast: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Sales_Invoice) as Last_Sales_invoice'
      'from Sales_invoice')
    Left = 304
    Top = 8
  end
  object qrySIAddHeader: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Sales_invoice'
      '     (Sales_Invoice,'
      '      Goods_Value,'
      '      VAT_Value,'
      '      Operator,'
      '      Customer,'
      '      Branch_no,'
      '      Sales_Invoice_Status,'
      '      Invoice_Date,'
      '      Currency_Code,'
      '      Inv_to_Customer,'
      '      Inv_to_Branch,'
      '      End_User_Customer,'
      '      End_User_Branch_No,'
      '      Sales_invoice_no,'
      '      Invoice_or_Credit,'
      '      Paid_Status,'
      '      Paid_Amount,'
      '      Paid_Date,'
      '      Narrative,'
      '      Sales_invoice_type,'
      '      Inactive,'
      '      Period_End_run,'
      '      Reference,'
      '      Rep,'
      '      Invoice_Description,'
      '      Internal_Narrative,'
      '      Cash_Sales,'
      '      Account_Number,'
      '      Account_Month,'
      '      Account_Year,'
      '      Contact_no,'
      '      Contact_Name,'
      '      Invoice_Location,'
      '      Category,'
      '      Credit_Note_Reason,'
      '      Electronic_Invoice,'
      '      Print_as_Delivery_Note,'
      '      Cust_Order_No,'
      '      Price_Unit,'
      '      Quantity,'
      '      Date_Created,'
      '      Sub_Rep,'
      '      Alt_Sales_Invoice_no)'
      'Values (:Sales_Invoice,'
      '      :Goods_Value,'
      '      :VAT_Value,'
      '      :Operator,'
      '      :Customer,'
      '      :Branch_no,'
      '      :Sales_Invoice_Status,'
      '      :Invoice_Date,'
      '      :Currency_Code,'
      '      :Inv_to_Customer,'
      '      :Inv_to_Branch,'
      '      :End_User_Customer,'
      '      :End_User_Branch_No,'
      '      :Sales_Invoice_no,'
      '      :Invoice_or_Credit,'
      '      :Paid_Status,'
      '      :Paid_Amount,'
      '      :Paid_Date,'
      '      :Narrative,'
      '      :Sales_invoice_type,'
      '      :Inactive,'
      '      :Period_End_run,'
      '      :Reference,'
      '      :Rep,'
      '      :Invoice_Description,'
      '      :Internal_Narrative,'
      '      :Cash_Sales,'
      '      :Account_Number,'
      '      :Account_Month,'
      '      :Account_Year,'
      '      :Contact_no,'
      '      :Contact_Name,'
      '      :Invoice_Location,'
      '      :Category,'
      '      :Credit_Note_Reason,'
      '      :Electronic_Invoice,'
      '      :Print_as_Delivery_Note,'
      '      :Cust_Order_No,'
      '      :Price_Unit,'
      '      :Quantity,'
      '      :Date_Created,'
      '      :Sub_Rep,'
      '      :Alt_Sales_Invoice_no)'
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
        Name = 'Branch_no'
      end
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Inv_to_Customer'
      end
      item
        Name = 'Inv_to_Branch'
      end
      item
        Name = 'End_User_Customer'
        DataType = ftInteger
      end
      item
        Name = 'End_User_Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Invoice_no'
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
        DataType = ftDateTime
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Sales_invoice_type'
        DataType = ftString
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Period_End_run'
        DataType = ftString
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Invoice_Description'
        DataType = ftString
      end
      item
        Name = 'Internal_Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Cash_Sales'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Account_Number'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Account_Month'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Account_Year'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Contact_Name'
        DataType = ftString
      end
      item
        Name = 'Invoice_Location'
        DataType = ftInteger
      end
      item
        Name = 'Category'
        DataType = ftInteger
      end
      item
        Name = 'Credit_Note_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Electronic_Invoice'
      end
      item
        Name = 'Print_as_Delivery_Note'
      end
      item
        Name = 'Cust_Order_No'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Quantity'
        DataType = ftFloat
      end
      item
        Name = 'Date_Created'
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
      end
      item
        Name = 'Alt_Sales_Invoice_no'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 304
    Top = 64
  end
  object qrySICharges: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Invoice_Add_Charge'
      '    (Sales_Invoice,'
      '     Additional_Charge,'
      '     Details,'
      '     Amount,'
      '     Nominal,'
      '     VAt_Code, '
      '     cost_price,'
      '     poAddChrg,'
      '     Purchase_Order,'
      '     Invoice_Line_no)'
      'Values'
      '    (:Sales_invoice,'
      '     :Additional_Charge,'
      '     :Details,'
      '     :Amount,'
      '     :Nominal,'
      '     :VAt_Code, '
      '     :cost_price,'
      '     :poAddChrg,'
      '     :Purchase_Order,'
      '     :Invoice_Line_no)'
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
      end
      item
        Name = 'poAddChrg'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
      end
      item
        Name = 'Invoice_Line_no'
        DataType = ftInteger
      end>
  end
  object qrySILineChgs: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    Left = 456
    Top = 8
  end
  object qrySIHeaderGrid: TFDQuery
    OnCalcFields = qrySIHeaderGridCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP 2000'
      #9#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Branch_no,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Sales_Invoice_Status.Description as Status_Description,'
      '        Customer_Branch.Inv_to_Customer,'
      '        Customer_Branch.Inv_to_Branch,'
      '        Customer_Branch.Account_Code,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      '        Sales_Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Sales_invoice_type,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Invoice_Description,'
      '        sales_invoice.factoring_filename,'
      '        sales_invoice.factoring_date,'
      '        sales_invoice.paid_status,'
      '        sales_invoice.cash_sales,'
      '        sales_invoice.rep,'
      '        sales_invoice.Sub_Rep,'
      '        sales_invoice.Alt_Sales_Invoice_no,'
      '        rep.name as Rep_Name,'
      #9#9'    Sub_Rep.name as Sub_Rep_Name,'
      '        Sales_Invoice.Electronic_Invoice,'
      '        End_User_Customer.Name as End_User_Name,'
      #9#9'    CASE Sales_invoice.Sales_invoice_type'
      #9#9#9'    WHEN '#39'J'#39' THEN'
      #9#9#9#9'    (SELECT Pack_Format.Pack_Format_Description'
      #9#9#9#9'    FROM Job_Bag, Pack_Format'
      
        #9#9#9#9'    WHERE (Job_Bag.Job_Bag = CAST(Sales_Invoice.Reference as' +
        ' int)) AND'
      #9#9#9#9#9#9'    (Job_Bag.Pack_Format_ID = Pack_Format.ID))'
      #9#9#9'    ELSE'
      #9#9#9#9'    '#39#39
      #9#9'      END as Pack_Format_Description,'
      #9#9'    CASE Sales_invoice.Sales_invoice_type'
      #9#9#9'    WHEN '#39'J'#39' THEN'
      #9#9#9#9'    (SELECT Job_Bag.Enclosing_Type'
      #9#9#9#9'    FROM Job_Bag'
      
        #9#9#9#9'    WHERE (Job_Bag.Job_Bag = CAST(Sales_Invoice.Reference as' +
        ' int)))'
      #9#9#9'    ELSE'
      #9#9#9#9'    '#39#39
      #9#9'    END as Enclosing_Type'
      'FROM Customer AS End_User_Customer'
      '      RIGHT JOIN (Customer'
      '      INNER JOIN (Sales_Invoice_Status'
      '      INNER JOIN (Rep AS Sub_Rep'
      '      RIGHT JOIN ((Customer_Branch'
      '      INNER JOIN Sales_Invoice'
      
        '        ON (Customer_Branch.Customer = Sales_Invoice.Inv_to_Cust' +
        'omer) AND (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Bran' +
        'ch))'
      '      LEFT JOIN Rep'
      '        ON Sales_Invoice.Rep = Rep.Rep)'
      '        ON Sub_Rep.Rep = Sales_Invoice.Sub_Rep)'
      
        '        ON Sales_Invoice_Status.Sales_Invoice_Status = Sales_Inv' +
        'oice.Sales_Invoice_Status)'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      
        '        ON End_User_Customer.Customer = Sales_Invoice.End_User_C' +
        'ustomer'
      'WHERE'
      '('
      '((:UnFactored = '#39'Y'#39') AND (Factoring_Filename is NULL)) OR'
      '(:UnFactored = '#39'N'#39')'
      ') AND'
      '('
      '((Sales_Invoice.invoice_or_credit <> :Invoice_or_Credit) or'
      '(invoice_or_credit is null) or ('#39'X'#39' = :Invoice_or_Credit))'
      ') and'
      
        '((Sales_invoice.inv_to_Customer = :Customer) OR (:Customer = 0))' +
        ' AND'
      '((Sales_Invoice.Rep = :Rep) OR (:Rep = 0)) AND'
      '((Sales_Invoice.Sub_Rep = :Sub_Rep) OR (:Sub_Rep = 0)) AND'
      '((Sales_Invoice.Operator = :Operator) OR (:Operator = 0)) AND'
      '('
      '(Customer.Name Like :Code_From) or'
      '(Customer_branch.Account_code Like :Code_From)'
      ') AND'
      '('
      '(Sales_invoice.Sales_invoice_status < :Status) or'
      '(:Status = 0)'
      ') and'
      '('
      '((:Inactive = '#39'N'#39')  and (Sales_Invoice.Inactive is null )) or'
      '(:Inactive = '#39'Y'#39')'
      ') and'
      '(Invoice_description like :Invoice_Description) AND'
      '(Rep.Name like :Rep_Name) AND'
      '((ISNULL(Sub_Rep.Name,'#39#39') like :Sub_Rep_Name)) AND'
      '(Sales_Invoice_Status.Description like :Status_Name) AND'
      
        '((Sales_Invoice.Paid_Status = :Paid_Status) OR (:Paid_Status = '#39 +
        'A'#39'))'
      'ORDER BY Sales_Invoice.Sales_Invoice DESC')
    Left = 376
    Top = 8
    ParamData = <
      item
        Name = 'UnFactored'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Invoice_or_Credit'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Customer'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'Rep'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Code_From'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Inactive'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Invoice_Description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Rep_Name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Sub_Rep_Name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Status_Name'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Paid_Status'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qrySIHeaderGridInvoice_Date: TSQLTimeStampField
      FieldName = 'Invoice_Date'
      Origin = 'Invoice_Date'
    end
    object qrySIHeaderGridCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySIHeaderGridBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
      Required = True
    end
    object qrySIHeaderGridInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qrySIHeaderGridInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      Origin = 'Invoice_or_Credit'
      Size = 1
    end
    object qrySIHeaderGridCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Required = True
      Size = 100
    end
    object qrySIHeaderGridBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Origin = 'Branch_Name'
      Size = 50
    end
    object qrySIHeaderGridStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Required = True
      Size = 40
    end
    object qrySIHeaderGridInv_to_Customer: TIntegerField
      FieldName = 'Inv_to_Customer'
      Origin = 'Inv_to_Customer'
    end
    object qrySIHeaderGridInv_to_Branch: TIntegerField
      FieldName = 'Inv_to_Branch'
      Origin = 'Inv_to_Branch'
    end
    object qrySIHeaderGridAccount_Code: TWideStringField
      FieldName = 'Account_Code'
      Origin = 'Account_Code'
      Size = 10
    end
    object qrySIHeaderGridGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
      Origin = 'Goods_Value'
      Required = True
    end
    object qrySIHeaderGridVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
      Origin = 'Vat_Value'
      Required = True
    end
    object qrySIHeaderGridSales_Invoice_no: TWideStringField
      FieldName = 'Sales_Invoice_no'
      Origin = 'Sales_Invoice_no'
      Size = 15
    end
    object qrySIHeaderGridSales_invoice_status: TIntegerField
      FieldName = 'Sales_invoice_status'
      Origin = 'Sales_invoice_status'
      Required = True
    end
    object qrySIHeaderGridSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
      Origin = 'Sales_Invoice'
      Required = True
    end
    object qrySIHeaderGridSales_invoice_type: TWideStringField
      FieldName = 'Sales_invoice_type'
      Origin = 'Sales_invoice_type'
      Size = 1
    end
    object qrySIHeaderGridReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Size = 60
    end
    object qrySIHeaderGridInvoice_Description: TWideStringField
      FieldName = 'Invoice_Description'
      Origin = 'Invoice_Description'
      Size = 80
    end
    object qrySIHeaderGridfactoring_filename: TWideStringField
      FieldName = 'factoring_filename'
      Origin = 'factoring_filename'
      Size = 30
    end
    object qrySIHeaderGridfactoring_date: TSQLTimeStampField
      FieldName = 'factoring_date'
      Origin = 'factoring_date'
    end
    object qrySIHeaderGridpaid_status: TWideStringField
      FieldName = 'paid_status'
      Origin = 'paid_status'
      Size = 1
    end
    object qrySIHeaderGridcash_sales: TWideStringField
      FieldName = 'cash_sales'
      Origin = 'cash_sales'
      Size = 1
    end
    object qrySIHeaderGridrep: TIntegerField
      FieldName = 'rep'
      Origin = 'rep'
    end
    object qrySIHeaderGridSub_Rep: TIntegerField
      FieldName = 'Sub_Rep'
      Origin = 'Sub_Rep'
    end
    object qrySIHeaderGridAlt_Sales_Invoice_no: TWideStringField
      FieldName = 'Alt_Sales_Invoice_no'
      Origin = 'Alt_Sales_Invoice_no'
      Size = 15
    end
    object qrySIHeaderGridRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Origin = 'Rep_Name'
      Size = 40
    end
    object qrySIHeaderGridSub_Rep_Name: TWideStringField
      FieldName = 'Sub_Rep_Name'
      Origin = 'Sub_Rep_Name'
      Size = 40
    end
    object qrySIHeaderGridElectronic_Invoice: TWideStringField
      FieldName = 'Electronic_Invoice'
      Origin = 'Electronic_Invoice'
      Size = 1
    end
    object qrySIHeaderGridEnd_User_Name: TWideStringField
      FieldName = 'End_User_Name'
      Origin = 'End_User_Name'
      Size = 100
    end
    object qrySIHeaderGridPack_Format_Description: TWideStringField
      FieldName = 'Pack_Format_Description'
      Origin = 'Pack_Format_Description'
      ReadOnly = True
      Size = 50
    end
    object qrySIHeaderGridEnclosing_Type: TWideStringField
      FieldName = 'Enclosing_Type'
      Origin = 'Enclosing_Type'
      ReadOnly = True
    end
  end
  object qryOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Operator')
    Left = 528
    Top = 8
  end
  object dsOperator: TDataSource
    DataSet = qryOperator
    Left = 584
    Top = 8
  end
  object qryGetCustBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      '          Building_no_Name,'
      '          Street,'
      '          Locale,'
      '          Town,'
      '          Postcode,'
      '          Account_code'
      'from Customer_Branch'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no')
    Left = 304
    Top = 232
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_orderLine.Customers_Desc, Cust_Order_no'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Order_Line.Part, Part.Part_description'
      'from Sales_Order_Line, Part'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no and'
      'Sales_Order_line.Part = Part.Part')
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_invoice'
      'SET Goods_Value = :Goods_Value, '
      '        VAT_Value = :VAT_Value,'
      '        Operator = :Operator,'
      '        Customer = :Customer,'
      '        Branch_no = :Branch_no,'
      '        Sales_Invoice_Status = :Sales_Invoice_Status,'
      '        Invoice_Date = :Invoice_Date,'
      '        Currency_Code = :Currency_Code,'
      '        Inv_to_Customer = :Inv_to_Customer,'
      '        Inv_to_Branch = :Inv_To_Branch,'
      '        Sales_invoice_no = :Sales_Invoice_no,'
      '        Invoice_or_Credit = :Invoice_or_Credit,'
      '        Paid_Status = :Paid_Status, '
      '        Paid_Amount = :Paid_Amount,'
      '        Paid_Date = :Paid_date,'
      '        Narrative = :Narrative,'
      '        Sales_invoice_type = :Sales_Invoice_Type,'
      '        Inactive = :Inactive,'
      '        Period_End_run = :Period_End_Run,'
      '        Reference = :Reference,'
      '        Rep = :Rep,'
      '        Invoice_Description = :Invoice_Description,'
      '        Internal_Narrative = :Internal_Narrative,'
      '        Cash_Sales = :Cash_Sales,'
      '        Account_Number = :Account_Number,'
      '        Account_Month = :Account_Month,'
      '        Account_Year = :Account_Year,'
      '        Contact_no = :Contact_no,'
      '        Contact_Name = :Contact_Name,'
      '        Invoice_Location = :Invoice_Location,'
      '        Category = :Category,'
      '        Credit_Note_Reason = :Credit_Note_Reason,'
      '        Electronic_Invoice = :Electronic_Invoice,'
      '        Print_as_Delivery_Note = :Print_as_Delivery_Note,'
      '        Cust_Order_No = :Cust_Order_No,'
      '        Price_Unit = :Price_Unit,'
      '        Quantity = :Quantity,'
      '        Sub_Rep = :Sub_Rep,'
      '        End_User_Customer = :End_User_Customer,'
      '        End_User_Branch_No = :End_User_Branch_No,'
      '        Alt_Sales_Invoice_no = :Alt_Sales_Invoice_no'
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
        Name = 'Branch_no'
      end
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Inv_to_Customer'
      end
      item
        Name = 'Inv_to_Branch'
      end
      item
        Name = 'Sales_Invoice_no'
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
        DataType = ftDateTime
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Sales_invoice_type'
        DataType = ftString
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Period_End_run'
        DataType = ftString
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Invoice_Description'
        DataType = ftString
      end
      item
        Name = 'Internal_Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Cash_Sales'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Account_Number'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Account_Month'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Account_Year'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Contact_Name'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Invoice_Location'
        DataType = ftInteger
      end
      item
        Name = 'Category'
        DataType = ftInteger
      end
      item
        Name = 'Credit_Note_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Electronic_Invoice'
      end
      item
        Name = 'Print_as_Delivery_Note'
      end
      item
        Name = 'Cust_Order_No'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Quantity'
        DataType = ftFloat
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
      end
      item
        Name = 'End_User_Customer'
        DataType = ftInteger
      end
      item
        Name = 'End_User_Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Alt_Sales_Invoice_no'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryCustReps: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from VAT_Code'
      'where VAT_Code = :VAT_Code')
    Left = 472
    Top = 288
    ParamData = <
      item
        Name = 'VAT_Code'
      end>
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company')
    Left = 448
    Top = 232
  end
  object qryPOAllLines: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
      '        (select top 1 Date_deliv_actual'
      '         from Delivery_detail'
      
        '         where (Delivery_detail.Purchase_order = Purchase_OrderL' +
        'ine.purchase_order) and'
      
        '               (Delivery_detail.Line = Purchase_OrderLine.Line) ' +
        'and'
      '               (Delivery_detail.Qty_delivered <> 0)'
      
        '         order by Delivery_detail.date_deliv_actual desc, Delive' +
        'ry_detail.Delivery_no) as Last_delivery_date,'
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
      '         Purchase_order.Date_point,'
      '        (select top 1 Job_Bag_line_dets.Job_Bag'
      '         from Job_Bag_Line_dets'
      
        '         where Job_Bag_Line_dets.purchase_order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        '               Job_Bag_Line_dets.Line = Purchase_OrderLine.Line)' +
        ' as Job_Bag'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
  object qrySOAll: TFDQuery
    OnCalcFields = qrySOAllCalcFields
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Sales_Order.*,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      #9'(select distinct part_movement.date_received'
      #9'from part_movement'
      
        #9'where part_movement_reference LIKE '#39'SalesOrd: '#39'+convert(nvarcha' +
        'r(10),Sales_order.Sales_order)) as Pick_date,'
      #9'(select distinct top 1 purch_ord_line.date_Deliv_actual'
      #9'from purch_ord, purch_ord_line'
      #9'where Purch_ord.Sales_order = Sales_Order.Sales_order and'
      
        #9'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) as Delivery_d' +
        'ate'
      'from  Customer, Customer_Branch,'
      '      Sales_Order'
      'where'
      '(Sales_Order.Order_Type <> '#39'J'#39') and'
      '(Customer.Name Like :Code_From) AND'
      '(Sales_Order.Sales_Order_Head_Status >= 140) AND'
      '(Sales_Order.Sales_Order_Head_Status < 250) AND'
      '(Sales_Order.Customer = Customer.Customer) And'
      '('
      '(Sales_Order.Customer = Customer_Branch.Customer) AND'
      '(Sales_Order.Branch_no = Customer_Branch.Branch_no)'
      ') AND'
      '(select SUM(Quantity_delivered - Quantity_invoiced)'
      ' from Sales_order_line'
      
        ' where sales_order_line.sales_order = Sales_order.sales_order) >' +
        ' 0'
      'ORDER BY Sales_Order.Sales_Order desc'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 16
    Top = 152
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qrySOAllSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      Required = True
    end
    object qrySOAllOffice_Contact: TIntegerField
      FieldName = 'Office_Contact'
      Origin = 'Office_Contact'
      Required = True
    end
    object qrySOAllOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      Required = True
    end
    object qrySOAllDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qrySOAllDate_Ordered: TDateTimeField
      FieldName = 'Date_Ordered'
      Origin = 'Date_Ordered'
      Required = True
    end
    object qrySOAllCust_Order_No: TWideStringField
      FieldName = 'Cust_Order_No'
      Origin = 'Cust_Order_No'
      Required = True
      Size = 40
    end
    object qrySOAllCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySOAllBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
      Required = True
    end
    object qrySOAllContact_no: TIntegerField
      FieldName = 'Contact_no'
      Origin = 'Contact_no'
      Required = True
    end
    object qrySOAllCost_Centre: TWideStringField
      FieldName = 'Cost_Centre'
      Origin = 'Cost_Centre'
      Size = 10
    end
    object qrySOAllCustomer0: TIntegerField
      FieldName = 'Customer0'
      Origin = 'Customer0'
    end
    object qrySOAllSales_order_Head_Status: TIntegerField
      FieldName = 'Sales_order_Head_Status'
      Origin = 'Sales_order_Head_Status'
      Required = True
    end
    object qrySOAllNarrative: TIntegerField
      FieldName = 'Narrative'
      Origin = 'Narrative'
    end
    object qrySOAllPart_Store: TIntegerField
      FieldName = 'Part_Store'
      Origin = 'Part_Store'
      Required = True
    end
    object qrySOAllDelivery_Customer: TIntegerField
      FieldName = 'Delivery_Customer'
      Origin = 'Delivery_Customer'
    end
    object qrySOAllDelivery_Branch: TIntegerField
      FieldName = 'Delivery_Branch'
      Origin = 'Delivery_Branch'
    end
    object qrySOAllDiscount: TFloatField
      FieldName = 'Discount'
      Origin = 'Discount'
    end
    object qrySOAllAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'
      Origin = 'Ad_hoc_Address'
    end
    object qrySOAllDelivery_Notes: TWideStringField
      FieldName = 'Delivery_Notes'
      Origin = 'Delivery_Notes'
      Size = 255
    end
    object qrySOAllOrder_Type: TWideStringField
      FieldName = 'Order_Type'
      Origin = 'Order_Type'
      Required = True
      Size = 1
    end
    object qrySOAllReplenish_Source: TIntegerField
      FieldName = 'Replenish_Source'
      Origin = 'Replenish_Source'
    end
    object qrySOAllSupplier: TIntegerField
      FieldName = 'Supplier'
      Origin = 'Supplier'
    end
    object qrySOAllBranch_no0: TIntegerField
      FieldName = 'Branch_no0'
      Origin = 'Branch_no0'
    end
    object qrySOAllSupp_order_type: TWideStringField
      FieldName = 'Supp_order_type'
      Origin = 'Supp_order_type'
      Size = 4
    end
    object qrySOAllVat_Code: TIntegerField
      FieldName = 'Vat_Code'
      Origin = 'Vat_Code'
    end
    object qrySOAllProduction_Location: TIntegerField
      FieldName = 'Production_Location'
      Origin = 'Production_Location'
    end
    object qrySOAllAccount_Team: TIntegerField
      FieldName = 'Account_Team'
      Origin = 'Account_Team'
    end
    object qrySOAllDelivery_Contact_Name: TWideStringField
      FieldName = 'Delivery_Contact_Name'
      Origin = 'Delivery_Contact_Name'
      Size = 50
    end
    object qrySOAllCash_Sales: TWideStringField
      FieldName = 'Cash_Sales'
      Origin = 'Cash_Sales'
      Size = 1
    end
    object qrySOAllPayment_Transaction_ID: TIntegerField
      FieldName = 'Payment_Transaction_ID'
      Origin = 'Payment_Transaction_ID'
    end
    object qrySOAllinactive: TWideStringField
      FieldName = 'inactive'
      Origin = 'inactive'
      Size = 1
    end
    object qrySOAllinactive_date: TDateTimeField
      FieldName = 'inactive_date'
      Origin = 'inactive_date'
    end
    object qrySOAllinactive_reason: TIntegerField
      FieldName = 'inactive_reason'
      Origin = 'inactive_reason'
    end
    object qrySOAllOnline_Order_ID: TWideStringField
      FieldName = 'Online_Order_ID'
      Origin = 'Online_Order_ID'
    end
    object qrySOAllSub_Rep: TIntegerField
      FieldName = 'Sub_Rep'
      Origin = 'Sub_Rep'
    end
    object qrySOAllCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Required = True
      Size = 100
    end
    object qrySOAllBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Origin = 'Branch_Name'
      Size = 50
    end
    object qrySOAllPick_date: TDateTimeField
      FieldName = 'Pick_date'
      Origin = 'Pick_date'
      ReadOnly = True
    end
    object qrySOAllDelivery_date: TDateTimeField
      FieldName = 'Delivery_date'
      Origin = 'Delivery_date'
      ReadOnly = True
    end
  end
  object dsSOAll: TDataSource
    DataSet = qrySOAll
    Left = 88
    Top = 160
  end
  object qryJBAll: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag.*,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      '          (select count(Job_bag_Line) from Job_bag_line_dets'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      #9#9'  Job_bag_line_dets.Job_bag_line_type = '#39'P'#39' and'
      #9#9'  Job_bag_line_dets.Job_bag_line_sell > 0 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) as PO_Lines_to_invoice,'
      '          (select count(Job_bag_Line) from Job_bag_line_dets'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      
        #9#9'  ((Job_bag_line_dets.Job_bag_line_type = '#39'C'#39') or (Job_bag_lin' +
        'e_dets.Job_bag_line_type = '#39'R'#39')) and'
      #9#9'  Job_bag_line_dets.Job_bag_line_sell > 0 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) as Sundry_Lines_to_invoice,'
      '          (select count(Job_bag_Line) from Job_bag_line_dets'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      #9#9'  Job_bag_line_dets.Job_bag_line_type = '#39'A'#39' and'
      #9#9'  Job_bag_line_dets.Job_bag_line_sell > 0 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) as DMS_Lines_to_invoice,'
      
        '          (select count(Job_bag_Line) from Job_bag_line_dets, sa' +
        'les_order'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      #9#9'  Job_Bag_line_dets.sales_order = sales_order.sales_order and'
      #9#9'  sales_order.sales_order_head_Status >= 150 and'
      #9#9'  sales_order.sales_order_head_Status < 250 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) as Stock_lines_to_invoice'
      'from  Customer, Customer_Branch,'
      '      Job_Bag'
      'where'
      '(Job_Bag_Status <= 25) and'
      '((Job_Bag.Inactive is null) OR (Job_Bag.inactive <> '#39'Y'#39')) AND'
      '(Job_Bag.Ready_For_Invoicing = '#39'Y'#39') AND'
      '('
      '((select count(Job_bag_Line) from Job_bag_line_dets'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      #9#9'  Job_bag_line_dets.Job_bag_line_type = '#39'P'#39' and'
      #9#9'  Job_bag_line_dets.Job_bag_line_sell > 0 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) > 0) OR'
      '((select count(Job_bag_Line) from Job_bag_line_dets'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      
        #9#9'  ((Job_bag_line_dets.Job_bag_line_type = '#39'C'#39') or (Job_bag_lin' +
        'e_dets.Job_bag_line_type = '#39'R'#39')) and'
      #9#9'  Job_bag_line_dets.Job_bag_line_sell > 0 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) > 0) OR'
      '((select count(Job_bag_Line) from Job_bag_line_dets'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      #9#9'  Job_bag_line_dets.Job_bag_line_type = '#39'A'#39' and'
      #9#9'  Job_bag_line_dets.Job_bag_line_sell > 0 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) > 0) OR'
      '((select count(Job_bag_Line) from Job_bag_line_dets, sales_order'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd'
      #9#9'  Job_Bag_line_dets.sales_order = sales_order.sales_order and'
      #9#9'  sales_order.sales_order_head_Status >= 150 and'
      #9#9'  sales_order.sales_order_head_Status < 250 and'
      #9#9'  Job_bag_line_dets.Job_Bag_Line_Invoiced <> '#39'Y'#39' and'
      '      Job_Bag_line_Dets.Ready_to_invoice = '#39'Y'#39' and'
      
        #9#9'  ((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.In' +
        'active is NULL))) > 0)'
      ') AND'
      '(Customer.Name Like :Code_From) AND'
      '(Job_Bag.Customer = Customer.Customer) And'
      '('
      '(Job_Bag.Customer = Customer_Branch.Customer) AND'
      '(Job_Bag.Branch_no = Customer_Branch.Branch_no)'
      ')'
      'ORDER BY Job_Bag.Job_Bag desc')
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Sales_Order.*,'
      '        Customer.Name as Customer_Name,'
      '        Customer.Electronic_Invoice_Required,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Inv_to_Customer,'
      '        Customer_Branch.Inv_to_Branch,'
      '        InvCust.Name as InvCust_Name,'
      '        InvCustB.Name as InvBranch_Name,'
      '        InvCustB.Account_Code,'
      '        InvCust.Currency_code_Def,'
      '        (select top 1 Rep'
      '        from Sales_OrderRep'
      
        '        where Sales_orderRep.Sales_Order = Sales_Order.Sales_Ord' +
        'er) as Rep'
      'from  Customer,'
      '      Customer_Branch,'
      '      Customer InvCust,'
      '      Customer_Branch InvCustB,'
      '      Sales_Order'
      'where'
      '(Sales_Order.Sales_order = :Sales_order) and'
      '(Sales_Order.Customer = Customer.Customer) and'
      '('
      '(Sales_Order.Customer = Customer_Branch.Customer) AND'
      '(Sales_Order.Branch_no = Customer_Branch.Branch_no)'
      ') and'
      '(Customer_branch.Inv_to_Customer = InvCust.Customer) And'
      '('
      '(Customer_branch.Inv_to_Customer = InvCustB.Customer) AND'
      '(Customer_branch.Inv_to_Branch = InvCustB.Branch_no)'
      ')'
      ' ')
    Left = 16
    Top = 208
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object qrySOLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sales_Order_line.Sales_Order,'
      #9'Sales_Order_line.Sales_Order_line_no, '
      #9'Sales_Order_line.Part, '
      #9'Sales_Order_line.Sell_Pack_Quantity, '
      
        #9'(Sales_order_Line.Quantity_Delivered-Sales_order_Line.Quantity_' +
        'Invoiced) AS Invoice_Qty, '
      #9'Part.Vat_Code, '
      #9'Sales_Order_line.Part_Sales_Price, '
      
        #9'(Sales_order_line.Part_Sales_Price/Sales_order_line.Sell_Pack_Q' +
        'uantity) AS Unit_Price, '
      #9'Part.Part_Description, '
      #9'Vat_Code.Vat_Rate, '
      #9'Vat_Code.Description, '
      #9'Part.Price_Unit, '
      #9'Price_Unit.Description AS Price_unit_description, '
      #9'Price_Unit.Price_Unit_Factor,'
      '  Part.Sales_Nominal,'
      '  Part.Product_Type'
      'FROM Vat_Code '
      #9'INNER JOIN ((Price_Unit '
      #9'RIGHT JOIN Part ON'
      #9#9'Price_Unit.Price_Unit = Part.Price_Unit)'
      #9'INNER JOIN Sales_Order_line ON '
      #9#9'Part.Part = Sales_Order_line.Part) ON '
      #9#9'Vat_Code.Vat_Code = Part.Vat_Code'
      'WHERE'
      '(Sales_Order = :Sales_Order) and'
      '(Sales_Order_Line.Quantity_Delivered <> 0)'
      
        'ORDER BY Sales_Order_line.Sales_Order, Sales_Order_line.Sales_Or' +
        'der_line_no'
      ' '
      ' ')
    Left = 80
    Top = 208
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object qryJBHeader: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Job_Bag.*,'
      #9'      Customer.Name as Customer_Name,'
      '        Customer.Electronic_Invoice_Required,'
      #9'      Customer_Branch.Name as Branch_Name,'
      '        Customer.Customer_is_Acquired,'
      '        (select Customer.Name'
      '          from Customer'
      
        '        where Customer.Customer = Job_Bag.End_User_Customer) as ' +
        'End_User_Customer_Name,'
      '        InvCust.Name as InvCust_Name,'
      '        InvCust.Currency_code_Def,'
      '        InvCustB.Name as InvBranch_Name,'
      '        InvCustB.Account_Code,'
      '        InvCustB.Customer as Inv_to_Customer,'
      '        InvCustB.Branch_no as Inv_To_Branch'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Job_Bag_Line_Dets.Purchase_Order,'
      '        Job_Bag_Line_Dets.Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Reseller,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Invoiced,'
      '        Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '        Job_Bag_Line_Dets.VAT_Code,'
      '        Job_Bag_Line_Dets.Currency_Code,'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Quantity - Job_Bag_Line_Dets.' +
        'Qty_Invoiced) as JB_Qty_To_Invoice,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        (select sum(Delivery_Detail.Qty_Delivered)'
      '         from Delivery_Detail'
      
        '         where Delivery_detail.purchase_order = Job_bag_Line_det' +
        's.Purchase_Order and'
      
        '               Delivery_Detail.Line = Job_bag_Line_dets.Line) as' +
        ' Qty_Delivered,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Job_Bag_Line_Dets.Price_unit,'
      '        Job_Bag_Line_Dets.Selling_Price as Unit_Price,'
      '        Job_Bag_Line_Dets.Reseller_Price,'
      '        Job_Bag_Line_Dets.Sales_Order,'
      '        Job_Bag_Line_Dets.Sales_Order_Line_no,'
      '        Job_Bag_Line_Dets.Product_Type as JB_Product_Type,'
      '        (select Product_type'
      '         from Purchase_OrderLine'
      
        '         where Purchase_OrderLine.Purchase_Order = Job_Bag_Line_' +
        'Dets.Purchase_Order and'
      
        '               Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line)' +
        ' as Product_Type,'
      
        '        (Purchase_OrderLine.Quantity - Purchase_OrderLine.Qty_In' +
        'voiced) as Invoice_qty,'
      '        ISNULL((select sales_order.sales_order_head_status'
      '         from Sales_order'
      
        '         where Sales_Order.sales_Order = job_bag_line_dets.sales' +
        '_order),0) as Sales_Order_Head_Status,'
      '        Job_Bag_Line_Dets.Ready_to_invoice'
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
      ') AND'
      '(Job_bag_Line_dets.Job_Bag_line_type <> '#39'W'#39') and'
      '('
      '('
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced is null) or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'N'#39') or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'P'#39')'
      ') AND'
      
        '((Job_Bag_Line_Dets.Inactive = '#39'N'#39') or (Job_Bag_Line_Dets.Inacti' +
        've is NULL)) AND'
      '((ISNULL((select sales_order.sales_order_head_status'
      '         from Sales_order'
      
        '         where Sales_Order.sales_Order = job_bag_line_dets.sales' +
        '_order),0) = 0) OR'
      '(ISNULL((select sales_order.sales_order_head_status'
      '         from Sales_order'
      
        '         where Sales_Order.sales_Order = job_bag_line_dets.sales' +
        '_order),0) >= 150))'
      ')'
      
        'ORDER BY Job_Bag_Line_Dets.sequence_no, Job_Bag_Line_Dets.Job_Ba' +
        'g_Line')
    Left = 176
    Top = 264
    ParamData = <
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end>
  end
  object qryGetPType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_Type.Product_Type,'
      '        Product_type.Description,'
      '        Product_Type.Nominal,'
      '        Product_Type.Narrative,'
      '        Product_Type.category,'
      '        Category.Description as Category_Description,'
      '        Category.Invoice_Immediately,'
      '        Category.Use_Separate_Invoice_Seq,'
      '        Category.Inv_Narrative'
      'from Product_Type, Category'
      'where Product_Type = :Product_Type and'
      'Product_Type.Category = Category.Category')
    Left = 536
    Top = 384
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryPOChkStatus: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Sales_Order.Sales_Order_Head_Status,'
      '       (Select Sum(Quantity_Ordered - Quantity_Invoiced)'
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
    Left = 96
    Top = 60
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOUpHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Sales_Order_Head_Status = :Sales_Order_Head_Status'
      'where Sales_Order = :Sales_order')
    Left = 176
    Top = 56
    ParamData = <
      item
        Name = 'Sales_Order_Head_Status'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object qryJBUpLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Job_Bag_Line_Dets'
      'set Job_Bag_Line_Invoiced = :Job_Bag_Line_Invoiced,'
      '    Qty_Invoiced = isNull(Qty_Invoiced,0) + :Qty_Invoiced'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 16
    Top = 312
    ParamData = <
      item
        Name = 'Job_Bag_Line_Invoiced'
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'WHERE ((inactive = '#39'N'#39') OR (inactive IS NULL)) OR (Rep = :Rep)'
      'order by name')
    Left = 16
    Top = 360
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object dsRep: TDataSource
    DataSet = qryRep
    Left = 56
    Top = 360
  end
  object qryJBChkStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      
        '        ((Job_Bag_Line_dets.inactive = '#39'N'#39') or (Job_Bag_Line_Det' +
        's.inactive is NULL))) as Total_Lines,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      #9#9'((Job_Bag_Line_dets.Job_Bag_Line_invoiced <> '#39'Y'#39') and'
      '    (Job_Bag_Line_dets.Job_Bag_Line_invoiced <> '#39'C'#39')) and'
      
        '        ((Job_Bag_Line_dets.inactive = '#39'N'#39') or (Job_Bag_Line_Det' +
        's.inactive is NULL))) as Lines_Not_invoiced,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      '    (Job_bag_line_dets.Job_Bag_Line_type = '#39'P'#39') and'
      
        '        ((Job_Bag_Line_dets.inactive = '#39'N'#39') or (Job_Bag_Line_Det' +
        's.inactive is NULL))) as Total_POs,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      '    (Job_bag_line_dets.Job_Bag_Line_type = '#39'A'#39') and'
      
        '        ((Job_Bag_Line_dets.inactive = '#39'N'#39') or (Job_Bag_Line_Det' +
        's.inactive is NULL))) as Total_Sundries,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      '    (Job_bag_line_dets.Job_Bag_Line_type = '#39'S'#39') and'
      
        '        ((Job_Bag_Line_dets.inactive = '#39'N'#39') or (Job_Bag_Line_Det' +
        's.inactive is NULL))) as Total_SOs'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag'
      ''
      ''
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Order_Line.Part,'
      
        '      (Quantity_Delivered - Quantity_Invoiced) as Qty_Outstandin' +
        'g,'
      '      Sell_Pack_quantity,'
      '      Quantity_Ordered,'
      '      Quantity_Delivered,'
      '      Part_Sales_Price'
      'from Sales_Order_Line'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Dets.Job_Bag_Line_Descr, '
      '(Job_Bag_Quantity - isnull(Qty_Invoiced,0)) as Qty_Outstanding,'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purch_Ord_Line_Add_Chg.Purchase_Order,'
      '        Purch_Ord_Line_Add_Chg.Line,'
      '        Purch_Ord_Line_Add_Chg.Additional_charge,'
      '        Purch_Ord_Line_Add_Chg.Details,'
      '        Purch_Ord_Line_Add_Chg.Amount,'
      '        Purch_Ord_Line_Add_Chg.Quotation_Price,'
      '        Purchase_OrderLine.Customer,'
      '        Customer.VAT_Code_Def AS Def_VAT_Code,'
      '        Vat_Code.Vat_Rate as Def_VAT_Rate,'
      '        Product_Type.Nominal,'
      '        VAT.Vat_Rate,'
      '        VAT.Vat_Code'
      'FROM Vat_Code AS VAT'
      '      RIGHT JOIN (Vat_Code'
      '      INNER JOIN (Product_Type'
      '      INNER JOIN ((Purchase_OrderLine'
      '      INNER JOIN Customer ON'
      '        Purchase_OrderLine.Customer = Customer.Customer)'
      '      INNER JOIN Purch_Ord_Line_Add_Chg ON'
      
        '        (Purchase_OrderLine.Line = Purch_Ord_Line_Add_Chg.Line) ' +
        'AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_Add_' +
        'Chg.Purchase_Order)) ON'
      
        '        Product_Type.Product_Type = Purchase_OrderLine.Product_T' +
        'ype) ON'
      '        Vat_Code.Vat_Code = Customer.VAT_Code_Def) ON'
      '        VAT.Vat_Code = Purch_Ord_Line_Add_Chg.Vat_Code'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Purchase_OrderLine.Contact_no,'
      '        Customer_Branch.Name AS Branch_Name,'
      '        Customer.Name AS Customer_Name,'
      '        Customer.Electronic_invoice_required,'
      '        Vat_Code.VAT_Code,'
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
      '        job_bag_line_dets.Job_Bag_Line,'
      '        Purchase_Orderline.Cash_Sale,'
      '        Purchase_OrderLine.Cust_Order_No'
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
      '        Vat_Code.Vat_Code = Purchase_orderline.VAT_Code)'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    OnCalcFields = qrySCHeaderGridCalcFields
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Branch_no,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Sales_Invoice_Status.Description as Status_Description,'
      '        Customer_Branch.Inv_to_Customer,'
      '        Customer_Branch.Inv_to_Branch,'
      '        Customer_Branch.Account_code,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      '        Sales_invoice.Goods_Value * -1 as Goods_Credit,'
      '        Sales_invoice.Vat_Value * -1 as VAT_Credit,'
      '        Sales_Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Sales_invoice_type,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Invoice_Description,'
      '        sales_invoice.factoring_filename,'
      '        sales_invoice.factoring_date,'
      '        sales_invoice.paid_status,'
      '        sales_invoice.cash_sales,'
      '        sales_invoice.rep,'
      '        sales_invoice.Alt_Sales_Invoice_no,'
      '        Rep.Name as Rep_Name,'
      '        Sales_Invoice.Electronic_Invoice'
      'from Sales_Invoice,'
      '     Customer,'
      '     Customer_Branch,'
      '     Sales_Invoice_Status,'
      '     Rep'
      'where'
      '('
      '((:UnFactored = '#39'Y'#39') AND (Factoring_Filename is NULL)) OR'
      '(:UnFactored = '#39'N'#39')'
      ') AND'
      
        '((Sales_Invoice.invoice_or_credit = :Credit) or ('#39'X'#39' = :Credit))' +
        ' and'
      
        '((Sales_invoice.inv_to_Customer = :Customer) OR (:Customer = 0))' +
        ' AND'
      '((Sales_Invoice.Rep = :Rep) OR (:Rep = 0)) AND'
      '((Sales_Invoice.Sub_Rep = :Sub_Rep) OR (:Sub_Rep = 0)) AND'
      '((Sales_Invoice.Operator = :Operator) OR (:Operator = 0)) AND'
      '('
      '(Customer.Name Like :Code_From) or'
      '(Customer_branch.Account_code Like :Code_From)'
      ') AND'
      '('
      '(Sales_invoice.Sales_invoice_status < :Status) or'
      '(:Status = 0)'
      ') and'
      '('
      '((:Inactive = '#39'N'#39')  and (Sales_Invoice.Inactive is null )) or'
      '(:Inactive = '#39'Y'#39')'
      ') and'
      '(Invoice_description like :Invoice_Description) AND'
      '(Sales_invoice.inv_to_Customer = Customer.Customer) and'
      '('
      '(Sales_invoice.inv_to_Customer = Customer_Branch.Customer) and'
      '(Sales_invoice.inv_to_Branch = Customer_Branch.Branch_no)'
      ') and'
      
        '(Sales_invoice.Sales_invoice_Status = Sales_invoice_status.Sales' +
        '_invoice_Status) and'
      '(Sales_invoice.Rep = Rep.Rep)'
      'order by Sales_Invoice.Sales_Invoice desc')
    Left = 16
    Top = 448
    ParamData = <
      item
        Name = 'UnFactored'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Credit'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Code_From'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Inactive'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Invoice_Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qrySCHeaderGridInvoice_Date: TSQLTimeStampField
      FieldName = 'Invoice_Date'
      Origin = 'Invoice_Date'
    end
    object qrySCHeaderGridCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qrySCHeaderGridBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
      Required = True
    end
    object qrySCHeaderGridInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qrySCHeaderGridInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      Origin = 'Invoice_or_Credit'
      Size = 1
    end
    object qrySCHeaderGridCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Required = True
      Size = 100
    end
    object qrySCHeaderGridBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Origin = 'Branch_Name'
      Size = 50
    end
    object qrySCHeaderGridStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Required = True
      Size = 40
    end
    object qrySCHeaderGridInv_to_Customer: TIntegerField
      FieldName = 'Inv_to_Customer'
      Origin = 'Inv_to_Customer'
    end
    object qrySCHeaderGridInv_to_Branch: TIntegerField
      FieldName = 'Inv_to_Branch'
      Origin = 'Inv_to_Branch'
    end
    object qrySCHeaderGridAccount_code: TWideStringField
      FieldName = 'Account_code'
      Origin = 'Account_code'
      Size = 10
    end
    object qrySCHeaderGridGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
      Origin = 'Goods_Value'
      Required = True
    end
    object qrySCHeaderGridVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
      Origin = 'Vat_Value'
      Required = True
    end
    object qrySCHeaderGridGoods_Credit: TCurrencyField
      FieldName = 'Goods_Credit'
      Origin = 'Goods_Credit'
      ReadOnly = True
    end
    object qrySCHeaderGridVAT_Credit: TCurrencyField
      FieldName = 'VAT_Credit'
      Origin = 'VAT_Credit'
      ReadOnly = True
    end
    object qrySCHeaderGridSales_Invoice_no: TWideStringField
      FieldName = 'Sales_Invoice_no'
      Origin = 'Sales_Invoice_no'
      Size = 15
    end
    object qrySCHeaderGridSales_invoice_status: TIntegerField
      FieldName = 'Sales_invoice_status'
      Origin = 'Sales_invoice_status'
      Required = True
    end
    object qrySCHeaderGridSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
      Origin = 'Sales_Invoice'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySCHeaderGridSales_invoice_type: TWideStringField
      FieldName = 'Sales_invoice_type'
      Origin = 'Sales_invoice_type'
      Size = 1
    end
    object qrySCHeaderGridReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Size = 60
    end
    object qrySCHeaderGridInvoice_Description: TWideStringField
      FieldName = 'Invoice_Description'
      Origin = 'Invoice_Description'
      Size = 80
    end
    object qrySCHeaderGridfactoring_filename: TWideStringField
      FieldName = 'factoring_filename'
      Origin = 'factoring_filename'
      Size = 30
    end
    object qrySCHeaderGridfactoring_date: TSQLTimeStampField
      FieldName = 'factoring_date'
      Origin = 'factoring_date'
    end
    object qrySCHeaderGridpaid_status: TWideStringField
      FieldName = 'paid_status'
      Origin = 'paid_status'
      Size = 1
    end
    object qrySCHeaderGridcash_sales: TWideStringField
      FieldName = 'cash_sales'
      Origin = 'cash_sales'
      Size = 1
    end
    object qrySCHeaderGridrep: TIntegerField
      FieldName = 'rep'
      Origin = 'rep'
    end
    object qrySCHeaderGridAlt_Sales_Invoice_no: TWideStringField
      FieldName = 'Alt_Sales_Invoice_no'
      Origin = 'Alt_Sales_Invoice_no'
      Size = 15
    end
    object qrySCHeaderGridRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Origin = 'Rep_Name'
      Required = True
      Size = 40
    end
    object qrySCHeaderGridElectronic_Invoice: TWideStringField
      FieldName = 'Electronic_Invoice'
      Origin = 'Electronic_Invoice'
      Size = 1
    end
  end
  object dsSCHeaderGrid: TDataSource
    DataSet = qrySCHeaderGrid
    Left = 112
    Top = 424
  end
  object qrySOChgs: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_order, '
      '          Replenish_source, Cust_Order_No'
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
    ConnectionName = 'PB'
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
      '        Price_Unit.Description  as Sales_Unit_Desc,'
      '        Ready_To_Invoice,'
      '        Purchase_OrderLine.Purch_Ord_Line_Status,'
      '        (select top 1 Job_Bag_line_dets.Job_Bag'
      '         from Job_Bag_Line_dets'
      
        '         where Job_Bag_Line_dets.purchase_order = Purchase_Order' +
        'Line.Purchase_Order and'
      
        '               Job_Bag_Line_dets.Line = Purchase_OrderLine.Line)' +
        ' as Job_Bag'
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
      '        ((Purchase_OrderLine.Invoice_upfront)='#39'Y'#39')) OR'
      
        '        ((Purchase_OrderLine.Ready_To_Invoice = '#39'Y'#39') and (Purcha' +
        'se_OrderLine.Purch_Ord_Line_Status < 30)) OR'
      
        '        ((Purchase_OrderLine.Purch_Ord_Line_Status = 50) and (De' +
        'livery_Detail.Delivery_to_Stock <> '#39'Y'#39'))'
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
      '      Price_Unit.Description,'
      '      Ready_to_Invoice,'
      '      Purchase_OrderLine.Purch_Ord_Line_Status'
      'HAVING'
      
        '      (((Sum(Delivery_Detail.Qty_Delivered) - Purchase_orderline' +
        '.Qty_invoiced) > 0) OR'
      
        '        ((Purchase_OrderLine.Ready_To_Invoice = '#39'Y'#39') and (Purcha' +
        'se_OrderLine.Purch_Ord_Line_Status < 30))) AND'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from period'
      'where period = :period'
      'order by Period desc')
    Left = 96
    Top = 8
    ParamData = <
      item
        Name = 'period'
      end>
  end
  object qrySOAll_Access: TFDQuery
    OnCalcFields = qrySOAllCalcFields
    SQL.Strings = (
      'select Sales_Order.*,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      #9'(select distinct part_movement.date_received'
      #9'from part_movement'
      
        #9'where part_movement_reference LIKE '#39'SalesOrd: '#39'& Sales_order.Sa' +
        'les_order) as Pick_date,'
      #9'(select distinct purch_ord_line.date_Deliv_actual'
      #9'from purch_ord, purch_ord_line'
      #9'where Purch_ord.Sales_order = Sales_Order.Sales_order and'
      
        #9'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) as Delivery_d' +
        'ate'
      'from  Customer, Customer_Branch,'
      '      Sales_Order'
      'where'
      '(Customer.Name Like :Code_From) AND'
      '(Sales_Order.Sales_Order_Head_Status >= 150) AND'
      '(Sales_Order.Sales_Order_Head_Status < 250) AND'
      '(Sales_Order.Customer = Customer.Customer) And'
      '('
      '(Sales_Order.Customer = Customer_Branch.Customer) AND'
      '(Sales_Order.Branch_no = Customer_Branch.Branch_no)'
      ')'
      'ORDER BY Sales_Order.Sales_Order desc'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 168
    Top = 152
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end>
    object IntegerField7: TIntegerField
      FieldName = 'Sales_Order'
    end
    object IntegerField8: TIntegerField
      FieldName = 'Office_Contact'
    end
    object IntegerField9: TIntegerField
      FieldName = 'Operator'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Date_Required'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'Date_Ordered'
    end
    object StringField11: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 80
    end
    object IntegerField10: TIntegerField
      FieldName = 'Customer'
    end
    object IntegerField11: TIntegerField
      FieldName = 'Branch_no'
    end
    object IntegerField12: TIntegerField
      FieldName = 'Contact_no'
    end
    object StringField12: TStringField
      FieldName = 'Cost_Centre'
      FixedChar = True
    end
    object IntegerField13: TIntegerField
      FieldName = 'Customer0'
    end
    object StringField13: TStringField
      FieldName = 'Order_Type'
      FixedChar = True
      Size = 2
    end
    object IntegerField14: TIntegerField
      FieldName = 'Sales_order_Head_Status'
    end
    object IntegerField15: TIntegerField
      FieldName = 'Narrative'
    end
    object IntegerField16: TIntegerField
      FieldName = 'Part_Store'
    end
    object IntegerField17: TIntegerField
      FieldName = 'Delivery_Customer'
    end
    object IntegerField18: TIntegerField
      FieldName = 'Delivery_Branch'
    end
    object FloatField1: TFloatField
      FieldName = 'Discount'
    end
    object IntegerField19: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object StringField14: TStringField
      FieldName = 'Delivery_Notes'
      FixedChar = True
      Size = 200
    end
    object IntegerField20: TIntegerField
      FieldName = 'Replenish_Source'
    end
    object IntegerField21: TIntegerField
      FieldName = 'Supplier'
    end
    object IntegerField22: TIntegerField
      FieldName = 'Branch_no0'
    end
    object StringField15: TStringField
      FieldName = 'Supp_order_type'
      FixedChar = True
      Size = 8
    end
    object StringField16: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object StringField17: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'Pick_date'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'Delivery_date'
    end
    object DateField1: TDateField
      FieldKind = fkCalculated
      FieldName = 'Actual_Delivery_Date'
      Calculated = True
    end
  end
  object qryGetCustContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'contact_info.Contact_Name,'
      'contact_info.Account_Month,'
      'contact_info.Account_Year,'
      'contact_info.Account_Number,'
      'contact_info.Pays_Online'
      'from customer_contact'
      
        'inner join contact_info on customer_contact.contact_info = conta' +
        'ct_info.contact_info'
      'where customer = :customer '
      'and branch_no = :branch_no '
      'and contact_no = :contact_no '
      ' ')
    Left = 236
    Top = 216
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'contact_no'
      end>
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Operator'
      'where Operator = :Operator')
    Left = 536
    Top = 432
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qrySOLinePart: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Sales_Order_Line.Part,'
      '  Part.Price_unit, Part.Part_Description, Part.Product_Type'
      'from Sales_Order_Line, Part'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no and'
      'sales_order_line.Part = Part.Part'
      ' '
      '')
    Left = 672
    Top = 384
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qrySpare: TFDQuery
    ConnectionName = 'PB'
    Left = 112
    Top = 376
  end
  object qryCheckJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Job_Bag_line'
      'from Job_Bag_line_Dets'
      'where Purchase_Order = :Purchase_Order AND'
      'Line = :Line')
    Left = 656
    Top = 8
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetPOLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity,'
      '        Sum(Qty_Delivered) as Qty_Delivered'
      'FROM Purchase_orderLine, Delivery_Detail'
      'WHERE Purchase_Orderline.Purchase_Order = :Purchase_Order AND'
      '      Purchase_Orderline.Line = :Line AND'
      '      ('
      
        '      (Purchase_Orderline.Purchase_Order = Delivery_Detail.Purch' +
        'ase_Order) and'
      '      (Purchase_Orderline.line = Delivery_Detail.Line)'
      '      )'
      'GROUP BY Purchase_OrderLine.Purchase_order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity')
    Left = 672
    Top = 152
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryPOUpLineStatus: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Purchase_OrderLine'
      'set Purch_Ord_Line_Status = :Purch_Ord_Line_Status'
      'where Purchase_Order = :Purchase_Order AND'
      '      Line = :Line'
      ' ')
    Left = 240
    Top = 104
    ParamData = <
      item
        Name = 'Purch_Ord_Line_Status'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetJBLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Job_Bag, Job_Bag_Line, Job_Bag_Quantity, Qty_Invoiced'
      'from Job_Bag_Line_dets'
      'where Job_Bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line')
    Left = 672
    Top = 200
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryJBUpLineStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Job_Bag_Line_Dets'
      'set Job_Bag_Line_Invoiced = :Job_Bag_Line_Invoiced'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 672
    Top = 256
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
  object oldqryJBAll: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag.*,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      '          (select count(Job_bag_Line) from Job_bag_line_dets'
      
        '            where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag an' +
        'd Job_bag_line_dets.Job_bag_line_sell > 0) as invoice_lines'
      'from  Customer, Customer_Branch,'
      '      Job_Bag'
      'where'
      '(Job_Bag_Status <= 25) and'
      '((Job_Bag.Inactive is null) OR (Job_Bag.inactive <> '#39'Y'#39')) AND'
      '(Job_Bag.Ready_For_Invoicing = '#39'Y'#39') AND'
      '((select count(Job_bag_Line) from Job_bag_line_dets'
      
        ' where Job_Bag_line_dets.job_bag = Job_bag.Job_Bag and Job_bag_l' +
        'ine_dets.Job_bag_line_sell > 0) > 0) AND'
      '(Customer.Name Like :Code_From) AND'
      '(Job_Bag.Customer = Customer.Customer) And'
      '('
      '(Job_Bag.Customer = Customer_Branch.Customer) AND'
      '(Job_Bag.Branch_no = Customer_Branch.Branch_no)'
      ')'
      'ORDER BY Job_Bag.Job_Bag desc'
      '')
    Left = 16
    Top = 496
    ParamData = <
      item
        Name = 'Code_From'
      end>
  end
  object qryGetCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *,'
      '(select Payment_Terms_Description'
      ' from Payment_Terms'
      
        ' where Payment_Terms.Payment_terms = Customer.Payment_Terms) as ' +
        'Payment_Terms_Description'
      'from Customer'
      'where customer = :customer')
    Left = 672
    Top = 336
    ParamData = <
      item
        Name = 'customer'
      end>
  end
  object qrySOCheckJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Job_Bag_line'
      'from Job_Bag_line_Dets'
      'where Sales_Order = :Sales_Order AND'
      'Sales_order_Line_no = :Sales_order_Line_no')
    Left = 728
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_Line_no'
      end>
  end
  object qryInvoiceLoc: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Invoice_Location'
      
        'WHERE ((inactive = '#39'N'#39') or (inactive IS NULL)) or (Invoice_locat' +
        'ion = :Invoice_Location)'
      'Order by Invoice_Location_Descr')
    Left = 112
    Top = 488
    ParamData = <
      item
        Name = 'Invoice_Location'
      end>
  end
  object dsInvoiceLoc: TDataSource
    DataSet = qryInvoiceLoc
    Left = 192
    Top = 488
  end
  object qryCheckJBPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag'
      'from Job_Bag_Line_dets'
      'where'
      '('
      '(Purchase_Order = :Purchase_Order) or'
      '(Sales_Order = :Sales_Order)'
      ')')
    Left = 304
    Top = 488
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetInvoiceLoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Invoice_Location')
    Left = 384
    Top = 488
  end
  object qryGetDefaultInvLoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Invoice_Location'
      'where Default_PM_Revenue_Centre = '#39'Y'#39)
    Left = 488
    Top = 488
  end
  object qryCustJBL: TFDQuery
    ConnectionName = 'PB'
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
      
        '        (Job_Bag_Line_Dets.Job_Bag_Quantity - Job_Bag_Line_Dets.' +
        'Qty_Invoiced) as JB_Qty_To_Invoice,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Job_Bag_Line_Dets.Price_unit,'
      '        Job_Bag_Line_Dets.Sequence_no,'
      '        Job_Bag_Line_Dets.Selling_Price as Unit_Price,'
      '        Job_Bag_Line_Dets.Sales_Order,'
      '        Job_Bag_Line_Dets.Sales_Order_Line_no,'
      '        Job_Bag_Line_Dets.Product_Type as JB_Product_Type,'
      '        (select Product_type'
      '         from Purchase_OrderLine'
      
        '         where Purchase_OrderLine.Purchase_Order = Job_Bag_Line_' +
        'Dets.Purchase_Order and'
      
        '               Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line)' +
        ' as Product_Type,'
      
        '        (Purchase_OrderLine.Quantity - Purchase_OrderLine.Qty_In' +
        'voiced) as Invoice_qty,'
      '        ISNULL((select sales_order.sales_order_head_status'
      '         from Sales_order'
      
        '         where Sales_Order.sales_Order = job_bag_line_dets.sales' +
        '_order),0) as Sales_Order_Head_Status'
      'FROM Job_Bag'
      '    INNER JOIN (Vat_Code'
      '    INNER JOIN (Purchase_OrderLine'
      
        '    RIGHT JOIN Job_Bag_Line_Dets ON (Purchase_OrderLine.Line = J' +
        'ob_Bag_Line_Dets.Line)'
      
        '      AND (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets' +
        '.Purchase_Order))'
      
        '      ON Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) ON Job_' +
        'Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag'
      'WHERE Job_Bag.customer = :customer and'
      '('
      '(((Purchase_OrderLine.purch_ord_line_status < 30) and'
      '(Purchase_OrderLine.Inactive <> '#39'Y'#39') or'
      '(Purchase_orderLine.Inactive is null)) or'
      'Job_Bag_Line_Dets.Purchase_order is null)'
      ') AND'
      '(Job_bag_Line_dets.Job_Bag_line_type <> '#39'W'#39') and'
      '('
      '('
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced is null) or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'N'#39') or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'P'#39')'
      ') AND'
      '(Job_Bag_Line_Dets.Ready_to_Invoice = '#39'Y'#39') AND'
      '((ISNULL((select sales_order.sales_order_head_status'
      '         from Sales_order'
      
        '         where Sales_Order.sales_Order = job_bag_line_dets.sales' +
        '_order),0) = 0) OR'
      '(ISNULL((select sales_order.sales_order_head_status'
      '         from Sales_order'
      
        '         where Sales_Order.sales_Order = job_bag_line_dets.sales' +
        '_order),0) >= 150))'
      ')'
      
        'ORDER BY Job_Bag_Line_Dets.Job_Bag desc, Job_Bag_Line_Dets.seque' +
        'nce_no, Job_Bag_Line_Dets.Job_Bag_Line')
    Left = 176
    Top = 432
    ParamData = <
      item
        Name = 'customer'
      end>
  end
  object dsCustJBL: TDataSource
    DataSet = qryCustJBL
    Left = 232
    Top = 432
  end
  object qryGetCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Category'
      'where Category = :Category')
    Left = 672
    Top = 440
    ParamData = <
      item
        Name = 'Category'
      end>
  end
  object qryGetJBInvLoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Invoice_Location'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 656
    Top = 72
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryCreditReason: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Credit_Note_Reason'
      'order by Credit_Note_Reason_Descr')
    Left = 640
    Top = 504
  end
  object dtsCreditReason: TDataSource
    DataSet = qryCreditReason
    Left = 696
    Top = 504
  end
  object qrySIGetLastLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Invoice_Line_No) as Last_Sales_Invoice_Line'
      'from Sales_Invoice_Line'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 752
    Top = 336
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryJBChkStockReq: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_stock_request, Sales_Order_line'
      #9'where Job_Bag_stock_request.Job_Bag = Job_Bag.Job_bag and'
      
        '        Job_Bag_stock_request.Sales_Order = Sales_Order_Line.Sal' +
        'es_Order and'
      
        '        Job_Bag_stock_request.Sales_Order_line_no = Sales_Order_' +
        'Line.Sales_Order_Line_no) as Total_Lines,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_stock_request, Sales_Order_Line, Sales_Order'
      #9'where Job_Bag_stock_request.Job_Bag = Job_Bag.Job_bag and'
      
        '        Job_Bag_stock_request.Sales_Order = Sales_Order_Line.Sal' +
        'es_Order and'
      
        '        Job_Bag_stock_request.Sales_Order_line_no = Sales_Order_' +
        'Line.Sales_Order_Line_no and'
      
        '        Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order a' +
        'nd'
      '        Sales_Order.Sales_Order_Head_Status <= 200 and'
      
        '        Job_Bag_Stock_Request.Included_in_Charges <> '#39'Y'#39') as UnR' +
        'econciled_Lines,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_stock_request, Sales_Order_Line, Sales_Order'
      #9'where Job_Bag_stock_request.Job_Bag = Job_Bag.Job_bag and'
      
        '        Job_Bag_stock_request.Sales_Order = Sales_Order_Line.Sal' +
        'es_Order and'
      
        '        Job_Bag_stock_request.Sales_Order_line_no = Sales_Order_' +
        'Line.Sales_Order_Line_no and'
      
        '        Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order a' +
        'nd'
      
        '        Sales_Order.Sales_Order_Head_Status >= 200) as Invoiced_' +
        'Lines'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 576
    Top = 232
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryUpEInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Invoice'
      'set Electronic_Invoice = :Electronic_Invoice,'
      'Invoice_Description = :Invoice_Description,'
      'Cust_Order_No = :Cust_Order_No,'
      'Print_as_Delivery_Note = :Print_as_Delivery_Note'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 744
    Top = 128
    ParamData = <
      item
        Name = 'Electronic_Invoice'
      end
      item
        Name = 'Invoice_Description'
      end
      item
        Name = 'Cust_Order_No'
      end
      item
        Name = 'Print_as_Delivery_Note'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryJBHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Cust_Order_no'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 600
    Top = 432
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qrySIUpStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Invoice'
      'set Sales_Invoice_Status = :Sales_Invoice_Status'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 744
    Top = 72
    ParamData = <
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryPOUpRep: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Purchase_OrderLine'
      'set Rep = :Rep'
      'where Purchase_Order = :Purchase_Order AND'
      '      Line = :Line'
      ' ')
    Left = 840
    Top = 16
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryJBUpRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_bag'
      'Set Rep = :Rep'
      'where Job_Bag = :Job_Bag')
    Left = 840
    Top = 64
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qrySODelRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Sales_OrderRep'
      'Where Sales_Order = :Sales_Order')
    Left = 840
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOUpRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Sales_OrderRep'
      'values (:Sales_Order, :Rep, 0)')
    Left = 840
    Top = 176
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Rep'
      end>
  end
  object qrySIAddDetail: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Invoice_Detail'
      '  (Sales_Invoice,'
      '   Sales_Invoice_Detail_no,'
      '   Qty_Invoiced,'
      '   Total_Goods_Value,'
      '   Total_VAT_Value,'
      '   Total_Cost_Value,'
      '   VAT_Code,'
      '   Sales_order,'
      '   Sales_order_Line_no)'
      'values'
      '  (:Sales_Invoice,'
      '   :Sales_Invoice_Detail_no,'
      '   :Qty_Invoiced,'
      '   :Total_Goods_Value,'
      '   :Total_VAT_Value,'
      '   :Total_Cost_Value,'
      '   :VAT_Code,'
      '   :Sales_order,'
      '   :Sales_order_Line_no)'
      '')
    Left = 304
    Top = 552
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Sales_Invoice_Detail_no'
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Total_Goods_Value'
      end
      item
        Name = 'Total_VAT_Value'
      end
      item
        Name = 'Total_Cost_Value'
      end
      item
        Name = 'VAT_Code'
      end
      item
        Name = 'Sales_order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_order_Line_no'
        DataType = ftInteger
      end>
  end
  object qrySIGetLastDetail: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Sales_Invoice_Detail_No) as Last_Sales_Invoice_Detail'
      'from Sales_Invoice_Detail'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 840
    Top = 336
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qrySIAllDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Sales_order.Sales_Order,'
      '  sales_order_line.sales_order_line_no,'
      '  sales_order_line.part,'
      '  sales_order_line.part_cost,'
      '  sales_order_line.Purch_Pack_Quantity,'
      '  sales_order_line.part_sales_price,'
      '  sales_order_line.sell_pack_quantity,'
      '  sales_order_line.quantity_ordered,'
      '  sales_order_line.quantity_delivered,'
      '  sales_order.date_ordered,'
      '  sales_order.cust_order_no,'
      '  sales_order.delivery_customer,'
      '  sales_order.delivery_branch,'
      '  sales_order.ad_hoc_address,'
      '  sales_order.customer,'
      '  sales_order.delivery_customer,'
      '  part.part_description,'
      '  part.Part_Cost_Cat,'
      '  Customer.Name as Customer_Name,'
      '  Customer_Branch.Name as Branch_Name,'
      '  Customer_Branch.Short_Code,'
      '  Customer.name + '#39'/'#39' + Customer_branch.Name as OrderedBy,'
      '  (select Customer.Name'
      '  from Customer'
      
        '  where Customer.Customer = Sales_order.delivery_customer) as De' +
        'liveryCustName,'
      '  (select Customer_Branch.Name'
      '  from Customer_Branch'
      
        '  where Customer_Branch.Customer = Sales_order.delivery_customer' +
        ' and'
      
        '           Customer_Branch.Branch_no = Sales_order.delivery_bran' +
        'ch) as DeliveryBranchName,'
      '  sales_order.date_required,'
      '  sales_order_delivery.Delivery_Date,'
      '  sales_order.cost_centre,'
      '  Vat_Code.Vat_Rate'
      'FROM Vat_Code'
      '      INNER JOIN ((((Customer'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Sales_Order'
      
        '        ON (Customer_Branch.Branch_no = Sales_Order.Branch_no) A' +
        'ND (Customer_Branch.Customer = Sales_Order.Customer))'
      '      LEFT JOIN Sales_Order_Delivery'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Delivery.Sales_' +
        'Order)'
      '      INNER JOIN ((Part'
      '      INNER JOIN Sales_Order_line'
      '        ON Part.Part = Sales_Order_line.Part)'
      '      INNER JOIN Sales_Invoice_Detail'
      
        '        ON (Sales_Order_line.Sales_Order_line_no = Sales_Invoice' +
        '_Detail.Sales_Order_Line_no) AND (Sales_Order_line.Sales_Order =' +
        ' Sales_Invoice_Detail.Sales_Order))'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_line.Sales_Orde' +
        'r)'
      '        ON Vat_Code.Vat_Code = Sales_Order_line.vat_code'
      'WHERE Sales_invoice = :Sales_Invoice'
      
        'ORDER BY Sales_Invoice_Detail.Sales_Order, SAles_Invoice_Detail.' +
        'Sales_Order_line_no')
    Left = 16
    Top = 544
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qrySOAllUninvoiced: TFDQuery
    OnCalcFields = qrySOAllCalcFields
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Sales_Order.*,'
      '          Customer.Name as Customer_Name,'
      '          Customer_Branch.Name as Branch_Name,'
      #9'(select distinct part_movement.date_received'
      #9'from part_movement'
      
        #9'where part_movement_reference LIKE '#39'SalesOrd: '#39'+convert(nvarcha' +
        'r(10),Sales_order.Sales_order)) as Pick_date,'
      #9'(select distinct top 1 purch_ord_line.date_Deliv_actual'
      #9'from purch_ord, purch_ord_line'
      #9'where Purch_ord.Sales_order = Sales_Order.Sales_order and'
      
        #9'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) as Delivery_d' +
        'ate'
      'from  Customer, Customer_Branch,'
      '      Sales_Order'
      'where'
      '(Sales_Order.Order_Type <> '#39'J'#39') and'
      '(Customer.Name Like :Code_From) AND'
      '(Sales_Order.Sales_Order_Head_Status >= 140) AND'
      '(Sales_Order.Sales_Order_Head_Status < 250) AND'
      '(Sales_Order.Customer = Customer.Customer) And'
      '('
      '(Sales_Order.Customer = Customer_Branch.Customer) AND'
      '(Sales_Order.Branch_no = Customer_Branch.Branch_no)'
      ')'
      'ORDER BY Sales_Order.Sales_Order desc'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 232
    Top = 152
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end>
    object IntegerField23: TIntegerField
      FieldName = 'Sales_Order'
    end
    object IntegerField24: TIntegerField
      FieldName = 'Office_Contact'
    end
    object IntegerField25: TIntegerField
      FieldName = 'Operator'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'Date_Required'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'Date_Ordered'
    end
    object StringField18: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 80
    end
    object IntegerField26: TIntegerField
      FieldName = 'Customer'
    end
    object IntegerField27: TIntegerField
      FieldName = 'Branch_no'
    end
    object IntegerField28: TIntegerField
      FieldName = 'Contact_no'
    end
    object StringField19: TStringField
      FieldName = 'Cost_Centre'
      FixedChar = True
    end
    object IntegerField29: TIntegerField
      FieldName = 'Customer0'
    end
    object StringField20: TStringField
      FieldName = 'Order_Type'
      FixedChar = True
      Size = 2
    end
    object IntegerField30: TIntegerField
      FieldName = 'Sales_order_Head_Status'
    end
    object IntegerField31: TIntegerField
      FieldName = 'Narrative'
    end
    object IntegerField32: TIntegerField
      FieldName = 'Part_Store'
    end
    object IntegerField33: TIntegerField
      FieldName = 'Delivery_Customer'
    end
    object IntegerField34: TIntegerField
      FieldName = 'Delivery_Branch'
    end
    object FloatField2: TFloatField
      FieldName = 'Discount'
    end
    object IntegerField35: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object StringField21: TStringField
      FieldName = 'Delivery_Notes'
      FixedChar = True
      Size = 200
    end
    object IntegerField36: TIntegerField
      FieldName = 'Replenish_Source'
    end
    object IntegerField37: TIntegerField
      FieldName = 'Supplier'
    end
    object IntegerField38: TIntegerField
      FieldName = 'Branch_no0'
    end
    object StringField22: TStringField
      FieldName = 'Supp_order_type'
      FixedChar = True
      Size = 8
    end
    object StringField23: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object StringField24: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'Pick_date'
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'Delivery_date'
    end
    object DateField2: TDateField
      FieldKind = fkCalculated
      FieldName = 'Actual_Delivery_Date'
      Calculated = True
    end
  end
  object qryPriceUnits: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Price_unit '
      'Order by Description')
    Left = 784
    Top = 504
  end
  object dtsPriceUnits: TDataSource
    DataSet = qryPriceUnits
    Left = 864
    Top = 504
  end
  object qrySOUpdDelQty: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Order_Line'
      'SET Quantity_Deleted = :Quantity_Deleted'
      'WHERE Sales_Order_Line.Sales_Order = :Sales_Order AND'
      'Sales_Order_Line.Sales_Order_Line_no = :Sales_Order_Line_no')
    Left = 840
    Top = 240
    ParamData = <
      item
        Name = 'Quantity_Deleted'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qrySOUnDoLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Order_Line'
      'SET Quantity_Deleted = 0'
      'FROM Sales_Invoice_Line'
      'WHERE Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice AND'
      '('
      
        '(Sales_invoice_Line.Sales_Order = Sales_Order_Line.Sales_Order) ' +
        'AND'
      
        '(Sales_invoice_Line.Sales_Order_line_no = Sales_Order_Line.Sales' +
        '_Order_line_no)'
      ')')
    Left = 848
    Top = 400
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryUpPaidStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Invoice'
      'SET Paid_Status = :Paid_Status,'
      '    Paid_Amount = :Paid_Amount,'
      '    Paid_Date = :Paid_Date'
      'WHERE Sales_Invoice = :Sales_Invoice')
    Left = 648
    Top = 560
    ParamData = <
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
        Name = 'Sales_Invoice'
      end>
  end
  object qrySubRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Rep'
      'Where (Rep_Is_Sub_Rep = '#39'Y'#39') AND'
      '     ((inactive = '#39'N'#39') OR (inactive IS NULL)) OR (Rep = :Rep)'
      'order by name')
    Left = 16
    Top = 406
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object dsSubRep: TDataSource
    DataSet = qrySubRep
    Left = 56
    Top = 406
  end
  object OldqrySIHeaderGrid: TFDQuery
    OnCalcFields = qrySIHeaderGridCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP 2000'
      #9#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Branch_no,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Sales_Invoice_Status.Description as Status_Description,'
      '        Customer_Branch.Inv_to_Customer,'
      '        Customer_Branch.Inv_to_Branch,'
      '        Customer_Branch.Account_Code,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      '        Sales_Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Sales_invoice_type,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Invoice_Description,'
      '        sales_invoice.factoring_filename,'
      '        sales_invoice.factoring_date,'
      '        sales_invoice.paid_status,'
      '        sales_invoice.cash_sales,'
      '        sales_invoice.rep,'
      '        sales_invoice.Sub_Rep,'
      '        rep.name as Rep_Name,'
      #9#9'    Sub_Rep.name as Sub_Rep_Name,'
      '        Sales_Invoice.Electronic_Invoice'
      'FROM Rep AS Sub_Rep '
      #9#9'RIGHT JOIN ((Sales_Invoice_Status '
      #9#9'INNER JOIN (Customer '
      #9#9'INNER JOIN (Customer_Branch '
      #9#9'INNER JOIN Sales_Invoice '
      
        #9#9#9'ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch) ' +
        'AND (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer))'
      #9#9#9'ON Customer.Customer = Customer_Branch.Customer) '
      
        #9#9#9'ON Sales_Invoice_Status.Sales_Invoice_Status = Sales_Invoice.' +
        'Sales_Invoice_Status) '
      #9#9'LEFT JOIN Rep '
      #9#9#9'ON Sales_Invoice.Rep = Rep.Rep) '
      #9#9#9'ON Sub_Rep.Rep = Sales_Invoice.Sub_Rep'
      'WHERE'
      '('
      '((:UnFactored = '#39'Y'#39') AND (Factoring_Filename is NULL)) OR'
      '(:UnFactored = '#39'N'#39')'
      ') AND'
      '('
      '((Sales_Invoice.invoice_or_credit <> :Invoice_or_Credit) or'
      '(invoice_or_credit is null) or ('#39'X'#39' = :Invoice_or_Credit))'
      ') and'
      
        '((Sales_invoice.inv_to_Customer = :Customer) OR (:Customer = 0))' +
        ' AND'
      '((Sales_Invoice.Rep = :Rep) OR (:Rep = 0)) AND'
      '((Sales_Invoice.Sub_Rep = :Sub_Rep) OR (:Sub_Rep = 0)) AND'
      '((Sales_Invoice.Operator = :Operator) OR (:Operator = 0)) AND'
      '('
      '(Customer.Name Like :Code_From) or'
      '(Customer_branch.Account_code Like :Code_From)'
      ') AND'
      '('
      '(Sales_invoice.Sales_invoice_status < :Status) or'
      '(:Status = 0)'
      ') and'
      '('
      '((:Inactive = '#39'N'#39')  and (Sales_Invoice.Inactive is null )) or'
      '(:Inactive = '#39'Y'#39')'
      ') and'
      '(Invoice_description like :Invoice_Description) AND'
      '(Rep.Name like :Rep_Name) AND'
      '((ISNULL(Sub_Rep.Name,'#39#39') like :Sub_Rep_Name)) AND'
      '(Sales_Invoice_Status.Description like :Status_Name) AND'
      
        '((Sales_Invoice.Paid_Status = :Paid_Status) OR (:Paid_Status = '#39 +
        'A'#39'))'
      'ORDER BY Sales_Invoice.Sales_Invoice DESC')
    Left = 376
    Top = 64
    ParamData = <
      item
        Name = 'UnFactored'
        DataType = ftString
      end
      item
        Name = 'UnFactored'
        DataType = ftString
      end
      item
        Name = 'Invoice_or_Credit'
      end
      item
        Name = 'Invoice_or_Credit'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Operator'
      end
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
        Name = 'Invoice_Description'
        DataType = ftString
      end
      item
        Name = 'Rep_Name'
        DataType = ftString
      end
      item
        Name = 'Sub_Rep_Name'
        DataType = ftString
      end
      item
        Name = 'Status_Name'
      end
      item
        Name = 'Paid_Status'
      end
      item
        Name = 'Paid_Status'
      end>
    object DateTimeField10: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object IntegerField39: TIntegerField
      FieldName = 'Customer'
    end
    object IntegerField40: TIntegerField
      FieldName = 'Branch_no'
    end
    object StringField25: TStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object StringField26: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object StringField27: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object StringField28: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object StringField29: TStringField
      FieldName = 'Status_Description'
      FixedChar = True
      Size = 80
    end
    object IntegerField41: TIntegerField
      FieldName = 'Inv_to_Customer'
    end
    object IntegerField42: TIntegerField
      FieldName = 'Inv_to_Branch'
    end
    object CurrencyField4: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object CurrencyField5: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object StringField30: TStringField
      FieldName = 'Sales_Invoice_no'
      FixedChar = True
      Size = 30
    end
    object IntegerField43: TIntegerField
      FieldName = 'Sales_invoice_status'
    end
    object IntegerField44: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object StringField31: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Invoice_Status'
      Size = 30
      Calculated = True
    end
    object CurrencyField6: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total_Value'
      currency = False
      Calculated = True
    end
    object StringField32: TStringField
      FieldName = 'Sales_invoice_type'
      FixedChar = True
      Size = 2
    end
    object StringField33: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object StringField34: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object StringField35: TStringField
      FieldName = 'factoring_filename'
      FixedChar = True
      Size = 60
    end
    object DateTimeField11: TDateTimeField
      FieldName = 'factoring_date'
    end
    object StringField36: TStringField
      FieldName = 'paid_status'
      FixedChar = True
      Size = 2
    end
    object StringField37: TStringField
      FieldName = 'cash_sales'
      FixedChar = True
      Size = 2
    end
    object StringField38: TStringField
      FieldKind = fkCalculated
      FieldName = 'Paid_status_Description'
      Calculated = True
    end
    object IntegerField45: TIntegerField
      FieldName = 'rep'
    end
    object StringField39: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object StringField40: TStringField
      FieldKind = fkCalculated
      FieldName = 'Invoice_Format'
      Size = 10
      Calculated = True
    end
    object StringField41: TStringField
      FieldName = 'Electronic_Invoice'
      Size = 0
    end
    object StringField42: TStringField
      FieldName = 'Account_Code'
    end
    object StringField43: TStringField
      FieldName = 'Sub_Rep_Name'
      Size = 50
    end
  end
  object qryCheckInvoice: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Select Sales_Invoice, Sales_invoice_No'
      'from Sales_Invoice'
      'where Sales_Invoice_No = :Sales_Invoice_No AND'
      'Sales_Invoice_no <> '#39' '#39' AND'
      'Sales_Invoice <> :Sales_Invoice AND'
      'Sales_Invoice.Inactive <> '#39'Y'#39)
    Left = 744
    Top = 192
    ParamData = <
      item
        Name = 'Sales_Invoice_No'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
end
