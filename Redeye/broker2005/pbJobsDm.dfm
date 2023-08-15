object dtmdlJobs: TdtmdlJobs
  Height = 703
  Width = 735
  PixelsPerInch = 120
  object qryJobs: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      
        'SELECT DISTINCT TOP 2000 Job_Bag.Job_Bag, Job_Bag.Job_Bag_Descr,' +
        ' Customer.Name as Customer_Name,'
      '       Job_Bag.Date_Point, Customer_Branch.Name as Branch_Name,'
      
        '       Customer.Customer, Customer_Branch.Branch_No, Customer_Br' +
        'anch.Account_Code,'
      '       Job_Bag.Cust_Order_no,'
      '       Job_Bag.Goods_Required,'
      '       Job_Bag.Quantity,'
      '       Job_Bag_Status.Job_Bag_Status_descr,'
      '       Job_Bag.Job_Bag_Status,'
      '       Job_Bag.inactive,'
      '       Job_Bag.rep,'
      '       Rep.Name as Rep_Name,'
      '       Job_Bag.Operator,'
      '       Operator.Name as Operator_Name,'
      '       Job_Bag.Office_Contact,'
      '       AM.Name as Account_Manager,'
      '       Job_Bag.Description_Reference,'
      '       Job_Bag.On_Hold,'
      '       Job_Bag.Date_Start'
      
        'FROM Customer_Branch, Job_Bag, Customer, Job_Bag_Status, Rep, Op' +
        'erator, Operator AM'
      'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Job_Bag.Job_Bag_Descr LIKE :Description) AND'
      '      (Job_Bag.Customer = Customer.Customer) AND'
      '      ((Job_Bag.Branch_No = Customer_Branch.Branch_No) AND'
      '      (Customer.Customer = Customer_Branch.Customer)) and'
      
        '      (Job_Bag.Job_bag_Status = Job_Bag_Status.Job_Bag_Status) A' +
        'ND'
      '      (Job_Bag.Rep = Rep.Rep) AND'
      '      (Job_Bag.Operator = Operator.Operator) and'
      '      (Job_Bag.Office_Contact = AM.Operator)')
    Left = 40
    Top = 50
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
    object qryJobsJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
      Origin = 'Job_Bag'
      Required = True
    end
    object qryJobsJob_Bag_Descr: TWideStringField
      FieldName = 'Job_Bag_Descr'
      Origin = 'Job_Bag_Descr'
      Size = 80
    end
    object qryJobsCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Required = True
      Size = 100
    end
    object qryJobsDate_Point: TSQLTimeStampField
      FieldName = 'Date_Point'
      Origin = 'Date_Point'
      Required = True
    end
    object qryJobsBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Origin = 'Branch_Name'
      Size = 50
    end
    object qryJobsCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryJobsBranch_No: TIntegerField
      FieldName = 'Branch_No'
      Origin = 'Branch_No'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryJobsAccount_Code: TWideStringField
      FieldName = 'Account_Code'
      Origin = 'Account_Code'
      Size = 10
    end
    object qryJobsCust_Order_no: TWideStringField
      FieldName = 'Cust_Order_no'
      Origin = 'Cust_Order_no'
      Size = 40
    end
    object qryJobsGoods_Required: TSQLTimeStampField
      FieldName = 'Goods_Required'
      Origin = 'Goods_Required'
    end
    object qryJobsQuantity: TFloatField
      FieldName = 'Quantity'
      Origin = 'Quantity'
    end
    object qryJobsJob_Bag_Status_descr: TWideStringField
      FieldName = 'Job_Bag_Status_descr'
      Origin = 'Job_Bag_Status_descr'
      Required = True
      Size = 40
    end
    object qryJobsJob_Bag_Status: TIntegerField
      FieldName = 'Job_Bag_Status'
      Origin = 'Job_Bag_Status'
    end
    object qryJobsinactive: TWideStringField
      FieldName = 'inactive'
      Origin = 'inactive'
      Size = 1
    end
    object qryJobsrep: TIntegerField
      FieldName = 'rep'
      Origin = 'rep'
    end
    object qryJobsRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Origin = 'Rep_Name'
      Required = True
      Size = 40
    end
    object qryJobsOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
    end
    object qryJobsOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      Required = True
      Size = 40
    end
    object qryJobsOffice_Contact: TIntegerField
      FieldName = 'Office_Contact'
      Origin = 'Office_Contact'
    end
    object qryJobsAccount_Manager: TWideStringField
      FieldName = 'Account_Manager'
      Origin = 'Account_Manager'
      Required = True
      Size = 40
    end
    object qryJobsDescription_Reference: TWideStringField
      FieldName = 'Description_Reference'
      Origin = 'Description_Reference'
      Size = 30
    end
    object qryJobsOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Origin = 'On_Hold'
      Size = 1
    end
    object qryJobsDate_Start: TSQLTimeStampField
      FieldName = 'Date_Start'
      Origin = 'Date_Start'
    end
  end
  object dtsJobs: TDataSource
    DataSet = qryJobs
    Left = 130
    Top = 50
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT TOP (:Records)'
      '       Job_Bag.Job_Bag,'
      '       Job_Bag.Job_Bag_Descr,'
      '       Customer.Name as Customer_Name,'
      '       Job_Bag.Date_Point,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer.Customer,'
      '       Customer_Branch.Branch_No,'
      '       Customer_Branch.Account_Code,'
      '       Job_Bag.Cust_Order_no,'
      '       Job_Bag.Goods_Required,'
      '       Job_Bag.Quantity,'
      '       Job_Bag_Status.Job_Bag_Status_descr,'
      '       Job_Bag.Job_Bag_Status,'
      '       Job_Bag.inactive,'
      '       Job_Bag.rep,'
      '       Rep.Name as Rep_Name,'
      '       Job_Bag.Sub_rep,'
      '       Sub_Rep.Name as Sub_Rep_Name,'
      '       Job_Bag.Operator,'
      '       Operator.Name as Operator_Name,'
      '       Job_Bag.Office_Contact,'
      '       AM.Name as Account_Manager,'
      '       Job_Bag.Description_Reference,'
      '       Job_Bag.On_Hold,'
      '       Job_Bag.Date_Start,'
      '       Job_Bag.Quote,'
      '       Job_Bag.Invoice_This_Week,'
      '       Job_Bag.File_Copies_Received_Date,'
      '       Job_Bag.File_Copies_Received_by,'
      '       Job_Bag.Enclosing_Type,'
      '       Pack_Format.Pack_Format_Description,'
      '       (select Name'
      '          from Operator'
      
        '        where Operator.Operator = File_Copies_Received_by) as Fi' +
        'le_Copies_Received_by_Name,'
      '       (select Job_Bag_Production_Descr'
      '        from Job_Bag_Production_Status JBPS'
      
        '        where JBPS.Job_Bag_Production_Status = Job_Bag.Job_Bag_P' +
        'roduction_Status) as Production_Status,'
      '       (select count(POL.Purchase_Order)'
      '        from Job_Bag_line_Dets JBL, Purchase_OrderLine POL'
      '        where JBL.Job_Bag = Job_Bag.Job_Bag and'
      '               ((JBL.Purchase_Order = POL.Purchase_Order) and'
      '               (JBL.Line = POL.Line)) and'
      
        '               ((POL.inactive = '#39'N'#39') or (POL.inactive is NULL)))' +
        ' as PO_Lines,'
      '       (select count(POL.Purchase_Order)'
      '        from Job_Bag_line_Dets JBL, Purchase_OrderLine POL'
      '        where JBL.Job_Bag = Job_Bag.Job_Bag and'
      '               ((JBL.Purchase_Order = POL.Purchase_Order) and'
      '               (JBL.Line = POL.Line)) and'
      '               POL.Cash_Sale = '#39'Y'#39') as Cash_Lines,'
      '       (select count(JBNC.Job_Bag)'
      '        from Job_Bag_Non_Conform JBNC'
      
        '        where JBNC.Job_Bag = Job_Bag.Job_Bag and JBNC.Non_Confor' +
        'm_Status < 50) as NCA_Live_Lines,'
      '       (select count(JBNC.Job_Bag)'
      '        from Job_Bag_Non_Conform JBNC'
      
        '        where JBNC.Job_Bag = Job_Bag.Job_Bag and JBNC.Non_Confor' +
        'm_Status >= 50) as NCA_Signed_Off,'
      '        Production_Complete,'
      '        (Select Top 1 Rep'
      '         from Reps_Branches'
      '         where Reps_Branches.customer = Job_Bag.Customer and'
      
        '               Reps_Branches.branch_no = Job_Bag.branch_no) as C' +
        'ustomer_Rep,'
      '        End_User.Name as End_User_Name'
      'FROM Customer AS End_User'
      '      RIGHT JOIN (Pack_Format'
      '      RIGHT JOIN (Rep AS Sub_Rep'
      '      RIGHT JOIN (Customer'
      '      INNER JOIN (Job_Bag_Status'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Operator AS AM'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Job_Bag'
      '        ON Operator.Operator = Job_Bag.Operator)'
      '        ON AM.Operator = Job_Bag.Office_Contact)'
      '        ON Rep.Rep = Job_Bag.Rep)'
      
        '        ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (' +
        'Customer_Branch.Customer = Job_Bag.Customer))'
      
        '        ON Job_Bag_Status.Job_Bag_Status = Job_Bag.Job_Bag_Statu' +
        's)'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '        ON Sub_Rep.Rep = Job_Bag.Sub_Rep)'
      '        ON Pack_Format.ID = Job_Bag.Pack_Format_ID)'
      '        ON End_User.Customer = Job_Bag.End_User_Customer'
      'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Job_Bag.Job_Bag_Descr LIKE :Description)')
    Left = 286
    Top = 50
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
  object qryJobReturns: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select distinct'
      '  Job_Bag.Job_Bag,'
      '  Job_Bag.goods_required,'
      '  Job_Bag.customer,'
      '  customer.name as Customer_Name,'
      '  Job_Bag.Job_Bag_Descr,'
      '  Job_Bag.office_contact,'
      '  operator.Name as Account_Manager,'
      '  Job_Bag.Rep,'
      '  Rep.Name as Rep_Name,'
      '  Job_Bag_Return.Part,'
      '  Part.Part_Description,'
      '  sum(Job_Bag_Return.Quantity)'
      'from  Job_Bag_Return,'
      '      Job_Bag,'
      '      customer,'
      '      operator,'
      '      rep,'
      '      Part'
      'where Job_Bag_Return.Job_Bag = Job_Bag.Job_Bag and'
      '      Job_Bag.customer = customer.customer and'
      '      Job_Bag.office_Contact = operator.operator and'
      '      Job_Bag.Rep = Rep.Rep and'
      '      Job_Bag_Return.Part = Part.Part'
      'GROUP BY'
      '  Job_Bag.Job_Bag,'
      '  Job_Bag.goods_required,'
      '  Job_Bag.customer,'
      '  customer.name,'
      '  Job_Bag.Job_Bag_Descr,'
      '  Job_Bag.office_contact,'
      '  operator.Name,'
      '  Job_Bag.Rep,'
      '  Rep.Name,'
      '  Job_Bag_Return.Part,'
      '  Part.Part_Description'
      '')
    Left = 40
    Top = 130
  end
  object dtsJobReturns: TDataSource
    DataSet = qryJobReturns
    Left = 130
    Top = 130
  end
  object qryJBReturnLines: TFDQuery
    MasterSource = dtsJobReturns
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Job_Bag_Return.Part,'
      '  Part.Part_description as Description,'
      '  Job_Bag_Return.quantity'
      'from job_bag_return, part'
      'where job_bag_return.job_bag = :Job_Bag and'
      '  job_bag_return.part = part.part')
    Left = 40
    Top = 220
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object dtsJBReturnLines: TDataSource
    DataSet = qryJBReturnLines
    Left = 150
    Top = 220
  end
  object qryJBPartQtys: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Sales_Order_line.Part,'
      '      sum(Quantity_Ordered) as Qty_Ordered,'
      '      sum(Quantity_Delivered) as Qty_Despatched,'
      '      (select sum(Quantity) from Job_Bag_Return'
      
        '      where Job_Bag_Return.Part = Sales_order_line.Part) as Qty_' +
        'Overs'
      'from Job_Bag_line_Dets, Sales_order_line'
      'where Sales_order_line.Part = :Part and'
      '('
      
        '(Job_Bag_line_Dets.sales_order = Sales_order_line.sales_order) a' +
        'nd'
      
        '(Job_Bag_line_Dets.sales_order_line_no = Sales_order_line.sales_' +
        'order_line_no)'
      ')'
      'GROUP BY Sales_Order_line.Part'
      '')
    Left = 600
    Top = 50
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryJobsNCA: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      '      Job_Bag_Non_Conform.Date_Point,'
      '      Job_Bag_Non_Conform.Job_Bag,'
      '      Job_Bag_Non_Conform.Operator,'
      '      Operator.Name AS Operator_Name,'
      '      Job_Bag_Non_Conform.Raised_By_Dept,'
      
        '      Raised_By_Dept.Non_Conform_Dept_Descr AS Raised_by_dept_De' +
        'scr,'
      '      Job_Bag_Non_Conform.Non_Conform_Dept,'
      '      Non_Conform_Dept.Non_Conform_Dept_Descr,'
      '      Job_Bag_Non_Conform.Non_Conform_Type,'
      '      Non_Conform_Type.Non_Conform_Type_Descr,'
      '      Job_Bag_Non_Conform.QA_Operator,'
      '      QA_Operator.QA_Operator_Name,'
      '      Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      '      Job_Bag_Non_Conform.Total_Cost,'
      '      Job_Bag_Non_Conform.Non_Conform_Notes,'
      '      Job_Bag_Non_Conform.Response_Notes,'
      '      Job_Bag_Non_Conform.Corrective_Notes,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Job_Bag.Customer,'
      '      Job_Bag.Branch_No,'
      '      Customer_Branch.Name as Branch_Name,'
      '      Customer.Name as Customer_Name,'
      '      Customer_Branch.Account_Code,'
      '      Job_Bag_Non_Conform.Non_Conform_Status,'
      
        '      Non_Conform_Status.Non_Conform_Status_Descr,Job_Bag.Office' +
        '_Contact,'
      '      AM.Name as Account_Manager'
      'FROM Operator AS AM'
      '    INNER JOIN (Non_Conform_Status'
      '    INNER JOIN (QA_Operator'
      '    RIGHT JOIN (Operator'
      '    INNER JOIN (Non_Conform_Type'
      '    INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      '    RIGHT JOIN (Customer'
      '    INNER JOIN (Customer_Branch'
      '    INNER JOIN ((Non_Conform_Dept'
      '    INNER JOIN Job_Bag_Non_Conform'
      
        '      ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform' +
        '.Non_Conform_Dept)'
      '    INNER JOIN Job_Bag'
      '      ON Job_Bag_Non_Conform.Job_Bag = Job_Bag.Job_Bag)'
      
        '      ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Cu' +
        'stomer_Branch.Customer = Job_Bag.Customer))'
      '      ON Customer.Customer = Customer_Branch.Customer)'
      
        '      ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.R' +
        'aised_By_Dept)'
      
        '      ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform' +
        '.Non_Conform_Type)'
      '      ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      
        '      ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operat' +
        'or)'
      
        '      ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Con' +
        'form.Non_Conform_Status)'
      '      ON AM.Operator = Job_Bag.Office_Contact'
      'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Job_Bag.Job_Bag_Descr LIKE :Description)'
      '')
    Left = 40
    Top = 300
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
  object dtsJobsNCA: TDataSource
    DataSet = qryJobsNCA
    Left = 150
    Top = 300
  end
  object qryOldDummyNCA: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      '      Job_Bag_Non_Conform.Date_Point,'
      '      Job_Bag_Non_Conform.Job_Bag,'
      '      Job_Bag_Non_Conform.Operator,'
      '      Operator.Name AS Operator_Name,'
      '      Job_Bag_Non_Conform.Raised_By_Dept,'
      
        '      Raised_By_Dept.Non_Conform_Dept_Descr AS Raised_by_dept_De' +
        'scr,'
      '      Job_Bag_Non_Conform.Non_Conform_Dept,'
      '      Non_Conform_Dept.Non_Conform_Dept_Descr,'
      '      Job_Bag_Non_Conform.Non_Conform_Type,'
      '      Non_Conform_Type.Non_Conform_Type_Descr,'
      '      Job_Bag_Non_Conform.QA_Operator,'
      '      QA_Operator.QA_Operator_Name,'
      '      Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      '      Job_Bag_Non_Conform.Total_Cost,'
      '      Job_Bag_Non_Conform.Non_Conform_Notes,'
      '      Job_Bag_Non_Conform.Response_Notes,'
      '      Job_Bag_Non_Conform.Corrective_Notes,'
      '      Job_Bag_Non_Conform.Inactive,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Job_Bag.Customer,'
      '      Job_Bag.Branch_No,'
      '      Job_Bag.Date_Start,'
      '      Job_Bag.Goods_Required,'
      '      Customer_Branch.Name as Branch_Name,'
      '      Customer.Name as Customer_Name,'
      '      Customer_Branch.Account_Code,'
      '      Job_Bag_Non_Conform.Non_Conform_Status,'
      '      Non_Conform_Status.Non_Conform_Status_Descr,'
      '      Job_Bag.Office_Contact,'
      '      AM.Name as Account_Manager'
      'FROM Operator AS AM'
      '    INNER JOIN (Non_Conform_Status'
      '    INNER JOIN (QA_Operator'
      '    RIGHT JOIN (Operator'
      '    INNER JOIN (Non_Conform_Type'
      '    INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      '    RIGHT JOIN (Customer'
      '    INNER JOIN (Customer_Branch'
      '    INNER JOIN ((Non_Conform_Dept'
      '    INNER JOIN Job_Bag_Non_Conform'
      
        '      ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform' +
        '.Non_Conform_Dept)'
      '    INNER JOIN Job_Bag'
      '      ON Job_Bag_Non_Conform.Job_Bag = Job_Bag.Job_Bag)'
      
        '      ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Cu' +
        'stomer_Branch.Customer = Job_Bag.Customer))'
      '      ON Customer.Customer = Customer_Branch.Customer)'
      
        '      ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.R' +
        'aised_By_Dept)'
      
        '      ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform' +
        '.Non_Conform_Type)'
      '      ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      
        '      ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operat' +
        'or)'
      
        '      ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Con' +
        'form.Non_Conform_Status)'
      '      ON AM.Operator = Job_Bag.Office_Contact'
      'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Job_Bag.Job_Bag_Descr LIKE :Description)'
      ''
      '')
    Left = 260
    Top = 300
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
  object qryDummyNCA: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      #9'Job_Bag_Non_Conform.Date_Point,'
      #9'Job_Bag_Non_Conform.Job_Bag,'
      #9'Job_Bag_Non_Conform.Operator,'
      #9'Operator.Name AS Operator_Name,'
      #9'Job_Bag_Non_Conform.Raised_By_Dept,'
      #9'Raised_By_Dept.Non_Conform_Dept_Descr AS Raised_by_dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Dept,'
      #9'Non_Conform_Dept.Non_Conform_Dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Type,'
      #9'Non_Conform_Type.Non_Conform_Type_Descr,'
      #9'Job_Bag_Non_Conform.QA_Operator,'
      #9'QA_Operator.QA_Operator_Name,'
      #9'Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      #9'Job_Bag_Non_Conform.Total_Cost,'
      #9'Job_Bag_Non_Conform.Non_Conform_Notes,'
      #9'Job_Bag_Non_Conform.Response_Notes,'
      #9'Job_Bag_Non_Conform.Corrective_Notes,'
      '  Job_Bag_Non_Conform.Inactive,'
      #9'Job_Bag.Customer,'
      #9'Job_Bag.Branch_No,'
      '  CASE when Job_Bag.Rep <> 0 then'
      '    Job_Bag_Descr'
      '  ELSE'
      '    Customers_Desc'
      '  END AS Job_Bag_Descr,'
      '  CASE when Job_Bag.Rep <> 0 then'
      #9'  (select Rep.Name'
      '     from Rep'
      #9'   where Rep.Rep = Job_bag.Rep)'
      '  ELSE'
      #9'  (select Rep.Name'
      #9' '#9' from Rep'
      #9'   where Rep.Rep = Purchase_orderLine.Rep)'
      '  END AS Rep_Name,'
      #9'CASE when Job_Bag.Customer <> 0 then'
      #9#9'(select Customer.Name'
      #9' '#9' from Customer'
      #9'       '#9' where Customer.Customer = Job_bag.Customer)'
      #9'ELSE'
      #9#9'(select Customer.Name'
      #9' '#9' from Customer'
      #9'       '#9' where Customer.Customer = Purchase_OrderLine.Customer)'
      #9'END AS Customer_Name,'
      #9'CASE when Job_Bag.Customer <> 0 then'
      #9#9'(select Customer_Branch.Account_code'
      #9' '#9' from Customer_Branch'
      #9'       '#9' where Customer_Branch.Customer = Job_bag.Customer and'
      #9#9#9'Customer_Branch.Branch_no = Job_bag.Branch_no)'
      #9'ELSE'
      #9#9'(select Customer_Branch.Account_code'
      #9' '#9' from Customer_Branch'
      
        #9'       '#9' where Customer_Branch.Customer = Purchase_orderline.Cu' +
        'stomer and'
      #9#9#9'Customer_Branch.Branch_no = Purchase_orderline.Branch_no)'
      #9'END AS Account_Code,'
      #9'Job_Bag_Non_Conform.Non_Conform_Status,'
      #9'Non_Conform_Status.Non_Conform_Status_Descr,'
      #9'Purchase_OrderLine.Purchase_order,'
      #9'Purchase_OrderLine.Customers_Desc,'
      #9'CASE when Job_Bag.Office_Contact <> 0 then'
      #9#9'(select operator.Name'
      #9' '#9' from Operator'
      #9'       '#9' where Operator.Operator = Job_bag.Office_Contact)'
      #9'ELSE'
      #9#9'(select operator.Name'
      #9' '#9' from Purchase_Order, Operator'
      
        #9'       '#9' where Purchase_order.Purchase_Order = Purchase_orderLi' +
        'ne.Purchase_Order and'
      #9#9#9'Operator.Operator = Purchase_Order.Office_Contact)'
      #9'END AS Account_Manager'
      'FROM Purchase_OrderLine'
      #9'RIGHT JOIN (QA_Operator'
      #9'RIGHT JOIN (Operator'
      #9'INNER JOIN (Non_Conform_Type'
      #9'INNER JOIN (Non_Conform_Status'
      #9'INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      #9'RIGHT JOIN (Job_Bag'
      #9'RIGHT JOIN (Non_Conform_Dept'
      #9'INNER JOIN Job_Bag_Non_Conform'
      
        #9#9'ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Non' +
        '_Conform_Dept)'
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Non_Conform.Job_Bag)'
      
        #9#9'ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Raise' +
        'd_By_Dept)'
      
        #9#9'ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Conform' +
        '.Non_Conform_Status)'
      
        #9#9'ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform.Non' +
        '_Conform_Type)'
      #9#9'ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      #9#9'ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operator)'
      
        #9#9'ON (Purchase_OrderLine.Line = Job_Bag_Non_Conform.Line) AND (P' +
        'urchase_OrderLine.Purchase_Order = Job_Bag_Non_Conform.Purchase_' +
        'Order)'
      
        'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer) or (Pur' +
        'chase_Orderline.Customer = :Customer)) AND'
      
        '      ((Job_Bag.Job_Bag_Descr LIKE :Description) or (Purchase_Or' +
        'derLine.Customers_Desc LIKE :Description) or ('#39'%%'#39' LIKE :Descrip' +
        'tion))'
      '')
    Left = 410
    Top = 300
    ParamData = <
      item
        Name = 'Customer'
      end
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
  object qryDummyOlder: TFDQuery
    SQL.Strings = (
      'SELECT DISTINCT TOP (:Records)'
      '       Job_Bag.Job_Bag,'
      '       Job_Bag.Job_Bag_Descr,'
      '       Customer.Name as Customer_Name,'
      '       Job_Bag.Date_Point,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer.Customer,'
      '       Customer_Branch.Branch_No,'
      '       Customer_Branch.Account_Code,'
      '       Job_Bag.Cust_Order_no,'
      '       Job_Bag.Goods_Required,'
      '       Job_Bag.Quantity,'
      '       Job_Bag_Status.Job_Bag_Status_descr,'
      '       Job_Bag.Job_Bag_Status,'
      '       Job_Bag.inactive,'
      '       Job_Bag.rep,'
      '       Rep.Name as Rep_Name,'
      '       Job_Bag.Operator,'
      '       Operator.Name as Operator_Name,'
      '       Job_Bag.Office_Contact,'
      '       AM.Name as Account_Manager,'
      '       Job_Bag.Description_Reference,'
      '       Job_Bag.On_Hold,'
      '       Job_Bag.Date_Start,'
      '       Job_Bag.Quote,'
      '       Job_Bag.File_Copies_Received_Date,'
      '       Job_Bag.File_Copies_Received_by,'
      '       (select Name'
      '          from Operator'
      
        '        where Operator.Operator = File_Copies_Received_by) as Fi' +
        'le_Copies_Received_by_Name,'
      '       (select Job_Bag_Production_Descr'
      '        from Job_Bag_Production_Status JBPS'
      
        '        where JBPS.Job_Bag_Production_Status = Job_Bag.Job_Bag_P' +
        'roduction_Status) as Production_Status,'
      '       (select count(POL.Purchase_Order)'
      '        from Job_Bag_line_Dets JBL, Purchase_OrderLine POL'
      '        where JBL.Job_Bag = Job_Bag.Job_Bag and'
      '               ((JBL.Purchase_Order = POL.Purchase_Order) and'
      '               (JBL.Line = POL.Line)) and'
      
        '               ((POL.inactive = '#39'N'#39') or (POL.inactive is NULL)))' +
        ' as PO_Lines,'
      '       (select count(POL.Purchase_Order)'
      '        from Job_Bag_line_Dets JBL, Purchase_OrderLine POL'
      '        where JBL.Job_Bag = Job_Bag.Job_Bag and'
      '               ((JBL.Purchase_Order = POL.Purchase_Order) and'
      '               (JBL.Line = POL.Line)) and'
      '               POL.Cash_Sale = '#39'Y'#39') as Cash_Lines,'
      '       (select count(JBNC.Job_Bag)'
      '        from Job_Bag_Non_Conform JBNC'
      
        '        where JBNC.Job_Bag = Job_Bag.Job_Bag and JBNC.Non_Confor' +
        'm_Status < 50) as NCA_Live_Lines,'
      '       (select count(JBNC.Job_Bag)'
      '        from Job_Bag_Non_Conform JBNC'
      
        '        where JBNC.Job_Bag = Job_Bag.Job_Bag and JBNC.Non_Confor' +
        'm_Status >= 50) as NCA_Signed_Off,'
      '        Production_Complete,'
      '        (Select Top 1 Rep'
      '         from Reps_Branches'
      '         where Reps_Branches.customer = Job_Bag.Customer and'
      
        '               Reps_Branches.branch_no = Job_Bag.branch_no) as C' +
        'ustomer_Rep'
      
        'FROM Customer_Branch, Job_Bag, Customer, Job_Bag_Status, Rep, Op' +
        'erator, Operator AM'
      'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Job_Bag.Job_Bag_Descr LIKE :Description) AND'
      '      (Job_Bag.Customer = Customer.Customer) AND'
      '      ((Job_Bag.Branch_No = Customer_Branch.Branch_No) AND'
      '      (Customer.Customer = Customer_Branch.Customer)) and'
      
        '      (Job_Bag.Job_bag_Status = Job_Bag_Status.Job_Bag_Status) A' +
        'ND'
      '      (Job_Bag.Rep = Rep.Rep) AND'
      '      (Job_Bag.Operator = Operator.Operator) and'
      '      (Job_Bag.Office_Contact = AM.Operator)')
    Left = 490
    Top = 50
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
  object dtsContractJobs: TDataSource
    DataSet = qryContractJobs
    Left = 150
    Top = 380
  end
  object qryContractJobs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag.Job_Bag,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Job_Bag.Date_Point,'
      '        Job_Bag.Cust_Order_No,'
      '        Job_Bag.Goods_Required,'
      '        Job_Bag.Quantity'
      'FROM Job_Bag'
      'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Job_Bag.Job_Bag_Descr LIKE :Description) AND'
      
        '      (Job_Bag.Job_Bag NOT IN (SELECT Job_Bag FROM Contract_Job_' +
        'Bag WHERE Contract_Job_Bag.Contract = :Contract))'
      'ORDER BY Job_Bag.Job_Bag DESC')
    Left = 50
    Top = 380
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
        Name = 'Contract'
      end>
  end
  object qryAddToContract: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Contract_Job_Bag(Contract, Job_Bag)'
      'VALUES (:Contract, :Job_Bag)')
    Left = 50
    Top = 510
    ParamData = <
      item
        Name = 'Contract'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetJobBagPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purchase_Order'
      'FROM job_bag_line_dets'
      'WHERE (Job_Bag = :Job_Bag) AND'
      '      (Purchase_Order > 0) AND'
      '      (Purchase_Order NOT IN (SELECT Purchase_Order'
      '                              FROM Contract_Purchase_Order'
      '                              WHERE Contract = :Contract))'
      'ORDER BY Purchase_Order')
    Left = 50
    Top = 450
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Contract'
      end>
  end
  object qryAddPOToContract: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Contract_Purchase_Order(Contract, Purchase_Order)'
      'VALUES (:Contract, :Purchase_Order)')
    Left = 50
    Top = 580
    ParamData = <
      item
        Name = 'Contract'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryCheckContract: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Contract'
      'FROM Contract_Job_Bag'
      'WHERE Job_Bag = :Job_Bag')
    Left = 290
    Top = 130
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryUpdInvThisWeek: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Job_Bag'
      'SET Invoice_This_Week = :Invoice_This_Week,'
      '    Invoice_This_Week_By = :Invoice_This_Week_By,'
      '    Invoice_This_Week_Date = :Invoice_This_Week_Date'
      'WHERE Job_Bag = :Job_Bag')
    Left = 260
    Top = 380
    ParamData = <
      item
        Name = 'Invoice_This_Week'
        DataType = ftString
      end
      item
        Name = 'Invoice_This_Week_By'
        DataType = ftInteger
      end
      item
        Name = 'Invoice_This_Week_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end>
  end
  object qryDummyOld: TFDQuery
    SQL.Strings = (
      'SELECT DISTINCT TOP (:Records)'
      '       Job_Bag.Job_Bag,'
      '       Job_Bag.Job_Bag_Descr,'
      '       Customer.Name as Customer_Name,'
      '       Job_Bag.Date_Point,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer.Customer,'
      '       Customer_Branch.Branch_No,'
      '       Customer_Branch.Account_Code,'
      '       Job_Bag.Cust_Order_no,'
      '       Job_Bag.Goods_Required,'
      '       Job_Bag.Quantity,'
      '       Job_Bag_Status.Job_Bag_Status_descr,'
      '       Job_Bag.Job_Bag_Status,'
      '       Job_Bag.inactive,'
      '       Job_Bag.rep,'
      '       Rep.Name as Rep_Name,'
      '       Job_Bag.Sub_rep,'
      '       Sub_Rep.Name as Sub_Rep_Name,'
      '       Job_Bag.Operator,'
      '       Operator.Name as Operator_Name,'
      '       Job_Bag.Office_Contact,'
      '       AM.Name as Account_Manager,'
      '       Job_Bag.Description_Reference,'
      '       Job_Bag.On_Hold,'
      '       Job_Bag.Date_Start,'
      '       Job_Bag.Quote,'
      '       Job_Bag.Invoice_This_Week,'
      '       Job_Bag.File_Copies_Received_Date,'
      '       Job_Bag.File_Copies_Received_by,'
      '       (select Name'
      '          from Operator'
      
        '        where Operator.Operator = File_Copies_Received_by) as Fi' +
        'le_Copies_Received_by_Name,'
      '       (select Job_Bag_Production_Descr'
      '        from Job_Bag_Production_Status JBPS'
      
        '        where JBPS.Job_Bag_Production_Status = Job_Bag.Job_Bag_P' +
        'roduction_Status) as Production_Status,'
      '       (select count(POL.Purchase_Order)'
      '        from Job_Bag_line_Dets JBL, Purchase_OrderLine POL'
      '        where JBL.Job_Bag = Job_Bag.Job_Bag and'
      '               ((JBL.Purchase_Order = POL.Purchase_Order) and'
      '               (JBL.Line = POL.Line)) and'
      
        '               ((POL.inactive = '#39'N'#39') or (POL.inactive is NULL)))' +
        ' as PO_Lines,'
      '       (select count(POL.Purchase_Order)'
      '        from Job_Bag_line_Dets JBL, Purchase_OrderLine POL'
      '        where JBL.Job_Bag = Job_Bag.Job_Bag and'
      '               ((JBL.Purchase_Order = POL.Purchase_Order) and'
      '               (JBL.Line = POL.Line)) and'
      '               POL.Cash_Sale = '#39'Y'#39') as Cash_Lines,'
      '       (select count(JBNC.Job_Bag)'
      '        from Job_Bag_Non_Conform JBNC'
      
        '        where JBNC.Job_Bag = Job_Bag.Job_Bag and JBNC.Non_Confor' +
        'm_Status < 50) as NCA_Live_Lines,'
      '       (select count(JBNC.Job_Bag)'
      '        from Job_Bag_Non_Conform JBNC'
      
        '        where JBNC.Job_Bag = Job_Bag.Job_Bag and JBNC.Non_Confor' +
        'm_Status >= 50) as NCA_Signed_Off,'
      '        Production_Complete,'
      '        (Select Top 1 Rep'
      '         from Reps_Branches'
      '         where Reps_Branches.customer = Job_Bag.Customer and'
      
        '               Reps_Branches.branch_no = Job_Bag.branch_no) as C' +
        'ustomer_Rep'
      'FROM Rep AS Sub_Rep '
      #9'RIGHT JOIN (Customer '
      #9'INNER JOIN (Rep '
      #9'INNER JOIN (Job_Bag_Status '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Operator AS AM '
      #9'RIGHT JOIN (Operator '
      #9'INNER JOIN Job_Bag '
      #9#9'ON Operator.Operator = Job_Bag.Operator) '
      #9#9'ON AM.Operator = Job_Bag.Office_Contact) '
      
        #9#9'ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Custom' +
        'er_Branch.Customer = Job_Bag.Customer)) '
      #9#9'ON Job_Bag_Status.Job_Bag_Status = Job_Bag.Job_Bag_Status) '
      #9#9'ON Rep.Rep = Job_Bag.Rep) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9'ON Sub_Rep.Rep = Job_Bag.Sub_Rep'
      'WHERE ((Job_Bag.Customer = :Customer) or (0 = :Customer)) AND'
      '      (Job_Bag.Job_Bag_Descr LIKE :Description)')
    Left = 390
    Top = 50
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
end
