object dtmdlContract: TdtmdlContract
  OldCreateOrder = False
  Left = 232
  Top = 107
  Height = 522
  Width = 1084
  object qryZero: TQuery
    DatabaseName = 'wt'
    Left = 216
    Top = 8
  end
  object qryCQHeader: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'SELECT  Contract_Quote.Contract_Quote,'
      '        Contract_Quote.Contract_Date,'
      '        Contract_Quote.Expiry_Date,'
      '        Contract_Quote.Contact_Name,'
      '        Contract_Quote.Contract_Quote_Number,'
      '        Contract_Quote.Customer,'
      '        Contract_Quote.Branch_no,'
      '        Contract_Quote.Contract_Description,'
      '        Contract_Quote.Developer,'
      '        Contract_Quote.Site_Contact,'
      '        Contract_Quote.Site_Location,'
      '        Contract_Quote.Site_Phone,'
      '        Contract_Quote.Notes,'
      '        Contract_Quote.Customer_Name,'
      '        Contract_Quote.Operator,'
      '        Contract_Quote.Address,'
      '        Operator.Operator_Name,'
      '        Contract_Quote.Account_Manager,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Contract_Quote.inactive,'
      '        Contract_Quote.inactive,'
      '        Contract_Quote.inactive_reason,'
      '        Contract_Quote.Original_Quote,'
      '        Contract_Quote.Quote_Number,'
      '        Contract_Quote.Revenue_Centre,'
      '        Inactive_reason.Inactive_reason_Descr,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative'
      'FROM Inactive_reason'
      '      RIGHT JOIN (Operator AS Account_Manager'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Customer'
      '      INNER JOIN Contract_Quote'
      '        ON Customer.Customer = Contract_Quote.Customer)'
      '        ON Operator.Operator = Contract_Quote.Operator)'
      
        '        ON Account_Manager.Operator = Contract_Quote.Account_Man' +
        'ager)'
      
        '        ON Inactive_reason.Inactive_reason = Contract_Quote.Inac' +
        'tive_Reason'
      'WHERE'
      '  Contract_Quote.Contract_Quote = :Contract_Quote'
      ''
      '')
    Left = 24
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryCQAddHeader: TQuery
    DatabaseName = 'wT'
    SQL.Strings = (
      'INSERT INTO Contract_Quote'
      '(       Contract_Quote,'
      '        Operator,'
      '        Contract_Description,'
      '        Contract_Date,'
      '        Customer,'
      '        Inactive,'
      '        Inactive_Reason,'
      '        Notes,'
      '        Customer_Name,'
      '        Account_Manager,'
      '        Contract_Quote_Number,'
      '        Developer,'
      '        Site_Contact,'
      '        Site_Location,'
      '        Site_Phone,'
      '        Contact_Name,'
      '        Address,'
      '        Expiry_Date,'
      '        Original_Quote,'
      '        Quote_Number,'
      '        Revenue_Centre'
      ')'
      'Values'
      '(       :Contract_Quote,'
      '        :Operator,'
      '        :Contract_Description,'
      '        :Contract_Date,'
      '        :Customer,'
      '        :Inactive,'
      '        :Inactive_Reason,'
      '        :Notes,'
      '        :Customer_Name,'
      '        :Account_Manager,'
      '        :Contract_Quote_Number,'
      '        :Developer,'
      '        :Site_Contact,'
      '        :Site_Location,'
      '        :Site_Phone,'
      '        :Contact_Name,'
      '        :Address,'
      '        :Expiry_Date,'
      '        :Original_Quote,'
      '        :Quote_Number,'
      '        :Revenue_Centre'
      ')'
      '')
    Left = 104
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Contract_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Contract_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inactive_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Contract_Quote_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Developer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Site_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Site_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Site_Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Expiry_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Revenue_Centre'
        ParamType = ptUnknown
      end>
  end
  object qryCQUpHeader: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Update Contract_Quote'
      'Set Account_Manager = :Account_Manager,'
      '    Contract_Description = :Contract_Description,'
      '    Contract_Date = :Contract_Date,'
      '    Customer = :Customer,'
      '    Inactive = :Inactive,'
      '    Inactive_Reason = :Inactive_Reason,'
      '    Notes = :Notes,'
      '    Customer_Name = :Customer_Name,'
      '    Developer = :Developer,'
      '    Site_Contact = :Site_Contact,'
      '    Site_Location = :Site_Location,'
      '    Site_Phone = :Site_Phone,'
      '    Contact_Name = :Contact_Name,'
      '    Address = :Address,'
      '    Expiry_Date = :Expiry_Date,'
      '    Quote_Number = :Quote_Number,'
      '    Revenue_Centre = :Revenue_Centre'
      'WHERE Contract_Quote = :Contract_Quote')
    Left = 200
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Contract_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contract_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inactive_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Developer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Site_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Site_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Site_Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Expiry_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Revenue_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryCQGetLast: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Last_Contract_Quote_Number'
      'from Company')
    Left = 272
    Top = 8
  end
  object qryAllContracts: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Contract_Quote.Contract_Quote,'
      '        Contract_Quote.Contract_Date,'
      '        Contract_Quote.Expiry_Date,'
      '        Contract_Quote.Contract_Quote_Number,'
      '        Contract_Quote.Customer,'
      '        Contract_Quote.Contract_Description,'
      '        Contract_Quote.Developer,'
      '        Contract_Quote.Site_Location,'
      '        Contract_Quote.Notes,'
      '        Contract_Quote.Customer_Name,'
      '        Contract_Quote.Operator,'
      '        Contract_Quote.Quote_Number,'
      '        Contract_Quote.Original_Quote,'
      '        Operator.Operator_Name,'
      '        Contract_Quote.Account_Manager,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Contract_Quote.inactive,'
      '        Contract_Quote.inactive,'
      '        Contract_Quote.inactive_reason,'
      '        Inactive_reason.Inactive_reason_Descr,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative'
      'FROM Inactive_reason'
      '      RIGHT JOIN (Operator AS Account_Manager'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Customer'
      '      INNER JOIN Contract_Quote'
      '        ON Customer.Customer = Contract_Quote.Customer)'
      '        ON Operator.Operator = Contract_Quote.Operator)'
      
        '        ON Account_Manager.Operator = Contract_Quote.Account_Man' +
        'ager)'
      
        '        ON Inactive_reason.Inactive_reason = Contract_Quote.Inac' +
        'tive_Reason'
      'WHERE 1=1')
    Left = 24
    Top = 8
  end
  object dtsAllContracts: TDataSource
    DataSet = qryAllContracts
    Left = 96
    Top = 8
  end
  object qrydummy: TQuery
    SQL.Strings = (
      'SELECT  Contract_Quote.Contract_Quote,'
      '        Contract_Quote.Contract_Date,'
      '        Contract_Quote.Expiry_Date,'
      '        Contract_Quote.Contract_Quote_Number,'
      '        Contract_Quote.Customer,'
      '        Contract_Quote.Branch_No,'
      '        Contract_Quote.Contract_Description,'
      '        Contract_Quote.Developer,'
      '        Contract_Quote.Site_Location,'
      '        Contract_Quote.Notes,'
      '        Contract_Quote.Customer_Name,'
      '        Contract_Quote.Operator,'
      '        Contract_Quote.Quote_Number,'
      '        Contract_Quote.Original_Quote,'
      '        Operator.Operator_Name,'
      '        Contract_Quote.Account_Manager,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Contract_Quote.inactive,'
      '        Contract_Quote.inactive,'
      '        Contract_Quote.inactive_reason,'
      '        Inactive_reason.Inactive_reason_Descr,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative'
      'FROM Inactive_reason'
      '      RIGHT JOIN (Operator AS Account_Manager'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Customer'
      '      INNER JOIN Contract_Quote'
      '        ON Customer.Customer = Contract_Quote.Customer)'
      '        ON Operator.Operator = Contract_Quote.Operator)'
      
        '        ON Account_Manager.Operator = Contract_Quote.Account_Man' +
        'ager)'
      
        '        ON Inactive_reason.Inactive_reason = Contract_Quote.Inac' +
        'tive_Reason'
      'WHERE 1=1')
    Left = 160
    Top = 8
  end
  object qryCustContracts: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select Quote.*'
      'from Quote'
      'where Customer = :Customer and'
      'Description LIKE :Description'
      'order by Quote desc')
    Left = 24
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object dtsContracts: TDataSource
    DataSet = qryCustContracts
    Left = 96
    Top = 64
  end
  object qryOperator: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Operator'
      'ORDER BY Operator.Operator_Name')
    Left = 688
    Top = 72
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 760
    Top = 72
  end
  object qryUpCompany: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'update company'
      'set last_Contract_Quote_number = :last_Contract_Quote_number'
      'where company = 1')
    Left = 272
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'last_Contract_Quote_number'
        ParamType = ptUnknown
      end>
  end
  object qryCQAddLine: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'INSERT INTO Contract_Quote_Line'
      '('
      'Contract_Quote,'
      'Line_Number,'
      'Drawing_Number,'
      'Supplier_Reference,'
      'Number_of_Units'
      ')'
      'VALUES'
      '('
      ':Contract_Quote,'
      ':Line_Number,'
      ':Drawing_Number,'
      ':Supplier_Reference,'
      ':Number_of_Units'
      ')')
    Left = 24
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Drawing_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Number_of_Units'
        ParamType = ptUnknown
      end>
  end
  object qryCQAllLines: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Contract_Quote,'
      '        Line_Number,'
      '        Drawing_Number,'
      '        Supplier_Reference,'
      '        Number_of_Units'
      'FROM Contract_Quote_Line'
      'WHERE Contract_Quote = :Contract_Quote'
      'ORDER BY Line_Number')
    Left = 96
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetCQLOptions: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Contract_Quote_Line_Option.Contract_Quote,'
      '        Contract_Quote_Line_Option.Line_Number,'
      '        Contract_Quote_Line_Option.Option_Number,'
      '        Contract_Quote_Line_Option.Option_Description,'
      '        Contract_Quote_Line_Option.Quote,'
      '        Contract_Quote_Line_Option.Nett_Price,'
      '        Contract_Quote_Line_Option.Installation_Price,'
      '        Contract_Quote_Line_Option.Delivery_Price,'
      '        Contract_Quote_Line_Option.Discount_Value,'
      '        Contract_Quote_Line_Option.Markup_Value,'
      '        Contract_Quote_Line_Option.Survey_Price,'
      '        Contract_Quote_Line_Option.Thickness,'
      '        Contract_Quote_Line_Option.Group_Number,'
      '        Contract_Quote_Line_Option.Quote_Description,'
      '        Contract_Quote_Line_Option.Markup_Percentage,'
      '        Contract_Quote_Line_Option.Original_Quote,'
      '        Customer_Worktop_Group.Material_Type'
      'FROM ((Contract_Quote'
      '      INNER JOIN Contract_Quote_Line'
      
        '        ON Contract_Quote.Contract_Quote = Contract_Quote_Line.C' +
        'ontract_Quote)'
      '      INNER JOIN Contract_Quote_Line_Option'
      
        '        ON (Contract_Quote_Line.Line_Number = Contract_Quote_Lin' +
        'e_Option.Line_Number) AND (Contract_Quote_Line.Contract_Quote = ' +
        'Contract_Quote_Line_Option.Contract_Quote))'
      '      INNER JOIN Customer_Worktop_Group'
      
        '        ON (Contract_Quote_Line_Option.Group_Number = Customer_W' +
        'orktop_Group.Group_Number) AND (Contract_Quote.Customer = Custom' +
        'er_Worktop_Group.Customer)'
      'WHERE'
      
        '  Contract_Quote_Line_Option.Contract_Quote = :Contract_Quote AN' +
        'D'
      '  Contract_Quote_Line_Option.Line_Number = :Line_Number'
      'ORDER BY Option_Number')
    Left = 32
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Number'
        ParamType = ptUnknown
      end>
  end
  object qryCQLAddOption: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'INSERT INTO Contract_Quote_Line_Option'
      '('
      'Contract_Quote,'
      'Line_Number,'
      'Option_Number,'
      'Group_Number,'
      'Option_Description,'
      'Quote,'
      'Quote_Description,'
      'Nett_Price,'
      'Installation_Price,'
      'Delivery_Price,'
      'Survey_Price,'
      'Discount_Value,'
      'Markup_Value,'
      'Thickness,'
      'Markup_Percentage,'
      'Original_Quote'
      ')'
      'VALUES'
      '('
      ':Contract_Quote,'
      ':Line_Number,'
      ':Option_Number,'
      ':Group_Number,'
      ':Option_Description,'
      ':Quote,'
      ':Quote_Description,'
      ':Nett_Price,'
      ':Installation_Price,'
      ':Delivery_Price,'
      ':Survey_Price,'
      ':Discount_Value,'
      ':Markup_Value,'
      ':Thickness,'
      ':Markup_Percentage,'
      ':Original_Quote'
      ')')
    Left = 128
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Option_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Option_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nett_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Installation_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Survey_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Markup_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Markup_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end>
  end
  object dsCustQuotes: TDataSource
    DataSet = qryCustQuotes
    Left = 760
    Top = 136
  end
  object qryCustQuotes: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.Quote,'
      '        Quote.Date_Required,'
      '        Quote.Date_Raised,'
      '        Quote.Customer,'
      '        Quote.Description,'
      '        Quote.Operator,'
      '        Quote.Installation_price,'
      '        Quote.Delivery_Price,'
      '        Quote.Survey_price,'
      '        Quote.Extra_Notes,'
      '        Quote.Availability,'
      '        Quote.Payment_terms,'
      '        Quote.Reference,'
      '        Quote.Quote_Status,'
      '        Quote.Nett_Price,'
      '        Quote.Inactive,'
      '        Quote.Inactive_reason,'
      '        Operator.Operator_Name,'
      
        '        Quote_Status.Quote_status_description AS Status_Descript' +
        'ion,'
      '        Quote.Customer_name,'
      '        Quote.Contact_Name,'
      '        Quote.Material_Type,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote.Address,'
      '        Vat.Vat_Rate,'
      '        Quote.Vat,'
      '        Quote.Discount_Rate,'
      '        Quote.Discount_Value,'
      '        Quote.Deposit_Terms,'
      '        Quote.Deposit_Amount,'
      '        Quote.Template_Date,'
      '        Quote.Install_Address,'
      '        Quote.Date_Accepted,'
      '        Customer.Rep'
      'FROM Vat INNER JOIN (Quote_Status'
      '  INNER JOIN (Operator'
      '  INNER JOIN (Material_Type'
      '  INNER JOIN (Customer'
      '  INNER JOIN Quote ON'
      '    Customer.Customer = Quote.Customer) ON'
      '    Material_Type.Material_Type = Quote.Material_Type) ON'
      '    Operator.Operator = Quote.Operator) ON'
      '    Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '    Vat.Vat = Quote.Vat'
      'WHERE Quote.Customer = :customer AND'
      'Quote.Contract_Quote <> '#39'Y'#39
      'ORDER BY Quote.Quote desc')
    Left = 680
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end>
  end
  object dsDummy: TDataSource
    Left = 832
    Top = 136
  end
  object qryGetCustomerWorktop: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT Top 1 Worktop'
      'FROM Customer_Worktop'
      'WHERE Customer = :Customer AND Group_Number = :Group_Number')
    Left = 48
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerPrice: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select  Customer,'
      '        Group_Number,'
      '        Thickness,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Customer_Worktop_Group_Thick'
      'where Customer = :Customer and'
      'Group_Number = :Group_Number and'
      'Thickness = :Thickness')
    Left = 152
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object qryCQAllEvents: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Contract_Quote_internal_Note, Operator'
      'where Contract_Quote = :Contract_Quote and'
      'Contract_Quote_internal_Note.Operator = Operator.Operator')
    Left = 416
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryCQAddEvent: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'insert into Contract_Quote_Internal_Note ('
      'Contract_Quote,'
      'Internal_Note,'
      'Date_Time_Entered,'
      'Operator,'
      'Narrative)'
      'values ('
      ':Contract_Quote,'
      ':Internal_Note,'
      ':Date_Time_Entered,'
      ':Operator,'
      ':Narrative)')
    Left = 416
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Note'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Time_Entered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object qryGetCutOutPrice: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select TOP 1'
      '        CutOut,'
      '        Material_type,'
      '        Edge_Type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Cutout_thickness'
      'where Material_Type = :Material_type and'
      'Edge_Type = :Edge_Type and'
      'cutout = :cutout')
    Left = 48
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cutout'
        ParamType = ptUnknown
      end>
  end
  object qryGetEdgePrice: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select TOP 1'
      '        Edge_profile,'
      '        Material_type,'
      '        Edge_type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Edge_thickness'
      'where Material_Type = :Material_type and'
      'Edge_Type = :Edge_Type and'
      'Edge_profile = :Edge_profile')
    Left = 48
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_profile'
        ParamType = ptUnknown
      end>
  end
  object qryGetAddress: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Address'
      'WHERE Address = :Address')
    Left = 488
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextAdd: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(address) as Last_Address'
      'from Address')
    Left = 488
    Top = 8
  end
  object qryAddAddress: TQuery
    DatabaseName = 'wT'
    SQL.Strings = (
      'insert into Address'
      '(Address,'
      'Address_name,'
      'Street,'
      'Locale,'
      'Town_city,'
      'Postcode,'
      'County_state,'
      'telephone_number,'
      'email_address)'
      'values'
      '(:Address,'
      ':Address_name,'
      ':Street,'
      ':Locale,'
      ':Town_city,'
      ':Postcode,'
      ':County_state,'
      ':Telephone_number,'
      ':email_address)')
    Left = 488
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Street'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Locale'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Town_city'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Postcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'County_state'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telephone_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email_address'
        ParamType = ptUnknown
      end>
  end
  object qryUpAddress: TQuery
    DatabaseName = 'wT'
    SQL.Strings = (
      'update Address'
      'set'
      '  Address_Name = :Address_Name,'
      '  Street = :Street,'
      '  Locale = :Locale,'
      '  Town_City = :Town_City,'
      '  Postcode = :Postcode,'
      '  County_State = :County_State,'
      '  Telephone_number = :Telephone_number,'
      '  Email_Address = :email_Address'
      'where Address = :Address')
    Left = 488
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Street'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Locale'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Town_City'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Postcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'County_State'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telephone_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
  object qryDelAddress: TQuery
    DatabaseName = 'wT'
    SQL.Strings = (
      'delete from Address'
      'where address = :address')
    Left = 488
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'address'
        ParamType = ptUnknown
      end>
  end
  object qryUpQuoteAddress: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Customer = :Customer,'
      '    Address = :Address,'
      '    Customer_Name = :Customer_Name'
      'where Address = :Original_Address')
    Left = 584
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Address'
        ParamType = ptUnknown
      end>
  end
  object qryUpContractAddress: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Update Contract_Quote'
      'set Customer = :Customer,'
      '    Address = :Address,'
      '    Customer_Name = :Customer_Name'
      'where Address = :Original_Address')
    Left = 584
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Address'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerWG: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Worktop_Group'
      'WHERE Customer = :Customer AND'
      '               Group_Number = :Group_Number')
    Left = 688
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryAddCustomerWG: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'INSERT INTO Customer_Worktop_Group'
      
        'Values (:Customer, :Group_Number, :Group_Description, :Material_' +
        'Type, '#39'N'#39')')
    Left = 688
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerWT: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Worktop'
      'WHERE Customer = :Customer AND'
      '               Group_Number = :Group_Number')
    Left = 688
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryAddCustomerWT: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'INSERT INTO Customer_Worktop'
      'Values (:Customer, :Group_Number, :Worktop, '#39'N'#39')')
    Left = 688
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerTH: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *,'
      '    (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer =  Customer_Worktop_Group_Thick.p' +
        'rice_pointer and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price'
      'FROM Customer_Worktop_Group_Thick'
      'WHERE Customer = :Customer AND'
      '               Group_Number = :Group_Number')
    Left = 688
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryAddCustomerTH: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'INSERT INTO Customer_Worktop_Group_Thick'
      'Values (:Customer, :Group_Number, :Thickness, :Price_Pointer)')
    Left = 688
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Pointer'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustGroupWorktop: TQuery
    DatabaseName = 'Wt'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Worktop'
      'WHERE Customer = :Customer AND'
      '               Group_Number = :Group_Number AND'
      '               Worktop = :Worktop')
    Left = 784
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustGroupThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Worktop_Group_Thick'
      'WHERE Customer = :Customer AND'
      '               Group_Number = :Group_Number AND'
      '               Thickness = :Thickness')
    Left = 792
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object qryReQuoteCount: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'SELECT max(Quote_Number) as Last_ReQuote'
      'FROM Contract_Quote'
      'WHERE Original_Quote = :Original_Quote')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end>
  end
  object GetLastSQL: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Contract_Quote'
      'From Contract_Quote'
      'Where Contract_Description = :GUID')
    Left = 328
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object DelSQL: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Delete From Contract_Quote'
      'Where'
      '(Contract_Quote = :Contract_Quote)')
    Left = 392
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object AddSQL: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Insert Into Contract_Quote'
      
        '            (Contract_Quote, Contract_Date, Contract_Quote_Numbe' +
        'r, Customer, Contract_Description, Operator)'
      
        'Select Max(Contract_Quote)+1, 0, 0.00, 1, :GUID, :Operator From ' +
        'Contract_Quote'
      ''
      ''
      ''
      ' ')
    Left = 452
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryCQUpdateHeader: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Update Contract_Quote'
      'Set Account_Manager = :Account_Manager,'
      '    Contract_Description = :Contract_Description,'
      '    Contract_Date = :Contract_Date,'
      '    Contract_Quote_Number = :Contract_Quote_Number,'
      '    Customer = :Customer,'
      '    Branch_No = :Branch_no,'
      '    Inactive = :Inactive,'
      '    Inactive_Reason = :Inactive_Reason,'
      '    Notes = :Notes,'
      '    Customer_Name = :Customer_Name,'
      '    Developer = :Developer,'
      '    Site_Contact = :Site_Contact,'
      '    Site_Location = :Site_Location,'
      '    Site_Phone = :Site_Phone,'
      '    Contact_Name = :Contact_Name,'
      '    Address = :Address,'
      '    Expiry_Date = :Expiry_Date,'
      '    Original_Quote = :Original_Quote,'
      '    Quote_Number = :Quote_Number,'
      '    Revenue_Centre = :Revenue_Centre'
      'WHERE Contract_Quote = :Contract_Quote')
    Left = 304
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Contract_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contract_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contract_Quote_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inactive_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Developer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Site_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Site_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Site_Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Expiry_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Revenue_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerSupplier: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT Supplier'
      'FROM Customer_Worktop_Group'
      'WHERE Customer = :Customer AND Group_Number = :Group_Number')
    Left = 152
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerCutOutPrice: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Material_Type,'
      '        Customer_Cutout_Edge_Group.Effective_Date,'
      '        Customer_Cutout_Edge_Group.Ineffective_Date,'
      '        Customer_Cutout_Edge_Group.inactive,'
      '        Customer_Cutout.CutOut,'
      '        Customer_Cutout.Edge_Type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      '         where Price_Pointer = Customer_Cutout.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      '         where Price_Pointer = Customer_Cutout.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Customer_Cutout.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'FROM Customer_Cutout_Edge_Group'
      '    INNER JOIN Customer_Cutout'
      
        '      ON Customer_Cutout_Edge_Group.Group_ID = Customer_Cutout.G' +
        'roup_ID'
      'WHERE'
      '  Customer_Cutout_Edge_Group.Customer = :Customer and'
      '  Customer_Cutout_Edge_Group.Material_Type = :Material_type and'
      '  Customer_Cutout.Edge_Type = :Edge_Type and'
      '  Customer_Cutout.Cutout = :cutout')
    Left = 336
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cutout'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerEdgePrice: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Material_Type,'
      '        Customer_Cutout_Edge_Group.Effective_Date,'
      '        Customer_Cutout_Edge_Group.Ineffective_Date,'
      '        Customer_Cutout_Edge_Group.inactive,'
      '        Customer_Edge.Edge_Type,'
      '        Customer_Edge.Edge_Profile,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      '         where Price_Pointer = Customer_Edge.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      '         where Price_Pointer = Customer_Edge.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Customer_Edge.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'FROM Customer_Cutout_Edge_Group'
      '      INNER JOIN Customer_Edge'
      
        '        ON Customer_Cutout_Edge_Group.Group_ID = Customer_Edge.G' +
        'roup_ID'
      'WHERE'
      '  Customer_Cutout_Edge_Group.Customer = :Customer and'
      '  Customer_Cutout_Edge_Group.Material_Type = :Material_type and'
      '  Customer_Edge.Edge_Type = :Edge_Type and'
      '  Customer_Edge.Edge_Profile = :Edge_Profile')
    Left = 448
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Profile'
        ParamType = ptUnknown
      end>
  end
  object qryGetMaterialSlab: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT Length, Depth'
      'FROM Material_Type_Slab_Size'
      'WHERE Material_Type = :Material_Type AND Length >= :Length')
    Left = 416
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Length'
        ParamType = ptUnknown
      end>
  end
  object qryRevenueCentre: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'ORDER BY Revenue_Centre_Descr')
    Left = 856
    Top = 24
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 944
    Top = 24
  end
end
