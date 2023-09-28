object dtmdlContract: TdtmdlContract
  Height = 546
  Width = 980
  object qryGetContract: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Contract.Contract,'
      '        Contract.Customer,'
      '        Contract.Date_Point,'
      '        Customer.Name as Customer_Name,'
      '        Contract.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Contract.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Contract.Cust_Order_no,'
      '        Contract.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Contract.Date_Effective,'
      '        Contract.Frequency_Period,'
      '        Contract.Frequency_Period_Type,'
      '        Contract.Duration_Mths,'
      '        Contract.Duration_Period_Type,'
      '        Contract.Description,'
      '        Contract.Office_Contact,'
      '        Office_Contact.Name as Office_Contact_Name,'
      '        Contract.Quantity,'
      '        Contract.Termination_Notice_Period,'
      '        Contract.Termination_Notice_Period_Type,'
      
        '        Notice_Period_Type.Period_Description as Notice_Period_T' +
        'ype_Description,'
      '        Contract.Term_After_Initial_Period,'
      '        Contract.Term_After_Initial_Period_Type,'
      
        '        Term_Period_Type.Period_Description as Term_Period_Type_' +
        'Description,'
      '        Contract.Payment_Terms,'
      '        Payment_Terms.Payment_Terms_Description,'
      '        Contract.Review_Period,'
      '        Contract.Review_Period_Type,'
      
        '        Period_Type.Period_Description as Review_Period_Type_Des' +
        'cription,'
      '        Contract.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Contract.inactive,'
      '        Contract.inactive_reason,'
      '        Contract.Notes,'
      '        Contract.Sub_Rep,'
      '        Sub_Rep.Name as Sub_Rep_Name,'
      '        Contract.Minimum_Quantity,'
      '        Contract.Reference,'
      '        Contract.Expiry_Date,'
      '        Contract.Contract_Number,'
      '        Contract.Original_Contract,'
      '        Contract.Contract_Status,'
      '        Contract_Status.Status_Description'
      'FROM Contract_Status'
      '      INNER JOIN (Rep AS Sub_Rep'
      '      RIGHT JOIN (Period_Type AS Notice_Period_Type'
      '      RIGHT JOIN (Operator'
      '      RIGHT JOIN (((Customer'
      '      INNER JOIN Customer_Branch'
      '          ON Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Customer_Contact'
      
        '          ON (Customer_Branch.Branch_no = Customer_Contact.Branc' +
        'h_no)'
      
        '              AND (Customer_Branch.Customer = Customer_Contact.C' +
        'ustomer))'
      '      INNER JOIN ((Period_Type AS Term_Period_Type'
      '      RIGHT JOIN (Period_Type'
      '      RIGHT JOIN (Operator AS Office_Contact'
      '      INNER JOIN (Rep'
      '      INNER JOIN Contract'
      '          ON Rep.Rep = Contract.Rep)'
      '          ON Office_Contact.Operator = Contract.Office_Contact)'
      '          ON Period_Type.ID = Contract.Review_Period_Type)'
      
        '          ON Term_Period_Type.ID = Contract.Term_After_Initial_P' +
        'eriod_Type)'
      '      LEFT JOIN Payment_Terms'
      
        '          ON Contract.Payment_Terms = Payment_Terms.Payment_Term' +
        's)'
      '          ON (Customer_Contact.Contact_no = Contract.Contact_no)'
      
        '              AND (Customer_Contact.Branch_no = Contract.Branch_' +
        'no)'
      
        '              AND (Customer_Contact.Customer = Contract.Customer' +
        '))'
      '          ON Operator.Operator = Contract.Operator)'
      
        '          ON Notice_Period_Type.ID = Contract.Termination_Notice' +
        '_Period_Type)'
      '          ON Sub_Rep.Rep = Contract.Sub_Rep)'
      '          ON Contract_Status.id = Contract.Contract_Status'
      'WHERE Contract.Contract = :Contract')
    Left = 32
    Top = 144
    ParamData = <
      item
        Name = 'Contract'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 288
    Top = 16
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT Into Activity'
      '        (Activity,'
      '        Activity_type,'
      '        Activity_Subject,'
      '        Date_Time_Entered,'
      '        Start_Date_Time,'
      '        Due_Date_Time,'
      '        Activity_Status,'
      '        Activity_Priority,'
      '        Operator,'
      '        Narrative'
      '        )'
      'SELECT  Max(Activity)+1,'
      '        :Activity_Type,'
      '        :Activity_Subject,'
      '        :Date_Time_Entered,'
      '        :Start_Date_Time,'
      '        :Due_Date_Time,'
      '        :Activity_Status,'
      '        :Activity_Priority,'
      '        :Operator,'
      '        :Narrative'
      'FROM Activity')
    Left = 288
    Top = 72
    ParamData = <
      item
        Name = 'Activity_Type'
      end
      item
        Name = 'Activity_Subject'
      end
      item
        Name = 'Date_Time_Entered'
      end
      item
        Name = 'Start_Date_Time'
      end
      item
        Name = 'Due_Date_Time'
      end
      item
        Name = 'Activity_Status'
      end
      item
        Name = 'Activity_Priority'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Narrative'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Activity'
      'From Activity'
      'Where Activity_Subject = :Event_GUID'
      ' '
      ' ')
    Left = 288
    Top = 136
    ParamData = <
      item
        Name = 'Event_GUID'
      end>
  end
  object qryUpContract: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Contract'
      'SET'
      '  Customer = :Customer,'
      '  Branch_no = :Branch_no,'
      '  Contact_no = :Contact_no,'
      '  Date_Point = :Date_Point,'
      '  Cust_Order_no = :Cust_Order_no,'
      '  Rep = :Rep,'
      '  Date_Effective = :Date_Effective,'
      '  Duration_Mths   = :Duration_Mths,'
      '  Duration_Period_Type  = :Duration_Period_Type,'
      '  Description   = :Description,'
      '  Frequency_Period = :Frequency_Period,'
      '  Frequency_Period_Type = :Frequency_Period_Type,'
      '  Office_Contact  = :Office_Contact,'
      '  Quantity    = :Quantity,'
      '  Termination_Notice_Period = :Termination_Notice_Period,'
      
        '  Termination_Notice_Period_Type  = :Termination_Notice_Period_T' +
        'ype,'
      '  Term_After_Initial_Period   = :Term_After_Initial_Period,'
      
        '  Term_After_Initial_Period_Type  = :Term_After_Initial_Period_T' +
        'ype,'
      '  Payment_Terms   = :Payment_Terms,'
      '  Review_Period   = :Review_Period,'
      '  Review_Period_Type  = :Review_Period_Type,'
      '  Notes   = :Notes,'
      '  Sub_Rep = :Sub_Rep,'
      '  Minimum_Quantity  = :Minimum_Quantity,'
      '  Inactive    = :Inactive,'
      '  Inactive_Reason = :Inactive_Reason,'
      '  Reference   = :Reference,'
      '  Expiry_Date = :Expiry_Date,'
      '  Contract_Status   = :Contract_Status'
      'WHERE Contract = :Contract')
    Left = 32
    Top = 240
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
        Name = 'Date_Point'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Date_Effective'
      end
      item
        Name = 'Duration_Mths'
        DataType = ftInteger
      end
      item
        Name = 'Duration_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Frequency_Period'
        DataType = ftInteger
      end
      item
        Name = 'Frequency_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Termination_Notice_Period'
        DataType = ftInteger
      end
      item
        Name = 'Termination_Notice_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Term_After_Initial_Period'
        DataType = ftInteger
      end
      item
        Name = 'Term_After_Initial_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Review_Period'
        DataType = ftInteger
      end
      item
        Name = 'Review_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Notes'
        DataType = ftInteger
      end
      item
        Name = 'Sub_Rep'
      end
      item
        Name = 'Minimum_Quantity'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Inactive_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Expiry_Date'
      end
      item
        Name = 'Contract_Status'
      end
      item
        Name = 'Contract'
      end>
  end
  object qryContractGrid: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '')
    Left = 32
    Top = 16
  end
  object dtsContractGrid: TDataSource
    DataSet = qryContractGrid
    Left = 112
    Top = 16
  end
  object qryContractBase: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Contract.Contract,'
      '        Contract.Customer,'
      '        Contract.Date_Point,'
      '        Customer.Name as Customer_Name,'
      '        Contract.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Contract.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Contract.Cust_Order_no,'
      '        Contract.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Contract.Date_Effective,'
      '        Contract.Duration_Mths,'
      '        Contract.Description,'
      '        Contract.Office_Contact,'
      '        Office_Contact.Name as Office_Contact_Name,'
      '        Contract.Quantity,'
      '        Contract.Termination_Notice_Period,'
      '        Contract.Termination_Notice_Period_Type,'
      
        '        Notice_Period_Type.Period_Description as Notice_Period_T' +
        'ype_Description,'
      '        Contract.Term_After_Initial_Period,'
      '        Contract.Term_After_Initial_Period_Type,'
      
        '        Term_Period_Type.Period_Description as Term_Period_Type_' +
        'Description,'
      '        Contract.Payment_Terms,'
      '        Payment_Terms.Payment_Terms_Description,'
      '        Contract.Review_Period,'
      '        Contract.Review_Period_Type,'
      
        '        Period_Type.Period_Description as Review_Period_Type_Des' +
        'cription,'
      '        Contract.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Contract.inactive,'
      '        Contract.inactive_reason,'
      '        Contract.Notes,'
      '        Contract.Sub_Rep,'
      '        Sub_Rep.Name as Sub_Rep_Name,'
      '        Contract.Minimum_Quantity,'
      '        Contract.Reference,'
      '        Contract.Expiry_Date,'
      '        Contract.Contract_Number,'
      '        Contract.Original_Contract,'
      '        Contract.Contract_Status,'
      '        Contract_Status.Status_Description'
      'FROM Contract_Status'
      '      INNER JOIN (Rep AS Sub_Rep'
      '      RIGHT JOIN (Period_Type AS Notice_Period_Type'
      '      RIGHT JOIN (Operator'
      '      RIGHT JOIN (((Customer'
      '      INNER JOIN Customer_Branch'
      '          ON Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Customer_Contact'
      
        '          ON (Customer_Branch.Branch_no = Customer_Contact.Branc' +
        'h_no)'
      
        '              AND (Customer_Branch.Customer = Customer_Contact.C' +
        'ustomer))'
      '      INNER JOIN ((Period_Type AS Term_Period_Type'
      '      RIGHT JOIN (Period_Type'
      '      RIGHT JOIN (Operator AS Office_Contact'
      '      INNER JOIN (Rep'
      '      INNER JOIN Contract'
      '          ON Rep.Rep = Contract.Rep)'
      '          ON Office_Contact.Operator = Contract.Office_Contact)'
      '          ON Period_Type.ID = Contract.Review_Period_Type)'
      
        '          ON Term_Period_Type.ID = Contract.Term_After_Initial_P' +
        'eriod_Type)'
      '      LEFT JOIN Payment_Terms'
      
        '          ON Contract.Payment_Terms = Payment_Terms.Payment_Term' +
        's)'
      '          ON (Customer_Contact.Contact_no = Contract.Contact_no)'
      
        '              AND (Customer_Contact.Branch_no = Contract.Branch_' +
        'no)'
      
        '              AND (Customer_Contact.Customer = Contract.Customer' +
        '))'
      '          ON Operator.Operator = Contract.Operator)'
      
        '          ON Notice_Period_Type.ID = Contract.Termination_Notice' +
        '_Period_Type)'
      '          ON Sub_Rep.Rep = Contract.Sub_Rep)'
      '          ON Contract_Status.id = Contract.Contract_Status'
      'WHERE ((Contract.Customer = :Customer) OR (:Customer = 0))'
      ''
      '')
    Left = 192
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Contact_no,'
      '        Customer_Contact.Name,'
      '        Customer_Contact.Contact_Type,'
      '        Contact_Type.Description as Contact_type_Description,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Contact_Level,'
      '        Contact_Level.Description as Contact_Level_Description,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Contact.Contact_Status,'
      '        Customer_Contact.inactive,'
      
        '        Contact_Status.Contact_Status_Descr as Contact_Status_De' +
        'scription,'
      '        Customer_Contact.Def_Markup_perc,'
      '        Customer_Contact.Narrative'
      'FROM Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN (Contact_Type'
      '      INNER JOIN Customer_Contact'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) and'
      
        '      ((Customer_Contact.Inactive = '#39'N'#39') or (Customer_Contact.In' +
        'active is NULL))'
      'ORDER BY Name')
    Left = 516
    Top = 144
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qryContacts
    Left = 588
    Top = 144
  end
  object qryPeriodType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Period_Type'
      'ORDER BY ID')
    Left = 520
    Top = 200
  end
  object dtsPeriodType: TDataSource
    DataSet = qryPeriodType
    Left = 592
    Top = 200
  end
  object qryPaymentTerms: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Payment_Terms'
      'ORDER BY Payment_Terms_Description')
    Left = 520
    Top = 256
  end
  object dtsPaymentTerms: TDataSource
    DataSet = qryPaymentTerms
    Left = 592
    Top = 256
  end
  object qryAddContract: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Contract'
      '('
      'Customer,'
      'Branch_no,'
      'Contact_no,'
      'Date_Point,'
      'Cust_Order_no,'
      'Rep,'
      'Date_Effective,'
      'Duration_Mths,'
      'Duration_Period_Type,'
      'Description,'
      'Frequency_Period,'
      'Frequency_Period_Type,'
      'Office_Contact,'
      'Quantity,'
      'Termination_Notice_Period,'
      'Termination_Notice_Period_Type,'
      'Term_After_Initial_Period,'
      'Term_After_Initial_Period_Type,'
      'Payment_Terms,'
      'Review_Period,'
      'Review_Period_Type,'
      'Operator,'
      'Notes,'
      'Sub_Rep,'
      'Minimum_Quantity,'
      'Inactive,'
      'Inactive_Reason,'
      'Reference,'
      'Expiry_Date,'
      'Contract_Number,'
      'Original_Contract,'
      'Contract_Status)'
      'VALUES'
      '('
      ':Customer,'
      ':Branch_no,'
      ':Contact_no,'
      ':Date_Point,'
      ':Cust_Order_no,'
      ':Rep,'
      ':Date_Effective,'
      ':Duration_Mths,'
      ':Duration_Period_Type,'
      ':Description,'
      ':Frequency_Period,'
      ':Frequency_Period_Type,'
      ':Office_Contact,'
      ':Quantity,'
      ':Termination_Notice_Period,'
      ':Termination_Notice_Period_Type,'
      ':Term_After_Initial_Period,'
      ':Term_After_Initial_Period_Type,'
      ':Payment_Terms,'
      ':Review_Period,'
      ':Review_Period_Type,'
      ':Operator,'
      ':Notes,'
      ':Sub_Rep,'
      ':Minimum_Quantity,'
      ':Inactive,'
      ':Inactive_Reason,'
      ':Reference,'
      ':Expiry_Date,'
      ':Contract_Number,'
      ':Original_Contract,'
      ':Contract_Status'
      ')')
    Left = 32
    Top = 192
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
        Name = 'Date_Point'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Date_Effective'
      end
      item
        Name = 'Duration_Mths'
      end
      item
        Name = 'Duration_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Frequency_Period'
        DataType = ftInteger
      end
      item
        Name = 'Frequency_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Termination_Notice_Period'
      end
      item
        Name = 'Termination_Notice_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Term_After_Initial_Period'
      end
      item
        Name = 'Term_After_Initial_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Review_Period'
      end
      item
        Name = 'Review_Period_Type'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Notes'
        DataType = ftInteger
      end
      item
        Name = 'Sub_Rep'
      end
      item
        Name = 'Minimum_Quantity'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Inactive_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Expiry_Date'
      end
      item
        Name = 'Contract_Number'
      end
      item
        Name = 'Original_Contract'
      end
      item
        Name = 'Contract_Status'
      end>
  end
  object qryVersionCount: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT max(Contract_Number) as Last_Version'
      'FROM Contract'
      'WHERE Original_Contract = :Original_Contract')
    Left = 584
    Top = 16
    ParamData = <
      item
        Name = 'Original_Contract'
      end>
  end
  object qryGetLastContractNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Last_Contract_Number'
      'from Company')
    Left = 472
    Top = 16
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Company'
      'set Last_Contract_Number = :Last_Contract_Number'
      'where Company = 1')
    Left = 368
    Top = 16
    ParamData = <
      item
        Name = 'Last_Contract_Number'
      end>
  end
  object qryJobBags: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Contract_Job_Bag.ID,'
      '        Contract_Job_Bag.Contract,'
      '        Contract_Job_Bag.Job_Bag,'
      '        Job_Bag.Customer,'
      '        Job_Bag.Branch_No,'
      '        Job_Bag.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        Job_Bag.Date_Point,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Job_Bag.Cust_Order_No,'
      '        Job_Bag.Goods_Required,'
      '        Job_Bag.Date_Start,'
      '        Job_Bag.Quantity,'
      '        Job_Bag.inactive,'
      '        Job_Bag.Rep,'
      '        Job_Bag.Operator,'
      '        Job_Bag.Office_Contact,'
      '        Operator.Name as Operator_Name,'
      '        Office_Contact.Name as Office_Contact_Name,'
      '        Rep.Name as Rep_Name,'
      '        Job_Bag.Job_Bag_Status,'
      '        Job_Bag_Status.Job_Bag_Status_Descr'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Customer_Contact'
      '      RIGHT JOIN (Job_Bag_Status'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Operator AS Office_Contact'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN (Job_Bag'
      '      INNER JOIN Contract_Job_Bag'
      '          ON Job_Bag.Job_Bag = Contract_Job_Bag.Job_Bag)'
      '          ON Operator.Operator = Job_Bag.Operator)'
      '          ON Office_Contact.Operator = Job_Bag.Office_Contact)'
      '          ON Rep.Rep = Job_Bag.Rep)'
      
        '          ON Job_Bag_Status.Job_Bag_Status = Job_Bag.Job_Bag_Sta' +
        'tus)'
      '          ON (Customer_Contact.Contact_no = Job_Bag.Contact_no)'
      '            AND (Customer_Contact.Branch_no = Job_Bag.Branch_No)'
      '            AND (Customer_Contact.Customer = Job_Bag.Customer))'
      '          ON (Customer_Branch.Branch_no = Job_Bag.Branch_No)'
      '            AND (Customer_Branch.Customer = Job_Bag.Customer))'
      '          ON Customer.Customer = Customer_Branch.Customer'
      'WHERE Contract_Job_Bag.Contract = :Contract'
      'ORDER BY Contract_Job_Bag.Job_Bag DESC'
      '')
    Left = 288
    Top = 192
    ParamData = <
      item
        Name = 'Contract'
      end>
  end
  object dtsJobBags: TDataSource
    DataSet = qryJobBags
    Left = 352
    Top = 192
  end
  object qryDeleteJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Contract_Job_Bag'
      'WHERE Contract = :Contract AND'
      '      Job_Bag = :Job_Bag')
    Left = 288
    Top = 240
    ParamData = <
      item
        Name = 'Contract'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryPurchaseOrders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Contract_Purchase_Order.ID,'
      '        Contract_Purchase_Order.Contract,'
      '        Contract_Purchase_Order.Purchase_Order,'
      '        Purchase_Order.Date_Point,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Branch_No,'
      '        Purchase_Order.Contact_No,'
      '        Supplier_BranchContacts.Name as Contact_Name,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier.Name as Supplier_Name,'
      '        Purchase_Order.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Purchase_Order.Office_Contact,'
      '        Office_Contact.Name as Office_Contact_Name,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Supplier_Reference,'
      '        Purchase_OrderLine.Goods_Required,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Sell_Unit,'
      
        '        Purchase_OrderLine.Purch_Ord_Line_Status as Order_Status' +
        ','
      '        Purch_Ord_Line_Status.Description as Status_Description,'
      '        Purchase_Order.Authorised_by,'
      '        Purchase_Order.Needs_Authorising,'
      '        Price_Unit.Description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Order_Unit.Description,'
      '        Order_Unit.Price_Unit_Factor,'
      '        Purchase_OrderLine.On_Hold'
      'FROM Price_Unit AS Order_Unit'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN (Product_Type'
      '      INNER JOIN (Operator AS Office_Contact'
      '      INNER JOIN (Purch_Ord_Line_Status'
      '      INNER JOIN (Supplier'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN (Supplier_BranchContacts'
      '      INNER JOIN (((Purchase_Order'
      '      INNER JOIN Contract_Purchase_Order'
      
        '          ON Purchase_Order.Purchase_Order = Contract_Purchase_O' +
        'rder.Purchase_Order)'
      '      INNER JOIN Purchase_OrderLine'
      
        '          ON Purchase_Order.Purchase_Order = Purchase_OrderLine.' +
        'Purchase_Order)'
      '      INNER JOIN Operator'
      '          ON Purchase_Order.Operator = Operator.Operator)'
      
        '          ON (Supplier_BranchContacts.Contact_no = Purchase_Orde' +
        'r.Contact_No)'
      
        '              AND (Supplier_BranchContacts.Branch_no = Purchase_' +
        'Order.Branch_No)'
      
        '              AND (Supplier_BranchContacts.Supplier = Purchase_O' +
        'rder.Supplier))'
      
        '          ON (Supplier_Branch.Branch_no = Supplier_BranchContact' +
        's.Branch_no)'
      
        '              AND (Supplier_Branch.Supplier = Supplier_BranchCon' +
        'tacts.Supplier))'
      '          ON Supplier.Supplier = Supplier_Branch.Supplier)'
      
        '          ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purch' +
        'ase_OrderLine.Purch_Ord_Line_Status)'
      
        '          ON Office_Contact.Operator = Purchase_Order.Office_Con' +
        'tact)'
      
        '          ON Product_Type.Product_Type = Purchase_OrderLine.Prod' +
        'uct_Type)'
      
        '          ON Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Uni' +
        't)'
      
        '          ON Order_Unit.Price_Unit = Purchase_OrderLine.Order_Un' +
        'it'
      'WHERE Contract_Purchase_Order.Contract = :Contract'
      'ORDER BY Contract_Purchase_Order.Purchase_Order DESC'
      '')
    Left = 288
    Top = 312
    ParamData = <
      item
        Name = 'Contract'
      end>
  end
  object dtsPurchaseOrders: TDataSource
    DataSet = qryPurchaseOrders
    Left = 352
    Top = 312
  end
  object qryDeletePO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Contract_Purchase_Order'
      'WHERE Contract = :Contract AND'
      '      Purchase_Order = :Purchase_Order')
    Left = 288
    Top = 360
    ParamData = <
      item
        Name = 'Contract'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetdbKey: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contract'
      'From Contract'
      'Where Contract_Number = :Contract_Number'
      ' '
      ' ')
    Left = 288
    Top = 416
    ParamData = <
      item
        Name = 'Contract_Number'
      end>
  end
  object qrySalesInvoices: TFDQuery
    OnCalcFields = qrySalesInvoicesCalcFields
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'SELECT'
      #9'Sales_Invoice.Sales_Invoice,'
      #9'Sales_Invoice.Sales_Invoice_No,'
      #9'Sales_Invoice.Invoice_Date,'
      #9'Sales_Invoice.Invoice_Description,'
      '  Sales_Invoice.Invoice_or_Credit,'
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'Sales_Invoice_Line.Goods_Value'
      #9'ELSE'
      
        #9'     ((Sales_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Sales' +
        '_Invoice_Line.Goods_Value)'
      #9'END) as Goods_Value,'
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'(Sales_Invoice_Line.Goods_Value*(Vat_Code.Vat_rate/100))'
      #9'ELSE'
      
        #9'     (((Sales_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Sale' +
        's_Invoice_Line.Goods_Value)*(Vat_Code.Vat_rate/100))'
      #9'END) as Vat_Value,'
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'Sales_Invoice_Line.Goods_Value +'
      #9#9'(Sales_Invoice_Line.Goods_Value*(Vat_Code.Vat_rate/100))'
      #9'ELSE'
      
        #9'     ((Sales_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Sales' +
        '_Invoice_Line.Goods_Value) +'
      
        #9'     (((Sales_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Sale' +
        's_Invoice_Line.Goods_Value)*(Vat_Code.Vat_rate/100))'
      #9'END) as Total_Value'
      'FROM Contract_Job_Bag'
      '      INNER JOIN (Vat_Code'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN (Sales_Invoice'
      '      INNER JOIN Sales_Invoice_Line'
      
        '          ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sa' +
        'les_Invoice)'
      
        '          ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Un' +
        'it)'
      '          ON Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code)'
      
        '          ON Contract_Job_Bag.Job_Bag = Sales_Invoice_Line.Job_B' +
        'ag'
      'WHERE Contract_Job_Bag.Contract = :Contract and'
      '((Sales_invoice.inactive IS NULL) or'
      '(Sales_invoice.inactive = '#39'N'#39'))'
      'GROUP BY Sales_Invoice.Sales_Invoice,'
      #9'Sales_Invoice.Sales_Invoice_No,'
      #9'Sales_Invoice.Invoice_Date,'
      #9'Sales_Invoice.Invoice_Description,'
      '  Sales_Invoice.Invoice_or_Credit'
      'ORDER BY Sales_Invoice.Sales_Invoice_No DESC')
    Left = 520
    Top = 320
    ParamData = <
      item
        Name = 'Contract'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySalesInvoicesSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
      Origin = 'Sales_Invoice'
      Required = True
    end
    object qrySalesInvoicesSales_Invoice_No: TWideStringField
      FieldName = 'Sales_Invoice_No'
      Origin = 'Sales_Invoice_No'
      Size = 15
    end
    object qrySalesInvoicesInvoice_Date: TSQLTimeStampField
      FieldName = 'Invoice_Date'
      Origin = 'Invoice_Date'
    end
    object qrySalesInvoicesInvoice_Description: TWideStringField
      FieldName = 'Invoice_Description'
      Origin = 'Invoice_Description'
      Size = 80
    end
    object qrySalesInvoicesInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      Origin = 'Invoice_or_Credit'
      Size = 1
    end
    object qrySalesInvoicesGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      Origin = 'Goods_Value'
      ReadOnly = True
    end
    object qrySalesInvoicesVat_Value: TFloatField
      FieldName = 'Vat_Value'
      Origin = 'Vat_Value'
      ReadOnly = True
    end
    object qrySalesInvoicesTotal_Value: TFloatField
      FieldName = 'Total_Value'
      Origin = 'Total_Value'
      ReadOnly = True
    end
  end
  object dtsSalesInvoices: TDataSource
    DataSet = qrySalesInvoices
    Left = 592
    Top = 320
  end
  object qryAllSalesInvoiceCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice.Sales_Invoice,'
      '        SUM(Sales_Invoice_Add_charge.Amount) as Amount_Total,'
      
        '        SUM((Sales_Invoice_Add_charge.Amount * (Vat_Code.Vat_Rat' +
        'e/100))) as Vat_Total'
      'FROM Vat_Code'
      '      INNER JOIN (Sales_Invoice'
      '      INNER JOIN Sales_Invoice_Add_charge'
      
        '        ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Add_charg' +
        'e.Sales_Invoice)'
      '        ON Vat_Code.Vat_Code = Sales_Invoice_Add_charge.Vat_Code'
      'WHERE Sales_Invoice.Sales_Invoice = :Sales_Invoice'
      'GROUP BY Sales_Invoice.Sales_Invoice')
    Left = 680
    Top = 320
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
end
