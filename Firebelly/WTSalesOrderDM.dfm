object dtmdlSalesOrder: TdtmdlSalesOrder
  Height = 786
  Width = 1599
  PixelsPerInch = 120
  object qryAllSales: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      
        'select sales_order.Sales_Order, sales_order.Date_Raised, sales_o' +
        'rder.Date_Required, sales_order.Customer, sales_order.Reference,' +
        ' sales_order.Extra_Notes,'
      
        ' sales_order.Operator, sales_order.Contact_name, sales_order.Ord' +
        'er_ref_no, sales_order.Sales_Order_Status, sales_order.Deposit_a' +
        'mount, sales_order.Deposit_Terms,'
      
        ' sales_order.Goods_Value, sales_order.VAT_Value, sales_order.Rep' +
        ', sales_order.Install_Address, sales_order.Inactive, sales_order' +
        '.Customer_Name, sales_order.Inactive_Reason,'
      
        ' sales_order.Address, sales_order.Template_Date, sales_order.Dat' +
        'e_Type, sales_order.Materials_Required, sales_order.Materials_Re' +
        'qd_Date, sales_order.Materials_Recd_Date,'
      
        ' sales_order.Install_Name, sales_order.Install_Phone, sales_orde' +
        'r.On_Hold, sales_order.Email_Address, sales_order.Account_Manage' +
        'r, sales_order.Descriptive_Reference,'
      
        ' sales_order.Template_Duration, sales_order.Fitting_Duration, sa' +
        'les_order.Fitter, sales_order.Is_In_Outlook, sales_order.IsFitti' +
        'ngInOutlook, sales_order.IsTemplateInOutlook,'
      
        ' sales_order.Templater, sales_order.Supply_Only, sales_order.Pro' +
        'ject_Reference, sales_order.Paid_Status, sales_order.Contact_no,' +
        ' sales_order.Appliance_Details, sales_order.Branch_no,'
      
        ' sales_order.Location_Plan_Document, sales_order.Collection_Only' +
        ', sales_order.Installation_Address, sales_order.SSMA_TimeStamp, ' +
        'sales_order.Template_Docs_Returned,'
      
        ' sales_order.Fitting_Docs_Returned, sales_order.Revenue_Centre, ' +
        'sales_order.Remedial_Production, sales_order.Remedial_No_Product' +
        'ion, sales_order.Remedial_ID,'
      
        ' sales_order.Sales_Order_Number, sales_order.Original_Sales_Orde' +
        'r, sales_order.Inv_Customer,'
      
        ' sales_order.Do_not_invoice, sales_order.Stock_Allocation_Start_' +
        'Date, sales_order.Stock_Allocation_End_Date,'
      
        ' customer.Customer_name as original_customer_name, operator.Oper' +
        'ator_name,'
      
        ' (Goods_Value + VAt_Value) as Total_Value, sales_order_status.sa' +
        'les_order_status_desc'
      '  from sales_order, customer, operator, sales_order_status'
      ' where sales_order.customer = customer.customer'
      '  and sales_order.operator = operator.operator'
      
        '  and sales_order.sales_order_status = sales_order_status.sales_' +
        'order_status')
    Left = 41
    Top = 30
    object qryAllSalesSales_Order: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAllSalesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qryAllSalesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qryAllSalesCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qryAllSalesReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Required = True
      Size = 50
    end
    object qryAllSalesExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
      Origin = 'Extra_Notes'
    end
    object qryAllSalesOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      Required = True
    end
    object qryAllSalesContact_name: TWideStringField
      FieldName = 'Contact_name'
      Origin = 'Contact_name'
      Size = 50
    end
    object qryAllSalesOrder_ref_no: TWideStringField
      FieldName = 'Order_ref_no'
      Origin = 'Order_ref_no'
      Required = True
      Size = 30
    end
    object qryAllSalesSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
      Origin = 'Sales_Order_Status'
      Required = True
    end
    object qryAllSalesDeposit_amount: TCurrencyField
      FieldName = 'Deposit_amount'
      Origin = 'Deposit_amount'
    end
    object qryAllSalesDeposit_Terms: TCurrencyField
      FieldName = 'Deposit_Terms'
      Origin = 'Deposit_Terms'
    end
    object qryAllSalesGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
      Origin = 'Goods_Value'
    end
    object qryAllSalesVAT_Value: TCurrencyField
      FieldName = 'VAT_Value'
      Origin = 'VAT_Value'
    end
    object qryAllSalesRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'Rep'
    end
    object qryAllSalesInstall_Address: TIntegerField
      FieldName = 'Install_Address'
      Origin = 'Install_Address'
    end
    object qryAllSalesInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qryAllSalesCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Size = 100
    end
    object qryAllSalesInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
      Origin = 'Inactive_Reason'
    end
    object qryAllSalesAddress: TIntegerField
      FieldName = 'Address'
      Origin = 'Address'
    end
    object qryAllSalesTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
      Origin = 'Template_Date'
    end
    object qryAllSalesoriginal_customer_name: TWideStringField
      FieldName = 'original_customer_name'
      Size = 50
    end
    object qryAllSalesOperator_name: TWideStringField
      FieldName = 'Operator_name'
      Size = 30
    end
    object qryAllSalesTotal_Value: TCurrencyField
      FieldName = 'Total_Value'
      DisplayFormat = '0.00'
    end
    object qryAllSalessales_order_status_desc: TWideStringField
      FieldName = 'sales_order_status_desc'
      Size = 30
    end
    object qryAllSalesOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Origin = 'On_Hold'
      Size = 1
    end
    object qryAllSalesStatus_Text: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Status_Text'
      OnGetText = qryAllSalesStatus_TextGetText
      Size = 50
      Calculated = True
    end
    object qryAllSalesDescriptive_Reference: TWideStringField
      FieldName = 'Descriptive_Reference'
      Origin = 'Descriptive_Reference'
      Size = 255
    end
    object qryAllSalesTemplate_Date_New: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Template_Date_New'
      OnGetText = qryAllSalesTemplate_Date_NewGetText
      Calculated = True
    end
    object qryAllSalesFitting_Date_New: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Fitting_Date_New'
      OnGetText = qryAllSalesFitting_Date_NewGetText
      Calculated = True
    end
    object qryAllSalesOffice_Contact_Name: TWideStringField
      FieldName = 'Office_Contact_Name'
      Size = 60
    end
    object qryAllSalesIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object qryAllSalesProject_Reference: TWideStringField
      FieldName = 'Project_Reference'
      Origin = 'Project_Reference'
      Size = 100
    end
    object qryAllSalesCustomer_is_Speculative: TWideStringField
      FieldName = 'Customer_is_Speculative'
      Origin = 'Customer_is_Speculative'
      Size = 1
    end
    object qryAllSalesDeposit_Required: TCurrencyField
      FieldName = 'Deposit_Required'
      Origin = 'Deposit_Required'
      ReadOnly = True
    end
    object qryAllSalesDate_Type: TWideStringField
      FieldName = 'Date_Type'
      Size = 1
    end
    object qryAllSalesQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
      ReadOnly = True
    end
    object qryAllSalesTemplater_Name: TWideStringField
      FieldName = 'Templater_Name'
      Origin = 'Templater_Name'
      Size = 50
    end
    object qryAllSalesFitter_Name: TWideStringField
      FieldName = 'Fitter_Name'
      Origin = 'Fitter_Name'
      Size = 50
    end
    object qryAllSalesAccount_Code: TWideStringField
      FieldName = 'Account_Code'
    end
    object qryAllSalesTemplate_Docs_Returned: TWideStringField
      FieldName = 'Template_Docs_Returned'
      Size = 1
    end
    object qryAllSalesFitting_Docs_Returned: TWideStringField
      FieldName = 'Fitting_Docs_Returned'
      Size = 1
    end
    object qryAllSalesJob: TCurrencyField
      FieldName = 'Job'
      Origin = 'Job'
      ReadOnly = True
      Required = True
      Precision = 4
    end
    object qryAllSalesJob_Status: TIntegerField
      FieldName = 'Job_Status'
      Origin = 'Job_Status'
      ReadOnly = True
      Required = True
    end
    object qryAllSalesWorktop_Weight: TCurrencyField
      FieldName = 'Worktop_Weight'
      DisplayFormat = '#,##0'
    end
    object qryAllSalesRemedial_Production: TWideStringField
      FieldName = 'Remedial_Production'
      Size = 1
    end
    object qryAllSalesRemedial_No_Production: TWideStringField
      FieldName = 'Remedial_No_Production'
      Size = 1
    end
    object qryAllSalesSales_Order_Number: TFloatField
      FieldName = 'Sales_Order_Number'
    end
    object qryAllSalesBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Size = 100
    end
    object qryAllSalesRemedial_Count: TIntegerField
      FieldName = 'Remedial_Count'
    end
  end
  object dtsAllSales: TDataSource
    DataSet = qryAllSales
    Left = 110
    Top = 30
  end
  object qrydummy: TFDQuery
    SQL.Strings = (
      
        '  sales_order.Sales_Order, sales_order.Date_Raised, sales_order.' +
        'Date_Required, sales_order.Customer, sales_order.Reference, sale' +
        's_order.Extra_Notes,'
      
        '  sales_order.Operator, sales_order.Contact_name, sales_order.Or' +
        'der_ref_no, sales_order.Sales_Order_Status, sales_order.Deposit_' +
        'amount, sales_order.Deposit_Terms,'
      
        '  sales_order.Goods_Value, sales_order.VAT_Value, sales_order.Re' +
        'p, sales_order.Install_Address, sales_order.Inactive, sales_orde' +
        'r.Customer_Name, sales_order.Inactive_Reason,'
      
        '  sales_order.Address, sales_order.Template_Date, sales_order.Da' +
        'te_Type, sales_order.Materials_Required, sales_order.Materials_R' +
        'eqd_Date, sales_order.Materials_Recd_Date,'
      
        '  sales_order.Install_Name, sales_order.Install_Phone, sales_ord' +
        'er.On_Hold, sales_order.Email_Address, sales_order.Account_Manag' +
        'er, sales_order.Descriptive_Reference,'
      
        '  sales_order.Template_Duration, sales_order.Fitting_Duration, s' +
        'ales_order.Fitter, sales_order.Is_In_Outlook, sales_order.IsFitt' +
        'ingInOutlook, sales_order.IsTemplateInOutlook,'
      
        '  sales_order.Templater, sales_order.Supply_Only, sales_order.Pr' +
        'oject_Reference, sales_order.Paid_Status, sales_order.Contact_no' +
        ', sales_order.Appliance_Details, sales_order.Branch_no,'
      
        '  sales_order.Location_Plan_Document, sales_order.Collection_Onl' +
        'y, sales_order.Installation_Address, sales_order.SSMA_TimeStamp,' +
        ' sales_order.Template_Docs_Returned,'
      
        '  sales_order.Fitting_Docs_Returned, sales_order.Revenue_Centre,' +
        ' sales_order.Remedial_Production, sales_order.Remedial_No_Produc' +
        'tion, sales_order.Remedial_ID,'
      
        '  sales_order.Sales_Order_Number, sales_order.Original_Sales_Ord' +
        'er, sales_order.Inv_Customer,'
      
        '  sales_order.Do_not_invoice, sales_order.Stock_Allocation_Start' +
        '_Date, sales_order.Stock_Allocation_End_Date,'
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
        'p_Weight,'
      '    (SELECT COUNT(sales_order)'
      '     FROM Sales_Order as SO'
      
        '     WHERE   (SO.Original_Sales_Order = Sales_Order.Sales_Order)' +
        ' and'
      '             (SO.Remedial_ID <> 0)) as Remedial_Count,'
      #9'Customer_Branch.Branch_Name'
      'FROM Customer_Branch '
      #9#9'RIGHT JOIN (Operator AS Office_Contact '
      #9#9'RIGHT JOIN (Fitter '
      #9#9'RIGHT JOIN (Sales_Order_Status '
      #9#9'INNER JOIN (Customer '
      #9#9'INNER JOIN (Fitter AS Templater '
      #9#9'RIGHT JOIN (Operator '
      #9#9'INNER JOIN sales_order '
      #9#9#9#9'ON Operator.Operator = sales_order.Operator) '
      #9#9#9#9'ON Templater.Fitter = sales_order.Templater) '
      #9#9#9#9'ON Customer.Customer = sales_order.Customer) '
      
        #9#9#9#9'ON Sales_Order_Status.Sales_Order_Status = sales_order.Sales' +
        '_Order_Status) '
      #9#9#9#9'ON Fitter.Fitter = sales_order.Fitter) '
      #9#9#9#9'ON Office_Contact.Operator = sales_order.Account_Manager) '
      
        #9#9#9#9'ON (Customer_Branch.Branch_No = sales_order.Branch_no) AND (' +
        'Customer_Branch.Customer = sales_order.Customer)'
      'WHERE (1=1)')
    Left = 180
    Top = 30
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 360
    Top = 40
  end
  object qrySOGetLast: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Last_Sales_Order_number'
      'from Company')
    Left = 280
    Top = 40
  end
  object qrySOHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'
      #9'Sales_Order.Sales_Order,'
      #9'Sales_Order.Date_Raised,'
      #9'Sales_Order.Date_Required,'
      #9'Sales_Order.Customer,'
      #9'Sales_Order.Reference,'
      #9'Sales_Order.Extra_Notes,'
      #9'Sales_Order.Operator,'
      #9'Sales_Order.Contact_name,'
      #9'Sales_Order.Order_ref_no,'
      #9'Sales_Order.Sales_Order_Status,'
      #9'Sales_Order.Deposit_amount,'
      #9'Sales_Order.Deposit_Terms as Deposit_Terms_SO,'
      #9'Sales_Order.Goods_Value,'
      #9'Sales_Order.VAT_Value,'
      #9'Sales_Order.Rep,'
      #9'Sales_Order.Install_Address,'
      #9'Sales_Order.Inactive,'
      #9'Sales_Order.Customer_Name as Customer_Name_SO,'
      #9'Sales_Order.Inactive_Reason,'
      #9'Sales_Order.Address,'
      #9'Sales_Order.Template_Date,'
      #9'Sales_Order.Date_Type,'
      #9'Sales_Order.Materials_Required,'
      #9'Sales_Order.Materials_Reqd_Date,'
      #9'Sales_Order.Materials_Recd_Date,'
      #9'Sales_Order.Install_Name,'
      #9'Sales_Order.Install_Phone,'
      #9'Sales_Order.On_Hold,'
      #9'Sales_Order.Email_Address,'
      #9'Sales_Order.Account_Manager,'
      #9'Sales_Order.Descriptive_Reference,'
      #9'Sales_Order.Template_Duration,'
      #9'Sales_Order.Fitting_Duration,'
      #9'Sales_Order.Fitter,'
      #9'Sales_Order.Is_In_Outlook,'
      #9'Sales_Order.IsFittingInOutlook,'
      #9'Sales_Order.IsTemplateInOutlook,'
      #9'Sales_Order.Templater,'
      #9'Sales_Order.Supply_Only,'
      #9'Sales_Order.Project_Reference,'
      #9'Sales_Order.Paid_Status,'
      #9'Sales_Order.Contact_no,'
      #9'Sales_Order.Appliance_Details,'
      #9'Sales_Order.Location_Plan_Document,'
      #9'Sales_Order.SSMA_TimeStamp,'
      #9'Sales_Order.Collection_Only,'
      #9'Installation_Address,'
      #9'Sales_Order.Template_Docs_Returned,'
      #9'Sales_Order.Fitting_Docs_Returned,'
      #9'Sales_Order.Revenue_Centre,'
      #9'Sales_Order.Remedial_Production,'
      #9'Sales_Order.Remedial_No_Production,'
      #9'Sales_Order.Sales_Order_Number,'
      #9'Sales_Order.Original_Sales_Order,'
      #9'Sales_Order.Remedial_ID,'
      #9'Sales_Order.Inv_Customer,'
      #9'Sales_Order.Branch_no,'
      #9'Sales_Order.Do_not_invoice,'
      #9'Sales_Order.Stock_Allocation_Start_Date,'
      #9'Sales_Order.Stock_Allocation_End_Date,'
      #9'Customer.Is_retail_customer,'
      #9'Customer.Customer_name,'
      #9'Customer.Street,'
      #9'Customer.Locale,'
      #9'Customer.Town_city,'
      #9'Customer.County_State,'
      #9'Customer.Postcode,'
      #9'Customer.Discount_Rate,'
      #9'Customer.Deposit_Terms,'
      #9'Customer.Customer_is_Speculative,'
      #9'Operator.Operator_Name,'
      #9'Operator.Telephone_number,'
      
        #9'Sales_Order_Status.Sales_Order_Status_Desc AS Status_Descriptio' +
        'n,'
      #9'Rep.Rep_Name'
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
    Left = 50
    Top = 160
    ParamData = <
      item
        Name = 'Sales_Order'
        ParamType = ptInput
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
    Left = 130
    Top = 270
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Operator')
    Left = 200
    Top = 490
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 270
    Top = 490
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set last_sales_order_number = :last_sales_order_number'
      'where company = 1')
    Left = 350
    Top = 490
    ParamData = <
      item
        Name = 'last_sales_order_number'
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
    Left = 50
    Top = 220
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Date_Raised'
      end
      item
        Name = 'Project_Reference'
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Address'
        DataType = ftInteger
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Inactive_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Extra_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Contact_Name'
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Deposit_Terms'
      end
      item
        Name = 'Deposit_Amount'
      end
      item
        Name = 'Installation_Address'
      end
      item
        Name = 'Install_Address'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Order_Ref_no'
      end
      item
        Name = 'Sales_order_Status'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'VAT_Value'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Template_Date'
      end
      item
        Name = 'Date_type'
      end
      item
        Name = 'Materials_Required'
      end
      item
        Name = 'Materials_Reqd_Date'
      end
      item
        Name = 'Materials_Recd_Date'
      end
      item
        Name = 'Email_Address'
      end
      item
        Name = 'Install_Name'
      end
      item
        Name = 'Install_Phone'
      end
      item
        Name = 'On_Hold'
      end
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Descriptive_Reference'
      end
      item
        Name = 'IsTemplateinOutlook'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Template_Duration'
      end
      item
        Name = 'Fitting_Duration'
      end
      item
        Name = 'Fitter'
        DataType = ftInteger
      end
      item
        Name = 'Templater'
        DataType = ftInteger
      end
      item
        Name = 'Collection_Only'
      end
      item
        Name = 'Supply_Only'
      end
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Appliance_Details'
      end
      item
        Name = 'Location_Plan_Document'
      end
      item
        Name = 'Fitting_Docs_Returned'
      end
      item
        Name = 'Template_Docs_Returned'
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Remedial_No_Production'
      end
      item
        Name = 'Remedial_Production'
      end
      item
        Name = 'Remedial_ID'
      end
      item
        Name = 'Sales_Order_Number'
      end
      item
        Name = 'Original_Sales_Order'
      end
      item
        Name = 'Do_Not_Invoice'
      end
      item
        Name = 'Inv_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
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
    Left = 50
    Top = 330
    ParamData = <
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Date_Raised'
      end
      item
        Name = 'Project_Reference'
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Inactive_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Extra_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Contact_Name'
        DataType = ftString
      end
      item
        Name = 'Address'
        DataType = ftInteger
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Deposit_Terms'
      end
      item
        Name = 'Deposit_Amount'
      end
      item
        Name = 'Installation_Address'
      end
      item
        Name = 'Install_Address'
        DataType = ftInteger
      end
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Order_Ref_no'
      end
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Template_Date'
      end
      item
        Name = 'Date_Type'
      end
      item
        Name = 'Materials_Required'
      end
      item
        Name = 'Materials_Reqd_Date'
      end
      item
        Name = 'Materials_Recd_Date'
      end
      item
        Name = 'On_Hold'
      end
      item
        Name = 'Email_Address'
      end
      item
        Name = 'Install_Name'
      end
      item
        Name = 'Install_Phone'
      end
      item
        Name = 'Descriptive_Reference'
      end
      item
        Name = 'Fitter'
        DataType = ftInteger
      end
      item
        Name = 'Templater'
        DataType = ftInteger
      end
      item
        Name = 'Collection_Only'
      end
      item
        Name = 'Supply_Only'
      end
      item
        Name = 'IsTemplateInOutlook'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Template_Duration'
      end
      item
        Name = 'Fitting_Duration'
      end
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Appliance_Details'
      end
      item
        Name = 'Location_Plan_Document'
      end
      item
        Name = 'Fitting_Docs_Returned'
      end
      item
        Name = 'Template_Docs_Returned'
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Remedial_No_Production'
      end
      item
        Name = 'Remedial_Production'
      end
      item
        Name = 'Remedial_ID'
      end
      item
        Name = 'Do_Not_Invoice'
      end
      item
        Name = 'Inv_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
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
    Left = 130
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Element_Number'
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
    Left = 130
    Top = 220
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_Line_no'
      end
      item
        Name = 'Job'
        DataType = ftFloat
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Sell_unit'
      end
      item
        Name = 'Cost_unit'
      end
      item
        Name = 'Nett_Price'
      end
      item
        Name = 'Discount_Value'
      end
      item
        Name = 'Installation_Price'
      end
      item
        Name = 'Survey_Price'
      end
      item
        Name = 'Delivery_Price'
      end
      item
        Name = 'Vat'
        DataType = ftInteger
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Product'
        DataType = ftInteger
      end
      item
        Name = 'Quote'
        DataType = ftInteger
      end
      item
        Name = 'Markup_Value'
      end
      item
        Name = 'Waste_Value'
      end>
  end
  object qryRep: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * '
      'from Rep')
    Left = 590
    Top = 50
  end
  object dtsRep: TDataSource
    DataSet = qryRep
    Left = 650
    Top = 50
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Street, Locale,Town_City, Postcode, County_State,Telephon' +
        'e_number, Fax_number, email_address, web_address'
      'from Customer where Customer = :Customer')
    Left = 120
    Top = 430
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qrygetRep: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Rep'
      'where Rep = :rep')
    Left = 590
    Top = 120
    ParamData = <
      item
        Name = 'rep'
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Address_Name, Street, Locale,Town_City, Postcode, County_' +
        'State,Telephone_number, Fax_number, email_address, web_address'
      'from Address where Address = :Address')
    Left = 50
    Top = 430
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryGetNextAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(address) as Last_Address'
      'from Address')
    Left = 520
    Top = 20
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
    Left = 520
    Top = 90
    ParamData = <
      item
        Name = 'Address'
      end
      item
        Name = 'Address_name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'Town_city'
      end
      item
        Name = 'Postcode'
      end
      item
        Name = 'County_state'
      end
      item
        Name = 'Telephone_number'
      end
      item
        Name = 'email_address'
      end
      item
        Name = 'Installation_Address'
        DataType = ftString
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
    Left = 520
    Top = 150
    ParamData = <
      item
        Name = 'Address_Name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'Town_City'
      end
      item
        Name = 'Postcode'
      end
      item
        Name = 'County_State'
      end
      item
        Name = 'Telephone_number'
      end
      item
        Name = 'email_Address'
      end
      item
        Name = 'Address'
      end>
  end
  object qryDelAddress: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'delete from Address'
      'where address = :address')
    Left = 520
    Top = 220
    ParamData = <
      item
        Name = 'address'
      end>
  end
  object qryVAT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from VAt'
      'order by Vat_Rate')
    Left = 520
    Top = 290
    object qryVATVat: TIntegerField
      FieldName = 'Vat'
      Origin = 'Vat'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVATVat_Rate: TCurrencyField
      FieldName = 'Vat_Rate'
      Origin = 'Vat_Rate'
      Required = True
    end
    object qryVATDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 40
    end
    object qryVATVat_Code: TWideStringField
      FieldName = 'Vat_Code'
      Origin = 'WT.Vat.Vat_Code'
      Size = 1
    end
  end
  object dtsVAT: TDataSource
    DataSet = qryVAT
    Left = 580
    Top = 290
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
    Left = 280
    Top = 160
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryGetVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from vat'
      'where vat = :vat')
    Left = 520
    Top = 360
    ParamData = <
      item
        Name = 'vat'
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
    Left = 280
    Top = 240
    ParamData = <
      item
        Name = 'Quote'
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
    Left = 520
    Top = 430
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'Reference'
      end>
  end
  object dsCustQuotes: TDataSource
    DataSet = qryCustQuotes
    Left = 620
    Top = 430
  end
  object dsDummy: TDataSource
    Left = 730
    Top = 430
  end
  object qryGetQuoteJob: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job.Job'
      'from Job'
      'where Quote = :quote')
    Left = 520
    Top = 500
    ParamData = <
      item
        Name = 'quote'
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
      
        ' ((SOL.job IS NOT NULL) or (SOL.Quote IS NOT NULL))) as total_jo' +
        'b_Lines,'
      '(select sum(Paid_Amount)'
      ' from Payment'
      ' where Payment.Sales_Order = :sales_order) as total_Paid'
      'from Sales_order_line'
      'where Sales_order_line.sales_order = :sales_order')
    Left = 700
    Top = 340
    ParamData = <
      item
        Name = 'sales_order'
        ParamType = ptInput
      end>
  end
  object qrySOUpStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update sales_order'
      'set sales_order_status = :sales_order_Status'
      'where sales_order = :sales_order')
    Left = 700
    Top = 280
    ParamData = <
      item
        Name = 'sales_order_Status'
      end
      item
        Name = 'sales_order'
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
    Left = 210
    Top = 220
    ParamData = <
      item
        Name = 'Job'
        DataType = ftFloat
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Sell_unit'
      end
      item
        Name = 'Cost_unit'
      end
      item
        Name = 'Nett_Price'
      end
      item
        Name = 'Discount_Value'
      end
      item
        Name = 'Installation_Price'
      end
      item
        Name = 'Survey_Price'
      end
      item
        Name = 'Delivery_Price'
      end
      item
        Name = 'Vat'
        DataType = ftInteger
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Product'
        DataType = ftInteger
      end
      item
        Name = 'Quote'
        DataType = ftInteger
      end
      item
        Name = 'Markup_Value'
      end
      item
        Name = 'Waste_Value'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_Line_no'
      end>
  end
  object qryGetSOrderInvoices: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Sales_Invoice_Line'
      'where sales_order = :sales_order')
    Left = 280
    Top = 370
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qrySetSOrderInactive: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update sales_order'
      'set inactive = '#39'Y'#39
      'where sales_order = :Sales_Order')
    Left = 280
    Top = 430
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryUpCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update customer'
      'set prospect = '#39'N'#39
      'where customer = :customer')
    Left = 670
    Top = 180
    ParamData = <
      item
        Name = 'customer'
      end>
  end
  object qryUpQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where Quote = :Quote')
    Left = 280
    Top = 290
    ParamData = <
      item
        Name = 'Quote_Status'
      end
      item
        Name = 'Quote'
      end>
  end
  object qrySOUpSalesInvoice: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Invoice'
      'Set Customer_Name = :Customer_Name'
      'Where Reference = :Reference')
    Left = 730
    Top = 500
    ParamData = <
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Reference'
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
    Left = 800
    Top = 20
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryGetLinkedQuotesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      Required = True
    end
    object qryGetLinkedQuotesSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
      Origin = 'Sales_order_Line_no'
      Required = True
    end
    object qryGetLinkedQuotesQuote_Number: TCurrencyField
      FieldName = 'Quote_Number'
      Origin = 'Quote_Number'
    end
    object qryGetLinkedQuotesQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
      Required = True
    end
    object qryGetLinkedQuotesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qryGetLinkedQuotesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qryGetLinkedQuotesDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 255
    end
    object qryGetLinkedQuotesOriginal_Quote: TIntegerField
      FieldName = 'Original_Quote'
      Origin = 'Original_Quote'
    end
    object qryGetLinkedQuotesOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      Required = True
      Size = 30
    end
    object qryGetLinkedQuotesInstallation_price: TCurrencyField
      FieldName = 'Installation_price'
      Origin = 'Installation_price'
      Required = True
    end
    object qryGetLinkedQuotesDelivery_Price: TCurrencyField
      FieldName = 'Delivery_Price'
      Origin = 'Delivery_Price'
      Required = True
    end
    object qryGetLinkedQuotesSurvey_price: TCurrencyField
      FieldName = 'Survey_price'
      Origin = 'Survey_price'
      Required = True
    end
    object qryGetLinkedQuotesComplete_Price: TCurrencyField
      FieldName = 'Complete_Price'
      Origin = 'Complete_Price'
      ReadOnly = True
    end
    object qryGetLinkedQuotesTotal_Price: TCurrencyField
      FieldName = 'Total_Price'
      Origin = 'Total_Price'
      ReadOnly = True
    end
    object qryGetLinkedQuotesQuote_status_description: TWideStringField
      FieldName = 'Quote_status_description'
      Origin = 'Quote_status_description'
      Required = True
      Size = 50
    end
    object qryGetLinkedQuotesMaterial_Type_Description: TWideStringField
      FieldName = 'Material_Type_Description'
      Size = 30
    end
  end
  object dtsGetLinkedQuotes: TDataSource
    DataSet = qryGetLinkedQuotes
    Left = 880
    Top = 20
  end
  object qryGetSOHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select *'
      'From Sales_Order'
      'where sales_order = :Sales_Order')
    Left = 670
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryFitter: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Fitter'
      'where (inactive = '#39'N'#39') OR (Fitter = :Fitter)'
      'Order By Fitter_Name')
    Left = 810
    Top = 280
    ParamData = <
      item
        Name = 'Fitter'
      end>
  end
  object qryTemplater: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Fitter'
      'where (inactive = '#39'N'#39') OR (Fitter = :Templater)'
      'ORDER BY Fitter_Name')
    Left = 810
    Top = 350
    ParamData = <
      item
        Name = 'Templater'
      end>
  end
  object dtsFitter: TDataSource
    DataSet = qryFitter
    Left = 910
    Top = 280
  end
  object dtsTemplater: TDataSource
    DataSet = qryTemplater
    Left = 910
    Top = 350
  end
  object qrySOEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Sales_Order_internal_Note, Operator'
      
        'where Sales_Order = :Sales_Order and Internal_Note = :Internal_N' +
        'ote and'
      'Sales_Order_internal_Note.Operator = Operator.Operator')
    Left = 360
    Top = 110
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Internal_Note'
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
    Left = 360
    Top = 190
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Internal_Note'
      end
      item
        Name = 'Date_Time_Entered'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Narrative'
      end>
  end
  object qrySOAllEvents: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select'#9's.Sales_Order,'
      #9's.Internal_Note,'
      #9's.Date_Time_Entered,'
      #9's.Narrative,'
      #9'o.Operator,'
      #9'o.Operator_Name,'
      #9'o.Login_name,'
      #9'o.Operator_Can_Login,'
      #9'o.Telephone_number,'
      #9'o.Quote_Follow_Up_Reminder,'
      #9'o.End_User,'
      #9'o.Can_Update_Schedule,'
      #9'o.Email_Address,'
      #9'o.Job_Title,'
      #9'o.Mobile_Number,'
      #9'o.Login_Password,'
      #9'o.Revenue_Centre'
      '  from Sales_Order_internal_Note as s'
      '    join Operator as o on o.Operator = s.Operator'
      ' where Sales_Order = :Sales_Order')
    Left = 360
    Top = 250
    ParamData = <
      item
        Name = 'Sales_Order'
        ParamType = ptInput
      end>
  end
  object qryQAllEvents: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Quote_internal_Note, Operator'
      'where Quote = :Quote and'
      'Quote_internal_Note.Operator = Operator.Operator')
    Left = 360
    Top = 320
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryUpQuoteVersions: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where (Original_Quote = :Original_Quote) AND'
      '      (Quote <> :Quote)')
    Left = 270
    Top = 560
    ParamData = <
      item
        Name = 'Quote_Status'
      end
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'Quote'
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
    Left = 400
    Top = 590
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteSlabs: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT Quote_Slab.Supplier'
      'FROM Quote_Slab'
      'WHERE Quote = :Quote'
      'GROUP BY Supplier')
    Left = 520
    Top = 580
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qrySOPurchases: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
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
    Left = 50
    Top = 500
    ParamData = <
      item
        Name = 'Sales_Order'
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
    object qrySOPurchasesPurchase_Order: TIntegerField
      FieldName = 'Purchase_Order'
      Origin = 'Purchase_Order'
      Required = True
    end
    object qrySOPurchasesLine_no: TIntegerField
      FieldName = 'Line_no'
      Origin = 'Line_no'
      Required = True
    end
    object qrySOPurchasesPO_Line_Description: TWideStringField
      FieldName = 'PO_Line_Description'
      Origin = 'PO_Line_Description'
      Required = True
      Size = 255
    end
    object qrySOPurchasesUnit_cost: TCurrencyField
      FieldName = 'Unit_cost'
    end
    object qrySOPurchasesSlab_Unit_Cost: TCurrencyField
      FieldName = 'Slab_Unit_Cost'
      Origin = 'Slab_Unit_Cost'
    end
    object qrySOPurchasesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qrySOPurchasesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qrySOPurchasesOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      Required = True
    end
    object qrySOPurchasesOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      Required = True
      Size = 30
    end
    object qrySOPurchasesOffice_Contact: TIntegerField
      FieldName = 'Office_Contact'
      Origin = 'Office_Contact'
    end
    object qrySOPurchasesOffice_Contact_Name: TWideStringField
      FieldName = 'Office_Contact_Name'
      Origin = 'Office_Contact_Name'
      Required = True
      Size = 30
    end
    object qrySOPurchasesInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qrySOPurchasesOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Origin = 'On_Hold'
      Size = 1
    end
    object qrySOPurchasesSupplier: TIntegerField
      FieldName = 'Supplier'
      Origin = 'Supplier'
      Required = True
    end
    object qrySOPurchasesSupplier_name: TWideStringField
      FieldName = 'Supplier_name'
      Origin = 'Supplier_name'
      Required = True
      Size = 50
    end
    object qrySOPurchasesContact_no: TIntegerField
      FieldName = 'Contact_no'
      Origin = 'Contact_no'
    end
    object qrySOPurchasesContact_name: TWideStringField
      FieldName = 'Contact_name'
      Origin = 'Contact_name'
      Required = True
      Size = 30
    end
    object qrySOPurchasesGRN_Number: TWideStringField
      FieldName = 'GRN_Number'
      Origin = 'GRN_Number'
      Size = 10
    end
    object qrySOPurchasesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
    end
    object qrySOPurchasesSales_Order_Line_No: TIntegerField
      FieldName = 'Sales_Order_Line_No'
      Origin = 'Sales_Order_Line_No'
    end
    object qrySOPurchasesSlab_Depth: TIntegerField
      FieldName = 'Slab_Depth'
      Origin = 'Slab_Depth'
    end
    object qrySOPurchasesSlab_Length: TIntegerField
      FieldName = 'Slab_Length'
      Origin = 'Slab_Length'
    end
    object qrySOPurchasesSlab_Description: TWideStringField
      FieldName = 'Slab_Description'
      Origin = 'Slab_Description'
      Size = 50
    end
    object qrySOPurchasesSlab_Size_Description: TWideStringField
      FieldName = 'Slab_Size_Description'
      Origin = 'Slab_Size_Description'
      ReadOnly = True
      Size = 78
    end
    object qrySOPurchasesPurchase_Order_Status: TIntegerField
      FieldName = 'Purchase_Order_Status'
      Origin = 'Purchase_Order_Status'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySOPurchasesStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Required = True
      Size = 50
    end
    object qrySOPurchasesTotal_Cost: TCurrencyField
      FieldName = 'Total_Cost'
      DisplayFormat = #163'0.00'
    end
    object qrySOPurchasesQuantity: TCurrencyField
      FieldName = 'Quantity'
    end
  end
  object dtsSOPurchases: TDataSource
    DataSet = qrySOPurchases
    Left = 120
    Top = 500
  end
  object qryRemovePO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Purchase_OrderLine'
      'set Sales_Order = NULL,'
      '    Sales_Order_Line_No = NULL'
      'WHERE Purchase_OrderLine.Purchase_Order = :Purchase_Order AND'
      'Purchase_OrderLine.Line_No = :Line_no')
    Left = 800
    Top = 200
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line_no'
      end>
  end
  object qryDeletePO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Purchase_Order'
      'set Inactive = '#39'Y'#39
      'WHERE Purchase_Order.Purchase_Order = :Purchase_Order')
    Left = 910
    Top = 200
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetCustomerContact: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Contact_no'
      'from Customer_Contact '
      'where Customer = :Customer AND Contact_Name = :Contact_Name')
    Left = 120
    Top = 360
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Contact_Name'
      end>
  end
  object qryGetSOSlabs: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Slab_Number'
      'FROM Sales_Order_line, Quote_Slab'
      'WHERE Sales_Order_Line.Quote = Quote_Slab.Quote AND'
      'Sales_Order_Line.Sales_Order = :Sales_Order')
    Left = 730
    Top = 570
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetPurchases: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Purchase_Order'
      'FROM Purchase_Orderline'
      'WHERE Sales_Order = :Sales_Order and'
      '(Quantity > Quantity_delivered)')
    Left = 840
    Top = 500
    ParamData = <
      item
        Name = 'Sales_Order'
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
    Left = 840
    Top = 430
    ParamData = <
      item
        Name = 'Sales_Order'
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
    Left = 520
    Top = 650
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object dtsGetQuoteSlabs: TDataSource
    DataSet = qryGetQuoteSlabs
    Left = 630
    Top = 650
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
    Left = 880
    Top = 660
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object dtsSalesInvoices: TDataSource
    DataSet = qrySalesInvoices
    Left = 960
    Top = 660
  end
  object qryUpQuoteCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Customer = :Customer,'
      '      Customer_Name = :Customer_Name'
      'where Quote = :Quote')
    Left = 210
    Top = 320
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Quote'
      end>
  end
  object qryUpJobCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Job'
      'set Customer = :Customer,'
      '      Customer_Name = :Customer_Name'
      'where Job = :Job')
    Left = 60
    Top = 600
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Job'
      end>
  end
  object qryGetSOLQuoteNo: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Quote'
      'FROM sales_order_line'
      'WHERE sales_order = :sales_order and'
      '      quote IS NOT NULL and'
      '      Job is NULL'
      'ORDER BY sales_order_line_no')
    Left = 270
    Top = 630
    ParamData = <
      item
        Name = 'sales_order'
        ParamType = ptInput
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
    Left = 800
    Top = 80
    ParamData = <
      item
        Name = 'Sales_Order'
        ParamType = ptInput
      end>
  end
  object dtsJobs: TDataSource
    DataSet = qryJobs
    Left = 880
    Top = 80
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
    Left = 800
    Top = 140
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object dtsRemedials: TDataSource
    DataSet = qryRemedials
    Left = 880
    Top = 140
  end
  object qryJobsDummy: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        '  sales_order.Sales_Order, sales_order.Date_Raised, sales_order.' +
        'Date_Required, sales_order.Customer, sales_order.Reference, sale' +
        's_order.Extra_Notes,'
      
        '  sales_order.Operator, sales_order.Contact_name, sales_order.Or' +
        'der_ref_no, sales_order.Sales_Order_Status, sales_order.Deposit_' +
        'amount, sales_order.Deposit_Terms,'
      
        '  sales_order.Goods_Value, sales_order.VAT_Value, sales_order.Re' +
        'p, sales_order.Install_Address, sales_order.Inactive, sales_orde' +
        'r.Customer_Name, sales_order.Inactive_Reason,'
      
        '  sales_order.Address, sales_order.Template_Date, sales_order.Da' +
        'te_Type, sales_order.Materials_Required, sales_order.Materials_R' +
        'eqd_Date, sales_order.Materials_Recd_Date,'
      
        '  sales_order.Install_Name, sales_order.Install_Phone, sales_ord' +
        'er.On_Hold, sales_order.Email_Address, sales_order.Account_Manag' +
        'er, sales_order.Descriptive_Reference,'
      
        '  sales_order.Template_Duration, sales_order.Fitting_Duration, s' +
        'ales_order.Fitter, sales_order.Is_In_Outlook, sales_order.IsFitt' +
        'ingInOutlook, sales_order.IsTemplateInOutlook,'
      
        '  sales_order.Templater, sales_order.Supply_Only, sales_order.Pr' +
        'oject_Reference, sales_order.Paid_Status, sales_order.Contact_no' +
        ', sales_order.Appliance_Details, sales_order.Branch_no,'
      
        '  sales_order.Location_Plan_Document, sales_order.Collection_Onl' +
        'y, sales_order.Installation_Address, sales_order.SSMA_TimeStamp,' +
        ' sales_order.Template_Docs_Returned,'
      
        '  sales_order.Fitting_Docs_Returned, sales_order.Revenue_Centre,' +
        ' sales_order.Remedial_Production, sales_order.Remedial_No_Produc' +
        'tion, sales_order.Remedial_ID,'
      
        '  sales_order.Sales_Order_Number, sales_order.Original_Sales_Ord' +
        'er, sales_order.Inv_Customer,'
      
        '  sales_order.Do_not_invoice, sales_order.Stock_Allocation_Start' +
        '_Date, sales_order.Stock_Allocation_End_Date,'
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
        'p_Weight,'
      '    (SELECT COUNT(sales_order)'
      '     FROM Sales_Order as SO'
      
        '     WHERE   (SO.Original_Sales_Order = Sales_Order.Sales_Order)' +
        ' and'
      '             (SO.Remedial_ID <> 0)) as Remedial_Count,'
      #9'Customer_Branch.Branch_Name'
      'FROM Customer_Branch '
      #9#9'RIGHT JOIN (Operator AS Office_Contact '
      #9#9'RIGHT JOIN (Fitter '
      #9#9'RIGHT JOIN (Sales_Order_Status '
      #9#9'INNER JOIN (Customer '
      #9#9'INNER JOIN (Fitter AS Templater '
      #9#9'RIGHT JOIN (Operator '
      #9#9'INNER JOIN sales_order '
      #9#9#9#9'ON Operator.Operator = sales_order.Operator) '
      #9#9#9#9'ON Templater.Fitter = sales_order.Templater) '
      #9#9#9#9'ON Customer.Customer = sales_order.Customer) '
      
        #9#9#9#9'ON Sales_Order_Status.Sales_Order_Status = sales_order.Sales' +
        '_Order_Status) '
      #9#9#9#9'ON Fitter.Fitter = sales_order.Fitter) '
      #9#9#9#9'ON Office_Contact.Operator = sales_order.Account_Manager) '
      
        #9#9#9#9'ON (Customer_Branch.Branch_No = sales_order.Branch_no) AND (' +
        'Customer_Branch.Customer = sales_order.Customer)'
      'WHERE (1=1)')
    Left = 110
    Top = 90
  end
  object qrySOUpTemplate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Template_Docs_Returned = :Template_Docs_Returned'
      'WHERE Sales_Order = :Sales_Order')
    Left = 840
    Top = 570
    ParamData = <
      item
        Name = 'Template_Docs_Returned'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOUpFitting: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Fitting_Docs_Returned = :Fitting_Docs_Returned'
      'WHERE Sales_Order = :Sales_Order')
    Left = 940
    Top = 570
    ParamData = <
      item
        Name = 'Fitting_Docs_Returned'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'ORDER BY Revenue_Centre_Descr')
    Left = 1050
    Top = 20
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 1160
    Top = 20
  end
  object qryRemedialCount: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT max(Sales_Order_Number) as Last_Remedial'
      'FROM Sales_Order'
      'WHERE Original_Sales_Order = :Original_Sales_Order')
    Left = 1050
    Top = 90
    ParamData = <
      item
        Name = 'Original_Sales_Order'
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
    Left = 1160
    Top = 90
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end
      item
        Name = 'Remedial_Number'
      end>
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
    Left = 1050
    Top = 160
    ParamData = <
      item
        Name = 'Completed'
      end
      item
        Name = 'Sales_Order'
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
    Left = 370
    Top = 100
  end
  object qrySOUpRemedial_Access: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Job_Remedial'
      #9#9'INNER JOIN Sales_order'
      #9#9#9'ON Sales_Order.Remedial_ID = Job_Remedial.Remedial'
      'SET'#9'Job_Remedial.Completed = :Completed'
      'WHERE Sales_Order = :Sales_Order')
    Left = 1050
    Top = 160
    ParamData = <
      item
        Name = 'Completed'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qryDummyOld: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        '  sales_order.Sales_Order, sales_order.Date_Raised, sales_order.' +
        'Date_Required, sales_order.Customer, sales_order.Reference, sale' +
        's_order.Extra_Notes,'
      
        '  sales_order.Operator, sales_order.Contact_name, sales_order.Or' +
        'der_ref_no, sales_order.Sales_Order_Status, sales_order.Deposit_' +
        'amount, sales_order.Deposit_Terms,'
      
        '  sales_order.Goods_Value, sales_order.VAT_Value, sales_order.Re' +
        'p, sales_order.Install_Address, sales_order.Inactive, sales_orde' +
        'r.Customer_Name, sales_order.Inactive_Reason,'
      
        '  sales_order.Address, sales_order.Template_Date, sales_order.Da' +
        'te_Type, sales_order.Materials_Required, sales_order.Materials_R' +
        'eqd_Date, sales_order.Materials_Recd_Date,'
      
        '  sales_order.Install_Name, sales_order.Install_Phone, sales_ord' +
        'er.On_Hold, sales_order.Email_Address, sales_order.Account_Manag' +
        'er, sales_order.Descriptive_Reference,'
      
        '  sales_order.Template_Duration, sales_order.Fitting_Duration, s' +
        'ales_order.Fitter, sales_order.Is_In_Outlook, sales_order.IsFitt' +
        'ingInOutlook, sales_order.IsTemplateInOutlook,'
      
        '  sales_order.Templater, sales_order.Supply_Only, sales_order.Pr' +
        'oject_Reference, sales_order.Paid_Status, sales_order.Contact_no' +
        ', sales_order.Appliance_Details, sales_order.Branch_no,'
      
        '  sales_order.Location_Plan_Document, sales_order.Collection_Onl' +
        'y, sales_order.Installation_Address, sales_order.SSMA_TimeStamp,' +
        ' sales_order.Template_Docs_Returned,'
      
        '  sales_order.Fitting_Docs_Returned, sales_order.Revenue_Centre,' +
        ' sales_order.Remedial_Production, sales_order.Remedial_No_Produc' +
        'tion, sales_order.Remedial_ID,'
      
        '  cast(sales_order.Sales_Order_Number as varchar(10)) as Sales_O' +
        'rder_Number, sales_order.Original_Sales_Order, sales_order.Inv_C' +
        'ustomer,'
      
        '  sales_order.Do_not_invoice, sales_order.Stock_Allocation_Start' +
        '_Date, sales_order.Stock_Allocation_End_Date,'
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
    Left = 260
    Top = 30
  end
  object qryJobsDummyOld: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        '  sales_order.Sales_Order, sales_order.Date_Raised, sales_order.' +
        'Date_Required, sales_order.Customer, sales_order.Reference, sale' +
        's_order.Extra_Notes,'
      
        '  sales_order.Operator, sales_order.Contact_name, sales_order.Or' +
        'der_ref_no, sales_order.Sales_Order_Status, sales_order.Deposit_' +
        'amount, sales_order.Deposit_Terms,'
      
        '  sales_order.Goods_Value, sales_order.VAT_Value, sales_order.Re' +
        'p, sales_order.Install_Address, sales_order.Inactive, sales_orde' +
        'r.Customer_Name, sales_order.Inactive_Reason,'
      
        '  sales_order.Address, sales_order.Template_Date, sales_order.Da' +
        'te_Type, sales_order.Materials_Required, sales_order.Materials_R' +
        'eqd_Date, sales_order.Materials_Recd_Date,'
      
        '  sales_order.Install_Name, sales_order.Install_Phone, sales_ord' +
        'er.On_Hold, sales_order.Email_Address, sales_order.Account_Manag' +
        'er, sales_order.Descriptive_Reference,'
      
        '  sales_order.Template_Duration, sales_order.Fitting_Duration, s' +
        'ales_order.Fitter, sales_order.Is_In_Outlook, sales_order.IsFitt' +
        'ingInOutlook, sales_order.IsTemplateInOutlook,'
      
        '  sales_order.Templater, sales_order.Supply_Only, sales_order.Pr' +
        'oject_Reference, sales_order.Paid_Status, sales_order.Contact_no' +
        ', sales_order.Appliance_Details, sales_order.Branch_no,'
      
        '  sales_order.Location_Plan_Document, sales_order.Collection_Onl' +
        'y, sales_order.Installation_Address, sales_order.SSMA_TimeStamp,' +
        ' sales_order.Template_Docs_Returned,'
      
        '  sales_order.Fitting_Docs_Returned, sales_order.Revenue_Centre,' +
        ' sales_order.Remedial_Production, sales_order.Remedial_No_Produc' +
        'tion, sales_order.Remedial_ID,'
      
        '  cast(sales_order.Sales_Order_Number as varchar(10)) as Sales_O' +
        'rder_Number, sales_order.Original_Sales_Order, sales_order.Inv_C' +
        'ustomer,'
      
        '  sales_order.Do_not_invoice, sales_order.Stock_Allocation_Start' +
        '_Date, sales_order.Stock_Allocation_End_Date,'
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
    Left = 260
    Top = 90
  end
  object qrySOAllCharges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Associate_Charge.ID,'
      '        Sales_Order_Associate_Charge.Associate_Customer,'
      '        Customer.Customer_Name,'
      '        Sales_Order_Associate_Charge.Product,'
      '        Product.Product_code,'
      '        Product.Product_Description,'
      '        Sales_Order_Associate_Charge.Unit_Price,'
      '        Sales_Order_Associate_Charge.Sell_Unit,'
      '        Sales_Order_Associate_Charge.Unit_Cost,'
      '        Sales_Order_Associate_Charge.Cost_Unit,'
      '        Sales_Order_Associate_Charge.Quantity,'
      '        Sales_Order_Associate_Charge.Vat,'
      '        Vat.Vat_Rate,'
      '        Vat.Description as Vat_Description,'
      '        Sales_Order_Associate_Charge.Charge_Invoiced,'
      '        Sales_Order_Associate_Charge.Sales_Invoice,'
      '        Sales_Order_Associate_Charge.Sales_Order_line_no,'
      '        Sales_Order_Associate_Charge.Parent_ID,'
      '        Sales_invoice.Invoice_date,'
      '        Sales_Invoice.Invoice_no,'
      
        '        Parent_Associate_Charge.Sales_Order as Parent_Sales_Orde' +
        'r,'
      
        '        Parent_Sales_Order.Template_Date as Parent_Template_Date' +
        ','
      '        Parent_Sales_Order.Date_Required as Parent_Fitting_Date,'
      
        '        Parent_Sales_Order.Descriptive_Reference as Parent_Descr' +
        'iption,'
      '        Parent_Sales_Order.Reference as Parent_Reference'
      'FROM Sales_Order AS Parent_Sales_Order'
      
        '        RIGHT JOIN (Sales_Order_Associate_Charge AS Parent_Assoc' +
        'iate_Charge'
      '        RIGHT JOIN (Vat'
      '        INNER JOIN (Sales_invoice'
      '        RIGHT JOIN (Product'
      '        INNER JOIN (Customer'
      '        INNER JOIN Sales_Order_Associate_Charge'
      
        '            ON Customer.Customer = Sales_Order_Associate_Charge.' +
        'Associate_Customer)'
      
        '            ON Product.Product = Sales_Order_Associate_Charge.Pr' +
        'oduct)'
      
        '            ON Sales_invoice.Sales_invoice = Sales_Order_Associa' +
        'te_Charge.Sales_Invoice)'
      '            ON Vat.Vat = Sales_Order_Associate_Charge.Vat)'
      
        '            ON Parent_Associate_Charge.ID = Sales_Order_Associat' +
        'e_Charge.Parent_ID)'
      
        '            ON Parent_Sales_Order.Sales_Order = Parent_Associate' +
        '_Charge.Sales_Order'
      'WHERE'
      '      Sales_Order_Associate_Charge.Sales_Order = :Sales_Order'
      'ORDER BY Customer.Customer_Name, Product.Product_code')
    Left = 1050
    Top = 232
    ParamData = <
      item
        Name = 'Sales_Order'
        ParamType = ptInput
      end>
  end
  object qryAssociateCharges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Associate_Charge.ID,'
      '        Customer_Associate_Charge.Customer,'
      '        Customer_Associate_Charge.Associate_Customer,'
      
        '        Associate_Customer.Customer_Name as Associate_Customer_N' +
        'ame,'
      '        Customer_Associate_Charge.Product,'
      '        Product.Product_code,'
      '        Customer_Associate_Charge.Price_Pointer,'
      '        Product.Product_code,'
      '        (select top 1 Unit_price'
      '        from Prices'
      
        '        where Prices.Price_pointer = Customer_Associate_Charge.p' +
        'rice_pointer and'
      '              Prices.effective_date <= now()'
      '        order by Prices.effective_date desc) AS Unit_Price,'
      '        (select top 1 Unit_cost'
      '        from Prices'
      
        '        where Prices.Price_pointer = Customer_Associate_Charge.p' +
        'rice_pointer and'
      '              Prices.effective_date <= now()'
      '        order by Prices.effective_date desc) AS Unit_Cost,'
      '        (select top 1 Price_Unit_Description'
      '        from Prices, Price_unit'
      
        '        where Prices.Price_pointer = Customer_Associate_Charge.p' +
        'rice_pointer and'
      '              Prices.Price_unit = Price_Unit.Price_Unit and'
      '              Prices.effective_date <= now()'
      
        '        order by Prices.effective_date desc) AS Price_Unit_Descr' +
        'iption,'
      '        Customer_Associate_Charge.Vat,'
      '        Product.Product_Description,'
      '        Customer_Associate_Charge.Inactive,'
      '        Vat.Vat_Rate,'
      '        Vat.Description as Vat_Description'
      'FROM Vat'
      '        INNER JOIN (Product'
      '        INNER JOIN (Customer AS Associate_Customer'
      '        INNER JOIN Customer_Associate_Charge'
      
        '            ON Associate_Customer.Customer = Customer_Associate_' +
        'Charge.Associate_Customer)'
      
        '            ON Product.Product = Customer_Associate_Charge.Produ' +
        'ct)'
      '            ON Vat.Vat = Customer_Associate_Charge.Vat'
      'WHERE Customer_Associate_Charge.Customer = :Customer'
      'ORDER BY Associate_Customer.Customer_Name, Product.Product_code')
    Left = 1170
    Top = 232
    ParamData = <
      item
        Name = 'CUSTOMER'
        ParamType = ptInput
      end>
  end
  object qrySOAddCharge: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Sales_Order_Associate_Charge'
      '( Sales_Order,'
      '  Associate_Customer,'
      '  Product,'
      '  Unit_Price,'
      '  Unit_Cost,'
      '  Sell_Unit,'
      '  Cost_Unit,'
      '  Quantity,'
      '  VAT,'
      '  Charge_Invoiced,'
      '  Sales_invoice,'
      '  Sales_Order_Line_no,'
      '  Parent_ID'
      ')'
      'VALUES'
      '('
      '  :Sales_Order,'
      '  :Associate_Customer,'
      '  :Product,'
      '  :Unit_Price,'
      '  :Unit_Cost,'
      '  :Sell_Unit,'
      '  :Cost_Unit,'
      '  :Quantity,'
      '  :VAT,'
      '  :Charge_Invoiced,'
      '  :Sales_invoice,'
      '  :Sales_Order_Line_no,'
      '  :Parent_ID'
      ')'
      '')
    Left = 1050
    Top = 296
    ParamData = <
      item
        Name = 'Sales_Order'
        ParamType = ptInput
      end
      item
        Name = 'ASSOCIATE_CUSTOMER'
        ParamType = ptInput
      end
      item
        Name = 'PRODUCT'
        ParamType = ptInput
      end
      item
        Name = 'UNIT_PRICE'
        ParamType = ptInput
      end
      item
        Name = 'UNIT_COST'
        ParamType = ptInput
      end
      item
        Name = 'SELL_UNIT'
        ParamType = ptInput
      end
      item
        Name = 'COST_UNIT'
        ParamType = ptInput
      end
      item
        Name = 'QUANTITY'
        ParamType = ptInput
      end
      item
        Name = 'VAT'
        ParamType = ptInput
      end
      item
        Name = 'CHARGE_INVOICED'
        ParamType = ptInput
      end
      item
        Name = 'SALES_INVOICE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SALES_ORDER_LINE_NO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qrySOUpdCharge: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order_Associate_Charge'
      'SET Sales_Order = :Sales_Order,'
      '    Associate_Customer = :Associate_Customer,'
      '    Product = :Product,'
      '    Unit_Price = :Unit_Price,'
      '    Unit_Cost = :Unit_Cost,'
      '    Sell_Unit = :Sell_Unit,'
      '    Cost_Unit = :Cost_Unit,'
      '    Quantity = :Quantity,'
      '    VAT = :VAT,'
      '    Charge_Invoiced = :Charge_Invoiced,'
      '    Sales_invoice = :Sales_invoice,'
      '    Sales_Order_Line_no = :Sales_Order_Line_no,'
      '    Parent_ID = :Parent_ID'
      'WHERE ID = :ID'
      '')
    Left = 1162
    Top = 296
    ParamData = <
      item
        Name = 'Sales_Order'
        ParamType = ptInput
      end
      item
        Name = 'ASSOCIATE_CUSTOMER'
        ParamType = ptInput
      end
      item
        Name = 'PRODUCT'
        ParamType = ptInput
      end
      item
        Name = 'UNIT_PRICE'
        ParamType = ptInput
      end
      item
        Name = 'UNIT_COST'
        ParamType = ptInput
      end
      item
        Name = 'SELL_UNIT'
        ParamType = ptInput
      end
      item
        Name = 'COST_UNIT'
        ParamType = ptInput
      end
      item
        Name = 'QUANTITY'
        ParamType = ptInput
      end
      item
        Name = 'VAT'
        ParamType = ptInput
      end
      item
        Name = 'CHARGE_INVOICED'
        ParamType = ptInput
      end
      item
        Name = 'SALES_INVOICE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SALES_ORDER_LINE_NO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PARENT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qrySOUpdChargeStatus: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order_Associate_Charge'
      'SET  Charge_Invoiced = :Charge_Invoiced'
      'WHERE ID = :ID')
    Left = 1050
    Top = 384
    ParamData = <
      item
        Name = 'CHARGE_INVOICED'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qrySOCharges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Associate_Charge.ID,'
      '        Sales_Order_Associate_Charge.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order_Associate_Charge.Associate_Customer,'
      '        Associate_Customer.Customer_Name,'
      '        Sales_Order_Associate_Charge.Product,'
      '        Product.Product_Description,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Descriptive_Reference,'
      '        Sales_Order_Associate_Charge.Unit_Price,'
      '        Sales_Order_Associate_Charge.Quantity,'
      '        Sales_Order_Associate_Charge.Vat,'
      '        Vat.Description,'
      '        Vat.Vat_Rate'
      'FROM Vat'
      '        INNER JOIN (Customer AS Associate_Customer'
      '        INNER JOIN (Product'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN Sales_Order_Associate_Charge'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Associate_Cha' +
        'rge.Sales_Order)'
      
        '          ON Product.Product = Sales_Order_Associate_Charge.Prod' +
        'uct)'
      
        '          ON Associate_Customer.Customer = Sales_Order_Associate' +
        '_Charge.Associate_Customer)'
      '          ON Vat.Vat = Sales_Order_Associate_Charge.Vat'
      '')
    Left = 1050
    Top = 464
  end
  object dtsSOCharges: TDataSource
    DataSet = qrySOCharges
    Left = 1160
    Top = 460
  end
  object qrySOCharge: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Associate_Charge.Associate_Customer,'
      '        Customer.Customer_Name,'
      '        Sales_Order_Associate_Charge.Product,'
      '        Product.Product_code,'
      '        Product.Product_Description,'
      '        Sales_Order_Associate_Charge.Unit_Price,'
      '        Sales_Order_Associate_Charge.Sell_Unit,'
      '        Sales_Order_Associate_Charge.Unit_Cost,'
      '        Sales_Order_Associate_Charge.Cost_Unit,'
      '        Sales_Order_Associate_Charge.Quantity,'
      '        Sales_Order_Associate_Charge.Vat,'
      '        Vat.Vat_Rate,'
      '        Vat.Description as Vat_Description,'
      '        Sales_Order_Associate_Charge.Charge_Invoiced,'
      '        Sales_Order_Associate_Charge.Sales_Invoice,'
      '        Sales_invoice.Invoice_date,'
      '        Sales_Invoice.Invoice_no,'
      
        '        Parent_Associate_Charge.Sales_Order as Parent_Sales_Orde' +
        'r,'
      
        '        Parent_Sales_Order.Template_Date as Parent_Template_Date' +
        ','
      '        Parent_Sales_Order.Date_Required as Parent_Fitting_Date,'
      
        '        Parent_Sales_Order.Descriptive_Reference as Parent_Descr' +
        'iption,'
      '        Parent_Sales_Order.Reference as Parent_Reference'
      'FROM Sales_Order AS Parent_Sales_Order'
      
        '        RIGHT JOIN (Sales_Order_Associate_Charge AS Parent_Assoc' +
        'iate_Charge'
      '        RIGHT JOIN (Vat'
      '        INNER JOIN (Sales_invoice'
      '        RIGHT JOIN (Product'
      '        INNER JOIN (Customer'
      '        INNER JOIN Sales_Order_Associate_Charge'
      
        '            ON Customer.Customer = Sales_Order_Associate_Charge.' +
        'Associate_Customer)'
      
        '            ON Product.Product = Sales_Order_Associate_Charge.Pr' +
        'oduct)'
      
        '            ON Sales_invoice.Sales_invoice = Sales_Order_Associa' +
        'te_Charge.Sales_Invoice)'
      '            ON Vat.Vat = Sales_Order_Associate_Charge.Vat)'
      
        '            ON Parent_Associate_Charge.ID = Sales_Order_Associat' +
        'e_Charge.Parent_ID)'
      
        '            ON Parent_Sales_Order.Sales_Order = Parent_Associate' +
        '_Charge.Sales_Order'
      'WHERE  Sales_Order_Associate_Charge.ID = :ID')
    Left = 1050
    Top = 544
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryDummyCharges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Associate_Charge.ID,'
      '        Sales_Order_Associate_Charge.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order_Associate_Charge.Associate_Customer,'
      
        '        Associate_Customer.Customer_Name as Associate_Customer_N' +
        'ame,'
      '        Associate_Customer.Rep as Associate_Rep,'
      '        Sales_Order_Associate_Charge.Product,'
      '        Product.Product_Code,'
      '        Product.Product_Description,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Descriptive_Reference,'
      '        Sales_Order_Associate_Charge.Unit_Price,'
      '        Sales_Order_Associate_Charge.Quantity,'
      '        Sales_Order_Associate_Charge.Vat,'
      '        Sales_Order_Associate_Charge.Charge_Invoiced,'
      '        Vat.Description,'
      '        Vat.Vat_Rate,'
      
        '        Parent_Associate_Charge.Sales_Order as Parent_Sales_Orde' +
        'r,'
      
        '        Parent_Sales_Order.Template_Date as Parent_Template_Date' +
        ','
      '        Parent_Sales_Order.Date_Required as Parent_Fitting_Date,'
      '        Parent_Sales_Order.Reference as Parent_Reference'
      'FROM Sales_Order AS Parent_Sales_Order'
      
        '        RIGHT JOIN (Sales_Order_Associate_Charge AS Parent_Assoc' +
        'iate_Charge'
      '        RIGHT JOIN (Vat'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (Product'
      '        INNER JOIN (Customer AS Associate_Customer'
      '        INNER JOIN Sales_Order_Associate_Charge'
      
        '            ON Associate_Customer.Customer = Sales_Order_Associa' +
        'te_Charge.Associate_Customer)'
      
        '            ON Product.Product = Sales_Order_Associate_Charge.Pr' +
        'oduct)'
      
        '            ON Sales_Order.Sales_Order = Sales_Order_Associate_C' +
        'harge.Sales_Order)'
      '            ON Vat.Vat = Sales_Order_Associate_Charge.Vat)'
      
        '            ON Parent_Associate_Charge.ID = Sales_Order_Associat' +
        'e_Charge.Parent_ID)'
      
        '            ON Parent_Sales_Order.Sales_Order = Parent_Associate' +
        '_Charge.Sales_Order'
      
        'WHERE Sales_Order_Associate_Charge.Associate_Customer = :Associa' +
        'te_Customer AND'
      '      ('
      
        '      (Sales_Order.Date_Required >= :Date_From) AND (Sales_Order' +
        '.Date_Required <= :Date_To)'
      '      ) AND'
      
        '      ((Sales_Order_Associate_Charge.Charge_Invoiced <> '#39'O'#39')) an' +
        'd (Sales_Order_Associate_Charge.Parent_ID IS NULL)')
    Left = 1258
    Top = 456
    ParamData = <
      item
        Name = 'ASSOCIATE_CUSTOMER'
        ParamType = ptInput
      end
      item
        Name = 'DATE_FROM'
        ParamType = ptInput
      end
      item
        Name = 'DATE_TO'
        ParamType = ptInput
      end>
  end
  object qryUpdSOChargeStatus: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order_Associate_Charge'
      'SET Charge_Invoiced = :Charge_Invoiced'
      'WHERE  Sales_Order_Associate_Charge.ID = :ID'
      '')
    Left = 1154
    Top = 552
    ParamData = <
      item
        Name = 'CHARGE_INVOICED'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryGetRemedialJob: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Job, Remedial_Number'
      'FROM Remedial'
      'WHERE ID = :ID')
    Left = 1058
    Top = 640
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
