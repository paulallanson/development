object dtmdlWOrders: TdtmdlWOrders
  Height = 649
  Width = 1106
  object qryWOHeader: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT  Works_Order.*,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name as Customer_Name,'
      '        Rep.Name as Rep_Name,'
      '        Production_type.Production_Type_Description,'
      '        Works_Order_Status.Works_Order_Status_Descr,'
      '        Operator.Name as Office_Contact_Name,'
      '        Works_Order.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Sales_Invoice_Method.Sales_Invoice_Method_Desc,'
      '        (select OP.Name'
      '         from Operator OP'
      
        '         where OP.Operator = Works_order.Operator) as Operator_N' +
        'ame'
      'FROM VAT_Code'
      '      INNER JOIN (Works_Order_Status'
      '      INNER JOIN (Sales_Invoice_Method'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Production_type'
      '      INNER JOIN (Operator'
      '      INNER JOIN ((Customer'
      
        '      INNER JOIN Customer_Branch ON Customer.Customer = Customer' +
        '_Branch.Customer)'
      
        '      INNER JOIN Works_Order ON (Customer_Branch.Branch_no = Wor' +
        'ks_Order.Branch_no) AND (Customer_Branch.Customer = Works_Order.' +
        'Customer))'
      
        '                ON Operator.Operator = Works_Order.Office_Contac' +
        't)'
      
        '                ON Production_type.Production_type = Works_Order' +
        '.Production_type)'
      '                ON Rep.Rep = Works_Order.Rep)'
      
        '                ON Sales_Invoice_Method.Sales_Invoice_Method = W' +
        'orks_Order.Sales_Invoice_Method)'
      
        '                ON Works_Order_Status.Works_Order_Status = Works' +
        '_Order.Works_Order_Status) '
      '                ON Vat_Code.Vat_Code = Works_Order.Vat_Code'
      'WHERE Works_Order.Works_Order = :Works_Order')
    Left = 376
    Top = 56
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryWOAddHeader: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'INSERT INTO Works_Order'
      '  (Works_Order,'
      '  Customer,'
      '  Branch_no,'
      '  Contact_no,'
      '  Description,'
      '  Works_Order_number,'
      '  Date_Required,'
      '  Date_point,'
      '  Rep,'
      '  Office_Contact,'
      '  Estimated_Quantity,'
      '  Actual_quantity,'
      '  Works_Order_Status,'
      '  Date_Start,'
      '  Operator,'
      '  Cust_Order_no,'
      '  Version_number,'
      '  Sales_invoice_Method,'
      '  Estimated_Invoice_Date,'
      '  Estimated_Cost,'
      '  Production_Type,'
      '  Previous_WO_number,'
      '  Inactive,'
      '  Vat_Code,'
      '  Account_Team,'
      '  Estimated_Selling_Price,'
      '  Sell_Unit,'
      '  Is_Perso_100_Percent,'
      '  Narrative,'
      '  Return_Company,'
      '  Return_Company_Branch,'
      '  Return_Customer,'
      '  Return_Branch_no,'
      '  Return_Customer_Ad_Hoc_Address'
      ')'
      'Values'
      '  (:Works_Order,'
      '  :Customer,'
      '  :Branch_no,'
      '  :Contact_no,'
      '  :Description,'
      '  :Works_Order_number,'
      '  :Date_Required,'
      '  :Date_point,'
      '  :Rep,'
      '  :Office_Contact,'
      '  :Estimated_Quantity,'
      '  :Actual_quantity,'
      '  :Works_Order_Status,'
      '  :Date_Start,'
      '  :Operator ,'
      '  :Cust_Order_no,'
      '  :Version_number,'
      '  :Sales_Invoice_Method,'
      '  :Estimated_Invoice_Date,'
      '  :Estimated_Cost,'
      '  :Production_Type,'
      '  :Previous_WO_number,'
      '  :Inactive,'
      '  :Vat_Code,'
      '  :Account_Team,'
      '  :Estimated_Selling_Price,'
      '  :Sell_Unit,'
      '  :is_perso_100_percent,'
      '  :Narrative,'
      '  :Return_Company,'
      '  :Return_Company_Branch,'
      '  :Return_Customer,'
      '  :Return_Branch_no,'
      '  :Return_Customer_Ad_Hoc_Address'
      ')'
      ''
      '')
    Left = 376
    Top = 104
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Works_Order_number'
      end
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Date_point'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Estimated_Quantity'
      end
      item
        Name = 'Actual_quantity'
      end
      item
        Name = 'Works_Order_Status'
      end
      item
        Name = 'Date_Start'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Version_number'
      end
      item
        Name = 'Sales_Invoice_Method'
      end
      item
        Name = 'Estimated_Invoice_Date'
      end
      item
        Name = 'Estimated_Cost'
      end
      item
        Name = 'Production_Type'
        DataType = ftInteger
      end
      item
        Name = 'Previous_WO_number'
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
      end
      item
        Name = 'Account_Team'
        DataType = ftInteger
      end
      item
        Name = 'Estimated_Selling_Price'
      end
      item
        Name = 'Sell_Unit'
        DataType = ftInteger
      end
      item
        Name = 'is_perso_100_percent'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Return_Company'
        DataType = ftInteger
      end
      item
        Name = 'Return_Company_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Return_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Return_Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Return_Customer_Ad_Hoc_Address'
        DataType = ftInteger
      end>
  end
  object qryWOUpHeader: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'UPDATE Works_Order'
      'set'
      '  Customer = :Customer,'
      '  Branch_no = :Branch_no,'
      '  Contact_no = :Contact_no,'
      '  Description = :Description,'
      '  Works_Order_number = :Works_Order_Number,'
      '  Date_Required = :Date_Required,'
      '  Date_point = :Date_Point,'
      '  Rep = :Rep,'
      '  Office_Contact = :Office_Contact,'
      '  Estimated_Quantity = :Estimated_Quantity,'
      '  Actual_quantity = :Actual_Quantity,'
      '  Works_Order_Status = :Works_Order_Status,'
      '  Date_Start = :Date_Start,'
      '  Cust_Order_no = :Cust_Order_no,'
      '  Version_number = :Version_number,'
      '  Sales_invoice_Method = :Sales_invoice_Method,'
      '  Estimated_Invoice_Date = :Estimated_Invoice_Date,'
      '  Estimated_Cost = :Estimated_Cost,'
      '  Production_Type = :Production_type,'
      '  Previous_WO_number = :Previous_WO_number,'
      '  Inactive = :Inactive,'
      '  Vat_Code = :Vat_Code,'
      '  Account_Team = :Account_Team,'
      '  Estimated_Selling_Price = :Estimated_selling_price,'
      '  Sell_Unit = :Sell_unit,'
      '  is_perso_100_percent = :is_perso_100_percent,'
      '  Narrative = :Narrative,'
      '  Return_Company = :Return_Company,'
      '  Return_Company_Branch = :Return_Company_Branch,'
      '  Return_Customer = :Return_Customer,'
      '  Return_Branch_no = :Return_Branch_no,'
      
        '  Return_Customer_Ad_Hoc_Address = :Return_Customer_Ad_Hoc_Addre' +
        'ss'
      'WHERE Works_Order = :Works_Order'
      '')
    Left = 376
    Top = 152
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Works_Order_Number'
      end
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Estimated_Quantity'
      end
      item
        Name = 'Actual_Quantity'
      end
      item
        Name = 'Works_Order_Status'
      end
      item
        Name = 'Date_Start'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Version_number'
      end
      item
        Name = 'Sales_invoice_Method'
      end
      item
        Name = 'Estimated_Invoice_Date'
      end
      item
        Name = 'Estimated_Cost'
      end
      item
        Name = 'Production_type'
        DataType = ftInteger
      end
      item
        Name = 'Previous_WO_number'
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
      end
      item
        Name = 'Account_Team'
        DataType = ftInteger
      end
      item
        Name = 'Estimated_selling_price'
        DataType = ftInteger
      end
      item
        Name = 'Sell_unit'
        DataType = ftInteger
      end
      item
        Name = 'is_perso_100_percent'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Return_Company'
        DataType = ftInteger
      end
      item
        Name = 'Return_Company_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Return_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Return_Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Return_Customer_Ad_Hoc_Address'
        DataType = ftInteger
      end
      item
        Name = 'Works_Order'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'pb'
    Left = 376
    Top = 208
  end
  object qryWOHeaderGrid: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 2000 Works_Order.*,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name as Customer_Name,'
      '        Rep.Name as Rep_Name,'
      '        Production_type.Production_Type_Description,'
      '        Works_Order_Status.Works_Order_Status_Descr,'
      '        Operator.Name as Office_Contact_Name,'
      '        Works_Order.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Sales_Invoice_Method.Sales_Invoice_Method_Desc,'
      '        (select OP.Name'
      '         from Operator OP'
      
        '         where OP.Operator = Works_order.Operator) as Operator_N' +
        'ame,'
      '        (select top 1 Job_Bag'
      '         from Job_Bag_Works_Order JBWO'
      
        '         where JBWO.Works_order = Works_Order.Works_Order) as Jo' +
        'b_bag'
      'FROM VAT_Code'
      '      INNER JOIN (Works_Order_Status'
      '      INNER JOIN (Sales_Invoice_Method'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Production_type'
      '      INNER JOIN (Operator'
      '      INNER JOIN ((Customer'
      
        '      INNER JOIN Customer_Branch ON Customer.Customer = Customer' +
        '_Branch.Customer)'
      
        '      INNER JOIN Works_Order ON (Customer_Branch.Branch_no = Wor' +
        'ks_Order.Branch_no) AND (Customer_Branch.Customer = Works_Order.' +
        'Customer))'
      
        '                ON Operator.Operator = Works_Order.Office_Contac' +
        't)'
      
        '                ON Production_type.Production_type = Works_Order' +
        '.Production_type)'
      '                ON Rep.Rep = Works_Order.Rep)'
      
        '                ON Sales_Invoice_Method.Sales_Invoice_Method = W' +
        'orks_Order.Sales_Invoice_Method)'
      
        '                ON Works_Order_Status.Works_Order_Status = Works' +
        '_Order.Works_Order_Status) '
      '                ON Vat_Code.Vat_Code = Works_Order.Vat_Code'
      
        'WHERE ((Works_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      Works_Order.Description Like :Description')
    Left = 376
    Top = 8
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
  object dtsWOHeaderGrid: TDataSource
    DataSet = qryWOHeaderGrid
    Left = 472
    Top = 8
  end
  object qryAllWOrders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 2000 Works_Order.*,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name as Customer_Name,'
      '        Rep.Name as Rep_Name,'
      '        Production_type.Production_Type_Description,'
      '        Works_Order_Status.Works_Order_Status_Descr,'
      '        Works_Order_Status.Color as Status_Color,'
      '        Works_Order_Status.Font_Color as Status_Font_Color,'
      '        Operator.Name as Office_Contact_Name,'
      '        Sales_Invoice_Method.Sales_Invoice_Method_Desc,'
      '        (select OP.Name'
      '         from Operator OP'
      
        '         where OP.Operator = Works_order.Operator) as Operator_N' +
        'ame,'
      '        (select top 1 Job_Bag'
      '         from Job_Bag_Works_Order JBWO'
      
        '         where JBWO.Works_order = Works_Order.Works_Order) as Jo' +
        'b_bag'
      'FROM Works_Order_Status'
      '      INNER JOIN (Sales_Invoice_Method'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Production_type'
      '      INNER JOIN (Operator'
      '      INNER JOIN ((Customer'
      
        '      INNER JOIN Customer_Branch ON Customer.Customer = Customer' +
        '_Branch.Customer)'
      
        '      INNER JOIN Works_Order ON (Customer_Branch.Branch_no = Wor' +
        'ks_Order.Branch_no) AND (Customer_Branch.Customer = Works_Order.' +
        'Customer))'
      
        '                ON Operator.Operator = Works_Order.Office_Contac' +
        't)'
      
        '                ON Production_type.Production_type = Works_Order' +
        '.Production_type)'
      '                ON Rep.Rep = Works_Order.Rep)'
      
        '                ON Sales_Invoice_Method.Sales_Invoice_Method = W' +
        'orks_Order.Sales_Invoice_Method)'
      
        '                ON Works_Order_Status.Works_Order_Status = Works' +
        '_Order.Works_Order_Status'
      
        'WHERE ((Works_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      Works_Order.Description Like :Description'
      ''
      ''
      '')
    Left = 560
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Description'
        DataType = ftString
      end>
  end
  object qryOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Operator'
      'order by Name')
    Left = 32
    Top = 368
  end
  object dsOperator: TDataSource
    DataSet = qryOperator
    Left = 88
    Top = 368
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company')
    Left = 32
    Top = 416
  end
  object qryRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Rep')
    Left = 32
    Top = 320
  end
  object dsRep: TDataSource
    DataSet = qryRep
    Left = 88
    Top = 320
  end
  object qryCustReps: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Rep.Name, Rep.Rep'
      'from Reps_Branches, Rep'
      'where Customer = :Customer and '
      'Branch_no =:Branch_no and'
      'Reps_Branches.Rep = Rep.Rep')
    Left = 32
    Top = 272
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
  object qryCustContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer_Contact.*'
      'from Customer_Contact'
      'where Customer = :Customer and'
      'Branch_no =:Branch_no'
      'Order By Name')
    Left = 32
    Top = 224
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
  object dtsCustContacts: TDataSource
    DataSet = qryCustContacts
    Left = 88
    Top = 224
  end
  object qryReserveSlot: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Works_Order'
      '  ('
      '  Works_Order,'
      '  Customer,'
      '  Branch_no,'
      '  Contact_no,'
      '  Description,'
      '  Works_Order_number,'
      '  Date_Required,'
      '  Date_point,'
      '  Estimated_Quantity,'
      '  Actual_quantity,'
      '  Works_Order_Status,'
      '  Date_Start'
      '  )'
      'SELECT'
      '  Max(WO.Works_Order)+1,'
      '  Max(CC.Customer),'
      '  (SELECT MAX(Branch_no) from Customer_Contact where'
      '     Customer = (SELECT MAX(Customer) from Customer_Contact)),'
      '  (SELECT MAX(Contact_no) from Customer_Contact where'
      '     Customer = (SELECT MAX(Customer) from Customer_Contact) and'
      
        '     Branch_no = (SELECT MAX(Branch_no) from Customer_Contact wh' +
        'ere Customer = (SELECT MAX(Customer) from Customer_Contact))),'
      '  :GUID,'
      '  '#39' '#39','
      '  '#39'1/1/2000'#39','
      '  '#39'1/1/2000'#39','
      '  1,'
      '  1,'
      '  10,'
      '  '#39'1/1/2000'#39
      'FROM Works_Order WO, Customer_Contact CC'
      ''
      ' '
      ' '
      ' ')
    Left = 672
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetReservedSlot: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM Works_Order'
      'WHERE Description = :GUID'
      ' ')
    Left = 672
    Top = 56
    ParamData = <
      item
        Name = 'GUID'
      end>
  end
  object qryWOGetLast: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Last_Works_Order_number'
      'from Company'
      '')
    Left = 272
    Top = 8
  end
  object qryGetJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Job_Bag, Job_Bag_Line'
      'From Job_Bag_Line_Dets'
      'Where (Works_Order = :Works_Order) AND'
      '(Process = NULL)')
    Left = 376
    Top = 264
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryUpdJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag_Line_Dets'
      'Set    Supplier = :Supplier,'
      '       Branch_No = :Branch_No,'
      '       Job_Bag_Line_Descr = :Job_Bag_Line_Descr,'
      '       Job_Bag_Line_Cost = :Job_Bag_Line_Cost,'
      '       Job_Bag_Line_Sell = :Job_Bag_Line_Sell,'
      '       Job_Bag_Line_Invoiced = :Job_Bag_Line_Invoiced,'
      '       Job_Bag_Quantity = :Job_Bag_Quantity,'
      '       VAT_Code = :VAT_Code, '
      '       Works_Order = :Works_Order,'
      '       Job_Bag_Line_Type = :Job_Bag_Line_Type,'
      '       Currency_Code = :Currency_Code,'
      '       Selling_Price = :selling_Price,'
      '       Price_unit = :Price_unit'
      'where Job_Bag = :Job_Bag and'
      '       Job_Bag_line = :Job_Bag_Line ')
    Left = 376
    Top = 312
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
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
      end
      item
        Name = 'VAT_Code'
      end
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Job_Bag_Line_Type'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'selling_Price'
      end
      item
        Name = 'Price_unit'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryAddJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Line_Dets'
      '    (Job_Bag,'
      '    Job_Bag_Line,'
      '    Job_Bag_Line_Type,'
      '    Works_Order,'
      '    Supplier,'
      '    Branch_No,'
      '    Job_Bag_Line_Descr,'
      '    Job_Bag_Line_Cost,'
      '    Job_Bag_Line_Sell,'
      '    Job_Bag_Line_Invoiced,'
      '    Job_Bag_Quantity,'
      '    VAT_Code,'
      '    Currency_Code,'
      '    Selling_Price,'
      '    Price_Unit)'
      'values'
      '    (:Job_Bag,'
      '    :Job_Bag_Line,'
      '    :Job_Bag_Line_Type,'
      '    :Works_order,'
      '    :Supplier,'
      '    :Branch_No,'
      '    :Job_Bag_Line_Descr,'
      '    :Job_Bag_Line_Cost,'
      '    :Job_Bag_Line_Sell,'
      '    :Job_Bag_Line_Invoiced,'
      '    :Job_Bag_Quantity,'
      '    :VAT_Code,'
      '    :Currency_Code,'
      '    :Selling_Price,'
      '    :Price_Unit)'
      '')
    Left = 376
    Top = 368
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
        Name = 'Works_order'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
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
      end
      item
        Name = 'VAT_Code'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Selling_Price'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end>
  end
  object GetLastJBSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_Job_Bag_Number'
      'From Company'
      'Where Company = 1')
    Left = 32
    Top = 12
  end
  object UpdLastJBSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Job_Bag_Number = :Last_Job_Bag_Number'
      'Where Company = 1')
    Left = 32
    Top = 64
    ParamData = <
      item
        Name = 'Last_Job_Bag_Number'
      end>
  end
  object qryCheckJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 32
    Top = 120
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object GetLastJBLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Job_Bag_Line) as Last_JB_Line_Number'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag')
    Left = 120
    Top = 16
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryAddJBHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag'
      '  (Job_Bag,'
      '   Job_Bag_Descr,'
      '   Customer,'
      '   Branch_no,'
      '   Date_Point,'
      '   Contact_no,'
      '   Goods_required,'
      '   Cust_Order_no,'
      '   Quantity,'
      '   Rep,'
      '   Operator,'
      '   Office_Contact,'
      '   Job_Bag_Status,'
      '   Account_Team,'
      '   Job_Bag_Production_Status)'
      'values (:Job_Bag,'
      '        :Job_Bag_Descr,'
      '        :Customer,'
      '        :Branch_no,'
      '        :Date_Point,'
      '        :Contact_no,'
      '        :Goods_Required,'
      '        :Cust_Order_no,'
      '        :Quantity,'
      '        :Rep,'
      '        :Operator,'
      '        :Office_Contact,'
      '        :Job_Bag_Status,'
      '        :Account_Team,'
      '        :Job_Bag_Production_Status)')
    Left = 376
    Top = 424
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Descr'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Goods_Required'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Job_Bag_Status'
      end
      item
        Name = 'Account_Team'
      end
      item
        Name = 'Job_Bag_Production_Status'
      end>
  end
  object qrySpare: TFDQuery
    ConnectionName = 'PB'
    Left = 672
    Top = 128
  end
  object qryGetProcesses: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Production_Type,'
      'Process_no,'
      'Process.Process,'
      'Process.Process_Description'
      'from Production_TypeProcess, Process'
      'where Production_Type = :Production_Type and'
      'Production_TypeProcess.Process = Process.Process'
      'order by Process_no')
    Left = 672
    Top = 184
    ParamData = <
      item
        Name = 'Production_Type'
      end>
  end
  object qryWOAddProcess: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Works_Order_Process'
      '(Works_order,'
      'Process_no,'
      'Process,'
      'Narrative,'
      'Target_Receipt_Date,'
      'Quantity,'
      'Number_Up,'
      'Laser_Format,'
      'Paper_Size,'
      'Custom_Paper_Size,'
      'No_of_hours,'
      'team_Count,'
      'Work_Centre,'
      'Work_Centre_Group'
      ')'
      'Values'
      '(:Works_Order,'
      ':Process_no,'
      ':Process,'
      ':Narrative,'
      ':Target_Receipt_Date,'
      ':Quantity,'
      ':Number_Up,'
      ':Laser_Format,'
      ':Paper_Size,'
      ':Custom_Paper_Size,'
      ':No_of_hours,'
      ':Team_Count,'
      ':Work_Centre,'
      ':Work_Centre_Group'
      ')')
    Left = 464
    Top = 56
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process_no'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Narrative'
      end
      item
        Name = 'Target_Receipt_Date'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Number_Up'
      end
      item
        Name = 'Laser_Format'
      end
      item
        Name = 'Paper_Size'
      end
      item
        Name = 'Custom_Paper_Size'
      end
      item
        Name = 'No_of_hours'
      end
      item
        Name = 'Team_Count'
      end
      item
        Name = 'Work_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Work_Centre_Group'
        DataType = ftInteger
      end>
  end
  object qryWOProcess: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Works_Order_Process.*, Process.Process_Description, Proce' +
        'ss_Group.Is_Work_Centre_Based, Process.Process_Group'
      'from Works_Order_Process, Process, Process_Group'
      'where Works_order = :Works_Order and'
      'Works_Order_Process.Process_no = :Process_no and'
      'Works_Order_Process.Process = Process.Process and'
      'Process.Process_Group = Process_group.Process_Group'
      'Order By Process_Group.Sequence_no, Process_no '
      '')
    Left = 464
    Top = 104
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process_no'
      end>
  end
  object qryWOAllProcesses: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Works_Order_Process.*, Process.Process_Description, Proce' +
        'ss_Group.Is_Work_Centre_Based, Process.Process_Group'
      'from Works_Order_Process, Process, Process_Group'
      'where Works_order = :Works_Order and'
      'Works_order_Process.Process = Process.Process and'
      'Process.Process_group = Process_group.Process_Group'
      'Order By Process_group.Sequence_no, Process_no')
    Left = 464
    Top = 160
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryWOEvent: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Works_Order_Event.*, Operator.Operator_Name'
      'from Works_Order_Event, Operator'
      'where Works_Order = :Works_Order and Event_No = :Event_no and'
      'Works_Order_Event.Operator = Operator.Operator')
    Left = 560
    Top = 112
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Event_no'
      end>
  end
  object qryWOAddEvent: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Works_order_Event ('
      'Works_Order,'
      'Event_no,'
      'Event_Date_Time,'
      'Operator,'
      'Narrative)'
      'values ('
      ':Works_order,'
      ':Event_No,'
      ':Event_Date_Time,'
      ':Operator,'
      ':Narrative)')
    Left = 560
    Top = 56
    ParamData = <
      item
        Name = 'Works_order'
      end
      item
        Name = 'Event_No'
      end
      item
        Name = 'Event_Date_Time'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Narrative'
      end>
  end
  object qryWOAllDeliveries: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Works_Order_Delivery.*,'
      'Courier.Courier_Name,'
      'Courier.Delivery_Address_Req,'
      'Courier.Return_Address_Required,'
      'Courier_Service.Service_Description,'
      'Deferred_Service'
      'from Works_order_Delivery, Courier, Courier_service'
      'where Works_Order = :works_order and'
      '('
      '(Works_order_delivery.Courier = Courier_service.courier) and'
      '(Works_order_delivery.Service_no = courier_service.service_no)'
      ') and'
      '(Courier_service.courier = courier.courier)'
      'order by delivery_no')
    Left = 464
    Top = 264
    ParamData = <
      item
        Name = 'works_order'
      end>
  end
  object qryWODelivery: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Works_Order_Delivery.*,'
      'Courier.Courier_Name,'
      'Courier_Service.Service_Description,'
      'Courier.Delivery_Address_Req,'
      'Courier.Return_Address_Required'
      'from Works_order_Delivery, Courier, Courier_service'
      'where Works_Order = :works_order and'
      'Delivery_no = :Delivery_no and'
      '('
      '(Works_order_delivery.Courier = Courier_service.courier) and'
      '(Works_order_delivery.Service_no = courier_service.service_no)'
      ') and'
      '(Courier_service.courier = courier.courier)'
      'order by delivery_no')
    Left = 464
    Top = 312
    ParamData = <
      item
        Name = 'works_order'
      end
      item
        Name = 'Delivery_no'
      end>
  end
  object qryWOAddDelivery: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Works_order_Delivery'
      '(Works_Order,'
      'Delivery_no,'
      'Qty_Delivered,'
      'Qty_To_Deliver,'
      'Delivery_Date,'
      'Date_Deliv_Actual,'
      'Courier,'
      'Service_no,'
      'Pack_quantity,'
      'Delivery_weight_Kilos,'
      'Package_Size,'
      'Customer_Account,'
      'Customer_Account_Code,'
      'Customer_Account_Name,'
      'Package_Weight_gms,'
      'Name,'
      'Building_no_Name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Handover_Date,'
      'Courier_Sort,'
      'Courier_Speed'
      ')'
      'Values'
      '(:Works_Order,'
      ':Delivery_no,'
      ':Qty_Delivered,'
      ':Qty_To_Deliver,'
      ':Delivery_Date,'
      ':Date_Deliv_Actual,'
      ':Courier,'
      ':Service_no,'
      ':Pack_quantity,'
      ':Delivery_weight_Kilos,'
      ':Package_Size,'
      ':Customer_Account,'
      ':Customer_Account_Code,'
      ':Customer_Account_Name,'
      ':Package_Weight_gms,'
      ':Name,'
      ':Building_no_Name,'
      ':Street,'
      ':Locale,'
      ':Town,'
      ':Postcode,'
      ':Handover_Date,'
      ':Courier_Sort,'
      ':Courier_Speed'
      ')')
    Left = 464
    Top = 360
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Delivery_no'
      end
      item
        Name = 'Qty_Delivered'
      end
      item
        Name = 'Qty_To_Deliver'
      end
      item
        Name = 'Delivery_Date'
      end
      item
        Name = 'Date_Deliv_Actual'
      end
      item
        Name = 'Courier'
      end
      item
        Name = 'Service_no'
      end
      item
        Name = 'Pack_quantity'
      end
      item
        Name = 'Delivery_weight_Kilos'
      end
      item
        Name = 'Package_Size'
        DataType = ftInteger
      end
      item
        Name = 'Customer_Account'
      end
      item
        Name = 'Customer_Account_Code'
      end
      item
        Name = 'Customer_Account_Name'
      end
      item
        Name = 'Package_Weight_gms'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Building_no_Name'
        DataType = ftString
      end
      item
        Name = 'Street'
        DataType = ftString
      end
      item
        Name = 'Locale'
        DataType = ftString
      end
      item
        Name = 'Town'
        DataType = ftString
      end
      item
        Name = 'Postcode'
        DataType = ftString
      end
      item
        Name = 'Handover_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Courier_Sort'
        DataType = ftInteger
      end
      item
        Name = 'Courier_Speed'
        DataType = ftInteger
      end>
  end
  object dtsCourierService: TDataSource
    DataSet = qryCourierService
    Left = 792
    Top = 243
  end
  object qryCourierService: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from courier_service'
      'where courier = :courier and'
      '(((inactive = '#39'N'#39') or (inactive is NULL)) OR'
      '(Service_no = :Service_no))'
      'order by Service_Description')
    Left = 672
    Top = 243
    ParamData = <
      item
        Name = 'courier'
      end
      item
        Name = 'Service_no'
      end>
  end
  object qryWOAllEvents: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Works_Order_Event.*, Operator.Name as Operator_Name'
      'from Works_order_Event, Operator'
      'where Works_Order = :Works_Order and'
      'Works_Order_Event.Operator = Operator.Operator'
      'Order By Event_No')
    Left = 560
    Top = 160
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryGetJBLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Job_Bag_Line'
      'from Job_Bag_Line_dets'
      'where Works_Order = :works_order'
      'order by Job_bag_line')
    Left = 464
    Top = 424
    ParamData = <
      item
        Name = 'works_order'
      end>
  end
  object qryUpdJBHead: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Update Job_Bag'
      'set Job_Bag_Production_Status = :Job_Bag_Production_Status'
      'Where Job_Bag = :Job_Bag')
    Left = 544
    Top = 424
    ParamData = <
      item
        Name = 'Job_Bag_Production_Status'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryWOProcessQstn: TFDQuery
    ConnectionName = 'pb'
    Left = 272
    Top = 64
  end
  object qryWOAddProcessQstn: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Works_Order_Process_Detail'
      '(Works_Order, Process_no, Process, Question, Process_Answer)'
      
        'values (:Works_Order, :Process_no, :Process, :Question, :Process' +
        '_Answer)')
    Left = 272
    Top = 120
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process_no'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Question'
      end
      item
        Name = 'Process_Answer'
      end>
  end
  object qryGetWOQuestions: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Works_Order_Process_Detail.Process_Answer,'
      '        Works_Order_Process_Detail.Works_Order,'
      '        Works_Order_Process_Detail.Process_no,'
      '        Works_Order_Process_Detail.Process,'
      '        Works_Order_Process_Detail.Question'
      'FROM Works_Order_Process_Detail'
      'WHERE '
      'Works_order_process_detail.Works_Order = :Works_order and'
      'Works_order_process_detail.Process = :Process and'
      'Works_Order_Process_detail.Question = :Question')
    Left = 272
    Top = 176
    ParamData = <
      item
        Name = 'Works_order'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Question'
      end>
  end
  object qryGetQuestions: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Process_question'
      'where Process = :Process and'
      
        '((Process_Question.inactive = '#39'N'#39') or (Process_Question.inactive' +
        ' is NULL))'
      'Order By Sequence_no')
    Left = 272
    Top = 224
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object qryGetQuestionList: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Process_Question_List'
      'where Process = :Process and'
      'Question = :Question'
      'order by Question_List_no')
    Left = 272
    Top = 280
    ParamData = <
      item
        Name = 'Process'
      end
      item
        Name = 'Question'
      end>
  end
  object qryVatCode: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Vat_Code'
      'order by Vat_Rate')
    Left = 32
    Top = 464
  end
  object dtsVatCode: TDataSource
    DataSet = qryVatCode
    Left = 88
    Top = 464
  end
  object dtsCustReps: TDataSource
    DataSet = qryCustReps
    Left = 88
    Top = 272
  end
  object qryAccManager: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select User_Group_Operator.*, Operator.Name '
      'from User_Group_Operator, Operator'
      'where User_Group = 4 and'
      'User_Group_Operator.Operator = Operator.Operator'
      'Order By Operator.Name')
    Left = 32
    Top = 176
  end
  object dtsAccManager: TDataSource
    DataSet = qryAccManager
    Left = 88
    Top = 176
  end
  object qryGetOpAccountTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select account_team.account_team, account_team.account_team_name'
      'from account_team_member, Account_Team'
      'where operator = :operator and'
      'account_team_member.account_team = account_team.account_team')
    Left = 272
    Top = 336
    ParamData = <
      item
        Name = 'operator'
      end>
  end
  object qryGetAccountTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Account_Team'
      'where Account_Team = :Account_Team')
    Left = 272
    Top = 392
    ParamData = <
      item
        Name = 'Account_Team'
      end>
  end
  object qrySelectedWO: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select  Works_order.Works_Order_status,'
      
        '        Works_order_Status.Works_order_Status_Descr as Status_De' +
        'scr'
      'from Works_Order, Works_order_Status'
      'where Works_Order = :Works_Order and'
      
        'Works_Order.Works_order_status = Works_Order_Status.Works_Order_' +
        'Status')
    Left = 272
    Top = 456
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_Unit'
      'order by Description')
    Left = 32
    Top = 512
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 88
    Top = 512
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 160
    Top = 176
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qryGetJBWO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag'
      'from Job_Bag_Works_Order'
      'where Works_Order = :Works_Order')
    Left = 376
    Top = 488
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryAddJBWO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Job_Bag_Works_Order'
      '(Job_Bag,'
      'Works_Order_No,'
      'Works_Order'
      ')'
      'VALUES'
      '(:Job_Bag,'
      ':Works_Order_No,'
      ':Works_Order'
      ')')
    Left = 456
    Top = 480
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Works_Order_No'
      end
      item
        Name = 'Works_Order'
      end>
  end
  object qryUpdWONumber: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Works_Order'
      'Set Works_Order_Number = :Works_Order_Number'
      'Where Works_Order = :Works_Order')
    Left = 272
    Top = 504
    ParamData = <
      item
        Name = 'Works_Order_Number'
      end
      item
        Name = 'Works_Order'
      end>
  end
  object qryGetLastWOJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Works_Order_no) as Last_Works_Order'
      'from Job_Bag_Works_Order'
      'where Job_Bag = :Job_Bag')
    Left = 656
    Top = 392
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetPackage: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Package_Size'
      'where Package_size = :Package_Size')
    Left = 672
    Top = 464
    ParamData = <
      item
        Name = 'Package_Size'
      end>
  end
  object qryGetCustomerRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Rep'
      'from Reps_Branches'
      'where Customer = :Customer and Branch_no = :Branch_no'
      'Order By Reps_Branches.Is_Main_Rep DESC')
    Left = 672
    Top = 512
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 544
    Top = 488
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object qryUpWODeliv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Works_Order_delivery'
      'set Date_Deliv_Actual = :Date_Deliv_Actual,'
      'Qty_Delivered = :Qty_Delivered'
      'where Works_Order = :Works_Order and Delivery_no = :Delivery_no')
    Left = 560
    Top = 263
    ParamData = <
      item
        Name = 'Date_Deliv_Actual'
      end
      item
        Name = 'Qty_Delivered'
      end
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Delivery_no'
      end>
  end
  object qryUpWOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Works_Order'
      'Set Works_Order_Status = :Works_Order_Status'
      'Where Works_Order = :Works_Order')
    Left = 560
    Top = 320
    ParamData = <
      item
        Name = 'Works_Order_Status'
      end
      item
        Name = 'Works_Order'
      end>
  end
  object qryGetWOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Works_Order_Status_Descr'
      'from Works_Order_Status'
      'where Works_Order_Status = :Works_Order_Status')
    Left = 552
    Top = 376
    ParamData = <
      item
        Name = 'Works_Order_Status'
      end>
  end
  object qryGetJobBagWO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Works_Order.Works_Order,'
      'Works_Order.Works_Order_Status'
      'from Job_Bag_Works_Order, Works_Order'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Works_Order.Works_Order = Works_Order.Works_Order')
    Left = 672
    Top = 568
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryPaperSize: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Paper_Size'
      'order by Description')
    Left = 760
    Top = 8
  end
  object dtsPaperSize: TDataSource
    DataSet = qryPaperSize
    Left = 832
    Top = 8
  end
  object qryGetPaperSize: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Paper_Size'
      'where Paper_Size = :Paper_Size')
    Left = 760
    Top = 104
    ParamData = <
      item
        Name = 'Paper_Size'
      end>
  end
  object qryWOJBProcesses: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '    Job_Bag_Process.Job_Bag,'
      '    Job_Bag_Process.Process_no,'
      '    Job_Bag_Process.Process,'
      '    Process.Process_Description,'
      '    Job_Bag_Process.Paper_Size,'
      '    Job_Bag_Process.Work_Centre_Group,'
      '    Job_Bag_Process.No_of_elements,'
      '    Job_Bag_Process.No_of_hours,'
      '    Job_Bag_Process.Quantity,'
      '    Job_Bag_Process.Simplex_or_Duplex,'
      '    Job_Bag_Process.Narrative,'
      '    Job_bag_Process.Paper_depth_mm,'
      '    Job_bag_process.Paper_width_mm,'
      '    Process_group.Process_Group,'
      '    Process_Group.Is_Work_Centre_Based'
      'from Job_Bag_Process, Process, Process_Group'
      'where Job_Bag = :Job_Bag and'
      '      Job_Bag_Process.Process = Process.Process and'
      '      Process.Process_Group = Process_Group.Process_Group')
    Left = 464
    Top = 216
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetProcessList: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select process.*, process_group.* '
      'from process, process_group'
      
        'where process.process_group = process_group.process_group and ((' +
        'inactive is NULL) or (inactive = '#39'N'#39'))'
      'order by Process_group.sequence_no, Process')
    Left = 792
    Top = 184
  end
  object qryGetWIProcess: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Works_Order_Process.Works_Order, Works_Order_Process.Proc' +
        'ess, Process.Inactive'
      'from Works_Order_Process, Process'
      'where Works_Order_Process.Works_Order = :Works_Order and'
      'Works_Order_Process.Process = Process.Process')
    Left = 776
    Top = 392
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryGetProcess: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Process.Process,'
      '        Process.Process_Description,'
      '        Process.Number_Type,'
      '        Process_Number_Type.Number_Type_Description,'
      '        Prompt_For_Laser_Format,'
      '        Prompt_For_Paper_Size,'
      '        Paper_Prompt_Narrative'
      'FROM Process_Number_Type'
      '      RIGHT JOIN Process'
      '        ON Process_Number_Type.Number_Type = Process.Number_Type'
      'WHERE Process.Process = :Process')
    Left = 760
    Top = 152
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object dtsProcessPaperSize: TDataSource
    DataSet = qryProcessPaperSize
    Left = 832
    Top = 56
  end
  object qryProcessPaperSize: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Works_Order_Process.Process,'
      '        Paper_Size.Paper_Size,'
      '        Paper_Size.Description'
      'from Works_Order_Process, Paper_Size'
      'where Works_Order_Process.Works_Order = :Works_Order and'
      'Works_Order_Process.Process = :Process and'
      'Works_Order_Process.Paper_Size = Paper_Size.Paper_Size'
      'UNION'
      'select  Process_Paper_Size.Process,'
      '        Paper_Size.Paper_Size,'
      '        Paper_Size.Description'
      'from Process_Paper_Size, Paper_Size'
      'where Process_Paper_Size.Process = :Process and'
      'Process_Paper_Size.Paper_Size = Paper_Size.Paper_Size and'
      'Paper_Size.Paper_Size not in'
      '(select Works_Order_Process.Paper_Size'
      'from Works_Order_Process'
      'where Works_Order_Process.Works_Order = :Works_Order and'
      'Works_Order_Process.Process = :Process)'
      'order by Description')
    Left = 760
    Top = 56
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process'
      end>
  end
  object qryGetOldQuestions: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Process_question.*'
      'from Process_question, Works_Order_Process_Detail'
      'where Process_question.Process = :Process and'
      
        '      Process_question.Process = Works_Order_Process_Detail.Proc' +
        'ess and'
      
        '      Process_question.Question = Works_Order_Process_Detail.Que' +
        'stion and'
      '      Works_Order_Process_Detail.Works_Order = :Works_Order'
      'UNION'
      'select Process_Question.*'
      'from Process_question'
      'where Process_question.Process = :Process and'
      
        '((Process_Question.inactive = '#39'N'#39') or (Process_Question.inactive' +
        ' is NULL)) and'
      'Process_question.Question not in'
      '(select Works_Order_Process_Detail.Question'
      'from Works_Order_Process_Detail'
      'where Works_Order_Process_Detail.Works_Order = :Works_Order and'
      '      Works_Order_Process_Detail.Process = :Process)'
      'Order By Sequence_no')
    Left = 184
    Top = 224
    ParamData = <
      item
        Name = 'Process'
      end
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process'
      end>
  end
  object qryWCGroup: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Work_Centre_Group'
      'order by Work_Centre_Group_Name')
    Left = 776
    Top = 456
  end
  object dtsWCGroup: TDataSource
    DataSet = qryWCGroup
    Left = 848
    Top = 456
  end
  object dtsWC: TDataSource
    DataSet = qryWC
    Left = 840
    Top = 520
  end
  object qryWC: TFDQuery
    MasterSource = dtsWCGroup
    ConnectionName = 'PB'
    SQL.Strings = (
      'select work_centre.work_Centre_Name'
      'from work_centre_WC_Group, work_Centre'
      
        'where work_centre_WC_Group.work_centre = work_centre.work_Centre' +
        ' and'
      'work_centre_group = :work_Centre_Group'
      'order by Work_Centre_Name')
    Left = 776
    Top = 512
    ParamData = <
      item
        Name = 'work_Centre_Group'
      end>
  end
  object OldqryWCGroup: TFDQuery
    SQL.Strings = (
      
        'select Work_Centre_Group.Work_Centre_Group, Work_Centre_Group.Wo' +
        'rk_Centre_Group_Name'
      'from Process_Work_Centre_Group, Work_Centre_Group'
      'where Process_Work_Centre_Group.Process = :Process and '
      
        '(Process_Work_Centre_Group.Work_Centre_Group = Work_Centre_Group' +
        '.Work_Centre_Group)'
      'order by Work_Centre_Group_Name')
    Left = 928
    Top = 456
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object qryGetCourierService: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Courier_Service'
      'Where Courier = :Courier and Service_no = :Service_no')
    Left = 376
    Top = 544
    ParamData = <
      item
        Name = 'Courier'
      end
      item
        Name = 'Service_no'
      end>
  end
  object qryCourierSort: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from courier_sort'
      'where courier = :courier and'
      '(((inactive = '#39'N'#39') or (inactive is NULL)) OR'
      '(Courier_Sort = :Courier_Sort))'
      'order by Sort_Description')
    Left = 672
    Top = 299
    ParamData = <
      item
        Name = 'courier'
      end
      item
        Name = 'Courier_Sort'
      end>
  end
  object dtsCourierSort: TDataSource
    DataSet = qryCourierSort
    Left = 792
    Top = 299
  end
  object qryCourierSpeed: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from courier_Speed'
      'where courier = :courier and'
      '(((inactive = '#39'N'#39') or (inactive is NULL)) OR'
      '(Courier_Speed = :Courier_Speed))'
      'order by Speed_Description')
    Left = 672
    Top = 347
    ParamData = <
      item
        Name = 'courier'
      end
      item
        Name = 'Courier_Speed'
      end>
  end
  object dtsCourierSpeed: TDataSource
    DataSet = qryCourierSpeed
    Left = 784
    Top = 347
  end
  object qryGetCompAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name,'
      '         Company.Building_No_Name,'
      '         Company.Street,'
      '         Company.Locale,'
      '         Company.PostCode,'
      '         Company.Town,'
      '         '#39#39' as County,'
      '         Company.Phone,'
      '         '#39#39' as Branch_Name,'
      '         Delivery_Narrative'
      'From Company'
      'Where (Company = 1)'
      '')
    Left = 928
    Top = 6
  end
  object qryGetCustAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select   Customer.Name as Name, Customer_Branch.Name as Branch_N' +
        'ame,'
      '         Customer_Branch.Building_No_Name,'
      '         Customer_Branch.Street,'
      '         Customer_Branch.Locale,'
      '         Customer_Branch.PostCode,'
      '         Customer_Branch.Town,'
      '         Customer_Branch.County,'
      '         Customer_Branch.Phone,'
      '         Customer.Customer,'
      '         Customer_Branch.Branch_No,'
      '         Customer_Branch.Delivery_Narrative,'
      '         Customer_Branch.Use_Branch_Name'
      'From Customer_Branch, Customer'
      'Where (Customer_Branch.Customer = :Customer) and'
      '      (Customer_Branch.Branch_No = :Branch_No) and'
      '      (Customer.Customer = Customer_Branch.Customer)'
      ' ')
    Left = 928
    Top = 54
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryGetAddHocAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name, Building_No_name,'
      '               Street, Locale, Town,'
      '               '#39#39' as County,'
      '               Postcode,'
      '               Delivery_Narrative'
      'From Ad_Hoc_Address'
      'Where (Ad_Hoc_Address = :Ad_Hoc_Address)'
      '')
    Left = 928
    Top = 114
    ParamData = <
      item
        Name = 'Ad_Hoc_Address'
      end>
  end
  object dtsAddress: TDataSource
    Left = 1000
    Top = 8
  end
  object qryGetCompBrAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Company.Name,'
      '         Company_Branch.Name as Branch_Name,'
      '         Company_Branch.Building_No_Name,'
      '         Company_Branch.Street,'
      '         Company_Branch.Locale,'
      '         Company_Branch.PostCode,'
      '         Company_Branch.Town,'
      '         Company_Branch.County,'
      '         Company_Branch.Delivery_Narrative'
      'From Company, Company_Branch'
      
        'Where (Company_Branch.Company = 1) and (Company_Branch.Company =' +
        ' 1 and Company_Branch.Branch_no = :Branch_no)')
    Left = 928
    Top = 168
    ParamData = <
      item
        Name = 'Branch_no'
      end>
  end
end
