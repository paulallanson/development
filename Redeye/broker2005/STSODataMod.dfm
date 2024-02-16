object STSalesOrdDM: TSTSalesOrdDM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 661
  Width = 1287
  object GetSOLineSql: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Sales_Order_Line'
      'Where (Sales_Order = :Sales_Order) and'
      '      (Sales_Order_Line_no = :Line)'
      ''
      ''
      ' '
      ' ')
    Left = 496
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_SO_Number, Last_Invoice_No'
      'From Company'
      'Where Company = 1'
      ' ')
    Left = 304
    Top = 64
  end
  object UpdLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_SO_Number = :Last_SO_Number'
      'Where Company = 1'
      ' ')
    Left = 128
    Top = 288
    ParamData = <
      item
        Name = 'Last_SO_Number'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set      Office_Contact = :Office_Contact,'
      '         Contact_No = :Contact_No,'
      '         Date_Required = :Date_Reqd,'
      '         Date_Ordered = :Date_Ordrd,'
      '         Cust_Order_No = :Cust_Order_No,'
      '         Customer = :Customer,'
      '         Branch_No = :Branch_No,'
      '         Cost_Centre = :Cost_Centre,'
      '         Customer0 = :Customer0,'
      '         Sales_Order_Head_Status = :Sales_Order_Head_Status,'
      '         Narrative = :Narrative,'
      '         Part_Store = :Part_Store,'
      '         Delivery_Notes = :Delivery_Notes,'
      '         Delivery_Customer = :Delivery_Customer,'
      '         Delivery_Branch = :Delivery_Branch,'
      '         Supplier = :Supplier,'
      '         Branch_no0 = :Branch_no0,'
      '         Supp_Order_Type = :Supp_Order_type,'
      '         Replenish_Source = :Replenish_Source,'
      '         Ad_Hoc_Address = :Ad_Hoc_Address,'
      '         Order_Type = :Order_Type,'
      '         Production_Location = :Production_Location,'
      '         Account_Team = :Account_Team,'
      '         Delivery_Contact_Name = :Delivery_Contact_Name,'
      '         Cash_Sales = :Cash_Sales,'
      '         inactive = :inactive'
      'Where'
      'Sales_Order = :Sales_Order'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 96
    Top = 272
    ParamData = <
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Date_Reqd'
      end
      item
        Name = 'Date_Ordrd'
      end
      item
        Name = 'Cust_Order_No'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Cost_Centre'
        DataType = ftString
      end
      item
        Name = 'Customer0'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Head_Status'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Delivery_Notes'
      end
      item
        Name = 'Delivery_Customer'
      end
      item
        Name = 'Delivery_Branch'
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no0'
        DataType = ftInteger
      end
      item
        Name = 'Supp_Order_type'
        DataType = ftString
      end
      item
        Name = 'Replenish_Source'
        DataType = ftInteger
      end
      item
        Name = 'Ad_Hoc_Address'
        DataType = ftInteger
      end
      item
        Name = 'Order_Type'
      end
      item
        Name = 'Production_Location'
        DataType = ftInteger
      end
      item
        Name = 'Account_Team'
      end
      item
        Name = 'Delivery_Contact_Name'
      end
      item
        Name = 'Cash_Sales'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select In_Use_By, Name from Company Where Company = 1'
      ' ')
    Left = 32
    Top = 240
  end
  object OperatorSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from operator')
    Left = 128
    Top = 184
  end
  object OperatorSRC: TDataSource
    AutoEdit = False
    DataSet = OperatorSQL
    Left = 128
    Top = 232
  end
  object DelSOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Sales_Order_Line'
      'Where (Sales_Order = :Sales_Order) and'
      '       (Sales_order_Line_No = :Line)'
      ''
      ' '
      ' ')
    Left = 304
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object AddSOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order_Line'
      
        '(Sales_Order, Sales_Order_Line_No, Part, Part_Cost, Purch_pack_q' +
        'uantity, Part_Sales_Price, Sell_Pack_Quantity,'
      
        '  Quantity_Ordered, Quantity_Allocated, Quantity_Delivered, Cont' +
        'ract,'
      '  Contract_Line_No, Sales_Order_Line_Status, Quantity_Invoiced,'
      '  Discount_Type, Discount_Value, Vat_Code, Original_Sell_Price,'
      '  Markup_Type, Markup_Value, Quantity_Overs, Line_is_sample)'
      'Values'
      
        '(:Sales_Order, :Line, :Part, :Part_Cost, :Purch_pack_quantity, :' +
        'Part_Sales_Price, :Sell_Pack_Quantity,'
      
        '  :Quantity_Ordered, :Quantity_Allocated, :Quantity_Delivered, :' +
        'Contract,'
      
        '  :Contract_Line_No, :Sales_Order_Line_Status, :Quantity_Invoice' +
        'd,'
      '  :Discount_Type,'
      '  :Discount_Value,'
      '  :Vat_Code,'
      '  :Original_Sell_Price,'
      '  :Markup_Type, '
      '  :Markup_Value,'
      '  :Quantity_Overs, :Line_is_Sample)'
      ''
      '  '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 120
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Part_Cost'
      end
      item
        Name = 'Purch_pack_quantity'
      end
      item
        Name = 'Part_Sales_Price'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Contract'
        DataType = ftInteger
      end
      item
        Name = 'Contract_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Line_Status'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Discount_Type'
        DataType = ftString
      end
      item
        Name = 'Discount_Value'
        DataType = ftFloat
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Original_Sell_Price'
        DataType = ftCurrency
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Value'
        DataType = ftFloat
      end
      item
        Name = 'Quantity_Overs'
        DataType = ftInteger
      end
      item
        Name = 'Line_is_Sample'
      end>
  end
  object UpdSOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order_Line'
      'Set'
      ' Part = :Part,'
      ' Part_Sales_Price = :Part_Sales_Price,'
      ' Sell_Pack_Quantity = :Sell_Pack_Quantity,'
      ' Quantity_Ordered = :Quantity_Ordered,'
      ' Sales_Order_Line_Status = :Sales_Order_Line_Status,'
      ' Vat_Code = :Vat_Code,'
      ' Part_Cost = :Part_Cost,'
      ' Purch_Pack_Quantity = :Purch_Pack_Quantity,'
      ' Discount_value = :Discount_Value,'
      ' Discount_Type = :Discount_type,'
      ' Quantity_Delivered = :Quantity_Delivered,'
      ' Quantity_Invoiced = :Quantity_Invoiced,'
      ' Markup_Type = :Markup_Type,'
      ' Markup_Value = :Markup_Value,'
      ' Quantity_Overs = :Quantity_Overs,'
      ' Line_is_Sample = :line_is_Sample'
      'Where (Sales_Order = :Sales_Order) and'
      '      (Sales_Order_Line_No = :Line)'
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
    Left = 224
    Top = 288
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Part_Sales_Price'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'Sell_Pack_Quantity'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Quantity_Ordered'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sales_Order_Line_Status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Part_Cost'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Discount_Value'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'Discount_type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Quantity_Delivered'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Markup_Value'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'Quantity_Overs'
      end
      item
        Name = 'line_is_Sample'
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Sales_Order_Line_Status.Description'
      'From Sales_Order_Line_Status'
      'Where Sales_Order_Line_Status = :Sales_Order_Line_Status')
    Left = 304
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Order_Line_Status'
      end>
  end
  object GetCustContSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_No, Name,'
      '  contact_info.*'
      'From Customer_Contact'
      
        '  left join contact_info on (customer_contact.contact_info = con' +
        'tact_info.contact_info)'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)')
    Left = 32
    Top = 72
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetSOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT SO.*, C.Name as CustomerName, CB.Name as BranchName,'
      
        '       O.Name as Operator_Name, CC.Name as Contact_Name, AM.Name' +
        ' as Account_Manager'
      'FROM  Sales_Order SO, Customer C, Customer_Branch CB,'
      '      Operator O, Customer_Contact CC, Operator AM'
      'WHERE SO.Sales_Order = :Sales_Order and'
      '  SO.Customer = CB.Customer and'
      '  SO.Branch_No = CB.Branch_No and'
      '  CB.Customer = C.Customer and'
      '  (SO.Operator = O.Operator) and'
      '  (SO.Office_Contact = AM.Operator) and'
      '  ('
      '  (SO.Customer = CC.Customer) and'
      '  (SO.Branch_no = CC.Branch_no) and'
      '  (SO.Contact_no = CC.Contact_No)'
      '  )'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 400
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order'
      '  (Sales_Order,'
      '  Office_Contact,'
      '  Operator,'
      '  Date_Required,'
      '  Date_Ordered,'
      '  Cust_Order_No,'
      '  Customer,'
      '  Branch_No,'
      '  Cost_Centre,'
      '  Customer0,'
      '  Order_Type,'
      '  Sales_Order_Head_Status,'
      '  Narrative,'
      '  Contact_No,'
      '  Part_Store,'
      '  Delivery_Notes,'
      '  Delivery_Customer,'
      '  Delivery_Branch,'
      '  Replenish_Source,'
      '  Supplier,'
      '  Branch_no0,'
      '  Supp_Order_type,'
      '  Ad_Hoc_Address,'
      '  Production_Location,'
      '  Account_Team,'
      '  Delivery_Contact_Name,'
      '  Cash_Sales,'
      '  inactive)'
      'values'
      '  (:Sales_Order,'
      '  :Office_Contact,'
      '  :Operator,'
      '  :Date_Reqd,'
      '  :Date_Ordrd,'
      '  :Cust_Order_no,'
      '  :Customer,'
      '  :Branch_No,'
      '  :Cost_Centre,'
      '  :Customer0,'
      '  :Order_Type,'
      '  :Sales_Order_Head_Status,'
      '  :Narrative,'
      '  :Contact_No,'
      '  :Part_Store,'
      '  :Delivery_Notes,'
      '  :Delivery_Customer,'
      '  :Delivery_Branch,'
      '  :Replenish_Source,'
      '  :Supplier,'
      '  :Branch_no0,'
      '  :Supp_Order_type,'
      '  :Ad_Hoc_Address,'
      '  :Production_Location,'
      '  :Account_Team,'
      '  :Delivery_Contact_Name,'
      '  :Cash_Sales,'
      '  :inactive)'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 16
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Date_Reqd'
        DataType = ftDateTime
      end
      item
        Name = 'Date_Ordrd'
        DataType = ftDateTime
      end
      item
        Name = 'Cust_Order_no'
        DataType = ftString
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Cost_Centre'
        DataType = ftString
      end
      item
        Name = 'Customer0'
        DataType = ftInteger
      end
      item
        Name = 'Order_Type'
        DataType = ftString
      end
      item
        Name = 'Sales_Order_Head_Status'
        DataType = ftInteger
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Notes'
        DataType = ftString
      end
      item
        Name = 'Delivery_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Replenish_Source'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no0'
        DataType = ftInteger
      end
      item
        Name = 'Supp_Order_type'
        DataType = ftString
      end
      item
        Name = 'Ad_Hoc_Address'
        DataType = ftInteger
      end
      item
        Name = 'Production_Location'
        DataType = ftInteger
      end
      item
        Name = 'Account_Team'
      end
      item
        Name = 'Delivery_Contact_Name'
      end
      item
        Name = 'Cash_Sales'
      end
      item
        Name = 'inactive'
      end>
  end
  object GetLineDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Sales_Order_Line'
      'Where Sales_Order = :Sales_Order'
      'Order By Sales_Order_Line_No'
      ' '
      ' '
      ' ')
    Left = 400
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object GetDelSOLinesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Sales_Order_Line_No'
      'From Sales_Order_Line'
      'Where (Sales_Order = :Sales_Order)'
      ''
      ' '
      ' ')
    Left = 480
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Sales_Order'
      'Where'
      '(Sales_Order = :Sales_Order)'
      ' ')
    Left = 224
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object GetPartDescSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select part.Part_Description, Purch_Pack_Quantity, Sell_Pack_Qua' +
        'ntity, Numbered, Product_Type'
      'From Part'
      'Where Part = :Part'
      ' '
      ' ')
    Left = 32
    Top = 128
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object GetPartDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Part'
      'where part.part = :Part')
    Left = 128
    Top = 128
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
      end>
  end
  object StoreSRC: TDataSource
    AutoEdit = False
    DataSet = StoreSQL
    Left = 224
    Top = 232
  end
  object StoreSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store_Name, Part_Store'
      'from Part_Store'
      'Order by Part_Store_Name')
    Left = 224
    Top = 184
  end
  object GetCustCstCntrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Cost_centre'
      'from Customer_CostCentre'
      'where customer_CostCentre.Customer = :Customer'
      ''
      ' ')
    Left = 128
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object GetPartDiscSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select discount_value, discount_type, date_effective, date_ineff' +
        'ective'
      'from customer_discount'
      'where (customer = :Customer) and'
      '      (part = :Part) and'
      '      (:OrderDate >= date_effective) and'
      '      ((:OrderDate <= date_ineffective) or'
      #9'date_ineffective is null)')
    Left = 224
    Top = 128
    ParamData = <
      item
        Name = 'customer'
        DataType = ftInteger
      end
      item
        Name = 'part'
        DataType = ftString
      end
      item
        Name = 'OrderDate'
        DataType = ftDateTime
      end
      item
        Name = 'OrderDate'
        DataType = ftDateTime
      end>
  end
  object GetGroupDiscSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select discount_value, discount_type, date_effective, date_ineff' +
        'ective'
      'from customer_discount'
      'where (customer = :Customer) and'
      '      (part_group = :Part_Group) and'
      '      (:OrderDate >= date_effective) and'
      '      ((:OrderDate <= date_ineffective) or'
      #9'date_ineffective is null)'
      ' ')
    Left = 224
    Top = 64
    ParamData = <
      item
        Name = 'customer'
        DataType = ftInteger
      end
      item
        Name = 'part_group'
        DataType = ftInteger
      end
      item
        Name = 'OrderDate'
      end
      item
        Name = 'OrderDate'
      end>
  end
  object DefWHouseSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Default_Warehouse'
      'from company'
      'where company = 1')
    Left = 32
    Top = 184
  end
  object UpdSOLineRepPercSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_OrderRep'
      'Set'
      ' Rep_Percentage = :Rep_Percentage'
      'Where (Sales_Order = :Sales_Order) and'
      '      (Rep = :Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 80
    Top = 360
    ParamData = <
      item
        Name = 'Rep_Percentage'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Rep'
      end>
  end
  object AddSOLineRepPercSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_OrderRep'
      '(Sales_Order, Rep, Rep_Percentage)'
      'Values'
      '(:Sales_Order, :Rep, :Rep_Percentage)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 312
    Top = 184
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep_Percentage'
      end>
  end
  object DelSOLineRepPercSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Sales_OrderRep'
      'Where (Sales_Order = :Sales_Order) and'
      '      (Rep = :Rep)'
      ' '
      ' '
      ' '
      ' ')
    Left = 312
    Top = 240
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Rep'
      end>
  end
  object GetRepDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_OrderRep.*, Name'
      'from Sales_OrderRep, Rep'
      'where (sales_order = :Sales_Order) and'
      '      (Sales_orderRep.Rep = Rep.Rep)')
    Left = 392
    Top = 64
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end>
  end
  object GetCustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer'
      'from Customer_Branch'
      'where Account_Code = :Account_Code')
    Left = 312
    Top = 288
    ParamData = <
      item
        Name = 'Account_Code'
      end>
  end
  object GetPartSRC: TDataSource
    DataSet = GetPartSQL
    Left = 400
    Top = 192
  end
  object GetPartSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select part'
      'from part')
    Left = 456
    Top = 192
  end
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Rep'
      'where ((inactive = '#39'N'#39') or (inactive is NULL) or Rep = :Rep)'
      'order by name')
    Left = 400
    Top = 288
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object RepSRC: TDataSource
    DataSet = RepSQL
    Left = 400
    Top = 336
  end
  object GetCustRepsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Rep, Is_Main_Rep'
      'From Reps_Branches'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)'
      'Order By Is_Main_Rep Desc')
    Left = 480
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer'
      'where Customer = :Customer')
    Left = 128
    Top = 344
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetCustBrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer_Branch.*'
      'from Customer_Branch'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no'
      ' ')
    Left = 224
    Top = 336
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object DelAllRepPercSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sales_OrderRep'
      'where Sales_Order = :Sales_Order')
    Left = 312
    Top = 336
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object GetCustAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name, Customer_Branch.*'
      'from Customer, Customer_Branch'
      'where Customer_Branch.Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Customer_Branch.Customer = Customer.Customer')
    Left = 464
    Top = 288
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object GetOSSObySuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Sales_Order.Sales_Order'
      
        'FROM Sales_Order Join Replenish_Source on(Sales_Order.Replenish_' +
        'Source = Replenish_Source.Replenish_Source)'
      'WHERE Sales_Order_Head_Status = 10 and'
      '      Replenish_Source.Replenish_ID = '#39'S'#39' and'
      '      Supplier = :Supplier;'
      ' ')
    Left = 32
    Top = 320
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end>
  end
  object qryCompanyDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Company '
      'WHERE Company = :Company')
    Left = 128
    Top = 392
    ParamData = <
      item
        Name = 'Company'
        DataType = ftInteger
      end>
  end
  object qryGetContactName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Customer_Contact '
      'WHERE Customer = :Customer and'
      '  Branch_No = :Branch_No and '
      '  Contact_No = :Contact_No')
    Left = 224
    Top = 392
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qryUpdSOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Order '
      'SET Sales_Order_Head_Status = :Status'
      'WHERE Sales_Order = :Sales_Order;')
    Left = 312
    Top = 392
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object GetVatRateSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select vat_Code.Vat_Rate'
      'from Vat_Code, Customer'
      'WHERE ((Customer.Customer) = (:Customer) and'
      '  (Vat_code.Vat_code) = (Customer.Vat_code_Def))'
      ' ')
    Left = 456
    Top = 248
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object UpdLastInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Invoice_No = :Last_Invoice_No'
      'Where Company = 1'
      ' '
      ' ')
    Left = 464
    Top = 336
    ParamData = <
      item
        Name = 'Last_Invoice_No'
      end>
  end
  object AddInvSQL: TFDQuery
    ConnectionName = 'PB'
    Left = 72
    Top = 8
  end
  object UpdInvHeadSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Sales_invoice'
      
        'set Goods_Value=:Goods, VAT_Value=:VAT, Operator=:Operator,Custo' +
        'mer=:Customer,'
      ' Branch_no=:Branch, Sales_Invoice_Status=:Status,'
      
        ' Invoice_Date=:Invoice_Date, Currency_Code=:Currency_Code, Sales' +
        '_Invoice_Type = :Sales_Invoice_Type,'
      
        ' Inv_to_Customer=:Inv_to_Customer, Inv_to_Branch=:Inv_to_Branch,' +
        ' Invoice_or_Credit = :Inv_or_Cred,'
      ' Narrative = :Narrative'
      'Where Sales_Invoice = :Number'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 400
    Top = 384
    ParamData = <
      item
        Name = 'Goods'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VAT'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Invoice_Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sales_Invoice_Type'
      end
      item
        Name = 'Inv_to_Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Inv_to_Branch'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Inv_or_Cred'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Number'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object AddInvLineSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Sales_Invoice_Line (Sales_Invoice,'
      
        '                                                 Invoice_Line_no' +
        ','
      '                                                 Sales_Order,'
      
        '                                                 Sales_Order_Lin' +
        'e_No,'
      '                                                 Qty_Invoiced,'
      '                                                 Goods_Value,'
      '                                                 VAT_Code,'
      '                                                 VAT_Value,'
      '                                                 Product_Type,'
      
        '                                                 Sales_Invoice_S' +
        'tatus,'
      '                                                 Price_unit,'
      '                                                 Nominal,'
      '                                                 Narrative)'
      'values (:Number,'
      '            :Line,'
      '            :Order,'
      '            :SO_Line,'
      '            :Quantity,'
      '            :Goods,'
      '            :Code,'
      '            :VAT,'
      '            :Product,'
      '            :Status,'
      '            :Unit,'
      '            :Nominal,'
      '            :Narrative)'
      ' '
      ' '
      ' '
      ' ')
    Left = 488
    Top = 384
    ParamData = <
      item
        Name = 'Number'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Order'
      end
      item
        Name = 'SO_Line'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Goods'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'VAT'
      end
      item
        Name = 'Product'
        DataType = ftInteger
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Unit'
      end
      item
        Name = 'Nominal'
        DataType = ftString
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end>
  end
  object AddInvHeadSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Sales_invoice'
      '(Sales_Invoice,'
      'Goods_Value,'
      'VAT_Value,'
      'Operator,'
      'Customer,'
      'Branch_no,'
      'Sales_Invoice_Status,'
      'Invoice_Date,Currency_Code)'
      
        'Select Max(Sales_Invoice)+1, 0, 0, :Operator, :Customer, :Branch' +
        '_No,'
      '10, :Date, Null From Sales_Invoice'
      ' '
      ' ')
    Left = 32
    Top = 448
    ParamData = <
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end>
  end
  object GetInvoiceNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice'
      'from Sales_Invoice'
      'where Invoice_Date = :Date and Operator = :Operator and'
      'Customer = :Customer and Branch_No = :Branch_No'
      ' ')
    Left = 128
    Top = 448
    ParamData = <
      item
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UpdInvLineSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Update Sales_Invoice_Line'
      'Set Qty_Invoiced = :Quantity,'
      '    Goods_Value = :Goods,'
      '    VAT_Value = :VAT,'
      '    Vat_Code = :Vat_Code,'
      '    Nominal = :Nominal'
      'where'
      '  (Sales_Invoice_Line.Sales_Invoice = :Number) and'
      '  (Sales_Invoice_Line.Sales_Order = :OrderNo) and'
      '  (Sales_Invoice_Line.Sales_order_Line_No = :SO_Line)'
      ''
      ' ')
    Left = 216
    Top = 448
    ParamData = <
      item
        Name = 'Quantity'
      end
      item
        Name = 'Goods'
      end
      item
        Name = 'VAT'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Number'
      end
      item
        Name = 'OrderNo'
      end
      item
        Name = 'SO_Line'
      end>
  end
  object GetInvoiceSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'Select Sales_Invoice.*, Sales_Invoice_Line.Sales_Order, Sales_In' +
        'voice_Line.Nominal'
      ' from Sales_Invoice, Sales_Invoice_Line'
      'where'
      '  (Sales_Invoice.Sales_Invoice = :Number) and'
      '  (Sales_Invoice_Line.Sales_Invoice = :Number)'
      ''
      ' '
      ' '
      ' ')
    Left = 312
    Top = 448
    ParamData = <
      item
        Name = 'Number'
      end
      item
        Name = 'Number'
      end>
  end
  object GetExtChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Sales_Order_Add_Charge'
      'Where Sales_Order = :Sales_Order'
      'Order By Details'
      ' '
      ' ')
    Left = 536
    Top = 440
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object GetExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Sales_Invoice_Add_Charge'
      'Where (Sales_Invoice = :Sales_Invoice) and'
      '      (Additional_Charge = :Additional_Charge)'
      ''
      ' '
      ' ')
    Left = 456
    Top = 448
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object AddExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Invoice_Add_Charge'
      
        '            (Sales_Invoice, Additional_Charge, Details, Nominal,' +
        ' Amount, Vat_Code)'
      'Values'
      
        '            (:Sales_invoice, :Additional_Charge, :Details, :Nomi' +
        'nal, :Amount, :Vat_Code)'
      ''
      ''
      ' '
      ' ')
    Left = 544
    Top = 384
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
        Name = 'Nominal'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
      end>
  end
  object UpdExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_invoice_Add_Charge'
      'Set'
      'Details = :Details,'
      'Amount = :Amount ,'
      'Vat_Code = :Vat_Code'
      'Where'
      '(Sales_Invoice = :Sales_Invoice) and'
      '(Additional_Charge = :Additional_Charge)'
      ''
      ''
      ''
      ' '
      ' ')
    Left = 272
    Top = 280
    ParamData = <
      item
        Name = 'Details'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object GetExtChgsInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Sales_Invoice_Add_Charge'
      'Where Sales_Invoice = :Sales_Order'
      'Order By Details'
      ' '
      ' '
      ' ')
    Left = 288
    Top = 208
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object GetSuppOTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Supplier_order_type'
      'where Supplier = :Supplier')
    Left = 32
    Top = 384
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object GetSuppOTypeSRC: TDataSource
    DataSet = GetSuppOTypeSQL
    Left = 112
    Top = 328
  end
  object RepSourceSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Replenish_Source')
    Left = 248
    Top = 336
  end
  object RepSourceSRC: TDataSource
    DataSet = RepSourceSQL
    Left = 312
    Top = 336
  end
  object GetSuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name, Discount'
      'from Supplier'
      'where Supplier = :Supplier')
    Left = 32
    Top = 8
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object GetSuppBrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name'
      'from Supplier_Branch'
      'where Supplier = :Supplier and'
      'Branch_No = :Branch_no')
    Left = 120
    Top = 16
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object GetPartVatRateSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select vat_Code.Vat_Rate , Vat_Code.Vat_code'
      'from Vat_Code, Part'
      'WHERE ((Part.Part) = (:Part) and'
      '  (Vat_code.Vat_code) = (Part.Vat_code))'
      ' '
      ' '
      ' ')
    Left = 392
    Top = 248
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
      end>
  end
  object GetRateSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select vat_Code.Vat_Rate'
      'from Vat_Code'
      'where'
      '  (Vat_code.Vat_code) = (:Vat_code)'
      ' '
      ' '
      ' '
      ' ')
    Left = 288
    Top = 256
    ParamData = <
      item
        Name = 'Vat_code'
        DataType = ftInteger
      end>
  end
  object GetPartSuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part_Supplier'
      'where SUpplier = :Supplier and'
      'Branch_No = :Branch_no and'
      'Part = :Part')
    Left = 520
    Top = 192
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Part'
      end>
  end
  object DelExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Sales_invoice_Add_Charge'
      'Where'
      '(Sales_Invoice = :Sales_Invoice)'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 392
    Top = 448
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object AddOrdExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order_Add_Charge'
      
        '            (Sales_Order, Additional_Charge, Details, Nominal, A' +
        'mount, Vat_Code, Cost)'
      'Values'
      
        '            (:Sales_Order, :Additional_Charge, :Details, :Nomina' +
        'l, :Amount, :Vat_Code, :Cost)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 544
    Top = 312
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Additional_Charge'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
      end>
  end
  object DelOrdExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Sales_Order_Add_Charge'
      'Where'
      '(Sales_Order = :Sales_Order)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 536
    Top = 256
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryListSOwithoutPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Sales_Order.Sales_Order as Sales_Order,'
      '       Supplier.name as Supplier_Name'
      'FROM Sales_Order Inner Join Supplier on'
      '      Sales_order.Supplier = Supplier.Supplier'
      'WHERE (Sales_Order.Sales_Order not in'
      '      (SELECT Purch_ord.Sales_order'
      '       FROM Purch_Ord'
      '       WHERE Sales_Order.Sales_Order = purch_ord.Sales_order)'
      '       ) and'
      '       (Sales_Order.Sales_order_Head_Status < 30) and'
      '       (Sales_Order.Replenish_Source = 1);'
      ''
      ' '
      ' '
      ' ')
    Left = 560
    Top = 8
  end
  object dtsrcGeneral: TDataSource
    DataSet = qryListSOwithoutPO
    Left = 560
    Top = 56
  end
  object GetDiscTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Discount_Type')
    Left = 560
    Top = 128
  end
  object GetDiscTypeSRC: TDataSource
    DataSet = GetDiscTypeSQL
    Left = 560
    Top = 192
  end
  object GetInvLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Sales_Invoice_Line.Goods_Value, Qty_Invoiced'
      'from Sales_Invoice_Line , Sales_Invoice'
      'where'
      '(Sales_Invoice_Line.Sales_Order = :OrderNo) and'
      '(Sales_Invoice_Line.Sales_order_Line_No = :LineNo) and'
      '(Sales_Invoice.Invoice_or_Credit = :InvorCred) and'
      '(Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice)'
      ' '
      ' ')
    Left = 32
    Top = 264
    ParamData = <
      item
        Name = 'OrderNo'
      end
      item
        Name = 'LineNo'
      end
      item
        Name = 'InvorCred'
        DataType = ftString
      end>
  end
  object qryGetCallOffDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_Order.*,'
      '       Purchase_OrderLine.*'
      'from Purchase_Order, Purchase_OrderLine '
      
        'where ((Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) and'
      
        '       ((round(Purchase_Order.Purchase_Order, 0)) = (Purchase_Or' +
        'derLine.Original_Order)) and'
      '       (purchase_order.purch_ord_head_status = 20) and'
      '       (customer = :customer) and'
      '       (Purchase_OrderLine.branch_no = :branch_no) and'
      '       (cust_order_no = :cust_order_no) and'
      '       (Goods_Required = :goods_required));')
    Left = 24
    Top = 496
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'cust_order_no'
      end
      item
        Name = 'goods_required'
      end>
  end
  object qryCallOffList: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_OrderLine.customer, '
      '       Purchase_OrderLine.Branch_no,'
      '       Purchase_OrderLine.Cust_Order_No, '
      '       Purchase_orderLine.Goods_Required'
      'from Purchase_Order, Purchase_OrderLine '
      
        'where ((Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) and'
      
        '       ((round(Purchase_Order.Purchase_Order, 0)) = (Purchase_Or' +
        'derLine.Original_Order)) and'
      '       (Purchase_OrderLine.InActive <> '#39'Y'#39') and'
      '       (purchase_order.purch_ord_head_status = 20))'
      'group by Purchase_OrderLine.customer, '
      '         Purchase_OrderLine.Branch_no, '
      '         Purchase_OrderLine.Cust_Order_No, '
      '         Purchase_orderLine.Goods_Required;')
    Left = 112
    Top = 473
  end
  object qryGetFormRefDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * '
      'from Form_Reference '
      'where form_reference = :form_reference;')
    Left = 216
    Top = 496
    ParamData = <
      item
        Name = 'form_reference'
      end>
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'delivery_location.description,'
      #9'delivery_location.quantity, '
      #9'delivery_location.quantity_allocated,'
      #9'delivery_detail.delivery_to_Stock,'
      #9'Purchase_orderline.Form_reference,'
      #9'Form_reference.form_reference_id,'
      #9'Form_reference.form_reference_descr,'
      #9'Purchase_orderline.Purchase_order,'
      #9'delivery_detail.stock_location_desc,'
      '                Purchase_orderline.Forms_per_Box,'
      '                Purchase_orderline.Cust_Order_no,'
      '                Purchase_OrderLine.Order_Price,'
      '                Purchase_OrderLine.Selling_Price,'
      '                Purchase_OrderLine.Order_Unit,'
      '                Purchase_OrderLine.Sell_Unit,'
      '                Purchase_OrderLine.Vat_Code,'
      '                Form_reference.customer,'
      '                Form_reference.branch_no,'
      
        #9'(delivery_location.quantity - delivery_location.quantity_alloca' +
        'ted) as Qty_in_stock'
      
        'from delivery_location, delivery_detail, Purchase_orderline, for' +
        'm_reference'
      'where'
      '('
      
        '(Delivery_location.purchase_order = Delivery_Detail.purchase_ord' +
        'er) and'
      '(Delivery_location.Line = Delivery_Detail.Line) and'
      '(Delivery_location.delivery_no = Delivery_Detail.delivery_no)'
      ') and'
      '(Delivery_Detail.delivery_to_Stock = '#39'Y'#39') and'
      '('
      
        '(Delivery_location.purchase_order = Purchase_orderline.purchase_' +
        'order) and'
      '(Delivery_location.Line = Purchase_orderline.Line)'
      ') and'
      
        '(Purchase_orderline.form_reference = Form_reference.form_referen' +
        'ce)'
      ' ')
    Left = 304
    Top = 496
    object qryReportDescription: TWideStringField
      FieldName = 'description'
      FixedChar = True
      Size = 40
    end
    object qryReportquantity: TIntegerField
      FieldName = 'quantity'
    end
    object qryReportquantity_allocated: TIntegerField
      FieldName = 'quantity_allocated'
    end
    object qryReportdelivery_to_Stock: TStringField
      FieldName = 'delivery_to_Stock'
      FixedChar = True
      Size = 2
    end
    object qryReportForm_reference: TIntegerField
      FieldName = 'Form_reference'
    end
    object qryReportform_reference_id: TStringField
      FieldName = 'form_reference_id'
      FixedChar = True
      Size = 100
    end
    object qryReportform_reference_descr: TStringField
      FieldName = 'form_reference_descr'
      FixedChar = True
      Size = 100
    end
    object qryReportPurchase_order: TFloatField
      FieldName = 'Purchase_order'
    end
    object qryReportstock_location_desc: TStringField
      FieldName = 'stock_location_desc'
      FixedChar = True
      Size = 80
    end
    object qryReportForms_per_Box: TStringField
      FieldName = 'Forms_per_Box'
      FixedChar = True
      Size = 40
    end
    object qryReportCust_Order_no: TStringField
      FieldName = 'Cust_Order_no'
      FixedChar = True
      Size = 50
    end
    object qryReportcustomer: TIntegerField
      FieldName = 'customer'
    end
    object qryReportbranch_no: TIntegerField
      FieldName = 'branch_no'
    end
    object qryReportQty_in_stock: TIntegerField
      FieldName = 'Qty_in_stock'
    end
    object qryReportOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryReportSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryReportOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryReportSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qryReportVat_Code: TIntegerField
      FieldName = 'Vat_Code'
    end
  end
  object PriceUnitSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_unit = :Price_Unit')
    Left = 392
    Top = 496
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object CheckPartExistsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part From Part Where Part = :Part'
      ' ')
    Left = 464
    Top = 504
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object UpdPartQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set Part_Purchase_Price = :Part_Purchase_Price,'
      '  Purch_Pack_Quantity = :Purch_Pack_Quantity'
      'where'
      '  Part = :Part')
    Left = 528
    Top = 496
    ParamData = <
      item
        Name = 'Part_Purchase_Price'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Part'
      end>
  end
  object AddPartQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part'
      
        '(Part, Part_Description, Part_Cost_List, Part_Cost_Cat, Vat_Code' +
        ', Part_Updated,'
      
        '       Auto_Update, Part_Group, Purch_Pack_Quantity, Sell_Pack_Q' +
        'uantity,'
      '       Part_Purchase_Price, Part_Mark_Up_List, Part_Mark_Up_Cat,'
      '       Not_In_Use, Track_Serial_No, Last_Store_Lot)'
      'Values'
      
        '(:Part, :Part_Description, :Part_Cost_List, :Part_Cost_Cat, :Vat' +
        ', '#39'Y'#39','
      
        '       :Auto_Update, :Part_Group, :Purch_Pack_Quantity, :Sell_Pa' +
        'ck_Quantity,'
      
        '       :Part_Purchase_Price, :Part_Mark_Up_List, :Part_Mark_Up_C' +
        'at,'
      '       :Not_In_Use, :Track_Serial_No, '#39'LOT00000'#39')'
      ''
      ' '
      ' '
      ' ')
    Left = 584
    Top = 496
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Description'
      end
      item
        Name = 'Part_Cost_List'
      end
      item
        Name = 'Part_Cost_Cat'
      end
      item
        Name = 'Vat'
      end
      item
        Name = 'Auto_Update'
      end
      item
        Name = 'Part_Group'
        DataType = ftString
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Part_Purchase_Price'
      end
      item
        Name = 'Part_Mark_Up_List'
      end
      item
        Name = 'Part_Mark_Up_Cat'
      end
      item
        Name = 'Not_In_Use'
      end
      item
        Name = 'Track_Serial_No'
      end>
  end
  object qryGetDelivDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select * from Delivery_detail where purchase_order = :purchase_o' +
        'rder')
    Left = 24
    Top = 552
    ParamData = <
      item
        Name = 'purchase_order'
      end>
  end
  object qryGetPOAddChgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Purch_Ord_line_Add_chg '
      'where purchase_order = :purchase_order and'
      'line = :line')
    Left = 112
    Top = 488
    ParamData = <
      item
        Name = 'purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object qryGetCustVat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Vat_Rate '
      'from Vat_Code  '
      'where Vat_Code = (Select Vat_Code_Def '
      '                               From Customer '
      '                               Where Customer = :Customer);')
    Left = 192
    Top = 440
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetDelInvLinesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Invoice_Line_No'
      'From Sales_Invoice_Line'
      'Where (Sales_Invoice = :Sales_Invoice)'
      ' ')
    Left = 120
    Top = 312
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object DelInvLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Sales_Invoice_Line'
      'Where (Sales_Invoice = :Sales_Invoice) and'
      '       (Invoice_Line_No = :Line)'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 112
    Top = 316
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Line'
      end>
  end
  object DelInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Sales_Invoice'
      'Where'
      '(Sales_Invoice = :Sales_Invoice)'
      ' ')
    Left = 80
    Top = 316
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object GetInvDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_Invoice_Line.*, sales_Order_Line .*'
      'from Sales_Invoice_Line'
      '  LEFT JOIN Sales_Order_Line on'
      
        '    (Sales_Order_Line.Sales_Order = sales_invoice_line.sales_ord' +
        'er) and'
      
        '      (Sales_Order_Line.Sales_Order_Line_No = Sales_Invoice_Line' +
        '.Sales_Order_Line_No)'
      'where sales_invoice = :sales_Invoice'
      'order by sales_invoice, invoice_line_no')
    Left = 112
    Top = 320
    ParamData = <
      item
        Name = 'sales_Invoice'
      end>
  end
  object QryGetAdHoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Ad_Hoc_Address'
      'where ad_Hoc_Address = :AdHoc'
      ' '
      ' ')
    Left = 120
    Top = 312
    ParamData = <
      item
        Name = 'AdHoc'
      end>
  end
  object GetStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Store_Stock.Part,'
      #9'Store_Stock.Part_Store,'
      '  Part.Part_Description,'
      #9'sum(store_Quantity) as Total_Stock,'
      #9'sum(Quantity_Allocated) as Total_Allocated,'
      #9'sum(store_Quantity-Quantity_Allocated) as Free_Stock,'
      #9'(select sum(store_quantity-Quantity_Allocated)'
      #9'from Store_Stock SS'
      #9'where (SS.Part = Store_Stock.Part) and'
      #9#9'(SS.Part_Store = Store_Stock.Part_Store) and'
      #9#9'(SS.Invoice_Upfront = '#39'Y'#39')) as Total_Paid,'
      #9'(select sum(store_quantity-Quantity_Allocated)'
      #9'from Store_Stock SS'
      #9'where (SS.Part = Store_Stock.Part)) as Total_in_Company,'
      '  Part_Store_Levels.Minimum_Stock,'
      '  Part_Store_Levels.Maximum_Stock,'
      '  Part_Store_Levels.Reorder_Level'
      'FROM Part_Store_Levels'
      '    INNER JOIN (Part'
      '    INNER JOIN Store_Stock'
      '      ON Part.Part = Store_Stock.Part)'
      '      ON Part_Store_Levels.Part = Part.Part'
      
        'WHERE Store_Stock.Part = :Part and Store_Stock.Part_Store = :Par' +
        't_Store'
      'GROUP BY  Store_Stock.Part,'
      '          Store_Stock.Part_Store,'
      '          Part.Part_Description,'
      '          Part_Store_Levels.Minimum_Stock,'
      '          Part_Store_Levels.Maximum_Stock,'
      '          Part_Store_Levels.Reorder_Level')
    Left = 600
    Top = 256
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store'
      end>
  end
  object GetSOSerialNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_order_line_Serial_no'
      'where Sales_order = :Sales_order'
      'order by Sales_order_line_no asc')
    Left = 640
    Top = 384
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object DelSOSerialNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sales_order_Line_Serial_no'
      'where Sales_order = :Sales_order and'
      'Sales_Order_Line_no = :Sales_order_Line_no'
      ' ')
    Left = 648
    Top = 8
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_order_Line_no'
      end>
  end
  object AddSerialNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Order_line_Serial_no'
      
        '(Sales_order, Sales_order_line_no, Serial_item_no, Serial_Item_F' +
        'rom, Serial_Item_to, Sets_per_pad)'
      'values'
      
        '(:Sales_order, :Sales_order_line_no, :Serial_item_no, :Serial_It' +
        'em_From, :Serial_Item_to, :Sets_Per_Pad)')
    Left = 648
    Top = 56
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_order_line_no'
      end
      item
        Name = 'Serial_item_no'
      end
      item
        Name = 'Serial_Item_From'
      end
      item
        Name = 'Serial_Item_to'
      end
      item
        Name = 'Sets_Per_Pad'
      end>
  end
  object AddStStkSerialNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Store_stock_Serial_item'
      
        '(Store_Stock, Serial_item_no, Serial_item_from, Serial_Item_To, ' +
        'Sales_Order, Sales_order_line_no)'
      'values'
      
        '(:Store_Stock, :Serial_item_no, :Serial_item_from, :Serial_Item_' +
        'To, :Sales_Order, :Sales_order_line_no)')
    Left = 648
    Top = 104
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Serial_item_no'
      end
      item
        Name = 'Serial_item_from'
      end
      item
        Name = 'Serial_Item_To'
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_order_line_no'
        DataType = ftInteger
      end>
  end
  object DelStStkSerialNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Store_Stock_Serial_item'
      'where Store_Stock = :Store_Stock and'
      'Serial_item_no = :Serial_item_no')
    Left = 640
    Top = 168
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Serial_item_no'
      end>
  end
  object GetNextStStkSerialNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Serial_item_no) as Last_Serial_no'
      'from Store_stock_serial_item'
      'where Store_stock = :Store_Stock')
    Left = 640
    Top = 232
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
  object GetStockSerialNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Store_Stock.Store_Stock,'
      '           Store_Stock.Part,'
      '           Store_Stock_Serial_item.Serial_item_no,'
      '           Store_Stock_Serial_item.Serial_item_from,'
      '           Store_Stock_Serial_item.Serial_item_to,'
      
        '           (Store_Stock_Serial_item.Serial_item_From + '#39' to '#39' + ' +
        'Store_Stock_Serial_item.Serial_item_to) as Serial_Range,'
      '           Store_Stock_Serial_item.Sales_order,'
      '           Store_Stock_Serial_item.Sales_order_line_no,'
      '           Store_Stock.Sets_Per_Pad'
      'from Store_Stock_Serial_item, Store_Stock'
      'where Store_Stock.Part = :Part and'
      '(Store_Stock.Store_Stock = Store_stock_serial_item.store_Stock)'
      'order by Serial_item_From')
    Left = 648
    Top = 304
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object MarkupSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Markup_Type')
    Left = 608
    Top = 440
  end
  object srcMarkup: TDataSource
    DataSet = MarkupSQL
    Left = 648
    Top = 440
  end
  object qryDelSOSerialNos: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sales_Order_line_serial_no '
      'where sales_order = :sales_order;')
    Left = 448
    Top = 104
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryDelSOSundry: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from sales_order_sundry '
      'where sales_order = :sales_order;')
    Left = 352
    Top = 120
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryDelSORep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from sales_orderrep '
      'where sales_order = :sales_order;')
    Left = 352
    Top = 168
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryDelSONarrative: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from narrative_line '
      'where narrative = :narrative;')
    Left = 184
    Top = 8
    ParamData = <
      item
        Name = 'narrative'
      end>
  end
  object qryDelSOPORef: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update purch_ord '
      'set sales_order = null'
      'where sales_order = :sales_order')
    Left = 352
    Top = 8
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qrySOLineInvdQty: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(qty_invoiced) as tot_invoiced '
      'from sales_invoice_line'
      'where sales_order = :SONum and'
      ' sales_order_line_no = :line')
    Left = 176
    Top = 116
    ParamData = <
      item
        Name = 'SONum'
      end
      item
        Name = 'line'
      end>
  end
  object qrySOLineDelivQty: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sum(quantity_picked) AS tot_picked, '
      #9'Sum(sales_order_line.quantity_delivered) AS tot_delivered'
      'FROM Sales_Order_line '
      #9'LEFT JOIN sales_order_delivery_line '
      
        #9#9'ON (Sales_Order_line.Sales_Order_line_no = sales_order_deliver' +
        'y_line.Sales_Order_line_no) AND (Sales_Order_line.Sales_Order = ' +
        'sales_order_delivery_line.Sales_Order)'
      'WHERE sales_order_line.sales_order = :SONum and'
      ' sales_order_line.Sales_Order_line_no = :line '
      ' '
      ' ')
    Left = 180
    Top = 176
    ParamData = <
      item
        Name = 'SONum'
      end
      item
        Name = 'line'
      end>
  end
  object qryPObySO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 * from purch_ord  '
      'where sales_order = :SONum')
    Left = 180
    Top = 240
    ParamData = <
      item
        Name = 'SONum'
      end>
  end
  object qryDelStoreStockSISOAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update store_stock_serial_item '
      'set sales_order = null,'
      ' sales_order_line_no = null '
      'where sales_order = :sales_order')
    Left = 80
    Top = 72
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qrySelContractbySO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from contract_line'
      'where sales_order = :Sales_Order'
      'and Sales_order_Line_no = :Sales_order_Line_no')
    Left = 440
    Top = 60
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_Line_no'
      end>
  end
  object qryGetBranchRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select rep'
      'from reps_branches'
      'where customer = :customer'
      'and branch_no = :branch_no')
    Left = 664
    Top = 504
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'branch_no'
      end>
  end
  object qryDelStrStckSOLineAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update store_stock_serial_item '
      'set sales_order = null,'
      ' sales_order_line_no = null '
      'where sales_order = :sales_order '
      'and Sales_order_line_no = :Sales_order_line_no'
      ' ')
    Left = 708
    Top = 28
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_order_Line_no'
      end>
  end
  object AddJobBagSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Line_Dets'
      '    (Job_Bag,'
      '    Job_Bag_Line,'
      '    Job_Bag_Line_Type,'
      '    sales_order,'
      '    sales_order_Line_no,'
      '    Supplier,'
      '    Branch_No,'
      '    Job_Bag_Line_Descr,'
      '    Job_Bag_Line_Cost,'
      '    Job_Bag_Line_Sell,'
      '    Job_Bag_Line_Invoiced,'
      '    Job_Bag_Quantity,'
      '    VAT_Code,'
      '    Currency_Code,'
      '    Product_Type,'
      '    Sequence_no)'
      'values'
      '    (:Job_Bag,'
      '    :Job_Bag_Line,'
      '    :Job_Bag_Line_Type,'
      '    :sales_order,'
      '    :sales_order_line_no,'
      '    :Supplier,'
      '    :Branch_No,'
      '    :Job_Bag_Line_Descr,'
      '    :Job_Bag_Line_Cost,'
      '    :Job_Bag_Line_Sell,'
      '    :Job_Bag_Line_Invoiced,'
      '    :Job_Bag_Quantity,'
      '    :VAT_Code,'
      '    :Currency_Code,'
      '    :Product_Type,'
      '    :Sequence_no)'
      '')
    Left = 775
    Top = 8
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end
      item
        Name = 'Job_Bag_Line_Type'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_Line_Descr'
      end
      item
        Name = 'Job_Bag_Line_Cost'
      end
      item
        Name = 'Job_Bag_Line_Sell'
      end
      item
        Name = 'Job_Bag_Line_Invoiced'
      end
      item
        Name = 'Job_Bag_Quantity'
        DataType = ftInteger
      end
      item
        Name = 'VAT_Code'
        DataType = ftInteger
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Sequence_no'
      end>
  end
  object GetLastJBLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Job_Bag_Line) as Last_JB_Line_Number'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag')
    Left = 800
    Top = 80
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object DelJobBagSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Job_Bag_Line_dets'
      'where sales_order = :sales_order and'
      '      sales_order_line_no = :sales_order_line_no and'
      '      Job_Bag = :Job_Bag')
    Left = 808
    Top = 144
    ParamData = <
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object UpdJobBagSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Job_Bag_Line_Dets'
      'set '
      'Job_Bag_Line_Type = :Job_Bag_line_type,'
      'Supplier = :Supplier,'
      'Branch_No = :Branch_no,'
      'Job_Bag_Line_Descr = :job_Bag_line_descr,'
      'Job_Bag_Line_Cost = :Job_Bag_Line_Cost,'
      'Job_Bag_Line_Sell = :Job_Bag_Line_Sell,'
      'Job_Bag_Line_Invoiced = :Job_Bag_Line_invoiced,'
      'Job_Bag_Quantity = :Job_Bag_Quantity,'
      'VAT_Code = :Vat_Code,'
      'Currency_Code = :Currency_code,'
      'Product_Type = :Product_Type'
      'WHERE Sales_Order = :Sales_Order and'
      
        'sales_order_line_no = :sales_order_line_no   and Job_Bag = :Job_' +
        'Bag'
      '')
    Left = 807
    Top = 208
    ParamData = <
      item
        Name = 'Job_Bag_Line_Type'
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_Line_Descr'
      end
      item
        Name = 'Job_Bag_Line_Cost'
      end
      item
        Name = 'Job_Bag_Line_Sell'
      end
      item
        Name = 'Job_Bag_Line_invoiced'
      end
      item
        Name = 'Job_Bag_Quantity'
      end
      item
        Name = 'VAT_Code'
        DataType = ftInteger
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetJBLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select job_bag, Job_Bag_Line'
      'from Job_Bag_line_Dets'
      'where sales_order = :sales_order and'
      'sales_order_line_no = :sales_order_line_no')
    Left = 808
    Top = 264
    ParamData = <
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryGetProdLoc: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Production_location'
      'where Production_location = :Production_Location')
    Left = 808
    Top = 320
    ParamData = <
      item
        Name = 'Production_Location'
      end>
  end
  object qryGetAccountMgr: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Account_Team_Name'
      'from Account_Team_Member, Account_Team'
      'where Operator = :Operator and'
      '(Account_Team_Member.Account_Team = Account_Team.Account_Team)')
    Left = 808
    Top = 376
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryGetAccountTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from account_team'
      'where account_team = :account_team')
    Left = 808
    Top = 432
    ParamData = <
      item
        Name = 'account_team'
      end>
  end
  object UpdSOHeadStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Order'
      'set Sales_order_Head_status = :sales_order_head_Status'
      'where sales_order = :sales_order')
    Left = 912
    Top = 24
    ParamData = <
      item
        Name = 'sales_order_head_Status'
      end
      item
        Name = 'sales_order'
      end>
  end
  object GetPartTransferSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part_Transfer'
      'where Sales_order = :sales_order')
    Left = 912
    Top = 80
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object GetPartAllocationSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Part_Store_allocation.store_stock,'
      '        Store_Stock.Part,'
      '        Store_Stock.Part_Store,'
      '        Store_stock.Part_Bin,'
      '        Store_stock.Part_Store_Lot,'
      '        Store_stock.Stock_pack_Quantity,'
      '        Store_stock.Store_Cost,'
      '        Store_stock.Store_Quantity,'
      '        Part_Store_allocation.Quantity_allocated,'
      '        Part_Store_Allocation.Quantity_Overs,'
      '        Part_Store_Allocation.Quantity_Over_Picked,'
      '        Part_Store_Allocation.Sales_Order,'
      '        Part_Store_Allocation.Sales_Order_line_no'
      'from Part_Store_allocation, Store_stock'
      'where Sales_order = :sales_order and'
      'part_store_Allocation.store_stock = store_stock.store_stock')
    Left = 912
    Top = 144
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qrySOAddCharge: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select count(*) as LineCount '
      'from Sales_Order_Add_Charge '
      'where '
      '  sales_order = :sales_order ')
    Left = 960
    Top = 204
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object CheckSOStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Sales_Order.Sales_Order_Head_Status,'
      '       (Select Sum(Quantity_Delivered - Quantity_Invoiced)'
      '               From Sales_Order_Line'
      
        '               Where (Sales_Order_Line.Sales_Order = :Sales_Orde' +
        'r))'
      '       as Qty_Not_Inv,'
      '       (Select Sum(Quantity_Invoiced)'
      '               From Sales_Order_Line'
      
        '               Where (Sales_Order_Line.Sales_Order = :Sales_Orde' +
        'r))'
      '       as Qty_Inv,'
      '       (Select Sum(Quantity_Delivered)'
      '               From Sales_Order_Line'
      
        '               Where (Sales_Order_Line.Sales_Order = :Sales_Orde' +
        'r))'
      '       as Qty_Deliv'
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
    Left = 912
    Top = 268
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object UpdOrderStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Sales_Order_Head_Status = :Status'
      'where Sales_Order = :OrderNo')
    Left = 928
    Top = 360
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'OrderNo'
      end>
  end
  object UpdSalesOrderLineSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update sales_order_line'
      'set Quantity_delivered = :Quantity_Delivered,'
      'Quantity_Invoiced = :Quantity_Invoiced,'
      'Part_Sales_Price = :Part_Sales_Price,'
      'Sell_Pack_Quantity = :Sell_Pack_Quantity,'
      'Quantity_Wastage = :Quantity_Wastage'
      'Where Sales_Order = :Sales_order and '
      'Sales_Order_Line_no = :sales_order_line_no')
    Left = 808
    Top = 488
    ParamData = <
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Part_Sales_Price'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Quantity_Wastage'
      end
      item
        Name = 'Sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryGetPartAllocbySOL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part_Store_Allocation.Part_Store_Allocation,'
      #9'Part_Store_Allocation.Quantity_allocated,'
      #9'Part_Store_Allocation.store_Stock,'
      #9'Part_Store_Allocation.Sales_order,'
      #9'Part_Store_Allocation.Sales_order_line_no,'
      #9'Part_Store_Allocation.Quantity_Overs,'
      #9'Part_Store_Allocation.Quantity_Over_Picked,'
      #9'Store_Stock.Part,'
      #9'Store_Stock.Part_Store_lot,'
      #9'Store_Stock.Part_Store,'
      #9'Store_Stock.Part_Bin,'
      #9'Store_Stock.Stock_Pack_Quantity,'
      #9'Store_Stock.Store_Cost,'
      #9'Store_Stock.Store_Quantity'
      'from Part_Store_Allocation, Store_Stock'
      'where Sales_Order = :Sales_Order AND'
      '      Sales_Order_Line_No = :Sales_Order_Line_No AND'
      'Part_Store_Allocation.Store_Stock = Store_Stock.Store_Stock')
    Left = 912
    Top = 416
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_No'
      end>
  end
  object qryUpdPartAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part_Store_Allocation'
      'Set Quantity_Overs = Quantity_Overs + :Quantity_Overs'
      'Where Part_Store_Allocation = :Part_Store_Allocation')
    Left = 912
    Top = 488
    ParamData = <
      item
        Name = 'Quantity_Overs'
      end
      item
        Name = 'Part_Store_Allocation'
      end>
  end
  object qryUpdJobBagLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update job_bag_line_dets'
      'set Job_Bag_line_cost = :Job_Bag_Line_Cost,'
      'Job_Bag_Line_Sell = :Job_Bag_Line_Sell,'
      'Job_Bag_line_Invoiced = :Job_Bag_Line_Invoiced,'
      'Job_Bag_Quantity = :Job_Bag_Quantity'
      
        'where sales_order = :sales_order and sales_order_Line_no = :Sale' +
        's_Order_line_no')
    Left = 736
    Top = 208
    ParamData = <
      item
        Name = 'Job_Bag_Line_Cost'
      end
      item
        Name = 'Job_Bag_Line_Sell'
      end
      item
        Name = 'Job_Bag_Line_Invoiced'
      end
      item
        Name = 'Job_Bag_Quantity'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryJBUpHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_bag'
      'Set Job_Bag_Status = :Job_Bag_Status'
      'where Job_Bag = :Job_Bag')
    Left = 736
    Top = 272
    ParamData = <
      item
        Name = 'Job_Bag_Status'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qrySalesOrderJB: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select distinct Order_Type, Job_Bag'
      'from Sales_order, job_bag_line_dets'
      'where Sales_Order.Sales_order = :sales_order and'
      'sales_order.sales_order = Job_Bag_Line_Dets.sales_order')
    Left = 728
    Top = 352
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryJBChkStatus: TFDQuery
    ConnectionName = 'PB'
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
        'nvoiced,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      '    Job_bag_line_dets.Job_Bag_Line_type = '#39'P'#39') as Total_POs,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      
        '    Job_bag_line_dets.Job_Bag_Line_type = '#39'A'#39') as Total_Sundries' +
        ','
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      '    Job_bag_line_dets.Job_Bag_Line_type = '#39'S'#39') as Total_SOs'
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
    Left = 728
    Top = 412
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object GetStoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Store_Stock'
      'where Store_Stock = :Store_Stock')
    Left = 728
    Top = 152
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
  object DeletePartTransferSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Part_Transfer'
      'where Part_Transfer = :Part_Transfer')
    Left = 912
    Top = 312
    ParamData = <
      item
        Name = 'Part_Transfer'
      end>
  end
  object UpdatePartTransferSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part_Transfer'
      'set Store_Quantity = :Store_Quantity'
      'where Part_Transfer = :Part_Transfer')
    Left = 912
    Top = 544
    ParamData = <
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Part_Transfer'
      end>
  end
  object updSOLValuesSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update sales_order_line'
      'set Quantity_delivered = :Quantity_Delivered,'
      'Quantity_Invoiced = :Quantity_Invoiced,'
      'Part_Sales_Price = :Part_Sales_Price,'
      'Sell_Pack_Quantity = :Sell_Pack_Quantity,'
      'Part_Cost = :Part_Cost,'
      'Purch_Pack_Quantity = :Purch_Pack_Quantity'
      'Where Sales_Order = :Sales_order and '
      'Sales_Order_Line_no = :sales_order_line_no')
    Left = 768
    Top = 544
    ParamData = <
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Part_Sales_Price'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Part_Cost'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryGetJBRequest: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select job_bag, Request_no'
      'from Job_Bag_Stock_Request'
      'where sales_order = :sales_order and'
      'sales_order_line_no = :sales_order_line_no')
    Left = 856
    Top = 264
    ParamData = <
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object GetLastJBRequestSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Request_no) as Last_JB_Request_Number'
      'from Job_Bag_Stock_Request'
      'where Job_Bag = :Job_Bag')
    Left = 728
    Top = 80
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object AddJobBagReqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Stock_Request'
      '    (Job_Bag,'
      '    Request_no,'
      '    sales_order,'
      '    sales_order_Line_no)'
      'values'
      '    (:Job_Bag,'
      '    :Request_no,'
      '    :sales_order,'
      '    :sales_order_line_no)')
    Left = 839
    Top = 8
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Request_no'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object DelJobBagReqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Job_Bag_Stock_Request'
      'where sales_order = :sales_order and'
      '      sales_order_line_no = :sales_order_line_no and'
      '      Job_Bag = :Job_Bag')
    Left = 880
    Top = 200
    ParamData = <
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetSODelivAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Sales_order.Sales_Order,'
      '        Sales_order.Delivery_Customer,'
      '        Sales_order.Delivery_Branch,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Building_no_Name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Sales_Order, Customer_Branch, Customer'
      'where Sales_Order = :Sales_Order and'
      '        ('
      
        '        (Sales_Order.Delivery_Customer = Customer_Branch.Custome' +
        'r) and'
      
        '        (Sales_Order.Delivery_Branch = Customer_Branch.Branch_No' +
        ')'
      '        ) and'
      '        (Customer_Branch.Customer = Customer.Customer)')
    Left = 992
    Top = 16
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetCustCC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_CostCentre'
      'where Customer = :Customer and '
      'Cost_centre = :Cost_Centre')
    Left = 120
    Top = 544
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Centre'
      end>
  end
  object qryGetBranchCC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Branch_CostCentre'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no and '
      'Cost_centre = :Cost_Centre')
    Left = 192
    Top = 544
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Cost_Centre'
      end>
  end
  object qryGetCustBranch: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select CB.Customer,'
      '        CB.Branch_no,'
      '        Customer.Name as Customer_Name,'
      '        CB.Name as Branch_Name,'
      '        Customer.Cost_Centre_Level'
      'from Customer_Branch, Customer_Branch CB, Customer'
      'where Customer_Branch.Account_Code = :Account_Code and'
      'Customer.Customer = Customer_Branch.Customer and'
      '('
      '(CB.Customer = Customer_Branch.Customer) and '
      '(CB.Short_Code = :Short_Code)'
      ') ')
    Left = 344
    Top = 544
    ParamData = <
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Short_Code'
      end>
  end
  object qryGetSOLastDelivery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP 1 Sales_Order.Sales_Order,'
      'Sales_Order.Delivery_Customer,'
      'Sales_Order.Delivery_Branch,'
      'Sales_order.Ad_hoc_Address,'
      'Sales_order.Production_LOcation'
      'from Sales_order'
      'where Sales_order.Customer = :Customer and '
      'Sales_Order.Branch_no = :Branch_No and'
      'Order_Type = '#39'S'#39
      'ORDER BY Sales_Order Desc')
    Left = 464
    Top = 552
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryVat: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Vat_Code'
      'order by Vat_Rate')
    Left = 584
    Top = 560
  end
  object dtsVat: TDataSource
    DataSet = qryVat
    Left = 640
    Top = 560
  end
  object qryUpdateContactStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Customer_Contact'
      'SET Contact_Status = 100'
      'WHERE Customer = :Customer AND'
      '      Branch_No = :Branch_no AND'
      '      Contact_No = :Contact_No')
    Left = 992
    Top = 80
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object AddDelivLineDetSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery_Line'
      '(     Sales_Order,'
      '      Sales_Order_Delivery_No,'
      '      Sales_Order_line_No,'
      '      Quantity_Delivered,'
      '      Quantity_Picked)'
      'values'
      '(     :Sales_Order,'
      '      :Sales_Order_Deliv,'
      '      :Sales_order_Line_No,'
      '      :Quantity_Delivered,'
      '      :Quantity_Picked)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 1094
    Top = 68
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Sales_order_Line_No'
      end
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Quantity_Picked'
      end>
  end
  object AddDelivDetSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery'
      '('
      '      Sales_Order,'
      '      Sales_Order_Delivery_No,'
      '      Delivery_Date,'
      '      Despatch_Note_No,'
      '      Delivery_Type,'
      '      Date_Picked,'
      '      Delivery_Weight_Kilos,'
      '      No_of_Boxes,'
      '      Delivery_Instructions,'
      '      Consignment_Number,'
      '      Courier,'
      '      Service_No'
      ')'
      'values'
      '('
      '      :Sales_Order,'
      '      :Sales_Order_Deliv,'
      '      :Del_Dt,'
      '      :Desp_Note_No,'
      '      :Del_Type,'
      '      :Del_Dt,'
      '      0,'
      '      1,'
      '      :Delivery_Instructions,'
      '      '#39#39','
      '      :Courier,'
      '      0)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 1094
    Top = 12
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Desp_Note_No'
      end
      item
        Name = 'Del_Type'
        DataType = ftString
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Delivery_Instructions'
      end
      item
        Name = 'Courier'
        DataType = ftInteger
      end>
  end
  object DelDelivDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete'
      'From Sales_order_Delivery'
      'where Sales_order = :Sales_Order'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 1094
    Top = 140
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object DelDelivLineDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete '
      'From Sales_Order_Delivery_Line'
      'where sales_order = :Sales_Order'
      ' '
      ' '
      ' '
      ' ')
    Left = 1094
    Top = 204
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
end
