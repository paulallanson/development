object dtmdlSalesOrder: TdtmdlSalesOrder
  Height = 629
  Width = 1279
  object qryAllSales: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select sales_order.*,'
      '  Customer.Customer_name as original_customer_name,'
      '    Operator.Operator_name,'
      '    (Goods_Value + VAt_Value) as Total_Value,'
      '    sales_order_status.sales_order_status_desc'
      'from sales_order, customer, operator, sales_order_status'
      'where sales_order.customer = customer.customer and'
      'sales_order.operator = operator.operator and'
      
        'sales_order.sales_order_status = sales_order_status.sales_order_' +
        'status')
    Left = 32
    Top = 24
    object qryAllSalesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qryAllSalesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryAllSalesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryAllSalesCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryAllSalesReference: TStringField
      FieldName = 'Reference'
      Size = 30
    end
    object qryAllSalesExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
    end
    object qryAllSalesOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryAllSalesContact_Name: TStringField
      FieldName = 'Contact_Name'
      Size = 50
    end
    object qryAllSalesOrder_ref_no: TStringField
      FieldName = 'Order_ref_no'
      Size = 30
    end
    object qryAllSalesSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
    end
    object qryAllSalesDeposit_amount: TFloatField
      FieldName = 'Deposit_amount'
      DisplayFormat = '0.00'
    end
    object qryAllSalesDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
    end
    object qryAllSalesGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      DisplayFormat = '0.00'
    end
    object qryAllSalesVAT_Value: TFloatField
      FieldName = 'VAT_Value'
      DisplayFormat = '0.00'
    end
    object qryAllSalesRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryAllSalesInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qryAllSalesInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryAllSalesCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryAllSalesInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
    end
    object qryAllSalesAddress: TIntegerField
      FieldName = 'Address'
    end
    object qryAllSalesTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
    end
    object qryAllSalesoriginal_customer_name: TStringField
      FieldName = 'original_customer_name'
      Size = 50
    end
    object qryAllSalesOperator_name: TStringField
      FieldName = 'Operator_name'
      Size = 30
    end
    object qryAllSalesTotal_Value: TFloatField
      FieldName = 'Total_Value'
      DisplayFormat = '0.00'
    end
    object qryAllSalessales_order_status_desc: TStringField
      FieldName = 'sales_order_status_desc'
      Size = 30
    end
    object qryAllSalesOn_Hold: TStringField
      FieldName = 'On_Hold'
      Size = 1
    end
    object qryAllSalesStatus_Text: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status_Text'
      OnGetText = qryAllSalesStatus_TextGetText
      Size = 50
      Calculated = True
    end
    object qryAllSalesDescriptive_Reference: TStringField
      FieldName = 'Descriptive_Reference'
      Size = 255
    end
    object qryAllSalesTemplate_Date_New: TStringField
      FieldKind = fkCalculated
      FieldName = 'Template_Date_New'
      OnGetText = qryAllSalesTemplate_Date_NewGetText
      Calculated = True
    end
    object qryAllSalesFitting_Date_New: TStringField
      FieldKind = fkCalculated
      FieldName = 'Fitting_Date_New'
      OnGetText = qryAllSalesFitting_Date_NewGetText
      Calculated = True
    end
    object qryAllSalesOffice_Contact_Name: TStringField
      FieldName = 'Office_Contact_Name'
      Size = 60
    end
    object qryAllSalesIs_Retail_Customer: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object qryAllSalesProject_Reference: TStringField
      FieldName = 'Project_Reference'
      Size = 100
    end
    object qryAllSalesCustomer_is_Speculative: TStringField
      FieldName = 'Customer_is_Speculative'
      Size = 1
    end
    object qryAllSalesDeposit_Required: TFloatField
      FieldName = 'Deposit_Required'
      DisplayFormat = '0.00'
    end
    object qryAllSalesDate_Type: TStringField
      FieldName = 'Date_Type'
      Size = 1
    end
    object qryAllSalesQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryAllSalesTemplater_Name: TStringField
      FieldName = 'Templater_Name'
      Size = 50
    end
    object qryAllSalesFitter_Name: TStringField
      FieldName = 'Fitter_Name'
      Size = 50
    end
    object qryAllSalesAccount_Code: TStringField
      FieldName = 'Account_Code'
    end
    object qryAllSalesTemplate_Docs_Returned: TStringField
      FieldName = 'Template_Docs_Returned'
      Size = 1
    end
    object qryAllSalesFitting_Docs_Returned: TStringField
      FieldName = 'Fitting_Docs_Returned'
      Size = 1
    end
    object qryAllSalesJob: TFloatField
      FieldName = 'Job'
    end
    object qryAllSalesJob_Status: TIntegerField
      FieldName = 'Job_Status'
    end
    object qryAllSalesWorktop_Weight: TFloatField
      FieldName = 'Worktop_Weight'
      DisplayFormat = '#,##0'
    end
    object qryAllSalesRemedial_Production: TStringField
      FieldName = 'Remedial_Production'
      Size = 1
    end
    object qryAllSalesRemedial_No_Production: TStringField
      FieldName = 'Remedial_No_Production'
      Size = 1
    end
    object qryAllSalesSales_Order_Number: TFloatField
      FieldName = 'Sales_Order_Number'
    end
  end
  object dtsAllSales: TDataSource
    DataSet = qryAllSales
    Left = 88
    Top = 24
  end
  object qrydummy: TFDQuery
    SQL.Strings = (
      '  sales_order.*,'
      '  Customer.Customer_name as Original_Customer_name,'
      '  Customer.Account_Code,'
      '    Operator.Operator_name,'
      '    (Goods_Value + VAt_Value) as Total_Value,'
      
        '    ((Sales_Order.Goods_Value + Sales_Order.VAt_Value) * (Sales_' +
        'Order.Deposit_Terms/100)) as Deposit_Required,'
      '    sales_order_status.sales_order_status_desc,'
      '    Office_Contact.Operator_Name as Office_Contact_Name,'
      '    Customer.Is_Retail_Customer,'
      '    Customer.Customer_is_Speculative,'
      '    (Select TOP 1 Sales_Order_Line.Quote'
      '      from Sales_Order_Line'
      
        '      where Sales_Order_Line.Sales_Order = Sales_Order.Sales_Ord' +
        'er) as Quote,'
      '    Templater.Fitter_Name as Templater_Name,'
      '    Fitter.Fitter_Name,'
      '    0.0001 as Job,'
      '    0 as Job_Status,'
      
        #9'  (SELECT Sum((((Quote_Element.Length*Quote_Element.Depth)/1000' +
        '000.00000)*Quote_Element.Quantity)*Worktop_Type_Thickness.Weight' +
        '_kg)'
      #9'   FROM Sales_Order_Line'
      #9#9'    INNER JOIN ((Worktop_Type_Thickness'
      #9#9'    INNER JOIN Quote_Element'
      
        #9#9#9'    ON Worktop_Type_Thickness.Thickness = Quote_Element.Thick' +
        'ness)'
      #9#9'    INNER JOIN Material_Type'
      
        #9#9#9'    ON (Material_Type.Material_Type = Quote_Element.Material_' +
        'type) AND (Worktop_Type_Thickness.Worktop_Type = Material_Type.W' +
        'orktop_Type))'
      #9#9#9'    ON Sales_Order_Line.Quote = Quote_Element.Quote'
      
        #9'  WHERE'#9'Sales_Order_line.Sales_Order = Sales_Order.Sales_Order ' +
        'AND'
      
        #9#9#9'    Quote_Element.Quote = Sales_Order_Line.Quote) AS Worktop_' +
        'Weight'
      'FROM Fitter'
      '    RIGHT JOIN (Fitter AS Templater'
      '    RIGHT JOIN (Operator AS Office_Contact'
      '    RIGHT JOIN (Sales_Order_Status'
      '    INNER JOIN (Customer'
      '    INNER JOIN (Operator'
      '    INNER JOIN sales_order'
      '        ON Operator.Operator = sales_order.Operator)'
      '        ON Customer.Customer = sales_order.Customer)'
      
        '        ON Sales_Order_Status.Sales_Order_Status = sales_order.S' +
        'ales_Order_Status)'
      
        '        ON Office_Contact.Operator = sales_order.Account_Manager' +
        ')'
      '        ON Templater.Fitter = sales_order.Templater)'
      '        ON Fitter.Fitter = sales_order.Fitter'
      'WHERE (1=1)')
    Left = 144
    Top = 24
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 288
    Top = 32
  end
  object qrySOGetLast: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Last_Sales_Order_number'
      'from Company')
    Left = 224
    Top = 32
  end
  object qrySOHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_Order.*,'
      '        Customer.Is_retail_customer,'
      '        Customer.Customer_name,'
      '        Customer.Street,'
      '        Customer.Locale,'
      '        Customer.Town_city,'
      '        Customer.County_State,'
      '        Customer.Postcode,'
      '        Customer.Discount_Rate,'
      '        Customer.Deposit_Terms,'
      '        Customer.Customer_is_Speculative,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      
        '        Sales_Order_Status.Sales_Order_Status_Desc AS Status_Des' +
        'cription,'
      '        Rep.Rep_Name'
      'FROM Rep INNER JOIN'
      '    (Sales_Order_Status'
      '    INNER JOIN (Operator'
      '    INNER JOIN (Customer'
      '    INNER JOIN Sales_Order ON'
      '      Customer.Customer = Sales_Order.Customer) ON'
      '      Operator.Operator = Sales_Order.Operator) ON'
      
        '      Sales_Order_Status.Sales_Order_Status = Sales_Order.Sales_' +
        'Order_Status) ON'
      '      Rep.Rep = Sales_Order.Rep'
      'WHERE Sales_Order = :Sales_Order')
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qrySOAllLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_Order_Line.*,'
      '        Product.Product_Description,'
      '        Product.Product_Code,'
      '        Vat.Description as Vat_Description,'
      '        Vat.Vat_Rate,'
      '        (SELECT TOP 1 Purchase_OrderLine.Purchase_Order'
      '         FROM Purchase_OrderLine'
      
        '         WHERE Purchase_OrderLine.Sales_Order = Sales_Order_Line' +
        '.Sales_Order AND'
      
        '               Purchase_OrderLine.Sales_Order_Line_no = Sales_Or' +
        'der_Line.Sales_Order_Line_no) as Purchase_order,'
      '        (SELECT TOP 1 Sales_Invoice.Invoice_no'
      '         FROM Sales_invoice'
      '            RIGHT JOIN Sales_invoice_line'
      
        '              ON Sales_invoice.Sales_invoice = Sales_invoice_lin' +
        'e.Sales_invoice'
      
        '         WHERE ((Sales_Invoice_Line.Sales_Order = Sales_Order_li' +
        'ne.Sales_Order) AND'
      
        '               (Sales_Invoice_Line.Sales_Order_Line_no = Sales_O' +
        'rder_line.Sales_Order_Line_no))) as Sales_Invoice_Number'
      'FROM (Sales_Order_Line'
      '        INNER JOIN Vat ON Sales_Order_Line.Vat = Vat.Vat)'
      
        '        LEFT JOIN Product ON Sales_Order_Line.Product = Product.' +
        'Product'
      'WHERE Sales_Order = :Sales_Order'
      'ORDER BY Sales_Order_Line_no')
    Left = 104
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Operator')
    Left = 160
    Top = 392
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 216
    Top = 392
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set last_sales_order_number = :last_sales_order_number'
      'where company = 1')
    Left = 280
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'last_sales_order_number'
        ParamType = ptUnknown
      end>
  end
  object qrySOAddHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert INTO Sales_Order'
      '(       Sales_Order,'
      '        Date_Required,'
      '        Date_Raised,'
      '        Project_Reference,'
      '        Reference,'
      '        Customer,'
      '        Address,'
      '        Inactive,'
      '        Inactive_Reason,'
      '        Extra_Notes,'
      '        Contact_Name,'
      '        Customer_Name,'
      '        Deposit_Terms,'
      '        Deposit_Amount,'
      '        Installation_Address,'
      '        Install_Address,'
      '        Operator,'
      '        Order_Ref_no,'
      '        Sales_order_Status,'
      '        Goods_Value,'
      '        VAT_Value,'
      '        Rep,'
      '        Template_Date,'
      '        Date_type,'
      '        Materials_Required,'
      '        Materials_Reqd_Date,'
      '        Materials_Recd_Date,'
      '        Email_Address,'
      '        Install_Name,'
      '        Install_Phone,'
      '        On_Hold,'
      '        Account_Manager,'
      '        Descriptive_Reference,'
      '        IsTemplateinOutlook,'
      '        IsFittingInOutlook,'
      '        Template_Duration,'
      '        Fitting_Duration,'
      '        Fitter,'
      '        Templater,'
      '        Collection_Only,'
      '        Supply_Only,'
      '        Contact_no,'
      '        Appliance_Details,'
      '        Location_Plan_Document,'
      '        Fitting_Docs_Returned,'
      '        Template_Docs_Returned,'
      '        Revenue_Centre,'
      '        Remedial_No_Production,'
      '        Remedial_Production,'
      '        Remedial_ID,'
      '        Sales_Order_Number,'
      '        Original_Sales_Order,'
      '        Do_Not_Invoice,'
      '        Inv_Customer,'
      '        Branch_no'
      ')'
      'Values'
      '(       :Sales_Order,'
      '        :Date_Required,'
      '        :Date_Raised,'
      '        :Project_Reference,'
      '        :Reference,'
      '        :Customer,'
      '        :Address,'
      '        :Inactive,'
      '        :Inactive_Reason,'
      '        :Extra_Notes,'
      '        :Contact_Name,'
      '        :Customer_Name,'
      '        :Deposit_Terms,'
      '        :Deposit_Amount,'
      '        :Installation_Address,'
      '        :Install_Address,'
      '        :Operator,'
      '        :Order_Ref_no,'
      '        :Sales_order_Status,'
      '        :Goods_Value,'
      '        :VAT_Value,'
      '        :Rep,'
      '        :Template_Date,'
      '        :Date_type,'
      '        :Materials_Required,'
      '        :Materials_Reqd_Date,'
      '        :Materials_Recd_Date,'
      '        :Email_Address,'
      '        :Install_Name,'
      '        :Install_Phone,'
      '        :On_Hold,'
      '        :Account_Manager,'
      '        :Descriptive_Reference,'
      '        :IsTemplateinOutlook,'
      '        :IsFittingInOutlook,'
      '        :Template_Duration,'
      '        :Fitting_Duration,'
      '        :Fitter,'
      '        :Templater,'
      '        :Collection_Only,'
      '        :Supply_Only,'
      '        :Contact_No,'
      '        :Appliance_Details,'
      '        :Location_Plan_Document,'
      '        :Fitting_Docs_Returned,'
      '        :Template_Docs_Returned,'
      '        :Revenue_Centre,'
      '        :Remedial_No_Production,'
      '        :Remedial_Production,'
      '        :Remedial_ID,'
      '        :Sales_Order_Number,'
      '        :Original_Sales_Order,'
      '        :Do_Not_Invoice,'
      '        :Inv_Customer,'
      '        :Branch_no'
      ')')
    Left = 24
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Raised'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Project_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end
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
        Name = 'Extra_Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deposit_Terms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deposit_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Installation_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Install_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Order_Ref_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAT_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Template_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Materials_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Materials_Reqd_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Materials_Recd_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Install_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Install_Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'On_Hold'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Descriptive_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IsTemplateinOutlook'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IsFittingInOutlook'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Template_Duration'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitting_Duration'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Templater'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Collection_Only'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supply_Only'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Appliance_Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Location_Plan_Document'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitting_Docs_Returned'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Template_Docs_Returned'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Revenue_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_No_Production'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_Production'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Do_Not_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inv_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qrySOUpHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Date_Required = :Date_Required,'
      '        Date_Raised = :Date_Raised,'
      '        Project_Reference = :Project_Reference,'
      '        Reference = :Reference,'
      '        Customer = :Customer,'
      '        Inactive = :Inactive,'
      '        Inactive_Reason = :Inactive_Reason,'
      '        Extra_Notes = :Extra_Notes,'
      '        Contact_Name = :Contact_Name,'
      '        Address = :Address,'
      '        Customer_Name = :Customer_Name,'
      '        Deposit_Terms = :Deposit_Terms,'
      '        Deposit_Amount = :Deposit_Amount,'
      '        Installation_Address = :Installation_Address,'
      '        Install_Address = :Install_Address,'
      '        Account_Manager = :Account_Manager,'
      '        Order_Ref_no = :Order_Ref_no,'
      '        Sales_order_Status = :Sales_Order_Status,'
      '        Goods_Value = :Goods_Value,'
      '        VAT_Value = :Vat_Value,'
      '        Rep = :Rep,'
      '        Template_Date = :Template_Date,'
      '        Date_Type = :Date_Type,'
      '        Materials_Required = :Materials_Required,'
      '        Materials_Reqd_Date = :Materials_Reqd_Date,'
      '        Materials_Recd_Date = :Materials_Recd_Date,'
      '        On_Hold = :On_Hold,'
      '        Email_Address = :Email_Address,'
      '        Install_Name = :Install_Name,'
      '        Install_Phone = :Install_Phone,'
      '        Descriptive_Reference = :Descriptive_Reference,'
      '        Fitter = :Fitter,'
      '        Templater = :Templater,'
      '        Collection_Only = :Collection_Only,'
      '        Supply_Only = :Supply_Only,'
      '        IsTemplateInOutlook = :IsTemplateInOutlook,'
      '        IsFittingInOutlook = :IsFittingInOutlook,'
      '        Template_Duration = :Template_Duration,'
      '        Fitting_Duration = :Fitting_Duration,'
      '        Contact_No = :Contact_No,'
      '        Appliance_Details = :Appliance_Details,'
      '        Location_Plan_Document = :Location_Plan_Document,'
      '        Fitting_Docs_Returned = :Fitting_Docs_Returned,'
      '        Template_Docs_Returned = :Template_Docs_Returned,'
      '        Revenue_Centre = :Revenue_Centre,'
      '        Remedial_No_Production = :Remedial_No_Production,'
      '        Remedial_Production = :Remedial_Production,'
      '        Remedial_ID = :Remedial_ID,'
      '        Do_Not_Invoice = :Do_Not_Invoice,'
      '        Inv_Customer = :Inv_Customer,'
      '        Branch_no = :Branch_no'
      'WHERE Sales_Order = :Sales_Order')
    Left = 24
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Raised'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Project_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
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
        Name = 'Extra_Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Contact_Name'
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
        Name = 'Deposit_Terms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deposit_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Installation_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Install_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Order_Ref_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Template_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Materials_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Materials_Reqd_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Materials_Recd_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'On_Hold'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Install_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Install_Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Descriptive_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Templater'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Collection_Only'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supply_Only'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IsTemplateInOutlook'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IsFittingInOutlook'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Template_Duration'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitting_Duration'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Appliance_Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Location_Plan_Document'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitting_Docs_Returned'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Template_Docs_Returned'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Revenue_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_No_Production'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_Production'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Do_Not_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inv_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Element_Type,'
      '        Quote_Element.Material_type,'
      '        Quote_Element.Worktop,'
      '        Quote_Element.Depth,'
      '        Quote_Element.Length,'
      '        Quote_Element.Thickness,'
      '        Quote_Element.Unit_price,'
      '        Quote_Element.Price_unit,'
      '        Quote_Element.Quantity,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description as Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description as Material_Description'
      'FROM Material_Type'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN Quote_Element ON'
      
        '        (Worktop_thickness.Thickness = Quote_Element.Thickness) ' +
        'AND'
      '        (Worktop_thickness.Worktop = Quote_Element.Worktop)) ON'
      '        Worktop.Worktop = Worktop_thickness.Worktop) ON'
      '        Thickness.Thickness = Worktop_thickness.Thickness) ON'
      
        '        Material_Type.Material_Type = Quote_Element.Material_typ' +
        'e'
      'WHERE Quote = :Quote and'
      '               Element_Number = :Element_Number and'
      'Element_Type ='#39'P'#39)
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Element_Number'
        ParamType = ptUnknown
      end>
  end
  object qrySOAddLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Sales_Order_Line ('
      'Sales_Order,'
      'Sales_order_Line_no,'
      'Job,'
      'Unit_Price,'
      'Quantity,'
      'Unit_Cost,'
      'Quantity_Allocated,'
      'Quantity_Delivered,'
      'Quantity_Invoiced,'
      'Sell_unit,'
      'Cost_unit,'
      'Nett_Price,'
      'Discount_Value,'
      'Installation_Price,'
      'Survey_Price,'
      'Delivery_Price,'
      'Vat,'
      'Description,'
      'Product,'
      'Quote,'
      'Markup_Value,'
      'Waste_Value)'
      'values ('
      ':Sales_Order,'
      ':Sales_order_Line_no,'
      ':Job,'
      ':Unit_Price,'
      ':Quantity,'
      ':Unit_Cost,'
      ':Quantity_Allocated,'
      ':Quantity_Delivered,'
      ':Quantity_Invoiced,'
      ':Sell_unit,'
      ':Cost_unit,'
      ':Nett_Price,'
      ':Discount_Value,'
      ':Installation_Price,'
      ':Survey_Price,'
      ':Delivery_Price,'
      ':Vat,'
      ':Description,'
      ':Product,'
      ':Quote,'
      ':Markup_Value,'
      ':Waste_Value)')
    Left = 104
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nett_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Installation_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Survey_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Markup_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Waste_Value'
        ParamType = ptUnknown
      end>
  end
  object qryRep: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * '
      'from Rep')
    Left = 472
    Top = 40
  end
  object dtsRep: TDataSource
    DataSet = qryRep
    Left = 520
    Top = 40
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Street, Locale,Town_City, Postcode, County_State,Telephon' +
        'e_number, Fax_number, email_address, web_address'
      'from Customer where Customer = :Customer')
    Left = 96
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qrygetRep: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Rep'
      'where Rep = :rep')
    Left = 472
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rep'
        ParamType = ptUnknown
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Address_Name, Street, Locale,Town_City, Postcode, County_' +
        'State,Telephone_number, Fax_number, email_address, web_address'
      'from Address where Address = :Address')
    Left = 24
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(address) as Last_Address'
      'from Address')
    Left = 416
    Top = 16
  end
  object qryAddAddress: TFDQuery
    ConnectionName = 'wT'
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
      'email_address,'
      'Installation_Address)'
      'values'
      '(:Address,'
      ':Address_name,'
      ':Street,'
      ':Locale,'
      ':Town_city,'
      ':Postcode,'
      ':County_state,'
      ':Telephone_number,'
      ':email_address,'
      ':Installation_Address)')
    Left = 416
    Top = 72
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
      end
      item
        DataType = ftString
        Name = 'Installation_Address'
        ParamType = ptUnknown
      end>
  end
  object qryUpAddress: TFDQuery
    ConnectionName = 'wT'
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
    Left = 416
    Top = 120
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
  object qryDelAddress: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'delete from Address'
      'where address = :address')
    Left = 416
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'address'
        ParamType = ptUnknown
      end>
  end
  object qryVAT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from VAt'
      'order by Vat_Rate')
    Left = 416
    Top = 232
    object qryVATVat: TIntegerField
      FieldName = 'Vat'

    end
    object qryVATVat_Rate: TFloatField
      FieldName = 'Vat_Rate'

      DisplayFormat = '0.00'
    end
    object qryVATDescription: TStringField
      FieldName = 'Description'

      Size = 40
    end
    object qryVATVat_Code: TStringField
      FieldName = 'Vat_Code'

      Size = 1
    end
  end
  object dtsVAT: TDataSource
    DataSet = qryVAT
    Left = 464
    Top = 232
  end
  object qryjobHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Job.*,'
      '      Material_Type.Description AS Material_Description,'
      '      Job_Status.Job_Status_Description AS Status_Description,'
      '      Operator.Operator_Name,'
      '      Customer.Customer_is_Speculative,'
      '      Customer.Rep'
      'FROM Operator'
      '      INNER JOIN (Job_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN (Customer'
      '      INNER JOIN Job ON Customer.Customer = Job.Customer) ON'
      '      Material_Type.Material_Type = Job.Material_Type) ON'
      '      Job_Status.Job_Status = Job.Job_Status) ON'
      '      Operator.Operator = Job.Operator'
      'WHERE Job.Job = :Job')
    Left = 224
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryGetVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from vat'
      'where vat = :vat')
    Left = 416
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vat'
        ParamType = ptUnknown
      end>
  end
  object qryQHeader: TFDQuery
    ConnectionName = 'wt'
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
      '        Quote.Project_Reference,'
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
      '        Vat.Description as Vat_Description,'
      '        Vat.Vat_Rate,'
      '        Quote.Vat,'
      '        Quote.Discount_Rate,'
      '        Quote.Discount_Value,'
      '        Quote.Deposit_Terms,'
      '        Quote.Deposit_Amount,'
      '        Quote.Template_Date,'
      '        Quote.Install_Address,'
      '        Quote.Date_Accepted,'
      '        Quote.Account_Manager,'
      '        Customer.Rep,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative,'
      '        Quote.Markup_Rate,'
      '        Quote.Markup_Value,'
      '        Quote.Waste_Value,'
      '        Quote.Revenue_Centre,'
      '        (SELECT Email_Address'
      '         FROM Address'
      
        '         WHERE Address.Address = Quote.Address) as Retail_Email_' +
        'Address'
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
      'WHERE Quote.Quote = :Quote')
    Left = 224
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryCustQuotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT TOP 500'
      '        Quote.Quote,'
      '        Quote.Date_Required,'
      '        Quote.Date_Raised,'
      '        Quote.Customer,'
      '        Quote.Customer_Name,'
      '        Quote.Description,'
      '        Quote.Reference, '
      '        Quote.Delivery_Price,'
      '        Quote.Discount_Value,'
      '        Quote.Installation_Price,'
      '        Quote.Nett_Price,'
      '        Quote.Survey_Price,'
      '        Quote.VAT,'
      '        Quote.Markup_Rate,'
      '        Quote.Markup_Value,'
      '        Quote.Waste_Value,'
      '        Sales_Order_Line.Sales_Order'
      'FROM Quote'
      
        '      LEFT JOIN Sales_Order_Line ON Quote.Quote = Sales_Order_Li' +
        'ne.Quote'
      'WHERE (Quote.Customer = :customer) AND'
      '      (Quote.Reference LIKE :Reference) AND'
      
        '      ((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote =' +
        ' '#39'N'#39')) AND'
      '      (Sales_Order_Line.Sales_Order IS NULL)'
      'ORDER BY Quote.Quote desc')
    Left = 416
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end>
  end
  object dsCustQuotes: TDataSource
    DataSet = qryCustQuotes
    Left = 496
    Top = 344
  end
  object dsDummy: TDataSource
    Left = 584
    Top = 344
  end
  object qryGetQuoteJob: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job.Job'
      'from Job'
      'where Quote = :quote')
    Left = 416
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select count(Sales_order) as total_lines,'
      '(select sum(quantity)'
      ' from sales_order_line SOL'
      ' where SOL.Sales_Order = :sales_order) as total_Qty_to_Invoice,'
      '(select sum(QS.quantity)'
      ' from sales_order_line SOL, Quote_Slab QS'
      ' where SOL.Sales_Order = :sales_order AND'
      ' (QS.Quote = SOL.Quote)) as total_Qty_to_Purchase,'
      '(select sum(quantity_delivered)'
      ' from sales_order_line SOL'
      ' where SOL.Sales_Order = :sales_order) as total_SO_Delivered,'
      '(select sum(quantity_invoiced)'
      ' from sales_order_line SOL'
      ' where SOL.Sales_Order = :sales_order) as total_SO_Invoiced,'
      '(select sum(quantity_invoiced)'
      ' from Sales_invoice_line, sales_invoice'
      ' where Sales_invoice_line.Sales_Order = :Sales_order AND'
      
        '       (Sales_Invoice_Line.sales_invoice = Sales_invoice.sales_I' +
        'nvoice) AND'
      
        '       ((Sales_Invoice.inactive IS NULL) OR (Sales_Invoice.inact' +
        'ive = '#39#39')) AND'
      
        '       ((Sales_Invoice_Line.credit_type = '#39#39') or (Sales_Invoice_' +
        'Line.credit_type ='#39'Q'#39'))) as total_invoiced,'
      '(select sum(quantity)'
      ' from Purchase_Orderline, Purchase_Order'
      ' where Purchase_Orderline.Sales_Order = :Sales_order AND'
      
        '       (Purchase_Orderline.Purchase_Order = Purchase_Order.Purch' +
        'ase_Order) AND'
      
        '       ((Purchase_Order.inactive IS NULL) OR (Purchase_Order.ina' +
        'ctive = '#39'N'#39'))) as total_Purchased,'
      '(select count(sales_order)'
      ' from sales_order_line SOL, job'
      
        ' where SOL.Sales_Order = :sales_order and Job.job_status >= 10 a' +
        'nd'
      ' SOL.job = job.job) as total_in_production,'
      '(select count(sales_order)'
      ' from sales_order_line SOL, job'
      
        ' where SOL.Sales_Order = :sales_order and Job.job_status = 40 an' +
        'd'
      ' SOL.job = job.job) as total_waiting_fitting,'
      '(select count(sales_order)'
      ' from sales_order_line SOL, job'
      
        ' where SOL.Sales_Order = :sales_order and Job.job_status = 50 an' +
        'd'
      ' SOL.job = job.job) as total_complete,'
      '(select count(sales_order)'
      ' from sales_order_line SOL'
      ' where SOL.Sales_Order = :sales_order and'
      ' ((SOL.job <> NULL) or (SOL.Quote <> NULL))) as total_job_Lines,'
      '(select sum(Paid_Amount)'
      ' from Payment'
      ' where Payment.Sales_Order = :sales_order) as total_Paid'
      'from Sales_order_line'
      'where Sales_order_line.sales_order = :sales_order')
    Left = 560
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qrySOUpStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update sales_order'
      'set sales_order_status = :sales_order_Status'
      'where sales_order = :sales_order')
    Left = 560
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qrySOUpdLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order_Line'
      'set Job = :Job,'
      'Unit_Price = :Unit_Price,'
      'Quantity = :Quantity,'
      'Unit_Cost = :Unit_Cost,'
      'Quantity_Allocated = :Quantity_Allocated,'
      'Quantity_Delivered = :Quantity_Delivered,'
      'Quantity_Invoiced = :Quantity_Invoiced,'
      'Sell_unit = :Sell_Unit,'
      'Cost_unit = :Cost_unit,'
      'Nett_Price = :Nett_Price,'
      'Discount_Value = :Discount_Value,'
      'Installation_Price = :Installation_Price,'
      'Survey_Price = :Survey_Price,'
      'Delivery_Price = :Delivery_Price,'
      'Vat = :Vat,'
      'Description = :Description,'
      'Product = :Product,'
      'Quote = :Quote,'
      'Markup_Value = :Markup_Value,'
      'Waste_Value = :Waste_Value'
      
        'WHERE Sales_Order = :Sales_Order and Sales_Order_line_no = :Sale' +
        's_order_Line_no')
    Left = 168
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nett_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Installation_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Survey_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Markup_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Waste_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOrderInvoices: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Sales_Invoice_Line'
      'where sales_order = :sales_order')
    Left = 224
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qrySetSOrderInactive: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update sales_order'
      'set inactive = '#39'Y'#39
      'where sales_order = :Sales_Order')
    Left = 224
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update customer'
      'set prospect = '#39'N'#39
      'where customer = :customer')
    Left = 536
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end>
  end
  object qryUpQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where Quote = :Quote')
    Left = 224
    Top = 232
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
  object qrySOUpSalesInvoice: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Invoice'
      'Set Customer_Name = :Customer_Name'
      'Where Reference = :Reference')
    Left = 584
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end>
  end
  object qryGetLinkedQuotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        OrigQuote.Quote_Number,'
      '        OrigQuote.Quote,'
      '        OrigQuote.Date_Raised,'
      '        OrigQuote.Date_Required,'
      '        OrigQuote.Description,'
      '        OrigQuote.Original_Quote,'
      '        Operator.Operator_Name,'
      '        Material_Type.Description as Material_Type_Description,'
      '        OrigQuote.Installation_price,'
      '        OrigQuote.Delivery_Price,'
      '        OrigQuote.Survey_price,'
      
        '        (OrigQuote.Nett_Price-OrigQuote.Discount_Value+OrigQuote' +
        '.Markup_Value) AS Complete_Price,'
      
        '        (OrigQuote.Nett_Price-OrigQuote.Discount_Value+OrigQuote' +
        '.Markup_Value+OrigQuote.Installation_Price+OrigQuote.Delivery_Pr' +
        'ice+OrigQuote.Survey_Price) AS Total_Price,'
      '        Quote_Status.Quote_status_description'
      'FROM ((((Sales_Order_Line'
      '  INNER JOIN Quote'
      '      ON Sales_Order_Line.Quote = Quote.Quote)'
      '  INNER JOIN Quote AS OrigQuote'
      '      ON Quote.Original_Quote = OrigQuote.Original_Quote)'
      '  INNER JOIN Operator'
      '      ON OrigQuote.Operator = Operator.Operator)'
      '  INNER JOIN Material_Type'
      '      ON OrigQuote.Material_Type = Material_Type.Material_Type)'
      '  INNER JOIN Quote_Status'
      '    ON OrigQuote.Quote_Status = Quote_Status.Quote_Status'
      'WHERE (Sales_Order_Line.Sales_Order = :Sales_Order)'
      'ORDER BY OrigQuote.Date_Raised DESC'
      '')
    Left = 640
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
    object qryGetLinkedQuotesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qryGetLinkedQuotesSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
    end
    object qryGetLinkedQuotesQuote_Number: TFloatField
      FieldName = 'Quote_Number'
    end
    object qryGetLinkedQuotesQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryGetLinkedQuotesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryGetLinkedQuotesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryGetLinkedQuotesDescription: TStringField
      FieldName = 'Description'
      Size = 255
    end
    object qryGetLinkedQuotesOriginal_Quote: TIntegerField
      FieldName = 'Original_Quote'
    end
    object qryGetLinkedQuotesOperator_Name: TStringField
      FieldName = 'Operator_Name'
      Size = 30
    end
    object qryGetLinkedQuotesInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = #163'0.00'
    end
    object qryGetLinkedQuotesDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = #163'0.00'
    end
    object qryGetLinkedQuotesSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = #163'0.00'
    end
    object qryGetLinkedQuotesComplete_Price: TFloatField
      FieldName = 'Complete_Price'
      DisplayFormat = #163'0.00'
    end
    object qryGetLinkedQuotesTotal_Price: TFloatField
      FieldName = 'Total_Price'
      DisplayFormat = #163'0.00'
    end
    object qryGetLinkedQuotesQuote_status_description: TStringField
      FieldName = 'Quote_status_description'
      Size = 50
    end
    object qryGetLinkedQuotesMaterial_Type_Description: TStringField
      FieldName = 'Material_Type_Description'
      Size = 30
    end
  end
  object dtsGetLinkedQuotes: TDataSource
    DataSet = qryGetLinkedQuotes
    Left = 704
    Top = 16
  end
  object qryGetSOHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select *'
      'From Sales_Order'
      'where sales_order = :Sales_Order')
    Left = 536
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryFitter: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Fitter'
      'where (inactive = '#39'N'#39') OR (Fitter = :Fitter)'
      'Order By Fitter_Name')
    Left = 648
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end>
  end
  object qryTemplater: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Fitter'
      'where (inactive = '#39'N'#39') OR (Fitter = :Templater)'
      'ORDER BY Fitter_Name')
    Left = 648
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Templater'
        ParamType = ptUnknown
      end>
  end
  object dtsFitter: TDataSource
    DataSet = qryFitter
    Left = 728
    Top = 224
  end
  object dtsTemplater: TDataSource
    DataSet = qryTemplater
    Left = 728
    Top = 280
  end
  object qrySOEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Sales_Order_internal_Note, Operator'
      
        'where Sales_Order = :Sales_Order and Internal_Note = :Internal_N' +
        'ote and'
      'Sales_Order_internal_Note.Operator = Operator.Operator')
    Left = 288
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Note'
        ParamType = ptUnknown
      end>
  end
  object qrySOAddEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Sales_Order_Internal_Note ('
      'Sales_Order,'
      'Internal_Note,'
      'Date_Time_Entered,'
      'Operator,'
      'Narrative)'
      'values ('
      ':Sales_Order,'
      ':Internal_Note,'
      ':Date_Time_Entered,'
      ':Operator,'
      ':Narrative)')
    Left = 288
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
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
  object qrySOAllEvents: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select *, Operator.Operator_Name'
      'from Sales_Order_internal_Note, Operator'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_internal_Note.Operator = Operator.Operator')
    Left = 288
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryQAllEvents: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Quote_internal_Note, Operator'
      'where Quote = :Quote and'
      'Quote_internal_Note.Operator = Operator.Operator')
    Left = 288
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryUpQuoteVersions: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where (Original_Quote = :Original_Quote) AND'
      '      (Quote <> :Quote)')
    Left = 216
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetQuote: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote,'
      '        Quote_Number,'
      '        Original_Quote'
      'FROM Quote'
      'WHERE Quote = :Quote')
    Left = 320
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQuoteSlabs: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT Quote_Slab.Supplier'
      'FROM Quote_Slab'
      'WHERE Quote = :Quote'
      'GROUP BY Supplier')
    Left = 416
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qrySOPurchases: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Purchase_orderline.Purchase_Order,'
      '        Purchase_orderline.Line_no,'
      '        Purchase_orderline.Description as PO_Line_Description,'
      '        Purchase_orderline.Unit_cost,'
      '        Purchase_orderline.Quantity,'
      
        '        (Purchase_orderline.Unit_cost * Purchase_orderline.Quant' +
        'ity) as Total_Cost,'
      '        Purchase_orderline.Slab_Unit_Cost,'
      '        Purchase_Order.Date_Raised,'
      '        Purchase_Order.Date_Required,'
      '        Purchase_Order.Operator,'
      '        Operator.Operator_Name,'
      '        Purchase_Order.Office_Contact,'
      '        Office_Contact.Operator_Name as Office_Contact_Name,'
      '        Purchase_Order.Inactive,'
      '        Purchase_Order.On_Hold,'
      '        Purchase_Order.Supplier,'
      '        Supplier.Supplier_name,'
      '        Purchase_Order.Contact_no,'
      '        Supplier_contact.Contact_name,'
      '        Purchase_orderline.GRN_Number,'
      '        Purchase_orderline.Sales_Order,'
      '        Purchase_orderline.Sales_Order_Line_No,'
      '        Purchase_orderline.Slab_Depth,'
      '        Purchase_orderline.Slab_Length,'
      '        Purchase_orderline.Slab_Description,'
      
        '        CSTR(Purchase_orderline.Slab_Length)  + '#39'mm x '#39' + CSTR(P' +
        'urchase_orderline.Slab_Depth) + '#39'mm '#39' + Purchase_orderline.Slab_' +
        'Description as Slab_Size_Description,'
      '        Purchase_Order_Status.Purchase_Order_Status,'
      '        Purchase_Order_Status.Status_Description'
      'FROM Purchase_Order_Status'
      '        INNER JOIN (Supplier'
      '        INNER JOIN ((Supplier_contact'
      '        INNER JOIN (Operator AS Office_Contact'
      '        INNER JOIN (Operator'
      '        INNER JOIN Purchase_Order'
      '          ON Operator.Operator = Purchase_Order.Operator)'
      
        '          ON Office_Contact.Operator = Purchase_Order.Office_Con' +
        'tact)'
      
        '          ON (Supplier_contact.Contact_no = Purchase_Order.Conta' +
        'ct_No) AND (Supplier_contact.Supplier = Purchase_Order.Supplier)' +
        ')'
      '        INNER JOIN Purchase_orderline'
      
        '          ON Purchase_Order.Purchase_Order = Purchase_orderline.' +
        'Purchase_Order)'
      '          ON Supplier.Supplier = Supplier_contact.Supplier)'
      
        '          ON Purchase_Order_Status.Purchase_Order_Status = Purch' +
        'ase_Order.Purchase_Order_Status'
      'WHERE Purchase_OrderLine.Sales_Order = :Sales_Order AND'
      '((Purchase_Order.inactive = :inactive) OR (:inactive = '#39'N'#39'))'
      
        'ORDER BY Purchase_orderline.Purchase_Order desc, Purchase_orderl' +
        'ine.Line_no')
    Left = 24
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'inactive'
        ParamType = ptUnknown
      end>
    object qrySOPurchasesPurchase_Order: TIntegerField
      FieldName = 'Purchase_Order'
    end
    object qrySOPurchasesLine_no: TIntegerField
      FieldName = 'Line_no'
    end
    object qrySOPurchasesPO_Line_Description: TStringField
      FieldName = 'PO_Line_Description'
      Size = 255
    end
    object qrySOPurchasesUnit_cost: TFloatField
      FieldName = 'Unit_cost'
      DisplayFormat = #163'0.00'
    end
    object qrySOPurchasesSlab_Unit_Cost: TFloatField
      FieldName = 'Slab_Unit_Cost'
      DisplayFormat = #163'0.00'
    end
    object qrySOPurchasesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qrySOPurchasesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qrySOPurchasesOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qrySOPurchasesOperator_Name: TStringField
      FieldName = 'Operator_Name'
      Size = 30
    end
    object qrySOPurchasesOffice_Contact: TIntegerField
      FieldName = 'Office_Contact'
    end
    object qrySOPurchasesOffice_Contact_Name: TStringField
      FieldName = 'Office_Contact_Name'
      Size = 30
    end
    object qrySOPurchasesInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qrySOPurchasesOn_Hold: TStringField
      FieldName = 'On_Hold'
      Size = 1
    end
    object qrySOPurchasesSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qrySOPurchasesSupplier_name: TStringField
      FieldName = 'Supplier_name'
      Size = 50
    end
    object qrySOPurchasesContact_no: TIntegerField
      FieldName = 'Contact_no'
    end
    object qrySOPurchasesContact_name: TStringField
      FieldName = 'Contact_name'
      Size = 30
    end
    object qrySOPurchasesGRN_Number: TStringField
      FieldName = 'GRN_Number'
      Size = 10
    end
    object qrySOPurchasesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySOPurchasesSales_Order_Line_No: TIntegerField
      FieldName = 'Sales_Order_Line_No'
    end
    object qrySOPurchasesSlab_Depth: TIntegerField
      FieldName = 'Slab_Depth'
    end
    object qrySOPurchasesSlab_Length: TIntegerField
      FieldName = 'Slab_Length'
    end
    object qrySOPurchasesSlab_Description: TStringField
      FieldName = 'Slab_Description'
      Size = 50
    end
    object qrySOPurchasesSlab_Size_Description: TStringField
      FieldName = 'Slab_Size_Description'
      Size = 255
    end
    object qrySOPurchasesPurchase_Order_Status: TIntegerField
      FieldName = 'Purchase_Order_Status'
    end
    object qrySOPurchasesStatus_Description: TStringField
      FieldName = 'Status_Description'
      Size = 50
    end
    object qrySOPurchasesTotal_Cost: TCurrencyField
      FieldName = 'Total_Cost'
      DisplayFormat = #163'0.00'
    end
    object qrySOPurchasesQuantity: TFloatField
      FieldName = 'Quantity'
    end
  end
  object dtsSOPurchases: TDataSource
    DataSet = qrySOPurchases
    Left = 96
    Top = 400
  end
  object qryRemovePO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Purchase_OrderLine'
      'set Sales_Order = NULL,'
      '    Sales_Order_Line_No = NULL'
      'WHERE Purchase_OrderLine.Purchase_Order = :Purchase_Order AND'
      'Purchase_OrderLine.Line_No = :Line_no')
    Left = 640
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryDeletePO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Purchase_Order'
      'set Inactive = '#39'Y'#39
      'WHERE Purchase_Order.Purchase_Order = :Purchase_Order')
    Left = 728
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerContact: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Contact_no'
      'from Customer_Contact '
      'where Customer = :Customer AND Contact_Name = :Contact_Name')
    Left = 96
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOSlabs: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Slab_Number'
      'FROM Sales_Order_line, Quote_Slab'
      'WHERE Sales_Order_Line.Quote = Quote_Slab.Quote AND'
      'Sales_Order_Line.Sales_Order = :Sales_Order')
    Left = 584
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetPurchases: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Purchase_Order'
      'FROM Purchase_Orderline'
      'WHERE Sales_Order = :Sales_Order and'
      '(Quantity > Quantity_delivered)')
    Left = 672
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOrderEmail: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       Sales_Order.Sales_Order,'
      '       Customer.Email_Address AS Email,'
      '       Sales_Order.Contact_Name AS Name,'
      '         '#39'Adobe Acrobat Document (*.pdf)'#39' AS export_filter_desc,'
      '         '#39'PDF'#39' AS ExportFilter,'
      '         '#39#39' AS CC_Email,'
      '       Customer_contact.Email_address AS Contact_Email'
      'FROM (Customer'
      '         INNER JOIN Sales_Order'
      '           ON Customer.Customer = Sales_Order.Customer)'
      '         LEFT JOIN Customer_contact'
      
        '           ON (Sales_Order.Customer = Customer_contact.Customer)' +
        ' AND (Sales_Order.Contact_Name = Customer_contact.Contact_name)'
      'WHERE Sales_Order.Sales_Order = :Sales_Order')
    Left = 672
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetQuoteSlabs: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Quote_Slab.Supplier,'
      '        Supplier.Supplier_name,'
      '        Quote_Slab.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Quote_Slab.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Quote_Slab.Unit_Cost,'
      '        Quote_Slab.Quantity,'
      '        Quote_Slab.Quote'
      'FROM Thickness'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Supplier'
      '        INNER JOIN (Worktop'
      '        INNER JOIN Quote_Slab'
      '            ON Worktop.Worktop = Quote_Slab.Worktop)'
      '            ON Supplier.Supplier = Quote_Slab.Supplier)'
      
        '            ON Material_Type.Material_Type = Worktop.Material_Ty' +
        'pe)'
      '            ON Thickness.Thickness = Quote_Slab.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Quote_Slab.Slab_Number')
    Left = 416
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object dtsGetQuoteSlabs: TDataSource
    DataSet = qryGetQuoteSlabs
    Left = 504
    Top = 520
  end
  object qrySalesInvoices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Sales_invoice.Sales_Invoice,'
      '    Sales_invoice.inactive,'
      '    Sales_invoice.Invoice_no,'
      '    Sales_invoice.Invoice_date,'
      
        '    Sum((Sales_invoice_Line.Quantity_Invoiced/Sales_invoice_Line' +
        '.Sell_Unit)*Unit_Price) AS Goods_value,'
      
        '    Sum((((Sales_invoice_Line.Quantity_Invoiced/Sales_invoice_Li' +
        'ne.Sell_Unit)*Unit_Price)*Vat.Vat_Rate/100)+Sales_invoice_Line.V' +
        'at_Value) AS Vat_value,'
      
        '    Sum((((Sales_invoice_Line.Quantity_Invoiced/Sales_invoice_Li' +
        'ne.Sell_Unit)*Unit_Price) +'
      
        '        ((Sales_invoice_Line.Quantity_Invoiced/Sales_invoice_Lin' +
        'e.Sell_Unit)*Unit_Price)*Vat.Vat_Rate/100)+Sales_invoice_Line.Va' +
        't_Value) AS Total_Invoice,'
      '    Sales_invoice_status.Invoice_Status_description,'
      '    Sales_invoice.Invoice_or_Credit,'
      '    Sales_invoice.description,'
      '    Sales_invoice.Paid_Amount'
      'FROM Vat'
      '    INNER JOIN (Sales_invoice_status'
      '    INNER JOIN (Sales_invoice'
      '    INNER JOIN Sales_invoice_line'
      
        '      ON Sales_invoice.Sales_invoice = Sales_invoice_line.Sales_' +
        'invoice)'
      
        '      ON (Sales_invoice_status.Sales_invoice_status = Sales_invo' +
        'ice.Sales_invoice_status) AND (Sales_invoice_status.Sales_invoic' +
        'e_status = Sales_invoice.Sales_invoice_status))'
      
        '      ON (Vat.Vat = Sales_invoice_line.Vat) AND (Vat.Vat = Sales' +
        '_invoice_line.Vat) AND (Vat.Vat = Sales_invoice_line.Vat)'
      'WHERE (Sales_invoice_line.Sales_order = :Sales_Order)'
      'GROUP BY'
      '    Sales_invoice.Sales_Invoice,'
      '    Sales_invoice.inactive,'
      '    Sales_invoice.Invoice_no,'
      '    Sales_invoice.Invoice_date,'
      '    Sales_invoice_status.Invoice_Status_description,'
      '    Sales_invoice.Invoice_or_Credit,'
      '    Sales_invoice.description,'
      '    Sales_invoice.Paid_Amount')
    Left = 704
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsSalesInvoices: TDataSource
    DataSet = qrySalesInvoices
    Left = 768
    Top = 528
  end
  object qryUpQuoteCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Customer = :Customer,'
      '      Customer_Name = :Customer_Name'
      'where Quote = :Quote')
    Left = 168
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryUpJobCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Job'
      'set Customer = :Customer,'
      '      Customer_Name = :Customer_Name'
      'where Job = :Job')
    Left = 24
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOLQuoteNo: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Quote'
      'FROM sales_order_line'
      'WHERE sales_order = :sales_order and'
      '      quote <> NULL and'
      '      Job is NULL'
      'ORDER BY sales_order_line_no')
    Left = 216
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryJobs: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Job.Job,'
      '        Job.Job_Status,'
      '        Job_Status.Job_Status_Description,'
      '        Job.Quote,'
      '        Job.Date_Raised,'
      '        Job.Date_Required,'
      '        Job.Operator,'
      '        Operator.Operator_Name,'
      '        Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Job,'
      '        Job.Customer,'
      '        Customer.Is_retail_customer,'
      '        Job.Contact_name'
      'FROM Customer'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Job_Status'
      '      INNER JOIN (Job'
      '      INNER JOIN Sales_Order_Line'
      '          ON Job.Job = Sales_Order_Line.Job)'
      '          ON Job_Status.Job_Status = Job.Job_Status)'
      '          ON Operator.Operator = Job.Operator)'
      '          ON Customer.Customer = Job.Customer'
      'WHERE Sales_Order_Line.Sales_Order = :Sales_Order'
      '')
    Left = 640
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsJobs: TDataSource
    DataSet = qryJobs
    Left = 704
    Top = 64
  end
  object qryRemedials: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Job.Job,'
      '        Job_Remedial.Remedial_Number,'
      '        (SELECT Top 1 Notes_Text'
      '         FROM Notes'
      
        '         WHERE Job_Remedial.Notes = Notes.Notes_Code) as Remedia' +
        'l_Work,'
      '        Job_Remedial.Fitter,'
      '        Job_Remedial.Operator,'
      '        Job_Remedial.Date_Raised,'
      '        Job_Remedial.Installation_Date,'
      '        Job_Remedial.Completed,'
      '        Job_Remedial.Installation_Price,'
      '        Operator.Operator_Name,'
      '        Fitter.Fitter_Name,'
      '        Sales_Order.Sales_Order as Remedial_Sales_Order'
      'FROM (Fitter'
      '        RIGHT JOIN ((Operator'
      '        INNER JOIN (Job'
      '        INNER JOIN Job_Remedial'
      '            ON Job.Job = Job_Remedial.Job)'
      '            ON Operator.Operator = Job_Remedial.Operator)'
      '        INNER JOIN Sales_Order_Line'
      '            ON Job.Job = Sales_Order_Line.Job)'
      '            ON Fitter.Fitter = Job_Remedial.Fitter)'
      '        LEFT JOIN Sales_Order'
      '            ON Job_Remedial.Remedial = Sales_Order.Remedial_ID'
      'WHERE Sales_Order_Line.Sales_Order = :Sales_Order'
      '')
    Left = 640
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsRemedials: TDataSource
    DataSet = qryRemedials
    Left = 704
    Top = 112
  end
  object qryJobsDummy: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      '  Sales_Order.*,'
      '  Customer.Customer_name AS Original_Customer_name,'
      '  Customer.Account_Code,'
      '  Operator.Operator_name,'
      '  (Goods_Value+VAt_Value) AS Total_Value,'
      
        '  ((Sales_Order.Goods_Value+Sales_Order.VAt_Value)*(Sales_Order.' +
        'Deposit_Terms/100)) AS Deposit_Required,'
      '  Sales_Order_Status.sales_order_status_desc,'
      '  Office_Contact.Operator_Name AS Office_Contact_Name,'
      '  Customer.Is_Retail_Customer,'
      '  Customer.Customer_is_Speculative,'
      '  Customer.Credit_Status,'
      '  Customer.Credit_Limit,'
      '  Templater.Fitter_Name AS Templater_Name,'
      '  Fitter.Fitter_Name,'
      '  (SELECT TOP 1 Sales_Order_Line.Quote'
      '   FROM Sales_Order_Line'
      
        '   WHERE Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order)' +
        ' AS Quote,'
      '  (SELECT TOP 1 Sales_Order_Line.Job'
      '   FROM Sales_Order_Line'
      
        '   WHERE Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order)' +
        ' AS Job,'
      '  (SELECT TOP 1 Job.Job_Status'
      '   FROM Sales_Order_Line, Job'
      
        '   WHERE Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order ' +
        'AND'
      '         Sales_Order_Line.Job = Job.Job) AS Job_Status,'
      
        '  (SELECT Sum((((Quote_Element.Length*Quote_Element.Depth)/10000' +
        '00.00000)*Quote_Element.Quantity)*Worktop_Type_Thickness.Weight_' +
        'kg)'
      '   FROM Sales_Order_Line'
      '     INNER JOIN ((Worktop_Type_Thickness'
      #9#9' INNER JOIN Quote_Element'
      
        #9#9#9'    ON Worktop_Type_Thickness.Thickness = Quote_Element.Thick' +
        'ness)'
      #9#9' INNER JOIN Material_Type'
      
        #9#9#9'    ON (Material_Type.Material_Type = Quote_Element.Material_' +
        'type) AND (Worktop_Type_Thickness.Worktop_Type = Material_Type.W' +
        'orktop_Type))'
      #9#9#9'    ON Sales_Order_Line.Quote = Quote_Element.Quote'
      
        '   WHERE'#9'Sales_Order_line.Sales_Order = Sales_Order.Sales_Order ' +
        'AND'
      
        #9'        Quote_Element.Quote = Sales_Order_Line.Quote) AS Workto' +
        'p_Weight'
      'FROM Operator AS Office_Contact'
      '      RIGHT JOIN (Fitter'
      '      RIGHT JOIN (Sales_Order_Status'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Fitter AS Templater'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN sales_order'
      '            ON Operator.Operator = sales_order.Operator)'
      '            ON Templater.Fitter = sales_order.Templater)'
      '            ON Customer.Customer = sales_order.Customer)'
      
        '            ON Sales_Order_Status.Sales_Order_Status = sales_ord' +
        'er.Sales_Order_Status)'
      '            ON Fitter.Fitter = sales_order.Fitter)'
      
        '            ON Office_Contact.Operator = sales_order.Account_Man' +
        'ager'
      'WHERE 1 = 1'
      '')
    Left = 88
    Top = 72
  end
  object qrySOUpTemplate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Template_Docs_Returned = :Template_Docs_Returned'
      'WHERE Sales_Order = :Sales_Order')
    Left = 672
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Template_Docs_Returned'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qrySOUpFitting: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Fitting_Docs_Returned = :Fitting_Docs_Returned'
      'WHERE Sales_Order = :Sales_Order')
    Left = 752
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fitting_Docs_Returned'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'ORDER BY Revenue_Centre_Descr')
    Left = 840
    Top = 16
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 928
    Top = 16
  end
  object qryRemedialCount: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT max(Sales_Order_Number) as Last_Remedial'
      'FROM Sales_Order'
      'WHERE Original_Sales_Order = :Original_Sales_Order')
    Left = 840
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Original_Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryRemedialReport: TFDQuery
    SQL.Strings = (
      'SELECT  Job_Remedial.Job,'
      '        Job.Job_Status,'
      '        Job_Remedial.Remedial_Number,'
      '        Job_Remedial.Notes as Remedial_Notes,'
      '        Job_Remedial.Material_Required,'
      '        Job_Remedial.Fitter,'
      '        Job_Remedial.Date_Raised,'
      '        Job_Remedial.Items_to_Return_to_Site,'
      '        Job_Remedial.Items_Still_on_Site,'
      '        Job_Remedial.Tools_Required,'
      '        Job_Remedial.Site_Requirements,'
      '        Job_Remedial.Additional_Notes,'
      '        Job_Remedial.Manufacturing_Notes,'
      '        Fitter.Fitter_Name,'
      '        Fitter.Telephone_number,'
      '        Fitter.Mobile_number,'
      '        Fitter.Email_Address,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Contact_name,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Operator.Operator_Name,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Sales_Order_Number,'
      '        (select TOP 1 Revenue_Centre'
      '         from Sales_Order_Line, Sales_Order'
      '         where sales_order_line.Job = Job.Job AND'
      
        '               sales_order_line.Sales_Order = Sales_Order.Sales_' +
        'Order) as Revenue_Centre'
      'FROM Fitter'
      '      RIGHT JOIN (Sales_Order'
      '      INNER JOIN ((Operator'
      '      INNER JOIN (Job'
      '      INNER JOIN Job_Remedial'
      '          ON Job.Job = Job_Remedial.Job)'
      '          ON Operator.Operator = Job_Remedial.Operator)'
      '      INNER JOIN Sales_Order_Line'
      '          ON Job.Job = Sales_Order_Line.Job)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Fitter.Fitter = Job_Remedial.Fitter'
      'WHERE Job.Job = :Job  AND'
      
        '      ((Job_Remedial.Remedial_Number = :Remedial_Number) or (:Re' +
        'medial_Number = 0))'
      'ORDER BY Job_Remedial.Remedial_Number')
    Left = 928
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_Number'
        ParamType = ptUnknown
      end>
  end
  object qryJobsDummyOlder: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      '    sales_order.*,'
      '    Customer.Customer_name AS Original_Customer_name,'
      '    Customer.Account_Code,'
      '    Operator.Operator_name,'
      '    (Goods_Value+VAt_Value) AS Total_Value,'
      
        '    ((Sales_Order.Goods_Value+Sales_Order.VAt_Value)*(Sales_Orde' +
        'r.Deposit_Terms/100)) AS Deposit_Required,'
      '    Sales_Order_Status.sales_order_status_desc,'
      '    Office_Contact.Operator_Name AS Office_Contact_Name,'
      '    Customer.Is_Retail_Customer,'
      '    Customer.Customer_is_Speculative,'
      '    Customer.Credit_Status,'
      '    Customer.Credit_Limit,'
      '    Sales_Order_Line.Quote,'
      '    Templater.Fitter_Name AS Templater_Name,'
      '    Fitter.Fitter_Name,'
      '    Sales_Order_Line.Job,'
      '    Job.Job_Status,'
      
        '    (SELECT Sum((((Quote_Element.Length*Quote_Element.Depth)/100' +
        '0000.00000)*Quote_Element.Quantity)*Worktop_Type_Thickness.Weigh' +
        't_kg)'
      #9'   FROM Sales_Order_Line'
      #9#9'    INNER JOIN ((Worktop_Type_Thickness'
      #9#9'    INNER JOIN Quote_Element'
      
        #9#9#9'    ON Worktop_Type_Thickness.Thickness = Quote_Element.Thick' +
        'ness)'
      #9#9'    INNER JOIN Material_Type'
      
        #9#9#9'    ON (Material_Type.Material_Type = Quote_Element.Material_' +
        'type) AND (Worktop_Type_Thickness.Worktop_Type = Material_Type.W' +
        'orktop_Type))'
      #9#9#9'    ON Sales_Order_Line.Quote = Quote_Element.Quote'
      
        #9'  WHERE'#9'Sales_Order_line.Sales_Order = Sales_Order.Sales_Order ' +
        'AND'
      
        #9#9#9'    Quote_Element.Quote = Sales_Order_Line.Quote) AS Worktop_' +
        'Weight'
      'FROM Job'
      '        INNER JOIN ((Operator AS Office_Contact'
      '        RIGHT JOIN (Fitter'
      '        RIGHT JOIN (Sales_Order_Status'
      '        INNER JOIN (Customer'
      '        INNER JOIN (Fitter AS Templater'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN sales_order'
      '            ON Operator.Operator = sales_order.Operator)'
      '            ON Templater.Fitter = sales_order.Templater)'
      '            ON Customer.Customer = sales_order.Customer)'
      
        '            ON Sales_Order_Status.Sales_Order_Status = sales_ord' +
        'er.Sales_Order_Status)'
      '            ON Fitter.Fitter = sales_order.Fitter)'
      
        '            ON Office_Contact.Operator = sales_order.Account_Man' +
        'ager)'
      '        INNER JOIN Sales_Order_Line'
      
        '            ON sales_order.Sales_Order = Sales_Order_Line.Sales_' +
        'Order)'
      '            ON Job.Job = Sales_Order_Line.Job'
      'WHERE 1 = 1')
    Left = 224
    Top = 80
  end
  object qrySOUpRemedial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Job_Remedial'
      'SET'#9'Job_Remedial.Completed = :Completed'
      'FROM Sales_Order '
      #9#9'INNER JOIN Job_Remedial '
      #9#9#9'ON Sales_Order.Remedial_ID = Job_Remedial.Remedial'
      'WHERE Sales_Order = :Sales_Order')
    Left = 840
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Completed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryJobsDummyOld: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      '    sales_order.*,'
      '    Customer.Customer_name AS Original_Customer_name,'
      '    Customer.Account_Code,'
      '    Operator.Operator_name,'
      '    (Goods_Value+VAt_Value) AS Total_Value,'
      
        '    ((Sales_Order.Goods_Value+Sales_Order.VAt_Value)*(Sales_Orde' +
        'r.Deposit_Terms/100)) AS Deposit_Required,'
      '    Sales_Order_Status.sales_order_status_desc,'
      '    Office_Contact.Operator_Name AS Office_Contact_Name,'
      '    Customer.Is_Retail_Customer,'
      '    Customer.Customer_is_Speculative,'
      '    Customer.Credit_Status,'
      '    Customer.Credit_Limit,'
      '    Sales_Order_Line.Quote,'
      '    Templater.Fitter_Name AS Templater_Name,'
      '    Fitter.Fitter_Name,'
      '    Sales_Order_Line.Job,'
      '    Job.Job_Status,'
      
        '    (SELECT Sum((((Quote_Element.Length*Quote_Element.Depth)/100' +
        '0000.00000)*Quote_Element.Quantity)*Worktop_Type_Thickness.Weigh' +
        't_kg)'
      #9'   FROM Sales_Order_Line'
      #9#9'    INNER JOIN ((Worktop_Type_Thickness'
      #9#9'    INNER JOIN Quote_Element'
      
        #9#9#9'    ON Worktop_Type_Thickness.Thickness = Quote_Element.Thick' +
        'ness)'
      #9#9'    INNER JOIN Material_Type'
      
        #9#9#9'    ON (Material_Type.Material_Type = Quote_Element.Material_' +
        'type) AND (Worktop_Type_Thickness.Worktop_Type = Material_Type.W' +
        'orktop_Type))'
      #9#9#9'    ON Sales_Order_Line.Quote = Quote_Element.Quote'
      
        #9'  WHERE'#9'Sales_Order_line.Sales_Order = Sales_Order.Sales_Order ' +
        'AND'
      
        #9#9#9'    Quote_Element.Quote = Sales_Order_Line.Quote) AS Worktop_' +
        'Weight'
      'FROM Operator AS Office_Contact'
      '    RIGHT JOIN (Fitter'
      '    RIGHT JOIN ((Sales_Order_Status'
      '    INNER JOIN (Customer'
      '    INNER JOIN (Fitter AS Templater'
      '    RIGHT JOIN (Operator'
      '    INNER JOIN sales_order'
      '        ON Operator.Operator = sales_order.Operator)'
      '        ON Templater.Fitter = sales_order.Templater)'
      '        ON Customer.Customer = sales_order.Customer)'
      
        '        ON Sales_Order_Status.Sales_Order_Status = sales_order.S' +
        'ales_Order_Status)'
      '    INNER JOIN (Job'
      '    RIGHT JOIN Sales_Order_Line'
      '        ON Job.Job = Sales_Order_Line.Job)'
      
        '        ON sales_order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Fitter.Fitter = sales_order.Fitter)'
      '        ON Office_Contact.Operator = sales_order.Account_Manager'
      'WHERE 1 = 1')
    Left = 144
    Top = 72
  end
end
