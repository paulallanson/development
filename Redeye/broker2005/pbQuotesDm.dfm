object dtmdlQuotes: TdtmdlQuotes
  OnCreate = DataModuleCreate
  Height = 690
  Width = 1033
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 720
    Top = 16
  end
  object qryQHeader: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Quote.Quote,'
      '      Quote.Ad_hoc_Address,'
      '      Quote.Description,'
      '      Quote.Descriptive_Reference,'
      '      Customer.Name as Cust_Name,'
      '      Quote.Date_Point,'
      '      Quote.Quote_Required_By,'
      '      Quote.Date_Start,'
      '      (select Customer_Branch.Name'
      '       from Customer_Branch'
      '       where Customer_Branch.Customer = Quote.Customer and'
      
        '             Customer_Branch.Branch_no = Quote.Branch_no) as Bra' +
        'nch_Name,'
      '      Customer.Customer,'
      '      Customer.Customer_is_Acquired,'
      '      Quote.Branch_No,'
      '      Quote.Contact_no,'
      '      Quote.Date_Required,'
      '      Quote.Contact_Name,'
      '      Quote.Enclosing_Type,'
      '      Quote.Email,'
      '      Quote.Phone,'
      '      Quote.Office_Contact,'
      '      Quote.Quantity,'
      '      Quote.Rep,'
      '      Quote.Sub_Rep,'
      '      Quote.Inactive,'
      '      Quote.Operator,'
      '      Quote.Date_Last_Estimated,'
      '      Operator.Name as Operator_Name,'
      '      Quote.Narrative,'
      '      Quote.Price_Unit,'
      '      Quote.Convert_Percentage,'
      '      Quote.Quote_status,'
      '      Quote_Status.Quote_Status_Description,'
      '      Quote.Pack_Format_ID,'
      '      Quote.Price_Unit,'
      '      Price_Unit.Description as Price_Unit_Description,'
      '      Price_Unit.Price_Unit_Factor,'
      '      Quote.Convert_Percentage,'
      '      Quote.Estimate_File,'
      '      Quote.Quote_Reason,'
      '      Quote.Original_Quote,'
      '      Quote.Prospect_Quote,'
      '      Quote.End_User_Customer,'
      '      Quote.End_User_Branch_no,'
      '      (select Customer.Name'
      '       from Customer'
      
        '       where Customer.Customer = Quote.End_User_Customer) as End' +
        '_User_Customer_Name,'
      '      (select Name'
      '      from Ad_Hoc_Address'
      
        '      where Ad_Hoc_Address.Ad_Hoc_Address = Quote.Ad_Hoc_Address' +
        ') as Ad_Hoc_Name,'
      '      (select Name'
      '      from Operator'
      
        '      where Operator.Operator = Office_Contact) as Office_Contac' +
        't_Name,'
      '       (select top 1 Job_Bag.Job_Bag'
      '       from Job_Bag'
      '       where Job_Bag.Quote = Quote.Quote and'
      '             Job_Bag.inactive = '#39'N'#39') as Job_Bag'
      'FROM Rep'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Price_Unit'
      '      RIGHT JOIN (Operator AS AM'
      '      INNER JOIN ((Operator'
      '      INNER JOIN Quote'
      '          ON Operator.Operator = Quote.Operator)'
      '      LEFT JOIN Customer'
      '          ON Quote.Customer = Customer.Customer)'
      '          ON AM.Operator = Quote.Office_Contact)'
      '          ON Price_Unit.Price_Unit = Quote.Price_unit)'
      '          ON Quote_Status.Quote_Status = Quote.Quote_Status)'
      '          ON Rep.Rep = Quote.Rep'
      'WHERE'
      '  (Quote.Quote = :Quote)')
    Left = 24
    Top = 16
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQAddHeader: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Quote ('
      'Quote,'
      'Description,'
      'Descriptive_Reference,'
      'Customer,'
      'Branch_No,'
      'Contact_no,'
      'Date_Point,'
      'Date_required,'
      'Office_Contact,'
      'Quantity,'
      'Rep,'
      'Sub_Rep,'
      'Quote_Status,'
      'Inactive,'
      'Operator,'
      'Narrative,'
      'Date_Start,'
      'Price_Unit,'
      'Convert_Percentage,'
      'Quote_Required_By,'
      'Total_Cost_Value,'
      'Total_Sales_Value,'
      'Total_Suggested_Value,'
      'Estimate_File,'
      'Quote_reason,'
      'Date_Last_Estimated,'
      'Ad_hoc_Address,'
      'Email,'
      'Contact_Name,'
      'Phone,'
      'Customer_Name,'
      'Original_Quote,'
      'End_User_Customer,'
      'End_User_Branch_No,'
      'Prospect_Quote,'
      'Enclosing_Type,'
      'Pack_Format_ID'
      ')'
      'VALUES ('
      ':Quote,'
      ':Description,'
      ':Descriptive_Reference,'
      ':Customer,'
      ':Branch_No,'
      ':Contact_no,'
      ':Date_Point,'
      ':Date_required,'
      ':Office_Contact,'
      ':Quantity,'
      ':Rep,'
      ':Sub_Rep,'
      ':Quote_Status,'
      ':Inactive,'
      ':Operator,'
      ':Narrative,'
      ':Date_Start,'
      ':Price_Unit,'
      ':Convert_Percentage,'
      ':Quote_Required_By,'
      ':Total_Cost_Value,'
      ':Total_Sales_Value,'
      ':Total_Suggested_Value,'
      ':Estimate_File,'
      ':Quote_Reason,'
      ':Date_Last_Estimated,'
      ':Ad_hoc_Address,'
      ':Email,'
      ':Contact_Name,'
      ':Phone,'
      ':Customer_Name,'
      ':Original_Quote,'
      ':End_User_Customer,'
      ':End_User_Branch_No,'
      ':Prospect_Quote,'
      ':Enclosing_Type,'
      ':Pack_Format_ID'
      ')'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 112
    Top = 16
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Descriptive_Reference'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Date_required'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Quantity'
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
        Name = 'Quote_Status'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Date_Start'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Convert_Percentage'
      end
      item
        Name = 'Quote_Required_By'
      end
      item
        Name = 'Total_Cost_Value'
      end
      item
        Name = 'Total_Sales_Value'
      end
      item
        Name = 'Total_Suggested_Value'
      end
      item
        Name = 'Estimate_File'
      end
      item
        Name = 'Quote_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Date_Last_Estimated'
      end
      item
        Name = 'Ad_hoc_Address'
        DataType = ftInteger
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Contact_Name'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Original_Quote'
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
        Name = 'Prospect_Quote'
      end
      item
        Name = 'Enclosing_Type'
      end
      item
        Name = 'Pack_Format_ID'
      end>
  end
  object qryQUpdHeader: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Quote'
      '  SET Description=:Description,'
      '      Descriptive_Reference=:Descriptive_Reference,'
      '      Customer=:Customer,'
      '      Branch_No=:Branch_no,'
      '      Contact_no = :Contact_no,'
      '      Date_Point=:Date_Point,'
      '      Date_required = :Date_Required,'
      '      Office_Contact = :Office_Contact,'
      '      Quantity = :Quantity,'
      '      Rep = :Rep,'
      '      Sub_Rep = :Sub_Rep,'
      '      Quote_Status = :Quote_Status,'
      '      Inactive = :inactive,'
      '      Narrative = :Narrative,'
      '      Date_Start = :Date_Start,'
      '      Price_Unit = :Price_Unit,'
      '      Convert_Percentage = :Convert_Percentage,'
      '      Quote_Required_By = :Quote_Required_By,'
      '      Total_Cost_Value = :Total_Cost_Value,'
      '      Total_Sales_Value = :Total_Sales_Value,'
      '      Total_Suggested_Value = :Total_Suggested_Value,'
      '      Estimate_File = :Estimate_File,'
      '      Quote_Reason = :Quote_Reason,'
      '      Date_Last_estimated = :Date_Last_Estimated,'
      '      Ad_hoc_address = :Ad_hoc_Address,'
      '      Email = :Email,'
      '      Contact_Name = :Contact_Name,'
      '      Phone = :Phone,'
      '      Customer_Name = :Customer_Name,'
      '      Original_Quote = :Original_Quote,'
      '      End_User_Customer = :End_User_Customer,'
      '      End_User_Branch_No = :End_User_Branch_no,'
      '      Prospect_Quote = :Prospect_Quote,'
      '      Enclosing_Type = :Enclosing_Type,'
      '      Pack_Format_ID = :Pack_Format_ID'
      'WHERE Quote=:Quote'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 208
    Top = 16
    ParamData = <
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Descriptive_Reference'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
      end
      item
        Name = 'Quote_Status'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Date_Start'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Convert_Percentage'
      end
      item
        Name = 'Quote_Required_By'
      end
      item
        Name = 'Total_Cost_Value'
      end
      item
        Name = 'Total_Sales_Value'
      end
      item
        Name = 'Total_Suggested_Value'
      end
      item
        Name = 'Estimate_File'
      end
      item
        Name = 'Quote_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Date_Last_Estimated'
      end
      item
        Name = 'Ad_hoc_Address'
        DataType = ftInteger
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Contact_Name'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'End_User_Customer'
        DataType = ftInteger
      end
      item
        Name = 'End_User_Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Prospect_Quote'
      end
      item
        Name = 'Enclosing_Type'
      end
      item
        Name = 'Pack_Format_ID'
      end
      item
        Name = 'Quote'
      end>
  end
  object dsQAllLines: TDataSource
    AutoEdit = False
    DataSet = qryQAllLines
    Left = 112
    Top = 72
  end
  object qryQAllLines: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Quote_Line.Quote,'
      '  Quote_Line.Quote_Line_No,'
      '  Quote_Line.Quote_Line_Description,'
      '  Quote_Line.Reseller_Price,'
      '  Quote_Line.Unit_Cost,'
      '  Quote_Line.Unit_Price,'
      '  Quote_Line.Unit_SSP,'
      '  Quote_Line.Unit_Cost_Plus_OHD,'
      '  Quote_Line.Unit_SSP_Original,'
      '  Quote_Line.Quantity,'
      '  Quote_line.Price_Unit,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Price_Unit.Description as Price_Unit_Description,'
      '  Quote_Line.Product_Type,'
      '  Product_Type.Category,'
      '  Product_Type.Description as Product_Type_Description,'
      '  Quote_Line.Sequence_no,'
      '  Quote_Line.Line_Converted,'
      '  Quote_Line.Costing_Tool_Flag,'
      '  Quote_Line.No_of_hours,'
      '  Quote_Line.Team_Count,'
      '  Quote_Line.Work_Centre,'
      '  Quote_Line.Work_Centre_Group,'
      '  Quote_Line.Process,'
      '  Quote_Line.Cost_Number,'
      '  Quote_Line.Category_Number,'
      '  Quote_Line.Sub_Category,'
      '  Quote_Cost_Markup_Perc,'
      '  Line_Is_Internal_Cost,'
      '  ISNULL(Quote_Line.Vat_Code,-1) as Vat_Code,'
      '  (select Process.Process_Group'
      '   from Process'
      '   where Process.Process = Quote_line.Process) as Process_Group'
      'FROM Quote_Line, Price_Unit, Product_Type'
      'WHERE'
      '  (Quote_Line.Quote = :Quote) AND'
      '  (Quote_Line.Price_Unit = Price_Unit.Price_Unit) and'
      '  (Quote_Line.Product_Type = Product_Type.Product_Type)'
      'ORDER BY Sequence_no, Quote_Line_No'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 72
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object UpdLastQuoteSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Quote_Number = :Last_Quote_Number'
      'Where Company = 1')
    Left = 32
    Top = 584
    ParamData = <
      item
        Name = 'Last_Quote_Number'
      end>
  end
  object GetLastQuoteSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_Quote_Number'
      'From Company'
      'Where Company = 1')
    Left = 136
    Top = 584
  end
  object qryQHeaderGrid: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Quote.Quote,'
      '        Quote.Description,'
      '        Customer.Name as Cust_Name,'
      '        Customer_Name,'
      '       Quote.Date_Point, Customer_Branch.Name as Branch_Name,'
      
        '       Customer.Customer, Customer_Branch.Branch_No, Customer_Br' +
        'anch.Account_Code,'
      '       Quote.Cust_Order_no,'
      '       Quote.Goods_Required,'
      '       Quote.Quantity,'
      '       Quote_Status.Quote_Status_description,'
      '       Quote.Quote_Status, Quote.Inactive, Quote.On_Hold,'
      '       Quote.Date_Start,'
      '       Quote.Estimate_File,'
      '       Quote.Date_Last_Estimated,'
      '       Quote.Prospect_Quote,'
      '       (select distinct Job_Bag.Job_Bag'
      '       from Job_Bag'
      '       where Job_Bag.Quote = Quote.Quote) as Job_Bag'
      'FROM Customer_Branch, Quote, Customer, Quote_Status'
      'WHERE (Quote.Customer = Customer.Customer) AND'
      '      (Quote.Branch_No = Customer_Branch.Branch_No) AND'
      '      (Customer.Customer = Customer_Branch.Customer) and'
      '      ((Customer.Name like :custname) or (:custname = '#39#39')) and'
      
        '      ((Quote.Inactive is null) or (Quote.Inactive = '#39'N'#39') or (Qu' +
        'ote.Inactive = :ShowInactive)) and'
      '      (Quote.Quote_Status = Quote_Status.Quote_Status)'
      'order by Quote.Quote desc'
      ' '
      ' ')
    Left = 336
    Top = 16
    ParamData = <
      item
        Name = 'custname'
      end
      item
        Name = 'custname'
      end
      item
        Name = 'ShowInactive'
      end>
  end
  object dsQHeaderGrid: TDataSource
    AutoEdit = False
    DataSet = qryQHeaderGrid
    Left = 416
    Top = 16
  end
  object qryGetCustomerRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Rep'
      'from Reps_Branches'
      'where Customer = :Customer and Branch_no = :Branch_no'
      'order by Is_Main_Rep DESC')
    Left = 488
    Top = 472
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object OperatorSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from operator'
      'order by Name')
    Left = 40
    Top = 488
  end
  object OperatorSRC: TDataSource
    AutoEdit = False
    DataSet = OperatorSQL
    Left = 112
    Top = 488
  end
  object srcCustContact: TDataSource
    DataSet = qryCustContact
    Left = 360
    Top = 216
  end
  object qryCustContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from customer_Contact'
      'where Customer = :Customer and '
      'Branch_no = :Branch_no'
      'order by name')
    Left = 312
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
  object qryGetRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 552
    Top = 592
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      
        'where (Price_Unit_Inactive = NULL) or (Price_Unit_Inactive = '#39'N'#39 +
        ') and (Use_For_Estimating = '#39'Y'#39')'
      'ORDER BY Description')
    Left = 200
    Top = 488
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 264
    Top = 488
  end
  object qryQDocument: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Quote_Document'
      'where Quote = :Quote and Document_No = :Document_No')
    Left = 208
    Top = 176
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Document_No'
      end>
  end
  object qryQAddDocument: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Quote_Document'
      '(Quote,'
      'Date_created,'
      'Document_No,'
      'Document_Title,'
      'Document)'
      'values'
      '(:Quote,'
      ':Date_Created,'
      ':Document_No,'
      ':Document_Title,'
      ':Document)')
    Left = 120
    Top = 176
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Date_Created'
      end
      item
        Name = 'Document_No'
      end
      item
        Name = 'Document_Title'
      end
      item
        Name = 'Document'
      end>
  end
  object qryQAllDocuments: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Quote_Document'
      'where Quote = :Quote'
      'order by Date_Created')
    Left = 40
    Top = 176
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQAddLine: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Quote_Line'
      #9'(Quote,'
      '  Quote_Line_No,'
      '  Quote_Line_Description,'
      '  Reseller_Price,'
      '  Unit_Cost,'
      #9'Unit_Price,'
      #9'Unit_SSP,'
      '  Unit_Cost_Plus_OHD,'
      #9'Unit_SSP_Original,'
      '  Price_Unit,'
      '  Quantity,'
      #9'Product_Type,'
      '  Line_Converted,'
      '  Sequence_no,'
      '  No_of_hours,'
      '  Team_Count,'
      '  Work_Centre_Group,'
      '  Work_Centre,'
      '  Process,'
      '  Costing_Tool_Flag,'
      '  Cost_Number,'
      '  Category_Number,'
      '  Sub_Category,'
      '  Vat_Code,'
      '  Quote_Cost_Markup_Perc,'
      '  Line_Is_Internal_Cost)'
      'VALUES'
      #9'(:Quote,'
      '  :Quote_Line_No,'
      '  :Quote_Line_Description,'
      '  :Reseller_Price,'
      '  :Unit_Cost,'
      #9':Unit_Price,'
      #9':Unit_SSP,'
      '  :Unit_Cost_Plus_OHD,'
      #9':Unit_SSP_Original,'
      '  :Price_Unit,'
      '  :Quantity,'
      #9':Product_Type,'
      '  :Line_Converted,'
      '  :Sequence_no,'
      '  :No_of_hours,'
      '  :Team_Count,'
      '  :Work_Centre_Group,'
      '  :Work_Centre,'
      '  :Process,'
      '  :Costing_Tool_Flag,'
      '  :Cost_Number,'
      '  :Category_Number,'
      '  :Sub_Category,'
      '  :Vat_Code,'
      '  :Quote_Cost_Markup_Perc,'
      '  :Line_Is_Internal_Cost)'
      ''
      ''
      ''
      '')
    Left = 112
    Top = 128
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Quote_Line_No'
      end
      item
        Name = 'Quote_Line_Description'
      end
      item
        Name = 'Reseller_Price'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Unit_SSP'
      end
      item
        Name = 'Unit_Cost_Plus_OHD'
      end
      item
        Name = 'Unit_SSP_Original'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Line_Converted'
      end
      item
        Name = 'Sequence_no'
      end
      item
        Name = 'No_of_hours'
        DataType = ftInteger
      end
      item
        Name = 'Team_Count'
        DataType = ftInteger
      end
      item
        Name = 'Work_Centre_Group'
        DataType = ftInteger
      end
      item
        Name = 'Work_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Costing_Tool_Flag'
      end
      item
        Name = 'Cost_Number'
        DataType = ftInteger
      end
      item
        Name = 'Category_Number'
        DataType = ftInteger
      end
      item
        Name = 'Sub_Category'
        DataType = ftInteger
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
      end
      item
        Name = 'Quote_Cost_Markup_Perc'
      end
      item
        Name = 'Line_Is_Internal_Cost'
      end>
  end
  object qryQLine: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Quote_Line.Quote,'
      '  Quote_Line.Quote_Line_No,'
      '  Quote_Line.Quote_Line_Description,'
      '  Quote_Line.Unit_Cost,'
      '  Quote_Line.Unit_Price,'
      '  Quote_Line.Unit_Cost_Plus_OHD,'
      '  Quote_Line.Unit_SSP,'
      '  Quote_Line.Unit_SSP_Original,'
      '  Quote_Line.Quantity,'
      '  Quote_line.Price_Unit,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Price_Unit.Description as Price_Unit_Description,'
      '  Quote_Line.Product_Type,'
      '  Product_Type.Category,'
      '  Product_Type.Description as Product_Type_Description,'
      '  Quote_Line.Sequence_no,'
      '  Quote_Line.Line_Converted,'
      '  Quote_Line.Costing_Tool_Flag,'
      '  Quote_Line.No_of_hours,'
      '  Quote_Line.Team_Count,'
      '  Quote_Line.Work_Centre,'
      '  Quote_Line.Work_Centre_Group,'
      '  Quote_Line.Process,'
      '  Quote_Line.Cost_Number,'
      '  Quote_Line.Category_Number,'
      '  Quote_Line.Sub_Category,'
      '  Quote_Line.Vat_Code,'
      '  Quote_Cost_Markup_Perc,'
      '  Line_Is_Internal_Cost,'
      '  (select Process.Process_Group'
      '   from Process'
      '   where Process.Process = Quote_line.Process) as Process_Group'
      'FROM Quote_Line, Price_Unit, Product_Type'
      'WHERE'
      '  (Quote_Line.Quote = :Quote) AND'
      '  (Quote_Line.Quote_Line_no = :Quote_Line_No) and'
      '  (Quote_Line.Price_Unit = Price_Unit.Price_Unit) and'
      '  (Quote_Line.Product_Type = Product_Type.Product_Type)'
      ''
      ''
      '')
    Left = 208
    Top = 128
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Quote_Line_No'
      end>
  end
  object qryQAllSupplies: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Quote_Supply.Quote,'
      #9'Quote_Supply.Quote_Supply_No,'
      #9'Quote_Supply.Enquiry,'
      #9'Quote_Supply.Line,'
      '  Quote_Supply.Line_Converted,'
      #9'Quote_Supply.Quantity,'
      #9'Quote_Supply.Quote_Supply_Description,'
      #9'Quote_Supply.Unit_Cost,'
      #9'Quote_Supply.Unit_Price,'
      #9'Quote_Supply.Price_Unit,'
      #9'ISNULL(Quote_Supply.Vat_Code,-1) as Vat_Code,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Price_Unit.Description as Price_Unit_Description,'
      #9'EnquiryLine.Form_Description'
      'FROM EnquiryLine'
      #9'RIGHT JOIN (Price_Unit'
      #9'INNER JOIN Quote_Supply'
      #9#9'ON Price_Unit.Price_Unit = Quote_Supply.Price_Unit)'
      
        #9#9'ON (EnquiryLine.Line = Quote_Supply.Line) AND (EnquiryLine.Enq' +
        'uiry = Quote_Supply.Enquiry)'
      'WHERE Quote_Supply.Quote =  :Quote'
      'ORDER BY Quote_Supply.Quote_Supply_No')
    Left = 40
    Top = 240
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQAddSupply: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Quote_Supply'
      '('
      '    Quote,'
      '    Quote_Supply_no,'
      '    Enquiry,'
      '    Line,'
      '    Line_Converted,'
      '    Quantity,'
      '    Quote_Supply_Description,'
      '    Unit_Cost,'
      '    Unit_Price,'
      '    Price_unit,'
      '    Vat_Code'
      ')'
      'values'
      '(   :Quote,'
      '    :Quote_Supply_no,'
      '    :Enquiry,'
      '    :Line,'
      '    :Line_Converted,'
      '    :Quantity,'
      '    :Quote_Supply_Description,'
      '    :Unit_Cost,'
      '    :Unit_Price,'
      '    :Price_unit,'
      '    :Vat_Code'
      ')')
    Left = 112
    Top = 240
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Quote_Supply_no'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Line_Converted'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Quote_Supply_Description'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
      end>
  end
  object qryQSupply: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Quote_Supply.Quote,'
      #9'Quote_Supply.Quote_Supply_No,'
      #9'Quote_Supply.Enquiry,'
      #9'Quote_Supply.Line,'
      '  Quote_Supply.Line_Converted,'
      #9'Quote_Supply.Quantity,'
      #9'Quote_Supply.Quote_Supply_Description,'
      #9'Quote_Supply.Unit_Cost,'
      #9'Quote_Supply.Unit_Price,'
      #9'Quote_Supply.Price_Unit,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Price_Unit.Description as Price_Unit_Description,'
      #9'EnquiryLine.Form_Description'
      'FROM EnquiryLine'
      #9'RIGHT JOIN (Price_Unit'
      #9'INNER JOIN Quote_Supply'
      #9#9'ON Price_Unit.Price_Unit = Quote_Supply.Price_Unit)'
      
        #9#9'ON (EnquiryLine.Line = Quote_Supply.Line) AND (EnquiryLine.Enq' +
        'uiry = Quote_Supply.Enquiry)'
      'WHERE Quote_Supply.Quote =  :Quote and'
      '      Quote_Supply_no = :Quote_Supply_No')
    Left = 200
    Top = 240
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Quote_Supply_No'
      end>
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 328
    Top = 488
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qryUpdQuoteStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where Quote = :Quote')
    Left = 480
    Top = 536
    ParamData = <
      item
        Name = 'Quote_Status'
      end
      item
        Name = 'Quote'
      end>
  end
  object qryGetProductType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Product_Type'
      'where Short_Desc = :Short_Desc')
    Left = 464
    Top = 216
    ParamData = <
      item
        Name = 'Short_Desc'
      end>
  end
  object qryGetPUnitFromFactor: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 *'
      'from Price_Unit'
      'where Price_Unit_Factor = :Price_Unit_Factor'
      'and Use_For_Estimating = '#39'Y'#39)
    Left = 464
    Top = 272
    ParamData = <
      item
        Name = 'Price_Unit_Factor'
      end>
  end
  object qryQUpdEstimateFile: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Quote'
      'Set Estimate_File = :Estimate_File'
      'WHERE Quote = :Quote')
    Left = 256
    Top = 416
    ParamData = <
      item
        Name = 'Estimate_File'
      end
      item
        Name = 'Quote'
      end>
  end
  object qryQReason: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Quote_Reason'
      'where Quote_Reason_Type = '#39'L'#39
      'order by Quote_Reason_Description')
    Left = 40
    Top = 424
  end
  object dtsQReason: TDataSource
    DataSet = qryQReason
    Left = 112
    Top = 424
  end
  object qryQuoteWon: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Quote'
      'set Quote_Status = 90'
      'where Quote = :Quote')
    Left = 304
    Top = 352
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT TOP (:Records)'
      #9'      Quote.Quote,'
      #9'      Quote.Description,'
      #9'      Customer.Name as Cust_Name,'
      '        Quote.Date_Point,'
      #9'      Quote.Branch_No,'
      '       Customer.Customer,'
      '       Customer_Branch.Account_Code,'
      '       Quote.Ad_Hoc_Address,'
      '       Quote.Date_Required,'
      '       Quote.Quantity,'
      '       Quote_Status.Quote_Status_description,'
      '       Quote.Quote_Status,'
      '       Quote.inactive,'
      '       Quote.rep,'
      '       Quote.Sub_rep,'
      '       Rep.Name as Rep_Name,'
      '       SubRep.Name as Sub_Rep_Name,'
      '       Quote.Operator,'
      '       Operator.Name as Operator_Name,'
      '       Quote.Office_Contact,'
      '       Quote.Date_Start,'
      '       Quote.Descriptive_Reference,'
      '       Quote.Total_Cost_Value,'
      '       Quote.Total_Sales_Value,'
      '       Quote.Customer_Name,'
      '       Quote.Estimate_File,'
      '       Quote.Date_Last_Estimated,'
      '       Quote.Prospect_Quote,'
      '       Quote.Enclosing_Type,'
      '       Pack_Format.Pack_Format_Description,'
      '       (select top 1 Job_Bag.Job_Bag'
      '       from Job_Bag'
      '       where Job_Bag.Quote = Quote.Quote and'
      '             Job_Bag.inactive = '#39'N'#39') as Job_Bag,'
      '       End_User.Name as End_User_Name'
      'FROM Customer AS End_User'
      '      RIGHT JOIN (Pack_Format'
      '      RIGHT JOIN (Rep AS SubRep'
      '      RIGHT JOIN (Quote_Status'
      '      INNER JOIN (Operator AS AM'
      '      INNER JOIN (Customer_Branch'
      '      RIGHT JOIN ((Rep'
      '      INNER JOIN (Operator'
      '      INNER JOIN Quote'
      '        ON Operator.Operator = Quote.Operator)'
      '        ON Rep.Rep = Quote.Rep)'
      '      LEFT JOIN Customer'
      '        ON Quote.Customer = Customer.Customer)'
      
        '        ON (Customer_Branch.Branch_no = Quote.Branch_no) AND (Cu' +
        'stomer_Branch.Customer = Quote.Customer))'
      '        ON AM.Operator = Quote.Office_Contact)'
      '        ON Quote_Status.Quote_Status = Quote.Quote_Status)'
      '        ON SubRep.Rep = Quote.Sub_Rep)'
      '        ON Pack_Format.ID = Quote.Pack_Format_ID)'
      '        ON End_User.Customer = Quote.End_User_Customer'
      'WHERE ((Quote.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Quote.Description LIKE :Description)')
    Left = 552
    Top = 16
    ParamData = <
      item
        Name = 'Records'
      end
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
  object qryGetWorkCentrebyName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Work_Centre'
      'where Work_Centre_Short_Name = :Work_Centre_Short_Name')
    Left = 400
    Top = 80
    ParamData = <
      item
        Name = 'Work_Centre_Short_Name'
      end>
  end
  object qryGetWorkCentreGroupbyName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Work_Centre_Group '
      'from Work_Centre_Group'
      
        'where Work_Centre_Group_Short_Name = :Work_Centre_Group_Short_Na' +
        'me')
    Left = 400
    Top = 136
    ParamData = <
      item
        Name = 'Work_Centre_Group_Short_Name'
      end>
  end
  object qryGetWorkCentreWCGroup: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Work_Centre_Group '
      'from Work_Centre_WC_Group'
      'where Work_Centre = :Work_Centre')
    Left = 560
    Top = 136
    ParamData = <
      item
        Name = 'Work_Centre'
      end>
  end
  object qryGetProcess: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process'
      'where Short_Description = :Short_Description')
    Left = 560
    Top = 216
    ParamData = <
      item
        Name = 'Short_Description'
      end>
  end
  object qryGetWorkCentrebyEstName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Work_Centre'
      'where Estimating_Name = :Estimating_Name')
    Left = 544
    Top = 80
    ParamData = <
      item
        Name = 'Estimating_Name'
      end>
  end
  object qryQuotesJB: TFDQuery
    ConnectionName = 'PB'
    Left = 616
    Top = 336
  end
  object dtsQuotesJB: TDataSource
    DataSet = qryQuotesJB
    Left = 688
    Top = 336
  end
  object qryQuotesNotConverted: TFDQuery
    SQL.Strings = (
      'SELECT DISTINCT TOP 2000'
      #9'      Quote.Quote,'
      #9'      Quote.Description,'
      #9'      Customer.Name as Cust_Name,'
      '        Quote.Date_Point,'
      #9'      Quote.Branch_No,'
      '       Customer.Customer,'
      '       Customer_Branch.Account_Code,'
      '       Quote.Ad_Hoc_Address,'
      '       Quote.Date_Required,'
      '       Quote.Quantity,'
      '       Quote_Status.Quote_Status_description,'
      '       Quote.Quote_Status,'
      '       Quote.inactive,'
      '       Quote.rep,'
      '       Rep.Name as Rep_Name,'
      '       Quote.Operator,'
      '       Operator.Name as Operator_Name,'
      '       Quote.Office_Contact,'
      '       Quote.Date_Start,'
      '       Quote.Descriptive_Reference,'
      '       Quote.Total_Cost_Value,'
      '       Quote.Total_Sales_Value,'
      '       Quote.Customer_Name,'
      '      (select Job_Bag.Job_Bag'
      '       from Job_Bag'
      '       where Job_Bag.Quote = Quote.Quote) as Job_Bag'
      'FROM (Operator AM'
      '        INNER JOIN (Rep'
      '        INNER JOIN (Operator'
      '        INNER JOIN (Quote_Status'
      
        '        INNER JOIN Quote ON Quote_Status.Quote_Status = Quote.Qu' +
        'ote_Status)'
      '          ON Operator.Operator = Quote.Operator)'
      '          ON Rep.Rep = Quote.Rep)'
      '          ON AM.Operator = Quote.Office_Contact)'
      '        LEFT JOIN Customer ON Quote.Customer = Customer.Customer'
      
        '        LEFT JOIN Customer_Branch ON Quote.Customer = Customer_B' +
        'ranch.Customer and Quote.Branch_no = Customer_Branch.Branch_no'
      'WHERE ((Quote.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Quote.Description LIKE :Description) and'
      '      (Quote_Status.Quote_Status < 100)')
    Left = 616
    Top = 392
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
  object qryGetCustomerPrices: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Cost'
      'where Customer = :Customer')
    Left = 624
    Top = 456
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryGetCustContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Contact'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no')
    Left = 624
    Top = 512
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryQAddProcessGroup: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Quote_Process_Group'
      '('
      'Quote,'
      'Process_Group,'
      'Quote_Specification,'
      'Quote_Specification_ID'
      ')'
      'values'
      '('
      ':Quote,'
      ':Process_group,'
      ':Quote_Specification,'
      ':Quote_Specification_ID'
      ')')
    Left = 112
    Top = 296
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Process_group'
      end
      item
        Name = 'Quote_Specification'
      end
      item
        Name = 'Quote_Specification_ID'
      end>
  end
  object qryQProcessGroup: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Quote,'
      '  Quote_Specification,'
      '  Quote_Specification_ID,'
      '  Quote_Process_Group.Process_Group'
      'FROM Quote_Process_Group'
      'WHERE Quote = :Quote and'
      'Quote_Process_Group.Process_Group = :Process_Group')
    Left = 208
    Top = 296
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Process_Group'
      end>
  end
  object qryGetProcessGroups: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Process_Group.Process_Group,'
      '        Process_Group.Process_Group_Description,'
      '        Process_Group.Sequence_no'
      'FROM Process_Group'
      'ORDER BY Process_Group.Sequence_no')
    Left = 112
    Top = 352
  end
  object qryReQuoteCount: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT count(Quote) as ReQuote_Count'
      'FROM Quote'
      'WHERE Quote > :Original_Quote and Quote < (:Original_Quote + 1)')
    Left = 464
    Top = 352
    ParamData = <
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'Original_Quote'
      end>
  end
  object qryQUpdEstimateDate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Quote'
      'Set Date_Last_Estimated = :Date_Last_Estimated'
      'WHERE Quote = :Quote')
    Left = 360
    Top = 416
    ParamData = <
      item
        Name = 'Date_Last_Estimated'
      end
      item
        Name = 'Quote'
      end>
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Customer, Customer_Status, Default_Quote_Cost_Markup_Perc' +
        ','
      '        Override_Cost_Markup_Perc'
      'from Customer'
      'Where Customer = :Customer')
    Left = 288
    Top = 576
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryGetQuoteCostDefaults: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Company.Default_Quote_Cost_Process_Grp,'
      '        Company.Default_Quote_Cost_Process,'
      '        Company.Default_Quote_Cost_markup_perc,'
      '        Company.Default_Quote_Cost_Description,'
      '        Company.Vat_Code,'
      '        Process.Price_unit,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Process_Group.Process_Group,'
      '        Process_Group.Process_Group_Description,'
      '        Product_Type.Product_Type,'
      '        Product_Type.Description as Product_Type_Description'
      'FROM Price_Unit'
      '        INNER JOIN ((Product_Type'
      '        INNER JOIN (Process_Group'
      '        INNER JOIN Process'
      
        '          ON Process_Group.Process_Group = Process.Process_Group' +
        ')'
      '          ON Product_Type.Product_Type = Process.Product_Type)'
      '        INNER JOIN Company'
      
        '          ON Process.Process = Company.Default_Quote_Cost_Proces' +
        's)'
      '          ON Price_Unit.Price_Unit = Process.Price_unit'
      'WHERE Company.Company = 1')
    Left = 472
    Top = 416
  end
  object qryGetCustomerSubRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 reps_branches.Rep'
      'FROM Rep '
      #9'INNER JOIN reps_branches ON Rep.Rep = reps_branches.Rep'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) AND'
      '      (Rep.Rep_Is_Sub_Rep = '#39'Y'#39')')
    Left = 400
    Top = 472
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryDummyOld: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT TOP (:Records)'
      #9'      Quote.Quote,'
      #9'      Quote.Description,'
      #9'      Customer.Name as Cust_Name,'
      '        Quote.Date_Point,'
      #9'      Quote.Branch_No,'
      '       Customer.Customer,'
      '       Customer_Branch.Account_Code,'
      '       Quote.Ad_Hoc_Address,'
      '       Quote.Date_Required,'
      '       Quote.Quantity,'
      '       Quote_Status.Quote_Status_description,'
      '       Quote.Quote_Status,'
      '       Quote.inactive,'
      '       Quote.rep,'
      '       Quote.Sub_rep,'
      '       Rep.Name as Rep_Name,'
      '       SubRep.Name as Sub_Rep_Name,'
      '       Quote.Operator,'
      '       Operator.Name as Operator_Name,'
      '       Quote.Office_Contact,'
      '       Quote.Date_Start,'
      '       Quote.Descriptive_Reference,'
      '       Quote.Total_Cost_Value,'
      '       Quote.Total_Sales_Value,'
      '       Quote.Customer_Name,'
      '       Quote.Estimate_File,'
      '       Quote.Date_Last_Estimated,'
      '       Quote.Prospect_Quote,'
      '       (select top 1 Job_Bag.Job_Bag'
      '       from Job_Bag'
      '       where Job_Bag.Quote = Quote.Quote and'
      '             Job_Bag.inactive = '#39'N'#39') as Job_Bag'
      'FROM Rep AS SubRep'
      #9#9'RIGHT JOIN ((Rep'
      #9#9'INNER JOIN (Quote_Status'
      #9#9'INNER JOIN (Operator AS AM'
      #9#9'INNER JOIN (Customer_Branch'
      #9#9'RIGHT JOIN (Operator'
      #9#9'INNER JOIN Quote'
      #9#9#9'ON Operator.Operator = Quote.Operator)'
      
        #9#9#9'ON (Customer_Branch.Branch_no = Quote.Branch_no) AND (Custome' +
        'r_Branch.Customer = Quote.Customer))'
      #9#9#9'ON AM.Operator = Quote.Office_Contact)'
      #9#9#9'ON Quote_Status.Quote_Status = Quote.Quote_Status)'
      #9#9#9'ON Rep.Rep = Quote.Rep)'
      #9#9'LEFT JOIN Customer'
      #9#9#9'ON Quote.Customer = Customer.Customer)'
      #9#9#9'ON SubRep.Rep = Quote.Sub_Rep'
      'WHERE ((Quote.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Quote.Description LIKE :Description)')
    Left = 640
    Top = 16
    ParamData = <
      item
        Name = 'Records'
      end
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
  object qryJBHeader: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag.Job_Bag,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Customer.Name as Cust_Name,'
      '      Job_Bag.Date_Point,'
      '      Job_Bag.Date_Start,'
      '      Customer_Branch.Name as Branch_Name,'
      '      Customer.Customer,'
      '      Customer_Branch.Branch_No,'
      '      Customer.Customer_is_Acquired,'
      '      Job_Bag.Job_Bag_Status,'
      '      Job_Bag.Contact_no,'
      '      Job_Bag.Goods_Required,'
      '      Job_Bag.Office_Contact,'
      '      Job_Bag.Cust_Order_no,'
      '      Job_Bag.Quantity,'
      '      Customer.Vat_Code_Def,'
      '      Job_Bag.Rep,'
      '      Job_Bag.Sub_Rep,'
      '      Job_Bag.Inactive,'
      '      Ready_for_invoicing,'
      '      Job_Bag.Operator,'
      '      Operator.Name as Operator_Name,'
      '      Job_Bag.Account_Team,'
      '      Job_Bag.Narrative,'
      '      (select Name'
      '      from Operator'
      
        '      where Operator.Operator = Office_Contact) as Office_Contac' +
        't_Name,'
      '      Description_Reference,'
      '      Original_Job_Bag,'
      '      Job_Bag.Invoice_Location,'
      '      Invoiced_By,'
      '      Invoiced_Date,'
      '      End_User_Customer,'
      '      End_User_Branch_no,'
      '      (select Customer.Name'
      '       from Customer'
      
        '       where Customer.Customer = Job_Bag.End_User_Customer) as E' +
        'nd_User_Customer_Name,'
      '      On_Hold,'
      '      Artwork_Required,'
      '      Artwork_Due_Date,'
      '      Artwork_Proof_Date,'
      '      Artwork_Approval_Date,'
      '      Data_Services_Required,'
      '      Data_Required_Date,'
      '      Brief_Required_Date,'
      '      Text_Required_Date,'
      '      Brief_Available_Date,'
      '      Text_Available_Date,'
      '      Text_Proof_Date,'
      '      Proof_Required_Date,'
      '      Proof_Approval_Date,'
      '      Samples_Required,'
      '      Sample_To_Client,'
      '      Sample_Approval,'
      '      Schedule_Approved,'
      '      Quote,'
      '      Job_Bag_Production_Status,'
      '      Cost_Centre,'
      '      Cash_Sales,'
      '      Job_Bag.Price_Unit,'
      '      Price_Unit.Description as Price_Unit_Description,'
      '      Price_Unit.Price_Unit_Factor,'
      '      Production_Complete,'
      '      Production_Complete_Date,'
      '      Production_Complete_by,'
      '      File_Copies_Received_Date,'
      '      File_Copies_Received_by,'
      '      Invoice_This_Week,'
      '      Invoice_This_Week_By,'
      '      Invoice_This_Week_Date,'
      '      Pack_Format_ID,'
      '      Enclosing_Type,'
      '      (select Name'
      '      from Operator'
      
        '      where Operator.Operator = Invoice_This_Week_By) as Invoice' +
        '_This_Week_Name,'
      '      (select Name'
      '      from Operator'
      
        '      where Operator.Operator = File_Copies_Received_by) as File' +
        's_Received_by_Name'
      'FROM Price_Unit'
      '  RIGHT JOIN (Operator'
      '  INNER JOIN (Customer'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN Job_Bag'
      
        '    ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Cust' +
        'omer_Branch.Customer = Job_Bag.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer)'
      '    ON Operator.Operator = Job_Bag.Operator)'
      '    ON Price_Unit.Price_Unit = Job_Bag.Price_Unit'
      'WHERE'
      '  (Job_Bag.Job_Bag = :jobbag)'
      ''
      ''
      ''
      '')
    Left = 720
    Top = 88
    ParamData = <
      item
        Name = 'jobbag'
      end>
  end
  object qryJBAllLines: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Job_Bag_Line_Dets.*, '
      #9#9'Vat_Code.Vat_Rate, '
      #9#9'Price_Unit.Price_Unit_Factor,'
      #9#9'Price_Unit.Description as Price_Unit_Description,'
      #9#9'Product_Type.Description as Product_Type_Description,'
      #9#9'Process.Process_Group,'
      #9#9'(SELECT TOP 1 PR.Process'
      #9#9'FROM Process PR'
      
        #9#9'WHERE PR.Product_Type = Job_Bag_line_Dets.Product_Type) as Pro' +
        'duct_Type_Process,'
      #9#9'(SELECT TOP 1 PR.Process_Group'
      #9#9'FROM Process PR'
      
        #9#9'WHERE PR.Product_Type = Job_Bag_line_Dets.Product_Type) as Pro' +
        'duct_Type_Process_Group'
      'FROM (Product_Type '
      #9#9'INNER JOIN (Price_Unit '
      #9#9'INNER JOIN (Vat_Code '
      #9#9'INNER JOIN Job_Bag_Line_Dets '
      #9#9#9'ON Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) '
      #9#9#9'ON Price_Unit.Price_Unit = Job_Bag_Line_Dets.price_unit) '
      
        #9#9#9'ON Product_Type.Product_Type = Job_Bag_Line_Dets.Product_Type' +
        ') '
      #9#9'LEFT JOIN Process '
      #9#9#9'ON Job_Bag_Line_Dets.Process = Process.Process'
      'WHERE (Job_Bag_Line_Dets.Job_Bag = :JobBag)'
      'ORDER BY Sequence_no, Job_Bag_Line'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 800
    Top = 88
    ParamData = <
      item
        Name = 'JobBag'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dtsPackFormat: TDataSource
    DataSet = qryPackFormat
    Left = 720
    Top = 152
  end
  object qryPackFormat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM Pack_Format'
      'WHERE'
      '      ((Inactive = '#39'N'#39')) or (ID = :ID)'
      'ORDER BY Pack_Format_Description')
    Left = 784
    Top = 152
    ParamData = <
      item
        Name = 'ID'
      end>
  end
end
