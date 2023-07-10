object DmLookupSOrd: TDmLookupSOrd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 391
  Top = 124
  Height = 445
  Width = 610
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 16
    Top = 16
  end
  object GetDetsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1000'
      '    Customer.Name as Cust_Name,'
      '    Customer_Branch.Name as Branch_Name,'
      '    Sales_Order.Date_Required,'
      '    Sales_Order.Sales_Order,'
      '    Sales_Order.Date_Ordered,'
      '    Sales_Order.Cust_Order_No,'
      '    Sales_Order_Head_Status.Description as Status_Description,'
      '    Sales_order.Part_Store,'
      '    Sales_Order.Sales_Order_Head_Status,'
      '    Sales_Order.Replenish_Source,'
      '    Sales_Order.Supplier,'
      '    Sales_order.Ad_Hoc_Address,'
      '    Sales_Order.Delivery_Customer,'
      '    (select Purch_ord_no'
      '     from Purch_Ord'
      
        '     where Purch_Ord.Sales_Order = Sales_Order.Sales_order) as P' +
        'urch_Ord_no,'
      '    (select name'
      #9#9'from Customer'
      
        #9#9'where ((customer.customer = Sales_Order.delivery_customer) and' +
        ' ('
      #9#9#9'(customer.name like :del_to) or (:del_to = '#39#39')))) as Del_name'
      'FROM (Customer_Branch'
      '      RIGHT JOIN (Customer'
      '      LEFT JOIN Sales_Order ON'
      '        Customer.Customer = Sales_Order.Customer) ON'
      '        (Customer_Branch.Branch_no = Sales_Order.Branch_no) AND'
      '        (Customer_Branch.Customer = Sales_Order.Customer))'
      '      LEFT JOIN Sales_Order_Head_Status ON'
      
        '        Sales_Order.Sales_Order_Head_Status = Sales_Order_Head_S' +
        'tatus.Sales_Order_Head_Status'
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
      ' ')
    Left = 72
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'del_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'del_to'
        ParamType = ptUnknown
      end>
    object GetDetsSQLDescription: TStringField
      FieldKind = fkCalculated
      FieldName = 'Description'
      OnGetText = GetDetsSQLDescriptionGetText
      Calculated = True
    end
    object GetDetsSQLCust_Name: TStringField
      FieldName = 'Cust_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object GetDetsSQLSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object GetDetsSQLDate_Ordered: TDateTimeField
      FieldName = 'Date_Ordered'
    end
    object GetDetsSQLCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLPart_Store: TIntegerField
      FieldName = 'Part_Store'
    end
    object GetDetsSQLSales_Order_Head_Status: TIntegerField
      FieldName = 'Sales_Order_Head_Status'
    end
    object GetDetsSQLReplenish_Source: TIntegerField
      FieldName = 'Replenish_Source'
    end
    object GetDetsSQLSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object GetDetsSQLPurch_Ord_no: TStringField
      FieldName = 'Purch_Ord_no'
      FixedChar = True
    end
    object GetDetsSQLStatus_Description: TStringField
      FieldName = 'Status_Description'
      FixedChar = True
      Size = 100
    end
    object GetDetsSQLAd_Hoc_Address: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Deliver To'
      DisplayWidth = 100
      FieldName = 'Ad_Hoc_Address'
    end
    object GetDetsSQLDelivery_Customer: TIntegerField
      FieldName = 'Delivery_Customer'
    end
    object GetDetsSQLDel_name: TStringField
      FieldName = 'Del_name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLDel_To_Add: TStringField
      FieldKind = fkCalculated
      FieldName = 'Del_To_Add'
      OnGetText = GetDetsSQLDel_To_AddGetText
      Calculated = True
    end
  end
  object NullSRC: TDataSource
    Left = 144
    Top = 16
  end
  object SelectedSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Sales_Order.Sales_Order,'
      '       Sales_Order.Customer,'
      '       Sales_Order.Branch_No,'
      '       Sales_Order.Date_Required,'
      '       Sales_Order.Date_Ordered,'
      '       Customer.Name as Cust_Name,'
      '       Customer_Branch.Name as Branch_Name,'
      
        '       Sales_Order.Date_Ordered,Sales_Order_Head_Status.Descript' +
        'ion as Status_Descr,'
      '       Sales_Order.Contact_No,'
      '       Sales_Order.Cost_Centre,'
      '       Sales_Order.Narrative,'
      '       Sales_Order.Sales_Order_Head_Status,'
      '       Sales_Order.Cust_Order_No,'
      '       Sales_Order.Delivery_Notes'
      
        'From  Sales_Order, Customer, Customer_Branch, Sales_Order_Head_S' +
        'tatus'
      'Where (Sales_Order.Sales_Order = :Sales_Order) and'
      '      (Customer.Customer = Sales_Order.Customer) and'
      '      (Customer_Branch.Customer = Sales_Order.Customer) and'
      '      (Customer_Branch.Branch_No = Sales_Order.Branch_No)and'
      
        '      (Sales_Order_Head_Status.Sales_Order_Head_Status = Sales_O' +
        'rder.Sales_Order_Head_Status)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object oldDummySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1000'
      '    Customer.Name as Cust_Name,'
      '    Customer_Branch.Name as Branch_Name,'
      '    Sales_Order.Date_Required,'
      '    Sales_Order.Sales_Order,'
      '    Sales_Order.Date_Ordered,'
      '    Sales_Order.Cust_Order_No,'
      '    Sales_Order_Head_Status.Description as Status_Description,'
      '    Sales_order.Part_Store,'
      '    Sales_Order.Sales_Order_Head_Status,'
      '    Sales_Order.Replenish_Source,'
      '    Sales_Order.Supplier,'
      '    Sales_order.Ad_Hoc_Address,'
      '    Sales_Order.Delivery_Customer,'
      '    (select Purch_ord_no'
      '     from Purch_Ord'
      
        '     where Purch_Ord.Sales_Order = Sales_Order.Sales_order) as P' +
        'urch_Ord_no,'
      '    (select name'
      #9#9'from Customer'
      
        #9#9'where ((customer.customer = Sales_Order.delivery_customer) and' +
        ' ('
      #9#9#9'(customer.name like :del_to) or (:del_to = '#39#39')))) as Del_name'
      'FROM (Customer_Branch'
      '      RIGHT JOIN (Customer'
      '      LEFT JOIN Sales_Order ON'
      '        Customer.Customer = Sales_Order.Customer) ON'
      '        (Customer_Branch.Branch_no = Sales_Order.Branch_no) AND'
      '        (Customer_Branch.Customer = Sales_Order.Customer))'
      '      LEFT JOIN Sales_Order_Head_Status ON'
      
        '        Sales_Order.Sales_Order_Head_Status = Sales_Order_Head_S' +
        'tatus.Sales_Order_Head_Status'
      'where'
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
      ' ')
    Left = 88
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'del_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'del_to'
        ParamType = ptUnknown
      end>
  end
  object GetContactSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Customer_Contact.Name as Contact_Name'
      'From  Customer_Contact'
      'Where (Customer_Contact.Contact_No = :Contact_No) and'
      '      (Customer_Contact.Customer = :Customer) and'
      '      (Customer_Contact.Branch_No = :Branch_No)'
      ' '
      ' '
      ' ')
    Left = 272
    Top = 34
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object GetDespDetsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Order.Part_Store,'
      #9'Sales_Order.Date_Ordered,'
      #9'Sales_Order.Sales_Order,'
      #9'Part_Store.Part_Store_Name,'
      #9'Sales_Order.Cust_Order_No,'
      #9'Sales_order_Head_Status.Description,'
      #9'Sales_Order.Date_Required,'
      '  Part_Store_Allocation.Picking_List_Ref,'
      #9'Customer.Name AS Cust_Name,'
      #9'Customer_Branch.Name AS Branch_Name,'
      '  Sales_Order_Delivery.Sales_Order_Delivery_no,'
      '  Sales_Order_Delivery.Despatch_Note_No'
      'FROM ((Customer'
      #9'INNER JOIN Customer_Branch ON'
      #9#9'Customer.Customer = Customer_Branch.Customer)'
      #9'INNER JOIN ((Sales_order_Head_Status'
      #9'INNER JOIN (Part_Store'
      #9'INNER JOIN Sales_Order ON'
      #9#9'Part_Store.Part_Store = Sales_Order.Part_Store) ON'
      
        #9#9'Sales_order_Head_Status.Sales_order_Head_Status = Sales_Order.' +
        'Sales_order_Head_Status)'
      #9'INNER JOIN (Sales_Order_line'
      #9'INNER JOIN Part_Store_Allocation ON'
      
        #9#9'(Sales_Order_line.Sales_Order_line_no = Part_Store_Allocation.' +
        'Sales_Order_line_no) AND'
      
        #9#9'(Sales_Order_line.Sales_Order = Part_Store_Allocation.Sales_Or' +
        'der)) ON'
      #9#9'Sales_Order.Sales_Order = Sales_Order_line.Sales_Order) ON'
      #9#9'(Customer_Branch.Branch_no = Sales_Order.Branch_no) AND'
      #9#9'(Customer_Branch.Customer = Sales_Order.Customer))'
      ' '#9'LEFT JOIN Sales_Order_Delivery on '
      #9'Sales_Order_Delivery.sales_order = Sales_Order_Line.Sales_Order'
      'Where'
      '  (Part_Store_Allocation.Quantity_Allocated > 0) and'
      '  (Sales_Order.Sales_Order_Head_Status >= :Status_From) and'
      '  (Sales_Order.Sales_Order_Head_Status <= :Status_To) and'
      '  (Sales_Order.Replenish_Source = 2)'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    Left = 24
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Status_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Status_To'
        ParamType = ptUnknown
      end>
  end
  object qryNewSOs: TQuery
    Left = 272
    Top = 88
  end
  object GetPickRefSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select distinct Sales_Order, Picking_List_Ref'
      'from Part_Store_Allocation'
      'where Sales_Order = :Sales_Order')
    Left = 112
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryperiodEnd: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_profit'
      'where Sales_Order = :Sales_Order')
    Left = 168
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qrySalesHistory: TQuery
    OnCalcFields = qrySalesHistoryCalcFields
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order_line.*,'
      '  sales_order_head_status.description,'
      '  sales_order.date_ordered,'
      '  sales_order.cust_order_no,'
      '  part.part_description,'
      '  Sales_Order.Ad_hoc_Address,'
      
        '  ((sales_order_line.quantity_delivered/sales_order_line.sell_pa' +
        'ck_quantity)*part_sales_price) as Sales_Value,'
      '  (select Customer_Branch.Name'
      '  from Customer_Branch'
      
        '  where Customer_Branch.Customer = Sales_order.delivery_customer' +
        ' and'
      
        '           Customer_Branch.Branch_no = Sales_order.delivery_bran' +
        'ch) as DeliveryBranchName'
      
        'from ((sales_order_line inner join sales_order on sales_order_li' +
        'ne.sales_order = sales_order.sales_order)'
      
        ' inner join sales_order_head_status on sales_order.sales_order_h' +
        'ead_status = sales_order_head_status.sales_order_head_status)'
      ' inner join part on sales_order_line.part = part.part'
      'where sales_order_line.part = :part and'
      '  sales_order.customer = :cust and'
      '  sales_order.date_ordered >= :date and'
      '  sales_order.order_type <> '#39'J'#39
      'order by sales_order_line.sales_order desc'
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'cust'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'date'
        ParamType = ptInput
        Value = 0d
      end>
    object qrySalesHistorySales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySalesHistorySales_Order_line_no: TIntegerField
      FieldName = 'Sales_Order_line_no'
    end
    object qrySalesHistoryPart: TStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object qrySalesHistoryPart_Cost: TCurrencyField
      FieldName = 'Part_Cost'
    end
    object qrySalesHistoryPurch_Pack_Quantity: TIntegerField
      FieldName = 'Purch_Pack_Quantity'
    end
    object qrySalesHistoryPart_Sales_Price: TCurrencyField
      FieldName = 'Part_Sales_Price'
    end
    object qrySalesHistorySell_Pack_Quantity: TIntegerField
      FieldName = 'Sell_Pack_Quantity'
    end
    object qrySalesHistoryQuantity_Ordered: TIntegerField
      FieldName = 'Quantity_Ordered'
    end
    object qrySalesHistoryQuantity_Allocated: TIntegerField
      FieldName = 'Quantity_Allocated'
    end
    object qrySalesHistoryQuantity_Delivered: TIntegerField
      FieldName = 'Quantity_Delivered'
    end
    object qrySalesHistoryContract: TIntegerField
      FieldName = 'Contract'
    end
    object qrySalesHistoryContract_Line_no: TIntegerField
      FieldName = 'Contract_Line_no'
    end
    object qrySalesHistorySales_order_Line_Status: TIntegerField
      FieldName = 'Sales_order_Line_Status'
    end
    object qrySalesHistoryQuantity_Invoiced: TIntegerField
      FieldName = 'Quantity_Invoiced'
    end
    object qrySalesHistoryLine_Complete: TStringField
      FieldName = 'Line_Complete'
      FixedChar = True
      Size = 2
    end
    object qrySalesHistoryvat_code: TIntegerField
      FieldName = 'vat_code'
    end
    object qrySalesHistoryDiscount_Type: TStringField
      FieldName = 'Discount_Type'
      FixedChar = True
      Size = 2
    end
    object qrySalesHistoryDiscount_value: TCurrencyField
      FieldName = 'Discount_value'
    end
    object qrySalesHistoryReplacement_For_Line: TIntegerField
      FieldName = 'Replacement_For_Line'
    end
    object qrySalesHistoryOriginal_Sell_Price: TCurrencyField
      FieldName = 'Original_Sell_Price'
    end
    object qrySalesHistorydescription: TStringField
      FieldName = 'description'
      FixedChar = True
      Size = 100
    end
    object qrySalesHistorydate_ordered: TDateTimeField
      FieldName = 'date_ordered'
    end
    object qrySalesHistorypart_description: TStringField
      FieldName = 'part_description'
      FixedChar = True
      Size = 100
    end
    object qrySalesHistoryDeliveryBranchName: TStringField
      FieldName = 'DeliveryBranchName'
    end
    object qrySalesHistoryAd_Hoc_Address: TIntegerField
      FieldName = 'Ad_Hoc_Address'
    end
    object qrySalesHistorycust_order_no: TStringField
      FieldName = 'cust_order_no'
      Size = 30
    end
    object qrySalesHistorySales_Value: TFloatField
      FieldName = 'Sales_Value'
      DisplayFormat = '##0.000'
    end
    object qrySalesHistoryDelivery_Location: TStringField
      FieldKind = fkCalculated
      FieldName = 'Delivery_Location'
      Size = 50
      Calculated = True
    end
  end
  object qryProductSalesbyCust: TQuery
    OnCalcFields = qryProductSalesbyCustCalcFields
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order_line.sales_order,'
      '  sales_order_line.sales_order_line_no,'
      '  sales_order_line.part,'
      '  sales_order_line.part_sales_price,'
      '  sales_order_line.sell_pack_quantity,'
      '  sales_order_line.quantity_ordered,'
      '  sales_order_line.quantity_delivered,'
      '  sales_order.date_ordered,'
      '  sales_order.cust_order_no,'
      '  sales_order.delivery_customer,'
      '  sales_order.delivery_branch,'
      '  sales_order.ad_hoc_address,'
      '  part.part_description,'
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
      '  sales_order_delivery.Delivery_Date'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Part'
      '      INNER JOIN ((Sales_Order'
      '      INNER JOIN Sales_Order_line ON'
      '        Sales_Order.Sales_Order = Sales_Order_line.Sales_Order)'
      '      LEFT JOIN Sales_Order_Delivery ON'
      
        '        Sales_Order.Sales_Order = Sales_Order_Delivery.Sales_Ord' +
        'er) ON'
      '        Part.Part = Sales_Order_line.Part) ON'
      '        (Customer_Branch.Branch_no = Sales_Order.Branch_no) AND'
      '        (Customer_Branch.Customer = Sales_Order.Customer)) ON'
      '        Customer.Customer = Customer_Branch.Customer'
      'where ((sales_order_line.part = :part) or (:part = '#39'ALL'#39')) and'
      '  ((sales_order.customer = :cust) or (:cust = -99)) and'
      '  sales_order.date_ordered >= :dateFrom and'
      '  sales_order.date_ordered <= :dateTo and'
      '  sales_order_line.quantity_delivered > 0'
      
        'order by Customer.name, sales_order_line.sales_order, sales_orde' +
        'r_line.part'
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
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 104
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateTo'
        ParamType = ptUnknown
      end>
    object qryProductSalesbyCustsales_order: TIntegerField
      FieldName = 'sales_order'
    end
    object qryProductSalesbyCustpart: TStringField
      FieldName = 'part'
      FixedChar = True
      Size = 30
    end
    object qryProductSalesbyCustpart_sales_price: TCurrencyField
      FieldName = 'part_sales_price'
    end
    object qryProductSalesbyCustsell_pack_quantity: TIntegerField
      FieldName = 'sell_pack_quantity'
    end
    object qryProductSalesbyCustcust_order_no: TStringField
      FieldName = 'cust_order_no'
      FixedChar = True
      Size = 80
    end
    object qryProductSalesbyCustpart_description: TStringField
      FieldName = 'part_description'
      FixedChar = True
      Size = 100
    end
    object qryProductSalesbyCustSalesValue: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SalesValue'
      currency = True
      Calculated = True
    end
    object qryProductSalesbyCustProduct: TStringField
      FieldKind = fkCalculated
      FieldName = 'Product'
      Size = 100
      Calculated = True
    end
    object qryProductSalesbyCustquantity_delivered: TIntegerField
      FieldName = 'quantity_delivered'
    end
    object qryProductSalesbyCustquantity_ordered: TIntegerField
      FieldName = 'quantity_ordered'
    end
    object qryProductSalesbyCustdate_required: TDateTimeField
      FieldName = 'date_required'
    end
    object qryProductSalesbyCustdate_ordered: TDateTimeField
      FieldName = 'date_ordered'
    end
    object qryProductSalesbyCustDelivery_Date: TDateTimeField
      FieldName = 'Delivery_Date'
    end
    object qryProductSalesbyCustdelivery_customer: TIntegerField
      FieldName = 'delivery_customer'
    end
    object qryProductSalesbyCustdelivery_branch: TIntegerField
      FieldName = 'delivery_branch'
    end
    object qryProductSalesbyCustad_hoc_address: TIntegerField
      FieldName = 'ad_hoc_address'
    end
    object qryProductSalesbyCustsales_order_line_no: TIntegerField
      FieldName = 'sales_order_line_no'
    end
    object qryProductSalesbyCustDeliveryLocation: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryLocation'
      Size = 50
      Calculated = True
    end
    object qryProductSalesbyCustDeliveryCustName: TStringField
      FieldName = 'DeliveryCustName'
      FixedChar = True
      Size = 80
    end
    object qryProductSalesbyCustDeliveryBranchName: TStringField
      FieldName = 'DeliveryBranchName'
      FixedChar = True
      Size = 80
    end
    object qryProductSalesbyCustOrderedBy: TStringField
      FieldName = 'OrderedBy'
      FixedChar = True
      Size = 162
    end
  end
  object qryInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Sales_invoice_no'
      'from Sales_Invoice_line, Sales_invoice'
      'where'
      '(Sales_invoice_Line.Sales_order = :Sales_Order) and'
      '(Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice)'
      ''
      ' '
      ' '
      ' ')
    Left = 224
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object OldqryProductSalesbyCust: TQuery
    SQL.Strings = (
      'select sales_order_line.sales_order,'
      '  sales_order_line.part,'
      '  sales_order_line.part_sales_price,'
      '  sales_order_line.sell_pack_quantity,'
      '  sales_order_line.quantity_ordered,'
      '  sales_order_line.quantity_delivered,'
      '  sales_order.date_ordered,'
      '  sales_order.cust_order_no,'
      '  sales_order_head_status.description,'
      '  part.part_description,'
      '  cust1.name + '#39'/'#39' + branch2.Name as OrderedBy,'
      '  cust2.name as DeliveredTo,'
      '  branch1.name as DeliveredToBranch,'
      '  sales_order.date_required,'
      '  Sales_Order_line_serial_no.serial_item_from,'
      '  Sales_Order_line_serial_no.serial_item_to,'
      '  sales_order_delivery.Delivery_Date'
      
        'from (((((((sales_order_line inner join sales_order on sales_ord' +
        'er_line.sales_order = sales_order.sales_order)'
      
        ' inner join sales_order_head_status on sales_order.sales_order_h' +
        'ead_status = sales_order_head_status.sales_order_head_status)'
      ' inner join part on sales_order_line.part = part.part)'
      
        ' inner join customer as cust1 on sales_order.customer = cust1.cu' +
        'stomer)'
      
        ' inner join customer_branch as branch2 on ((sales_order.customer' +
        ' = branch2.customer) and (sales_order.Branch_no = branch2.Branch' +
        '_no)))'
      
        ' left join customer as cust2 on sales_order.delivery_customer = ' +
        'cust2.customer)'
      
        ' left join customer_branch as branch1 on ((sales_order.delivery_' +
        'customer = branch1.customer) and (sales_order.delivery_branch = ' +
        'branch1.branch_no)))'
      
        ' left join Sales_Order_line_serial_no on ((sales_order_line.sale' +
        's_order = Sales_Order_line_serial_no.sales_order) and(sales_orde' +
        'r_line.sales_order_line_no = Sales_Order_line_serial_no.Sales_Or' +
        'der_line_no))'
      
        ' left join Sales_order_delivery_line on ((sales_order_line.sales' +
        '_order = Sales_order_delivery_line.sales_order) and(sales_order_' +
        'line.Sales_Order_line_no = Sales_order_delivery_line.Sales_Order' +
        '_line_no))'
      
        ' left join Sales_order_delivery on ((sales_order_line.sales_orde' +
        'r = Sales_order_delivery.sales_order) and (Sales_order_delivery_' +
        'line.sales_order_delivery_no = sales_order_delivery.sales_order_' +
        'delivery_no))'
      'where ((sales_order_line.part = :part) or (:part = '#39'ALL'#39')) and'
      '  ((sales_order.customer = :cust) or (:cust = -99)) and'
      '  sales_order.date_ordered >= :dateFrom and'
      '  sales_order.date_ordered <= :dateTo and'
      '  sales_order_line.quantity_delivered > 0'
      
        'order by cust1.name, sales_order_line.part, sales_order.date_ord' +
        'ered'
      ''
      ' '
      ' ')
    Left = 224
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateTo'
        ParamType = ptUnknown
      end>
  end
  object qryAdhoc: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name'
      'from Ad_hoc_address'
      'where ad_hoc_address = :ad_hoc_address')
    Left = 352
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ad_hoc_address'
        ParamType = ptUnknown
      end>
  end
  object qryCust: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer_Branch.Name as Branch_Name,'
      '           Customer.Name as Customer_Name'
      'from Customer_Branch, Customer'
      'where Customer_Branch.Customer = :Customer and'
      '           Customer_Branch.Branch_no = :Branch_no and'
      '           Customer_Branch.Customer = Customer.Customer')
    Left = 352
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qrySalesSerialNos: TQuery
    DatabaseName = 'PB'
    DataSource = dtsDetails
    SQL.Strings = (
      'select *'
      'from sales_order_line_serial_no'
      'where sales_order = :sales_order and'
      'sales_order_line_no = :sales_order_line_no'
      'order by serial_item_no')
    Left = 104
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'sales_order_line_no'
        ParamType = ptUnknown
      end>
  end
  object dtsDetails: TDataSource
    DataSet = qryProductSalesbyCust
    Left = 24
    Top = 272
  end
  object DummySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1000'
      '    Customer.Name as Cust_Name,'
      '    Customer_Branch.Name as Branch_Name,'
      '    Sales_Order.Date_Required,'
      '    Sales_Order.Sales_Order,'
      '    Sales_Order.Date_Ordered,'
      '    Sales_Order.Cust_Order_No,'
      '    Sales_Order_Head_Status.Description as Status_Description,'
      '    Sales_order.Part_Store,'
      '    Sales_Order.Sales_Order_Head_Status,'
      '    Sales_Order.Replenish_Source,'
      '    Sales_Order.Supplier,'
      '    Sales_order.Ad_Hoc_Address,'
      '    Sales_Order.Delivery_Customer,'
      '    Purch_Ord.Purch_ord_no, '
      '    Cust2.name as Del_Name'
      
        'FROM Sales_Order left join Customer on Customer.Customer = Sales' +
        '_Order.Customer'
      
        #9#9' left join customer_branch on Customer_Branch.Branch_no = Sale' +
        's_Order.Branch_no AND'
      '        '#9#9'   Customer_Branch.Customer = Sales_Order.Customer'
      
        #9#9' left join customer Cust2 on Cust2.customer = Sales_Order.deli' +
        'very_customer '
      
        #9#9' left join Purch_Ord on Purch_Ord.Sales_Order = Sales_Order.Sa' +
        'les_order,'
      '     Sales_Order_Head_Status'#9
      'Where '
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
    Left = 200
    Top = 24
  end
  object dummySalesbyCust: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order_line.sales_order,'
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
      '  rep.rep,'
      '  rep.Name as repName,'
      '  sales_order.cost_centre,'
      '  Vat_Code.Vat_Rate'
      'FROM'
      '  sales_order '
      
        '  inner join sales_order_line on (sales_order.sales_order = sale' +
        's_order_line.sales_order) '
      
        '  inner join customer_branch on ((Customer_Branch.Branch_no = Sa' +
        'les_Order.Branch_no) AND (Customer_Branch.Customer = Sales_Order' +
        '.Customer))'
      
        '  inner join customer on (Customer_Branch.customer = customer.cu' +
        'stomer)'
      '  inner join part on (Sales_Order_line.Part = Part.Part)'
      
        '  inner join Vat_Code on (Sales_Order_line.Vat_Code = Vat_Code.V' +
        'at_Code)'
      
        '  inner join sales_orderrep on (sales_order.sales_order = sales_' +
        'orderRep.sales_order)'
      '  inner join rep on (sales_orderrep.rep = rep.rep)'
      
        '  left  join Sales_Order_Delivery on (Sales_Order.Sales_Order = ' +
        'Sales_Order_Delivery.Sales_Order)'
      'where ((sales_order_line.part = :part) or (:part = '#39'ALL'#39')) and'
      '  ((sales_order.customer = :cust) or (:cust = -99)) and'
      '  ((sales_orderRep.rep = :rep) or (:rep = -99)) and'
      '  sales_order.date_ordered >= :dateFrom and'
      '  sales_order.date_ordered <= :dateTo and'
      '  sales_order_line.quantity_delivered > 0 and'
      '  sales_order.order_type <> '#39'J'#39
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 416
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateTo'
        ParamType = ptUnknown
      end>
  end
  object qryProdSalesbyCust: TQuery
    OnCalcFields = qryProdSalesbyCustCalcFields
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order_line.sales_order,'
      '  sales_order_line.sales_order_line_no,'
      '  sales_order_line.part,'
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
      '  part.part_description,'
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
      '  rep.rep,'
      '  rep.Name as repName'
      'FROM'
      '  sales_order '
      
        '  inner join sales_order_line on (sales_order.sales_order = sale' +
        's_order_line.sales_order) '
      
        '  inner join customer_branch on ((Customer_Branch.Branch_no = Sa' +
        'les_Order.Branch_no) AND (Customer_Branch.Customer = Sales_Order' +
        '.Customer))'
      
        '  inner join customer on (Customer_Branch.customer = customer.cu' +
        'stomer) '
      '  inner join part on (Sales_Order_line.Part = Part.Part)'
      
        '  inner join sales_orderrep on (sales_order.sales_order = sales_' +
        'orderRep.sales_order)'
      '  inner join rep on (sales_orderrep.rep = rep.rep)'
      
        '  left  join Sales_Order_Delivery on (Sales_Order.Sales_Order = ' +
        'Sales_Order_Delivery.Sales_Order)'
      'where ((sales_order_line.part = :part) or (:part = '#39'ALL'#39')) and'
      '  ((sales_order.customer = :cust) or (:cust = -99)) and'
      '  ((sales_orderRep.rep = :rep) or (:rep = -99)) and'
      '  sales_order.date_ordered >= :dateFrom and'
      '  sales_order.date_ordered <= :dateTo and'
      '  sales_order_line.quantity_delivered > 0'
      'order by rep.name, '
      'Customer.name, '
      'sales_order_line.sales_order, '
      'sales_order_line.part'
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
      ' '
      ' '
      ' ')
    Left = 416
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cust'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rep'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rep'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'dateTo'
        ParamType = ptUnknown
      end>
    object qryProdSalesbyCustsales_order: TIntegerField
      FieldName = 'sales_order'
    end
    object qryProdSalesbyCustpart: TStringField
      FieldName = 'part'
      FixedChar = True
      Size = 30
    end
    object qryProdSalesbyCustpart_sales_price: TCurrencyField
      FieldName = 'part_sales_price'
    end
    object qryProdSalesbyCustsell_pack_quantity: TIntegerField
      FieldName = 'sell_pack_quantity'
    end
    object qryProdSalesbyCustcust_order_no: TStringField
      FieldName = 'cust_order_no'
      FixedChar = True
      Size = 80
    end
    object qryProdSalesbyCustpart_description: TStringField
      FieldName = 'part_description'
      FixedChar = True
      Size = 100
    end
    object qryProdSalesbyCustSalesValue: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SalesValue'
      currency = True
      Calculated = True
    end
    object qryProdSalesbyCustProduct: TStringField
      FieldKind = fkCalculated
      FieldName = 'Product'
      Size = 100
      Calculated = True
    end
    object qryProdSalesbyCustquantity_delivered: TIntegerField
      FieldName = 'quantity_delivered'
    end
    object qryProdSalesbyCustquantity_ordered: TIntegerField
      FieldName = 'quantity_ordered'
    end
    object qryProdSalesbyCustdate_required: TDateTimeField
      FieldName = 'date_required'
    end
    object qryProdSalesbyCustdate_ordered: TDateTimeField
      FieldName = 'date_ordered'
    end
    object qryProdSalesbyCustDelivery_Date: TDateTimeField
      FieldName = 'Delivery_Date'
    end
    object qryProdSalesbyCustdelivery_customer: TIntegerField
      FieldName = 'delivery_customer'
    end
    object qryProdSalesbyCustdelivery_branch: TIntegerField
      FieldName = 'delivery_branch'
    end
    object qryProdSalesbyCustad_hoc_address: TIntegerField
      FieldName = 'ad_hoc_address'
    end
    object qryProdSalesbyCustsales_order_line_no: TIntegerField
      FieldName = 'sales_order_line_no'
    end
    object qryProdSalesbyCustDeliveryLocation: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryLocation'
      Size = 50
      Calculated = True
    end
    object qryProdSalesbyCustDeliveryCustName: TStringField
      FieldName = 'DeliveryCustName'
      FixedChar = True
      Size = 80
    end
    object qryProdSalesbyCustDeliveryBranchName: TStringField
      FieldName = 'DeliveryBranchName'
      FixedChar = True
      Size = 80
    end
    object qryProdSalesbyCustOrderedBy: TStringField
      FieldName = 'OrderedBy'
      FixedChar = True
      Size = 162
    end
    object qryProdSalesbyCustrep: TIntegerField
      FieldName = 'rep'
    end
    object qryProdSalesbyCustrepName: TStringField
      FieldName = 'repName'
      FixedChar = True
      Size = 80
    end
    object qryProdSalesbyCustcustomer: TIntegerField
      FieldName = 'customer'
    end
    object qryProdSalesbyCustCost_Centre: TStringField
      FieldName = 'Cost_Centre'
      Size = 10
    end
    object qryProdSalesbyCustCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryProdSalesbyCustBranch_name: TStringField
      FieldName = 'Branch_name'
      Size = 50
    end
    object qryProdSalesbyCustShort_Code: TStringField
      FieldName = 'Short_Code'
      Size = 10
    end
    object qryProdSalesbyCustPart_Cost: TFloatField
      FieldName = 'Part_Cost'
    end
    object qryProdSalesbyCustPurch_Pack_Quantity: TIntegerField
      FieldName = 'Purch_Pack_Quantity'
    end
    object qryProdSalesbyCustVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryProdSalesbyCustPart_Cost_Cat: TFloatField
      FieldName = 'Part_Cost_Cat'
    end
  end
  object qryGetCustomerDetails: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part_Customer'
      'where Customer = :Customer and Part = :Part')
    Left = 416
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
