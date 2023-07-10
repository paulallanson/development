object dtmdlQuotes: TdtmdlQuotes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 492
  Top = 34
  Height = 690
  Width = 1033
  object qryZero: TQuery
    DatabaseName = 'PB'
    Left = 720
    Top = 16
  end
  object qryQHeader: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQAddHeader: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
      'Prospect_Quote'
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
      ':Prospect_Quote'
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Descriptive_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sub_Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Start'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Convert_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Required_By'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Cost_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Sales_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Suggested_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Estimate_File'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quote_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Last_Estimated'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Ad_hoc_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'End_User_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'End_User_Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Prospect_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQUpdHeader: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
      '      Prospect_Quote = :Prospect_Quote'
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
        DataType = ftString
        Name = 'Description'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Descriptive_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sub_Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Start'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Convert_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Required_By'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Cost_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Sales_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Suggested_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Estimate_File'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quote_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Last_Estimated'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Ad_hoc_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'End_User_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'End_User_Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Prospect_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object dsQAllLines: TDataSource
    AutoEdit = False
    DataSet = qryQAllLines
    Left = 112
    Top = 72
  end
  object qryQAllLines: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object UpdLastQuoteSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Quote_Number = :Last_Quote_Number'
      'Where Company = 1')
    Left = 32
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_Quote_Number'
        ParamType = ptUnknown
      end>
  end
  object GetLastQuoteSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Last_Quote_Number'
      'From Company'
      'Where Company = 1')
    Left = 136
    Top = 584
  end
  object qryQHeaderGrid: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
        DataType = ftUnknown
        Name = 'custname'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'custname'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ShowInactive'
        ParamType = ptUnknown
      end>
  end
  object dsQHeaderGrid: TDataSource
    AutoEdit = False
    DataSet = qryQHeaderGrid
    Left = 416
    Top = 16
  end
  object qryGetCustomerRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Rep'
      'from Reps_Branches'
      'where Customer = :Customer and Branch_no = :Branch_no'
      'order by Is_Main_Rep DESC')
    Left = 488
    Top = 472
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
  object OperatorSQL: TQuery
    DatabaseName = 'pb'
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
  object qryCustContact: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from customer_Contact'
      'where Customer = :Customer and '
      'Branch_no = :Branch_no'
      'order by name')
    Left = 312
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 552
    Top = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object qryPriceUnit: TQuery
    DatabaseName = 'PB'
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
  object qryQDocument: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Quote_Document'
      'where Quote = :Quote and Document_No = :Document_No')
    Left = 208
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_No'
        ParamType = ptUnknown
      end>
  end
  object qryQAddDocument: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Created'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document'
        ParamType = ptUnknown
      end>
  end
  object qryQAllDocuments: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Quote_Document'
      'where Quote = :Quote'
      'order by Date_Created')
    Left = 40
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQAddLine: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Line_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reseller_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_SSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost_Plus_OHD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_SSP_Original'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Converted'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sequence_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'No_of_hours'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Team_Count'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Work_Centre_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Work_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Costing_Tool_Flag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Cost_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Category_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sub_Category'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Cost_Markup_Perc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Is_Internal_Cost'
        ParamType = ptUnknown
      end>
  end
  object qryQLine: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryQAllSupplies: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQAddSupply: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Supply_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Converted'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Supply_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end>
  end
  object qryQSupply: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Supply_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetPriceUnit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 328
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end>
  end
  object qryUpdQuoteStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where Quote = :Quote')
    Left = 480
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetProductType: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Product_Type'
      'where Short_Desc = :Short_Desc')
    Left = 464
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Short_Desc'
        ParamType = ptUnknown
      end>
  end
  object qryGetPUnitFromFactor: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 *'
      'from Price_Unit'
      'where Price_Unit_Factor = :Price_Unit_Factor'
      'and Use_For_Estimating = '#39'Y'#39)
    Left = 464
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Unit_Factor'
        ParamType = ptUnknown
      end>
  end
  object qryQUpdEstimateFile: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Quote'
      'Set Estimate_File = :Estimate_File'
      'WHERE Quote = :Quote')
    Left = 256
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Estimate_File'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQReason: TQuery
    DatabaseName = 'PB'
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
  object qryQuoteWon: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Quote'
      'set Quote_Status = 90'
      'where Quote = :Quote')
    Left = 304
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT TOP :Records'
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
      '             Job_Bag.inactive = '#39'N'#39') as Job_Bag,'
      '       End_User.Name as End_User_Name'
      'FROM Customer AS End_User'
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
      '        ON End_User.Customer = Quote.End_User_Customer'
      'WHERE ((Quote.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Quote.Description LIKE :Description)')
    Left = 552
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Records'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryGetWorkCentrebyName: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Work_Centre'
      'where Work_Centre_Short_Name = :Work_Centre_Short_Name')
    Left = 400
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Work_Centre_Short_Name'
        ParamType = ptUnknown
      end>
  end
  object qryGetWorkCentreGroupbyName: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Work_Centre_Group '
      'from Work_Centre_Group'
      
        'where Work_Centre_Group_Short_Name = :Work_Centre_Group_Short_Na' +
        'me')
    Left = 400
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Work_Centre_Group_Short_Name'
        ParamType = ptUnknown
      end>
  end
  object qryGetWorkCentreWCGroup: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Work_Centre_Group '
      'from Work_Centre_WC_Group'
      'where Work_Centre = :Work_Centre')
    Left = 560
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Work_Centre'
        ParamType = ptUnknown
      end>
  end
  object qryGetProcess: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process'
      'where Short_Description = :Short_Description')
    Left = 560
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Short_Description'
        ParamType = ptUnknown
      end>
  end
  object qryGetWorkCentrebyEstName: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Work_Centre'
      'where Estimating_Name = :Estimating_Name')
    Left = 544
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Estimating_Name'
        ParamType = ptUnknown
      end>
  end
  object qryQuotesJB: TQuery
    DatabaseName = 'PB'
    Left = 616
    Top = 336
  end
  object dtsQuotesJB: TDataSource
    DataSet = qryQuotesJB
    Left = 688
    Top = 336
  end
  object qryQuotesNotConverted: TQuery
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerPrices: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Cost'
      'where Customer = :Customer')
    Left = 624
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustContact: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
  object qryQAddProcessGroup: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process_group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Specification'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote_Specification_ID'
        ParamType = ptUnknown
      end>
  end
  object qryQProcessGroup: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process_Group'
        ParamType = ptUnknown
      end>
  end
  object qryGetProcessGroups: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Process_Group.Process_Group,'
      '        Process_Group.Process_Group_Description,'
      '        Process_Group.Sequence_no'
      'FROM Process_Group'
      'ORDER BY Process_Group.Sequence_no')
    Left = 112
    Top = 352
  end
  object qryReQuoteCount: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT count(Quote) as ReQuote_Count'
      'FROM Quote'
      'WHERE Quote > :Original_Quote and Quote < (:Original_Quote + 1)')
    Left = 464
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQUpdEstimateDate: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Quote'
      'Set Date_Last_Estimated = :Date_Last_Estimated'
      'WHERE Quote = :Quote')
    Left = 360
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Last_Estimated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomer: TQuery
    DatabaseName = 'pb'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryGetQuoteCostDefaults: TQuery
    DatabaseName = 'PB'
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
  object qryGetCustomerSubRep: TQuery
    DatabaseName = 'PB'
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
  object qryDummyOld: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT TOP :Records'
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
        DataType = ftUnknown
        Name = 'Records'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
end
