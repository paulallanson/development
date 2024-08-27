object dtmdlQuote: TdtmdlQuote
  Height = 649
  Width = 1083
  object qryAllQuotes: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'SELECT TOP 3000'
      #9'Quote.Quote,        '
      #9'Quote.Date_Required,        '
      #9'Quote.Date_Raised,        '
      #9'Quote.Customer,        '
      #9'Quote.Description,        '
      #9'Quote.Operator,        '
      #9'Quote.Installation_price,       '
      #9'Quote.Delivery_Price,        '
      #9'Quote.Survey_price,        '
      #9'Quote.Project_Reference,        '
      #9'Quote.Reference,        '
      #9'Quote.Quote_Status,        '
      #9'Quote.Nett_Price,        '
      #9'Quote.Inactive,        '
      #9'Operator.Operator_Name,        '
      #9'Quote_Status.Quote_status_description AS Status_Text,        '
      #9'Quote.Customer_name,        '
      #9'Quote.Contact_Name,        '
      #9'Quote.Material_Type,        '
      #9'Material_Type.Description AS Material_Description,        '
      #9'Quote.Importance,        '
      
        #9'(Quote.Nett_price - Quote.Discount_Value + Quote.Markup_Value +' +
        ' Quote.Waste_Value) as Gross_Price,        '
      #9'Customer.Is_Retail_Customer,        '
      #9'Customer.Customer_is_Speculative,        '
      #9'Quote.Address,        '
      #9'Quote.Quote_Number,        '
      #9'Quote.Original_Quote,        '
      #9'Quote.Expiry_Date '
      #9'FROM Material_Type      '
      #9
      #9'INNER JOIN (Customer      '
      #9'INNER JOIN (Quote_Status      '
      #9'INNER JOIN (Operator      '
      #9'INNER JOIN Quote ON        '
      #9'Operator.Operator = Quote.Operator) ON        '
      #9'Quote_Status.Quote_Status = Quote.Quote_Status) ON        '
      #9'Customer.Customer = Quote.Customer) ON        '
      #9'Material_Type.Material_Type = Quote.Material_Type'
      
        #9'WHERE ((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote ' +
        '= '#39'N'#39')) AND Quote_Status.Quote_status > 1 AND ((Quote.inactive i' +
        's NULL) or (Quote.inactive = '#39'N'#39') or (Quote.inactive = '#39#39')) ORDE' +
        'R BY Quote.Quote desc')
    Left = 25
    Top = 8
    object qryAllQuotesQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryAllQuotesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryAllQuotesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryAllQuotesCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryAllQuotesDescription: TWideStringField
      DisplayWidth = 250
      FieldName = 'Description'
      Size = 255
    end
    object qryAllQuotesOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryAllQuotesInstallation_price: TFloatField
      FieldName = 'Installation_price'
      currency = True
    end
    object qryAllQuotesDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      currency = True
    end
    object qryAllQuotesSurvey_price: TFloatField
      FieldName = 'Survey_price'
      currency = True
    end
    object qryAllQuotesReference: TWideStringField
      DisplayWidth = 50
      FieldName = 'Reference'
      Size = 30
    end
    object qryAllQuotesQuote_Status: TIntegerField
      FieldName = 'Quote_Status'
    end
    object qryAllQuotesNett_Price: TFloatField
      FieldName = 'Nett_Price'
      currency = True
    end
    object qryAllQuotesInactive: TWideStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryAllQuotesOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Size = 30
    end
    object qryAllQuotesStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Size = 50
    end
    object qryAllQuotesCustomer_name: TWideStringField
      FieldName = 'Customer_name'
      Size = 50
    end
    object qryAllQuotesContact_Name: TWideStringField
      FieldName = 'Contact_Name'
      Size = 50
    end
    object qryAllQuotesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object qryAllQuotesMaterial_Description: TWideStringField
      FieldName = 'Material_Description'
    end
    object qryAllQuotesGross_Price: TFloatField
      FieldName = 'Gross_Price'
      currency = True
    end
    object qryAllQuotesStatus_Text: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Status_Text'
      OnGetText = qryAllQuotesStatus_TextGetText
      Calculated = True
    end
    object qryAllQuotesIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object qryAllQuotesImportance: TWideStringField
      FieldName = 'Importance'
    end
    object qryAllQuotesQuote_Number: TFloatField
      FieldName = 'Quote_Number'
    end
    object qryAllQuotesOriginal_Quote: TIntegerField
      FieldName = 'Original_Quote'
    end
    object qryAllQuotesProject_Reference: TWideStringField
      FieldName = 'Project_Reference'
      Size = 100
    end
    object qryAllQuotesCustomer_is_Speculative: TWideStringField
      FieldName = 'Customer_is_Speculative'
      Size = 1
    end
    object qryAllQuotesExpiry_Date_New: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Expiry_Date_New'
      OnGetText = qryAllQuotesExpiry_Date_NewGetText
      Calculated = True
    end
    object qryAllQuotesExpiry_Date: TDateTimeField
      FieldName = 'Expiry_Date'
    end
    object qryAllQuotesAddress: TIntegerField
      FieldName = 'Address'
    end
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 352
    Top = 8
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
      '        Vat.Vat_Rate,'
      '        Quote.Vat,'
      '        Quote.Discount_Rate,'
      '        Quote.Discount_Value,'
      '        Quote.Deposit_Terms,'
      '        Quote.Deposit_Amount,'
      '        Quote.Template_Date,'
      '        Quote.Install_Address,'
      '        Quote.Date_Accepted,'
      '        Quote.Sales_Lead_Source,'
      '        Quote.Branch_no,'
      '        Quote.Designer,'
      '        Quote.Install_Name,'
      '        Quote.Install_Phone,'
      '        Quote.Order_Ref_No,'
      '        Quote.Account_Manager,'
      '        Quote.Fitting_Mileage,'
      '        Quote.Fitting_Mileage_Rate,'
      '        Quote.Fitting_Labour,'
      '        Quote.Fitting_Labour_Rate,'
      '        Quote.Fitting_Labour_Men,'
      '        Quote.Template_Mileage,'
      '        Quote.Template_Mileage_Rate,'
      '        Quote.Template_Labour,'
      '        Quote.Template_Labour_Rate,'
      '        Quote.Delivery_Mileage,'
      '        Quote.Delivery_Mileage_Rate,'
      '        Quote.Delivery_Labour,'
      '        Quote.Delivery_Labour_Rate,'
      '        Quote.Delivery_Labour_Men,'
      '        Quote.Worktop_Handling_Rate,'
      '        Quote.Markup_Rate,'
      '        Quote.Markup_Value,'
      '        Quote.Importance,'
      '        Quote.Quote_Number,'
      '        Quote.Original_Quote,'
      '        Quote.Contract_Quote,'
      '        Quote.Contract_Quote_ID,'
      '        Quote.Call_Day,'
      '        Quote.Call_Time,'
      '        Quote.Timescale,'
      '        Customer.Customer_is_Speculative,'
      '        Quote.Revenue_Centre,'
      '        Expiry_Date'
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
    Left = 24
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryQGetLast: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Last_Quote_Number'
      'from Company')
    Left = 288
    Top = 8
  end
  object qryQAddHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert INTO Quote'
      '(       Quote,'
      '        Operator,'
      '        Description,'
      '        Date_Required,'
      '        Date_Raised,'
      '        Project_Reference,'
      '        Reference,'
      '        Customer,'
      '        Nett_Price,'
      '        Installation_Price,'
      '        Delivery_Price,'
      '        Survey_Price,'
      '        Quote_Status,'
      '        Inactive,'
      '        Inactive_Reason,'
      '        Extra_Notes,'
      '        Payment_Terms,'
      '        Availability,'
      '        Material_Type,'
      '        Contact_Name,'
      '        Address,'
      '        Vat,'
      '        Discount_Rate,'
      '        Discount_Value,'
      '        Customer_Name,'
      '        Deposit_Terms,'
      '        Deposit_Amount,'
      '        Install_Address,'
      '        Template_Date,'
      '        Date_Accepted,'
      '        Sales_Lead_Source,'
      '        Designer,'
      '        Branch_no,'
      '        Install_Name,'
      '        Install_Phone,'
      '        Order_Ref_No,'
      '        Account_Manager,'
      '        Fitting_Mileage,'
      '        Fitting_Mileage_Rate,'
      '        Fitting_Labour,'
      '        Fitting_Labour_Rate,'
      '        Fitting_Labour_Men,'
      '        Template_Mileage,'
      '        Template_Mileage_Rate,'
      '        Template_Labour,'
      '        Template_Labour_Rate,'
      '        Delivery_Mileage,'
      '        Delivery_Mileage_Rate,'
      '        Delivery_Labour,'
      '        Delivery_Labour_Rate,'
      '        Delivery_Labour_Men,'
      '        Worktop_Handling_Rate,'
      '        Markup_Rate,'
      '        Markup_Value,'
      '        Importance,'
      '        Quote_Number,'
      '        Original_Quote,'
      '        Contract_Quote,'
      '        Waste_Value,'
      '        Timescale,'
      '        Call_Day,'
      '        Call_Time,'
      '        Expiry_Date,'
      '        Contract_Quote_ID,'
      '        Line_Number,'
      '        Revenue_Centre,'
      '        Option_Number'
      ')'
      'Values'
      '(       :Quote,'
      '        :Operator,'
      '        :Description,'
      '        :Date_Required,'
      '        :Date_Raised,'
      '        :Project_Reference,'
      '        :Reference,'
      '        :Customer,'
      '        :Nett_Price,'
      '        :Installation_Price,'
      '        :Delivery_Price,'
      '        :Survey_Price,'
      '        :Quote_Status,'
      '        :Inactive,'
      '        :Inactive_Reason,'
      '        :Extra_Notes,'
      '        :Payment_Terms,'
      '        :Availability,'
      '        :Material_Type,'
      '        :Contact_Name,'
      '        :Address,'
      '        :Vat,'
      '        :Discount_Rate,'
      '        :Discount_Value,'
      '        :Customer_Name,'
      '        :Deposit_Terms,'
      '        :Deposit_Amount,'
      '        :Install_Address,'
      '        :Template_Date,'
      '        :Date_Accepted,'
      '        :Sales_Lead_Source,'
      '        :Designer,'
      '        :Branch_no,'
      '        :Install_Name,'
      '        :Install_Phone,'
      '        :Order_Ref_No,'
      '        :Account_Manager,'
      '        :Fitting_Mileage,'
      '        :Fitting_Mileage_Rate,'
      '        :Fitting_Labour,'
      '        :Fitting_Labour_Rate,'
      '        :Fitting_Labour_Men,'
      '        :Template_Mileage,'
      '        :Template_Mileage_Rate,'
      '        :Template_Labour,'
      '        :Template_Labour_Rate,'
      '        :Delivery_Mileage,'
      '        :Delivery_Mileage_Rate,'
      '        :Delivery_Labour,'
      '        :Delivery_Labour_Rate,'
      '        :Delivery_Labour_Men,'
      '        :Worktop_Handling_Rate,'
      '        :Markup_Rate,'
      '        :Markup_Value,'
      '        :Importance,'
      '        :Quote_Number,'
      '        :Original_Quote,'
      '        :Contract_Quote,'
      '        :Waste_Value,'
      '        :Timescale,'
      '        :Call_Day,'
      '        :Call_Time,'
      '        :Expiry_Date,'
      '        :Contract_Quote_ID,'
      '        :Line_Number,'
      '        :Revenue_Centre,'
      '        :Option_Number'
      ')')
    Left = 24
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Description'
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
        Name = 'Nett_Price'
      end
      item
        Name = 'Installation_Price'
      end
      item
        Name = 'Delivery_Price'
      end
      item
        Name = 'Survey_Price'
      end
      item
        Name = 'Quote_Status'
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
        Name = 'Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Availability'
        DataType = ftInteger
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Contact_Name'
      end
      item
        Name = 'Address'
        DataType = ftInteger
      end
      item
        Name = 'Vat'
      end
      item
        Name = 'Discount_Rate'
      end
      item
        Name = 'Discount_Value'
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
        Name = 'Install_Address'
        DataType = ftInteger
      end
      item
        Name = 'Template_Date'
      end
      item
        Name = 'Date_Accepted'
      end
      item
        Name = 'Sales_Lead_Source'
        DataType = ftInteger
      end
      item
        Name = 'Designer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Install_Name'
      end
      item
        Name = 'Install_Phone'
      end
      item
        Name = 'Order_Ref_No'
      end
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Fitting_Mileage'
      end
      item
        Name = 'Fitting_Mileage_Rate'
      end
      item
        Name = 'Fitting_Labour'
      end
      item
        Name = 'Fitting_Labour_Rate'
      end
      item
        Name = 'Fitting_Labour_Men'
      end
      item
        Name = 'Template_Mileage'
      end
      item
        Name = 'Template_Mileage_Rate'
      end
      item
        Name = 'Template_Labour'
      end
      item
        Name = 'Template_Labour_Rate'
      end
      item
        Name = 'Delivery_Mileage'
      end
      item
        Name = 'Delivery_Mileage_Rate'
      end
      item
        Name = 'Delivery_Labour'
      end
      item
        Name = 'Delivery_Labour_Rate'
      end
      item
        Name = 'Delivery_Labour_Men'
      end
      item
        Name = 'Worktop_Handling_Rate'
      end
      item
        Name = 'Markup_Rate'
      end
      item
        Name = 'Markup_Value'
      end
      item
        Name = 'Importance'
      end
      item
        Name = 'Quote_Number'
      end
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'Contract_Quote'
      end
      item
        Name = 'Waste_Value'
      end
      item
        Name = 'Timescale'
      end
      item
        Name = 'Call_Day'
      end
      item
        Name = 'Call_Time'
      end
      item
        Name = 'Expiry_Date'
      end
      item
        Name = 'Contract_Quote_ID'
        DataType = ftInteger
      end
      item
        Name = 'Line_Number'
        DataType = ftInteger
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Option_Number'
        DataType = ftInteger
      end>
  end
  object qryQUpHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'Set Account_Manager = :Account_Manager,'
      '    Description = :Description,'
      '    Date_Required = :Date_Required,'
      '    Date_Raised = :Date_Raised,'
      '    Project_Reference = :Project_Reference,'
      '    Reference = :Reference,'
      '    Customer = :Customer,'
      '    Nett_Price = :Nett_Price,'
      '    Installation_Price = :Installation_Price,'
      '    Delivery_Price = :Delivery_Price,'
      '    Survey_Price = :Survey_Price,'
      '    Quote_Status = :Quote_Status,'
      '    Inactive = :Inactive,'
      '    Inactive_Reason = :Inactive_Reason,'
      '    Extra_Notes = :Extra_Notes,'
      '    Payment_Terms = :Payment_Terms,'
      '    Availability = :Availability,'
      '    Material_Type = :Material_Type,'
      '    Contact_Name = :Contact_Name,'
      '    Address = :Address,'
      '    Vat = :Vat,'
      '    Discount_Rate = :Discount_Rate,'
      '    Discount_Value = :Discount_Value,'
      '    Customer_Name = :Customer_Name,'
      '    Deposit_Terms = :Deposit_Terms,'
      '    Deposit_Amount = :Deposit_Amount,'
      '    Template_Date = :Template_Date,'
      '    Install_Address = :Install_Address,'
      '    Date_Accepted = :Date_Accepted,'
      '    Sales_Lead_Source = :Sales_lead_Source,'
      '    Designer = :Designer,'
      '    Branch_no = :Branch_no,'
      '    Install_Name = :Install_Name,'
      '    Install_Phone = :Install_Phone,'
      '    Order_Ref_No = :Order_Ref_No,'
      '    Template_Mileage = :Template_Mileage,'
      '    Template_Mileage_Rate =  :Template_Mileage_Rate,'
      '    Template_Labour = :Template_Labour,'
      '    Template_Labour_Rate = :Template_Labour_Rate,'
      '    Fitting_Mileage =  :Fitting_Mileage,'
      '    Fitting_Mileage_Rate =  :Fitting_Mileage_Rate,'
      '    Fitting_Labour = :Fitting_Labour,'
      '    Fitting_Labour_Rate = :Fitting_Labour_Rate,'
      '    Fitting_Labour_Men = :Fitting_Labour_Men,'
      '    Delivery_Mileage =  :Delivery_Mileage,'
      '    Delivery_Mileage_Rate =  :Delivery_Mileage_Rate,'
      '    Delivery_Labour = :Delivery_Labour,'
      '    Delivery_Labour_Rate = :Delivery_Labour_Rate,'
      '    Delivery_Labour_Men = :Delivery_Labour_Men,'
      '    Worktop_Handling_Rate = :Worktop_Handling_Rate,'
      '    Markup_Rate = :Markup_Rate,'
      '    Markup_Value = :Markup_Value,'
      '    Importance = :Importance,'
      '    Contract_Quote = :Contract_Quote,'
      '    Waste_Value = :Waste_Value,'
      '    Quote_Number = :Quote_Number,'
      '    Timescale = :Timescale,'
      '    Call_Day = :Call_Day,'
      '    Call_Time = :Call_Time,'
      '    Expiry_Date = :Expiry_Date,'
      '    Revenue_Centre = :Revenue_Centre'
      'WHERE Quote = :Quote')
    Left = 24
    Top = 344
    ParamData = <
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Description'
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
        Name = 'Nett_Price'
      end
      item
        Name = 'Installation_Price'
      end
      item
        Name = 'Delivery_Price'
      end
      item
        Name = 'Survey_Price'
      end
      item
        Name = 'Quote_Status'
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
        Name = 'Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Availability'
        DataType = ftInteger
      end
      item
        Name = 'Material_Type'
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
        Name = 'Vat'
      end
      item
        Name = 'Discount_Rate'
      end
      item
        Name = 'Discount_Value'
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
        Name = 'Template_Date'
      end
      item
        Name = 'Install_Address'
        DataType = ftInteger
      end
      item
        Name = 'Date_Accepted'
      end
      item
        Name = 'Sales_lead_Source'
        DataType = ftInteger
      end
      item
        Name = 'Designer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Install_Name'
      end
      item
        Name = 'Install_Phone'
      end
      item
        Name = 'Order_Ref_No'
      end
      item
        Name = 'Template_Mileage'
      end
      item
        Name = 'Template_Mileage_Rate'
      end
      item
        Name = 'Template_Labour'
      end
      item
        Name = 'Template_Labour_Rate'
      end
      item
        Name = 'Fitting_Mileage'
      end
      item
        Name = 'Fitting_Mileage_Rate'
      end
      item
        Name = 'Fitting_Labour'
      end
      item
        Name = 'Fitting_Labour_Rate'
      end
      item
        Name = 'Fitting_Labour_Men'
      end
      item
        Name = 'Delivery_Mileage'
      end
      item
        Name = 'Delivery_Mileage_Rate'
      end
      item
        Name = 'Delivery_Labour'
      end
      item
        Name = 'Delivery_Labour_Rate'
      end
      item
        Name = 'Delivery_Labour_Men'
      end
      item
        Name = 'Worktop_Handling_Rate'
      end
      item
        Name = 'Markup_Rate'
      end
      item
        Name = 'Markup_Value'
      end
      item
        Name = 'Importance'
      end
      item
        Name = 'Contract_Quote'
      end
      item
        Name = 'Waste_Value'
      end
      item
        Name = 'Quote_Number'
      end
      item
        Name = 'Timescale'
      end
      item
        Name = 'Call_Day'
      end
      item
        Name = 'Call_Time'
      end
      item
        Name = 'Expiry_Date'
      end
      item
        Name = 'Revenue_Centre'
        DataType = ftInteger
      end
      item
        Name = 'Quote'
      end>
  end
  object qryCustQuotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote.*'
      'from Quote'
      'where Customer = :Customer and'
      'Description LIKE :Description'
      'order by Quote desc')
    Left = 24
    Top = 56
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Description'
        DataType = ftString
      end>
  end
  object qrydummy: TFDQuery
    SQL.Strings = (
      '        Quote.Quote,'
      '        Quote.Date_Required,'
      '        Quote.Date_Raised,'
      '        Quote.Customer,'
      '        Quote.Description,'
      '        Quote.Operator,'
      '        Quote.Installation_price,'
      '        Quote.Delivery_Price,'
      '        Quote.Survey_price,'
      '        Quote.Project_Reference,'
      '        Quote.Reference,'
      '        Quote.Quote_Status,'
      '        Quote.Nett_Price,'
      '        Quote.Inactive,'
      '        Operator.Operator_Name,'
      
        '        Quote_Status.Quote_status_description AS Status_Descript' +
        'ion,'
      '        Quote.Customer_name,'
      '        Quote.Contact_Name,'
      '        Quote.Material_Type,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote.Importance,'
      
        '        (Quote.Nett_price - Quote.Discount_Value + Quote.Markup_' +
        'Value + Quote.Waste_Value) as Gross_Price,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative,'
      '        Quote.Address,'
      '        Quote.Quote_Number,'
      '        Quote.Original_Quote,'
      '        Quote.Expiry_Date'
      'FROM Material_Type'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Operator'
      '      INNER JOIN Quote ON'
      '        Operator.Operator = Quote.Operator) ON'
      '        Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Material_Type.Material_Type = Quote.Material_Type'
      
        'WHERE ((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote =' +
        ' '#39'N'#39'))')
    Left = 224
    Top = 8
  end
  object dtsQuotes: TDataSource
    DataSet = qryCustQuotes
    Left = 96
    Top = 56
  end
  object dtsAllQuotes: TDataSource
    DataSet = qryAllQuotes
    Left = 160
    Top = 8
  end
  object qryQElement: TFDQuery
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
      '        Worktop.Description AS Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote_Element.Material_Use,'
      '        Material_Use.Use_Description,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Original_Unit_Price'
      'FROM Material_Use'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN ((Thickness'
      '      INNER JOIN Worktop_thickness'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN Quote_Element'
      
        '        ON Material_Type.Material_Type = Quote_Element.Material_' +
        'type)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e'
      'WHERE Quote = :Quote and'
      '      Element_Number = :Element_Number and'
      '      Element_Type ='#39'P'#39)
    Left = 96
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Element_Number'
      end>
  end
  object qryQAddElement: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Quote_Element ('
      'Quote,'
      'Element_Number,'
      'Material_Type,'
      'Worktop,'
      'Depth,'
      'Length,'
      'Thickness,'
      'Unit_Price,'
      'Price_unit,'
      'Quantity,'
      'Element_Type,'
      'Element_Description,'
      'Upstand_Polish_Price,'
      'Upstand_Polish_Cost,'
      'Material_Use,'
      'No_of_Polished_Depths,'
      'No_of_Polished_Lengths,'
      'Total_Upstand_Pieces'
      ')'
      'values'
      '('
      ':Quote,'
      ':Element_Number,'
      ':Material_Type,'
      ':Worktop,'
      ':Depth,'
      ':Length,'
      ':Thickness,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Quantity,'
      ':Element_Type,'
      ':Element_Description,'
      ':Upstand_Polish_Price,'
      ':Upstand_Polish_Cost,'
      ':Material_Use,'
      ':No_of_Polished_Depths,'
      ':No_of_Polished_Lengths,'
      ':Total_Upstand_Pieces)')
    Left = 96
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Element_Number'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Element_Type'
      end
      item
        Name = 'Element_Description'
      end
      item
        Name = 'Upstand_Polish_Price'
      end
      item
        Name = 'Upstand_Polish_Cost'
      end
      item
        Name = 'Material_Use'
        DataType = ftInteger
      end
      item
        Name = 'No_of_Polished_Depths'
      end
      item
        Name = 'No_of_Polished_Lengths'
      end
      item
        Name = 'Total_Upstand_Pieces'
      end>
  end
  object qryQAllElements: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Element_Description,'
      '        Quote_Element.Element_Type,'
      '        Quote_Element.Material_type,'
      '        Quote_Element.Worktop,'
      '        Quote_Element.Depth,'
      '        Quote_Element.Length,'
      '        Quote_Element.Thickness,'
      '        Quote_Element.Unit_price,'
      '        Quote_Element.Price_unit,'
      '        Quote_Element.Quantity,'
      '        Worktop.Worktop_Group,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description AS Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote_Element.Material_Use,'
      '        Material_Use.Use_Description,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Original_Unit_Price'
      'FROM Material_Use'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN ((Thickness'
      '      INNER JOIN Worktop_thickness'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN Quote_Element'
      
        '        ON Material_Type.Material_Type = Quote_Element.Material_' +
        'type)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e'
      'WHERE Quote = :Quote and Element_Type = '#39'P'#39
      'ORDER BY Element_Number')
    Left = 96
    Top = 224
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQExtra: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Extra.Extra_no,'
      '        Quote_Extra.Do_Not_Discount,'
      '        Quote_Extra.Quote,'
      '        Quote_Extra.Extra_Charge,'
      '        Extra_Charge.Description,'
      '        Quote_Extra.Quantity,'
      '        Quote_Extra.Unit_Cost,'
      '        Quote_Extra.Unit_price,'
      '        Quote_Extra.Price_unit,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (Extra_Charge'
      '      INNER JOIN Quote_Extra ON'
      '        Extra_Charge.Extra_Charge = Quote_Extra.Extra_Charge) ON'
      '        Price_unit.Price_unit = Quote_Extra.Price_unit'
      'WHERE Quote = :Quote and'
      '               Extra_no = :Extra_no')
    Left = 160
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Extra_no'
      end>
  end
  object qryQCutOut: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Cutout.Quote,'
      '        Quote_Cutout.Cutout_number,'
      '        Quote_Cutout.Cutout,'
      '        CutOut.Description as Cutout_Description,'
      '        Quote_Cutout.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Quote_Cutout.Edge_Type,'
      '        Edge_Type.Edge_Type_Description,'
      '        Quote_Cutout.Price_unit,'
      '        Price_unit.Price_unit_description,'
      '        Quote_Cutout.Unit_Cost,'
      '        Quote_Cutout.Unit_price,'
      '        Quote_Cutout.CutOut_Discount,'
      '        Quote_Cutout.Quantity'
      'FROM Price_unit'
      '      INNER JOIN (((CutOut'
      '      INNER JOIN Quote_Cutout ON'
      '        CutOut.CutOut = Quote_Cutout.Cutout)'
      '      INNER JOIN Material_Type ON'
      
        '        Quote_Cutout.Material_Type = Material_Type.Material_Type' +
        ')'
      '      INNER JOIN Edge_Type ON'
      '        Quote_Cutout.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Quote_Cutout.Price_unit'
      'WHERE Quote = :Quote and'
      '               Cutout_Number = :cutout_Number')
    Left = 224
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'cutout_Number'
      end>
  end
  object qryQEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Edge.Edge_number,'
      '        Quote_Edge.Quote,'
      '        Quote_Edge.Edge_profile,'
      '        Edge_profile.Description as Edge_Description,'
      '        Quote_Edge.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Quote_Edge.Edge_Type,'
      '        Edge_Type.Edge_Type_Description,'
      '        Quote_Edge.Length,'
      '        Quote_Edge.Unit_Cost,'
      '        Quote_Edge.Unit_price,'
      '        Quote_Edge.Price_unit,'
      '        Quote_Edge.Edge_Discount,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (((Edge_profile'
      '      INNER JOIN Quote_Edge ON'
      '        Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      '      INNER JOIN Material_Type ON'
      '        Quote_Edge.Material_Type = Material_Type.Material_Type)'
      '      INNER JOIN Edge_Type ON'
      '        Quote_Edge.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Quote_Edge.Price_unit'
      'WHERE Quote = :Quote and'
      '               Edge_Number = :Edge_Number')
    Left = 288
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Edge_Number'
      end>
  end
  object qryQAddExtra: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Quote_Extra ('
      'Quote,'
      'Extra_no,'
      'Extra_Charge,'
      'Unit_Cost,'
      'Unit_Price,'
      'Price_unit,'
      'Quantity,'
      'Do_Not_Discount)'
      'values ('
      ':Quote,'
      ':Extra_no,'
      ':Extra_Charge,'
      ':Unit_Cost,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Quantity,'
      ':Do_Not_Discount)')
    Left = 160
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Extra_no'
      end
      item
        Name = 'Extra_Charge'
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
        Name = 'Quantity'
      end
      item
        Name = 'Do_Not_Discount'
      end>
  end
  object qryQAddCutOut: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Quote_Cutout ('
      'Quote,'
      'cutout_Number,'
      'Material_Type,'
      'cutout,'
      'Edge_Type,'
      'Unit_Cost,'
      'Unit_Price,'
      'Price_unit,'
      'Quantity,'
      'CutOut_Discount)'
      'values ('
      ':Quote,'
      ':cutout_Number,'
      ':Material_Type,'
      ':cutout,'
      ':Edge_Type,'
      ':Unit_Cost,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Quantity,'
      ':CutOut_Discount)')
    Left = 224
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'cutout_Number'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'cutout'
      end
      item
        Name = 'Edge_Type'
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
        Name = 'Quantity'
      end
      item
        Name = 'CutOut_Discount'
      end>
  end
  object qryQAddEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Quote_Edge ('
      'Quote,'
      'Edge_Number,'
      'Material_Type,'
      'Edge_profile,'
      'Edge_Type,'
      'Unit_Cost,'
      'Unit_Price,'
      'Price_unit,'
      'Length,'
      'Edge_Discount)'
      'values ('
      ':Quote,'
      ':Edge_Number,'
      ':Material_Type,'
      ':Edge_Profile,'
      ':Edge_type,'
      ':Unit_Cost,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Length,'
      ':Edge_Discount)')
    Left = 288
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Edge_Number'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Edge_Profile'
      end
      item
        Name = 'Edge_type'
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
        Name = 'Length'
      end
      item
        Name = 'Edge_Discount'
      end>
  end
  object qryQAllCutOuts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Cutout.Quote,'
      '        Quote_Cutout.Cutout_number,'
      '        Quote_Cutout.Cutout,'
      '        CutOut.Description as Cutout_Description,'
      '        Quote_Cutout.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Quote_Cutout.Edge_Type,'
      '        Edge_Type.Edge_Type_Description,'
      '        Quote_Cutout.Price_unit,'
      '        Price_unit.Price_unit_description,'
      '        Quote_Cutout.Unit_Cost,'
      '        Quote_Cutout.Unit_price,'
      '        Quote_Cutout.CutOut_Discount,'
      '        Quote_Cutout.Quantity'
      'FROM Price_unit'
      '      INNER JOIN (((CutOut'
      '      INNER JOIN Quote_Cutout ON'
      '        CutOut.CutOut = Quote_Cutout.Cutout)'
      '      INNER JOIN Material_Type ON'
      
        '        Quote_Cutout.Material_Type = Material_Type.Material_Type' +
        ')'
      '      INNER JOIN Edge_type ON'
      '        Quote_Cutout.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Quote_Cutout.Price_unit'
      'WHERE Quote = :Quote'
      'ORDER BY Cutout_NUmber')
    Left = 160
    Top = 224
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQAllEdges: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Edge.Edge_number,'
      '        Quote_Edge.Quote,'
      '        Quote_Edge.Edge_profile,'
      '        Edge_profile.Description as Edge_Description,'
      '        Quote_Edge.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Quote_Edge.Edge_Type,'
      '        Edge_Type.Edge_Type_Description,'
      '        Quote_Edge.Length,'
      '        Quote_Edge.Unit_Cost,'
      '        Quote_Edge.Unit_price,'
      '        Quote_Edge.Price_unit,'
      '        Quote_Edge.Edge_Discount,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (((Edge_profile'
      '      INNER JOIN Quote_Edge ON'
      '        Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      '      INNER JOIN Material_Type ON'
      '        Quote_Edge.Material_Type = Material_Type.Material_Type)'
      '      INNER JOIN Edge_Type ON'
      '        Quote_Edge.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Quote_Edge.Price_unit'
      'WHERE Quote = :Quote'
      'ORDER BY Edge_Number')
    Left = 224
    Top = 224
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQAllExtras: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Extra.Extra_no,'
      '        Quote_Extra.Do_Not_Discount,'
      '        Quote_Extra.Quote,'
      '        Quote_Extra.Extra_Charge,'
      '        Extra_Charge.Description,'
      '        Quote_Extra.Quantity,'
      '        Quote_Extra.Unit_Cost,'
      '        Quote_Extra.Unit_Price,'
      '        Quote_Extra.Price_unit,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (Extra_Charge'
      '      INNER JOIN Quote_Extra ON'
      '        Extra_Charge.Extra_Charge = Quote_Extra.Extra_Charge) ON'
      '        Price_unit.Price_unit = Quote_Extra.Price_unit'
      'WHERE Quote = :Quote'
      'ORDER BY Extra_no')
    Left = 288
    Top = 224
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQUpElement: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Quote_Element'
      'SET Element_Number = :ELement_Number,'
      'Material_Type = :Material_Type,'
      'Worktop = :Worktop,'
      'Depth = :Depth,'
      'Length = :Length,'
      'Thickness = :Thickness,'
      'Unit_Price = :Unit_Price,'
      'Price_unit = :Price_Unit,'
      'Quantity = :Quantity'
      'WHERE Quote = :Quote')
    Left = 96
    Top = 344
    ParamData = <
      item
        Name = 'Element_Number'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Quote'
      end>
  end
  object qryQUpCutOuts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Quote_Element'
      'SET Element_Number = :ELement_Number,'
      'Material_Type = :Material_Type,'
      'Worktop = :Worktop,'
      'Depth = :Depth,'
      'Length = :Length,'
      'Thickness = :Thickness,'
      'Unit_Price = :Unit_Price,'
      'Price_unit = :Price_Unit,'
      'Quantity = :Quantity'
      'WHERE Quote = :Quote')
    Left = 156
    Top = 344
    ParamData = <
      item
        Name = 'Element_Number'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Quote'
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Address_Name, Street, Locale,Town_City, Postcode, County_' +
        'State,Telephone_number, Fax_number, email_address, web_address, ' +
        'Mailing'
      'from Address where Address = :Address')
    Left = 24
    Top = 400
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select'
      '      Street,'
      '      Locale,'
      '      Town_City,'
      '      Postcode,'
      '      County_State,'
      '      Telephone_number,'
      '      Fax_number,'
      '      email_address,'
      '      web_address,'
      '      Installation_Price,'
      '      Survey_Price,'
      '      Delivery_Price,'
      '      VAT,'
      '      CutOut_Discount,'
      '      CutOut_Discount_Type,'
      '      Edge_Discount,'
      '      Edge_Discount_Type,'
      '      Discount_Rate,'
      '      Customer_Name'
      'from Customer where Customer = :Customer')
    Left = 96
    Top = 400
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Material_type'
      'where '
      
        '(inactive = '#39'N'#39' or inactive is null) OR Material_type = :Materia' +
        'l_Type'
      'order by Material_type.description')
    Left = 24
    Top = 448
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 96
    Top = 448
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Operator'
      'where (Operator_Can_Login = '#39'Y'#39') OR Operator = :Operator'
      'order by Operator_Name')
    Left = 160
    Top = 448
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 216
    Top = 448
  end
  object qryGetNextAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(address) as Last_Address'
      'from Address')
    Left = 488
    Top = 8
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
    Left = 488
    Top = 112
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
    Left = 488
    Top = 168
    ParamData = <
      item
        Name = 'address'
      end>
  end
  object qryQUpstand: TFDQuery
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
      '        Quote_Element.Upstand_Polish_Price,'
      '        Quote_Element.Upstand_Polish_Cost,'
      '        Quote_Element.Price_unit,'
      '        Quote_Element.Quantity,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description AS Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote_Element.Material_Use,'
      '        Material_Use.Use_Description'
      'FROM Material_Use'
      '    RIGHT JOIN (Worktop'
      '    INNER JOIN ((Thickness'
      '    INNER JOIN Worktop_thickness'
      '      ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '    INNER JOIN (Material_Type'
      '    INNER JOIN Quote_Element'
      
        '      ON Material_Type.Material_Type = Quote_Element.Material_ty' +
        'pe)'
      
        '      ON (Worktop_thickness.Thickness = Quote_Element.Thickness)' +
        ' AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '      ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '      ON Material_Use.Material_Use = Quote_Element.Material_Use'
      'WHERE Quote = :Quote and'
      '      Element_Number = :Element_Number and'
      '      Element_Type = '#39'U'#39)
    Left = 352
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Element_Number'
      end>
  end
  object qryQAllUpstands: TFDQuery
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
      '        Quote_Element.No_Of_polished_Depths,'
      '        Quote_Element.No_Of_polished_Lengths,'
      '        Quote_Element.Total_Upstand_Pieces,'
      '        Worktop.Worktop_Group,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description AS Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote_Element.Upstand_Polish_Cost,'
      '        Quote_Element.Upstand_Polish_Price,'
      '        Quote_Element.Material_Use,'
      '        Material_Use.Use_Description,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Original_Unit_Price'
      'FROM Material_Use'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN ((Thickness'
      '      INNER JOIN Worktop_thickness'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN Quote_Element'
      
        '        ON Material_Type.Material_Type = Quote_Element.Material_' +
        'type)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e'
      'WHERE Quote = :Quote and Element_Type = '#39'U'#39
      'ORDER BY Element_Number')
    Left = 360
    Top = 224
    ParamData = <
      item
        Name = 'Quote'
        ParamType = ptInput
      end>
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set last_quote_number = :last_quote_number'
      'where company = 1')
    Left = 280
    Top = 448
    ParamData = <
      item
        Name = 'last_quote_number'
      end>
  end
  object qryGetVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Vat'
      'where vat = :vat')
    Left = 488
    Top = 232
    ParamData = <
      item
        Name = 'vat'
      end>
  end
  object qryQEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Quote_internal_Note, Operator'
      'where Quote = :Quote and Internal_Note = :Internal_Note and'
      'Quote_internal_Note.Operator = Operator.Operator')
    Left = 416
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Internal_Note'
      end>
  end
  object qryQAllEvents: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select q.Quote, q.Internal_Note, q.Date_Time_Entered, q.Narrativ' +
        'e, o.Operator, o.Operator_Name, o.Login_name,'
      
        '  o.Operator_Can_Login, o.Telephone_number, o.Quote_Follow_Up_Re' +
        'minder, o.End_User, o.Can_Update_Schedule,'
      
        '  o.Email_Address, o.Job_Title, o.Mobile_Number, o.Login_Passwor' +
        'd, o.Revenue_Centre'
      '  from Quote_internal_Note as q'
      '    join Operator as o on q.Operator = o.Operator'
      ' where Quote = :Quote'
      '')
    Left = 416
    Top = 224
    ParamData = <
      item
        Name = 'Quote'
        ParamType = ptInput
      end>
  end
  object qryQAddEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Quote_Internal_Note ('
      'Quote,'
      'Internal_Note,'
      'Date_Time_Entered,'
      'Operator,'
      'Narrative)'
      'values ('
      ':Quote,'
      ':Internal_Note,'
      ':Date_Time_Entered,'
      ':Operator,'
      ':Narrative)')
    Left = 416
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
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
  object qryUpQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status'
      'where Quote =:quote')
    Left = 560
    Top = 8
    ParamData = <
      item
        Name = 'Quote_Status'
      end
      item
        Name = 'quote'
      end>
  end
  object qryWTGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Worktop_Group'
      'from Worktop_Group'
      'where Worktop_Group = :Worktop_Group')
    Left = 488
    Top = 296
    ParamData = <
      item
        Name = 'Worktop_Group'
      end>
  end
  object qryGetSOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_order, Sales_order_line_no'
      'from sales_order_line'
      'where Quote = :Quote')
    Left = 560
    Top = 56
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryUpSOStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Sales_order'
      'set SAles_order_Status = :sales_order_Status'
      'where sales_order = :Sales_order')
    Left = 560
    Top = 112
    ParamData = <
      item
        Name = 'sales_order_Status'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object qryUpQuoteSO: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = :Quote_Status,'
      'Date_Accepted = :Date_Accepted'
      'where Quote =:quote')
    Left = 560
    Top = 168
    ParamData = <
      item
        Name = 'Quote_Status'
      end
      item
        Name = 'Date_Accepted'
      end
      item
        Name = 'quote'
      end>
  end
  object qryUpSOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Sales_order_line'
      'set Job = :Job'
      'where sales_order = :Sales_order and'
      'sales_order_line_no = :sales_order_line_no')
    Left = 640
    Top = 112
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryGetJob: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job'
      'from Job'
      'Where Job.Quote = :Quote')
    Left = 488
    Top = 464
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryDesigner: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Designer'
      
        'where (inactive = '#39'N'#39' or inactive is null) or designer = :design' +
        'er'
      'order by Designer_Name')
    Left = 744
    Top = 16
    ParamData = <
      item
        Name = 'designer'
      end>
  end
  object dtsDesigner: TDataSource
    DataSet = qryDesigner
    Left = 816
    Top = 16
  end
  object qryLeadSource: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Sales_lead_Source'
      
        'where (inactive = '#39'N'#39' or inactive is null) or sales_lead_source ' +
        '= :sales_lead_source'
      'order by Sales_lead_Source_Descr')
    Left = 744
    Top = 80
    ParamData = <
      item
        Name = 'sales_lead_source'
      end>
  end
  object dtsLeadSource: TDataSource
    DataSet = qryLeadSource
    Left = 824
    Top = 80
  end
  object qryBranch: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Customer = :Customer and'
      '(inactive = '#39'N'#39' or inactive is null) OR Branch_no = :Branch_No'
      'order by Branch_Name')
    Left = 744
    Top = 152
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object dtsBranch: TDataSource
    DataSet = qryBranch
    Left = 816
    Top = 152
  end
  object qryOneWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Worktop,'
      '        Thickness,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Worktop_thickness'
      'where worktop = :Worktop and'
      'thickness = :Thickness')
    Left = 744
    Top = 216
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Vat'
      'where (inactive = '#39'N'#39' or inactive is null) or vat = :vat'
      'order by Vat_Rate')
    Left = 744
    Top = 272
    ParamData = <
      item
        Name = 'vat'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsVat: TDataSource
    DataSet = qryVat
    Left = 816
    Top = 272
  end
  object qryUpSOLineValues: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Sales_order_line'
      'SET Unit_Price = :Unit_Price,'
      '    Quantity = :Quantity,'
      '    Nett_Price = :Nett_Price,'
      '    Discount_Value = :Discount_Value,'
      '    Installation_Price = :Installation_Price,'
      '    Survey_Price = :Survey_Price,'
      '    Delivery_Price = :Delivery_Price,'
      '    Vat = :Vat,'
      '    Markup_Value = :Markup_Value,'
      '    Waste_Value = :Waste_Value'
      'where sales_order = :Sales_order and'
      'sales_order_line_no = :sales_order_line_no')
    Left = 640
    Top = 168
    ParamData = <
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Quantity'
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
      end
      item
        Name = 'Markup_Value'
      end
      item
        Name = 'Waste_Value'
      end
      item
        Name = 'Sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryUpSOHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Sales_order'
      'SET '
      '    Goods_Value = :Goods_Value,'
      '    Vat_Value = :Vat_Value'
      'where sales_order = :Sales_order')
    Left = 640
    Top = 232
    ParamData = <
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object qryGetContacts: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Contact'
      'WHERE Customer = :Customer')
    Left = 744
    Top = 336
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryQReason: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Inactive_Reason'
      'where Inactive_Type = '#39'Q'#39
      'order by Inactive_Reason_Descr')
    Left = 24
    Top = 512
  end
  object dtsQReason: TDataSource
    DataSet = qryQReason
    Left = 96
    Top = 512
  end
  object qryReQuoteCount: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT max(Quote_Number) as Last_ReQuote'
      'FROM Quote'
      'WHERE Original_Quote = :Original_Quote')
    Left = 488
    Top = 408
    ParamData = <
      item
        Name = 'Original_Quote'
      end>
  end
  object qryGetLinkedQuotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Operator.Operator_Name,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Quote.Quote,'
      '        Quote.Date_Raised,'
      '        Quote.Description,'
      '        Material_Type.Description AS Material_Type_Description,'
      '        Quote.Quote_Number,'
      '        Quote.Original_Quote,'
      '        Quote.Installation_price,'
      '        Quote.Delivery_Price,'
      '        Quote.Survey_price,'
      
        '        (Quote.Nett_Price-Discount_Value+Markup_Value) AS Comple' +
        'te_Price,'
      
        '        (Quote.Nett_Price-Discount_Value+Markup_Value+Installati' +
        'on_Price+Delivery_Price+Survey_Price) AS Total_Price,'
      '        Quote_Status.Quote_status_description'
      'FROM Quote_Status'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Operator AS Account_Manager'
      '        INNER JOIN (Operator'
      '        INNER JOIN Quote'
      '          ON Operator.Operator = Quote.Operator)'
      '          ON Account_Manager.Operator = Quote.Account_Manager)'
      '          ON Material_Type.Material_Type = Quote.Material_Type)'
      '          ON Quote_Status.Quote_Status = Quote.Quote_Status'
      'WHERE (Quote.Original_Quote = :Original_Quote)'
      'ORDER BY Quote.Quote DESC'
      '')
    Left = 648
    Top = 416
    ParamData = <
      item
        Name = 'Original_Quote'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryGetLinkedQuotesOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      Required = True
      Size = 30
    end
    object qryGetLinkedQuotesAccount_Manager_Name: TWideStringField
      FieldName = 'Account_Manager_Name'
      Origin = 'Account_Manager_Name'
      Required = True
      Size = 30
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
    object qryGetLinkedQuotesDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 255
    end
    object qryGetLinkedQuotesMaterial_Type_Description: TWideStringField
      FieldName = 'Material_Type_Description'
      Origin = 'Material_Type_Description'
      Size = 100
    end
    object qryGetLinkedQuotesQuote_Number: TFloatField
      FieldName = 'Quote_Number'
      Origin = 'Quote_Number'
    end
    object qryGetLinkedQuotesOriginal_Quote: TIntegerField
      FieldName = 'Original_Quote'
      Origin = 'Original_Quote'
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
  end
  object dtsGetLinkedQuotes: TDataSource
    DataSet = qryGetLinkedQuotes
    Left = 760
    Top = 416
  end
  object qryGetSalesOrder: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Top 1 Sales_Order'
      'from Sales_Order_Line'
      'Where Sales_Order_Line.Quote = :Quote')
    Left = 488
    Top = 520
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryUpQuoteAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Customer = :Customer,'
      '    Address = :Address,'
      '    Customer_Name = :Customer_Name'
      'where Quote = :quote')
    Left = 936
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Address'
        DataType = ftInteger
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'quote'
      end>
  end
  object qryGetSpeculativeQuotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'SELECT Quote.Quote, Quote.Customer, Quote.Address, Customer.Is_R' +
        'etail_Customer'
      'FROM Quote, Customer'
      
        'WHERE ((Quote.Customer_Name = :Customer_Name) AND (Address <> 0)' +
        ') AND'
      '(Customer.Is_Retail_Customer = '#39'N'#39') AND'
      '(Quote.Customer = Customer.Customer)')
    Left = 936
    Top = 72
    ParamData = <
      item
        Name = 'Customer_Name'
      end>
  end
  object qryDeclineQuotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Quote'
      'SET Inactive = '#39'Y'#39', inactive_Reason = :inactive_Reason'
      'WHERE Original_Quote = :Original_Quote AND'
      '      Quote_Status < 24')
    Left = 936
    Top = 136
    ParamData = <
      item
        Name = 'inactive_Reason'
      end
      item
        Name = 'Original_Quote'
      end>
  end
  object qryDummyOld: TFDQuery
    SQL.Strings = (
      '        Quote.Quote,'
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
      '        Quote.Importance,'
      '        Quote.Address,'
      
        '        (Quote.Nett_price - Quote.Discount_Value + Quote.Markup_' +
        'Value + Quote.Waste_Value) as Gross_Price,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative,'
      '        Quote.Quote_Number,'
      '        Quote.Original_Quote,'
      '        Quote.Expiry_Date'
      'FROM Material_Type'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Operator'
      '      INNER JOIN Quote ON'
      '        Operator.Operator = Quote.Operator) ON'
      '        Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Material_Type.Material_Type = Quote.Material_Type'
      
        'WHERE ((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote =' +
        ' '#39'N'#39'))')
    Left = 160
    Top = 56
  end
  object qryOldDummy: TFDQuery
    SQL.Strings = (
      '        Quote.Quote,'
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
      '        Quote.Importance,'
      '        Quote.Address,'
      
        '        (Quote.Nett_price - Quote.Discount_Value + Quote.Markup_' +
        'Value + Quote.Waste_Value) as Gross_Price,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative,'
      '        Quote.Quote_Number,'
      '        Quote.Original_Quote,'
      '        Quote.Expiry_Date'
      'FROM Material_Type'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Operator'
      '      INNER JOIN Quote ON'
      '        Operator.Operator = Quote.Operator) ON'
      '        Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Material_Type.Material_Type = Quote.Material_Type'
      
        'WHERE ((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote =' +
        ' '#39'N'#39'))')
    Left = 416
    Top = 8
  end
  object qryQAddSlab: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Quote_Slab ('
      'Quote,'
      'Slab_Number,'
      'Worktop,'
      'Depth,'
      'Length,'
      'Thickness,'
      'Unit_Cost,'
      'Price_unit,'
      'Supplier,'
      'Waste_Percentage,'
      'Waste_Value,'
      'Waste_Cost_Multiplier,'
      'Quantity,'
      'Markup_Percentage,'
      'Unit_Price,'
      'Slab_Size,'
      'Adhesive_Product_Code,'
      'Adhesive_Quantity,'
      'Adhesive_Unit_Cost,'
      'Adhesive_Cost_Pack_Quantity'
      ')'
      'values'
      '('
      ':Quote,'
      ':Slab_Number,'
      ':Worktop,'
      ':Depth,'
      ':Length,'
      ':Thickness,'
      ':Unit_Cost,'
      ':Price_unit,'
      ':Supplier,'
      ':Waste_Percentage,'
      ':Waste_Value,'
      ':Waste_Cost_Multiplier,'
      ':Quantity,'
      ':Markup_Percentage,'
      ':Unit_Price,'
      ':Slab_Size,'
      ':Adhesive_Product_Code,'
      ':Adhesive_Quantity,'
      ':Adhesive_Unit_Cost,'
      ':Adhesive_Cost_Pack_Quantity'
      ')'
      ''
      '')
    Left = 352
    Top = 160
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Slab_Number'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Waste_Percentage'
      end
      item
        Name = 'Waste_Value'
      end
      item
        Name = 'Waste_Cost_Multiplier'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Markup_Percentage'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Slab_Size'
        DataType = ftInteger
      end
      item
        Name = 'Adhesive_Product_Code'
      end
      item
        Name = 'Adhesive_Quantity'
      end
      item
        Name = 'Adhesive_Unit_Cost'
      end
      item
        Name = 'Adhesive_Cost_Pack_Quantity'
      end>
  end
  object qryQAllSlabs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Slab.Quote,'
      '        Quote_Slab.Slab_Number,'
      '        Quote_Slab.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Quote_Slab.Thickness,'
      '        Thickness.Thickness_mm as Thickness_Description,'
      '        Quote_Slab.Supplier,'
      '        Supplier.Supplier_name,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Quote_Slab.Quantity,'
      '        Quote_Slab.Unit_Cost,'
      '        Quote_Slab.Price_Unit,'
      '        Quote_Slab.Waste_Cost_Multiplier,'
      '        Quote_Slab.Waste_Percentage,'
      '        Quote_Slab.Waste_Value,'
      '        Price_unit.Price_unit_description,'
      '        Quote_Slab.Markup_Percentage,'
      '        Quote_Slab.Unit_Price,'
      '        Quote_Slab.Slab_Size,'
      '        Quote_Slab.Adhesive_Product_Code,'
      '        Quote_Slab.Adhesive_Quantity,'
      '        Quote_Slab.Adhesive_Unit_Cost,'
      '        Quote_Slab.Adhesive_Cost_Pack_Quantity,'
      '        Supplier_Product.Description as Adhesive_Description'
      'FROM Supplier_Product'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Supplier'
      '      INNER JOIN (Quote_Slab'
      '      LEFT JOIN Price_unit'
      '        ON Quote_Slab.Price_Unit = Price_unit.Price_unit)'
      '        ON Supplier.Supplier = Quote_Slab.Supplier)'
      '        ON Thickness.Thickness = Quote_Slab.Thickness)'
      '        ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '        ON (Supplier_Product.Supplier_Product_Code = Quote_Slab.' +
        'Adhesive_Product_Code)'
      '          AND (Supplier_Product.Supplier = Quote_Slab.Supplier)'
      'WHERE Quote = :Quote'
      'ORDER BY Slab_Number')
    Left = 96
    Top = 280
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryGetProduct: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Product.Supplier_Product,'
      '    Supplier_Product.Supplier,'
      '    Supplier_Product.Supplier_Product_Code,'
      '    Supplier_Product.Description,'
      '    Supplier_Product.Price_Pointer,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost'
      'FROM Supplier_Product'
      'WHERE (Supplier = :Supplier) AND'
      '      (Supplier_Product_Code = :Supplier_Product_Code) AND'
      '      (Inactive = '#39'N'#39')')
    Left = 760
    Top = 480
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Supplier_Product_Code'
      end>
  end
  object qryGetProducts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Supplier_Product_Code, Description'
      'FROM Supplier_Product'
      'WHERE Supplier = :Supplier AND (Inactive = '#39'N'#39')')
    Left = 848
    Top = 480
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object dtsGetProducts: TDataSource
    DataSet = qryGetProducts
    Left = 896
    Top = 480
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'ORDER BY Revenue_Centre_Descr')
    Left = 760
    Top = 536
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 848
    Top = 536
  end
end
