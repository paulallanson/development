object dtmdlForms: TdtmdlForms
  Height = 429
  Width = 459
  object qryForms: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Form_Reference.Form_Reference_ID,'
      '      Form_Reference.Form_Reference_Descr,'
      '      Form_Reference.Stock_Reference,'
      '      Form_Reference.Reorder_level,'
      '      Customer.Name as Cust_Name,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer.Customer,'
      '       Customer_Branch.Branch_No,'
      '       Customer.Product_Code_Prefix'
      'FROM Customer_Branch, Form_Reference, Customer'
      'WHERE (Form_Reference.Customer = :Customer) AND'
      
        '      (Form_Reference.Form_Reference_Descr LIKE :Description) AN' +
        'D'
      '      (Form_Reference.Branch_No = Customer_Branch.Branch_No) AND'
      '      (Customer.Customer = Customer_Branch.Customer)'
      ' ')
    Left = 16
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Description'
        DataType = ftString
      end>
  end
  object dtsForms: TDataSource
    DataSet = qryForms
    Left = 68
    Top = 80
  end
  object old_qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT DISTINCT Form_Reference.Form_Reference,'
      '      Form_Reference.Form_Reference_ID,'
      '      Form_Reference.Form_Reference_Descr,'
      '      Form_Reference.Stock_Reference,'
      '      Form_Reference.Reorder_level,'
      '      Customer.Name as Cust_Name,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer.Customer,'
      '       Customer_Branch.Branch_No,'
      '       Stocked_item'
      'FROM Customer_Branch, Form_Reference, Customer'
      
        'WHERE ((Form_Reference.Customer = :Customer) or (0 = :Customer))' +
        ' AND'
      
        '      (Form_Reference.Form_Reference_Descr LIKE :Description) AN' +
        'D'
      
        '      ((Form_Reference.Branch_No = Customer_Branch.Branch_No) AN' +
        'D'
      '      (Form_Reference.Customer = Customer_Branch.Customer)) AND'
      '      (Form_Reference.Customer = Customer.customer)'
      ' ')
    Left = 136
    Top = 40
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
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Form_Reference.Form_Reference,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Stock_Reference,'
      '        Form_Reference.Stocked_Item,'
      '        Form_Reference.Reorder_Level,'
      '        Form_Reference.Customer,'
      '        Form_Reference.Branch_No,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Cust_Name,'
      '        Customer_Branch.Account_Code,'
      '        Sum(Purchase_OrderLine.Qty_in_Stock) AS Qty_in_Stock,'
      '        Customer.Product_Code_Prefix'
      'FROM (Customer_Branch'
      '      INNER JOIN (Customer'
      '      INNER JOIN Form_Reference ON'
      '        Customer.Customer = Form_Reference.Customer) ON'
      '        (Customer.Customer = Customer_Branch.Customer) AND'
      
        '        (Customer_Branch.Branch_no = Form_Reference.Branch_No) A' +
        'ND'
      '        (Customer_Branch.Customer = Form_Reference.Customer))'
      '      LEFT JOIN Purchase_OrderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference'
      'GROUP BY  Form_Reference.Form_Reference,'
      '          Form_Reference.Form_Reference_ID,'
      '          Form_Reference.Form_Reference_Descr,'
      '          Form_Reference.Stock_Reference,'
      '          Form_Reference.Stocked_Item,'
      '          Form_Reference.Reorder_Level,'
      '          Form_Reference.Customer,'
      '          Form_Reference.Branch_No,'
      '          Customer_Branch.Name,'
      '          Customer.Name,'
      '          Customer_Branch.Account_Code,'
      '          Customer.Product_Code_Prefix'
      'HAVING (1=1) and'
      '  ((Form_Reference.Customer = :Customer) or (0 = :Customer)) AND'
      
        '  ((Form_Reference_ID Like :Description) or (Form_Reference_Desc' +
        'r Like :Description) or (Stock_Reference Like :Description))')
    Left = 136
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
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Description'
      end>
  end
  object qryLocations: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Form_Reference.Form_Reference,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Stocked_Item,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Forms_Per_Box,'
      '        Delivery_Detail.Stock_Location_Desc,'
      '        Delivery_Detail.Delivery_to_Stock,'
      '        Delivery_Location.Location_no,'
      '        Delivery_Location.Description,'
      '        Delivery_Location.Quantity,'
      '        Delivery_Location.Quantity_Allocated,'
      
        '        (Delivery_Location.Quantity - Delivery_Location.Quantity' +
        '_Allocated) as Qty_in_Stock'
      'FROM ((Form_Reference'
      '      INNER JOIN Purchase_OrderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference)'
      '      INNER JOIN Delivery_Detail ON'
      '        (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Pur' +
        'chase_Order))'
      '      LEFT JOIN Delivery_Location ON'
      
        '        (Delivery_Detail.Delivery_no = Delivery_Location.Deliver' +
        'y_no) AND'
      '        (Delivery_Detail.Line = Delivery_Location.Line) AND'
      
        '        (Delivery_Detail.Purchase_Order = Delivery_Location.Purc' +
        'hase_Order)'
      'WHERE'
      '(Form_Reference.Form_Reference = :Form_Reference) and '
      '('
      '((Form_Reference.Stocked_Item)='#39'Y'#39') AND'
      '((Delivery_Detail.Delivery_to_Stock)='#39'Y'#39') and'
      
        '((Delivery_Location.Quantity - Delivery_Location.Quantity_Alloca' +
        'ted) > 0)'
      ')'
      
        'Order by Delivery_Detail.Stock_Location_Desc, Delivery_Location.' +
        'Description')
    Left = 136
    Top = 200
    ParamData = <
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end>
    object qryLocationsForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
    end
    object qryLocationsForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object qryLocationsForm_Reference_Descr: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object qryLocationsStocked_Item: TStringField
      FieldName = 'Stocked_Item'
      FixedChar = True
      Size = 1
    end
    object qryLocationsPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryLocationsLine: TIntegerField
      FieldName = 'Line'
    end
    object qryLocationsForms_Per_Box: TStringField
      FieldName = 'Forms_Per_Box'
      FixedChar = True
      Size = 40
    end
    object qryLocationsStock_Location_Desc: TStringField
      FieldName = 'Stock_Location_Desc'
      FixedChar = True
      Size = 80
    end
    object qryLocationsDelivery_to_Stock: TStringField
      FieldName = 'Delivery_to_Stock'
      FixedChar = True
      Size = 2
    end
    object qryLocationsLocation_no: TIntegerField
      FieldName = 'Location_no'
    end
    object qryLocationsDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 40
    end
    object qryLocationsQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object qryLocationsQuantity_Allocated: TIntegerField
      FieldName = 'Quantity_Allocated'
    end
    object qryLocationsQty_in_Stock: TIntegerField
      FieldName = 'Qty_in_Stock'
    end
    object qryLocationsBoxQty: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'BoxQty'
      OnGetText = qryLocationsBoxQtyGetText
      Calculated = True
    end
  end
  object dtsLocations: TDataSource
    DataSet = qryLocations
    Left = 136
    Top = 152
  end
  object dtsHistory: TDataSource
    Left = 224
    Top = 152
  end
  object dtsNull: TDataSource
    Left = 312
    Top = 152
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name'
      'from Customer'
      'where Customer = :Customer')
    Left = 16
    Top = 160
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer_Branch.Name'
      'from Customer_Branch'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no')
    Left = 16
    Top = 224
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetTotalStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select SUM(Purchase_OrderLine.Qty_in_Stock) as Total_Stock'
      'from Purchase_orderLine'
      'where Form_Reference = :Form_Reference and'
      '(Purchase_OrderLine.Inactive <> '#39'Y'#39')')
    Left = 224
    Top = 256
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 41
    Top = 336
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
      end>
  end
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Rep'
      'where Rep = :Rep')
    Left = 114
    Top = 336
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Supplier.Name as Supplier_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Supplier_Branch, Supplier'
      'where Supplier_Branch.Supplier = :Supplier and'
      #9#9#9'Supplier_Branch.Branch_no = :Branch_no and'
      '        Supplier_Branch.Supplier = Supplier.Supplier'
      ' ')
    Left = 187
    Top = 336
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Company'
      'where Company = 1')
    Left = 261
    Top = 336
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 334
    Top = 336
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryHistory: TFDQuery
    OnCalcFields = qryHistoryCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Delivery_Detail.Purchase_Order,'
      '      Delivery_Detail.Line,'
      '      Delivery_Detail.Delivery_no,'
      '      Delivery_Detail.Ad_hoc_Address,'
      '      Delivery_Detail.Supplier,'
      '      Delivery_Detail.Branch_no,'
      '      Delivery_Detail.Rep,'
      '      Delivery_Detail.Qty_to_Deliver,'
      '      Delivery_Detail.Qty_Delivered,'
      '      Delivery_Detail.Qty_Invoiced,'
      '      Delivery_Detail.Date_Point,'
      '      Delivery_Detail.Goods_reqd_by_Customer,'
      '      Delivery_Detail.Branch_No0,'
      '      Delivery_Detail.Customer,'
      '      Delivery_Detail.No_Of_Boxes,'
      '      Delivery_Detail.Delivery_Instructions,'
      '      Delivery_Detail.Deliver_via_Company,'
      '      Delivery_Detail.Date_Deliv_Actual,'
      '      Delivery_Detail.Delivery_to_Stock,'
      '      Delivery_Detail.Delivery_note_printed,'
      '      Purchase_OrderLine.Suppliers_Desc,'
      '      Purchase_OrderLine.Customer AS Order_Customer,'
      '      Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '      Purchase_OrderLine.Forms_Per_Box,'
      '      Purchase_OrderLine.No_of_sets,'
      '      Purchase_OrderLine.Cust_Order_No,'
      '      Purchase_OrderLine.Purch_Ord_Line_Status,'
      '      Purchase_OrderLine.Quantity AS Orig_Ord_Qty,'
      '      Purchase_Order.Supplier,'
      '      Purchase_Order.Branch_No AS Supplier_Branch,'
      '      Supplier.Name AS Supplier_Name,'
      '      Customer.Name AS Customer_Name,'
      '      Purch_Ord_Line_Status.Description AS Order_Status,'
      '      Purchase_OrderLine.Qty_in_Stock,'
      '      Purchase_OrderLine.Original_Order,'
      '      Purchase_OrderLine.Original_Orderline,'
      '      Form_Reference.Form_Reference,'
      '      Form_Reference.Form_Reference_Descr,'
      '      Form_Reference.Form_Reference_ID,'
      '      Purchase_Orderline.Inactive,'
      '      Purchase_Orderline.Invoice_upfront,'
      '      Purchase_OrderLine.Order_Price,'
      '      Purchase_OrderLine.Order_Unit,'
      '      Price_Unit.Description as Price_unit_description,'
      '      Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit'
      '  INNER JOIN (Supplier'
      '  INNER JOIN ((Supplier_Branch'
      '  INNER JOIN Purchase_Order ON'
      '    (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND'
      '    (Supplier_Branch.Supplier = Purchase_Order.Supplier))'
      '  INNER JOIN ((Customer'
      '  INNER JOIN Customer_Branch ON'
      '    Customer.Customer = Customer_Branch.Customer)'
      '  INNER JOIN ((Purch_Ord_Line_Status'
      '  INNER JOIN (Form_Reference'
      '  RIGHT JOIN Purchase_OrderLine ON'
      
        '    Form_Reference.Form_Reference = Purchase_OrderLine.Form_Refe' +
        'rence) ON'
      
        '    Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Order' +
        'Line.Purch_Ord_Line_Status)'
      '  INNER JOIN Delivery_Detail ON'
      '    (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order)) ON'
      
        '    (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) A' +
        'ND'
      '    (Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON'
      
        '    Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_' +
        'Order) ON'
      '    Supplier.Supplier = Supplier_Branch.Supplier) ON'
      '    Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'where  (Purchase_OrderLine.Form_Reference = :Form_Reference) and'
      '('
      '(Delivery_Detail.Delivery_to_Stock = '#39'Y'#39') or'
      
        '(round(Delivery_Detail.Purchase_Order,0) = Purchase_OrderLine.Or' +
        'iginal_Order)'
      ')'
      'Order By Delivery_Detail.Purchase_Order desc'
      ''
      ' '
      ' '
      ' '
      ''
      ' ')
    Left = 224
    Top = 200
    ParamData = <
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end>
    object qryHistoryPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryHistoryLine: TIntegerField
      FieldName = 'Line'
    end
    object qryHistoryDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryHistoryAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object qryHistorySupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryHistoryBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryHistoryRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryHistoryQty_to_Deliver: TFloatField
      FieldName = 'Qty_to_Deliver'
    end
    object qryHistoryQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryHistoryQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qryHistoryDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryHistoryBranch_No0: TIntegerField
      FieldName = 'Branch_No0'
    end
    object qryHistoryCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryHistoryNo_Of_Boxes: TIntegerField
      FieldName = 'No_Of_Boxes'
    end
    object qryHistoryDelivery_Instructions: TStringField
      FieldName = 'Delivery_Instructions'
      FixedChar = True
      Size = 255
    end
    object qryHistoryDeliver_via_Company: TStringField
      FieldName = 'Deliver_via_Company'
      FixedChar = True
      Size = 1
    end
    object qryHistoryDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryHistoryDelivery_to_Stock: TStringField
      FieldName = 'Delivery_to_Stock'
      FixedChar = True
      Size = 2
    end
    object qryHistoryDelivery_note_printed: TStringField
      FieldName = 'Delivery_note_printed'
      FixedChar = True
      Size = 2
    end
    object qryHistorySuppliers_Desc: TStringField
      FieldName = 'Suppliers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryHistoryOrder_Customer: TIntegerField
      FieldName = 'Order_Customer'
    end
    object qryHistoryCustomer_Branch: TIntegerField
      FieldName = 'Customer_Branch'
    end
    object qryHistoryForms_Per_Box: TStringField
      FieldName = 'Forms_Per_Box'
      FixedChar = True
      Size = 40
    end
    object qryHistoryNo_of_sets: TStringField
      FieldName = 'No_of_sets'
      FixedChar = True
    end
    object qryHistoryCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object qryHistoryPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryHistorySupplier_1: TIntegerField
      FieldName = 'Supplier_1'
    end
    object qryHistorySupplier_Branch: TIntegerField
      FieldName = 'Supplier_Branch'
    end
    object qryHistorySupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryHistoryCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryHistoryOrder_Status: TStringField
      FieldName = 'Order_Status'
      FixedChar = True
      Size = 80
    end
    object qryHistoryQty_in_Stock: TFloatField
      FieldName = 'Qty_in_Stock'
    end
    object qryHistoryOriginal_Order: TFloatField
      FieldName = 'Original_Order'
    end
    object qryHistoryOriginal_Orderline: TFloatField
      FieldName = 'Original_Orderline'
    end
    object qryHistoryForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
    end
    object qryHistoryForm_Reference_Descr: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object qryHistoryForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object qryHistoryDeliveryName: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'DeliveryName'
      Size = 50
      Calculated = True
    end
    object qryHistoryQty_in: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_in'
      OnGetText = qryHistoryQty_inGetText
      Calculated = True
    end
    object qryHistoryQty_out: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_out'
      OnGetText = qryHistoryQty_outGetText
      Calculated = True
    end
    object qryHistoryPONumber: TStringField
      FieldKind = fkCalculated
      FieldName = 'PONumber'
      OnGetText = qryHistoryPONumberGetText
      Size = 0
      Calculated = True
    end
    object qryHistoryInactive: TStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object qryHistoryGoods_reqd_by_Customer: TDateTimeField
      FieldName = 'Goods_reqd_by_Customer'
    end
    object qryHistoryInvoice_upfront: TStringField
      FieldName = 'Invoice_upfront'
      FixedChar = True
      Size = 2
    end
    object qryHistoryOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryHistoryOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryHistoryPrice_unit_description: TStringField
      FieldName = 'Price_unit_description'
      FixedChar = True
      Size = 80
    end
    object qryHistoryPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryHistoryOrig_Ord_Qty: TFloatField
      FieldName = 'Orig_Ord_Qty'
    end
  end
end
