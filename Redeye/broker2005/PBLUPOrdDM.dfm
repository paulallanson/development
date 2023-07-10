object dmLookUpPOrd: TdmLookUpPOrd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 57
  Top = 130
  Height = 479
  Width = 741
  object DetsSRC: TDataSource
    DataSet = DummySQL
    Left = 16
    Top = 16
  end
  object NullSRC: TDataSource
    Left = 16
    Top = 88
  end
  object SelectedSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Purchase_Order.Purchase_Order,'
      '       Purchase_Order.Supplier,'
      '       Purchase_Order.Branch_No,'
      '       Supplier.Name as Supp_Name,'
      '       Supplier_Branch.Name as Branch_Name,'
      '       Purchase_Order.Date_Point,'
      '       Purchase_Order.Contact_No,'
      '       Purchase_Order.Purch_Ord_Inv_Method,'
      '       Purchase_Order.Date_Point,'
      '       Purch_Ord_Head_Status.Description as Status_Descr,'
      '       Purch_Ord_Head_Status.Purch_Ord_Head_Status,'
      '       Purchase_Order.Currency_Code,'
      '       Purchase_Order.Office_Contact'
      
        'From  Purchase_Order, Supplier, Supplier_Branch, Purch_Ord_Head_' +
        'Status'
      'Where (Purchase_Order.Purchase_Order = :Purchase_Order) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier_Branch.Branch_No = Purchase_Order.Branch_No) and'
      
        '      (Purch_Ord_Head_Status.Purch_Ord_Head_Status = Purchase_Or' +
        'der.Purch_Ord_Head_Status) '
      ''
      ' '
      ' ')
    Left = 88
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object GetContactSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Supplier_BranchContacts.Name as Contact_Name'
      'From  Supplier_BranchContacts'
      'Where (Supplier_BranchContacts.Contact_No = :Contact_No) and'
      '      (Supplier_BranchContacts.Supplier = :Supplier) and'
      '      (Supplier_BranchContacts.Branch_No = :Branch_No)')
    Left = 168
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object GetDetsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 500 Purchase_Order.Date_Point,'
      '        Purch_Ord_Line_Status.Description AS Status_Description,'
      '        Supplier.Name AS Supp_Name,'
      '        Purchase_OrderLine.Suppliers_Desc,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Enquiry,'
      '        Purchase_OrderLine.Line0,'
      '        Purchase_OrderLine.Goods_Required,'
      '        Customer.Name AS Cust_Name,'
      '        Purchase_Order.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Form_Reference.Form_Reference_ID,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Quantity,'
      '        Customer_Branch.Account_Code AS Customer_Account_Code,'
      '        Supplier_Branch.Account_Code AS Supplier_Account_Code,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Order_Price,'
      '        (select Description'
      '        from Price_unit'
      
        '        where Price_unit.Price_Unit = Purchase_orderLine.Order_U' +
        'nit) AS Ordering_unit,'
      '        Price_Unit.Description AS Selling_Unit,'
      '        Purchase_OrderLine.Purch_Ord_Line_Status,'
      '        Purchase_OrderLine.Proof_Revision,'
      '        Purchase_OrderLine.On_Hold,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Purchase_Order.Operator,'
      '        Purchase_OrderLine.Rep,'
      '        job_bag_Line_dets.job_bag,'
      '        Purchase_OrderLine.Goods_Reqd_by_Customer,'
      '        Purchase_OrderLine.Original_Order'
      'FROM (Supplier'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN Purchase_Order ON'
      '        (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '        (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ' +
        'ON'
      '        Supplier.Supplier = Purchase_Order.Supplier)'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Purch_Ord_Line_Status'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Customer'
      
        '      INNER JOIN (Purchase_OrderLine left join job_bag_Line_dets' +
        ' on((Purchase_OrderLine.Purchase_Order = job_bag_Line_dets.Purch' +
        'ase_Order) and (Purchase_OrderLine.Line = job_bag_Line_dets.Line' +
        '))) ON'
      '        Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      
        '        Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_O' +
        'rderLine.Purch_Ord_Line_Status) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      ' '
      ' '
      ' '
      ' ')
    Left = 88
    Top = 16
    object GetDetsSQLDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object GetDetsSQLStatus_Description: TStringField
      FieldName = 'Status_Description'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLSupp_Name: TStringField
      FieldName = 'Supp_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLSuppliers_Desc: TStringField
      FieldName = 'Suppliers_Desc'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLEnquiry: TIntegerField
      FieldName = 'Enquiry'
    end
    object GetDetsSQLLine0: TIntegerField
      FieldName = 'Line0'
    end
    object GetDetsSQLCust_Name: TStringField
      FieldName = 'Cust_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object GetDetsSQLLine: TIntegerField
      FieldName = 'Line'
    end
    object GetDetsSQLForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object GetDetsSQLCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object GetDetsSQLQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object GetDetsSQLCustomer_Account_Code: TStringField
      FieldName = 'Customer_Account_Code'
      FixedChar = True
    end
    object GetDetsSQLSupplier_Account_Code: TStringField
      FieldName = 'Supplier_Account_Code'
      FixedChar = True
    end
    object GetDetsSQLSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object GetDetsSQLOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object GetDetsSQLOrdering_unit: TStringField
      FieldName = 'Ordering_unit'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLSelling_Unit: TStringField
      FieldName = 'Selling_Unit'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object GetDetsSQLStatus_Descr: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status_Descr'
      OnGetText = GetDetsSQLStatus_DescrGetText
      Size = 50
      Calculated = True
    end
    object GetDetsSQLProof_Revision: TStringField
      FieldName = 'Proof_Revision'
      FixedChar = True
      Size = 40
    end
    object GetDetsSQLOn_Hold: TStringField
      FieldName = 'On_Hold'
      FixedChar = True
      Size = 2
    end
    object GetDetsSQLGoods_Required: TDateTimeField
      FieldName = 'Goods_Required'
    end
    object GetDetsSQLBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object GetDetsSQLBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object GetDetsSQLOperator: TIntegerField
      FieldName = 'Operator'
    end
    object GetDetsSQLRep: TIntegerField
      FieldName = 'Rep'
    end
    object GetDetsSQLjob_bag: TIntegerField
      FieldName = 'job_bag'
    end
    object GetDetsSQLGoods_Reqd_by_Customer: TDateTimeField
      FieldName = 'Goods_Reqd_by_Customer'
    end
    object GetDetsSQLOriginal_Order: TFloatField
      FieldName = 'Original_Order'
    end
  end
  object SelectedLineSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Purchase_OrderLine.*,'
      '          Customer.Name as Cust_Name,'
      '          Customer_Branch.Branch_no,'
      '          Customer_Branch.name as Branch_name'
      'from Purchase_orderline, Customer, Customer_Branch'
      'where'
      '('
      '(Purchase_order = :Purchase_Order) and'
      '(Line = :Line)'
      ') and'
      '(Purchase_orderline.Customer = Customer.Customer) and'
      '('
      '(Purchase_orderline.Customer = Customer_Branch.Customer) and'
      '(Purchase_orderline.Branch_no = Customer_Branch.Branch_no)'
      ')'
      '          '
      ' ')
    Left = 168
    Top = 152
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
  object OlderDummySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1000'
      '    Purchase_Order.Date_Point,'
      '    Purchase_orderline.Purch_Ord_Line_Status,'
      '    Purch_Ord_Line_Status.Description AS Status_Descr,'
      '    Supplier.Name AS Supp_Name,'
      '    Purchase_OrderLine.Suppliers_Desc,'
      '    Purchase_OrderLine.Customers_Desc,'
      '    Purchase_OrderLine.Enquiry,'
      '    Purchase_OrderLine.Line0,'
      '    Customer.Name AS Cust_Name,'
      '    Purchase_Order.Purchase_Order,'
      '    Purchase_OrderLine.Line,'
      '    Form_Reference.Form_Reference_ID,'
      '    Purchase_OrderLine.Cust_Order_No,'
      '    Purchase_OrderLine.Quantity,'
      '    Customer_Branch.Account_Code AS Customer_Account_Code,'
      '    Supplier_Branch.Account_Code AS Supplier_Account_Code,'
      '    Purchase_OrderLine.Selling_Price,'
      '    Purchase_OrderLine.Order_Price,'
      '    (select Description from Price_unit'
      
        '        where Price_unit.Price_Unit = Purchase_orderLine.Order_U' +
        'nit) AS Ordering_unit,'
      '    Price_Unit.Description as Selling_Unit'
      'FROM Price_Unit'
      '    INNER JOIN ((Supplier'
      '    INNER JOIN (Supplier_Branch'
      '    INNER JOIN Purchase_Order'
      '      ON(Supplier_Branch.Supplier = Purchase_Order.Supplier)'
      
        '      AND (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)' +
        ')'
      '      ON Supplier.Supplier = Purchase_Order.Supplier)'
      '    INNER JOIN (Customer_Branch'
      '    INNER JOIN (Purch_Ord_Line_Status'
      '    INNER JOIN (Form_Reference'
      '    RIGHT JOIN (Customer'
      '    INNER JOIN Purchase_OrderLine'
      '      ON Customer.Customer = Purchase_OrderLine.Customer)'
      
        '      ON Form_Reference.Form_Reference = Purchase_OrderLine.Form' +
        '_Reference)'
      
        '      ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_' +
        'OrderLine.Purch_Ord_Line_Status)'
      
        '      ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_' +
        'no)'
      
        '      AND (Customer_Branch.Customer = Purchase_OrderLine.Custome' +
        'r))'
      
        '      ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purc' +
        'hase_Order)'
      '      ON Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit'
      'where')
    Left = 280
    Top = 16
  end
  object GetCustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select distinct Customer.Name as Customer_Name,'
      '                       Customer.Customer'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Account_Code LIKE :Code_From) or'
      #9'(Customer.Name LIKE :Code_From)) and'
      'Customer.Customer = Customer_Branch.Customer')
    Left = 280
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code_From'
        ParamType = ptUnknown
      end>
  end
  object OldDummySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1000'
      '    Purchase_Order.Date_Point,'
      '    Purch_Ord_Line_Status.Description AS Status_Description,'
      '    Supplier.Name AS Supp_Name,'
      '    Purchase_OrderLine.Suppliers_Desc,'
      '    Purchase_OrderLine.Customers_Desc,'
      '    Purchase_OrderLine.Enquiry,'
      '    Purchase_OrderLine.Line0,'
      '    Customer.Name AS Cust_Name,'
      '    Purchase_Order.Purchase_Order,'
      '    Purchase_OrderLine.Line,'
      '    Form_Reference.Form_Reference_ID,'
      '    Purchase_OrderLine.Cust_Order_No,'
      '    Purchase_OrderLine.Quantity,'
      '    Customer_Branch.Account_Code AS Customer_Account_Code,'
      '    Supplier_Branch.Account_Code AS Supplier_Account_Code,'
      '    Purchase_OrderLine.Selling_Price,'
      '    Purchase_OrderLine.Order_Price,'
      '    (select Description'
      '        from Price_unit'
      
        '        where Price_unit.Price_Unit = Purchase_orderLine.Order_U' +
        'nit) AS Ordering_unit,'
      '    Price_Unit.Description AS Selling_Unit,'
      '    Sales_Invoice_Line.Sales_Invoice,'
      '    (select Sales_Invoice_no'
      '        from Sales_invoice'
      
        '        where Sales_invoice.Sales_invoice = Sales_invoice_Line.S' +
        'ales_invoice) as Sales_invoice_no,'
      '    Purchase_OrderLine.Purch_Ord_Line_Status'
      'FROM ((Supplier'
      '    INNER JOIN (Supplier_Branch'
      '    INNER JOIN Purchase_Order ON'
      
        '        (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) A' +
        'ND'
      '        (Supplier_Branch.Supplier = Purchase_Order.Supplier)) ON'
      '        Supplier.Supplier = Purchase_Order.Supplier)'
      '    INNER JOIN (Customer_Branch'
      '    INNER JOIN (Purch_Ord_Line_Status'
      '    INNER JOIN (Price_Unit'
      '    INNER JOIN (Form_Reference'
      '    RIGHT JOIN (Customer'
      '    INNER JOIN Purchase_OrderLine ON'
      '        Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      
        '        Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_O' +
        'rderLine.Purch_Ord_Line_Status) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order)'
      '    LEFT JOIN Sales_Invoice_Line ON'
      '        (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.' +
        'Purchase_Order)'
      'Where'
      ' ')
    Left = 280
    Top = 80
  end
  object DummySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 500 Purchase_Order.Date_Point,'
      '        Purch_Ord_Line_Status.Description AS Status_Description,'
      '        Supplier.Name AS Supp_Name,'
      '        Purchase_OrderLine.Suppliers_Desc,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Enquiry,'
      '        Purchase_OrderLine.Line0,'
      '        Purchase_OrderLine.Goods_Required,'
      '        Customer.Name AS Cust_Name,'
      '        Purchase_Order.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Form_Reference.Form_Reference_ID,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Quantity,'
      '        Customer_Branch.Account_Code AS Customer_Account_Code,'
      '        Supplier_Branch.Account_Code AS Supplier_Account_Code,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Order_Price,'
      '        (select Description'
      '        from Price_unit'
      
        '        where Price_unit.Price_Unit = Purchase_orderLine.Order_U' +
        'nit) AS Ordering_unit,'
      '        Price_Unit.Description AS Selling_Unit,'
      '        Purchase_OrderLine.Purch_Ord_Line_Status,'
      '        Purchase_OrderLine.Proof_Revision,'
      '        Purchase_OrderLine.On_Hold,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Purchase_Order.Operator,'
      '        Purchase_OrderLine.Rep,'
      '        job_bag_Line_dets.job_bag,'
      '        Purchase_OrderLine.Goods_Reqd_by_Customer,'
      '        Purchase_OrderLine.Original_Order'
      'FROM (Supplier'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN Purchase_Order ON'
      '        (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '        (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ' +
        'ON'
      '        Supplier.Supplier = Purchase_Order.Supplier)'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Purch_Ord_Line_Status'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Customer'
      
        '      INNER JOIN (Purchase_OrderLine left join job_bag_Line_dets' +
        ' on((Purchase_OrderLine.Purchase_Order = job_bag_Line_dets.Purch' +
        'ase_Order) and (Purchase_OrderLine.Line = job_bag_Line_dets.Line' +
        '))) ON'
      '        Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      
        '        Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_O' +
        'rderLine.Purch_Ord_Line_Status) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      'where '
      ' '
      ' '
      ' ')
    Left = 288
    Top = 264
  end
  object qryInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Sales_invoice_no'
      'from Sales_Invoice_line, Sales_invoice '
      'where '
      '('
      '(Sales_invoice_Line.Purchase_order = :Purchase_Order) and'
      '(Sales_invoice_Line.Line = :Line)'
      ') and'
      '(Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice)')
    Left = 168
    Top = 208
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
  object UpdSelectedLineSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'set Purchase_OrderLine.On_Hold = :On_Hold'
      'where'
      '('
      '(Purchase_order = :Purchase_Order) and'
      '(Line = :Line)'
      ')')
    Left = 88
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'On_Hold'
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
      end>
  end
  object qryFindCustBranch: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Customer,'
      '         Customer.Name as Customer_Name,'
      '         Customer_Branch.Branch_No,'
      '         Customer_Branch.Name as Branch_Name,'
      '         Customer_Branch.Account_Code              '
      
        'from     Customer Join Customer_Branch on (Customer.Customer = C' +
        'ustomer_Branch.Customer)'
      'where    (Customer_Branch.Account_Code = :SearchCode);')
    Left = 280
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SearchCode'
        ParamType = ptUnknown
      end>
  end
  object qryperiodEnd: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_profit'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line')
    Left = 168
    Top = 256
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
