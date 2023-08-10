object dtmdlJob: TdtmdlJob
  Height = 774
  Width = 1183
  PixelsPerInch = 120
  object dtsAllJobs: TDataSource
    DataSet = qryAllJobs
    Left = 110
    Top = 30
  end
  object qryAllJobs: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'SELECT Job.*,'
      '      Material_Type.Description AS Material_Description,'
      '      Job_Status.Job_Status_Description AS Status_Description,'
      '      Operator.Operator_Name,'
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
      'WHERE 1=1')
    Left = 40
    Top = 30
    object qryAllJobsJob: TFloatField
      FieldName = 'Job'
      Origin = 'Job'
      Required = True
    end
    object qryAllJobsJob_Status: TIntegerField
      FieldName = 'Job_Status'
      Origin = 'Job_Status'
      Required = True
    end
    object qryAllJobsQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
    end
    object qryAllJobsCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qryAllJobsContact_name: TWideStringField
      FieldName = 'Contact_name'
      Origin = 'Contact_name'
      Size = 50
    end
    object qryAllJobsOrder_ref_no: TWideStringField
      FieldName = 'Order_ref_no'
      Origin = 'Order_ref_no'
      Required = True
      Size = 30
    end
    object qryAllJobsDate_Raised: TSQLTimeStampField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qryAllJobsDate_Required: TSQLTimeStampField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qryAllJobsPayment_due: TSQLTimeStampField
      FieldName = 'Payment_due'
      Origin = 'Payment_due'
    end
    object qryAllJobsProduction_date: TSQLTimeStampField
      FieldName = 'Production_date'
      Origin = 'Production_date'
    end
    object qryAllJobsTemplate_date: TSQLTimeStampField
      FieldName = 'Template_date'
      Origin = 'Template_date'
    end
    object qryAllJobsInstallation_date: TSQLTimeStampField
      FieldName = 'Installation_date'
      Origin = 'Installation_date'
    end
    object qryAllJobsDeposit_amount: TCurrencyField
      FieldName = 'Deposit_amount'
      Origin = 'Deposit_amount'
    end
    object qryAllJobsDelivery_Price: TCurrencyField
      FieldName = 'Delivery_Price'
      Origin = 'Delivery_Price'
    end
    object qryAllJobsInstallation_price: TCurrencyField
      FieldName = 'Installation_price'
      Origin = 'Installation_price'
    end
    object qryAllJobsSurvey_price: TCurrencyField
      FieldName = 'Survey_price'
      Origin = 'Survey_price'
      Required = True
    end
    object qryAllJobsOperator: TIntegerField
      FieldName = 'Operator'
      Origin = 'Operator'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAllJobsProduction_date_Actual: TSQLTimeStampField
      FieldName = 'Production_date_Actual'
      Origin = 'Production_date_Actual'
    end
    object qryAllJobsTemplate_date_actual: TSQLTimeStampField
      FieldName = 'Template_date_actual'
      Origin = 'Template_date_actual'
    end
    object qryAllJobsInstallation_date_actual: TSQLTimeStampField
      FieldName = 'Installation_date_actual'
      Origin = 'Installation_date_actual'
    end
    object qryAllJobsDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 255
    end
    object qryAllJobsMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
      Origin = 'Material_Type'
    end
    object qryAllJobsExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
      Origin = 'Extra_Notes'
    end
    object qryAllJobsAvailability: TIntegerField
      FieldName = 'Availability'
      Origin = 'Availability'
    end
    object qryAllJobsPayment_Terms: TIntegerField
      FieldName = 'Payment_Terms'
      Origin = 'Payment_Terms'
    end
    object qryAllJobsReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Size = 50
    end
    object qryAllJobsNett_Price: TCurrencyField
      FieldName = 'Nett_Price'
      Origin = 'Nett_Price'
    end
    object qryAllJobsInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qryAllJobsInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
      Origin = 'Inactive_Reason'
    end
    object qryAllJobsAddress: TIntegerField
      FieldName = 'Address'
      Origin = 'Address'
    end
    object qryAllJobsDiscount_Rate: TFloatField
      FieldName = 'Discount_Rate'
      Origin = 'Discount_Rate'
    end
    object qryAllJobsDiscount_Value: TCurrencyField
      FieldName = 'Discount_Value'
      Origin = 'Discount_Value'
    end
    object qryAllJobsCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Size = 50
    end
    object qryAllJobsInstall_Address: TIntegerField
      FieldName = 'Install_Address'
      Origin = 'Install_Address'
    end
    object qryAllJobsDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
      Origin = 'Deposit_Terms'
    end
    object qryAllJobsVAT: TIntegerField
      FieldName = 'VAT'
      Origin = 'VAT'
    end
    object qryAllJobsQuote_Nett_Price: TCurrencyField
      FieldName = 'Quote_Nett_Price'
      Origin = 'Quote_Nett_Price'
    end
    object qryAllJobsFitter: TIntegerField
      FieldName = 'Fitter'
      Origin = 'Fitter'
    end
    object qryAllJobsInstall_Name: TWideStringField
      FieldName = 'Install_Name'
      Origin = 'Install_Name'
      Size = 30
    end
    object qryAllJobsInstall_Phone: TWideStringField
      FieldName = 'Install_Phone'
      Origin = 'Install_Phone'
      Size = 30
    end
    object qryAllJobsDesigner: TIntegerField
      FieldName = 'Designer'
      Origin = 'Designer'
    end
    object qryAllJobsBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
    end
    object qryAllJobsRisk_Notes: TIntegerField
      FieldName = 'Risk_Notes'
      Origin = 'Risk_Notes'
    end
    object qryAllJobsDescriptive_Reference: TWideStringField
      FieldName = 'Descriptive_Reference'
      Origin = 'Descriptive_Reference'
      Size = 100
    end
    object qryAllJobsMarkup_Rate: TFloatField
      FieldName = 'Markup_Rate'
      Origin = 'Markup_Rate'
    end
    object qryAllJobsMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
      Origin = 'Markup_Value'
    end
    object qryAllJobsContract_Quote: TWideStringField
      FieldName = 'Contract_Quote'
      Origin = 'Contract_Quote'
      Size = 1
    end
    object qryAllJobsWaste_Percentage: TFloatField
      FieldName = 'Waste_Percentage'
      Origin = 'Waste_Percentage'
    end
    object qryAllJobsWaste_Value: TFloatField
      FieldName = 'Waste_Value'
      Origin = 'Waste_Value'
    end
    object qryAllJobsProject_Reference: TWideStringField
      FieldName = 'Project_Reference'
      Origin = 'Project_Reference'
      Size = 100
    end
    object qryAllJobsSpecification: TIntegerField
      FieldName = 'Specification'
      Origin = 'Specification'
    end
    object qryAllJobsRisk_Assessment: TIntegerField
      FieldName = 'Risk_Assessment'
      Origin = 'Risk_Assessment'
    end
    object qryAllJobsMaterial_Description: TWideStringField
      FieldName = 'Material_Description'
      Origin = 'Material_Description'
      Size = 100
    end
    object qryAllJobsStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Origin = 'Status_Description'
      Size = 50
    end
    object qryAllJobsOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      Required = True
      Size = 30
    end
    object qryAllJobsGross_Price: TCurrencyField
      FieldName = 'Gross_Price'
      Origin = 'Gross_Price'
      ReadOnly = True
    end
    object qryAllJobsSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      ReadOnly = True
    end
  end
  object qrydummy: TFDQuery
    SQL.Strings = (
      '        Job.*,'
      '        Material_Type.Description AS Material_Description,'
      '        Job_Status.Job_Status_Description AS Status_Description,'
      '        Operator.Operator_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Credit_Status,'
      '        Customer.Credit_Limit,'
      
        '        (Job.Nett_Price-Job.Discount_Value+Job.Markup_Value) AS ' +
        'Gross_Price,'
      '        (select TOP 1 Sales_Order_Line.Sales_Order'
      '         from Sales_Order_Line'
      '         where Sales_Order_Line.Job = Job.Job) AS Sales_Order,'
      
        '        (Job.Nett_Price-Job.Discount_Value+Job.Markup_Value+Job.' +
        'installation_Price+job.survey_price+job.delivery_Price) * (1+(Va' +
        't.Vat_Rate/100)) AS Gross_Price_Incl_Vat,'
      '        Vat.Vat_Rate,'
      
        #9#9'    (SELECT Sum((((Job_Element.Length * Job_Element.Depth)/100' +
        '0000.00000) * Job_Element.Quantity) * Worktop_Type_Thickness.Wei' +
        'ght_kg) AS Total_Weight'
      #9#9'      FROM Worktop_Type_Thickness'
      #9#9#9'      INNER JOIN (Material_Type'
      #9#9#9'      INNER JOIN Job_Element'
      
        #9#9#9#9'      ON Material_Type.Material_Type = Job_Element.Material_' +
        'type)'
      
        #9#9#9#9'      ON (Worktop_Type_Thickness.Thickness = Job_Element.Thi' +
        'ckness) AND (Worktop_Type_Thickness.Worktop_Type = Material_Type' +
        '.Worktop_Type)'
      #9#9'    WHERE (Job_Element.job = Job.Job)) as Worktop_Weight'
      'FROM (Operator'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Job_Status'
      '        INNER JOIN (Customer'
      '        INNER JOIN Job'
      '          ON Customer.Customer = Job.Customer)'
      '          ON Job_Status.Job_Status = Job.Job_Status)'
      '          ON Material_Type.Material_Type = Job.Material_Type)'
      '          ON Operator.Operator = Job.Operator)'
      '        LEFT JOIN Vat'
      '          ON Job.VAT = Vat.Vat'
      'WHERE 1=1')
    Left = 180
    Top = 30
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 360
    Top = 40
  end
  object qryjHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Job.*,'
      '      Material_Type.Description AS Material_Description,'
      '      Job_Status.Job_Status_Description AS Status_Description,'
      '      Operator.Operator_Name,'
      '      Vat.Vat_Rate,'
      '      Customer.Is_Retail_Customer,'
      '      Customer.Customer_is_Speculative'
      'FROM Operator'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN (Job_Status'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Vat'
      '      RIGHT JOIN Job'
      '        ON Vat.Vat = Job.VAT)'
      '        ON Customer.Customer = Job.Customer)'
      '        ON Job_Status.Job_Status = Job.Job_Status)'
      '        ON Material_Type.Material_Type = Job.Material_Type)'
      '        ON Operator.Operator = Job.Operator'
      'WHERE Job.Job = :Job')
    Left = 30
    Top = 140
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryjAddHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert INTO Job'
      '(       Job,'
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
      '        Job_Status,'
      '        Inactive,'
      '        Inactive_Reason,'
      '        Extra_Notes,'
      '        Payment_Terms,'
      '        Availability,'
      '        Material_Type,'
      '        Contact_Name,'
      '        Address,'
      '        Discount_Rate,'
      '        Discount_Value,'
      '        Markup_Rate,'
      '        Markup_Value,'
      '        Waste_Value,'
      '        Order_Ref_no,'
      '        Quote,'
      '        Production_date,'
      '        template_date,'
      '        installation_date,'
      '        Production_date_actual,'
      '        template_date_actual,'
      '        installation_date_actual,'
      '        Customer_Name,'
      '        Install_address,'
      '        Deposit_Terms,'
      '        Deposit_Amount,'
      '        Vat,'
      '        Quote_Nett_Price,'
      '        Fitter,'
      '        Install_Name,'
      '        Install_Phone,'
      '        Designer,'
      '        Branch_no,'
      '        Risk_Notes'
      ')'
      'Values'
      '(       :Job,'
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
      '        :Job_Status,'
      '        :Inactive,'
      '        :Inactive_Reason,'
      '        :Extra_Notes,'
      '        :Payment_Terms,'
      '        :Availability,'
      '        :Material_Type,'
      '        :Contact_Name,'
      '        :Address,'
      '        :Discount_Rate,'
      '        :Discount_Value,'
      '        :Markup_Rate,'
      '        :Markup_Value,'
      '        :Waste_Value,'
      '        :Order_Ref_no,'
      '        :Quote,'
      '        :Production_date,'
      '        :template_date,'
      '        :installation_date,'
      '        :Production_date_actual,'
      '        :template_date_actual,'
      '        :installation_date_actual,'
      '        :Customer_name,'
      '        :Install_Address,'
      '        :Deposit_Terms,'
      '        :Deposit_Amount,'
      '        :Vat,'
      '        :Quote_Nett_Price,'
      '        :Fitter,'
      '        :Install_Name,'
      '        :Install_Phone,'
      '        :Designer,'
      '        :Branch_no,'
      '        :Risk_Notes'
      ')'
      '')
    Left = 30
    Top = 200
    ParamData = <
      item
        Name = 'Job'
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
        Name = 'Job_Status'
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
        Name = 'Discount_Rate'
      end
      item
        Name = 'Discount_Value'
      end
      item
        Name = 'Markup_Rate'
      end
      item
        Name = 'Markup_Value'
      end
      item
        Name = 'Waste_Value'
      end
      item
        Name = 'Order_Ref_no'
      end
      item
        Name = 'Quote'
        DataType = ftInteger
      end
      item
        Name = 'Production_date'
      end
      item
        Name = 'template_date'
      end
      item
        Name = 'installation_date'
      end
      item
        Name = 'Production_date_actual'
      end
      item
        Name = 'template_date_actual'
      end
      item
        Name = 'installation_date_actual'
      end
      item
        Name = 'Customer_name'
      end
      item
        Name = 'Install_Address'
        DataType = ftInteger
      end
      item
        Name = 'Deposit_Terms'
      end
      item
        Name = 'Deposit_Amount'
      end
      item
        Name = 'Vat'
      end
      item
        Name = 'Quote_Nett_Price'
      end
      item
        Name = 'Fitter'
        DataType = ftInteger
      end
      item
        Name = 'Install_Name'
      end
      item
        Name = 'Install_Phone'
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
        Name = 'Risk_Notes'
        DataType = ftInteger
      end>
  end
  object qryjUpHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Job'
      'Set Operator = :Operator,'
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
      '    Job_Status = :Job_Status,'
      '    Inactive = :Inactive,'
      '    Inactive_Reason = :Inactive_Reason,'
      '    Extra_Notes = :Extra_Notes,'
      '    Payment_Terms = :Payment_Terms,'
      '    Availability = :Availability,'
      '    Material_Type = :Material_Type,'
      '    Contact_Name = :Contact_Name,'
      '    Address = :Address,'
      '    Discount_Rate = :Discount_Rate,'
      '    Discount_Value = :Discount_Value,'
      '    Markup_Rate = :Markup_Rate,'
      '    Markup_Value = :Markup_Value,'
      '    Order_ref_no = :Order_Ref_No,'
      '    Quote = :Quote,'
      '    Production_date = :Production_Date,'
      '    template_date = :Template_Date,'
      '    installation_date = :Installation_Date,'
      '    Production_date_actual = :Production_Date_actual,'
      '    template_date_actual = :Template_Date_actual,'
      '    installation_date_actual = :installation_Date_Actual,'
      '    Customer_Name = :Customer_name,'
      '    Install_Address = :Install_address,'
      '    Vat = :Vat,'
      '    Deposit_Amount = :Deposit_Amount,'
      '    Deposit_Terms = :Deposit_Terms,'
      '    Quote_nett_Price = :Quote_Nett_Price,'
      '    Fitter = :Fitter,'
      '    Install_Name = :Install_Name,'
      '    Install_Phone = :Install_Phone,'
      '    Designer = :Designer,'
      '    Branch_no = :Branch_no,'
      '    Risk_Notes = :Risk_Notes,'
      '    Waste_Value = :Waste_Value'
      'WHERE Job = :Job')
    Left = 30
    Top = 370
    ParamData = <
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
        Name = 'Job_Status'
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
        Name = 'Discount_Rate'
      end
      item
        Name = 'Discount_Value'
      end
      item
        Name = 'Markup_Rate'
      end
      item
        Name = 'Markup_Value'
      end
      item
        Name = 'Order_Ref_No'
      end
      item
        Name = 'Quote'
        DataType = ftInteger
      end
      item
        Name = 'Production_Date'
      end
      item
        Name = 'Template_Date'
      end
      item
        Name = 'Installation_Date'
      end
      item
        Name = 'Production_Date_actual'
      end
      item
        Name = 'Template_Date_actual'
      end
      item
        Name = 'installation_Date_Actual'
      end
      item
        Name = 'Customer_name'
      end
      item
        Name = 'Install_address'
        DataType = ftInteger
      end
      item
        Name = 'Vat'
      end
      item
        Name = 'Deposit_Amount'
      end
      item
        Name = 'Deposit_Terms'
      end
      item
        Name = 'Quote_Nett_Price'
      end
      item
        Name = 'Fitter'
        DataType = ftInteger
      end
      item
        Name = 'Install_Name'
      end
      item
        Name = 'Install_Phone'
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
        Name = 'Risk_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Waste_Value'
      end
      item
        Name = 'Job'
      end>
  end
  object qryjElement: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Element.*,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description as Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description as Material_Description'
      'FROM Material_Type'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN Job_Element ON'
      
        '        (Worktop_thickness.Thickness = Job_Element.Thickness) AN' +
        'D'
      '        (Worktop_thickness.Worktop = Job_Element.Worktop)) ON'
      '        Worktop.Worktop = Worktop_thickness.Worktop) ON'
      '        Thickness.Thickness = Worktop_thickness.Thickness) ON'
      '        Material_Type.Material_Type = Job_Element.Material_type'
      'WHERE Job = :Job and'
      '               Element_Number = :Element_Number and'
      'Element_Type ='#39'P'#39)
    Left = 120
    Top = 140
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Element_Number'
      end>
  end
  object qryjAddElement: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Job_Element ('
      'Job,'
      'Element_Number,'
      'Element_Description,'
      'Material_Type,'
      'Worktop,'
      'Depth,'
      'Length,'
      'Thickness,'
      'Unit_Price,'
      'Price_unit,'
      'Quantity,'
      'Element_Type,'
      'Upstand_Polish_Price,'
      'Material_Use,'
      'No_of_Polished_Depths,'
      'No_of_Polished_Lengths,'
      'Total_Upstand_Pieces'
      ')'
      'values '
      '('
      ':Job,'
      ':Element_Number,'
      ':Element_Description,'
      ':Material_Type,'
      ':Worktop,'
      ':Depth,'
      ':Length,'
      ':Thickness,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Quantity,'
      ':Element_Type,'
      ':Upstand_Polish_Price,'
      ':Material_Use,'
      ':No_of_Polished_Depths,'
      ':No_of_Polished_Lengths,'
      ':Total_Upstand_Pieces'
      ')')
    Left = 120
    Top = 200
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Element_Number'
      end
      item
        Name = 'Element_Description'
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
        Name = 'Upstand_Polish_Price'
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
  object qryjAllElements: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Element.Job,'
      '        Job_Element.Element_Description,'
      '        Job_Element.Element_Number,'
      '        Job_Element.Element_Type,'
      '        Job_Element.Material_type,'
      '        Job_Element.Worktop,'
      '        Job_Element.Depth,'
      '        Job_Element.Length,'
      '        Job_Element.Thickness,'
      '        Job_Element.Unit_price,'
      '        Job_Element.Price_unit,'
      '        Job_Element.Quantity,'
      '        Job_Element.Total_Upstand_Pieces,'
      '        Worktop.Worktop_Group,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description AS Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description AS Material_Description,'
      '        Material_Use.Use_Description,'
      '        Job_Element.Material_Use'
      'FROM Material_Use'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN ((Thickness'
      '      INNER JOIN Worktop_thickness'
      '          ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN Job_Element'
      
        '          ON Material_Type.Material_Type = Job_Element.Material_' +
        'type)'
      
        '          ON (Worktop_thickness.Thickness = Job_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Job_Element.Worktop))'
      '          ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '          ON Material_Use.Material_Use = Job_Element.Material_Us' +
        'e'
      'WHERE Job = :Job and Element_Type = '#39'P'#39
      'ORDER BY Element_Number')
    Left = 120
    Top = 280
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryjExtra: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Extra.*,'
      '        Extra_Charge.Description,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (Extra_Charge'
      '      INNER JOIN Job_Extra ON'
      '        Extra_Charge.Extra_Charge = Job_Extra.Extra_Charge) ON'
      '        Price_unit.Price_unit = Job_Extra.Price_unit'
      'WHERE Job = :Job and'
      '               Extra_no = :Extra_no')
    Left = 200
    Top = 140
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Extra_no'
      end>
  end
  object qryjCutOut: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Cutout.*,'
      '        CutOut.Description as Cutout_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        Price_unit.Price_unit_description,'
      'FROM Price_unit'
      '      INNER JOIN (((CutOut'
      '      INNER JOIN Job_Cutout ON'
      '        CutOut.CutOut = Job_Cutout.Cutout)'
      '      INNER JOIN Material_Type ON'
      '        Job_Cutout.Material_Type = Material_Type.Material_Type)'
      '      INNER JOIN Edge_Type ON'
      '        Job_Cutout.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Job_Cutout.Price_unit'
      'WHERE Job = :Job and'
      '               Cutout_Number = :cutout_Number')
    Left = 280
    Top = 140
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'cutout_Number'
      end>
  end
  object qryjEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Edge.*,'
      '        Edge_profile.Description as Edge_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (((Edge_profile'
      '      INNER JOIN Job_Edge ON'
      '        Edge_profile.Edge_profile = Job_Edge.Edge_profile)'
      '      INNER JOIN Material_Type ON'
      '        Job_Edge.Material_Type = Material_Type.Material_Type)'
      '      INNER JOIN Edge_Type ON'
      '        Job_Edge.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Job_Edge.Price_unit'
      'WHERE Job = :Job and'
      '               Edge_Number = :Edge_Number')
    Left = 360
    Top = 140
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Edge_Number'
      end>
  end
  object qryjAddExtra: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Job_Extra ('
      'Job,'
      'Extra_no,'
      'Extra_Charge,'
      'Unit_Price,'
      'Price_unit,'
      'Quantity,'
      'Do_not_Discount)'
      'values ('
      ':Job,'
      ':Extra_no,'
      ':Extra_Charge,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Quantity,'
      ':Do_not_Discount)')
    Left = 200
    Top = 200
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Extra_no'
      end
      item
        Name = 'Extra_Charge'
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
        Name = 'Do_not_Discount'
      end>
  end
  object qryjAddCutOut: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Job_Cutout ('
      'Job,'
      'cutout_Number,'
      'Material_Type,'
      'cutout,'
      'Edge_Type,'
      'Unit_Price,'
      'Price_unit,'
      'Quantity)'
      'values ('
      ':Job,'
      ':cutout_Number,'
      ':Material_Type,'
      ':cutout,'
      ':Edge_Type,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Quantity)')
    Left = 280
    Top = 200
    ParamData = <
      item
        Name = 'Job'
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
        Name = 'Unit_Price'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Quantity'
      end>
  end
  object qryjAddEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Job_Edge ('
      'Job,'
      'Edge_Number,'
      'Material_Type,'
      'Edge_profile,'
      'Edge_Type,'
      'Unit_Price,'
      'Price_unit,'
      'Length)'
      'values ('
      ':Job,'
      ':Edge_Number,'
      ':Material_Type,'
      ':Edge_Profile,'
      ':Edge_Type,'
      ':Unit_Price,'
      ':Price_unit,'
      ':Length)')
    Left = 360
    Top = 200
    ParamData = <
      item
        Name = 'Job'
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
        Name = 'Edge_Type'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Length'
      end>
  end
  object qryJAllCutOuts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Cutout.Job,'
      '        Job_Cutout.Cutout_number,'
      '        Job_Cutout.Cutout,'
      '        CutOut.Description as Cutout_Description,'
      '        Job_Cutout.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Job_Cutout.Edge_Type,'
      '        Edge_Type.Edge_Type_Description,'
      '        Job_Cutout.Price_unit,'
      '        Price_unit.Price_unit_description,'
      '        Job_Cutout.Unit_price,'
      '        Job_Cutout.Quantity'
      'FROM Price_unit'
      '      INNER JOIN (((CutOut'
      '      INNER JOIN Job_Cutout ON'
      '        CutOut.CutOut = Job_Cutout.Cutout)'
      '      INNER JOIN Material_Type ON'
      '        Job_Cutout.Material_Type = Material_Type.Material_Type)'
      '      INNER JOIN Edge_Type ON'
      '        Job_Cutout.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Job_Cutout.Price_unit'
      'WHERE Job = :Job'
      'ORDER BY Cutout_Number')
    Left = 200
    Top = 280
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryjAllEdges: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Edge.Edge_number,'
      '        Job_Edge.Job,'
      '        Job_Edge.Edge_profile,'
      '        Edge_profile.Description as Edge_Description,'
      '        Job_Edge.Material_Type,'
      '        Material_Type.Description as Material_Description,'
      '        Job_Edge.Edge_Type,'
      '        Edge_Type.Edge_Type_Description,'
      '        Job_Edge.Length,'
      '        Job_Edge.Unit_price,'
      '        Job_Edge.Price_unit,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (((Edge_profile'
      '      INNER JOIN Job_Edge ON'
      '        Edge_profile.Edge_profile = Job_Edge.Edge_profile)'
      '      INNER JOIN Material_Type ON'
      '        Job_Edge.Material_Type = Material_Type.Material_Type)'
      '      INNER JOIN Edge_Type ON'
      '        Job_Edge.Edge_Type = Edge_Type.Edge_Type) ON'
      '        Price_unit.Price_unit = Job_Edge.Price_unit'
      'WHERE Job = :Job'
      'ORDER BY Edge_Number')
    Left = 280
    Top = 280
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJAllExtras: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Extra.Extra_no,'
      '        Job_Extra.Job,'
      '        Job_Extra.Do_Not_Discount,'
      '        Job_Extra.Extra_Charge,'
      '        Extra_Charge.Description,'
      '        Job_Extra.Quantity,'
      '        Job_Extra.Unit_price,'
      '        Job_Extra.Price_unit,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (Extra_Charge'
      '      INNER JOIN Job_Extra ON'
      '        Extra_Charge.Extra_Charge = Job_Extra.Extra_Charge) ON'
      '        Price_unit.Price_unit = Job_Extra.Price_unit'
      'WHERE Job = :Job'
      'ORDER BY Extra_no')
    Left = 360
    Top = 280
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryjUpElement: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Job_Element'
      'SET Element_Number = :ELement_Number,'
      'Material_Type = :Material_Type,'
      'Worktop = :Worktop,'
      'Depth = :Depth,'
      'Length = :Length,'
      'Thickness = :Thickness,'
      'Unit_Price = :Unit_Price,'
      'Price_unit = :Price_Unit,'
      'Quantity = :Quantity'
      'WHERE Job = :Job')
    Left = 120
    Top = 370
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
        Name = 'Job'
      end>
  end
  object qryjUpCutOuts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Job_Element'
      'SET Element_Number = :ELement_Number,'
      'Material_Type = :Material_Type,'
      'Worktop = :Worktop,'
      'Depth = :Depth,'
      'Length = :Length,'
      'Thickness = :Thickness,'
      'Unit_Price = :Unit_Price,'
      'Price_unit = :Price_Unit,'
      'Quantity = :Quantity'
      'WHERE Job = :Job')
    Left = 205
    Top = 370
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
        Name = 'Job'
      end>
  end
  object qryGetAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Address_Name, Street, Locale,Town_City, Postcode, County_' +
        'State,Telephone_number, Fax_number, email_address, web_address'
      'from Address where Address = :Address')
    Left = 30
    Top = 430
    ParamData = <
      item
        Name = 'Address'
      end>
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
  object qryMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Material_type'
      'order by Material_type.description')
    Left = 30
    Top = 490
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 120
    Top = 490
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
  object qryjUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Element.*,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description as Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description as Material_Description'
      'FROM Material_Type'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN Job_Element ON'
      
        '        (Worktop_thickness.Thickness = Job_Element.Thickness) AN' +
        'D'
      '        (Worktop_thickness.Worktop = Job_Element.Worktop)) ON'
      '        Worktop.Worktop = Worktop_thickness.Worktop) ON'
      '        Thickness.Thickness = Worktop_thickness.Thickness) ON'
      '        Material_Type.Material_Type = Job_Element.Material_type'
      'WHERE Job = :Job and'
      '               Element_Number = :Element_Number and'
      'Element_Type = '#39'U'#39)
    Left = 440
    Top = 140
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Element_Number'
      end>
  end
  object qryjAllUpstands: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Element.Job,'
      '        Job_Element.Element_Number,'
      '        Job_Element.Element_Type,'
      '        Job_Element.Material_type,'
      '        Job_Element.Worktop,'
      '        Job_Element.Depth,'
      '        Job_Element.Length,'
      '        Job_Element.Thickness,'
      '        Job_Element.Unit_price,'
      '        Job_Element.Price_unit,'
      '        Job_Element.Upstand_Polish_Price,'
      '        Job_Element.Quantity,'
      '        Job_Element.No_of_Polished_Depths,'
      '        Job_Element.No_of_Polished_Lengths,'
      '        Job_Element.Quantity,'
      '        Job_Element.Total_Upstand_Pieces,'
      '        Worktop.Worktop_Group,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description AS Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description AS Material_Description,'
      '        Material_Use.Use_Description,'
      '        Job_Element.Material_Use'
      'FROM Material_Use'
      '      RIGHT JOIN (Worktop'
      '      INNER JOIN ((Thickness'
      '      INNER JOIN Worktop_thickness'
      '          ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN Job_Element'
      
        '          ON Material_Type.Material_Type = Job_Element.Material_' +
        'type)'
      
        '          ON (Worktop_thickness.Thickness = Job_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Job_Element.Worktop))'
      '          ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '          ON Material_Use.Material_Use = Job_Element.Material_Us' +
        'e'
      'WHERE Job = :Job and Element_Type = '#39'U'#39
      'ORDER BY Element_Number')
    Left = 450
    Top = 280
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set last_job_number = :last_job_number'
      'where company = 1')
    Left = 350
    Top = 490
    ParamData = <
      item
        Name = 'last_job_number'
      end>
  end
  object qryJGetLast: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Last_Job_Number'
      'from Company')
    Left = 280
    Top = 10
  end
  object qryDelAddress: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'delete from Address'
      'where address = :address')
    Left = 610
    Top = 210
    ParamData = <
      item
        Name = 'address'
      end>
  end
  object qryGetNextAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(address) as Last_Address'
      'from Address')
    Left = 610
    Top = 10
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
    Left = 610
    Top = 80
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
    Left = 610
    Top = 140
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
  object qryVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Vat'
      'where vat = :vat')
    Left = 610
    Top = 270
    ParamData = <
      item
        Name = 'vat'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryQHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT'
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
      '        Customer.Customer_is_Speculative,'
      '        Customer.Is_retail_customer,'
      '        Quote.Contact_Name,'
      '        Quote.Material_Type,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote.Address,'
      '        Vat.Vat_Rate,'
      '        Quote.Vat,'
      '        Quote.Discount_Rate,'
      '        Quote.Discount_Value,'
      '        Quote.Markup_Rate,'
      '        Quote.Markup_Value,'
      '        Quote.Waste_Value,'
      '        Quote.Install_Address,'
      '        Quote.Deposit_terms,'
      '        Quote.Deposit_amount,'
      '        Quote.Designer,'
      '        Quote.Branch_no,'
      '        (SELECT TOP 1 Extra_Notes'
      '          FROM Sales_Order_Line, Sales_Order'
      '          WHERE Sales_Order_line.Quote = Quote.Quote AND'
      
        '                (Sales_Order_Line.Sales_Order = Sales_Order.Sale' +
        's_Order)) as Sales_Order_Notes'
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
    Left = 30
    Top = 90
    ParamData = <
      item
        Name = 'Quote'
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
      '        Material_Use.Use_Description'
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
    Left = 120
    Top = 90
    ParamData = <
      item
        Name = 'Quote'
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
      '        Quote_Cutout.Unit_price,'
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
      'WHERE Quote = :Quote'
      'ORDER BY CutOut_Number')
    Left = 200
    Top = 90
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
      '        Quote_Edge.Unit_price,'
      '        Quote_Edge.Price_unit,'
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
    Left = 280
    Top = 90
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQAllExtras: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Extra.Extra_no,'
      '        Quote_Extra.Quote,'
      '        Quote_Extra.Do_Not_Discount,'
      '        Quote_Extra.Extra_Charge,'
      '        Extra_Charge.Description,'
      '        Quote_Extra.Quantity,'
      '        Quote_Extra.Unit_price,'
      '        Quote_Extra.Price_unit,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '      INNER JOIN (Extra_Charge'
      '      INNER JOIN Quote_Extra ON'
      '        Extra_Charge.Extra_Charge = Quote_Extra.Extra_Charge) ON'
      '        Price_unit.Price_unit = Quote_Extra.Price_unit'
      'WHERE Quote = :Quote'
      'ORDER BY Extra_No')
    Left = 360
    Top = 90
    ParamData = <
      item
        Name = 'Quote'
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
      '        Quote_Element.No_of_Polished_Depths,'
      '        Quote_Element.No_of_Polished_lengths,'
      '        Quote_Element.Total_Upstand_Pieces,'
      '        Worktop.Worktop_Group,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Description AS Worktop_Description,'
      '        Thickness.Thickness_mm,'
      '        Material_Type.Description AS Material_Description,'
      '        Quote_Element.Upstand_Polish_Price,'
      '        Quote_Element.Material_Use,'
      '        Material_Use.Use_Description'
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
    Left = 450
    Top = 90
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryJEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Job_internal_Note, Operator'
      'where Job = :Job and Internal_Note = :Internal_Note and'
      'Job_internal_Note.Operator = Operator.Operator')
    Left = 520
    Top = 140
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Internal_Note'
      end>
  end
  object qryJAddEvent: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Job_Internal_Note ('
      'Job,'
      'Internal_Note,'
      'Date_Time_Entered,'
      'Operator,'
      'Narrative)'
      'values ('
      ':Job,'
      ':Internal_Note,'
      ':Date_Time_Entered,'
      ':Operator,'
      ':Narrative)')
    Left = 520
    Top = 200
    ParamData = <
      item
        Name = 'Job'
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
  object qryJAllEvents: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, Operator.Operator_Name'
      'from Job_internal_Note, Operator'
      'where Job = :Job and'
      'Job_internal_Note.Operator = Operator.Operator')
    Left = 520
    Top = 280
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryUpQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Quote'
      'set Quote_Status = 30'
      'where Quote =:quote')
    Left = 700
    Top = 10
    ParamData = <
      item
        Name = 'quote'
      end>
  end
  object qryUpSOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order_line'
      'set Job = :Job'
      'where Quote =:quote')
    Left = 700
    Top = 80
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'quote'
      end>
  end
  object qryUpSOStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order'
      'set Sales_order_Status = :Sales_Order_Status'
      'where Sales_order =:Sales_Order')
    Left = 700
    Top = 150
    ParamData = <
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from sales_order_line, sales_order'
      'where sales_order_line.Quote = :Quote'
      'and'
      'Sales_order_line.sales_order = sales_order.sales_order')
    Left = 700
    Top = 210
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryJUpStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Job'
      'set Job_Status = :Job_Status,'
      'Installation_date_Actual = :Installation_Date_Actual'
      'where job = :job')
    Left = 610
    Top = 350
    ParamData = <
      item
        Name = 'Job_Status'
      end
      item
        Name = 'Installation_Date_Actual'
      end
      item
        Name = 'job'
      end>
  end
  object qryGetSO: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Sales_Order_Line.Sales_order,'
      '        Sales_Order.Sales_Order_Status,'
      '        Goods_Value,'
      '        Vat_Value,'
      '        Deposit_Amount'
      'from Sales_order_line, Sales_Order'
      'where Job = :Job and'
      'Sales_Order_Line.sales_Order = Sales_order.Sales_order')
    Left = 700
    Top = 270
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryGetSOLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select count(Sales_order) as total_lines,'
      '(select count(sales_order)'
      ' from sales_order_line SOL, job'
      
        ' where SOL.Sales_Order = :sales_order and Job.job_status = 30 an' +
        'd'
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
      ' SOL.job = job.job) as total_complete'
      'from Sales_order_line'
      'where Sales_order_line.sales_order = :sales_order')
    Left = 700
    Top = 340
    ParamData = <
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order'
      end>
  end
  object qryJRemedial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Job_Remedial.Job,'
      '        Job_Remedial.Additional_Notes,'
      '        Job_Remedial.Completed,'
      '        Job_Remedial.Date_Raised,'
      '        Job_Remedial.Fitter,'
      '        Fitter.Fitter_Name,'
      '        Job_Remedial.Installation_Price,'
      '        Job_Remedial.Installation_Date,'
      '        Job_Remedial.Items_Still_on_Site,'
      '        Job_Remedial.Items_To_Return_To_Site,'
      '        Job_Remedial.Manufacturing_Notes,'
      '        Job_Remedial.Material_Required,'
      '        Job_Remedial.Notes,'
      '        Job_Remedial.Operator,'
      '        Operator.Operator_Name,'
      '        Job_Remedial.Customer,'
      '        Job_Remedial.Original_Fitter,'
      '        Job_Remedial.Original_Templater,'
      '        Job_Remedial.Remedial_Category,'
      '        Job_Remedial.Remedial_Dept,'
      '        Job_Remedial.Remedial_Number,'
      '        Job_Remedial.Remedial_Type,'
      '        Job_Remedial.Site_Requirements,'
      '        Job_Remedial.Production_Required,'
      '        Job_Remedial.Tools_Required'
      'FROM Fitter'
      '        RIGHT JOIN (Operator'
      '        RIGHT JOIN Job_Remedial'
      '          ON Operator.Operator = Job_Remedial.Operator)'
      '          ON Fitter.Fitter = Job_Remedial.Fitter'
      'WHERE Job = :Job and Remedial_Number = :Remedial_Number'
      'ORDER BY Remedial_Number')
    Left = 30
    Top = 560
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end>
  end
  object qryJAddRemedial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'insert into Job_Remedial'
      '(Job,'
      'Remedial_Number,'
      'Notes,'
      'Material_Required,'
      'Fitter,'
      'Installation_Price,'
      'Installation_Date,'
      'Completed,'
      'Date_Raised,'
      'Operator,'
      'Remedial_Type,'
      'Remedial_Dept,'
      'Remedial_Category,'
      'Items_to_Return_To_Site,'
      'Items_Still_On_Site,'
      'Tools_Required,'
      'Site_Requirements,'
      'Additional_Notes,'
      'Manufacturing_Notes,'
      'Production_Required,'
      'Remedial,'
      'Original_Templater,'
      'Original_Fitter,'
      'Customer,'
      'Office_Notes'
      ')'
      'values'
      '(:Job,'
      ':Remedial_Number,'
      ':Notes,'
      ':Material_Required,'
      ':Fitter,'
      ':Installation_Price,'
      ':Installation_Date,'
      ':Completed,'
      ':Date_Raised,'
      ':Operator,'
      ':Remedial_Type,'
      ':Remedial_Dept,'
      ':Remedial_Category,'
      ':Items_to_Return_To_Site,'
      ':Items_Still_On_Site,'
      ':Tools_Required,'
      ':Site_Requirements,'
      ':Additional_Notes,'
      ':Manufacturing_Notes,'
      ':Production_Required,'
      ':Remedial,'
      ':Original_Templater,'
      ':Original_Fitter,'
      ':Customer,'
      ':Office_Notes'
      ')')
    Left = 120
    Top = 560
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end
      item
        Name = 'Notes'
      end
      item
        Name = 'Material_Required'
      end
      item
        Name = 'Fitter'
        DataType = ftInteger
      end
      item
        Name = 'Installation_Price'
      end
      item
        Name = 'Installation_Date'
      end
      item
        Name = 'Completed'
      end
      item
        Name = 'Date_Raised'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Remedial_Type'
        DataType = ftInteger
      end
      item
        Name = 'Remedial_Dept'
        DataType = ftInteger
      end
      item
        Name = 'Remedial_Category'
        DataType = ftInteger
      end
      item
        Name = 'Items_to_Return_To_Site'
      end
      item
        Name = 'Items_Still_On_Site'
      end
      item
        Name = 'Tools_Required'
      end
      item
        Name = 'Site_Requirements'
      end
      item
        Name = 'Additional_Notes'
      end
      item
        Name = 'Manufacturing_Notes'
      end
      item
        Name = 'Production_Required'
      end
      item
        Name = 'Remedial'
      end
      item
        Name = 'Original_Templater'
        DataType = ftInteger
      end
      item
        Name = 'Original_Fitter'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Office_Notes'
        DataType = ftInteger
      end>
  end
  object qryJAllRemedials: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Job_Remedial.Job,'
      '        Job_Remedial.Additional_Notes,'
      '        Job_Remedial.Completed,'
      '        Job_Remedial.Date_Raised,'
      '        Job_Remedial.Fitter,'
      '        Fitter.Fitter_Name,'
      '        Job_Remedial.Installation_Price,'
      '        Job_Remedial.Installation_Date,'
      '        Job_Remedial.Items_Still_on_Site,'
      '        Job_Remedial.Items_To_Return_To_Site,'
      '        Job_Remedial.Manufacturing_Notes,'
      '        Job_Remedial.Material_Required,'
      '        Job_Remedial.Notes,'
      '        Job_Remedial.Operator,'
      '        Operator.Operator_Name,'
      '        Job_Remedial.Original_Fitter,'
      '        Job_Remedial.Original_Templater,'
      '        Job_Remedial.Remedial_Category,'
      '        Job_Remedial.Remedial_Dept,'
      '        Job_Remedial.Remedial_Number,'
      '        Job_Remedial.Remedial_Type,'
      '        Job_Remedial.Production_Required,'
      '        Job_Remedial.Site_Requirements,'
      '        Job_Remedial.Tools_Required,'
      '        Job_Remedial.Remedial,'
      '        Job_Remedial.Office_Notes,'
      '        Sales_Order.Sales_Order,'
      '        Job_Remedial.Customer'
      'FROM (Fitter'
      '        RIGHT JOIN (Operator'
      '        RIGHT JOIN Job_Remedial'
      '          ON Operator.Operator = Job_Remedial.Operator)'
      '          ON Fitter.Fitter = Job_Remedial.Fitter)'
      '        LEFT JOIN Sales_Order'
      '          ON Job_Remedial.Remedial = Sales_Order.Remedial_ID'
      'WHERE Job = :Job'
      'ORDER BY Job_Remedial.Remedial_Number')
    Left = 200
    Top = 560
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryFitter: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * '
      'from Fitter'
      'Order By Fitter_Name')
    Left = 810
    Top = 20
  end
  object dtsFitter: TDataSource
    DataSet = qryFitter
    Left = 860
    Top = 20
  end
  object qryDesigner: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Designer'
      'order by Designer_Name')
    Left = 930
    Top = 20
  end
  object dtsDesigner: TDataSource
    DataSet = qryDesigner
    Left = 1020
    Top = 20
  end
  object dtsBranch: TDataSource
    DataSet = qryBranch
    Left = 1020
    Top = 190
  end
  object qryBranch: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Customer = :Customer'
      'order by Branch_Name')
    Left = 930
    Top = 190
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryReason: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Inactive_Reason'
      'where Inactive_Type = '#39'Q'#39
      'order by Inactive_Reason_Descr')
    Left = 30
    Top = 640
  end
  object dtsReason: TDataSource
    DataSet = qryReason
    Left = 120
    Top = 640
  end
  object qryAddRemedial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'insert into Remedial'
      '('
      'Sales_Order,'
      'Job,'
      'Remedial_Number,'
      'Date_Raised,'
      'Operator,'
      'Remedial_Type,'
      'Remedial_Dept,'
      'Remedial_Category'
      ')'
      'values'
      '('
      ':Sales_Order,'
      ':Job,'
      ':Remedial_Number,'
      ':Date_Raised,'
      ':Operator,'
      ':Remedial_Type,'
      ':Remedial_Dept,'
      ':Remedial_Category'
      ')')
    Left = 350
    Top = 560
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end
      item
        Name = 'Date_Raised'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Remedial_Type'
        DataType = ftInteger
      end
      item
        Name = 'Remedial_Dept'
        DataType = ftInteger
      end
      item
        Name = 'Remedial_Category'
        DataType = ftInteger
      end>
  end
  object qryCheckRemedial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Remedial.ID'
      'FROM Remedial'
      'WHERE Job = :Job and Remedial_Number = :Remedial_Number')
    Left = 270
    Top = 560
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end>
  end
end
