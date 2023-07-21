object dtmdlCustomers: TdtmdlCustomers
  Height = 555
  Width = 725
  object qryBranches: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Customer = :Customer'
      'order by Branch_Name')
    Left = 36
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsBranches: TDataSource
    DataSet = qryBranches
    Left = 108
    Top = 16
  end
  object qryRep: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from rep'
      'order by Rep_Name')
    Left = 40
    Top = 264
  end
  object dtsRep: TDataSource
    DataSet = qryRep
    Left = 104
    Top = 264
  end
  object lkpCustomerType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from customer_type'
      'order by description')
    Left = 40
    Top = 72
  end
  object dtsCustomerType: TDataSource
    DataSet = lkpCustomerType
    Left = 104
    Top = 72
  end
  object dtsVAT: TDataSource
    DataSet = lkpVAT
    Left = 104
    Top = 136
  end
  object lkpVAT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from VAT')
    Left = 40
    Top = 136
  end
  object lkpCreditStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from credit_status')
    Left = 40
    Top = 200
  end
  object dtsCreditStatus: TDataSource
    DataSet = lkpCreditStatus
    Left = 104
    Top = 200
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
    Left = 40
    Top = 320
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'description'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryQuotesQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
      Required = True
    end
    object qryQuotesDate_Required: TSQLTimeStampField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qryQuotesDate_Raised: TSQLTimeStampField
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
    ConnectionName = 'wt'
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
    Left = 192
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsEvents: TDataSource
    DataSet = qryEvents
    Left = 280
    Top = 16
  end
  object dtsQuotes: TDataSource
    DataSet = qryQuotes
    Left = 104
    Top = 320
  end
  object qrySOrders: TFDQuery
    ConnectionName = 'WT'
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
    Left = 40
    Top = 384
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'description'
      end
      item
        Name = 'description'
      end
      item
        Name = 'description'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'description'
      end>
    object qrySOrdersSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySOrdersDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qrySOrdersDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qrySOrdersCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySOrdersReference: TStringField
      FieldName = 'Reference'
      Size = 30
    end
    object qrySOrdersExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
    end
    object qrySOrdersOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qrySOrdersContact_Name: TStringField
      FieldName = 'Contact_Name'
      Size = 50
    end
    object qrySOrdersOrder_ref_no: TStringField
      FieldName = 'Order_ref_no'
      Size = 30
    end
    object qrySOrdersSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
    end
    object qrySOrdersDeposit_amount: TFloatField
      FieldName = 'Deposit_amount'
      DisplayFormat = '0.00'
    end
    object qrySOrdersDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
    end
    object qrySOrdersGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      DisplayFormat = '0.00'
    end
    object qrySOrdersVAT_Value: TFloatField
      FieldName = 'VAT_Value'
      DisplayFormat = '0.00'
    end
    object qrySOrdersRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySOrdersInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qrySOrdersInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qrySOrdersCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qrySOrdersInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
    end
    object qrySOrdersAddress: TIntegerField
      FieldName = 'Address'
    end
    object qrySOrdersTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
    end
    object qrySOrdersoriginal_customer_name: TStringField
      FieldName = 'original_customer_name'
      Size = 50
    end
    object qrySOrdersOperator_name: TStringField
      FieldName = 'Operator_name'
      Size = 30
    end
    object qrySOrdersTotal_Value: TFloatField
      FieldName = 'Total_Value'
      DisplayFormat = '0.00'
    end
    object qrySOrderssales_order_status_desc: TStringField
      FieldName = 'sales_order_status_desc'
      Size = 30
    end
    object qrySOrdersOn_Hold: TStringField
      FieldName = 'On_Hold'
      Size = 1
    end
    object qrySOrdersStatus_Text: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status_Text'
      Size = 50
      Calculated = True
    end
  end
  object dtsSOrders: TDataSource
    DataSet = qrySOrders
    Left = 104
    Top = 384
  end
  object qryJobs: TFDQuery
    ConnectionName = 'WT'
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
    Left = 192
    Top = 72
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'description'
      end
      item
        Name = 'description'
      end
      item
        Name = 'description'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'description'
      end>
    object qryJobsJob: TFloatField
      FieldName = 'Job'
    end
    object qryJobsJob_Status: TIntegerField
      FieldName = 'Job_Status'
    end
    object qryJobsQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryJobsCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryJobsContact_name: TStringField
      FieldName = 'Contact_name'
      Size = 50
    end
    object qryJobsOrder_ref_no: TStringField
      FieldName = 'Order_ref_no'
      Size = 30
    end
    object qryJobsDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryJobsDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryJobsPayment_due: TDateTimeField
      FieldName = 'Payment_due'
    end
    object qryJobsProduction_date: TDateTimeField
      FieldName = 'Production_date'
    end
    object qryJobsTemplate_date: TDateTimeField
      FieldName = 'Template_date'
    end
    object qryJobsInstallation_date: TDateTimeField
      FieldName = 'Installation_date'
    end
    object qryJobsDeposit_amount: TFloatField
      FieldName = 'Deposit_amount'
      currency = True
    end
    object qryJobsDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      currency = True
    end
    object qryJobsInstallation_price: TFloatField
      FieldName = 'Installation_price'
      currency = True
    end
    object qryJobsSurvey_price: TFloatField
      FieldName = 'Survey_price'
      currency = True
    end
    object qryJobsOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryJobsProduction_date_Actual: TDateTimeField
      FieldName = 'Production_date_Actual'
    end
    object qryJobsTemplate_date_actual: TDateTimeField
      FieldName = 'Template_date_actual'
    end
    object qryJobsInstallation_date_actual: TDateTimeField
      FieldName = 'Installation_date_actual'
    end
    object qryJobsDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object qryJobsMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object qryJobsExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
    end
    object qryJobsAvailability: TIntegerField
      FieldName = 'Availability'
    end
    object qryJobsPayment_Terms: TIntegerField
      FieldName = 'Payment_Terms'
    end
    object qryJobsReference: TStringField
      FieldName = 'Reference'
      Size = 50
    end
    object qryJobsNett_Price: TFloatField
      FieldName = 'Nett_Price'
      currency = True
    end
    object qryJobsInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryJobsInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
    end
    object qryJobsAddress: TIntegerField
      FieldName = 'Address'
    end
    object qryJobsDiscount_Rate: TFloatField
      FieldName = 'Discount_Rate'
    end
    object qryJobsDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      currency = True
    end
    object qryJobsCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryJobsMaterial_Description: TStringField
      FieldName = 'Material_Description'
    end
    object qryJobsStatus_Description: TStringField
      FieldName = 'Status_Description'
      Size = 50
    end
    object qryJobsOperator_Name: TStringField
      FieldName = 'Operator_Name'
      Size = 30
    end
    object qryJobsGross_Price: TFloatField
      FieldName = 'Gross_Price'
      currency = True
    end
    object qryJobsInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qryJobsDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
    end
    object qryJobsVAT: TIntegerField
      FieldName = 'VAT'
    end
    object qryJobsQuote_Nett_Price: TFloatField
      FieldName = 'Quote_Nett_Price'
    end
    object qryJobsSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qryJobsis_retail_customer: TStringField
      FieldName = 'is_retail_customer'
      Size = 1
    end
  end
  object dtsJobs: TDataSource
    DataSet = qryJobs
    Left = 280
    Top = 72
  end
  object qryInvoices: TFDQuery
    ConnectionName = 'wt'
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
    Left = 192
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'description'
      end
      item
        Name = 'description'
      end
      item
        Name = 'description'
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end>
    object qryInvoicesInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qryInvoicesCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryInvoicesInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryInvoicesInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      Size = 1
    end
    object qryInvoicesCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryInvoicesStatus_Description: TStringField
      FieldName = 'Status_Description'
      Size = 30
    end
    object qryInvoicesGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      DisplayFormat = '0.00'
    end
    object qryInvoicesVat_Value: TFloatField
      FieldName = 'Vat_Value'
      DisplayFormat = '0.00'
    end
    object qryInvoicesTotal_Value: TFloatField
      FieldName = 'Total_Value'
      DisplayFormat = '0.00'
    end
    object qryInvoicesInvoice_no: TStringField
      FieldName = 'Invoice_no'
      Size = 10
    end
    object qryInvoicesSales_invoice_status: TIntegerField
      FieldName = 'Sales_invoice_status'
    end
    object qryInvoicesSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qryInvoicesReference: TStringField
      FieldName = 'Reference'
    end
    object qryInvoicesDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
  end
  object dtsInvoices: TDataSource
    DataSet = qryInvoices
    Left = 280
    Top = 136
  end
  object qryAction: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Prospect_Action'
      'order by Prospect_Action_Description')
    Left = 40
    Top = 448
  end
  object dtsAction: TDataSource
    DataSet = qryAction
    Left = 104
    Top = 448
  end
  object qryOperator: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Operator'
      'where Operator_can_login = '#39'Y'#39
      'order by Operator_Name')
    Left = 192
    Top = 200
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 280
    Top = 200
  end
  object qryCustContact: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from customer_contact'
      'where customer = :customer and'
      '((inactive is NULL) or (inactive = '#39#39') or (inactive = '#39'N'#39'))'
      'order by Customer_contact.contact_name')
    Left = 192
    Top = 264
    ParamData = <
      item
        Name = 'customer'
      end>
  end
  object dtsCustContact: TDataSource
    DataSet = qryCustContact
    Left = 280
    Top = 264
  end
  object qryProspectStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Prospect_Status')
    Left = 192
    Top = 320
  end
  object dtsProspectStatus: TDataSource
    DataSet = qryProspectStatus
    Left = 280
    Top = 320
  end
  object qryPaymentTerms: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Payment_Terms'
      'order by Payment_Terms_Description')
    Left = 192
    Top = 376
  end
  object dtsPaymentTerms: TDataSource
    DataSet = qryPaymentTerms
    Left = 280
    Top = 376
  end
  object qryWorkGroups: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select *'
      'from Customer_Worktop_Group'
      'where customer = :Customer'
      'Order by Group_Description')
    Left = 364
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * from Address'
      'WHERE Address = :Address')
    Left = 368
    Top = 64
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryLevelofImportance: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Level_of_Importance'
      'order by Level_of_Importance'
      '')
    Left = 184
    Top = 448
  end
  object dtsLeveloFImportance: TDataSource
    DataSet = qryLevelofImportance
    Left = 280
    Top = 448
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
    Left = 468
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'inactive'
      end>
  end
  object dtsMaterialTypes: TDataSource
    DataSet = qryMaterialTypes
    Left = 532
    Top = 16
  end
end
