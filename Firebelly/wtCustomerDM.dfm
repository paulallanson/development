object dtmdlCustomers: TdtmdlCustomers
  Height = 694
  Width = 906
  PixelsPerInch = 120
  object qryBranches: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Customer = :Customer'
      'order by Branch_Name')
    Left = 45
    Top = 20
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsBranches: TDataSource
    DataSet = qryBranches
    Left = 135
    Top = 20
  end
  object qryRep: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from rep'
      'order by Rep_Name')
    Left = 50
    Top = 330
  end
  object dtsRep: TDataSource
    DataSet = qryRep
    Left = 130
    Top = 330
  end
  object lkpCustomerType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from customer_type'
      'order by description')
    Left = 50
    Top = 90
  end
  object dtsCustomerType: TDataSource
    DataSet = lkpCustomerType
    Left = 130
    Top = 90
  end
  object dtsVAT: TDataSource
    DataSet = lkpVAT
    Left = 130
    Top = 170
  end
  object lkpVAT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from VAT')
    Left = 50
    Top = 170
  end
  object lkpCreditStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from credit_status')
    Left = 50
    Top = 250
  end
  object dtsCreditStatus: TDataSource
    DataSet = lkpCreditStatus
    Left = 130
    Top = 250
  end
  object qryQuotes: TFDQuery
    ConnectionName = 'Worktop'
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
      
        '        (Quote.Nett_price - Quote.Discount_Value) as Gross_Price' +
        ','
      '        Customer.Is_Retail_Customer'
      'FROM Material_Type'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Operator'
      '      INNER JOIN Quote ON'
      '        Operator.Operator = Quote.Operator) ON'
      '        Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Material_Type.Material_Type = Quote.Material_Type'
      'WHERE 1=1 and Quote.Customer = :Customer and'
      
        '((Quote.description like :description) OR (Quote.reference like ' +
        ':description) or (Quote_Status.Quote_status_description like :de' +
        'scription)'
      
        '      or (Material_Type.Description like :Description) or (Opera' +
        'tor.Operator_Name like :Description) OR (Quote.Quote like :descr' +
        'iption))'
      'ORDER BY Quote.Quote desc')
    Left = 50
    Top = 400
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryQuotesQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
      Required = True
    end
    object qryQuotesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qryQuotesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qryQuotesCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qryQuotesDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 255
    end
    object qryQuotesOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      Required = True
    end
    object qryQuotesInstallation_price: TCurrencyField
      FieldName = 'Installation_price'
      Origin = 'Installation_price'
      Required = True
    end
    object qryQuotesDelivery_Price: TCurrencyField
      FieldName = 'Delivery_Price'
      Origin = 'Delivery_Price'
      Required = True
    end
    object qryQuotesSurvey_price: TCurrencyField
      FieldName = 'Survey_price'
      Origin = 'Survey_price'
      Required = True
    end
    object qryQuotesExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
      Origin = 'Extra_Notes'
    end
    object qryQuotesAvailability: TIntegerField
      FieldName = 'Availability'
      Origin = 'Availability'
    end
    object qryQuotesPayment_terms: TIntegerField
      FieldName = 'Payment_terms'
      Origin = 'Payment_terms'
    end
    object qryQuotesReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Size = 50
    end
    object qryQuotesQuote_Status: TIntegerField
      FieldName = 'Quote_Status'
      Origin = 'Quote_Status'
      Required = True
    end
    object qryQuotesNett_Price: TCurrencyField
      FieldName = 'Nett_Price'
      Origin = 'Nett_Price'
      Required = True
    end
    object qryQuotesInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qryQuotesInactive_reason: TIntegerField
      FieldName = 'Inactive_reason'
      Origin = 'Inactive_reason'
    end
    object qryQuotesOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      Required = True
      Size = 30
    end
    object qryQuotesStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Required = True
      Size = 50
    end
    object qryQuotesCustomer_name: TWideStringField
      FieldName = 'Customer_name'
      Origin = 'Customer_name'
      Size = 50
    end
    object qryQuotesContact_Name: TWideStringField
      FieldName = 'Contact_Name'
      Origin = 'Contact_Name'
      Size = 50
    end
    object qryQuotesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
      Origin = 'Material_Type'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryQuotesMaterial_Description: TWideStringField
      FieldName = 'Material_Description'
      Origin = 'Material_Description'
      Size = 100
    end
    object qryQuotesAddress: TIntegerField
      FieldName = 'Address'
      Origin = 'Address'
    end
    object qryQuotesGross_Price: TFloatField
      FieldName = 'Gross_Price'
      Origin = 'Gross_Price'
      ReadOnly = True
    end
    object qryQuotesIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Origin = 'Is_Retail_Customer'
      Size = 1
    end
  end
  object qryEvents: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Event.Customer_Event_no,'
      '        Customer_Event.Customer,'
      '        Customer_Event.Contact_No,'
      '        Customer_contact.Contact_name,'
      '        Customer_Event.Date_Time_Entered,'
      '        Customer_Event.Operator,'
      '        Operator.Operator_Name,'
      '        Customer_Event.Narrative,'
      '        Customer_Event.Event_Title,'
      '        Prospect_Action.Prospect_Action_Description'
      'FROM Prospect_Action'
      '        INNER JOIN (Operator'
      '        INNER JOIN (Customer_contact'
      '        INNER JOIN Customer_Event'
      
        '          ON (Customer_contact.Customer = Customer_Event.Custome' +
        'r) AND (Customer_contact.Contact_no = Customer_Event.Contact_No)' +
        ')'
      '          ON Operator.Operator = Customer_Event.Operator)'
      
        '          ON Prospect_Action.Prospect_Action = Customer_Event.Pr' +
        'ospect_Action'
      'WHERE Customer_event.customer = :Customer'
      'ORDER BY Customer_Event_no desc')
    Left = 240
    Top = 20
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsEvents: TDataSource
    DataSet = qryEvents
    Left = 350
    Top = 20
  end
  object dtsQuotes: TDataSource
    DataSet = qryQuotes
    Left = 130
    Top = 400
  end
  object qrySOrders: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'select sales_order.*,'
      '  Customer.Customer_name as original_customer_name,'
      '    Operator.Operator_name,'
      '    (Goods_Value + VAt_Value) as Total_Value,'
      '    sales_order_status.sales_order_status_desc'
      'from sales_order, customer, operator, sales_order_status'
      'WHERE 1=1 and Sales_Order.Customer = :Customer and'
      
        '((Sales_order.Reference like :description) OR (Sales_order.Refer' +
        'ence like :description) OR (sales_order_status.sales_order_statu' +
        's_desc like :description)'
      
        '      OR (sales_order.Order_Ref_no like :Description) OR (Sales_' +
        'Order.Sales_Order like :description)) AND'
      'sales_order.customer = customer.customer and'
      'sales_order.operator = operator.operator and'
      
        'sales_order.sales_order_status = sales_order_status.sales_order_' +
        'status'
      'ORDER BY Sales_Order.Sales_Order desc')
    Left = 50
    Top = 480
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qrySOrdersSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySOrdersDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qrySOrdersDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qrySOrdersCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qrySOrdersReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Required = True
      Size = 50
    end
    object qrySOrdersExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
      Origin = 'Extra_Notes'
    end
    object qrySOrdersOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      Required = True
    end
    object qrySOrdersContact_name: TWideStringField
      FieldName = 'Contact_name'
      Origin = 'Contact_name'
      Size = 50
    end
    object qrySOrdersOrder_ref_no: TWideStringField
      FieldName = 'Order_ref_no'
      Origin = 'Order_ref_no'
      Required = True
      Size = 30
    end
    object qrySOrdersSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
      Origin = 'Sales_Order_Status'
      Required = True
    end
    object qrySOrdersDeposit_amount: TFloatField
      FieldName = 'Deposit_amount'
      Origin = 'Deposit_amount'
    end
    object qrySOrdersDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
      Origin = 'Deposit_Terms'
    end
    object qrySOrdersGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      Origin = 'Goods_Value'
    end
    object qrySOrdersVAT_Value: TFloatField
      FieldName = 'VAT_Value'
      Origin = 'VAT_Value'
    end
    object qrySOrdersRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'Rep'
    end
    object qrySOrdersInstall_Address: TIntegerField
      FieldName = 'Install_Address'
      Origin = 'Install_Address'
    end
    object qrySOrdersInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qrySOrdersCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Size = 50
    end
    object qrySOrdersInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
      Origin = 'Inactive_Reason'
    end
    object qrySOrdersAddress: TIntegerField
      FieldName = 'Address'
      Origin = 'Address'
    end
    object qrySOrdersTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
      Origin = 'Template_Date'
    end
    object qrySOrdersDate_Type: TWideStringField
      FieldName = 'Date_Type'
      Origin = 'Date_Type'
      Size = 1
    end
    object qrySOrdersMaterials_Required: TWideStringField
      FieldName = 'Materials_Required'
      Origin = 'Materials_Required'
      Size = 1
    end
    object qrySOrdersMaterials_Reqd_Date: TDateTimeField
      FieldName = 'Materials_Reqd_Date'
      Origin = 'Materials_Reqd_Date'
    end
    object qrySOrdersMaterials_Recd_Date: TDateTimeField
      FieldName = 'Materials_Recd_Date'
      Origin = 'Materials_Recd_Date'
    end
    object qrySOrdersInstall_Name: TWideStringField
      FieldName = 'Install_Name'
      Origin = 'Install_Name'
      Size = 30
    end
    object qrySOrdersInstall_Phone: TWideStringField
      FieldName = 'Install_Phone'
      Origin = 'Install_Phone'
      Size = 30
    end
    object qrySOrdersOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Origin = 'On_Hold'
      Size = 1
    end
    object qrySOrdersEmail_Address: TWideStringField
      FieldName = 'Email_Address'
      Origin = 'Email_Address'
      Size = 100
    end
    object qrySOrdersAccount_Manager: TIntegerField
      FieldName = 'Account_Manager'
      Origin = 'Account_Manager'
    end
    object qrySOrdersDescriptive_Reference: TWideStringField
      FieldName = 'Descriptive_Reference'
      Origin = 'Descriptive_Reference'
      Size = 255
    end
    object qrySOrdersTemplate_Duration: TIntegerField
      FieldName = 'Template_Duration'
      Origin = 'Template_Duration'
    end
    object qrySOrdersFitting_Duration: TIntegerField
      FieldName = 'Fitting_Duration'
      Origin = 'Fitting_Duration'
    end
    object qrySOrdersFitter: TIntegerField
      FieldName = 'Fitter'
      Origin = 'Fitter'
    end
    object qrySOrdersIs_In_Outlook: TWideStringField
      FieldName = 'Is_In_Outlook'
      Origin = 'Is_In_Outlook'
      Size = 1
    end
    object qrySOrdersIsFittingInOutlook: TWideStringField
      FieldName = 'IsFittingInOutlook'
      Origin = 'IsFittingInOutlook'
      Size = 1
    end
    object qrySOrdersIsTemplateInOutlook: TWideStringField
      FieldName = 'IsTemplateInOutlook'
      Origin = 'IsTemplateInOutlook'
      Size = 1
    end
    object qrySOrdersTemplater: TIntegerField
      FieldName = 'Templater'
      Origin = 'Templater'
    end
    object qrySOrdersSupply_Only: TWideStringField
      FieldName = 'Supply_Only'
      Origin = 'Supply_Only'
      Size = 1
    end
    object qrySOrdersProject_Reference: TWideStringField
      FieldName = 'Project_Reference'
      Origin = 'Project_Reference'
      Size = 100
    end
    object qrySOrdersPaid_Status: TWideStringField
      FieldName = 'Paid_Status'
      Origin = 'Paid_Status'
      Size = 1
    end
    object qrySOrdersContact_no: TIntegerField
      FieldName = 'Contact_no'
      Origin = 'Contact_no'
    end
    object qrySOrdersAppliance_Details: TWideStringField
      FieldName = 'Appliance_Details'
      Origin = 'Appliance_Details'
      Size = 255
    end
    object qrySOrdersLocation_Plan_Document: TWideStringField
      FieldName = 'Location_Plan_Document'
      Origin = 'Location_Plan_Document'
      Size = 200
    end
    object qrySOrdersSSMA_TimeStamp: TBytesField
      AutoGenerateValue = arDefault
      FieldName = 'SSMA_TimeStamp'
      Origin = 'SSMA_TimeStamp'
      ReadOnly = True
      Required = True
      Size = 8
    end
    object qrySOrdersCollection_Only: TWideStringField
      FieldName = 'Collection_Only'
      Origin = 'Collection_Only'
      Size = 1
    end
    object qrySOrdersInstallation_Address: TIntegerField
      FieldName = 'Installation_Address'
      Origin = 'Installation_Address'
    end
    object qrySOrdersTemplate_Docs_Returned: TWideStringField
      FieldName = 'Template_Docs_Returned'
      Origin = 'Template_Docs_Returned'
      Size = 1
    end
    object qrySOrdersFitting_Docs_Returned: TWideStringField
      FieldName = 'Fitting_Docs_Returned'
      Origin = 'Fitting_Docs_Returned'
      Size = 1
    end
    object qrySOrdersRevenue_Centre: TIntegerField
      FieldName = 'Revenue_Centre'
      Origin = 'Revenue_Centre'
    end
    object qrySOrdersRemedial_Production: TWideStringField
      FieldName = 'Remedial_Production'
      Origin = 'Remedial_Production'
      Size = 1
    end
    object qrySOrdersRemedial_No_Production: TWideStringField
      FieldName = 'Remedial_No_Production'
      Origin = 'Remedial_No_Production'
      Size = 1
    end
    object qrySOrdersSales_Order_Number: TFloatField
      FieldName = 'Sales_Order_Number'
      Origin = 'Sales_Order_Number'
    end
    object qrySOrdersOriginal_Sales_Order: TIntegerField
      FieldName = 'Original_Sales_Order'
      Origin = 'Original_Sales_Order'
    end
    object qrySOrdersRemedial_ID: TIntegerField
      FieldName = 'Remedial_ID'
      Origin = 'Remedial_ID'
    end
    object qrySOrdersInv_Customer: TIntegerField
      FieldName = 'Inv_Customer'
      Origin = 'Inv_Customer'
    end
    object qrySOrdersBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
    end
    object qrySOrdersDo_not_invoice: TWideStringField
      FieldName = 'Do_not_invoice'
      Origin = 'Do_not_invoice'
      Size = 1
    end
    object qrySOrdersoriginal_customer_name: TWideStringField
      FieldName = 'original_customer_name'
      Origin = 'original_customer_name'
      Required = True
      Size = 100
    end
    object qrySOrdersOperator_name: TWideStringField
      FieldName = 'Operator_name'
      Origin = 'Operator_name'
      Required = True
      Size = 30
    end
    object qrySOrdersTotal_Value: TFloatField
      FieldName = 'Total_Value'
      Origin = 'Total_Value'
      ReadOnly = True
    end
    object qrySOrderssales_order_status_desc: TWideStringField
      FieldName = 'sales_order_status_desc'
      Origin = 'sales_order_status_desc'
      Required = True
      Size = 30
    end
  end
  object dtsSOrders: TDataSource
    DataSet = qrySOrders
    Left = 130
    Top = 480
  end
  object qryJobs: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'SELECT Job.*,'
      '      Material_Type.Description AS Material_Description,'
      '      Job_Status.Job_Status_Description AS Status_Description,'
      '      Operator.Operator_Name,'
      '      Customer.Is_retail_customer,'
      '      (Job.Nett_Price - Job.Discount_Value) as Gross_Price,'
      '      (select Sales_Order_Line.Sales_Order'
      '       from Sales_Order_Line'
      '       where Sales_Order_Line.Job = Job.Job) as Sales_Order'
      'FROM Operator'
      '      INNER JOIN (Job_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN (Customer'
      '      INNER JOIN Job ON Customer.Customer = Job.Customer) ON'
      '      Material_Type.Material_Type = Job.Material_Type) ON'
      '      Job_Status.Job_Status = Job.Job_Status) ON'
      '      Operator.Operator = Job.Operator'
      'WHERE 1=1 and Job.Customer = :Customer and'
      
        '((Job.description like :description) OR (Job_Status.Job_Status_D' +
        'escription like :description) OR (Operator.Operator_Name like :d' +
        'escription)'
      
        '      OR (Job.Order_Ref_no like :Description) OR (Job.reference ' +
        'like :Description) OR (Material_Type.Description like :Descripti' +
        'on) OR (Job.Job like :description))'
      'ORDER BY Job.Quote desc')
    Left = 240
    Top = 90
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryJobsJob: TFloatField
      FieldName = 'Job'
      Origin = 'Job'
      Required = True
    end
    object qryJobsJob_Status: TIntegerField
      FieldName = 'Job_Status'
      Origin = 'Job_Status'
      Required = True
    end
    object qryJobsQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
    end
    object qryJobsCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qryJobsContact_name: TWideStringField
      FieldName = 'Contact_name'
      Origin = 'Contact_name'
      Size = 50
    end
    object qryJobsOrder_ref_no: TWideStringField
      FieldName = 'Order_ref_no'
      Origin = 'Order_ref_no'
      Required = True
      Size = 30
    end
    object qryJobsDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qryJobsDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qryJobsPayment_due: TDateTimeField
      FieldName = 'Payment_due'
      Origin = 'Payment_due'
    end
    object qryJobsProduction_date: TDateTimeField
      FieldName = 'Production_date'
      Origin = 'Production_date'
    end
    object qryJobsTemplate_date: TDateTimeField
      FieldName = 'Template_date'
      Origin = 'Template_date'
    end
    object qryJobsInstallation_date: TDateTimeField
      FieldName = 'Installation_date'
      Origin = 'Installation_date'
    end
    object qryJobsDeposit_amount: TCurrencyField
      FieldName = 'Deposit_amount'
      Origin = 'Deposit_amount'
    end
    object qryJobsDelivery_Price: TCurrencyField
      FieldName = 'Delivery_Price'
      Origin = 'Delivery_Price'
    end
    object qryJobsInstallation_price: TCurrencyField
      FieldName = 'Installation_price'
      Origin = 'Installation_price'
    end
    object qryJobsSurvey_price: TCurrencyField
      FieldName = 'Survey_price'
      Origin = 'Survey_price'
      Required = True
    end
    object qryJobsOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryJobsProduction_date_Actual: TDateTimeField
      FieldName = 'Production_date_Actual'
      Origin = 'Production_date_Actual'
    end
    object qryJobsTemplate_date_actual: TDateTimeField
      FieldName = 'Template_date_actual'
      Origin = 'Template_date_actual'
    end
    object qryJobsInstallation_date_actual: TDateTimeField
      FieldName = 'Installation_date_actual'
      Origin = 'Installation_date_actual'
    end
    object qryJobsDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 255
    end
    object qryJobsMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
      Origin = 'Material_Type'
    end
    object qryJobsExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
      Origin = 'Extra_Notes'
    end
    object qryJobsAvailability: TIntegerField
      FieldName = 'Availability'
      Origin = 'Availability'
    end
    object qryJobsPayment_Terms: TIntegerField
      FieldName = 'Payment_Terms'
      Origin = 'Payment_Terms'
    end
    object qryJobsReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Size = 50
    end
    object qryJobsNett_Price: TCurrencyField
      FieldName = 'Nett_Price'
      Origin = 'Nett_Price'
    end
    object qryJobsInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qryJobsInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
      Origin = 'Inactive_Reason'
    end
    object qryJobsAddress: TIntegerField
      FieldName = 'Address'
      Origin = 'Address'
    end
    object qryJobsDiscount_Rate: TFloatField
      FieldName = 'Discount_Rate'
      Origin = 'Discount_Rate'
    end
    object qryJobsDiscount_Value: TCurrencyField
      FieldName = 'Discount_Value'
      Origin = 'Discount_Value'
    end
    object qryJobsCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Size = 50
    end
    object qryJobsInstall_Address: TIntegerField
      FieldName = 'Install_Address'
      Origin = 'Install_Address'
    end
    object qryJobsDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
      Origin = 'Deposit_Terms'
    end
    object qryJobsVAT: TIntegerField
      FieldName = 'VAT'
      Origin = 'VAT'
    end
    object qryJobsQuote_Nett_Price: TCurrencyField
      FieldName = 'Quote_Nett_Price'
      Origin = 'Quote_Nett_Price'
    end
    object qryJobsFitter: TIntegerField
      FieldName = 'Fitter'
      Origin = 'Fitter'
    end
    object qryJobsInstall_Name: TWideStringField
      FieldName = 'Install_Name'
      Origin = 'Install_Name'
      Size = 30
    end
    object qryJobsInstall_Phone: TWideStringField
      FieldName = 'Install_Phone'
      Origin = 'Install_Phone'
      Size = 30
    end
    object qryJobsDesigner: TIntegerField
      FieldName = 'Designer'
      Origin = 'Designer'
    end
    object qryJobsBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
    end
    object qryJobsRisk_Notes: TIntegerField
      FieldName = 'Risk_Notes'
      Origin = 'Risk_Notes'
    end
    object qryJobsDescriptive_Reference: TWideStringField
      FieldName = 'Descriptive_Reference'
      Origin = 'Descriptive_Reference'
      Size = 100
    end
    object qryJobsMarkup_Rate: TFloatField
      FieldName = 'Markup_Rate'
      Origin = 'Markup_Rate'
    end
    object qryJobsMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
      Origin = 'Markup_Value'
    end
    object qryJobsContract_Quote: TWideStringField
      FieldName = 'Contract_Quote'
      Origin = 'Contract_Quote'
      Size = 1
    end
    object qryJobsWaste_Percentage: TFloatField
      FieldName = 'Waste_Percentage'
      Origin = 'Waste_Percentage'
    end
    object qryJobsWaste_Value: TFloatField
      FieldName = 'Waste_Value'
      Origin = 'Waste_Value'
    end
    object qryJobsProject_Reference: TWideStringField
      FieldName = 'Project_Reference'
      Origin = 'Project_Reference'
      Size = 100
    end
    object qryJobsSpecification: TIntegerField
      FieldName = 'Specification'
      Origin = 'Specification'
    end
    object qryJobsRisk_Assessment: TIntegerField
      FieldName = 'Risk_Assessment'
      Origin = 'Risk_Assessment'
    end
    object qryJobsMaterial_Description: TWideStringField
      FieldName = 'Material_Description'
      Origin = 'Material_Description'
      Size = 100
    end
    object qryJobsStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Size = 50
    end
    object qryJobsOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      Required = True
      Size = 30
    end
    object qryJobsIs_retail_customer: TWideStringField
      FieldName = 'Is_retail_customer'
      Origin = 'Is_retail_customer'
      Size = 1
    end
    object qryJobsGross_Price: TCurrencyField
      FieldName = 'Gross_Price'
      Origin = 'Gross_Price'
      ReadOnly = True
    end
    object qryJobsSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      ReadOnly = True
    end
  end
  object dtsJobs: TDataSource
    DataSet = qryJobs
    Left = 350
    Top = 90
  end
  object qryInvoices: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'select '#9'Sales_Invoice.Invoice_Date,Sales_Invoice.Customer,'
      '        Sales_Invoice.Inactive,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Customer.Customer_Name as Original_Name,'
      
        '        Sales_Invoice_Status.Invoice_Status_Description as Statu' +
        's_Description,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      
        '        (Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value) as' +
        ' Total_Value,'
      '        Sales_Invoice.Invoice_no,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Description,'
      '        Sales_invoice.Customer_Name'
      'from Sales_Invoice,'
      '     Customer,'
      '     Sales_Invoice_Status'
      'WHERE 1=1 and Sales_invoice.Customer = :Customer and'
      
        '((Sales_invoice.description like :description) OR (Sales_invoice' +
        '.reference like :description) OR (Sales_invoice.invoice_no like ' +
        ':description)) AND'
      '('
      '((:Inactive = '#39'N'#39')  and (Sales_Invoice.Inactive is null )) or'
      '(:Inactive = '#39'Y'#39')'
      ') and'
      '(Sales_invoice.Customer = Customer.Customer) and'
      
        '(Sales_invoice.Sales_invoice_Status = Sales_invoice_status.Sales' +
        '_invoice_Status)'
      'order by Sales_Invoice.Sales_Invoice desc'
      '')
    Left = 240
    Top = 170
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Inactive'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryInvoicesInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
      Origin = 'Invoice_Date'
      Required = True
    end
    object qryInvoicesCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qryInvoicesInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qryInvoicesInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      Origin = 'Invoice_or_Credit'
      Size = 1
    end
    object qryInvoicesOriginal_Name: TWideStringField
      FieldName = 'Original_Name'
      Origin = 'Original_Name'
      Required = True
      Size = 100
    end
    object qryInvoicesStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Required = True
      Size = 30
    end
    object qryInvoicesGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
      Origin = 'Goods_Value'
      Required = True
    end
    object qryInvoicesVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
      Origin = 'Vat_Value'
      Required = True
    end
    object qryInvoicesTotal_Value: TCurrencyField
      FieldName = 'Total_Value'
      Origin = 'Total_Value'
      ReadOnly = True
    end
    object qryInvoicesInvoice_no: TWideStringField
      FieldName = 'Invoice_no'
      Origin = 'Invoice_no'
      Size = 10
    end
    object qryInvoicesSales_invoice_status: TIntegerField
      FieldName = 'Sales_invoice_status'
      Origin = 'Sales_invoice_status'
      Required = True
    end
    object qryInvoicesSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
      Origin = 'Sales_Invoice'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryInvoicesReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
    end
    object qryInvoicesDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 255
    end
    object qryInvoicesCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Size = 50
    end
  end
  object dtsInvoices: TDataSource
    DataSet = qryInvoices
    Left = 350
    Top = 170
  end
  object qryAction: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Prospect_Action'
      'order by Prospect_Action_Description')
    Left = 50
    Top = 560
  end
  object dtsAction: TDataSource
    DataSet = qryAction
    Left = 130
    Top = 560
  end
  object qryOperator: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Operator'
      'where Operator_can_login = '#39'Y'#39
      'order by Operator_Name')
    Left = 240
    Top = 250
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 350
    Top = 250
  end
  object qryCustContact: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from customer_contact'
      'where customer = :customer and'
      '((inactive is NULL) or (inactive = '#39#39') or (inactive = '#39'N'#39'))'
      'order by Customer_contact.contact_name')
    Left = 240
    Top = 330
    ParamData = <
      item
        Name = 'customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsCustContact: TDataSource
    DataSet = qryCustContact
    Left = 350
    Top = 330
  end
  object qryProspectStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Prospect_Status')
    Left = 240
    Top = 400
  end
  object dtsProspectStatus: TDataSource
    DataSet = qryProspectStatus
    Left = 350
    Top = 400
  end
  object qryPaymentTerms: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Payment_Terms'
      'order by Payment_Terms_Description')
    Left = 240
    Top = 470
  end
  object dtsPaymentTerms: TDataSource
    DataSet = qryPaymentTerms
    Left = 350
    Top = 470
  end
  object qryWorkGroups: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select *'
      'from Customer_Worktop_Group'
      'where customer = :Customer'
      'Order by Group_Description')
    Left = 455
    Top = 20
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * from Address'
      'WHERE Address = :Address')
    Left = 460
    Top = 88
    ParamData = <
      item
        Name = 'Address'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryLevelofImportance: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Level_of_Importance'
      'order by Level_of_Importance'
      '')
    Left = 230
    Top = 560
  end
  object dtsLeveloFImportance: TDataSource
    DataSet = qryLevelofImportance
    Left = 350
    Top = 560
  end
  object qryMaterialTypes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Material_Type.ID,'
      '        Customer_Material_Type.Customer,'
      '        Customer_Material_Type.Material_Type,'
      '        Material_Type.Description,'
      '        Customer_Material_Type.Retail_Multiplier,'
      '        Customer_Material_Type.inactive'
      'FROM Material_Type'
      '        INNER JOIN Customer_Material_Type'
      
        '            ON Material_Type.Material_Type = Customer_Material_T' +
        'ype.Material_Type'
      'WHERE Customer = :Customer AND'
      
        '      ((Customer_Material_Type.inactive = :inactive) or (Custome' +
        'r_Material_Type.inactive is NULL) or (Customer_Material_Type.ina' +
        'ctive = '#39'N'#39'))'
      'ORDER BY Material_Type.Description'
      '')
    Left = 473
    Top = 173
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'inactive'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsMaterialTypes: TDataSource
    DataSet = qryMaterialTypes
    Left = 601
    Top = 173
  end
end
