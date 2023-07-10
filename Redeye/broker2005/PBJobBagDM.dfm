object dmJobBag: TdmJobBag
  OldCreateOrder = False
  Left = 198
  Height = 724
  Width = 1119
  object dsJBHeaderGrid: TDataSource
    AutoEdit = False
    DataSet = qryJBHeaderGrid
    Left = 40
    Top = 8
  end
  object qryJBHeaderGrid: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      
        'SELECT DISTINCT Job_Bag.Job_Bag, Job_Bag.Job_Bag_Descr, Customer' +
        '.Name as Cust_Name,'
      '       Job_Bag.Date_Point, Customer_Branch.Name as Branch_Name,'
      '       Customer.Customer, Customer_Branch.Branch_No,'
      '       Job_Bag.Cust_Order_no,'
      '       Job_Bag.Goods_Required,'
      '       Job_Bag.Quantity,'
      '       Job_Bag_Status.Job_Bag_Status_descr,'
      
        '       Job_Bag.Job_Bag_Status, Job_Bag.Inactive, Job_Bag.On_Hold' +
        ', Job_Bag.Date_Start'
      'FROM Customer_Branch, Job_Bag, Customer, Job_Bag_Status'
      'WHERE (Job_Bag.Customer = Customer.Customer) AND'
      '      (Job_Bag.Branch_No = Customer_Branch.Branch_No) AND'
      '      (Customer.Customer = Customer_Branch.Customer) and'
      '      ((Customer.Name like :custname) or (:custname = '#39#39')) and'
      
        '      ((Job_Bag.Inactive is null) or (Job_Bag.Inactive = '#39'N'#39') or' +
        ' (Job_Bag.Inactive = :ShowInactive)) and'
      '      (Job_Bag.Job_bag_Status = Job_Bag_Status.Job_Bag_Status)'
      'order by Job_Bag.Job_Bag desc'
      ' '
      ' ')
    Left = 128
    Top = 8
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
  object qryReserveSlot: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'INSERT INTO Job_Bag'
      
        '  (Job_Bag, Job_Bag_Descr, Customer, Branch_No, Date_Point, Oper' +
        'ator)'
      '  SELECT MAX(J.Job_Bag)+1, :GUID, MAX(C.Customer),'
      '   (SELECT MAX(Branch_no) from Customer_Branch where'
      '     Customer = (SELECT MAX(Customer) from Customer_Branch)),'
      '  '#39'01/01/2000'#39', :Operator'
      '  FROM Job_Bag J, Customer_Branch C'
      ''
      ' '
      ' '
      ' ')
    Left = 336
    Top = 16
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
  object qryGetReservedSlot: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * FROM Job_Bag'
      'WHERE Job_Bag_Descr = :GUID'
      ' ')
    Left = 336
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GUID'
        ParamType = ptUnknown
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'PB'
    Left = 400
    Top = 16
  end
  object qryJBHeader: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
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
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'jobbag'
        ParamType = ptUnknown
      end>
  end
  object qryJBUpdHeader: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'UPDATE Job_Bag'
      '  SET Job_Bag_Descr=:Description,'
      '      Customer=:Customer,'
      '      Branch_No=:Branch,'
      '      Contact_no = :Contact_no,'
      '      Date_Point=:Date,'
      '      Goods_required = :Goods_Required,'
      '      Office_Contact = :Office_Contact,'
      '      Cust_Order_no = :Cust_Order_no,'
      '      Quantity = :Quantity,'
      '      Rep = :Rep,'
      '      Sub_Rep = :Sub_Rep,'
      '      Job_Bag_Status = :Job_Bag_Status,'
      '      Inactive = :inactive,'
      '      Ready_for_invoicing = :Ready_for_invoicing,'
      '      Account_Team = :Account_Team,'
      '      Description_Reference = :Description_Reference,'
      '      Narrative = :Narrative,'
      '      Original_Job_Bag = :Original_Job_Bag,'
      '      Invoice_Location = :Invoice_Location,'
      '      On_Hold = :On_Hold,'
      '      Artwork_Required = :Artwork_Required,'
      '      Artwork_Due_Date = :Artwork_Due_Date,'
      '      Artwork_Proof_Date = :Artwork_Proof_Date,'
      '      Artwork_approval_Date = :Artwork_approval_Date,'
      '      Data_Services_Required = :Data_Services_Required,'
      '      Data_Required_Date = :Data_Required_Date,'
      '      Brief_Required_Date = :Brief_Required_Date,'
      '      Text_Required_Date = :Text_Required_Date,'
      '      Brief_Available_Date = :Brief_Available_Date,'
      '      Text_Available_Date = :Text_Available_Date,'
      '      Text_Proof_Date = :Text_Proof_Date,'
      '      Proof_Required_Date = :Proof_Required_Date,'
      '      Proof_Approval_Date = :Proof_Approval_Date,'
      '      Samples_Required = :Samples_Required,'
      '      Sample_to_Client = :Sample_to_Client,'
      '      Sample_Approval = :Sample_Approval,'
      '      Date_Start = :Date_Start,'
      '      Invoiced_by = :Invoiced_By,'
      '      Invoiced_Date = :Invoiced_Date,'
      '      Job_Bag_Production_Status = :Job_Bag_Production_Status,'
      '      Cost_Centre = :Cost_Centre,'
      '      Cash_Sales = :Cash_Sales,'
      '      Production_Complete = :Production_Complete,'
      '      Production_Complete_date = :Production_Complete_date,'
      '      Production_Complete_by = :Production_Complete_by,'
      '      Price_unit = :Price_unit,'
      '      File_Copies_Received_Date = :File_Copies_Received_Date,'
      '      File_Copies_Received_by = :File_Copies_Received_by,'
      '      Invoice_This_Week = :Invoice_This_Week,'
      '      Invoice_This_Week_Date = :Invoice_This_Week_Date,'
      '      Invoice_This_Week_By = :Invoice_This_Week_By,'
      '      End_User_Customer = :End_User_Customer,'
      '      End_User_Branch_No = :End_User_Branch_no,'
      '      Pack_Format_ID = :Pack_Format_ID,'
      '      Enclosing_Type = :Enclosing_Type'
      'WHERE Job_Bag=:JobBag'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 224
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Order_no'
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
        Name = 'Job_Bag_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ready_for_invoicing'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Original_Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoice_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'On_Hold'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Artwork_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Due_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_approval_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Services_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Available_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Available_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Approval_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Samples_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_to_Client'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_Approval'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Start'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoiced_By'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Invoiced_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Production_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cash_Sales'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Production_Complete_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'File_Copies_Received_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'File_Copies_Received_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Invoice_This_Week'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Invoice_This_Week_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoice_This_Week_By'
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
        DataType = ftInteger
        Name = 'Pack_Format_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enclosing_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'JobBag'
        ParamType = ptInput
      end>
  end
  object qryJBLine: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT * FROM Job_Bag_Line_Dets'
      'WHERE'
      '  (Job_Bag_Line_dets.Job_Bag = :JobBag) AND'
      '  (Job_Bag_Line_dets.Job_Bag_Line = :Line)'
      ''
      ' '
      ' ')
    Left = 176
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JobBag'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end>
  end
  object qryJBAllLines: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      
        'SELECT JBL.*, S.Name as SupplierName, SB.Name as BranchName, JBL' +
        '.Inactive as Line_Inactive, Vat_Code.Description as Vat_Descript' +
        'ion'
      
        'FROM Job_Bag_Line_Dets JBL, Supplier S, Supplier_Branch SB, Vat_' +
        'Code'
      'WHERE (JBL.Job_Bag = :JobBag) AND'
      '  (JBL.Supplier = SB.Supplier) AND'
      '  (JBL.Branch_No = SB.Branch_No) AND'
      '  (JBL.Vat_Code = Vat_Code.Vat_Code) AND'
      '  (SB.Supplier = S.Supplier)'
      'ORDER BY Sequence_no, Job_Bag_Line'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 120
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JobBag'
        ParamType = ptInput
      end>
    object qryJBAllLinesJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag'
    end
    object qryJBAllLinesJob_Bag_Line: TIntegerField
      FieldName = 'Job_Bag_Line'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line'
    end
    object qryJBAllLinesJob_Bag_Line_Type: TStringField
      FieldName = 'Job_Bag_Line_Type'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Type'
      FixedChar = True
      Size = 2
    end
    object qryJBAllLinesPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
      Origin = 'PB.Job_Bag_Line_Dets.Purchase_Order'
    end
    object qryJBAllLinesLine: TIntegerField
      FieldName = 'Line'
      Origin = 'PB.Job_Bag_Line_Dets.Line'
    end
    object qryJBAllLinesSupplier: TIntegerField
      FieldName = 'Supplier'
      Origin = 'PB.Job_Bag_Line_Dets.Supplier'
    end
    object qryJBAllLinesBranch_No: TIntegerField
      FieldName = 'Branch_No'
      Origin = 'PB.Job_Bag_Line_Dets.Branch_No'
    end
    object qryJBAllLinesJob_Bag_Line_Descr: TStringField
      FieldName = 'Job_Bag_Line_Descr'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Descr'
      FixedChar = True
      Size = 80
    end
    object qryJBAllLinesJob_Bag_Line_Cost: TCurrencyField
      FieldName = 'Job_Bag_Line_Cost'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Cost'
    end
    object qryJBAllLinesJob_Bag_Line_Sell: TCurrencyField
      FieldName = 'Job_Bag_Line_Sell'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Sell'
    end
    object qryJBAllLinesJob_Bag_Line_Invoiced: TStringField
      FieldName = 'Job_Bag_Line_Invoiced'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Invoiced'
      FixedChar = True
      Size = 2
    end
    object qryJBAllLinesJob_Bag_Quantity: TIntegerField
      FieldName = 'Job_Bag_Quantity'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Quantity'
    end
    object qryJBAllLinesVAT_Code: TIntegerField
      FieldName = 'VAT_Code'
      Origin = 'PB.Job_Bag_Line_Dets.VAT_Code'
    end
    object qryJBAllLinesCurrency_Code: TIntegerField
      FieldName = 'Currency_Code'
      Origin = 'PB.Job_Bag_Line_Dets.Currency_Code'
    end
    object qryJBAllLinesMargin: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Margin'
      OnGetText = qryJBAllLinesMarginGetText
      Calculated = True
    end
    object qryJBAllLinesTypeDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'TypeDesc'
      LookupDataSet = qryJBType
      LookupKeyFields = 'Job_Bag_Line_Type'
      LookupResultField = 'Job_Bag_LT_Descr'
      KeyFields = 'Job_Bag_Line_Type'
      Lookup = True
    end
    object qryJBAllLinesSupplierName: TStringField
      FieldName = 'SupplierName'
      FixedChar = True
      Size = 80
    end
    object qryJBAllLinesBranchName: TStringField
      FieldName = 'BranchName'
      FixedChar = True
      Size = 80
    end
    object qryJBAllLinessupp_inv_recd: TStringField
      FieldName = 'supp_inv_recd'
      Origin = 'PB.Job_Bag_Line_Dets.supp_inv_recd'
      FixedChar = True
      Size = 4
    end
    object qryJBAllLinesInactive: TStringField
      FieldKind = fkCalculated
      FieldName = 'Inactive'
      OnGetText = qryJBAllLinesInactiveGetText
      Size = 1
      Calculated = True
    end
    object qryJBAllLinesProduct_Type: TIntegerField
      FieldName = 'Product_Type'
      Origin = 'PB.Job_Bag_Line_Dets.Product_Type'
    end
    object qryJBAllLinesOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'PB.Job_Bag_Line_Dets.Operator'
    end
    object qryJBAllLinesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'PB.Job_Bag_Line_Dets.Sales_Order'
    end
    object qryJBAllLinesSales_Order_Line_no: TIntegerField
      FieldName = 'Sales_Order_Line_no'
      Origin = 'PB.Job_Bag_Line_Dets.Sales_Order_Line_no'
    end
    object qryJBAllLinesOrderNumber: TStringField
      FieldKind = fkCalculated
      FieldName = 'OrderNumber'
      OnGetText = qryJBAllLinesOrderNumberGetText
      Calculated = True
    end
    object qryJBAllLinesJob_Bag_Line_Status: TIntegerField
      FieldName = 'Job_Bag_Line_Status'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Status'
    end
    object qryJBAllLinesworks_order: TIntegerField
      FieldName = 'works_order'
      Origin = 'PB.Job_Bag_Line_Dets.works_order'
    end
    object qryJBAllLinesProcess: TIntegerField
      FieldName = 'Process'
      Origin = 'PB.Job_Bag_Line_Dets.Process'
    end
    object qryJBAllLinesPrice_Unit: TIntegerField
      FieldName = 'Price_Unit'
      Origin = 'PB.Job_Bag_Line_Dets.Price_Unit'
    end
    object qryJBAllLinesSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
      Origin = 'PB.Job_Bag_Line_Dets.Selling_Price'
    end
    object qryJBAllLinesQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qryJBAllLinesReady_to_Invoice: TStringField
      FieldName = 'Ready_to_Invoice'
    end
    object qryJBAllLinesUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
    end
    object qryJBAllLinesUnit_SSP: TCurrencyField
      FieldName = 'Unit_SSP'
    end
    object qryJBAllLinesUnit_Cost_Plus_OHD: TCurrencyField
      FieldName = 'Unit_Cost_Plus_OHD'
    end
    object qryJBAllLinesUnit_SSP_Original: TCurrencyField
      FieldName = 'Unit_SSP_Original'
    end
    object qryJBAllLinesLine_Inactive: TStringField
      FieldName = 'Line_Inactive'
      Size = 1
    end
    object qryJBAllLinesQuote: TFloatField
      FieldName = 'Quote'
    end
    object qryJBAllLinesQuote_Line_no: TIntegerField
      FieldName = 'Quote_Line_no'
    end
    object qryJBAllLinesVat_Description: TStringField
      FieldName = 'Vat_Description'
      Size = 50
    end
    object qryJBAllLinesLine_Is_Internal_Cost: TStringField
      FieldName = 'Line_Is_Internal_Cost'
      Size = 1
    end
    object qryJBAllLinesJob_Cost_Markup_Perc: TFloatField
      FieldName = 'Job_Cost_Markup_Perc'
    end
    object qryJBAllLinesReseller_Price: TFloatField
      FieldName = 'Reseller_Price'
    end
    object qryJBAllLinesJob_Bag_Line_Reseller: TFloatField
      FieldName = 'Job_Bag_Line_Reseller'
    end
  end
  object qryJBAddLine: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'INSERT INTO Job_Bag_Line_Dets'
      #9'(Job_Bag,Job_Bag_Line,Job_Bag_Line_Type,Purchase_Order,Line,'
      #9'Supplier,Branch_No,Job_Bag_Line_Descr,Job_Bag_Line_Cost,'
      #9'Job_Bag_Line_Sell,Job_Bag_Line_Invoiced,Job_Bag_Quantity,'
      
        #9'VAT_Code,Currency_Code, Product_Type, Sales_Order, Sales_Order_' +
        'line_no,'
      
        '  Works_order, Price_Unit, Process, Reseller_Price, Selling_Pric' +
        'e, Job_Bag_Line_Status, Sequence_no,'
      
        '  Qty_Invoiced, Ready_To_Invoice, Unit_Cost, Unit_SSP, Unit_Cost' +
        '_Plus_OHD, Unit_SSP_Original, Inactive, Quote, Quote_Line_no,'
      
        '  Job_Cost_Markup_Perc, Line_Is_Internal_Cost, Job_Bag_Line_Rese' +
        'ller)'
      'VALUES'
      
        #9'(:Job_Bag,:Job_Bag_Line,:Job_Bag_Line_Type,:Purchase_Order,:Lin' +
        'e,'
      #9':Supplier,:Branch_No,:Job_Bag_Line_Descr,:Job_Bag_Line_Cost,'
      #9':Job_Bag_Line_Sell,:Job_Bag_Line_Invoiced,:Job_Bag_Quantity,'
      
        #9':VAT_Code,:Currency_Code,:Product_Type, :Sales_Order, :Sales_Or' +
        'der_line_no,'
      
        '  :works_order, :Price_Unit, :Process, :Reseller_Price, :Selling' +
        '_Price, :Job_Bag_Line_Status, :Sequence_no,'
      
        '  :Qty_Invoiced, :Ready_To_Invoice, :Unit_Cost, :Unit_SSP, :Unit' +
        '_Cost_Plus_OHD, :Unit_SSP_Original, :Inactive, :Quote, :Quote_Li' +
        'ne_no,'
      
        '  :Job_Cost_Markup_Perc, :Line_Is_Internal_Cost, :Job_Bag_Line_R' +
        'eseller)'
      ''
      ' '
      ' '
      ' ')
    Left = 40
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Job_Bag_Line_Type'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Purchase_Order'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Job_Bag_Line_Descr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line_Cost'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line_Sell'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Job_Bag_Line_Invoiced'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Quantity'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VAT_Code'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Currency_Code'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'works_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Process'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reseller_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Selling_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sequence_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ready_To_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
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
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quote_Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Cost_Markup_Perc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Is_Internal_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Reseller'
        ParamType = ptUnknown
      end>
  end
  object dsJBAllLines: TDataSource
    AutoEdit = False
    DataSet = qryJBAllLines
    Left = 40
    Top = 112
  end
  object qryJBType: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT * FROM Job_Bag_Line_Type')
    Left = 256
    Top = 120
  end
  object qryPriceUnit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * FROM Price_unit WHERE Price_unit = :Unit')
    Left = 312
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'Unit'
        ParamType = ptInput
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
  object srcCustContact: TDataSource
    DataSet = qryCustContact
    Left = 312
    Top = 216
  end
  object qryCustReps: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Rep.Name, Rep.Rep'
      'from Reps_Branches, Rep'
      'where Customer = :Customer and '
      'Branch_no =:Branch_no and'
      'Reps_Branches.Rep = Rep.Rep')
    Left = 200
    Top = 488
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
  object srcCustReps: TDataSource
    DataSet = qryCustReps
    Left = 336
    Top = 328
  end
  object qryJBUpLine: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'Update Job_Bag_Line_Dets'
      'set Job_Bag_Line_Type = :Job_Bag_Line_Type,'
      'Purchase_Order = :Purchase_Order,'
      'Line = :Line,'
      'Supplier = :Supplier,'
      'Branch_No = :Branch_no,'
      'Job_Bag_Line_Descr = :Job_Bag_Line_Descr,'
      'Job_Bag_Line_Cost = :Job_Bag_Line_Cost,'
      'Job_Bag_Line_Sell = :Job_Bag_Line_Sell,'
      'Job_Bag_Line_Invoiced = :Job_Bag_Line_Invoiced,'
      'Job_Bag_Quantity = :Job_Bag_Quantity,'
      'VAT_Code = :VAT_Code,'
      'Currency_Code = :Currency_Code,'
      'Product_Type = :Product_Type,'
      'Sales_Order = :Sales_Order,'
      'Sales_order_Line_No = :Sales_Order_Line_No,'
      'works_order = :works_order,'
      'Price_Unit = :Price_Unit,'
      'Process = :Process,'
      'Reseller_Price = :Reseller_Price,'
      'Selling_Price = :Selling_Price,'
      'Job_Bag_Line_Status = :Job_Bag_Line_Status,'
      'Sequence_no = :Sequence_No,'
      'Qty_Invoiced = :Qty_Invoiced,'
      'Ready_to_Invoice = :Ready_To_Invoice,'
      'Unit_Cost = :Unit_Cost,'
      'Unit_SSP = :Unit_SSP,'
      'Unit_Cost_plus_OHD = :Unit_Cost_plus_OHD,'
      'Unit_SSP_Original = :Unit_SSP_Original,'
      'Inactive = :Inactive,'
      'Quote = :Quote,'
      'Quote_Line_No = :Quote_Line_No,'
      'Job_Cost_Markup_Perc = :Job_Cost_Markup_Perc,'
      'Line_Is_Internal_Cost = :Line_Is_Internal_Cost,'
      'Job_Bag_Line_Reseller = :Job_Bag_Line_Reseller'
      'Where'
      'Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 120
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'Job_Bag_Line_Type'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Purchase_Order'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Job_Bag_Line_Descr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line_Cost'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line_Sell'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Job_Bag_Line_Invoiced'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Quantity'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VAT_Code'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Currency_Code'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'works_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Process'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reseller_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Selling_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sequence_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ready_To_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_SSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost_plus_OHD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_SSP_Original'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quote_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Cost_Markup_Perc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Is_Internal_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Reseller'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line'
        ParamType = ptInput
      end>
  end
  object qryPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Purch_ord_line_Status, Inactive'
      'from Purchase_OrderLine'
      'where Purchase_Order = :Purchase_Order and '
      'Line = :Line')
    Left = 456
    Top = 216
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
  object qryJBDelLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 392
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
      end>
  end
  object dsDummy: TDataSource
    Left = 336
    Top = 112
  end
  object qryPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Purchase_order, Line, Inactive,'
      '    Purch_ord_line_Status.Description as Status_Description,'
      '    Purch_ord_line_Status.Purch_ord_line_Status,'
      '    Cash_Sale'
      'from Purchase_orderLine, Purch_ord_line_Status'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :line and'
      
        'Purchase_orderLine.Purch_ord_line_Status = Purch_ord_line_Status' +
        '.Purch_ord_line_Status'
      ' '
      ' ')
    Left = 400
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryProductType: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Product_Type, Product_Type.Description, Category.Descript' +
        'ion as Category_Description'
      'from Product_Type, Category'
      'where Product_Type = :Product_Type and'
      'Product_Type.Category = Category.Category'
      ' ')
    Left = 40
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
  object qryInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Sales_invoice_no'
      'from Sales_Invoice_line, Sales_invoice '
      'where'
      '((Sales_invoice.inactive IS NULL) or'
      '(Sales_invoice.inactive = '#39'N'#39')) AND'
      '('
      '('
      '(Sales_invoice_Line.Job_Bag = :Job_Bag) and'
      '(Sales_invoice_Line.Job_Bag_Line = :Line)'
      ') or'
      '(Sales_invoice_Line.purchase_order = :Purchase_order)'
      ' or'
      '(Sales_invoice_Line.sales_order = :sales_order)'
      ') and'
      '(Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice)'
      'ORDER BY Sales_Invoice.Sales_Invoice DESC'
      ' '
      ' ')
    Left = 112
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryCust: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from customer'
      'where customer = :customer')
    Left = 464
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end>
  end
  object qrySO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select sales_order, Sales_order.Sales_order_head_Status, sales_O' +
        'rder_head_Status.Description'
      'from Sales_Order, sales_order_head_status'
      'where sales_order = :sales_order and'
      
        'sales_order.sales_order_head_status = sales_Order_head_Status.sa' +
        'les_Order_head_Status')
    Left = 456
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object GetLastJBLineSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(Job_Bag_Line) as Last_JB_Line_Number'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag')
    Left = 392
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qrySOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  sales_order_Line.*,'
      '        Sales_order.Sales_order_head_Status,'
      '        sales_Order_head_Status.Description'
      'from  Sales_Order_Line,'
      '      sales_order_head_status,'
      '      Sales_Order'
      'where sales_order_Line.Sales_Order = :sales_order and'
      'Sales_order_line.sales_order_line_no = :Sales_order_line_no and'
      'Sales_order_line.Sales_order = sales_order.sales_order and'
      
        'sales_order.sales_order_head_status = sales_Order_head_Status.sa' +
        'les_Order_head_Status')
    Left = 456
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_line_no'
        ParamType = ptUnknown
      end>
  end
  object qryWO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  works_order,'
      '        works_order.Works_order_Status,'
      
        '        Works_order_Status.Works_order_Status_Descr as Descripti' +
        'on'
      'from  Works_Order,'
      '      works_order_status'
      'where works_order = :works_order and'
      
        'works_order.works_order_status = works_Order_Status.works_Order_' +
        'Status')
    Left = 512
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'works_order'
        ParamType = ptUnknown
      end>
  end
  object qryGetAllJBLines: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select * from Job_Bag_line_dets'
      'where Job_Bag = :Job_Bag')
    Left = 392
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetAccountMgr: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Account_Team_Name'
      'from Account_Team_Member, Account_Team'
      'where Operator = :Operator and'
      '(Account_Team_Member.Account_Team = Account_Team.Account_Team)')
    Left = 392
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object GetLastJBSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Last_Job_Bag_Number'
      'From Company'
      'Where Company = 1')
    Left = 112
    Top = 588
  end
  object UpdLastJBSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Job_Bag_Number = :Last_Job_Bag_Number'
      'Where Company = 1')
    Left = 40
    Top = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_Job_Bag_Number'
        ParamType = ptUnknown
      end>
  end
  object qrySpare: TQuery
    DatabaseName = 'PB'
    Left = 192
    Top = 592
  end
  object qryJBAddHeader: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'INSERT INTO Job_Bag ('
      'Job_Bag,'
      'Job_Bag_Descr,'
      'Customer,'
      'Branch_No,'
      'Contact_no,'
      'Date_Point,'
      'Goods_required,'
      'Office_Contact,'
      'Cust_Order_no,'
      'Quantity,'
      'Rep,'
      'Sub_Rep,'
      'Job_Bag_Status,'
      'Inactive,'
      'Ready_for_invoicing,'
      'Account_Team,'
      'Description_Reference,'
      'Operator,'
      'Narrative,'
      'Original_Job_Bag,'
      'Invoice_Location,'
      'On_Hold,'
      'Artwork_Required,'
      'Artwork_Due_Date,'
      'Artwork_Proof_Date,'
      'Artwork_approval_Date,'
      'Data_Services_Required,'
      'Data_Required_Date,'
      'Brief_Required_Date,'
      'Text_Required_Date,'
      'Brief_Available_Date,'
      'Text_Available_Date,'
      'Text_Proof_Date,'
      'Proof_Required_Date,'
      'Proof_Approval_Date,'
      'Samples_Required,'
      'Sample_to_Client,'
      'Sample_Approval,'
      'Date_Start,'
      'Invoiced_by,'
      'Invoiced_Date,'
      'Quote,'
      'Job_Bag_Production_Status,'
      'Cost_Centre,'
      'Cash_Sales,'
      'Production_Complete,'
      'Production_Complete_by,'
      'Price_Unit,'
      'File_Copies_Received_Date,'
      'File_Copies_Received_by,'
      'Invoice_This_Week,'
      'Invoice_This_Week_Date,'
      'Invoice_This_Week_By,'
      'End_User_Customer,'
      'End_User_Branch_No,'
      'Pack_Format_ID,'
      'Enclosing_Type'
      ')'
      'VALUES ('
      ':Job_Bag,'
      ':Job_Bag_Descr,'
      ':Customer,'
      ':Branch_No,'
      ':Contact_no,'
      ':Date_Point,'
      ':Goods_required,'
      ':Office_Contact,'
      ':Cust_Order_no,'
      ':Quantity,'
      ':Rep,'
      ':Sub_Rep,'
      ':Job_Bag_Status,'
      ':Inactive,'
      ':Ready_for_invoicing,'
      ':Account_Team,'
      ':Description_Reference,'
      ':Operator,'
      ':Narrative,'
      ':Original_Job_Bag,'
      ':Invoice_Location,'
      ':On_Hold,'
      ':Artwork_Required,'
      ':Artwork_Due_Date,'
      ':Artwork_Proof_Date,'
      ':Artwork_approval_Date,'
      ':Data_Services_Required,'
      ':Data_Required_Date,'
      ':Brief_Required_Date,'
      ':Text_Required_Date,'
      ':Brief_Available_Date,'
      ':Text_Available_Date,'
      ':Text_Proof_Date,'
      ':Proof_Required_Date,'
      ':Proof_Approval_Date,'
      ':Samples_Required,'
      ':Sample_to_Client,'
      ':Sample_Approval,'
      ':Date_Start,'
      ':Invoiced_by,'
      ':Invoiced_Date,'
      ':Quote,'
      ':Job_Bag_Production_Status,'
      ':Cost_Centre,'
      ':Cash_Sales,'
      ':Production_Complete,'
      ':Production_Complete_by,'
      ':Price_Unit,'
      ':File_Copies_Received_Date,'
      ':File_Copies_Received_by,'
      ':Invoice_This_Week,'
      ':Invoice_This_Week_Date,'
      ':Invoice_This_Week_By,'
      ':End_User_Customer,'
      ':End_User_Branch_No,'
      ':Pack_Format_ID,'
      ':Enclosing_Type'
      ')'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 128
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
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
        Name = 'Goods_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Order_no'
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
        Name = 'Job_Bag_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ready_for_invoicing'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description_Reference'
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
        DataType = ftFloat
        Name = 'Original_Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoice_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'On_Hold'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Artwork_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Due_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_approval_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Services_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Available_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Available_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Approval_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Samples_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_to_Client'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_Approval'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Start'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoiced_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Invoiced_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Production_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cash_Sales'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'File_Copies_Received_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'File_Copies_Received_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_This_Week'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Invoice_This_Week_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoice_This_Week_By'
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
        DataType = ftInteger
        Name = 'Pack_Format_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enclosing_Type'
        ParamType = ptUnknown
      end>
  end
  object qryGetOpAccountTeam: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select account_team.account_team, account_team.account_team_name'
      'from account_team_member, Account_Team'
      'where operator = :operator and'
      'account_team_member.account_team = account_team.account_team')
    Left = 288
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'operator'
        ParamType = ptUnknown
      end>
  end
  object qryGetAccountTeam: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Account_Team'
      'where Account_Team = :Account_Team')
    Left = 288
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end>
  end
  object qryJBRepeatLines: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT JBL.*, S.Name as SupplierName, SB.Name as BranchName'
      'FROM Job_Bag_Line_Dets JBL, Supplier S, Supplier_Branch SB'
      'WHERE (JBL.Job_Bag = :JobBag) AND'
      '  (JBL.Job_Bag_Line_Type = '#39'A'#39') AND'
      '  (JBL.Supplier = SB.Supplier) AND'
      '  (JBL.Branch_No = SB.Branch_No) AND'
      '  (SB.Supplier = S.Supplier)'
      'ORDER BY Sequence_no, Job_Bag_Line'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 256
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JobBag'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'Job_Bag'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Job_Bag_Line'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line'
    end
    object StringField1: TStringField
      FieldName = 'Job_Bag_Line_Type'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Type'
      FixedChar = True
      Size = 2
    end
    object FloatField1: TFloatField
      FieldName = 'Purchase_Order'
      Origin = 'PB.Job_Bag_Line_Dets.Purchase_Order'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Line'
      Origin = 'PB.Job_Bag_Line_Dets.Line'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Supplier'
      Origin = 'PB.Job_Bag_Line_Dets.Supplier'
    end
    object IntegerField5: TIntegerField
      FieldName = 'Branch_No'
      Origin = 'PB.Job_Bag_Line_Dets.Branch_No'
    end
    object StringField2: TStringField
      FieldName = 'Job_Bag_Line_Descr'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Descr'
      FixedChar = True
      Size = 80
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'Job_Bag_Line_Cost'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Cost'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'Job_Bag_Line_Sell'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Sell'
    end
    object StringField3: TStringField
      FieldName = 'Job_Bag_Line_Invoiced'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Invoiced'
      FixedChar = True
      Size = 2
    end
    object IntegerField6: TIntegerField
      FieldName = 'Job_Bag_Quantity'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Quantity'
    end
    object IntegerField7: TIntegerField
      FieldName = 'VAT_Code'
      Origin = 'PB.Job_Bag_Line_Dets.VAT_Code'
    end
    object IntegerField8: TIntegerField
      FieldName = 'Currency_Code'
      Origin = 'PB.Job_Bag_Line_Dets.Currency_Code'
    end
    object FloatField2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Margin'
      OnGetText = qryJBAllLinesMarginGetText
      Calculated = True
    end
    object StringField4: TStringField
      FieldKind = fkLookup
      FieldName = 'TypeDesc'
      LookupDataSet = qryJBType
      LookupKeyFields = 'Job_Bag_Line_Type'
      LookupResultField = 'Job_Bag_LT_Descr'
      KeyFields = 'Job_Bag_Line_Type'
      Lookup = True
    end
    object StringField5: TStringField
      FieldName = 'SupplierName'
      FixedChar = True
      Size = 80
    end
    object StringField6: TStringField
      FieldName = 'BranchName'
      FixedChar = True
      Size = 80
    end
    object StringField7: TStringField
      FieldName = 'supp_inv_recd'
      Origin = 'PB.Job_Bag_Line_Dets.supp_inv_recd'
      FixedChar = True
      Size = 4
    end
    object StringField8: TStringField
      FieldKind = fkCalculated
      FieldName = 'Inactive'
      OnGetText = qryJBAllLinesInactiveGetText
      Size = 1
      Calculated = True
    end
    object IntegerField9: TIntegerField
      FieldName = 'Product_Type'
      Origin = 'PB.Job_Bag_Line_Dets.Product_Type'
    end
    object IntegerField10: TIntegerField
      FieldName = 'Operator'
      Origin = 'PB.Job_Bag_Line_Dets.Operator'
    end
    object IntegerField11: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'PB.Job_Bag_Line_Dets.Sales_Order'
    end
    object IntegerField12: TIntegerField
      FieldName = 'Sales_Order_Line_no'
      Origin = 'PB.Job_Bag_Line_Dets.Sales_Order_Line_no'
    end
    object StringField9: TStringField
      FieldKind = fkCalculated
      FieldName = 'OrderNumber'
      OnGetText = qryJBAllLinesOrderNumberGetText
      Calculated = True
    end
    object IntegerField13: TIntegerField
      FieldName = 'Job_Bag_Line_Status'
      Origin = 'PB.Job_Bag_Line_Dets.Job_Bag_Line_Status'
    end
    object IntegerField14: TIntegerField
      FieldName = 'works_order'
      Origin = 'PB.Job_Bag_Line_Dets.works_order'
    end
    object IntegerField15: TIntegerField
      FieldName = 'Process'
      Origin = 'PB.Job_Bag_Line_Dets.Process'
    end
    object IntegerField16: TIntegerField
      FieldName = 'Price_Unit'
      Origin = 'PB.Job_Bag_Line_Dets.Price_Unit'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'Selling_Price'
      Origin = 'PB.Job_Bag_Line_Dets.Selling_Price'
    end
    object qryJBRepeatLinesLine_Is_Internal_Cost: TStringField
      FieldName = 'Line_Is_Internal_Cost'
      Size = 1
    end
    object qryJBRepeatLinesJob_Cost_Markup_Perc: TFloatField
      FieldName = 'Job_Cost_Markup_Perc'
    end
    object qryJBRepeatLinesUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
    end
    object qryJBRepeatLinesUnit_SSP: TFloatField
      FieldName = 'Unit_SSP'
    end
    object qryJBRepeatLinesUnit_Cost_Plus_OHD: TFloatField
      FieldName = 'Unit_Cost_Plus_OHD'
    end
    object qryJBRepeatLinesUnit_SSP_Original: TFloatField
      FieldName = 'Unit_SSP_Original'
    end
  end
  object qryJBWO: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select * from'
      'Job_Bag_Works_Order'
      'where Job_Bag = :Job_Bag'
      'order by Works_Order')
    Left = 464
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object srcJBWO: TDataSource
    DataSet = qryJBWO
    Left = 520
    Top = 328
  end
  object qryJBUpdHeaderStatus: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'UPDATE Job_Bag'
      '  SET Job_Bag_Status = :Job_Bag_Status'
      'WHERE Job_Bag=:JobBag'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 240
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'JobBag'
        ParamType = ptInput
      end>
  end
  object GetPartDetailsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select  part.Part_Description,'
      '        Purch_Pack_Quantity,'
      '        Sell_Pack_Quantity,'
      '        Numbered,'
      '        Product_Type'
      'From Part'
      'Where Part = :Part'
      ' '
      ' ')
    Left = 544
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryJBAllWorks: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Works_Order.Job_Bag,'
      '        Job_Bag_Works_Order.Works_Order_no,'
      '        Job_Bag_Works_Order.Works_Order,'
      '        Works_Order.Works_Order_Number,'
      '        Works_Order.Description,'
      '        Works_Order.Actual_Quantity,'
      '        Works_Order.Date_Point,'
      '        Works_Order.Date_Start,'
      '        Works_Order.Date_Required,'
      '        Works_Order.Works_Order_Status,'
      
        '        Works_Order_Status.Works_Order_Status_Descr as Status_De' +
        'scription'
      'FROM Job_Bag_Works_Order, Works_Order, Works_Order_Status'
      'WHERE Job_Bag_Works_Order.Job_Bag = :Job_Bag AND'
      'Job_Bag_Works_Order.Works_Order = Works_Order.Works_Order and'
      
        'Works_Order.Works_Order_Status = Works_Order_Status.Works_Order_' +
        'Status'
      'ORDER BY Job_Bag_Works_Order.Works_Order_no')
    Left = 40
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddWorks: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into Job_Bag_Works_Order'
      '(Job_Bag,'
      'Works_Order_No,'
      'Works_Order)'
      'Values (:Job_Bag,'
      ':Works_Order_no,'
      ':Works_Order)')
    Left = 120
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Works_Order_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Works_Order'
        ParamType = ptUnknown
      end>
  end
  object qryJBWorks: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Works_Order.Job_Bag,'
      '        Job_Bag_Works_Order.Works_Order_no,'
      '        Job_Bag_Works_Order.Works_Order,'
      '        Works_Order.Works_Order_Number,'
      '        Works_Order.Description,'
      '        Works_Order.Actual_Quantity,'
      '        Works_Order.Date_Point,'
      '        Works_Order.Date_Start,'
      '        Works_Order.Date_Required,'
      '        Works_Order.Works_Order_Status,'
      
        '        Works_Order_Status.Works_Order_Status_Descr as Status_De' +
        'scription'
      'FROM Job_Bag_Works_Order, Works_Order, Works_Order_Status'
      'WHERE Job_Bag_Works_Order.Job_Bag = :Job_Bag AND'
      'Job_Bag_Works_Order.Works_Order_No = :Works_Order_No AND'
      'Job_Bag_Works_Order.Works_Order = Works_Order.Works_Order AND'
      
        'Works_Order.Works_Order_Status = Works_Order_Status.Works_Order_' +
        'Status'
      'ORDER BY Job_Bag_Works_Order.Works_Order_no')
    Left = 200
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Works_Order_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetSupplier: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Supplier.Name as Supplier_Name'
      'from Supplier'
      'where Supplier.Supplier = :Supplier')
    Left = 512
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryGetWorksOrder: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Works_Order'
      'where Works_Order = :Works_Order')
    Left = 464
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Works_Order'
        ParamType = ptUnknown
      end>
  end
  object qryCheckJBInvoiced: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from sales_invoice_line'
      'where job_bag = :Job_Bag')
    Left = 544
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryInvoiceLoc: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Invoice_Location'
      
        'Where ((Invoice_Location.inactive = '#39'N'#39') OR (Invoice_Location.in' +
        'active IS NULL)) OR'
      '      ((Invoice_Location.Invoice_Location = :Invoice_location))'
      'order by Invoice_Location_Descr')
    Left = 488
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_location'
        ParamType = ptUnknown
      end>
  end
  object srcInvoiceLoc: TDataSource
    DataSet = qryInvoiceLoc
    Left = 560
    Top = 272
  end
  object qrySalesInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice_Line.Purchase_Order,'
      'Sales_Invoice_Line.Line,'
      'Sales_Invoice.Sales_Invoice,'
      'Sales_Invoice.Paid_Status'
      'from Sales_Invoice_Line, Sales_Invoice'
      'where Sales_Invoice_Line.Purchase_Order = :Purchase_Order and'
      'Sales_Invoice_Line.Line = :Line and'
      'Sales_invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice')
    Left = 392
    Top = 528
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
  object qryPOHead: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Purchase_Order'
      'where Purchase_order = :Purchase_Order')
    Left = 568
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryJBDocument: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      '(select Operator.Name'
      ' from Operator'
      
        ' where Operator.Operator = Job_Bag_Document.Operator) as Operato' +
        'r_Name'
      'from Job_Bag_Document'
      'where Job_Bag = :Job_Bag and Document_No = :Document_No')
    Left = 208
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_No'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddDocument: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Document'
      '(Job_Bag,'
      'Date_created,'
      'Document_No,'
      'Document_Title,'
      'Document,'
      'Operator,'
      'Created_By)'
      'values'
      '(:Job_Bag,'
      ':Date_Created,'
      ':Document_No,'
      ':Document_Title,'
      ':Document,'
      ':Operator,'
      ':Created_By)')
    Left = 120
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
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
      end
      item
        DataType = ftInteger
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Created_By'
        ParamType = ptUnknown
      end>
  end
  object qryJBAllDocuments: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *, '
      '(select Operator.Name'
      ' from Operator'
      
        ' where Operator.Operator = Job_Bag_Document.Operator) as Operato' +
        'r_Name'
      'from Job_Bag_Document'
      'where Job_Bag = :Job_Bag'
      'order by Date_Created')
    Left = 40
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryAllSalesInvoices: TQuery
    OnCalcFields = qryAllSalesInvoicesCalcFields
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '
      #9'Sales_Invoice.Sales_Invoice, '
      #9'Sales_Invoice.Sales_Invoice_No, '
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
      'FROM Price_Unit '
      #9#9'INNER JOIN (Sales_Invoice '
      #9#9'INNER JOIN (Vat_Code '
      #9#9'INNER JOIN Sales_Invoice_Line '
      #9#9#9'ON Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code) '
      
        #9#9#9'ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Inv' +
        'oice) '
      #9#9#9'ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE Sales_Invoice_Line.Job_Bag = :Job_Bag and'
      '((Sales_invoice.inactive IS NULL) or'
      '(Sales_invoice.inactive = '#39'N'#39'))'
      'GROUP BY Sales_Invoice.Sales_Invoice, '
      #9'Sales_Invoice.Sales_Invoice_No, '
      #9'Sales_Invoice.Invoice_Date,'
      #9'Sales_Invoice.Invoice_Description,'
      '  Sales_Invoice.Invoice_or_Credit'
      '')
    Left = 288
    Top = 584
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
    object qryAllSalesInvoicesSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qryAllSalesInvoicesSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qryAllSalesInvoicesInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qryAllSalesInvoicesInvoice_Description: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qryAllSalesInvoicesInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qryAllSalesInvoicesGoods_Value: TFloatField
      FieldName = 'Goods_Value'
    end
    object qryAllSalesInvoicesVat_Value: TFloatField
      FieldName = 'Vat_Value'
    end
    object qryAllSalesInvoicesTotal_Value: TFloatField
      FieldName = 'Total_Value'
    end
    object qryAllSalesInvoicesTotal_Goods: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Goods'
      Calculated = True
    end
    object qryAllSalesInvoicesTotal_Vat: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Vat'
      Calculated = True
    end
    object qryAllSalesInvoicesTotal_Invoice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Invoice'
      Calculated = True
    end
  end
  object srcAllSalesInvoices: TDataSource
    DataSet = qryAllSalesInvoices
    Left = 392
    Top = 584
  end
  object qrySITotal: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_Dets.Job_Bag, '
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'Sales_Invoice_Line.Goods_Value + ISNULL(Amount,0.00)'
      #9'ELSE'
      
        #9'     ((Sales_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Sales' +
        '_Invoice_Line.Goods_Value) + ISNULL(Amount,0.00)'
      #9'END) as Goods_Value'
      'FROM Vat_Code AS VC '
      #9'RIGHT JOIN ((Job_Bag_Line_Dets '
      #9'INNER JOIN (Vat_Code '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN (Sales_Invoice '
      #9'INNER JOIN Sales_Invoice_Line '
      
        #9#9'ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invo' +
        'ice) '
      #9#9'ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) '
      #9#9'ON Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code) '
      
        #9#9'ON (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job_Ba' +
        'g_Line) AND (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_' +
        'Bag)) '
      #9'LEFT JOIN Sales_Invoice_Add_charge '
      
        #9#9'ON (Sales_Invoice_Line.Invoice_Line_No = Sales_Invoice_Add_cha' +
        'rge.Invoice_line_no) AND (Sales_Invoice_Line.Sales_Invoice = Sal' +
        'es_Invoice_Add_charge.Sales_Invoice)) '
      #9#9'ON VC.Vat_Code = Sales_Invoice_Add_charge.Vat_Code'
      'WHERE Job_bag_Line_Dets.Job_Bag = :Job_bag'
      'GROUP BY Job_bag_Line_Dets.Job_Bag'
      ''
      '')
    Left = 472
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 544
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Reps_Branches.Rep, Rep.Name'
      'FROM Rep INNER JOIN Reps_Branches '
      #9#9'ON Rep.Rep = Reps_Branches.Rep'
      
        'WHERE ((Reps_Branches.Customer = :Customer) AND (Reps_Branches.B' +
        'ranch_no = :Branch_No)) AND'
      #9#9'((Rep.Inactive = '#39'N'#39') OR (Rep.Inactive IS NULL)) AND'
      '     (Reps_Branches.Is_Main_Rep = '#39'Y'#39')'
      'ORDER BY Reps_Branches.Is_Main_Rep DESC')
    Left = 544
    Top = 536
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
  object oldqryJBAllProcesses: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '    Job_Bag_Process.Job_Bag,'
      '    Job_Bag_Process.Process_no,'
      '    Job_Bag_Process.Process,'
      '    Process.Process_Description,'
      '    Job_Bag_Process.Paper_Size,'
      '    Paper_Size.Description as Paper_Size_Description,'
      '    Job_Bag_Process.Work_Centre_Group,'
      '    Work_Centre_Group.Work_Centre_Group_Name,'
      '    Job_Bag_Process.No_of_elements,'
      '    Job_Bag_Process.No_of_hours,'
      '    Job_Bag_Process.Quantity,'
      '    Job_Bag_Process.Simplex_or_Duplex,'
      '    Job_Bag_Process.Narrative,'
      '    Job_bag_Process.Paper_depth_mm,'
      '    Job_bag_process.Paper_width_mm'
      'from Job_Bag_Process, Process, Paper_Size, Work_Centre_Group'
      'where Job_Bag = :Job_Bag and'
      '      Job_Bag_Process.Process = Process.Process and'
      '      Job_bag_Process.Paper_Size = Paper_Size.Paper_Size and'
      
        '      Job_bag_Process.Work_Centre_Group = Work_centre_Group.Work' +
        '_centre_Group'
      'order by Job_Bag_Process.Process_No')
    Left = 280
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddProcess: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Job_bag_Process'
      '(Job_Bag,'
      'Process_no,'
      'Process,'
      'Paper_Size,'
      'Paper_Depth_mm,'
      'Paper_Width_mm,'
      'No_of_Elements,'
      'No_of_hours,'
      'Quantity,'
      'Work_Centre_Group,'
      'Simplex_Or_Duplex'
      ')'
      'values'
      '(:Job_Bag,'
      ':Process_no,'
      ':Process,'
      ':Paper_Size,'
      ':Paper_Depth_mm,'
      ':Paper_Width_mm,'
      ':No_of_Elements,'
      ':No_of_hours,'
      ':Quantity,'
      ':Work_Centre_Group,'
      ':Simplex_Or_Duplex'
      ')')
    Left = 88
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Paper_Size'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paper_Depth_mm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paper_Width_mm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_of_Elements'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_of_hours'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Work_Centre_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Simplex_Or_Duplex'
        ParamType = ptUnknown
      end>
  end
  object oldqryJBProcess: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '    Job_Bag_Process.Job_Bag,'
      '    Job_Bag_Process.Process_no,'
      '    Job_Bag_Process.Process,'
      '    Process.Process_Description,'
      '    Job_Bag_Process.Paper_Size,'
      '    Paper_Size.Description as Paper_Size_Description,'
      '    Job_Bag_Process.Work_Centre_Group,'
      '    Work_Centre_Group.Work_Centre_Group_Name,'
      '    Job_Bag_Process.No_of_elements,'
      '    Job_Bag_Process.No_of_hours,'
      '    Job_Bag_Process.Quantity,'
      '    Job_Bag_Process.Simplex_or_Duplex,'
      '    Job_Bag_Process.Narrative,'
      '    Job_bag_Process.Paper_depth_mm,'
      '    Job_bag_process.Paper_width_mm'
      'from Job_Bag_Process, Process, Paper_Size, Work_Centre_Group'
      'where Job_Bag = :Job_Bag and'
      '      Job_bag_Process.Process = :Process and'
      '      Job_Bag_Process.Process = Process.Process and'
      '      Job_bag_Process.Paper_Size = Paper_Size.Paper_Size and'
      
        '      Job_bag_Process.Work_Centre_Group = Work_centre_Group.Work' +
        '_centre_Group')
    Left = 160
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process'
        ParamType = ptUnknown
      end>
  end
  object qryJBAllSchedules: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '    Job_Bag_Schedule.*, Operator.Name as Operator_Name'
      'from Job_Bag_Schedule, Operator'
      'where Job_Bag = :Job_Bag and'
      'Job_bag_Schedule.Operator = Operator.Operator'
      'order by Job_Bag_Schedule.Schedule_No asc')
    Left = 40
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddSchedule: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Job_bag_Schedule'
      '(Job_Bag,'
      'Schedule_no,'
      'Operator,'
      'Date_Point,'
      'Artwork_Required,'
      'Artwork_Due_Date,'
      'Artwork_Proof_Date,'
      'Artwork_approval_Date,'
      'Data_Services_Required,'
      'Data_Required_Date,'
      'Brief_Required_Date,'
      'Text_Required_Date,'
      'Brief_Available_Date,'
      'Data_Available_Date,'
      'Text_Available_Date,'
      'Text_Proof_Date,'
      'PDF_Proof_Artwork_Date,'
      'PDF_Proof_Required_Date,'
      'PDF_Proof_Approval_Date,'
      'Proof_Required_Date,'
      'Proof_Approval_Date,'
      'Samples_Required,'
      'Sample_to_Client,'
      'Sample_Approval,'
      'Artwork_Due_Date_Act,'
      'Artwork_Proof_Date_Act,'
      'Artwork_approval_Date_Act,'
      'Data_Required_Date_Act,'
      'Brief_Required_Date_Act,'
      'Text_Required_Date_Act,'
      'Brief_Available_Date_Act,'
      'Data_Available_Date_Act,'
      'Text_Available_Date_Act,'
      'Text_Proof_Date_Act,'
      'PDF_Proof_Artwork_Date_Act,'
      'PDF_Proof_Required_Date_Act,'
      'PDF_Proof_Approval_Date_Act,'
      'Proof_Required_Date_Act,'
      'Proof_Approval_Date_Act,'
      'Sample_to_Client_Act,'
      'Sample_Approval_Act,'
      'Schedule_Approval_Type,'
      'Narrative'
      ')'
      'values'
      '(:Job_Bag,'
      ':Schedule_no,'
      ':Operator,'
      ':Date_Point,'
      ':Artwork_Required,'
      ':Artwork_Due_Date,'
      ':Artwork_Proof_Date,'
      ':Artwork_approval_Date,'
      ':Data_Services_Required,'
      ':Data_Required_Date,'
      ':Brief_Required_Date,'
      ':Text_Required_Date,'
      ':Brief_Available_Date,'
      ':Data_Available_Date,'
      ':Text_Available_Date,'
      ':Text_Proof_Date,'
      ':PDF_Proof_Artwork_Date,'
      ':PDF_Proof_Required_Date,'
      ':PDF_Proof_Approval_Date,'
      ':Proof_Required_Date,'
      ':Proof_Approval_Date,'
      ':Samples_Required,'
      ':Sample_to_Client,'
      ':Sample_Approval,'
      ':Artwork_Due_Date_Act,'
      ':Artwork_Proof_Date_Act,'
      ':Artwork_approval_Date_Act,'
      ':Data_Required_Date_Act,'
      ':Brief_Required_Date_Act,'
      ':Text_Required_Date_Act,'
      ':Brief_Available_Date_Act,'
      ':Data_Available_Date_Act,'
      ':Text_Available_Date_Act,'
      ':Text_Proof_Date_Act,'
      ':PDF_Proof_Artwork_Date_Act,'
      ':PDF_Proof_Required_Date_Act,'
      ':PDF_Proof_Approval_Date_Act,'
      ':Proof_Required_Date_Act,'
      ':Proof_Approval_Date_Act,'
      ':Sample_to_Client_Act,'
      ':Sample_Approval_Act,'
      ':Schedule_Approval_Type,'
      ':Narrative'
      ')')
    Left = 112
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Schedule_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Artwork_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Due_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_approval_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data_Services_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Available_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data_Available_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Available_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDF_Proof_Artwork_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDF_Proof_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDF_Proof_Approval_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Required_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Approval_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Samples_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_to_Client'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_Approval'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Due_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_Proof_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Artwork_approval_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data_Required_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Required_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Required_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Brief_Available_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data_Available_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Available_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Text_Proof_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDF_Proof_Artwork_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDF_Proof_Required_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDF_Proof_Approval_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Required_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Approval_Date_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_to_Client_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Sample_Approval_Act'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Schedule_Approval_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object qryJBSchedule: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '    Job_Bag_Schedule.*, Operator.Name as Operator_Name'
      'from Job_Bag_Schedule, Operator'
      'where Job_Bag = :Job_Bag and'
      '      Schedule_no = :Schedule_no and'
      'Job_bag_Schedule.Operator = Operator.Operator')
    Left = 200
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Schedule_no'
        ParamType = ptUnknown
      end>
  end
  object qryJBAllRequests: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Stock_Request.Job_Bag,'
      '        Job_Bag_Stock_Request.Request_no,'
      '        Job_Bag_Stock_Request.Sales_order,'
      '        Job_Bag_Stock_Request.Sales_Order_Line_no,'
      '        Job_Bag_Stock_Request.Included_in_Charges,'
      '        Sales_order_Line.Part,'
      '        Part.Part_Description,'
      '        Sales_order_Line.Quantity_Ordered,'
      '        Sales_order_Line.Quantity_Allocated,'
      '        Sales_order_Line.Quantity_Delivered,'
      '        Sales_order_Line.Quantity_Invoiced,'
      '        Sales_order_Line.Part_Sales_Price,'
      '        Sales_order_Line.Part_Cost,'
      '        Sales_order_Line.Purch_Pack_Quantity,'
      '        Sales_order_Line.Sell_Pack_Quantity,'
      '        Sales_order_Line.Vat_Code,'
      '        Sales_order.Sales_Order_Head_Status,'
      '        Sales_Order.Date_Ordered,'
      
        '        Sales_Order_Head_Status.Description as Status_Descriptio' +
        'n'
      
        'from Job_Bag_Stock_Request, Sales_Order_Line, Sales_Order, Part,' +
        ' Sales_Order_Head_Status'
      'where Job_Bag = :Job_Bag and'
      '('
      
        '(Job_Bag_Stock_Request.Sales_Order = Sales_order_Line.Sales_Orde' +
        'r) and'
      
        '(Job_Bag_Stock_Request.Sales_Order_Line_no = Sales_order_Line.Sa' +
        'les_Order_Line_no)'
      ') and'
      '(Sales_Order_line.Part = Part.Part) and'
      '(Sales_Order_line.Sales_order = Sales_Order.Sales_Order) and'
      
        '(Sales_order.Sales_Order_Head_Status = Sales_Order_Head_Status.S' +
        'ales_Order_Head_Status)'
      
        'ORDER BY Job_Bag_Stock_Request.Job_Bag, Job_Bag_Stock_Request.re' +
        'quest_no'
      '')
    Left = 40
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryJBRequest: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Stock_Request.Job_Bag,'
      '        Job_Bag_Stock_Request.Request_no,'
      '        Job_Bag_Stock_Request.Sales_order,'
      '        Job_Bag_Stock_Request.Sales_Order_Line_no,'
      '        Sales_order_Line.Part,'
      '        Part.Part_Description,'
      '        Sales_order_Line.Quantity_Ordered,'
      '        Sales_order_Line.Quantity_Allocated,'
      '        Sales_order_Line.Quantity_Delivered,'
      '        Sales_order_Line.Quantity_Invoiced,'
      '        Sales_order_Line.Part_Sales_Price,'
      '        Sales_order_Line.Part_Cost,'
      '        Sales_order_Line.Purch_Pack_Quantity,'
      '        Sales_order_Line.Sell_Pack_Quantity,'
      '        Sales_order_Line.Vat_Code,'
      '        Sales_order.Sales_Order_Head_Status,'
      '        Sales_Order.Date_Ordered,'
      
        '        Sales_Order_Head_Status.Description as Status_Descriptio' +
        'n'
      
        'from Job_Bag_Stock_Request, Sales_Order_Line, Sales_Order, Part,' +
        ' Sales_Order_Head_Status'
      'where Job_Bag = :Job_Bag and'
      'Request_no = :Request_No and'
      '('
      
        '(Job_Bag_Stock_Request.Sales_Order = Sales_order_Line.Sales_Orde' +
        'r) and'
      
        '(Job_Bag_Stock_Request.Sales_Order_Line_no = Sales_order_Line.Sa' +
        'les_Order_Line_no)'
      ') and'
      '(Sales_Order_line.Part = Part.Part) and'
      '(Sales_Order_line.Sales_order = Sales_Order.Sales_Order) and'
      
        '(Sales_order.Sales_Order_Head_Status = Sales_Order_Head_Status.S' +
        'ales_Order_Head_Status)')
    Left = 200
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Request_No'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddRequest: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Stock_Request'
      '(Job_Bag,'
      'Request_no,'
      'Sales_order,'
      'Sales_Order_Line_No,'
      'Included_in_Charges'
      ')'
      'Values'
      '('
      ':Job_Bag,'
      ':Request_no,'
      ':Sales_order,'
      ':Sales_Order_Line_No,'
      ':Included_in_Charges'
      ')')
    Left = 120
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Request_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Included_in_Charges'
        ParamType = ptUnknown
      end>
  end
  object qryAddSOJBLine: TQuery
    DatabaseName = 'PB'
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
    Left = 287
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order_line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Sell'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'VAT_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Currency_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sequence_no'
        ParamType = ptUnknown
      end>
  end
  object qryAllPurchInvoices: TQuery
    OnCalcFields = qryAllPurchInvoicesCalcFields
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '
      #9'Supplier.Name AS Supplier_Name, '
      #9'Supplier_Invoice.Supplier_Invoice, '
      #9'Supplier_Invoice.Supplier_Invoice_no, '
      #9'Supplier_Invoice.Invoice_Date, '
      #9'Supplier_Invoice.Supp_Inv_Alt_Ref, '
      #9'Supplier_Invoice.Invoice_or_Credit, '
      #9'Supplier_Invoice_Line.Purchase_order, '
      #9'(SELECT DISTINCT JBLD.Job_Bag'
      #9#9' FROM Job_Bag_Line_Dets AS JBLD'
      
        #9#9' WHERE JBLD.Purchase_Order = Supplier_Invoice_Line.Purchase_Or' +
        'der AND'
      #9#9#9#9'JBLD.Line = Supplier_Invoice_Line.Line) AS Job_Bag,'
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'Supplier_Invoice_Line.Goods_Value'
      #9'ELSE'
      
        #9'     ((Supplier_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Su' +
        'pplier_Invoice_Line.Goods_Value)'
      #9'END) as Goods_Value,'
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'(Supplier_Invoice_Line.Goods_Value*(Vat_Code.Vat_rate/100))'
      #9'ELSE'
      
        #9'     (((Supplier_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*S' +
        'upplier_Invoice_Line.Goods_Value)*(Vat_Code.Vat_rate/100))'
      #9'END) as Vat_Value,'
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'Supplier_Invoice_Line.Goods_Value +'
      #9#9'(Supplier_Invoice_Line.Goods_Value*(Vat_Code.Vat_rate/100))'
      #9'ELSE'
      
        #9'     ((Supplier_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Su' +
        'pplier_Invoice_Line.Goods_Value) + '
      
        #9'     (((Supplier_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*S' +
        'upplier_Invoice_Line.Goods_Value)*(Vat_Code.Vat_rate/100))'
      #9'END) as Total_Value'
      'FROM (Supplier '
      #9#9'INNER JOIN Supplier_Branch '
      #9#9#9'ON Supplier.Supplier = Supplier_Branch.Supplier) '
      #9#9'INNER JOIN (Price_Unit '
      #9#9'INNER JOIN (Job_Bag_Line_Dets '
      #9#9'RIGHT JOIN (Supplier_Invoice '
      #9#9'INNER JOIN (Vat_Code '
      #9#9'INNER JOIN Supplier_Invoice_Line '
      #9#9#9'ON Vat_Code.Vat_Code = Supplier_Invoice_Line.Vat_Code) '
      
        #9#9#9'ON Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Line.' +
        'Supplier_Invoice) '
      
        #9#9#9'ON (Job_Bag_Line_Dets.Job_Bag_Line = Supplier_Invoice_Line.Jo' +
        'b_Bag_Line) '
      
        #9#9#9'AND (Job_Bag_Line_Dets.Job_Bag = Supplier_Invoice_Line.Job_Ba' +
        'g)) '
      #9#9#9'ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit) '
      #9#9#9'ON (Supplier_Branch.Branch_no = Supplier_Invoice.Branch_no) '
      #9#9#9'AND (Supplier_Branch.Supplier = Supplier_Invoice.Supplier)'
      'WHERE Supplier_Invoice_Line.Job_Bag = :Job_Bag OR'
      #9#9'((SELECT DISTINCT JBLD.Job_Bag'
      #9#9' FROM Job_Bag_Line_Dets AS JBLD'
      
        #9#9' WHERE JBLD.Purchase_Order = Supplier_Invoice_Line.Purchase_Or' +
        'der AND'
      #9#9#9#9'JBLD.Line = Supplier_Invoice_Line.Line) = :Job_Bag)'
      'GROUP BY'
      #9'Supplier.Name,'
      '  Supplier_Invoice.Supplier_Invoice,'
      #9'Supplier_Invoice.Supplier_Invoice_no,'
      #9'Supplier_Invoice.Invoice_Date,'
      #9'Supplier_Invoice.Supp_Inv_Alt_Ref,'
      #9'Supplier_Invoice.Invoice_or_Credit,'
      '  Supplier_invoice_line.Purchase_order,'
      '  Supplier_Invoice_Line.Line'
      ''
      ''
      '')
    Left = 288
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
    object qryAllPurchInvoicesSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryAllPurchInvoicesSupplier_Invoice: TIntegerField
      FieldName = 'Supplier_Invoice'
    end
    object qryAllPurchInvoicesSupplier_Invoice_no: TStringField
      FieldName = 'Supplier_Invoice_no'
      FixedChar = True
      Size = 40
    end
    object qryAllPurchInvoicesInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qryAllPurchInvoicesSupp_Inv_Alt_Ref: TStringField
      FieldName = 'Supp_Inv_Alt_Ref'
      FixedChar = True
      Size = 40
    end
    object qryAllPurchInvoicesInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qryAllPurchInvoicesPurchase_order: TFloatField
      FieldName = 'Purchase_order'
    end
    object qryAllPurchInvoicesJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryAllPurchInvoicesGoods_Value: TFloatField
      FieldName = 'Goods_Value'
    end
    object qryAllPurchInvoicesVat_Value: TFloatField
      FieldName = 'Vat_Value'
    end
    object qryAllPurchInvoicesTotal_Value: TFloatField
      FieldName = 'Total_Value'
    end
    object qryAllPurchInvoicesTotal_Goods: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total_Goods'
      currency = False
      Calculated = True
    end
    object qryAllPurchInvoicesTotal_Vat: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Vat'
      Calculated = True
    end
    object qryAllPurchInvoicesTotal_Invoice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Invoice'
      Calculated = True
    end
  end
  object srcAllPurchInvoices: TDataSource
    DataSet = qryAllPurchInvoices
    Left = 384
    Top = 424
  end
  object qryQHeader: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT'
      '      Quote.Quote,'
      '      Quote.Description,'
      '      Quote.Descriptive_Reference,'
      '      Customer.Name as Cust_Name,'
      '      Customer.Customer_is_Acquired,'
      '      Quote.Customer_Name,'
      '      Quote.Date_Point,'
      '      Quote.Quote_Required_By,'
      '      Quote.Date_Start,'
      '      '#39#39' as Branch_Name,'
      '      Quote.Customer,'
      '      Quote.Branch_No,'
      '      Quote.End_User_Customer,'
      '      Quote.End_User_Branch_No,'
      '      (select Customer.Name'
      '       from Customer'
      
        '       where Customer.Customer = Quote.End_User_Customer) as End' +
        '_User_Customer_Name,'
      '      Quote.Ad_hoc_Address,'
      '      Quote.Contact_no,'
      '      Quote.Date_Required,'
      '      Quote.Office_Contact,'
      '      Quote.Quantity,'
      '      Quote.Rep,'
      '      Quote.Sub_Rep,'
      '      Quote.Inactive,'
      '      Quote.Operator,'
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
      '      Quote.Price_Unit,'
      '      (select Name'
      '      from Operator'
      
        '      where Operator.Operator = Office_Contact) as Office_Contac' +
        't_Name'
      'FROM (Operator'
      '        INNER JOIN (Rep'
      '        INNER JOIN (Price_Unit'
      '        INNER JOIN (Quote_Status'
      
        '        INNER JOIN Quote ON Quote_Status.Quote_Status = Quote.Qu' +
        'ote_Status)'
      '          ON Price_unit.Price_unit = Quote.Price_Unit)'
      '          ON Rep.Rep = Quote.Rep)'
      '          ON Operator.Operator = Quote.Office_Contact)'
      '        LEFT JOIN Customer ON Quote.Customer = Customer.Customer'
      'WHERE'
      '  (Quote.Quote = :Quote)')
    Left = 664
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQAllLines: TQuery
    DatabaseName = 'PB'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT'
      '  Quote_Line.Quote,'
      '  Quote_Line.Quote_Line_No,'
      '  Quote_Line.Quote_Line_Description,'
      '  Quote_Line.Unit_Cost,'
      '  Quote_Line.Unit_Price,'
      '  Quote_Line.Unit_SSP,'
      '  Quote_Line.Quantity,'
      '  Quote_line.Price_Unit,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Price_Unit.Description as Price_Unit_Description,'
      '  Quote_Line.Product_Type,'
      '  Product_Type.Category,'
      '  Product_Type.Description as Product_Type_Description,'
      '  Quote_Line.Sequence_no,'
      '  Quote_Line.Line_Converted,'
      '  Quote_Line.Reseller_Price,'
      '  Quote_Line.Unit_Cost_plus_OHD,'
      '  Quote_Line.Unit_SSP_Original,'
      '  Quote_Line.Line_Is_Internal_Cost,'
      '  Quote_Line.Quote_Cost_Markup_Perc,'
      '  ISNULL(Quote_Line.Vat_Code,-1) as Vat_Code'
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
    Left = 664
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddSupply: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Supply'
      '('
      '    Job_Bag,'
      '    Job_Bag_Supply_no,'
      '    Enquiry,'
      '    Line,'
      '    Line_Converted,'
      '    Quantity'
      ')'
      'values'
      '(   :Job_Bag,'
      '    :Job_Bag_Supply_no,'
      '    :Enquiry,'
      '    :Line,'
      '    :Line_Converted,'
      '    :Quantity'
      ')')
    Left = 464
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Supply_no'
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
      end>
  end
  object qryJBSupply: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '    Job_Bag_Supply.Job_Bag,'
      '    Job_Bag_Supply.Job_Bag_Supply_no,'
      '    Job_Bag_Supply.Enquiry,'
      '    Job_Bag_Supply.Line,'
      '    Job_Bag_Supply.Line_Converted,'
      '    Job_Bag_Supply.Quantity,'
      '    EnquiryLine.Form_Description'
      'from Job_Bag_Supply, EnquiryLine'
      'where Job_Bag = :Job_Bag and'
      '      Job_Bag_Supply_no = :Job_Bag_Supply_No AND'
      '      ('
      '      (Job_Bag_Supply.Enquiry = EnquiryLine.Enquiry) and'
      '      (Job_Bag_Supply.Line = EnquiryLine.Line)'
      '      )')
    Left = 544
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Supply_No'
        ParamType = ptUnknown
      end>
  end
  object qryJBAllSupplies: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '    Job_Bag_Supply.Job_Bag,'
      '    Job_Bag_Supply.Job_Bag_Supply_no,'
      '    Job_Bag_Supply.Enquiry,'
      '    Job_Bag_Supply.Line,'
      '    Job_Bag_Supply.Line_Converted,'
      '    Job_Bag_Supply.Quantity,'
      '    EnquiryLine.Form_Description,'
      '    EnquiryLine.Product_Type,'
      '    Enquiry_LineQuantity.Price_Unit,'
      '    Enquiry_LineQuantity.Supplier_Price,'
      '    Enquiry_LineQuantity.Quotation_Price,'
      '    Price_Unit.Price_Unit_Factor,'
      '    Price_Unit.Description as Price_Unit_Description,'
      '    Product_Type.Description as Product_Type_Description'
      
        'from Job_Bag_Supply, EnquiryLine, Enquiry_LineQuantity, Price_Un' +
        'it, Product_type'
      'where Job_bag = :Job_Bag and'
      '      ('
      '      (Job_Bag_Supply.Enquiry = EnquiryLine.Enquiry) and'
      '      (Job_Bag_Supply.Line = EnquiryLine.Line)'
      '      ) and'
      '      ('
      
        '      (Job_Bag_Supply.Enquiry = Enquiry_LineQuantity.Enquiry) an' +
        'd'
      '      (Job_Bag_Supply.Line = Enquiry_LineQuantity.Line) and'
      '      (Job_Bag_Supply.Quantity = Enquiry_LineQuantity.Quantity)'
      '      ) and'
      
        '      (Enquiry_LineQuantity.Price_Unit = Price_unit.Price_Unit) ' +
        'and'
      '      (EnquiryLine.Product_Type = Product_Type.Product_Type)'
      'order by Job_Bag_Supply.Job_Bag_Supply_No')
    Left = 392
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryQAllSupplies: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '    Quote_Supply.Quote,'
      '    Quote_Supply.Quote_Supply_no,'
      '    Quote_Supply.Enquiry,'
      '    Quote_Supply.Line,'
      '    Quote_Supply.Line_Converted,'
      '    Quote_Supply.Quantity,'
      '    EnquiryLine.Form_Description,'
      '    EnquiryLine.Product_Type,'
      '    Enquiry_LineQuantity.Price_Unit,'
      '    Enquiry_LineQuantity.Supplier_Price,'
      '    Enquiry_LineQuantity.Quotation_Price,'
      '    Price_Unit.Price_Unit_Factor,'
      '    Price_Unit.Description as Price_Unit_Description,'
      '    Product_Type.Description as Product_Type_Description'
      
        'from Quote_Supply, EnquiryLine, Enquiry_LineQuantity, Price_Unit' +
        ', Product_type'
      'where Quote = :Quote and'
      '      ('
      '      (Quote_Supply.Enquiry = EnquiryLine.Enquiry) and'
      '      (Quote_Supply.Line = EnquiryLine.Line)'
      '      ) and'
      '      ('
      '      (Quote_Supply.Enquiry = Enquiry_LineQuantity.Enquiry) and'
      '      (Quote_Supply.Line = Enquiry_LineQuantity.Line) and'
      '      (Quote_Supply.Quantity = Enquiry_LineQuantity.Quantity)'
      '      ) and'
      
        '      (Enquiry_LineQuantity.Price_Unit = Price_unit.Price_Unit) ' +
        'and'
      '      (EnquiryLine.Product_Type = Product_Type.Product_Type)'
      'order by Quote_Supply.Quote_Supply_No')
    Left = 616
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryJBHeadTechXML: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       Job_Bag.Job_Bag as "tg:job_id",'
      '       Job_Bag.Job_Bag_Descr as "tg:job_description",'
      '       Job_Bag.Quantity as "tg:order_qty",'
      '       '#39'EN'#39' as "tg:finishing_style",'
      '       297 as "tg:depth",'
      '       210 as "tg:width",'
      '       0 as "tg:cover_pagination",'
      '       2 as "tg:text_pagination",'
      
        '       CONVERT(nvarchar(10),Job_Bag.Goods_Required,20) as "tg:de' +
        'livery_commence_date",'
      
        '       CONVERT(nvarchar(10),Job_Bag.Goods_Required,20) as "tg:de' +
        'livery_complete_date",'
      '       '#39'BR'#39' as "tg:job_site",'
      '       '#39'BR'#39' as "tg:managing_printer",'
      '       '#39'true'#39' as "tg:is_managing_printer",'
      '       Job_Bag.Cust_Order_no as "tg:cust_order_ref",'
      '       Customer.Customer as "tg:cust_code",'
      '       --Next line is an attribute of Customer Code'
      
        '       '#39'tg:cust_contact_code="'#39'+Customer_Contact.email+'#39'"'#39' as "A' +
        'T_tg:cust_contact",'
      '       AM.Name as "tg:site_cce_name",'
      '       AM.Phone as "tg:site_cce_phone",'
      '       AM.Mobile_no as "tg:site_cce_mobile",'
      '       AM.Email as "tg:site_cce_email",'
      '       Rep.Name as "tg:sales_person_name",'
      '       Rep.Phone as "tg:sales_person_phone",'
      '       Rep.mobile_no as "tg:sales_person_mobile",'
      '       Rep.email as "tg:sales_person_email"'
      
        'FROM Customer_Contact, Job_Bag, Customer, Job_Bag_Status, Rep, O' +
        'perator, Operator AM'
      'WHERE (Job_Bag.Job_Bag = :Job_Bag) AND'
      '      (Job_Bag.Customer = Customer.Customer) AND'
      '      ((Job_Bag.Branch_No = Customer_Contact.Branch_No) AND'
      '      (Job_bag.Customer = Customer_Contact.Customer) AND'
      '      (Job_bag.Contact_no = Customer_Contact.Contact_no)) and'
      
        '      (Job_Bag.Job_bag_Status = Job_Bag_Status.Job_Bag_Status) A' +
        'ND'
      '      (Job_Bag.Rep = Rep.Rep) AND'
      '      (Job_Bag.Operator = Operator.Operator) and'
      '      (Job_Bag.Office_Contact = AM.Operator)')
    Left = 656
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryJBProcessTechXML: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select  (Works_Order_Process.Process_no-1) as "tg:post_press_ver' +
        'sion_op_id",'
      '        '#39'COMM'#39' as "tg:version_code",'
      '        Process.Short_Desc as "tg:post_press_resource_type",'
      '        '#39'true'#39' as "tg:task_info",'
      
        '        CAST(Job_Bag_Works_Order.Job_Bag as nvarchar) + '#39'-'#39' + CA' +
        'ST((Works_Order_Process.Process_no-1) as nvarchar) + '#39'COMM'#39' as "' +
        'tg:task_sub_job_id",'
      '        0 as "tg:task_seq_id",'
      '        Process.Process_Description as "tg:task_description",'
      '        Works_Order_Process.Quantity as "tg:task_qty_rqd",'
      '        0 as "tg:task_resource_id",'
      '        0 as "tg:task_mr_mins",'
      '        0 as "tg:task_run_mins",'
      '        0 as "tg:task_run_speed",'
      '        LTRIM('
      '        CAST(Works_Order_Process.Number_Up as nvarchar) +'
      #9'      case'
      
        '          when (select Number_type_short_desc from Process_Numbe' +
        'r_type where Process_Number_type.Number_type = Process.Number_Ty' +
        'pe) <> '#39#39' then'
      
        '              '#39' '#39' + (select Number_type_short_desc from Process_' +
        'Number_type where Process_Number_type.Number_type = Process.Numb' +
        'er_Type) + '#39' '#39
      '        else'
      '          '#39' up '#39
      '        end +'
      '        (select Paper_Size.Short_Description'
      '         from Paper_Size'
      
        '         where Paper_Size.Paper_Size = Works_Order_Process.Paper' +
        '_Size) + '#39' '#39' +'
      '        Works_Order_Process.Custom_Paper_Size + '#39' '#39' + '
      '        case'
      '        when Works_Order_Process.Laser_Format = '#39'S'#39' then'
      '          '#39'Simplex '#39
      '        when Works_Order_Process.Laser_Format = '#39'D'#39' then'
      '          '#39'Duplex '#39
      '        else'
      '          '#39#39
      '        end +'
      '        + '#39' '#39' +'
      
        '        '#39'(Commence: '#39' + CONVERT(nvarchar(10),Works_Order_Process' +
        '.Target_Receipt_Date,3) + '#39')'#39') as "tg:task_notes",'
      '        Works_Order_Process.Number_Up as "tg:task_no_up",'
      
        '        CONVERT(nvarchar(10),Works_Order_Process.Target_Receipt_' +
        'Date,20) as "tg:task_deadline_date_time",'
      '        0.0 as "tg:task_pdt"'
      'from  Job_Bag_Works_Order,'
      '      Works_Order_Process,'
      '      Process'
      'where Job_Bag_Works_Order.Job_Bag = :Job_Bag and'
      '      Job_Bag_Works_Order.Works_Order = :Works_Order and'
      '      Process.Short_Desc <> '#39#39' and'
      
        '      Job_Bag_Works_Order.Works_Order = Works_Order_Process.Work' +
        's_Order and'
      '      Works_Order_Process.Process = Process.Process')
    Left = 656
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Works_Order'
        ParamType = ptUnknown
      end>
  end
  object qryJBMasterTechXML: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       '#39#39' as "tg:version_id",'
      '       '#39'COMM'#39' as "tg:version_code",'
      '       '#39'true'#39' as "tg:version_common",'
      '       '#39'true'#39' as "tg:version_finished",'
      '       '#39'Common'#39' as "tg:version_description",'
      '       Job_Bag.Quantity as "tg:version_nett_qty",'
      '       0 as "tg:version_special_qty"'
      'FROM Job_Bag'
      'WHERE (Job_Bag.Job_Bag = :Job_Bag)')
    Left = 656
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetJBProdStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Job_Bag_Production_Status'
      'where Job_Bag_Production_Status = :Job_Bag_Production_Status')
    Left = 552
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Production_Status'
        ParamType = ptUnknown
      end>
  end
  object qryAllProcesses: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Process.*, Process_Group.*'
      'from Process, Process_Group'
      'where Process.Process_Group = Process_Group.Process_Group and'
      '((Process.Inactive is NULL) or (Process.Inactive = '#39'N'#39'))'
      'order by Process_Group.Sequence_No')
    Left = 32
    Top = 320
  end
  object qryJBProcess: TQuery
    DatabaseName = 'PB'
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
      '    Job_bag_process.Paper_width_mm'
      'from Job_Bag_Process, Process'
      'where Job_Bag = :Job_Bag and'
      '      Job_bag_Process.Process = :Process and'
      '      Job_Bag_Process.Process = Process.Process')
    Left = 208
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process'
        ParamType = ptUnknown
      end>
  end
  object OldqryJBProcessTechXML: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select  (Works_Order_Process.Process_no-1) as "tg:post_press_ver' +
        'sion_op_id",'
      '        '#39'COMM'#39' as "tg:version_code",'
      '        Process.Short_Desc as "tg:post_press_resource_type",'
      '        '#39'true'#39' as "tg:task_info",'
      
        '        CAST(Job_Bag_Works_Order.Job_Bag as nvarchar) + '#39'-'#39' + CA' +
        'ST((Works_Order_Process.Process_no-1) as nvarchar) + '#39'COMM'#39' as "' +
        'tg:task_sub_job_id",'
      '        0 as "tg:task_seq_id",'
      '        Process.Process_Description as "tg:task_description",'
      '        Works_Order_Process.Quantity as "tg:task_qty_rqd",'
      '        0 as "tg:task_resource_id",'
      '        0 as "tg:task_mr_mins",'
      '        0 as "tg:task_run_mins",'
      '        0 as "tg:task_run_speed",'
      '        LTRIM(case'
      '        when Works_Order_Process.Laser_Format = '#39'S'#39' then'
      '          '#39'Simplex '#39
      '        when Works_Order_Process.Laser_Format = '#39'D'#39' then'
      '          '#39'Duplex '#39
      '        else'
      '          '#39#39
      '        end +'
      '        + '#39' '#39' +'
      '        (select Paper_Size.Short_Description'
      '         from Paper_Size'
      
        '         where Paper_Size.Paper_Size = Works_Order_Process.Paper' +
        '_Size) + '#39' '#39' +'
      
        '        Works_Order_Process.Custom_Paper_Size + '#39' '#39' + CAST(Works' +
        '_Order_Process.Number_Up as nvarchar) + '#39' up '#39' + '#39'(Commence: '#39' +' +
        ' CONVERT(nvarchar(10),Works_Order_Process.Target_Receipt_Date,3)' +
        ' + '#39')'#39') as "tg:task_notes",'
      '        Works_Order_Process.Number_Up as "tg:task_no_up",'
      
        '        CONVERT(nvarchar(10),Works_Order_Process.Target_Receipt_' +
        'Date,20) as "tg:task_deadline_date_time",'
      '        0.0 as "tg:task_pdt"'
      'from  Job_Bag_Works_Order,'
      '      Works_Order_Process,'
      '      Process'
      'where Job_Bag_Works_Order.Job_Bag = :Job_Bag and'
      '      Job_Bag_Works_Order.Works_Order = :Works_Order and'
      '      Process.Short_Desc <> '#39#39' and'
      
        '      Job_Bag_Works_Order.Works_Order = Works_Order_Process.Work' +
        's_Order and'
      '      Works_Order_Process.Process = Process.Process')
    Left = 656
    Top = 600
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Works_Order'
        ParamType = ptUnknown
      end>
  end
  object qryJBSILines: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from sales_invoice_line'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_line = :Job_Bag_line')
    Left = 632
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_line'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustCC: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_CostCentre'
      'where Customer = :Customer and '
      'Cost_centre = :Cost_Centre')
    Left = 568
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end>
  end
  object qryGetBranchCC: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Branch_CostCentre'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no and '
      'Cost_centre = :Cost_Centre')
    Left = 640
    Top = 160
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
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end>
  end
  object qryDataCollect: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Time_Log.Job_Bag_Time_Log,'
      #9'Job_Bag_Time_Log.Date_Point,'
      #9'Job_Bag_Time_Log.Work_Centre_Operator,'
      #9'Work_Centre_Operator.Name as WC_Operator_Name,'
      #9'Job_Bag_Time_Log.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'Job_Bag_Time_Log.Process,'
      #9'Process.Process_Description,'
      #9'Job_Bag_Time_Log.Work_Centre,'
      '  Work_Centre.Work_Centre_Name,'
      #9'Job_Bag_Time_Log.Operation,'
      #9'Process_Operation.Operation_Description,'
      #9'Job_Bag_Time_Log.Paper_Size,'
      #9'Paper_Size.Description as Paper_Size_Description,'
      #9'Job_Bag_Time_Log.Number_Up,'
      #9'Job_Bag_Time_Log.Quantity,'
      #9'Job_Bag_Time_Log.Laser_Format,'
      #9'Job_Bag_Time_Log.Labour_Time_From,'
      #9'Job_Bag_Time_Log.Labour_Time_To,'
      #9'Job_Bag_Time_Log.Labour_Hours,'
      #9'Job_Bag_Time_Log.Machine_Hours,'
      #9'Job_Bag_Time_Log.Labour_Overtime_Hours,'
      #9'Job_Bag_Time_Log.Team_Count,'
      '  Job_bag_Time_Log.Hourly_Rate'
      'FROM Work_Centre'
      '      RIGHT JOIN (Paper_Size'
      '      RIGHT JOIN (Process'
      '      INNER JOIN (Process_Operation'
      '      INNER JOIN (Process_Group'
      '      INNER JOIN (Work_Centre_Operator'
      '      INNER JOIN Job_Bag_Time_Log'
      
        '        ON Work_Centre_Operator.Work_Centre_Operator = Job_Bag_T' +
        'ime_Log.Work_Centre_Operator)'
      
        '        ON Process_Group.Process_Group = Job_Bag_Time_Log.Proces' +
        's_Group)'
      
        '        ON (Process_Operation.Operation = Job_Bag_Time_Log.Opera' +
        'tion) AND (Process_Operation.Process = Job_Bag_Time_Log.Process)' +
        ')'
      '        ON Process.Process = Process_Operation.Process)'
      '        ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size)'
      
        '        ON Work_Centre.Work_Centre = Job_Bag_Time_Log.Work_Centr' +
        'e'
      'WHERE Job_Bag_Time_Log.Job_Bag = :Job_Bag AND'
      
        '      ((Job_bag_time_log.Process_Group = :Process_Group) or (0 =' +
        ' :Process_Group))'
      'ORDER BY Job_Bag_Time_Log.Date_Point')
    Left = 288
    Top = 640
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Process_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Process_Group'
        ParamType = ptUnknown
      end>
    object qryDataCollectJob_Bag_Time_Log: TIntegerField
      FieldName = 'Job_Bag_Time_Log'
      Origin = 'PB.Job_Bag_Time_Log.Job_Bag_Time_Log'
    end
    object qryDataCollectDate_Point: TDateTimeField
      FieldName = 'Date_Point'
      Origin = 'PB.Job_Bag_Time_Log.Date_Point'
    end
    object qryDataCollectWork_Centre_Operator: TIntegerField
      FieldName = 'Work_Centre_Operator'
      Origin = 'PB.Job_Bag_Time_Log.Work_Centre_Operator'
    end
    object qryDataCollectWC_Operator_Name: TStringField
      FieldName = 'WC_Operator_Name'
      Origin = 'PB.Work_Centre_Operator.Name'
      FixedChar = True
      Size = 100
    end
    object qryDataCollectProcess_Group: TIntegerField
      FieldName = 'Process_Group'
      Origin = 'PB.Job_Bag_Time_Log.Process_Group'
    end
    object qryDataCollectProcess_Group_Description: TStringField
      FieldName = 'Process_Group_Description'
      Origin = 'PB.Process_Group.Process_Group_Description'
      FixedChar = True
      Size = 100
    end
    object qryDataCollectProcess: TIntegerField
      FieldName = 'Process'
      Origin = 'PB.Job_Bag_Time_Log.Process'
    end
    object qryDataCollectProcess_Description: TStringField
      FieldName = 'Process_Description'
      Origin = 'PB.Process.Process_Description'
      FixedChar = True
      Size = 100
    end
    object qryDataCollectWork_Centre: TIntegerField
      FieldName = 'Work_Centre'
      Origin = 'PB.Job_Bag_Time_Log.Work_Centre'
    end
    object qryDataCollectWork_Centre_Name: TStringField
      FieldName = 'Work_Centre_Name'
      Origin = 'PB.Work_Centre.Work_Centre_Name'
      FixedChar = True
      Size = 100
    end
    object qryDataCollectOperation: TIntegerField
      FieldName = 'Operation'
      Origin = 'PB.Job_Bag_Time_Log.Operation'
    end
    object qryDataCollectOperation_Description: TStringField
      FieldName = 'Operation_Description'
      Origin = 'PB.Process_Operation.Operation_Description'
      FixedChar = True
      Size = 100
    end
    object qryDataCollectPaper_Size: TIntegerField
      FieldName = 'Paper_Size'
      Origin = 'PB.Job_Bag_Time_Log.Paper_Size'
    end
    object qryDataCollectPaper_Size_Description: TStringField
      FieldName = 'Paper_Size_Description'
      Origin = 'PB.Paper_Size.Description'
      FixedChar = True
      Size = 60
    end
    object qryDataCollectNumber_Up: TIntegerField
      FieldName = 'Number_Up'
      Origin = 'PB.Job_Bag_Time_Log.Number_Up'
    end
    object qryDataCollectQuantity: TFloatField
      FieldName = 'Quantity'
      Origin = 'PB.Job_Bag_Time_Log.Quantity'
    end
    object qryDataCollectLaser_Format: TStringField
      FieldName = 'Laser_Format'
      Origin = 'PB.Job_Bag_Time_Log.Laser_Format'
      FixedChar = True
      Size = 2
    end
    object qryDataCollectLabour_Time_From: TDateTimeField
      FieldName = 'Labour_Time_From'
      Origin = 'PB.Job_Bag_Time_Log.Labour_Time_From'
    end
    object qryDataCollectLabour_Time_To: TDateTimeField
      FieldName = 'Labour_Time_To'
      Origin = 'PB.Job_Bag_Time_Log.Labour_Time_To'
    end
    object qryDataCollectLabour_Hours: TFloatField
      FieldName = 'Labour_Hours'
      Origin = 'PB.Job_Bag_Time_Log.Labour_Hours'
      DisplayFormat = '##0.00'
    end
    object qryDataCollectMachine_Hours: TFloatField
      FieldName = 'Machine_Hours'
      Origin = 'PB.Job_Bag_Time_Log.Machine_Hours'
      DisplayFormat = '##0.00'
    end
    object qryDataCollectLabour_Overtime_Hours: TFloatField
      FieldName = 'Labour_Overtime_Hours'
      Origin = 'PB.Job_Bag_Time_Log.Labour_Overtime_Hours'
      DisplayFormat = '##0.00'
    end
    object qryDataCollectTeam_Count: TIntegerField
      FieldName = 'Team_Count'
      Origin = 'PB.Job_Bag_Time_Log.Team_Count'
    end
    object qryDataCollectHourly_Rate: TFloatField
      FieldName = 'Hourly_Rate'
      Origin = 'PB.Job_Bag_Time_Log.Hourly_Rate'
      DisplayFormat = '##0.00'
    end
  end
  object srcDataCollect: TDataSource
    DataSet = qryDataCollect
    Left = 392
    Top = 640
  end
  object qryDepartments: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Process_Group'
      'Order By Sequence_no')
    Left = 472
    Top = 640
  end
  object qryGetDataCollectTotals: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Time_Log.Job_Bag,'
      '      Sum(Labour_Hours) as Total_Labour,'
      '      sum(Labour_Overtime_Hours) as Total_Overtime,'
      '      sum(Machine_Hours) as Total_Machine'
      'from Job_Bag_Time_Log'
      'where Job_Bag_Time_Log.Job_Bag = :Job_Bag and'
      '      ((Process_Group = :Process_Group) or (:Process_Group = 0))'
      'GROUP BY Job_Bag_Time_Log.Job_Bag')
    Left = 192
    Top = 648
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process_Group'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerContact: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer_Contact.Name,'
      'Contact_info.Account_Number'
      'from Customer_Contact, Contact_Info'
      'where Customer_Contact.Customer = :Customer and'
      'Customer_Contact.Branch_no = :Branch_no and'
      'Contact_No = :Contact_No and'
      '(Customer_Contact.Contact_Info = Contact_Info.Contact_info)')
    Left = 656
    Top = 216
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
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object qryUpdQuoteStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where Quote = :Quote')
    Left = 664
    Top = 280
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
  object qryJBUpdQuoteStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Quote'
      'set Quote_Status = :Quote_Status'
      'from Job_bag_line_dets'
      'where Job_bag_line_dets.Job_bag = :Job_Bag and'
      'job_bag_line_dets.quote = quote.quote')
    Left = 552
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerPrices: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Cost'
      'where Customer = :Customer')
    Left = 464
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryJBAllNonConforms: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      #9'Job_Bag_Non_Conform.Date_Point, '
      #9'Job_Bag_Non_Conform.Job_Bag, '
      #9'Job_Bag_Non_Conform.Operator, '
      #9'Operator.Name as Operator_Name, '
      #9'Job_Bag_Non_Conform.Raised_By_Dept,'
      #9'Raised_By_Dept.Non_Conform_Dept_Descr as Raised_by_dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Dept,'
      #9'Job_Bag_Non_Conform.Non_Conform_Category,'
      #9'(select Non_Conform_Category.Non_Conform_Category_Descr'
      '   from Non_Conform_Category'
      
        '   where Non_Conform_Category.Non_Conform_Category = Job_Bag_Non' +
        '_Conform.Non_Conform_Category) as Non_Conform_Category_Descr,'
      #9'Non_Conform_Dept.Non_Conform_Dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Type,'
      #9'Non_Conform_Type.Non_Conform_Type_Descr,'
      #9'Job_Bag_Non_Conform.QA_Operator,'
      #9'QA_Operator.QA_Operator_Name,'
      #9'Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      #9'Job_Bag_Non_Conform.Total_Cost,'
      '  Job_Bag_Non_Conform.Total_Cost_to_Client,'
      '  Job_Bag_Non_Conform.Inactive,'
      '  Job_Bag_Non_Conform.Inactive_Date,'
      #9'Job_Bag_Non_Conform.Non_Conform_Notes,'
      #9'Job_Bag_Non_Conform.Response_Notes_id,'
      #9'Job_Bag_Non_Conform.Corrective_Notes_id,'
      #9'Job_Bag_Non_Conform.Corrective_Notes,'
      #9'Job_Bag_Non_Conform.Preventative_Notes_id,'
      #9'Job_Bag_Non_Conform.Response_Date,'
      #9'Job_Bag_Non_Conform.Corrective_Date,'
      #9'Job_Bag_Non_Conform.Preventative_Date,'
      '  Job_Bag_Non_Conform.Non_Conform_Status,'
      #9'Job_Bag_Non_Conform.Job_Reprinted,'
      '  Job_Bag_Non_Conform.Samples_Available,'
      
        '  Non_Conform_Status.Non_Conform_Status_Descr as Status_Descript' +
        'ion'
      'FROM Non_Conform_Status'
      '  INNER JOIN (QA_Operator'
      '  RIGHT JOIN (Operator'
      '  INNER JOIN (Non_Conform_Type'
      '  INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      '  RIGHT JOIN (Non_Conform_Dept'
      '  INNER JOIN Job_Bag_Non_Conform'
      
        '    ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.N' +
        'on_Conform_Dept)'
      
        '    ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Rai' +
        'sed_By_Dept)'
      
        '    ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform.N' +
        'on_Conform_Type)'
      '    ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      
        '    ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operator' +
        ')'
      
        '    ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Confo' +
        'rm.Non_Conform_Status'
      'WHERE Job_Bag = :Job_Bag'
      'ORDER BY Job_bag_Non_Conform')
    Left = 40
    Top = 704
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastNC: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Last_Non_Conform_Number'
      'From Company'
      'Where Company = 1')
    Left = 128
    Top = 704
  end
  object qryUpdateLastNC: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Non_Conform_Number = :Last_Non_Conform_Number'
      'Where Company = 1')
    Left = 208
    Top = 704
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_Non_Conform_Number'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddNonConform: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into Job_bag_Non_Conform'
      '(Job_Bag_Non_Conform,'
      'Date_Point,'
      'Job_Bag,'
      'Operator,'
      'Raised_by_Dept,'
      'Non_Conform_Dept,'
      'Non_Conform_Type,'
      'QA_Operator,'
      'QA_Sign_Off_Date,'
      'Non_Conform_Notes,'
      'Response_Notes_id,'
      'Corrective_Notes_id,'
      'Preventative_notes_id,'
      'Response_Date,'
      'Corrective_Date,'
      'Preventative_Date,'
      'Total_Cost,'
      'Total_Cost_to_Client,'
      'Non_Conform_Status,'
      'Job_Reprinted,'
      'Samples_Available,'
      'Non_Conform_Category'
      ')'
      'Values'
      '('
      ':Job_Bag_Non_Conform,'
      ':Date_Point,'
      ':Job_Bag,'
      ':Operator,'
      ':Raised_by_Dept,'
      ':Non_Conform_Dept,'
      ':Non_Conform_Type,'
      ':QA_Operator,'
      ':QA_Sign_Off_Date,'
      ':Non_Conform_Notes,'
      ':Response_Notes_id,'
      ':Corrective_Notes_id,'
      ':Preventative_notes_id,'
      ':Response_Date,'
      ':Corrective_Date,'
      ':Preventative_Date,'
      ':Total_Cost,'
      ':Total_Cost_to_Client,'
      ':Non_Conform_Status,'
      ':Job_Reprinted,'
      ':Samples_Available,'
      ':Non_Conform_Category'
      ')')
    Left = 304
    Top = 704
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Non_Conform'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Raised_by_Dept'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Non_Conform_Dept'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Non_Conform_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'QA_Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QA_Sign_Off_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Non_Conform_Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Response_Notes_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Corrective_Notes_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Preventative_notes_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Response_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Corrective_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Preventative_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Cost_to_Client'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Non_Conform_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Reprinted'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Samples_Available'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Non_Conform_Category'
        ParamType = ptUnknown
      end>
  end
  object qryGetNonConformStatus: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Non_Conform_Status'
      'where Non_Conform_Status = :Non_Conform_Status')
    Left = 40
    Top = 760
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Non_Conform_Status'
        ParamType = ptUnknown
      end>
  end
  object qryPITotal: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_Dets.Job_Bag, '
      #9'SUM(CASE WHEN Price_unit_factor = 0 THEN'
      #9#9'Supplier_Invoice_Line.Goods_Value + ISNULL(Amount,0.00)'
      #9'ELSE'
      
        #9'     ((Supplier_Invoice_Line.Qty_Invoiced/Price_Unit_Factor)*Su' +
        'pplier_Invoice_Line.Goods_Value) + ISNULL(Amount,0.00)'
      #9'END) as Goods_Value'
      'FROM Job_Bag_Line_Dets '
      #9'RIGHT JOIN (Purchase_OrderLine '
      #9'RIGHT JOIN ((Supplier '
      #9'INNER JOIN Supplier_Branch '
      #9#9'ON Supplier.Supplier = Supplier_Branch.Supplier) '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN (Vat_Code AS VC '
      #9'RIGHT JOIN (Supplier_Invoice '
      #9'INNER JOIN (Supplier_Invoice_Charge '
      #9'RIGHT JOIN (Vat_Code '
      #9'INNER JOIN Supplier_Invoice_Line '
      #9#9'ON Vat_Code.Vat_Code = Supplier_Invoice_Line.Vat_Code) '
      
        #9#9'ON (Supplier_Invoice_Charge.Purchase_Order = Supplier_Invoice_' +
        'Line.Purchase_Order) AND (Supplier_Invoice_Charge.Supplier_Invoi' +
        'ce = Supplier_Invoice_Line.Supplier_Invoice)) '
      
        #9#9'ON Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Line.S' +
        'upplier_Invoice) '
      #9#9'ON VC.Vat_Code = Supplier_Invoice_Charge.Vat_Code) '
      #9#9'ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit) '
      
        #9#9'ON (Supplier_Branch.Branch_no = Supplier_Invoice.Branch_no) AN' +
        'D (Supplier_Branch.Supplier = Supplier_Invoice.Supplier)) '
      
        #9#9'ON (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND ' +
        '(Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line.Purch' +
        'ase_Order)) '
      
        #9#9'ON (Job_Bag_Line_Dets.Job_Bag_Line = Supplier_Invoice_Line.Job' +
        '_Bag_Line) AND (Job_Bag_Line_Dets.Job_Bag = Supplier_Invoice_Lin' +
        'e.Job_Bag)'
      'WHERE Supplier_Invoice_Line.Job_Bag = :Job_Bag OR'
      #9#9'((SELECT DISTINCT JBLD.Job_Bag'
      #9#9' FROM Job_Bag_Line_Dets AS JBLD'
      
        #9#9' WHERE JBLD.Purchase_Order = Supplier_Invoice_Line.Purchase_Or' +
        'der AND'
      #9#9#9#9'JBLD.Line = Supplier_Invoice_Line.Line) = :Job_Bag)'
      'GROUP BY'
      #9'Job_Bag_Line_Dets.Job_Bag '
      '')
    Left = 472
    Top = 696
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryDataCollectCosts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT job_bag_time_log.Job_Bag,'
      #9'Process_Group.Sequence_no,'
      #9'Process_Group.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'1 as Record_Type,'
      
        #9'SUM(isnull((job_bag_time_log.Labour_Hours * Work_Centre_Operato' +
        'r.Operator_Count * job_bag_time_log.Hourly_Rate),0)) as Labour_C' +
        'ost,'
      
        #9'SUM(isnull((job_bag_time_log.Labour_Overtime_Hours * Work_Centr' +
        'e_Operator.Operator_Count * job_bag_time_log.Hourly_Rate),0)) as' +
        ' Overtime_Cost,'
      
        #9'SUM(isnull((job_bag_time_log.Machine_Hours * job_bag_time_log.M' +
        'achine_Hourly_Rate),0)) as Machine_Cost,'
      
        #9'SUM(isnull(((job_bag_time_log.Quantity * ISNULL(A4_Multiplier,1' +
        '))/1000 * job_bag_time_log.Click_Charge),0)) as Click_Cost,'
      
        #9'sum(isnull((job_bag_time_log.Labour_Hours * Work_Centre_Operato' +
        'r.Operator_Count * job_bag_time_log.Hourly_Rate),0)+'
      
        #9'isnull((job_bag_time_log.Labour_Overtime_Hours * Work_Centre_Op' +
        'erator.Operator_Count * job_bag_time_log.Hourly_Rate),0)+'
      
        #9'isnull((job_bag_time_log.Machine_Hours * job_bag_time_log.Machi' +
        'ne_Hourly_Rate),0)+'
      
        #9'isnull(((job_bag_time_log.Quantity * ISNULL(A4_Multiplier,1))/1' +
        '000 * job_bag_time_log.Click_Charge),0)) as Total_Production_Cos' +
        't,'
      #9'0.00 as Total_Estimated_Cost'
      'FROM Work_Centre_Operator '
      #9'INNER JOIN ((Process_Group '
      #9'INNER JOIN Process '
      #9#9'ON Process_Group.Process_Group = Process.Process_Group) '
      #9'INNER JOIN (Paper_Size '
      #9'RIGHT JOIN Job_Bag_Time_Log '
      #9#9'ON Paper_Size.Paper_Size = Job_Bag_Time_Log.Paper_Size) '
      #9#9'ON Process.Process = Job_Bag_Time_Log.Process) '
      
        #9#9'ON Work_Centre_Operator.Work_Centre_Operator = Job_Bag_Time_Lo' +
        'g.Work_Centre_Operator'
      'WHERE Job_Bag = :Job_Bag'
      'GROUP BY Job_Bag_Time_Log.Job_Bag,'
      #9'Process_Group.Sequence_no,'
      #9'Process_Group.Process_Group,'
      #9'Process_Group.Process_Group_Description'
      'UNION'
      'SELECT job_bag_Line_Dets.Job_Bag,'
      #9'Process_Group.Sequence_no,'
      #9'Process_Group.Process_Group,'
      #9'Process_Group.Process_Group_Description,'
      #9'2 as Record_Type,'
      #9'0 as Labour_Cost,'
      #9'0 as Overtime_Cost,'
      #9'0 as Machine_Cost,'
      #9'0 as Click_Cost,'
      #9'0 as Total_Production_Cost,'
      #9'SUM(case WHEN Price_unit_Factor = 0 then'
      #9#9'Quote_Line.Unit_Cost_Plus_OHD'
      #9'else'
      
        #9#9'(Quote_Line.Quantity/Price_Unit_Factor)*Quote_Line.Unit_Cost_P' +
        'lus_OHD'
      #9'end) as Total_Estimated_Cost'
      'FROM Quote '
      #9'INNER JOIN (((Process_Group '
      #9'INNER JOIN Process '
      #9#9'ON Process_Group.Process_Group = Process.Process_Group) '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN Quote_Line '
      #9#9'ON Price_Unit.Price_Unit = Quote_Line.Price_Unit) '
      #9#9'ON Process.Process = Quote_Line.Process) '
      #9'INNER JOIN Job_Bag_Line_Dets '
      
        #9#9'ON (Quote_Line.Quote_Line_No = Job_Bag_Line_Dets.Quote_line_no' +
        ') AND (Quote_Line.Quote = Job_Bag_Line_Dets.Quote)) '
      #9#9'ON Quote.Quote = Quote_Line.Quote'
      'WHERE Job_Bag_line_dets.Job_bag = :Job_Bag'
      'GROUP BY job_bag_Line_Dets.Job_Bag,'
      #9'Process_Group.Sequence_no,'
      #9'Process_Group.Process_Group,'
      #9'Process_Group.Process_Group_Description'
      'ORDER BY Process_Group.Sequence_no'
      ''
      ''
      ''
      ''
      '')
    Left = 608
    Top = 672
    ParamData = <
      item
        DataType = ftInteger
        Name = 'job_bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object srcDataCollectCosts: TDataSource
    DataSet = qryDataCollectCosts
    Left = 696
    Top = 664
  end
  object qryJBDelivery: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select '#9'Job_bag,'
      #9'Delivery_no,'
      #9'Ad_hoc_address,'
      #9'Rep,'
      #9'customer,'
      #9'branch_no,'
      #9'Qty_to_deliver,'
      #9'Qty_Delivered,'
      #9'Date_point,'
      #9'No_of_boxes,'
      #9'Delivery_instructions,'
      #9'Deliver_via_Company,'
      #9'Date_Deliv_Actual,'
      #9'Delivery_to_Stock,'
      #9'Delivery_note_Printed,'
      #9'Goods_Reqd_by_Customer,'
      #9'Contact_Name,'
      #9'Consignment_Number,'
      #9'Package_Type,'
      #9'Delivery_Weight_Kilos,'
      #9'Courier,'
      #9'Service_no,'
      '  Supplier,'
      '  Supplier_Branch,'
      '  Company_Branch'#9
      'from Job_bag_delivery_detail'
      'where Job_Bag = :Job_Bag and Delivery_No = :Delivery_No')
    Left = 208
    Top = 760
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_No'
        ParamType = ptUnknown
      end>
  end
  object qryJBAddDelivery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Delivery_Detail'
      '( Job_Bag,'
      '  Delivery_No,'
      #9'Ad_hoc_address,'
      #9'Rep,'
      #9'customer,'
      #9'branch_no,'
      #9'Qty_to_deliver,'
      #9'Qty_Delivered,'
      #9'Date_point,'
      '  Box_quantity,'
      #9'No_of_boxes,'
      #9'Delivery_instructions,'
      #9'Deliver_via_Company,'
      #9'Date_Deliv_Actual,'
      #9'Delivery_to_Stock,'
      #9'Delivery_note_Printed,'
      #9'Goods_Reqd_by_Customer,'
      #9'Contact_Name,'
      #9'Consignment_Number,'
      #9'Package_Type,'
      #9'Delivery_Weight_Kilos,'
      #9'Courier,'
      #9'Service_no,'
      '  Supplier,'
      '  Supplier_Branch,'
      '  Company_Branch'
      ')'
      'values'
      '( :Job_Bag,'
      '  :Delivery_No,'
      #9':Ad_hoc_address,'
      #9':Rep,'
      #9':customer,'
      #9':branch_no,'
      #9':Qty_to_deliver,'
      #9':Qty_Delivered,'
      #9':Date_point,'
      '  :Box_Quantity,'
      #9':No_of_boxes,'
      #9':Delivery_instructions,'
      #9':Deliver_via_Company,'
      #9':Date_Deliv_Actual,'
      #9':Delivery_to_Stock,'
      #9':Delivery_note_Printed,'
      #9':Goods_Reqd_by_Customer,'
      #9':Contact_Name,'
      #9':Consignment_Number,'
      #9':Package_Type,'
      #9':Delivery_Weight_Kilos,'
      #9':Courier,'
      #9':Service_no,'
      '  :Supplier,'
      '  :Supplier_Branch,'
      '  :Company_Branch'
      ')')
    Left = 304
    Top = 760
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Ad_hoc_address'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_to_deliver'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Box_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_of_boxes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deliver_via_Company'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_to_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_note_Printed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Reqd_by_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Consignment_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Package_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Weight_Kilos'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Courier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Service_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier_Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Company_Branch'
        ParamType = ptUnknown
      end>
  end
  object qryJBAllDeliveries: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'Job_bag,'
      #9'Delivery_no,'
      #9'Ad_hoc_address,'
      #9'Rep,'
      #9'customer,'
      #9'branch_no,'
      '  (select Customer_Branch.Name'
      '   from Customer_Branch'
      
        '   where Customer_Branch.Customer = Job_bag_Delivery_detail.Cust' +
        'omer and'
      
        '         Customer_Branch.Branch_no = Job_bag_Delivery_detail.Bra' +
        'nch_no) as Branch_Name,'
      '  (select Customer.Name'
      '   from Customer'
      
        '   where Customer.Customer = Job_bag_Delivery_detail.Customer) a' +
        's Customer_Name,'
      '  Box_Quantity,'
      #9'Qty_to_deliver,'
      #9'Qty_Delivered,'
      #9'Date_point,'
      #9'No_of_boxes,'
      #9'Delivery_instructions,'
      #9'Deliver_via_Company,'
      #9'Date_Deliv_Actual,'
      #9'Delivery_to_Stock,'
      #9'Delivery_note_Printed,'
      #9'Goods_Reqd_by_Customer,'
      #9'Contact_Name,'
      #9'Consignment_Number,'
      #9'Package_Type,'
      '  (select Package_Type_Descr'
      '   from Package_Type'
      
        '   where Package_Type = Job_bag_Delivery_detail.Package_Type) as' +
        ' Package_Name,'
      #9'Delivery_Weight_Kilos,'
      #9'Courier,'
      '  (select Courier_Name'
      '   from Courier'
      
        '   where Courier.Courier = Job_Bag_Delivery_Detail.Courier) as C' +
        'ourier_Name,'
      #9'Service_no,'
      '  (select Service_Description'
      '   from Courier_Service'
      
        '   where Courier_Service.Courier = Job_Bag_Delivery_Detail.Couri' +
        'er and'
      
        '          Courier_Service.Service_no = Job_Bag_Delivery_Detail.S' +
        'ervice_no) as Service_Name,'
      '  Supplier,'
      '  Supplier_Branch,'
      '  Company_Branch'
      'from Job_bag_delivery_detail'
      'where Job_Bag = :Job_Bag'
      
        'ORDER BY Job_Bag_Delivery_Detail.Job_Bag, Job_Bag_Delivery_Detai' +
        'l.Delivery_No'
      '')
    Left = 392
    Top = 760
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object GetAddHocAddrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select   Name, Building_No_name,'
      '               Street, Locale, Town,'
      '               Postcode,'
      '               Delivery_Narrative'
      'From Ad_Hoc_Address'
      'Where (Ad_Hoc_Address = :Ad_Hoc_Address)'
      '')
    Left = 776
    Top = 18
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ad_Hoc_Address'
        ParamType = ptUnknown
      end>
  end
  object AddrSRC: TDataSource
    Left = 888
    Top = 16
  end
  object GetRepAddrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select   Name, Building_No_name,'
      '               Street, Locale, Town,'
      '               Postcode'
      'From Rep'
      'Where (Rep = :Rep)'
      '')
    Left = 776
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object GetCustAddrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'Select   Customer.Name as Name, Customer_Branch.Name as Branch_N' +
        'ame,'
      '         Customer_Branch.Building_No_Name,'
      '         Customer_Branch.Street,'
      '         Customer_Branch.Locale,'
      '         Customer_Branch.PostCode,'
      '         Customer_Branch.Town,'
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
    Left = 776
    Top = 142
    ParamData = <
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
  object GetSuppAddrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'Select   Supplier.Name as Name, Supplier_Branch.Name as Branch_N' +
        'ame ,'
      '         Supplier_Branch.Building_No_Name,'
      '         Supplier_Branch.Street,'
      '         Supplier_Branch.Locale,'
      '         Supplier_Branch.PostCode,'
      '         Supplier_Branch.Town,'
      '         Supplier_Branch.Phone,'
      '         Supplier.Supplier, Supplier_Branch.Branch_No'
      'From Supplier_Branch, Supplier'
      'Where (Supplier_Branch.Supplier = :Supplier) and'
      '      (Supplier_Branch.Branch_No = :Branch_No) and'
      '      (Supplier.Supplier = Supplier_Branch.Supplier)')
    Left = 776
    Top = 199
    ParamData = <
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
  object GetCompAddrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select   Name,'
      '         Company.Building_No_Name,'
      '         Company.Street,'
      '         Company.Locale,'
      '         Company.PostCode,'
      '         Company.Town,'
      '         Company.Phone,'
      '         '#39#39' as Branch_Name,'
      '         Delivery_Narrative'
      'From Company'
      'Where (Company = 1)'
      '')
    Left = 776
    Top = 262
  end
  object GetCompBrAddrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select   Company.Name,'
      '         Company_Branch.Name as Branch_Name,'
      '         Company_Branch.Building_No_Name,'
      '         Company_Branch.Street,'
      '         Company_Branch.Locale,'
      '         Company_Branch.PostCode,'
      '         Company_Branch.Town,'
      '         Company_Branch.Delivery_Narrative'
      'From Company, Company_Branch'
      
        'Where (Company_Branch.Company = 1) and (Company_Branch.Company =' +
        ' 1 and Company_Branch.Branch_no = :Branch_no)')
    Left = 776
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qryCourierService: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Courier_Service.service_no, Courier_Service.courier, Cour' +
        'ier_Service.Service_Description, Courier.Courier_Name'
      'from Courier_Service, Courier'
      'where Courier_Service.Courier = :Courier and '
      'Courier_service.Courier = Courier.courier'
      'Order By Service_Description')
    Left = 992
    Top = 633
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Courier'
        ParamType = ptUnknown
      end>
  end
  object dtsCourierService: TDataSource
    DataSet = qryCourierService
    Left = 904
    Top = 633
  end
  object qryPackageType: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Package_Type'
      'ORDER BY Package_Type_Descr')
    Left = 992
    Top = 569
  end
  object dtsPackageType: TDataSource
    DataSet = qryPackageType
    Left = 904
    Top = 569
  end
  object qryAllPriceUnits: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Price_unit '
      'Order by Description')
    Left = 784
    Top = 376
  end
  object dtsAllPriceUnits: TDataSource
    DataSet = qryAllPriceUnits
    Left = 864
    Top = 376
  end
  object qryGetCustomerAccount: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Invoice_CB.Account_code'
      'from Customer_Branch, Customer_Branch Invoice_CB'
      'where'
      '('
      '(Customer_Branch.Customer = :Customer) and'
      '(Customer_Branch.Branch_no = :Branch_no)'
      ') and'
      '('
      '(Customer_Branch.Inv_To_Customer = Invoice_CB.Customer) and'
      '(Customer_Branch.Inv_To_Branch = Invoice_CB.Branch_no)'
      ')'
      '')
    Left = 784
    Top = 432
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
  object qryGetProcessGroups: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Process_Group.Process_Group,'
      '        Process_Group.Process_Group_Description,'
      '        Process_Group.Sequence_no'
      'FROM Process_Group'
      'ORDER BY Process_Group.Sequence_no')
    Left = 952
    Top = 16
  end
  object qryJProcessGroup: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Job_Bag,'
      '  Job_Bag_Specification,'
      '  Job_Bag_Specification_ID,'
      '  Job_Bag_Process_Group.Process_Group'
      'FROM Job_Bag_Process_Group'
      'WHERE Job_Bag = :Job_Bag and'
      'Job_Bag_Process_Group.Process_Group = :Process_Group')
    Left = 952
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process_Group'
        ParamType = ptUnknown
      end>
  end
  object qryJAddProcessGroup: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Process_Group'
      '('
      'Job_Bag,'
      'Process_Group,'
      'Job_Bag_Specification,'
      'Job_Bag_Specification_ID'
      ')'
      'values'
      '('
      ':Job_Bag,'
      ':Process_group,'
      ':Job_Bag_Specification,'
      ':Job_Bag_Specification_ID'
      ')')
    Left = 952
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process_group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Specification'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Specification_ID'
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
    Left = 960
    Top = 192
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
  object qryAllSalesInvoiceCharges: TQuery
    DatabaseName = 'PB'
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
    Left = 784
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryAllPurchInvoiceCharges: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Supplier_Invoice.Supplier_Invoice,'
      '        SUM(Supplier_Invoice_charge.Amount) as Amount_Total,'
      
        '        SUM((Supplier_Invoice_charge.Amount * (Vat_Code.Vat_Rate' +
        '/100))) as Vat_Total'
      'FROM Vat_Code'
      '      INNER JOIN (Supplier_Invoice'
      '      INNER JOIN Supplier_Invoice_charge'
      
        '        ON Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_' +
        'charge.Supplier_Invoice)'
      '        ON Vat_Code.Vat_Code = Supplier_Invoice_charge.Vat_Code'
      'WHERE Supplier_Invoice.Supplier_Invoice = :Supplier_Invoice'
      'GROUP BY Supplier_Invoice.Supplier_Invoice')
    Left = 784
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateContactStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Customer_Contact'
      'SET Contact_Status = 100'
      'WHERE Customer = :Customer AND'
      '      Branch_No = :Branch_no AND'
      '      Contact_No = :Contact_No')
    Left = 960
    Top = 256
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
        Name = 'Contact_No'
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
    Left = 960
    Top = 320
  end
  object qryGetCustomerSubRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 reps_branches.Rep'
      'FROM Rep '
      #9'INNER JOIN reps_branches ON Rep.Rep = reps_branches.Rep'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) AND'
      '      (Rep.Rep_Is_Sub_Rep = '#39'Y'#39') AND'
      #9#9'((Rep.Inactive = '#39'N'#39') OR (Rep.Inactive IS NULL))')
    Left = 472
    Top = 528
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
  object qryGetCustomer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Default_Quote_Cost_Markup_Perc,'
      '        Override_Cost_Markup_Perc'
      'FROM Customer'
      'WHERE Customer.Customer = :Customer')
    Left = 968
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryPackFormat: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * FROM Pack_Format'
      'WHERE'
      '      ((Inactive = '#39'N'#39')) or (ID = :ID)'
      'ORDER BY Pack_Format_Description')
    Left = 976
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dtsPackFormat: TDataSource
    DataSet = qryPackFormat
    Left = 912
    Top = 448
  end
end
