object dtmdlOrders: TdtmdlOrders
  OnCreate = DataModuleCreate
  Height = 480
  Width = 696
  object qryOrders: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'SELECT TOP (:Records) '
      '  Purchase_OrderLine.Customer,'
      '  Customer.Name,'
      '  Purchase_OrderLine.Purchase_Order AS Sales_order,'
      '  Purchase_OrderLine.Line AS Line,'
      '  Purchase_Order.Date_Point AS Order_date,'
      '  Purchase_OrderLine.Cust_Order_No,'
      '  Purchase_OrderLine.Customers_Desc AS Description,'
      '  Purchase_OrderLine.Quantity,'
      '  Purchase_OrderLine.Order_Price,'
      '  Order_unit.Price_Unit_Factor AS Order_unit,'
      '  Purchase_OrderLine.Selling_Price,'
      '  Selling_unit.Price_Unit_Factor AS Selling_unit,'
      '  Form_Reference.Stock_Reference,'
      '  Form_Reference.Form_Reference_ID,'
      '  Purchase_OrderLine.Goods_Required,'
      '  '#39'PO'#39' AS Order_type,'
      '  Purch_Ord_Line_Status.Purch_Ord_Line_Status AS Order_Status,'
      '  Purch_Ord_Line_Status.Description AS Status_Description,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Purchase_OrderLine.On_Hold,'
      '  Purchase_OrderLine.Proof_Revision,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Authorised_By,'
      '  Supplier.Name as Supplier_Name,'
      '  job_bag_line_dets.job_bag,'
      '  Purchase_OrderLine.Description_Reference,'
      '  0 as Rep,'
      '  '#39#39' as Rep_Name,'
      '  0 as Operator,'
      '  '#39#39' as Operator_Name,'
      '  Original_order,'
      '  Purchase_Orderline.Inactive,'
      '  Purchase_Orderline.Supp_Inv_Recd,'
      '  Purchase_Order.Needs_Authorising,'
      '  Purchase_OrderLine.Purchase_Order AS Order_Number'
      'FROM Supplier'
      '      INNER JOIN (Purchase_Order'
      '      INNER JOIN ((Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Purch_Ord_Line_Status'
      '      INNER JOIN (Price_Unit AS Order_unit'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Price_Unit AS Selling_unit'
      '      INNER JOIN Purchase_OrderLine '
      
        '      left join job_bag_line_dets on ((Purchase_OrderLine.Purcha' +
        'se_Order = job_bag_line_dets.Purchase_Order) and'
      '         (Purchase_OrderLine.line = job_bag_line_dets.line))'
      
        '      ON Selling_unit.Price_Unit = Purchase_OrderLine.Sell_Unit)' +
        ' ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      
        '        Order_unit.Price_Unit = Purchase_OrderLine.Order_Unit) O' +
        'N'
      
        '        Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_O' +
        'rderLine.Purch_Ord_Line_Status) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      '        Supplier.Supplier = Purchase_Order.Supplier'
      
        'WHERE ((Purchase_orderline.Customer = :Customer) or (0 = :Custom' +
        'er)) and'
      '      Purchase_orderline.Customers_desc Like :Description'
      '')
    Left = 16
    Top = 40
    ParamData = <
      item
        Name = 'RECORDS'
        DataType = ftInteger
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
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryOrdersCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
    end
    object qryOrdersName: TWideStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 100
    end
    object qryOrdersSales_order: TFloatField
      FieldName = 'Sales_order'
      Origin = 'Sales_order'
      Required = True
    end
    object qryOrdersLine: TIntegerField
      FieldName = 'Line'
      Origin = 'Line'
      Required = True
    end
    object qryOrdersOrder_date: TDateTimeField
      FieldName = 'Order_date'
      Origin = 'Order_date'
      Required = True
    end
    object qryOrdersCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      Origin = 'Cust_Order_No'
      Size = 50
    end
    object qryOrdersDescription: TStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 80
    end
    object qryOrdersQuantity: TFloatField
      FieldName = 'Quantity'
      Origin = 'Quantity'
    end
    object qryOrdersOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
      Origin = 'Order_Price'
    end
    object qryOrdersOrder_unit: TFloatField
      FieldName = 'Order_unit'
      Origin = 'Order_unit'
      Required = True
    end
    object qryOrdersSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
      Origin = 'Selling_Price'
    end
    object qryOrdersSelling_unit: TFloatField
      FieldName = 'Selling_unit'
      Origin = 'Selling_unit'
      Required = True
    end
    object qryOrdersStock_Reference: TWideStringField
      FieldName = 'Stock_Reference'
      Origin = 'Stock_Reference'
      Size = 25
    end
    object qryOrdersForm_Reference_ID: TWideStringField
      FieldName = 'Form_Reference_ID'
      Origin = 'Form_Reference_ID'
      Size = 50
    end
    object qryOrdersGoods_Required: TDateTimeField
      FieldName = 'Goods_Required'
      Origin = 'Goods_Required'
    end
    object qryOrdersOrder_type: TStringField
      FieldName = 'Order_type'
      Origin = 'Order_type'
      ReadOnly = True
      Required = True
      Size = 2
    end
    object qryOrdersOrder_Status: TIntegerField
      FieldName = 'Order_Status'
      Origin = 'Order_Status'
      Required = True
    end
    object qryOrdersStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Size = 40
    end
    object qryOrdersBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Origin = 'Branch_Name'
      Size = 50
    end
    object qryOrdersOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Origin = 'On_Hold'
      Size = 1
    end
    object qryOrdersProof_Revision: TWideStringField
      FieldName = 'Proof_Revision'
      Origin = 'Proof_Revision'
    end
    object qryOrdersSupplier: TIntegerField
      FieldName = 'Supplier'
      Origin = 'Supplier'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrdersSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      Origin = 'Supplier_Name'
      Required = True
      Size = 100
    end
    object qryOrdersjob_bag: TIntegerField
      FieldName = 'job_bag'
      Origin = 'job_bag'
    end
    object qryOrdersDescription_Reference: TWideStringField
      FieldName = 'Description_Reference'
      Origin = 'Description_Reference'
      Size = 30
    end
    object qryOrdersRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'Rep'
      ReadOnly = True
      Required = True
    end
    object qryOrdersRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Origin = 'Rep_Name'
      ReadOnly = True
      Required = True
      Size = 1
    end
    object qryOrdersOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      ReadOnly = True
      Required = True
    end
    object qryOrdersOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      ReadOnly = True
      Required = True
      Size = 1
    end
    object qryOrdersOriginal_order: TFloatField
      FieldName = 'Original_order'
      Origin = 'Original_order'
    end
    object qryOrdersInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qryOrdersSupp_Inv_Recd: TWideStringField
      FieldName = 'Supp_Inv_Recd'
      Origin = 'Supp_Inv_Recd'
      Required = True
      Size = 1
    end
    object qryOrdersNeeds_Authorising: TWideStringField
      FieldName = 'Needs_Authorising'
      Origin = 'Needs_Authorising'
      Size = 1
    end
    object qryOrdersOrder_Number: TFloatField
      FieldName = 'Order_Number'
      Origin = 'Order_Number'
      Required = True
    end
    object qryOrdersAuthorised_By: TIntegerField
      FieldName = 'Authorised_By'
    end
  end
  object dtsOrders: TDataSource
    DataSet = qryOrders
    Left = 72
    Top = 40
  end
  object qrySOrders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP (:Records)'
      #9'sales_order.customer,'
      '                Customer.Name,'
      #9'sales_order_line.sales_order,'
      '                sales_order_Line.sales_order_Line_no as Line,'
      #9'sales_order.date_ordered as Order_date, '
      #9'sales_order.cust_order_no,'
      #9'Part_Description as Description,'
      #9'sales_order_line.quantity_ordered as Quantity,'
      #9'sales_order_line.part_cost as order_price,'
      #9'sales_order_line.purch_pack_quantity as order_unit,'#9
      #9'sales_order_line.part_sales_price as selling_price, '
      #9'sales_order_line.sell_pack_quantity as selling_unit,'
      #9'sales_order_line.Part as Stock_Reference, '
      #9'(select top 1 form_Reference.Form_Reference_ID'
      '   from Form_Reference'
      
        '   where Form_Reference.stock_reference = sales_order_line.part)' +
        ' as Form_Reference_id,'
      #9'sales_order.Date_Required as Goods_Required,'
      '  Replenish_Source.Replenish_id as Order_Type,'
      '  Sales_order.Sales_order_Head_Status as Order_status,'
      '  Sales_order_Head_status.Description as Status_Description,'
      '  Customer_Branch.Name as Branch_Name,'
      '  Customer_Branch.Account_Code,'
      '  '#39'N'#39' as On_Hold,'
      '  '#39'No Proof'#39' as Proof_Revision,'
      '  Sales_order.Supplier,'
      '  (select Supplier.Name'
      '   from Supplier'
      
        '   where Sales_order.Supplier = Supplier.Supplier) as Supplier_n' +
        'ame,'
      '--  (select top 1 job_bag_stock_request.job_bag'
      '--    from job_bag_stock_request'
      
        '--    where sales_order.sales_order = job_bag_stock_request.sale' +
        's_order) as job_bag,'
      '   NULL as job_bag,'
      '   '#39#39' as Description_Reference,'
      '   Sales_OrderRep.Rep,'
      '   Rep.Name as Rep_Name,'
      '   Sales_Order.Operator,'
      '   Operator.Name as Operator_Name,'
      '   0 as original_order,'
      '   '#39'N'#39' as Inactive,'
      '   '#39'N'#39' as Supp_Inv_Recd,'
      '   '#39'N'#39' as Needs_Authorising,'
      '   0 as Authorised_By,'
      #9'  sales_order_line.sales_order as Order_Number,'
      '   '#39'N'#39' as Proof_Required,'
      '   0 as NCA_Live_lines,'
      '   0 as NCA_Signed_Off,'
      '   0 as Customer_Rep,'
      '   Sales_Order.Office_Contact,'
      '   '#39#39' as Office_Contact_Name'
      'from  sales_order_line,'
      '      part,'
      '      sales_order,'
      '      Customer_Branch,'
      '      sales_order_head_status,'
      '      Replenish_Source,'
      '      Customer,'
      '      Sales_OrderRep,'
      '      Rep,'
      '      Operator'
      
        'where ((Sales_order.customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '  Customer.Customer = Sales_order.customer and'
      '  Part.Part_Description Like :Description and'
      #9'Sales_order_line.Part = Part.Part and'
      #9'sales_order_line.sales_order = sales_order.sales_order and'
      '  ('
      '  (Sales_order.Customer = Customer_Branch.Customer) and'
      '  (Sales_order.Branch_no = Customer_Branch.Branch_no)'
      '  ) and'
      
        '  Sales_Order.Sales_order_Head_status = Sales_order_Head_status.' +
        'Sales_order_Head_status AND'
      
        '  Sales_Order.Replenish_Source = Replenish_Source.Replenish_Sour' +
        'ce AND'
      '  Sales_Order.Operator = Operator.Operator AND'
      '  Sales_Order.Sales_Order = Sales_OrderRep.Sales_Order AND'
      '  Sales_OrderRep.Rep = Rep.Rep'
      ''
      '')
    Left = 152
    Top = 40
    ParamData = <
      item
        Name = 'RECORDS'
        DataType = ftInteger
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
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryPOrders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP (:Records) '
      '  Purchase_OrderLine.Customer,'
      '  Customer.Name,'
      '  Purchase_OrderLine.Purchase_Order AS Sales_order,'
      '  Purchase_OrderLine.Line AS Line,'
      '  Purchase_Order.Date_Point AS Order_date,'
      '  Purchase_OrderLine.Alt_Purchase_Order,'
      '  Purchase_OrderLine.Cust_Order_No,'
      '  Purchase_OrderLine.Customers_Desc AS Description,'
      '  Purchase_OrderLine.Quantity,'
      '  Purchase_OrderLine.Order_Price,'
      '  Order_unit.Price_Unit_Factor AS Order_unit,'
      '  Purchase_OrderLine.Selling_Price,'
      '  Selling_unit.Price_Unit_Factor AS Selling_unit,'
      '  Form_Reference.Stock_Reference,'
      '  Form_Reference.Form_Reference_ID,'
      '  Purchase_OrderLine.Goods_Required,'
      '  '#39'PO'#39' AS Order_type,'
      '  Purch_Ord_Line_Status.Purch_Ord_Line_Status AS Order_Status,'
      '  Purch_Ord_Line_Status.Description AS Status_Description,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Customer_Branch.Account_Code,'
      '  Purchase_OrderLine.On_Hold,'
      '  Purchase_OrderLine.Proof_Revision,'
      '  Purchase_Order.Supplier,'
      '  Supplier.Name as Supplier_Name,'
      '  job_bag_line_dets.job_bag,'
      '  Purchase_orderline.Description_Reference,'
      '  Purchase_OrderLine.Rep,'
      '  Rep.Name as Rep_Name,'
      '  Purchase_Order.Operator,'
      '  Operator.Name as Operator_Name,'
      '  Original_order,'
      '  Purchase_Orderline.Inactive,'
      '  Purchase_Orderline.Supp_Inv_Recd,'
      '  Purchase_Order.Needs_Authorising,'
      '  Purchase_order.Authorised_By,'
      '  Purchase_OrderLine.Purchase_Order AS Order_Number,'
      '  Purchase_OrderLine.Proof_Required,'
      '  (select count(Job_Bag_Non_Conform.Job_Bag_Non_Conform)'
      '   from Job_Bag_Non_Conform'
      
        '   where Job_Bag_Non_Conform.purchase_order = purchase_orderline' +
        '.purchase_order and Job_Bag_Non_Conform.Non_Conform_Status < 50)' +
        ' as NCA_Live_Lines,'
      '  (select count(Job_Bag_Non_Conform.Job_Bag_Non_Conform)'
      '   from Job_Bag_Non_Conform'
      
        '   where Job_Bag_Non_Conform.purchase_order = purchase_orderline' +
        '.purchase_order and Job_Bag_Non_Conform.Non_Conform_Status >= 50' +
        ') as NCA_Signed_Off,'
      '   (Select Top 1 Rep'
      '    from Reps_Branches'
      
        '    where Reps_Branches.customer = Purchase_OrderLine.Customer a' +
        'nd'
      
        '          Reps_Branches.branch_no = Purchase_OrderLine.branch_no' +
        ') as Customer_Rep,'
      '  Purchase_Order.Office_Contact,'
      '  Office_Contact.Name as Office_Contact_Name'
      'FROM Operator AS Office_Contact'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Supplier'
      '      INNER JOIN (Purchase_Order'
      '      INNER JOIN (Rep'
      '      INNER JOIN ((Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Purch_Ord_Line_Status'
      '      INNER JOIN (Price_Unit AS Order_unit'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Price_Unit AS Selling_unit'
      '      INNER JOIN Purchase_OrderLine'
      
        '      LEFT JOIN job_bag_line_dets on ((Purchase_OrderLine.Purcha' +
        'se_Order = job_bag_line_dets.Purchase_Order) and '
      '         (Purchase_OrderLine.line = job_bag_line_dets.line)) ON'
      
        '        Selling_unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      
        '        Order_unit.Price_Unit = Purchase_OrderLine.Order_Unit) O' +
        'N'
      
        '        Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_O' +
        'rderLine.Purch_Ord_Line_Status) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      #9'      Rep.Rep = Purchase_OrderLine.Rep) ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      '        Supplier.Supplier = Purchase_Order.Supplier) ON'
      #9'      Operator.Operator = Purchase_Order.Operator) ON'
      '        Office_Contact.Operator = Purchase_Order.Office_Contact'
      
        'WHERE ((Purchase_orderline.Customer = :Customer) or (0 = :Custom' +
        'er)) and'
      '      Purchase_orderline.Customers_desc Like :Description'
      ''
      ' '
      ' ')
    Left = 216
    Top = 40
    ParamData = <
      item
        Name = 'RECORDS'
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryperiodEnd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_profit.*, Purchase_OrderLine.Qty_Invoiced'
      'from Sales_profit, Purchase_Orderline'
      'where Sales_profit.Purchase_order = :Purchase_Order and'
      'Sales_profit.Line = :Line and'
      '('
      
        '(Sales_Profit.purchase_Order = Purchase_OrderLine.Purchase_Order' +
        ') and'
      '(Sales_Profit.Line = Purchase_OrderLine.Line)'
      ')')
    Left = 288
    Top = 40
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryOnHold: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update purchase_orderline'
      'set On_hold = :On_Hold'
      'where Purchase_order = :Purchase_order and'
      'Line = :Line')
    Left = 16
    Top = 168
    ParamData = <
      item
        Name = 'On_Hold'
      end
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 80
    Top = 168
  end
  object qrySOHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_Order'
      'where sales_order = :sales_order')
    Left = 152
    Top = 168
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object GetPickRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Sales_Order, Picking_List_Ref'
      'from Part_Store_Allocation'
      'where Sales_Order = :Sales_Order')
    Left = 152
    Top = 216
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryInvoicePO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Sales_invoice_no'
      'from Sales_Invoice_line, Sales_invoice '
      'where '
      '('
      '(Sales_invoice_Line.Purchase_order = :Purchase_Order) and'
      '(Sales_invoice_Line.Line = :Line)'
      ') and'
      '(Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice)')
    Left = 288
    Top = 144
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryInvoiceSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Sales_Invoice.Sales_Invoice_No'
      'FROM (Sales_Invoice '
      #9'INNER JOIN Sales_Invoice_Line '
      
        #9#9'ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invo' +
        'ice) '
      'WHERE'
      '('
      '(Sales_invoice_Line.Sales_order = :Sales_Order)'
      ')')
    Left = 288
    Top = 200
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryJBOrders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Purchase_OrderLine.Customer,'
      '  Customer.Name,'
      '  Purchase_OrderLine.Purchase_Order as Sales_Order,'
      '  Purchase_OrderLine.Line AS Line,'
      '  Purchase_Order.Date_Point AS Order_date,'
      '  Purchase_OrderLine.Alt_Purchase_Order,'
      '  Purchase_OrderLine.Cust_Order_No,'
      '  Purchase_OrderLine.Customers_Desc AS Description,'
      '  Purchase_OrderLine.Quantity,'
      '  Purchase_OrderLine.Order_Price,'
      '  Order_unit.Price_Unit_Factor AS Order_unit,'
      '  Purchase_OrderLine.Selling_Price,'
      '  Selling_unit.Price_Unit_Factor AS Selling_unit,'
      '  Form_Reference.Stock_Reference,'
      '  Form_Reference.Form_Reference_ID,'
      '  Purchase_OrderLine.Goods_Required,'
      '  '#39'PO'#39' AS Order_type,'
      '  Purch_Ord_Line_Status.Purch_Ord_Line_Status AS Order_Status,'
      '  Purch_Ord_Line_Status.Description AS Status_Description,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Customer_Branch.Account_Code,'
      '  Purchase_OrderLine.On_Hold,'
      '  Purchase_OrderLine.Proof_Revision,'
      '  Purchase_Order.Supplier,'
      '  Supplier.Name as Supplier_Name,'
      '  job_bag = 0,'
      '  Purchase_OrderLine.Description_Reference,'
      '  Purchase_OrderLine.Rep,'
      '  Rep.Name as Rep_Name,'
      '  Purchase_Order.Operator,'
      '  Operator.Name as Operator_Name,'
      '  Original_order,'
      '  Purchase_Orderline.Inactive,'
      '  Purchase_Orderline.Supp_Inv_Recd,'
      '  Purchase_Order.Needs_Authorising,'
      '  Purchase_Order.Authorised_By,'
      '  Purchase_OrderLine.Purchase_Order AS Order_Number,'
      '  Purchase_OrderLine.Proof_Required,'
      '  0 as NCA_Live_lines,'
      '  0 as NCA_Signed_Off,'
      '  (Select Top 1 Rep'
      '    from Reps_Branches'
      
        '    where Reps_Branches.customer = Purchase_OrderLine.Customer a' +
        'nd'
      
        '          Reps_Branches.branch_no = Purchase_OrderLine.branch_no' +
        ') as Customer_Rep,'
      '  Purchase_Order.Office_Contact,'
      '  Office_Contact.Name as Office_Contact_Name'
      'FROM Operator AS Office_Contact'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Supplier'
      '      INNER JOIN (Purchase_Order'
      '      INNER JOIN (Rep'
      '      INNER JOIN ((Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Purch_Ord_Line_Status'
      '      INNER JOIN (Price_Unit AS Order_unit'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Price_Unit AS Selling_unit'
      '      INNER JOIN Purchase_OrderLine'
      
        '      LEFT JOIN job_bag_line_dets on ((Purchase_OrderLine.Purcha' +
        'se_Order = job_bag_line_dets.Purchase_Order) and '
      '         (Purchase_OrderLine.line = job_bag_line_dets.line)) ON'
      
        '        Selling_unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      
        '        Order_unit.Price_Unit = Purchase_OrderLine.Order_Unit) O' +
        'N'
      
        '        Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_O' +
        'rderLine.Purch_Ord_Line_Status) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      #9'      Rep.Rep = Purchase_OrderLine.Rep) ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      '        Supplier.Supplier = Purchase_Order.Supplier) ON'
      #9'      Operator.Operator = Purchase_Order.Operator) ON'
      '        Office_Contact.Operator = Purchase_Order.Office_Contact'
      
        'WHERE ((Purchase_orderline.Customer = :Customer) or (0 = :Custom' +
        'er)) and'
      '      Purchase_orderline.Customers_desc Like :Description'
      ''
      ' '
      ' '
      ' ')
    Left = 216
    Top = 96
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Description'
      end>
  end
  object qrySelectedPO: TFDQuery
    ConnectionName = 'PB'
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
      '       Purchase_Order.Office_Contact,'
      '       Purchase_order.Authorised_By'
      
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
    Left = 32
    Top = 272
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object dtsCallOffs: TDataSource
    DataSet = qryCallOffs
    Left = 512
    Top = 40
  end
  object qryCallOffs: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select '#9'sales_order.customer,'
      '        Customer.Name,'
      #9'sales_order_line.sales_order,'
      '        sales_order_Line.sales_order_Line_no as Line,'
      #9'sales_order.date_ordered as Order_date, '
      #9'sales_order.cust_order_no,'
      #9'Part_Description as Description,'
      #9'sales_order_line.quantity_ordered as Quantity,'
      #9'sales_order_line.part_cost as order_price,'
      #9'sales_order_line.purch_pack_quantity as order_unit,'#9
      #9'sales_order_line.part_sales_price as selling_price, '
      #9'sales_order_line.sell_pack_quantity as selling_unit,'
      #9'sales_order_line.Part as Stock_Reference, '
      #9'(select top 1 form_Reference.Form_Reference_ID'
      '   from Form_Reference'
      
        '   where Form_Reference.stock_reference = sales_order_line.part)' +
        ' as Form_Reference_id,'
      #9'sales_order.Date_Required as Goods_Required,'
      '  Replenish_Source.Replenish_id as Order_Type,'
      '  Sales_order.Sales_order_Head_Status as Order_status,'
      '  Sales_order_Head_status.Description as Status_Description,'
      '  Customer_Branch.Name as Branch_Name,'
      '  Customer_Branch.Account_Code,'
      '  '#39'N'#39' as On_Hold,'
      '  '#39'No Proof'#39' as Proof_Revision,'
      '  Sales_order.Supplier,'
      '  (select Supplier.Name'
      '   from Supplier'
      
        '   where Sales_order.Supplier = Supplier.Supplier) as Supplier_n' +
        'ame,'
      '   (select top 1 job_bag_line_dets.job_bag'
      '    from job_bag_line_dets'
      
        '    where sales_order.sales_order = job_bag_line_dets.sales_orde' +
        'r) as job_bag,'
      '   '#39#39' as Description_Reference,'
      '   0 as Rep,'
      '   '#39#39' as Rep_Name,'
      '   0 as Operator,'
      '   '#39#39' as Operator_Name,'
      '   0 as original_order,'
      '   '#39'N'#39' as Inactive,'
      '   '#39'N'#39' as Supp_Inv_Recd,'
      '   '#39'N'#39' as Needs_Authorising,'
      '   0 as Authorised_By'
      'from  sales_order_line,'
      '      part,'
      '      sales_order,'
      '      Customer_Branch,'
      '      sales_order_head_status,'
      '      Replenish_Source,'
      '      Customer'
      
        'where ((Sales_order.customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '  Customer.Customer = Sales_order.customer and'
      '  Part.Part_Description Like :Description and'
      #9'Sales_order_line.Part = Part.Part and'
      #9'sales_order_line.sales_order = sales_order.sales_order and'
      '  ('
      '  (Sales_order.Customer = Customer_Branch.Customer) and'
      '  (Sales_order.Branch_no = Customer_Branch.Branch_no)'
      '  ) and'
      
        '  Sales_Order.Sales_order_Head_status = Sales_order_Head_status.' +
        'Sales_order_Head_status AND'
      
        '  Sales_Order.Replenish_Source = Replenish_Source.Replenish_Sour' +
        'ce '
      ' '
      ' ')
    Left = 440
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from customer'
      'where customer = :customer')
    Left = 376
    Top = 40
    ParamData = <
      item
        Name = 'customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrySOHeaders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP (:Records)  '
      '  sales_order.customer,'
      '  Customer.Name,'
      '  sales_order.sales_order,'
      '  sales_order.date_ordered as Order_date,'
      '  sales_order.cust_order_no,'
      '  sales_order.Date_Required as Goods_Required,'
      '  Replenish_Source.Replenish_id as Order_Type,'
      '  Sales_order.Sales_order_Head_Status,'
      '  Sales_order.inactive,'
      '  Sales_order.Sales_order_Head_Status as Order_status,'
      '  Sales_order_Head_status.Description as Status_Description,'
      '  Customer_Branch.Name as Branch_Name,'
      '  Customer_Branch.Account_Code,'
      '  '#39'N'#39' as On_Hold,'
      '  '#39'No Proof'#39' as Proof_Revision,'
      '  Sales_order.Supplier,'
      '  (select top 1 job_bag_stock_request.job_bag'
      '    from job_bag_stock_request'
      
        '    where sales_order.sales_order = job_bag_stock_request.sales_' +
        'order) as job_bag_No,'
      '  Sales_OrderRep.Rep,'
      '  Rep.Name as Rep_Name,'
      '  Sales_Order.Operator,'
      '  Operator.Name as Operator_Name,'
      '  Office_Contact.Name as Office_Contact_Name,'
      '  (select top 1 Purch_ord_no'
      '    from Purch_Ord'
      
        '    where Purch_Ord.Sales_Order = Sales_Order.Sales_order) as Pu' +
        'rch_Ord_no,'
      '  Sales_Order.Order_Type as Sales_Order_Type,'
      '  Order_Type.Description as Sales_Order_Type_Description,'
      '  case'
      '    when Delivery_Customer <> 0 then'
      '      (select top 1 Cust_Del_Branch.Name'
      '       from Customer_Branch Cust_Del_Branch'
      
        '       where Cust_Del_Branch.Customer = sales_order.Delivery_Cus' +
        'tomer and'
      
        '             Cust_Del_Branch.Branch_no = sales_order.Delivery_Br' +
        'anch)'
      '    when Ad_hoc_Address <> 0 then'
      '      (select top 1 Ad_hoc_Address.Name'
      '       from Ad_hoc_Address'
      
        '       where Ad_hoc_Address.Ad_hoc_Address = sales_order.Ad_hoc_' +
        'Address)'
      '    else'
      '      (select top 1 Production_Location.Production_Location_Name'
      '       from Production_Location'
      
        '       where Production_Location.Production_Location = sales_ord' +
        'er.Production_Location)'
      '  end as Delivery_Location,'
      '  '#39#39' as Part,'
      '  '#39#39' as Description,'
      '  1 as Quantity,'
      '  0.00 as Order_Price,'
      '  0.00 as Selling_Price,'
      '  1 as Order_unit,'
      '  1 as Selling_Unit'
      'from  sales_order,'
      '      Customer_Branch,'
      '      sales_order_head_status,'
      '      Replenish_Source,'
      '      Customer,'
      '      Sales_OrderRep,'
      '      Rep,'
      '      Operator,'
      '      Order_Type,'
      '      Operator as Office_Contact'
      
        'where ((Sales_order.customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '  Customer.Customer = Sales_order.customer and'
      '  ('
      '  (Sales_order.Customer = Customer_Branch.Customer) and'
      '  (Sales_order.Branch_no = Customer_Branch.Branch_no)'
      '  ) and'
      
        '  Sales_Order.Sales_order_Head_status = Sales_order_Head_status.' +
        'Sales_order_Head_status AND'
      
        '  Sales_Order.Replenish_Source = Replenish_Source.Replenish_Sour' +
        'ce AND'
      '  Sales_Order.Operator = Operator.Operator AND'
      '  Sales_Order.Office_Contact = Office_Contact.Operator AND'
      '  Sales_Order.Sales_Order = Sales_OrderRep.Sales_Order AND'
      '  Sales_OrderRep.Rep = Rep.Rep and'
      '  Sales_Order.Order_type = Order_Type.Order_Type'
      ''
      '')
    Left = 584
    Top = 40
    ParamData = <
      item
        Name = 'RECORDS'
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySOHeadersDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      ReadOnly = True
      Required = True
      Size = 1
    end
  end
  object qrySelectedSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_order.sales_order,'
      '      Sales_order.date_ordered,'
      '      Sales_order.date_required,'
      
        '      Sales_order.Sales_order_head_Status, sales_Order_head_Stat' +
        'us.Description as Status_Descr'
      'from Sales_Order, sales_order_head_status'
      'where sales_order = :sales_order and'
      
        'sales_order.sales_order_head_status = sales_Order_head_Status.sa' +
        'les_Order_head_Status'
      '')
    Left = 32
    Top = 328
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Operator'
      'where Operator = :operator')
    Left = 32
    Top = 384
    ParamData = <
      item
        Name = 'operator'
      end>
  end
  object qrySOPicking: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from sales_order_picking'
      'where sales_order = :sales_order')
    Left = 152
    Top = 272
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryGetSInvoice: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from sales_invoice_line'
      'where sales_Order = :sales_order')
    Left = 376
    Top = 152
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryPOProofStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select top 1 Proof_History.Proof_History, Proof_Status.Proof_App' +
        'roved'
      'from Proof_History, Proof_Status'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line and'
      'Proof_History.Proof_Status = Proof_Status.Proof_Status'
      'Order BY Proof_History desc')
    Left = 288
    Top = 280
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySetSOInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_order'
      'set Sales_order_head_Status = 250'
      'where Sales_order = :Sales_Order')
    Left = 152
    Top = 328
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'TOP (:Records)'
      '  sales_order.customer,'
      '  Customer.Name,'
      #9'sales_order_line.sales_order,'
      '        sales_order_Line.sales_order_Line_no as Line,'
      #9'sales_order.date_ordered as Order_date, '
      #9'sales_order.cust_order_no,'
      #9'Part_Description as Description,'
      #9'sales_order_line.quantity_ordered as Quantity,'
      #9'sales_order_line.part_cost as order_price,'
      #9'sales_order_line.purch_pack_quantity as order_unit,'#9
      #9'sales_order_line.part_sales_price as selling_price, '
      #9'sales_order_line.sell_pack_quantity as selling_unit,'
      #9'sales_order_line.Part, '
      #9'(select top 1 form_Reference.Form_Reference_ID'
      '   from Form_Reference'
      
        '   where Form_Reference.stock_reference = sales_order_line.part)' +
        ' as Form_Reference_id,'
      #9'sales_order.cust_order_no,'
      #9'sales_order.Date_Required as Goods_Required,'
      '  Replenish_Source.Replenish_id as Order_Type,'
      '  Sales_order.Sales_order_Head_Status,'
      '  Sales_order.inactive,'
      '  Sales_order.Sales_order_Head_Status as Order_status,'
      '  Sales_order_Head_status.Description as Status_Description,'
      '  Customer_Branch.Name as Branch_Name,'
      '  Customer_Branch.Account_Code,'
      '  '#39'N'#39' as On_Hold,'
      '  '#39'No Proof'#39' as Proof_Revision,'
      '  Sales_order.Supplier,'
      '  (select top 1 job_bag_stock_request.job_bag'
      '    from job_bag_stock_request'
      
        '    where sales_order.sales_order = job_bag_stock_request.sales_' +
        'order) as job_bag_no,'
      '  Sales_OrderRep.Rep,'
      '  Rep.Name as Rep_Name,'
      '  Sales_Order.Operator,'
      '  Operator.Name as Operator_Name,'
      '  Office_Contact.Name as Office_Contact_Name,'
      '  (select top 1 Purch_ord_no'
      '    from Purch_Ord'
      
        '    where Purch_Ord.Sales_Order = Sales_Order.Sales_order) as Pu' +
        'rch_Ord_no,'
      '  Sales_Order.Order_Type as Sales_Order_Type,'
      '  Order_Type.Description as Sales_Order_Type_Description,'
      '  case'
      '    when Delivery_Customer <> 0 then'
      '      (select top 1 Cust_Del_Branch.Name'
      '       from Customer_Branch Cust_Del_Branch'
      
        '       where Cust_Del_Branch.Customer = sales_order.Delivery_Cus' +
        'tomer and'
      
        '             Cust_Del_Branch.Branch_no = sales_order.Delivery_Br' +
        'anch)'
      '    when Ad_hoc_Address <> 0 then'
      '      (select top 1 Ad_hoc_Address.Name'
      '       from Ad_hoc_Address'
      
        '       where Ad_hoc_Address.Ad_hoc_Address = sales_order.Ad_hoc_' +
        'Address)'
      '    else'
      '      (select top 1 Production_Location.Production_Location_Name'
      '       from Production_Location'
      
        '       where Production_Location.Production_Location = sales_ord' +
        'er.Production_Location)'
      '  end as Delivery_Location'
      'from  sales_order,'
      #9'  sales_order_line,'
      #9'  part,'
      '      Customer_Branch,'
      '      sales_order_head_status,'
      '      Replenish_Source,'
      '      Customer,'
      '      Sales_OrderRep,'
      '      Rep,'
      '      Operator,'
      '      Operator as Office_Contact,'
      '      Order_Type'
      
        'where ((Sales_order.customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '  Part.Part_Description Like :Description and'
      '  Customer.Customer = Sales_order.customer and'
      '  ('
      '  (Sales_order.Customer = Customer_Branch.Customer) and'
      '  (Sales_order.Branch_no = Customer_Branch.Branch_no)'
      '  ) and'
      
        '  Sales_Order.Sales_order_Head_status = Sales_order_Head_status.' +
        'Sales_order_Head_status AND'
      
        '  Sales_Order.Replenish_Source = Replenish_Source.Replenish_Sour' +
        'ce AND'
      '  Sales_Order.Operator = Operator.Operator AND'
      '  Sales_Order.Office_Contact = Office_Contact.Operator AND'
      '  Sales_Order.Sales_Order = Sales_OrderRep.Sales_Order AND'
      '  Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order AND'
      '  Sales_Order_Line.Part = Part.Part AND'
      '  Sales_OrderRep.Rep = Rep.Rep and'
      '  Sales_Order.Order_type = Order_Type.Order_Type'
      '')
    Left = 584
    Top = 104
    ParamData = <
      item
        Name = 'Records'
        DataType = ftInteger
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
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
