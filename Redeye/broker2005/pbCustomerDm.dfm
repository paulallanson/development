object dtmdlCustomers: TdtmdlCustomers
  Height = 794
  Width = 1095
  object qryCustomers: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'Select  Customer.Customer,'
      '        Customer.Name,'
      '        Customer_Branch.Narrative,'
      '        Customer_Branch.Account_Code,'
      '        Customer_Branch.Fax_Number,'
      '        Customer_Branch.Branch_No,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Building_no_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Phone,'
      '        Customer.Date_Created,'
      '        Customer.Product_Code_Prefix,'
      '        Customer.Customer_Is_Acquired,'
      '        (SELECT top 1 Rep.Name'
      
        #9'FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Re' +
        'p'
      
        #9'WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer) AND ' +
        '((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))) as Rep_N' +
        'ame'
      ' From Customer, Customer_Branch'
      'Where'
      '      ('
      '      (Customer.Name Like :Code_From) or'
      '      (Customer_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      ((Acc_Active = '#39'Y'#39') or (:Active_Only = '#39'N'#39')) and'
      '      (Customer_Branch.Customer = Customer.Customer) AND'
      '      Customer_Branch.Branch_no = 0'
      'Order By Customer.Name ')
    Left = 24
    Top = 8
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Active_Only'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsCustomers: TDataSource
    DataSet = qryCustomers
    Left = 96
    Top = 8
  end
  object CheckCustAccExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer.Name'
      'From Customer, Customer_Branch'
      'Where (Customer.Customer <> :Customer) and'
      '      (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Account_Code = :Acc_Code)')
    Left = 48
    Top = 212
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Acc_Code'
      end>
  end
  object CurrSRC: TDataSource
    DataSet = GetCurrSQL
    Left = 104
    Top = 188
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer(Customer, Name)'
      'SELECT Max(Customer)+1, :GUID FROM Customer'
      ''
      ''
      ' ')
    Left = 216
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer'
      'From Customer'
      'Where Name = :GUID')
    Left = 264
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer(Customer, Name)'
      'SELECT Max(Customer)+1, :GUID FROM Customer'
      ''
      ''
      ' ')
    Left = 336
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object StatusDataSource: TDataSource
    DataSet = GetStatusSQL
    Left = 347
    Top = 157
  end
  object GetStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer_Status,'
      '        Customer_Status_Descr From Customer_Status'
      'Order By Customer_Status'
      ' '
      ' ')
    Left = 288
    Top = 157
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer'
      'Set     Name = :Name,'
      '        Acc_Active = :Acc_Active,'
      '        Credit_Limit = :Credit_Limit,'
      '        Settlement_Days = :Settlement_Days,'
      '        Settlement_Discount = :Settlement_Discount,'
      '        Credit_Status = :Credit_Status,'
      '        Intrastat_Id = :Intrastat_Id,'
      '        Country_Id = :Country_Id,'
      '        VAT_Reference = :VAT_Reference,'
      '        Available_Credit = :Available_Credit,'
      '        Currency_Code_Def = :Currency_Code_Def,'
      '        Customer_Type = :Customer_Type,'
      '        VAT_Code_Def = :VAT_Code_Def,'
      '        Customer_Status = :Customer_Status,'
      '        Online_Ordering = :Online_Ordering,'
      '        Email_Address_Order_Confirm = :Email_Ord,'
      '        Consumer_Code = :Consumer_Code,'
      '        Invoice_upfront = :invoice_upfront,'
      '        Date_Created = :Date_Created,'
      '        Product_Code_Prefix = :Product_Code_Prefix,'
      
        '        Call_Off_Delivery_Note_Type = :Call_Off_Delivery_Note_Ty' +
        'pe,'
      '        Contract_Code = :Contract_Code,'
      '        Transfer_Site_URL = :Transfer_Site_URL,'
      '        Transfer_Protocol_Type = :Transfer_Protocol_Type,'
      '        Client_Account_Code = :Client_Account_Code,'
      '        Connection_Username = :Connection_Username,'
      '        Connection_Password = :Connection_Password,'
      '        e_Invoicing_System = :e_Invoicing_System,'
      
        '        Electronic_Invoice_Required = :Electronic_Invoice_Requir' +
        'ed,'
      '        Use_Kingfield_Ordering = :Use_Kingfield_Ordering,'
      '        Use_Print_Evolved = :Use_Print_Evolved,'
      '        Cost_Centre_Level = :Cost_Centre_Level,'
      '        Use_Discount_Invoice = :Use_Discount_Invoice,'
      '        Payment_Terms = :Payment_Terms,'
      '        Create_Branch_Online = :Create_Branch_Online,'
      '        Customer_Logo_File = :Customer_Logo_File,'
      
        '        Product_Prefix_Not_Required = :Product_Prefix_Not_Requir' +
        'ed,'
      '        Show_Available_Stock = :Show_Available_Stock,'
      '        Analysis_Code_1 = :Analysis_Code_1,'
      '        Analysis_Code_2 = :Analysis_Code_2,'
      '        Analysis_Code_3 = :Analysis_Code_3,'
      '        Analysis_Code_4 = :Analysis_Code_4,'
      '        Pre_pay_Balance = :Pre_Pay_Balance,'
      '        Invoice_location = :invoice_location,'
      '        Direct_Debit_Code = :Direct_Debit_Code,'
      '        Created_By = :Created_By,'
      '        Credit_Score = :Credit_Score,'
      '        Credit_Rating = :Credit_Rating,'
      '        Last_Annual_Return_Date = :Last_Annual_Return_Date,'
      '        Accounts_Lodged_Date = :Accounts_Lodged_Date,'
      
        '        Latest_Filed_Accounts_Date = :Latest_Filed_Accounts_Date' +
        ','
      '        Accounts_Reference_Date = :Accounts_Reference_Date,'
      '        Issued_Capital = :Issued_Capital,'
      '        Company_Type = :Company_Type,'
      '        SIC_Code = :SIC_Code,'
      '        Level_of_Importance = :Level_of_Importance,'
      '        GDPR_Letter_Sent = :GDPR_Letter_Sent,'
      '        GDPR_Letter_Signed = :GDPR_Letter_Signed,'
      '        GDPR_Letter_Signed_Date = :GDPR_Letter_Signed_Date,'
      
        '        GDPR_Letter_Signed_Operator = :GDPR_Letter_Signed_Operat' +
        'or,'
      '        Customer_Is_Acquired = :Customer_Is_Acquired,'
      '        Override_Cost_Markup_Perc = :Override_Cost_Markup_Perc,'
      
        '        Default_Quote_Cost_Markup_Perc = :Default_Quote_Cost_Mar' +
        'kup_Perc,'
      '        CTRLP_Master_Customer = :CTRLP_Master_Customer'
      'Where'
      '(Customer = :Customer) '
      ''
      ' '
      ' '
      ' ')
    Left = 288
    Top = 216
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ACC_ACTIVE'
        ParamType = ptInput
      end
      item
        Name = 'CREDIT_LIMIT'
        ParamType = ptInput
      end
      item
        Name = 'SETTLEMENT_DAYS'
        ParamType = ptInput
      end
      item
        Name = 'SETTLEMENT_DISCOUNT'
        ParamType = ptInput
      end
      item
        Name = 'CREDIT_STATUS'
        ParamType = ptInput
      end
      item
        Name = 'INTRASTAT_ID'
        ParamType = ptInput
      end
      item
        Name = 'COUNTRY_ID'
        ParamType = ptInput
      end
      item
        Name = 'VAT_REFERENCE'
        ParamType = ptInput
      end
      item
        Name = 'AVAILABLE_CREDIT'
        ParamType = ptInput
      end
      item
        Name = 'CURRENCY_CODE_DEF'
        ParamType = ptInput
      end
      item
        Name = 'CUSTOMER_TYPE'
        ParamType = ptInput
      end
      item
        Name = 'VAT_CODE_DEF'
        ParamType = ptInput
      end
      item
        Name = 'CUSTOMER_STATUS'
        ParamType = ptInput
      end
      item
        Name = 'ONLINE_ORDERING'
        ParamType = ptInput
      end
      item
        Name = 'EMAIL_ORD'
        ParamType = ptInput
      end
      item
        Name = 'CONSUMER_CODE'
        ParamType = ptInput
      end
      item
        Name = 'INVOICE_UPFRONT'
        ParamType = ptInput
      end
      item
        Name = 'DATE_CREATED'
        ParamType = ptInput
      end
      item
        Name = 'PRODUCT_CODE_PREFIX'
        ParamType = ptInput
      end
      item
        Name = 'CALL_OFF_DELIVERY_NOTE_TYPE'
        ParamType = ptInput
      end
      item
        Name = 'CONTRACT_CODE'
        ParamType = ptInput
      end
      item
        Name = 'TRANSFER_SITE_URL'
        ParamType = ptInput
      end
      item
        Name = 'TRANSFER_PROTOCOL_TYPE'
        ParamType = ptInput
      end
      item
        Name = 'CLIENT_ACCOUNT_CODE'
        ParamType = ptInput
      end
      item
        Name = 'CONNECTION_USERNAME'
        ParamType = ptInput
      end
      item
        Name = 'CONNECTION_PASSWORD'
        ParamType = ptInput
      end
      item
        Name = 'E_INVOICING_SYSTEM'
        ParamType = ptInput
      end
      item
        Name = 'ELECTRONIC_INVOICE_REQUIRED'
        ParamType = ptInput
      end
      item
        Name = 'USE_KINGFIELD_ORDERING'
        ParamType = ptInput
      end
      item
        Name = 'USE_PRINT_EVOLVED'
        ParamType = ptInput
      end
      item
        Name = 'COST_CENTRE_LEVEL'
        ParamType = ptInput
      end
      item
        Name = 'USE_DISCOUNT_INVOICE'
        ParamType = ptInput
      end
      item
        Name = 'PAYMENT_TERMS'
        ParamType = ptInput
      end
      item
        Name = 'CREATE_BRANCH_ONLINE'
        ParamType = ptInput
      end
      item
        Name = 'CUSTOMER_LOGO_FILE'
        ParamType = ptInput
      end
      item
        Name = 'PRODUCT_PREFIX_NOT_REQUIRED'
        ParamType = ptInput
      end
      item
        Name = 'SHOW_AVAILABLE_STOCK'
        ParamType = ptInput
      end
      item
        Name = 'ANALYSIS_CODE_1'
        ParamType = ptInput
      end
      item
        Name = 'ANALYSIS_CODE_2'
        ParamType = ptInput
      end
      item
        Name = 'ANALYSIS_CODE_3'
        ParamType = ptInput
      end
      item
        Name = 'ANALYSIS_CODE_4'
        ParamType = ptInput
      end
      item
        Name = 'PRE_PAY_BALANCE'
        ParamType = ptInput
      end
      item
        Name = 'INVOICE_LOCATION'
        ParamType = ptInput
      end
      item
        Name = 'DIRECT_DEBIT_CODE'
        ParamType = ptInput
      end
      item
        Name = 'CREATED_BY'
        ParamType = ptInput
      end
      item
        Name = 'CREDIT_SCORE'
        ParamType = ptInput
      end
      item
        Name = 'CREDIT_RATING'
        ParamType = ptInput
      end
      item
        Name = 'LAST_ANNUAL_RETURN_DATE'
        ParamType = ptInput
      end
      item
        Name = 'ACCOUNTS_LODGED_DATE'
        ParamType = ptInput
      end
      item
        Name = 'LATEST_FILED_ACCOUNTS_DATE'
        ParamType = ptInput
      end
      item
        Name = 'ACCOUNTS_REFERENCE_DATE'
        ParamType = ptInput
      end
      item
        Name = 'ISSUED_CAPITAL'
        ParamType = ptInput
      end
      item
        Name = 'COMPANY_TYPE'
        ParamType = ptInput
      end
      item
        Name = 'SIC_CODE'
        ParamType = ptInput
      end
      item
        Name = 'LEVEL_OF_IMPORTANCE'
        ParamType = ptInput
      end
      item
        Name = 'GDPR_LETTER_SENT'
        ParamType = ptInput
      end
      item
        Name = 'GDPR_LETTER_SIGNED'
        ParamType = ptInput
      end
      item
        Name = 'GDPR_LETTER_SIGNED_DATE'
        ParamType = ptInput
      end
      item
        Name = 'GDPR_LETTER_SIGNED_OPERATOR'
        ParamType = ptInput
      end
      item
        Name = 'CUSTOMER_IS_ACQUIRED'
        ParamType = ptInput
      end
      item
        Name = 'OVERRIDE_COST_MARKUP_PERC'
        ParamType = ptInput
      end
      item
        Name = 'DEFAULT_QUOTE_COST_MARKUP_PERC'
        ParamType = ptInput
      end
      item
        Name = 'CTRLP_MASTER_CUSTOMER'
        ParamType = ptInput
      end
      item
        Name = 'CUSTOMER'
        ParamType = ptInput
      end>
  end
  object GetCurrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Currency_Code, Currency_Code_Descr'
      'from Currency_Code'
      'Order By Currency_Code_Descr')
    Left = 422
    Top = 158
  end
  object GetTypesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer_Type, Description From Customer_Type'
      'Order By Description')
    Left = 440
    Top = 232
  end
  object GetVATSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Vat_Code'
      'Order By Vat_Code')
    Left = 320
    Top = 380
  end
  object GetCustNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer'
      'Where Customer = :Customer')
    Left = 400
    Top = 420
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetCountrySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Country_Id, Country_Id_Descr'
      'from Country_Id'
      'Order By Country_Id_Descr')
    Left = 184
    Top = 308
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Customer'
      'Where'
      '(Customer = :Customer)')
    Left = 48
    Top = 304
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Company')
    Left = 256
    Top = 308
  end
  object IntrastatSRC: TDataSource
    DataSet = GetIntrastatSQL
    Left = 312
    Top = 452
  end
  object GetBranchNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer_Branch'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)')
    Left = 424
    Top = 364
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object TypesSRC: TDataSource
    DataSet = GetTypesSQL
    Left = 352
    Top = 328
  end
  object GetCrdStatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Credit_Status, Credit_Status_Descr'
      'From Credit_Status'
      'Order By Credit_Status_Descr')
    Left = 120
    Top = 320
  end
  object CountrySRC: TDataSource
    DataSet = GetCountrySQL
    Left = 40
    Top = 364
  end
  object DelBranchSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Customer_Branch'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = 0)')
    Left = 224
    Top = 408
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object CheckSuppAccExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier.Name'
      'From Supplier, Supplier_Branch'
      'Where (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Account_Code = :Acc_Code)')
    Left = 120
    Top = 364
    ParamData = <
      item
        Name = 'Acc_Code'
        DataType = ftString
      end>
  end
  object UpdBranchSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Branch'
      'Set'
      '        Building_No_Name  = :Building_No_Name,'
      '        Street = :Street,'
      '        Locale = :Locale,'
      '        PostCode = :PostCode,'
      '        Town = :Town,'
      '        Phone = :Phone,'
      '        County = :County,'
      '        Fax_Number = :Fax_Number,'
      '        EMail = :EMail,'
      '        Narrative = :Narrative,'
      '        Account_Code = :Account_Code,'
      '        Inv_To_Customer = :Inv_To_Customer,'
      '        Inv_To_Branch = :Inv_To_Branch,'
      '        Delivery_Narrative = :Delivery_Narrative,'
      '        Account_Code_on_Ledger = :Account_Code_on_Ledger,'
      '        Inv_To_Contact = :Inv_to_Contact'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = 0)')
    Left = 312
    Top = 512
    ParamData = <
      item
        Name = 'Building_No_Name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'PostCode'
      end
      item
        Name = 'Town'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'County'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Inv_To_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Inv_To_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code_on_Ledger'
      end
      item
        Name = 'Inv_to_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end>
  end
  object VATSRC: TDataSource
    DataSet = GetVATSQL
    Left = 296
    Top = 260
  end
  object AddBranchSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Branch'
      '        (Customer,'
      '        Branch_No,'
      '        Name,'
      '        Building_No_Name,'
      '        Street,'
      '        Locale,'
      '        PostCode,'
      '        Town,'
      '        Phone,'
      '        County,'
      '        Fax_Number,'
      '        EMail,'
      '        Narrative,'
      '        Account_Code,'
      '        Inv_To_Customer,'
      '        Inv_To_Branch,'
      '        Account_Code_On_Ledger,'
      '        Delivery_Narrative,'
      '        Inv_To_Contact)'
      'Values'
      '        (:Customer,'
      '        0,'
      '        :Name,'
      '        :Building_No_Name,'
      '        :Street,'
      '        :Locale,'
      '        :PostCode,'
      '        :Town,'
      '        :Phone,'
      '        :County,'
      '        :Fax_Number,'
      '        :EMail,'
      '        :Narrative,'
      '        :Account_Code,'
      '        :Inv_To_Customer,'
      '        :Inv_To_Branch,'
      '        :Account_Code_on_Ledger,'
      '        :Delivery_Narrative,'
      '        :Inv_To_Contact)'
      ''
      '')
    Left = 168
    Top = 208
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Building_No_Name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'PostCode'
      end
      item
        Name = 'Town'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'County'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Inv_To_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Inv_To_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code_on_Ledger'
      end
      item
        Name = 'Delivery_Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Inv_To_Contact'
        DataType = ftInteger
      end>
  end
  object UpdNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Branch'
      'Set     Narrative = :Narrative'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = 0)'
      ' ')
    Left = 184
    Top = 248
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end>
  end
  object UpdDelivNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Branch'
      'Set     Delivery_Narrative = :Delivery_Narrative'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = 0)'
      ' '
      ' ')
    Left = 48
    Top = 256
    ParamData = <
      item
        Name = 'Delivery_Narrative'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetIntrastatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Intrastat_Id, Intrastat_Id_Descr'
      'from Intrastat_Id'
      'Order By Intrastat_Id')
    Left = 345
    Top = 276
  end
  object CrdStatSRC: TDataSource
    DataSet = GetCrdStatSQL
    Left = 424
    Top = 236
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer.Customer,'
      '        Customer.Name,'
      '        Customer.Acc_Active,'
      '        Customer.Credit_Limit,'
      '        Customer.Settlement_Days,'
      '        Customer.Settlement_Discount,'
      '        Customer.Payment_Terms,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Credit_Status,'
      '        Customer_Branch.Inv_To_Customer,'
      '        Customer_Branch.Inv_To_Branch,'
      '        Customer.Customer_Type,'
      '        Customer_Branch.Branch_No,'
      '        Customer_Branch.Building_No_Name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.PostCode,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.County,'
      '        Customer_Branch.Phone,'
      '        Customer_Branch.Fax_Number,'
      '        Customer_Branch.EMail,'
      '        Customer_Branch.Narrative,'
      '        Customer.Intrastat_Id,'
      '        Customer.Available_Credit,'
      '        Customer_Branch.Account_Code_On_Ledger,'
      '        Customer.Country_Id,'
      '        Customer.VAT_Reference,'
      '        Customer.Currency_Code_Def,'
      '        Customer_Branch.Delivery_Narrative,'
      '        Customer.VAT_Code_Def,'
      '        Customer.Customer_Status,'
      '        Customer.Online_Ordering,'
      '        Customer.Email_Address_Order_Confirm,'
      '        Customer.Consumer_Code,'
      '        Customer.Contract_Code,'
      '        Customer.Invoice_upfront,'
      '        Customer.Date_Created,'
      '        customer.Product_Code_Prefix,'
      '        Customer.Call_Off_Delivery_Note_Type,'
      '        Customer.Transfer_Site_URL,'
      '        Customer.Transfer_Protocol_Type,'
      '        Customer.Client_Account_Code,'
      '        Customer.Connection_Username,'
      '        Customer.Connection_Password,'
      '        Customer.e_Invoicing_System,'
      '        Customer.Electronic_invoice_required,'
      '        Customer.Use_Kingfield_Ordering,'
      '        Customer.Use_Print_Evolved,'
      '        Customer.Cost_Centre_Level,'
      '        Customer.Use_Discount_Invoice,'
      '        Customer.Create_Branch_Online,'
      '        Customer.Customer_Logo_File,'
      '        Customer.Product_Prefix_Not_Required,'
      '        Customer.Show_Available_Stock,'
      '        Customer.Analysis_Code_1,'
      '        Customer.Analysis_Code_2,'
      '        Customer.Analysis_Code_3,'
      '        Customer.Analysis_Code_4,'
      '        Customer.Pre_Pay_Balance,'
      '        Customer.Invoice_Location,'
      '        Customer.Direct_Debit_Code,'
      '        Customer.Credit_Score,'
      '        Customer.Credit_Rating,'
      '        Customer.Last_Credit_Check_Date,'
      '        Customer.Incorporation_Date,'
      '        Customer.Last_Annual_Return_Date,'
      '        Customer.Accounts_Lodged_Date,'
      '        Customer.Latest_Filed_Accounts_Date,'
      '        Customer.Accounts_Reference_Date,'
      '        Customer.Issued_Capital,'
      '        Customer.Company_Type,'
      '        Customer.SIC_Code,'
      '        Customer.Level_of_Importance,'
      '        Customer.GDPR_Letter_Sent,'
      '        Customer.GDPR_Letter_Signed,'
      '        Customer.GDPR_Letter_Signed_Date,'
      '        Customer.GDPR_Letter_Signed_Operator,'
      '        Customer.Default_Quote_Cost_Markup_Perc,'
      '        Customer.Override_Cost_Markup_Perc,'
      '        Customer.Customer_Is_Acquired,'
      '        Customer.CTRLP_Master_Customer, '
      
        '        (select SIC_Code.SIC_Code_ID + '#39' - '#39' + SIC_Code.SIC_Code' +
        '_Description'
      '         from SIC_Code'
      
        '         where SIC_Code.SIC_Code = Customer.SIC_Code) as SIC_Cod' +
        'e_Description,'
      '        Customer_Branch.Inv_To_Contact,'
      '        Customer.Created_By,'
      '        (select Operator.Name'
      '         from Operator'
      
        '         where Operator.Operator = Customer.Created_By) as Opera' +
        'tor_Name'
      'From Customer, Customer_Branch'
      'Where (Customer.Customer = :Customer) and'
      '      (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Branch_No = 0)'
      'Order By Customer.Name')
    Left = 32
    Top = 184
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryCustProdPrefix: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_Code_Prefix as '#39'Prefix'#39','
      'name as '#39'Customer'#39
      'from customer'
      'where Product_Code_Prefix  like :Product_Code_Prefix'
      'order by Product_Code_Prefix'
      ' ')
    Left = 394
    Top = 12
    ParamData = <
      item
        Name = 'Product_Code_Prefix'
      end>
  end
  object dtsrcCustProdPrefix: TDataSource
    DataSet = qryCustProdPrefix
    Left = 442
    Top = 12
  end
  object qryCustomersBase: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer.Customer,'
      '        Customer.Name,'
      '        Customer.Cost_Centre_Level,'
      '        Customer_Branch.Narrative,'
      '        Customer_Branch.Account_Code,'
      '        Customer_Branch.Fax_Number,'
      '        Customer_Branch.Branch_No,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Building_no_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.County,'
      '        Customer_Branch.Phone,'
      '        Customer.Customer_Is_Acquired,'
      '        Customer.Date_Created,'
      '        Customer.Acc_Active,'
      '        Customer.Product_Code_Prefix,'
      '        Customer.Credit_Rating,'
      '        Customer.Customer_Status,'
      
        '        Customer_Status.Customer_Status_Descr as Customer_Status' +
        '_Description,'
      '        Customer.Customer_Type,'
      '        Customer_Type.Description as Customer_Type_Description,'
      '        Customer_Type.Color as Customer_Type_Color,'
      '        Customer_Type.Font_Color as Customer_Type_Font_Color,'
      '        (SELECT Invoice_Location_Descr'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Description,'
      '        (SELECT Color'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Color,'
      '        (SELECT Font_Color'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Font_Color,'
      '        (SELECT Payment_Terms_Description'
      '         FROM Payment_Terms'
      
        '         WHERE Payment_Terms.Payment_Terms = Customer.Payment_Te' +
        'rms) as Payment_Terms_Description,'
      '        (SELECT top 1 Rep.Rep'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer' +
        ') AND ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
      '        ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep,'
      '        (SELECT top 1 Rep.Name'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer' +
        ') AND ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
      '        ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep_Name,'
      '        (SELECT TOP 1 Rep.Name'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE ((Reps_Branches.Customer = Customer_Branch.Customer' +
        ') AND (Reps_Branches.Branch_no = Customer_Branch.Branch_no)) AND'
      #9#9#9#9'(Reps_Branches.Rep <> (SELECT top 1 Rep.Rep'
      
        '                                FROM Rep INNER JOIN Reps_Branche' +
        's ON Rep.Rep = Reps_Branches.Rep'
      
        #9'                              WHERE ((Reps_Branches.Customer = ' +
        'Customer_Branch.Customer) AND (Reps_Branches.Branch_no = Custome' +
        'r_Branch.Branch_no))'
      
        '                                ORDER BY Reps_Branches.Is_Main_R' +
        'ep DESC))) as Sub_Rep_Name,'
      '        (SELECT top 1 Operator.Name'
      
        #9'      FROM Operator INNER JOIN Customer_Operator ON Operator.Op' +
        'erator = Customer_Operator.Operator'
      
        #9'      WHERE Customer_Operator.Customer = Customer_Branch.Custom' +
        'er'
      
        '        ORDER BY Customer_Operator.Is_main_Operator DESC) as Acc' +
        'ount_Manager_Name,'
      '        (SELECT top 1 Sales_invoice.Invoice_Date'
      #9'        FROM Sales_Invoice'
      
        #9'        WHERE (((Sales_invoice.Customer)=Customer_Branch.Custom' +
        'er) AND ((Sales_invoice.Branch_no)=Customer_Branch.Branch_no)) a' +
        'nd'
      '            (Sales_invoice.Goods_Value > 0)'
      
        #9#9'      ORDER BY Sales_Invoice.Sales_Invoice desc) as Last_Sales' +
        '_Invoice,'
      '        Customer.Credit_Limit,'
      '        Customer.Credit_Score,'
      '        (SELECT Credit_Rating_Description'
      '         FROM Credit_Rating'
      
        '         WHERE Credit_Rating.Credit_Rating = Customer.Credit_Rat' +
        'ing) as Credit_Rating_Description,'
      '        (SELECT SIC_Code_Description'
      '         FROM SIC_Code'
      
        '         WHERE SIC_Code.SIC_Code = Customer.SIC_Code) as SIC_Cod' +
        'e_Description,'
      '         Analysis_Code_1,'
      '         Analysis_Code_2,'
      '         Analysis_Code_3,'
      '         Analysis_Code_4,'
      '        (SELECT Importance_Description'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Description,'
      '        (SELECT Color'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Color,'
      '        (SELECT Font_Color'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Font_Color'
      'From Customer, Customer_Branch, Customer_Type, Customer_Status'
      'Where'
      '      ('
      '      (Customer.Name Like :Code_From) or'
      '      (Customer_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      (Customer_Branch.Customer = Customer.Customer) AND'
      '      (Customer_Branch.Branch_no = 0) AND'
      '      (Customer_Type.Customer_Type = Customer.Customer_type) AND'
      
        '      (Customer_Status.Customer_Status = Customer.Customer_Statu' +
        's) AND'
      '      ((Customer.Customer_Status = 100)'
      '')
    Left = 160
    Top = 8
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end>
  end
  object qryCustomerLU: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select customer.name'
      'from customer'
      'order by name')
    Left = 496
    Top = 304
  end
  object dtsCustomerLU: TDataSource
    DataSet = qryCustomerLU
    Left = 576
    Top = 304
  end
  object UpdprefixSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update customer'
      'set product_Code_prefix = :product_Code_prefix'
      'where customer = :customer')
    Left = 544
    Top = 120
    ParamData = <
      item
        Name = 'product_Code_prefix'
      end
      item
        Name = 'customer'
      end>
  end
  object qryGetTechCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer.Customer as "tg:code",'
      '        Customer.Name as "tg:company_name",'
      '        Customer_Branch.Name as "tg:address_code",'
      '        Customer_Branch.Building_No_Name as "tg:address_line_1",'
      '        Customer_Branch.Street as "tg:address_line_2",'
      '        Customer_Branch.Locale as "tg:address_line_3",'
      '        Customer_Branch.Town as "tg:town",'
      '        Customer_Branch.PostCode as "tg:postcode",'
      '        '#39'Avon'#39' as "tg:county",'
      '        '#39'GB'#39' as "tg:country_code",'
      '        Customer_Branch.Phone as "tg:telephone",'
      '        Customer_Branch.Fax_Number as "tg:fax",'
      '        '#39' '#39' as "tg:website",'
      '        Customer_Branch.EMail as "tg:email"'
      'From Customer, Customer_Branch'
      'Where (Customer.Customer = :Customer) and'
      '      (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Branch_No = 0)'
      'Order By Customer.Name')
    Left = 552
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryGetTechContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select top 1'
      '        Customer_Contact.email as "tg:code",'
      '        Customer_Contact.Salutation as "tg:salutation",'
      '        Customer_Contact.Name as "tg:firstname",'
      '        Customer_Contact.Name as "tg:surname",'
      '        Contact_Type.Description as "tg:title",'
      '        Customer_Contact.Phone as "tg:telephone",'
      '        Customer_Contact.Fax_Number as "tg:fax",'
      '        Customer_Contact.mobile_no as "tg:mobile",'
      '        Customer_Contact.EMail as "tg:email"'
      'From Customer_Contact, Contact_Type'
      'Where (Customer_Contact.Customer = :Customer) and'
      '      (Customer_Contact.Branch_No = 0) and'
      
        '      (Customer_Contact.Contact_Type = Contact_Type.Contact_type' +
        ')')
    Left = 552
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryEInvoicing: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from e_invoicing_System'
      'order by e_Invoicing_System_Name')
    Left = 32
    Top = 416
  end
  object dtsEInvoicing: TDataSource
    DataSet = qryEInvoicing
    Left = 112
    Top = 416
  end
  object qryUpdProductStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set Not_In_Use = :Not_In_Use'
      'where Customer = :Customer')
    Left = 544
    Top = 184
    ParamData = <
      item
        Name = 'Not_In_Use'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryGetEInvoicing: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from e_Invoicing_System'
      'where e_invoicing_system = :e_invoicing_system')
    Left = 208
    Top = 496
    ParamData = <
      item
        Name = 'e_invoicing_system'
      end>
  end
  object qryDocuments: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Document'
      'where customer = :Customer'
      'order by Date_Created')
    Left = 496
    Top = 368
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsDocuments: TDataSource
    DataSet = qryDocuments
    Left = 584
    Top = 368
  end
  object qryAddDocument: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Customer_Document'
      '(Customer,'
      'Document_No,'
      'Document,'
      'Document_Title,'
      'Date_Created'
      ')'
      'Values'
      '(:Customer,'
      ':Document_No,'
      ':Document,'
      ':Document_Title,'
      ':Date_Created'
      ')')
    Left = 496
    Top = 424
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Document_No'
      end
      item
        Name = 'Document'
      end
      item
        Name = 'Document_Title'
      end
      item
        Name = 'Date_Created'
      end>
  end
  object qryGetLastDoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(document_no) as Last_Document'
      'from Customer_Document'
      'where Customer = :Customer')
    Left = 584
    Top = 424
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryDelDocument: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Customer_Document'
      'where customer = :customer and Document_no = :Document_no')
    Left = 496
    Top = 472
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'Document_no'
      end>
  end
  object qryUpdDocument: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Document'
      'set Document = :Document, Document_Title = :Document_Title'
      'where Customer = :Customer and Document_no = :Document_no')
    Left = 584
    Top = 472
    ParamData = <
      item
        Name = 'Document'
      end
      item
        Name = 'Document_Title'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Document_no'
      end>
  end
  object qryTerms: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Payment_terms'
      'order by Payment_Terms_Description')
    Left = 312
    Top = 568
  end
  object dtsTerms: TDataSource
    DataSet = qryTerms
    Left = 368
    Top = 568
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Invoice_location')
    Left = 32
    Top = 456
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 112
    Top = 456
  end
  object qryGetTerms: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Payment_terms'
      'where Payment_Terms = :Payment_Terms')
    Left = 312
    Top = 624
    ParamData = <
      item
        Name = 'Payment_Terms'
      end>
  end
  object GetContactNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name, Email from Customer_Contact'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      '(Contact_no = :Contact_no)')
    Left = 544
    Top = 240
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object dtsProspects: TDataSource
    DataSet = qryProspects
    Left = 96
    Top = 67
  end
  object qryProspectBase: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer.Customer,'
      '        Customer.Name,'
      '        Customer.Cost_Centre_Level,'
      '        Customer_Branch.Narrative,'
      '        Customer_Branch.Account_Code,'
      '        Customer_Branch.Fax_Number,'
      '        Customer_Branch.Branch_No,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Building_no_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.County,'
      '        Customer_Branch.Phone,'
      '        Customer.Date_Created,'
      '        Customer.Acc_Active,'
      '        Customer.Product_Code_Prefix,'
      '        Customer.Credit_Rating,'
      '        Customer.Customer_Status,'
      '        Customer.Customer_Is_Acquired,'
      
        '        Customer_Status.Customer_Status_Descr as Customer_Status' +
        '_Description,'
      '        Customer.Customer_Type,'
      '        Customer_Type.Description as Customer_Type_Description,'
      '        Customer_Type.Color as Customer_Type_Color,'
      '        Customer_Type.Font_Color as Customer_Type_Font_Color,'
      '        (SELECT Invoice_Location_Descr'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Description,'
      '        (SELECT Color'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Color,'
      '        (SELECT Font_Color'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Font_Color,'
      '        (SELECT Payment_Terms_Description'
      '         FROM Payment_Terms'
      
        '         WHERE Payment_Terms.Payment_Terms = Customer.Payment_Te' +
        'rms) as Payment_Terms_Description,'
      '        (SELECT Operator.Name'
      '         FROM Operator'
      
        '         WHERE Operator.Operator = Customer.Created_by) as Creat' +
        'ed_by_Name,'
      '        (SELECT top 1 Rep.Rep'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer' +
        ') AND ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
      '        ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep,'
      '        (SELECT top 1 Rep.Name'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer' +
        ') AND ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
      '        ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep_Name,'
      '        (SELECT TOP 1 Rep.Name'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE ((Reps_Branches.Customer = Customer_Branch.Customer' +
        ') AND (Reps_Branches.Branch_no = Customer_Branch.Branch_no)) AND'
      #9#9#9#9'(Reps_Branches.Rep <> (SELECT top 1 Rep.Rep'
      
        '                                FROM Rep INNER JOIN Reps_Branche' +
        's ON Rep.Rep = Reps_Branches.Rep'
      
        #9'                              WHERE ((Reps_Branches.Customer = ' +
        'Customer_Branch.Customer) AND (Reps_Branches.Branch_no = Custome' +
        'r_Branch.Branch_no))'
      
        '                                ORDER BY Reps_Branches.Is_Main_R' +
        'ep DESC))) as Sub_Rep_Name,'
      '        (SELECT top 1 Operator.Name'
      
        #9'      FROM Operator INNER JOIN Customer_Operator ON Operator.Op' +
        'erator = Customer_Operator.Operator'
      
        #9'      WHERE Customer_Operator.Customer = Customer_Branch.Custom' +
        'er'
      
        '        ORDER BY Customer_Operator.Is_main_Operator DESC) as Acc' +
        'ount_Manager_Name,'
      '        Customer.Credit_Limit,'
      '        Customer.Credit_Score,'
      '        (SELECT Credit_Rating_Description'
      '         FROM Credit_Rating'
      
        '         WHERE Credit_Rating.Credit_Rating = Customer.Credit_Rat' +
        'ing) as Credit_Rating_Description,'
      '        (SELECT SIC_Code_Description'
      '         FROM SIC_Code'
      
        '         WHERE SIC_Code.SIC_Code = Customer.SIC_Code) as SIC_Cod' +
        'e_Description,'
      '         Analysis_Code_1,'
      '         Analysis_Code_2,'
      '         Analysis_Code_3,'
      '         Analysis_Code_4,'
      '        (SELECT Importance_Description'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Description,'
      '        (SELECT Color'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Color,'
      '        (SELECT Font_Color'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Font_Color'
      'From Customer, Customer_Branch, Customer_Type, Customer_status'
      'Where'
      '      ('
      '      (Customer.Name Like :Code_From) or'
      '      (Customer_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      (Customer_Branch.Customer = Customer.Customer) AND'
      '      (Customer_Branch.Branch_no = 0) AND'
      '      (Customer_Type.Customer_Type = Customer.Customer_type) AND'
      
        '      (Customer_Status.Customer_Status = Customer.Customer_Statu' +
        's) AND'
      
        '      ((Customer.Customer_Status > 1) and (Customer.Customer_Sta' +
        'tus < 100))'
      '')
    Left = 160
    Top = 67
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end>
  end
  object qryProspects: TFDQuery
    ConnectionName = 'PB'
    Left = 24
    Top = 67
  end
  object qryUpdMulti: TFDQuery
    ConnectionName = 'PB'
    Left = 496
    Top = 528
  end
  object qryUpdMultiBranch: TFDQuery
    ConnectionName = 'PB'
    Left = 584
    Top = 528
  end
  object qryGetOneCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '    Customer.Customer,'
      '    Customer.Name,'
      '    Customer_Branch.Town,'
      '    Customer_Branch.County,'
      '    Customer.Settlement_Discount,'
      '    Customer.Settlement_Days,'
      '    Customer.Credit_Limit,'
      '    Customer.Acc_Active,'
      '    Customer.Invoice_Upfront,'
      '    Customer.Credit_Status,'
      '    Credit_Status.Credit_Status_Descr,'
      '    Customer.Customer_Type,'
      '    Customer_Type.Description as Customer_Type_description,'
      '    Customer.Intrastat_Id,'
      '    Intrastat_Id.Intrastat_Id_Descr,'
      '    Customer.Customer_Status,'
      '    Customer_Status.Customer_Status_Descr,'
      '    Customer.Available_Credit,'
      '    Customer.VAT_Code_Def,'
      '    Vat_Code.Vat_Rate,'
      '    Vat_Code.Description as Vat_Description,'
      '    Customer.Online_Ordering,'
      '    Customer.Email_address_Order_Confirm,'
      '    Customer.Payment_Terms,'
      '    Payment_Terms.Payment_Terms_Description,'
      '    Customer.Invoice_Location,'
      '    Invoice_Location.Invoice_Location_Descr,'
      '    Analysis_Code_1,'
      '    Analysis_Code_2,'
      '    Analysis_Code_3,'
      '    Analysis_Code_4,'
      '    Customer.Level_of_Importance,'
      '    (SELECT Importance_Description'
      '         FROM Level_of_importance'
      
        '     WHERE Level_of_importance.Level_of_importance = Customer.Le' +
        'vel_of_importance) as Importance_Description,'
      '    (select TOP 1 Rep.Name'
      '     from Reps_Branches, Rep'
      '     where ((Reps_Branches.Customer = Customer.Customer) and'
      '           (Reps_Branches.Branch_no = 0)) and'
      '           (Reps_Branches.Rep = Rep.Rep)) as Rep_Name,'
      '     (SELECT TOP 1 Rep.Name'
      
        #9'    FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branche' +
        's.Rep'
      
        #9'    WHERE ((Reps_Branches.Customer = Customer.Customer) AND (Re' +
        'ps_Branches.Branch_no = 0)) AND'
      #9#9' (Reps_Branches.Rep <> (SELECT top 1 Rep.Rep'
      
        '                              FROM Rep INNER JOIN Reps_Branches ' +
        'ON Rep.Rep = Reps_Branches.Rep'
      
        #9'                            WHERE ((Reps_Branches.Customer = Cu' +
        'stomer.Customer) AND (Reps_Branches.Branch_no = 0))))) as Sub_Re' +
        'p_Name,'
      '     (SELECT top 1 Operator.Name'
      
        #9'    FROM Operator INNER JOIN Customer_Operator ON Operator.Oper' +
        'ator = Customer_Operator.Operator'
      #9'    WHERE Customer_Operator.Customer = Customer.Customer'
      
        '      ORDER BY Customer_Operator.Is_main_Operator DESC) as Accou' +
        'nt_Manager_Name'
      'FROM Payment_Terms'
      '        RIGHT JOIN (Vat_Code'
      '        RIGHT JOIN (Credit_Status'
      '        RIGHT JOIN (Intrastat_Id'
      '        RIGHT JOIN (Invoice_Location'
      '        RIGHT JOIN (Customer_Type'
      '        RIGHT JOIN (Customer_Status'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN Customer_Branch'
      '          ON Customer.Customer = Customer_Branch.Customer)'
      
        '          ON Customer_Status.Customer_Status = Customer.Customer' +
        '_Status)'
      
        '          ON Customer_Type.Customer_Type = Customer.Customer_Typ' +
        'e)'
      
        '          ON Invoice_Location.Invoice_Location = Customer.Invoic' +
        'e_Location)'
      '          ON Intrastat_Id.Intrastat_Id = Customer.Intrastat_Id)'
      
        '          ON Credit_Status.Credit_Status = Customer.Credit_Statu' +
        's)'
      '          ON Vat_Code.Vat_Code = Customer.VAT_Code_Def)'
      
        '          ON Payment_Terms.Payment_Terms = Customer.Payment_Term' +
        's'
      'WHERE (Customer.Customer = :Customer) and'
      '      (Customer_Branch.Branch_No = 0)'
      'Order By Customer.Name')
    Left = 648
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryReps: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Rep, Name as Rep_Name'
      'from Rep'
      'Where ((Inactive = '#39'N'#39') or (inactive is NULL))'
      'Order BY Name')
    Left = 32
    Top = 504
  end
  object dtsReps: TDataSource
    DataSet = qryReps
    Left = 112
    Top = 504
  end
  object qryDelRepBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Reps_Branches'
      'WHERE Customer = :Customer AND'
      'Branch_No = :Branch_no')
    Left = 32
    Top = 552
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryAddRepBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'INSERT INTO Reps_Branches(Customer, Branch_no, Rep, Percentage, ' +
        'Is_Main_Rep)'
      'VALUES (:Customer, :Branch_no, :Rep, 100, :Is_Main_Rep)')
    Left = 112
    Top = 552
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Is_Main_Rep'
        DataType = ftString
      end>
  end
  object qryCompanyTypes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company_Type, Company_Type_Description'
      'from Company_Type'
      'Order by Company_Type_Description')
    Left = 496
    Top = 592
  end
  object dtsCompanyTypes: TDataSource
    DataSet = qryCompanyTypes
    Left = 584
    Top = 592
  end
  object qryGetAccCodes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Account_Code, Customer.Name as Customer_Name'
      'From Customer_Branch, Customer'
      'Where Customer_Branch.Customer = Customer.Customer AND'
      
        'Customer_Branch.Account_Code LIKE :Account_Code and :Account_Cod' +
        'e <> '#39'%'#39' and'
      'Customer_Branch.Customer <> :Customer'
      '')
    Left = 312
    Top = 680
    ParamData = <
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Customer'
      end>
  end
  object dtsGetAccCodes: TDataSource
    DataSet = qryGetAccCodes
    Left = 376
    Top = 680
  end
  object qryGetImportance: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Level_of_Importance, Importance_Description'
      'from Level_of_Importance'
      'Order By Importance_Description'
      '')
    Left = 656
    Top = 12
  end
  object dtsGetImportance: TDataSource
    DataSet = qryGetImportance
    Left = 744
    Top = 12
  end
  object qryCustomerBranches: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Customer_branch'
      'where Customer = :Customer and'
      '('
      '      (Customer_Branch.Name Like :Name) or'
      '      (Customer_Branch.Account_Code Like :Name) or'
      '      (Customer_Branch.Short_Code Like :Name)'
      ') and'
      
        '((Inactive = '#39'N'#39') or (Inactive is NULL) or (Inactive = :Inactive' +
        '))'
      'order by Customer_Branch.Name')
    Left = 656
    Top = 184
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'name'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end>
  end
  object dtsCustomerBranches: TDataSource
    DataSet = qryCustomerBranches
    Left = 776
    Top = 184
  end
  object qryContacts: TFDQuery
    MasterSource = dtsCustomerBranches
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Contact_no,'
      '        Customer_Contact.Name,'
      '        Customer_Contact.Contact_Type,'
      '        Contact_Type.Description as Contact_type_Description,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Contact_Level,'
      '        Contact_Level.Description as Contact_Level_Description,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Contact.Contact_Status,'
      '        Customer_Contact.inactive,'
      
        '        Contact_Status.Contact_Status_Descr as Contact_Status_De' +
        'scription,'
      '        Customer_Contact.Def_Markup_perc'
      'FROM Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN (Contact_Type'
      '      INNER JOIN Customer_Contact'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) and'
      '      (Customer_Contact.Name Like :Name) AND'
      
        '      ((Customer_Contact.Inactive = '#39'N'#39') or (Customer_Contact.In' +
        'active is NULL)'
      '      or (Customer_Contact.Inactive = :Inactive))'
      'ORDER BY Name')
    Left = 660
    Top = 248
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Inactive'
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qryContacts
    Left = 780
    Top = 248
  end
  object qryAddContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type,'
      '        Email,'
      '        Phone,'
      '        Narrative,'
      '        Mobile_no,'
      '        Salutation,'
      '        Contact_Level,'
      '        Fax_Number,'
      '        Receive_Mail,'
      '        ExportFilter,'
      '        Contact_Status,'
      '        Def_markup_Perc,'
      '        inactive,'
      '        Contact_info,'
      '        Title,'
      '        First_Name,'
      '        Surname)'
      'Select'#9':Customer,'
      #9#9'    :Branch_No,'
      #9#9'    (SELECT ISNULL(Max(Customer_Contact.Contact_No),0)+1'
      #9#9'      FROM Customer_Contact'
      
        #9#9'      WHERE (Customer_Contact.Customer = :Customer) AND (Custo' +
        'mer_Contact.Branch_no = :Branch_No)),'
      #9#9'    CC.Name,'
      '        CC.Contact_Type,'
      '        CC.Email,'
      '        CC.Phone,'
      '        CC.Narrative,'
      '        CC.Mobile_no,'
      '        CC.Salutation,'
      '        CC.Contact_Level,'
      '        CC.Fax_Number,'
      '        CC.Receive_Mail,'
      '        CC.ExportFilter,'
      '        CC.Contact_Status,'
      '        CC.Def_markup_Perc,'
      '        '#39'N'#39','
      '        CC.Contact_info,'
      '        CC.Title,'
      '        CC.First_Name,'
      '        CC.Surname'
      'FROM Customer_Contact CC, Customer_Contact'
      
        'WHERE (CC.Customer = :OldCustomer and CC.Branch_No = :OldBranch ' +
        'and CC.Contact_no = :OldContact)'
      'GROUP BY '#9#9
      #9#9'CC.Name, '
      '        CC.Contact_Type,'
      '        CC.Email,'
      '        CC.Phone,'
      '        CC.Narrative,'
      '        CC.Mobile_no,'
      '        CC.Salutation,'
      '        CC.Contact_Level,'
      '        CC.Fax_Number,'
      '        CC.Receive_Mail,'
      '        CC.ExportFilter,'
      '        CC.Contact_Status,'
      '        CC.Def_markup_Perc,'
      '        CC.Contact_info,'
      '        CC.Title,'
      '        CC.First_Name,'
      '        CC.Surname'
      '')
    Left = 776
    Top = 480
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'OldCustomer'
      end
      item
        Name = 'OldBranch'
      end
      item
        Name = 'OldContact'
      end>
  end
  object qryCheckName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Contact_no'
      'FROM Customer_Contact'
      
        'WHERE Customer = :Customer AND Branch_no = :Branch_no AND Name =' +
        ' :Name')
    Left = 776
    Top = 424
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Name'
      end>
  end
  object qrySetCContactActive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'set inactive = '#39'N'#39
      'where'
      'Customer = :Customer and '
      'Branch_no = :Branch_no and '
      'Contact_no = :Contact_no')
    Left = 776
    Top = 312
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
  object qrySetCContactInactive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'set inactive = '#39'Y'#39
      'where'
      'Customer = :Customer and '
      'Branch_no = :Branch_no and '
      'Contact_no = :Contact_no')
    Left = 776
    Top = 368
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
  object qryAddCustomerCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Customer_Category'
      '(Customer,'
      ' Category,'
      ' Category_Used,'
      ' Narrative'
      ')'
      'Values'
      '(:Customer,'
      ' :Category,'
      ' :Category_Used,'
      ' :Narrative'
      ')')
    Left = 872
    Top = 24
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Category_Used'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end>
  end
  object qryCustomerCategories: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Category.Category,'
      '        Category.Description as Category_Description,'
      #9#9'(SELECT Customer'
      #9#9' FROM Customer_Category'
      #9#9' WHERE'#9'Customer_Category.Customer = :Customer AND'
      #9#9#9#9'Customer_Category.Category = Category.Category) as Customer,'
      #9#9'(SELECT We_Supply_This_Category'
      #9#9' FROM Customer_Category'
      #9#9' WHERE'#9'Customer_Category.Customer = :Customer AND'
      
        #9#9#9#9'Customer_Category.Category = Category.Category) as  We_Suppl' +
        'y_This_Category,'
      #9#9'(SELECT Category_Used'
      #9#9' FROM Customer_Category'
      #9#9' WHERE'#9'Customer_Category.Customer = :Customer AND'
      
        #9#9#9#9'Customer_Category.Category = Category.Category) as  Category' +
        '_Used,'
      #9#9'(SELECT Narrative'
      #9#9' FROM Customer_Category'
      #9#9' WHERE'#9'Customer_Category.Customer = :Customer AND'
      
        #9#9#9#9'Customer_Category.Category = Category.Category) as  Narrativ' +
        'e'
      'FROM Category'
      'ORDER BY Category.Description')
    Left = 872
    Top = 80
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
        Name = 'Customer'
      end>
  end
  object dtsCustomerCategories: TDataSource
    DataSet = qryCustomerCategories
    Left = 872
    Top = 144
  end
  object qryDelCustomerCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Customer_Category'
      'WHERE Customer = :Customer AND Category = :Category')
    Left = 976
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Category'
      end>
  end
  object qryUpCustomerCatSupply: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Customer_Category'
      'Set We_Supply_This_Category = :We_Supply_This_Category'
      'WHERE Customer = :Customer AND Category = :Category')
    Left = 976
    Top = 80
    ParamData = <
      item
        Name = 'We_Supply_This_Category'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Category'
      end>
  end
  object qryUpCustomerCatNotes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Customer_Category'
      'Set Narrative = :Narrative'
      'WHERE Customer = :Customer AND Category = :Category')
    Left = 976
    Top = 136
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Category'
      end>
  end
  object qryGetCContactDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer, Branch_no, Contact_no, enquiry as Order_no'
      'from Enquiry'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      'UNION'
      
        'select Customer, Branch_no, Contact_no, Purchase_order as Order_' +
        'no'
      'from Purchase_OrderLine'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      'UNION'
      'select Customer, Branch_no, Contact_no, Job_bag as Order_no'
      'from Job_Bag'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      'UNION'
      'select Customer, Branch_no, Contact_no, Sales_order as Order_no'
      'from Sales_Order'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      '')
    Left = 976
    Top = 208
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
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
  object qryGetCustomerOrders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer, Contact_no as Order_no'
      'from Customer_Contact'
      'where'
      'Customer = :Customer'
      'UNION'
      'select Customer, Activity as Order_no'
      'from Activity'
      'where'
      'Customer = :Customer'
      'UNION'
      'select Customer, enquiry as Order_no'
      'from Enquiry'
      'where'
      'Customer = :Customer'
      'UNION'
      'select Customer, Purchase_order as Order_no'
      'from Purchase_OrderLine'
      'where'
      'Customer = :Customer'
      'UNION'
      'select Customer, Job_bag as Order_no'
      'from Job_Bag'
      'where'
      'Customer = :Customer'
      'UNION'
      'select Customer, Sales_order as Order_no'
      'from Sales_Order'
      'where'
      'Customer = :Customer'
      '')
    Left = 976
    Top = 272
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
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end>
  end
  object qrySetCustomerInactive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer'
      'set acc_active = '#39'N'#39
      'where'
      'Customer = :Customer')
    Left = 976
    Top = 344
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryHOContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Contact_no,'
      '        Customer_Contact.Name,'
      '        Customer_Contact.Contact_Type,'
      '        Contact_Type.Description as Contact_type_Description,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Contact_Level,'
      '        Contact_Level.Description as Contact_Level_Description,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Contact.Contact_Status,'
      '        Customer_Contact.inactive,'
      
        '        Contact_Status.Contact_Status_Descr as Contact_Status_De' +
        'scription,'
      '        Customer_Contact.Def_Markup_perc'
      'FROM Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN (Contact_Type'
      '      INNER JOIN Customer_Contact'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status'
      'WHERE ((Customer = :Customer) and (Branch_no = 0)) and'
      '      (Customer_Contact.Name Like :Name) AND'
      
        '      ((Customer_Contact.Inactive = '#39'N'#39') or (Customer_Contact.In' +
        'active is NULL)'
      '      or (Customer_Contact.Inactive = :Inactive))'
      'ORDER BY Name')
    Left = 692
    Top = 536
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Inactive'
      end>
  end
  object dtsHOContacts: TDataSource
    DataSet = qryHOContacts
    Left = 772
    Top = 536
  end
  object qryGetContactCats: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT  Customer_Contact_Category.*, Category.Category, Category' +
        '.Description'
      'FROM  Customer_Contact_Category, Category'
      'WHERE'
      '(Customer_Contact_Category.Category = Category.Category) AND'
      '('
      '(Customer_Contact_Category.Customer = :Customer) AND'
      '(Customer_Contact_Category.Branch_no = :Branch_no) AND'
      '(Customer_Contact_Category.Contact_no = :Contact_no)'
      ')'
      'ORDER BY Category.Description')
    Left = 696
    Top = 592
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
  object dtsContactCats: TDataSource
    DataSet = qryGetContactCats
    Left = 772
    Top = 592
  end
  object qryUpCustomerCatUsed: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Customer_Category'
      'SET Category_Used = :Category_Used'
      'WHERE Customer = :Customer AND Category = :Category')
    Left = 872
    Top = 208
    ParamData = <
      item
        Name = 'Category_Used'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Category'
      end>
  end
  object qryOperators: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Operator, Name as Operator_Name'
      'from Operator'
      'Where ((Operator_Can_Login = '#39'Y'#39'))'
      'Order BY Name')
    Left = 32
    Top = 648
  end
  object dtsOperators: TDataSource
    DataSet = qryOperators
    Left = 112
    Top = 648
  end
  object qryDelAccManager: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Customer_Operator'
      'WHERE Customer = :Customer')
    Left = 24
    Top = 696
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryAddAccManager: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'INSERT INTO Customer_Operator(Customer, Operator, Is_Main_Operat' +
        'or)'
      'VALUES (:Customer, :Operator, '#39'Y'#39')')
    Left = 112
    Top = 696
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryDelSecondRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Reps_Branches'
      
        'WHERE ((Reps_Branches.Customer = :Customer) AND (Reps_Branches.B' +
        'ranch_no = :Branch_No)) AND'
      
        #9'    ((Reps_Branches.Is_Main_Rep <> '#39'Y'#39') or (Reps_Branches.Is_Ma' +
        'in_Rep is NULL)) AND'
      #9#9'  (Reps_Branches.Rep <> (SELECT top 1 Rep.Rep'
      
        '                              FROM Rep INNER JOIN Reps_Branches ' +
        'ON Rep.Rep = Reps_Branches.Rep'
      
        #9'                            WHERE ((Reps_Branches.Customer = :C' +
        'ustomer) AND (Reps_Branches.Branch_no = :Branch_no))))'
      '')
    Left = 32
    Top = 600
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryEndUsers: TFDQuery
    ConnectionName = 'PB'
    Left = 24
    Top = 131
  end
  object dtsEndUsers: TDataSource
    DataSet = qryEndUsers
    Left = 96
    Top = 131
  end
  object qryEndUserBase: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer.Customer,'
      '        Customer.Name,'
      '        Customer.Cost_Centre_Level,'
      '        Customer_Branch.Narrative,'
      '        Customer_Branch.Account_Code,'
      '        Customer_Branch.Fax_Number,'
      '        Customer_Branch.Branch_No,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Building_no_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.County,'
      '        Customer_Branch.Phone,'
      '        Customer.Date_Created,'
      '        Customer.Acc_Active,'
      '        Customer.Product_Code_Prefix,'
      '        Customer.Credit_Rating,'
      '        Customer.Customer_Status,'
      '        Customer.Customer_Is_Acquired,'
      
        '        Customer_Status.Customer_Status_Descr as Customer_Status' +
        '_Description,'
      '        Customer.Customer_Type,'
      '        Customer_Type.Description as Customer_Type_Description,'
      '        Customer_Type.Color as Customer_Type_Color,'
      '        Customer_Type.Font_Color as Customer_Type_Font_Color,'
      '        (SELECT Invoice_Location_Descr'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Description,'
      '        (SELECT Color'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Color,'
      '        (SELECT Font_Color'
      '         FROM Invoice_Location'
      
        '         WHERE Invoice_Location.Invoice_Location = Customer.Invo' +
        'ice_Location) as Invoice_Location_Font_Color,'
      '        (SELECT Payment_Terms_Description'
      '         FROM Payment_Terms'
      
        '         WHERE Payment_Terms.Payment_Terms = Customer.Payment_Te' +
        'rms) as Payment_Terms_Description,'
      '        (SELECT Operator.Name'
      '         FROM Operator'
      
        '         WHERE Operator.Operator = Customer.Created_by) as Creat' +
        'ed_by_Name,'
      '        (SELECT top 1 Rep.Rep'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer' +
        ') AND ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
      '        ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep,'
      '        (SELECT top 1 Rep.Name'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer' +
        ') AND ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
      '        ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep_Name,'
      '        (SELECT TOP 1 Rep.Name'
      
        #9'      FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branc' +
        'hes.Rep'
      
        #9'      WHERE ((Reps_Branches.Customer = Customer_Branch.Customer' +
        ') AND (Reps_Branches.Branch_no = Customer_Branch.Branch_no)) AND'
      #9#9#9#9'(Reps_Branches.Rep <> (SELECT top 1 Rep.Rep'
      
        '                                FROM Rep INNER JOIN Reps_Branche' +
        's ON Rep.Rep = Reps_Branches.Rep'
      
        #9'                              WHERE ((Reps_Branches.Customer = ' +
        'Customer_Branch.Customer) AND (Reps_Branches.Branch_no = Custome' +
        'r_Branch.Branch_no))'
      
        '                                ORDER BY Reps_Branches.Is_Main_R' +
        'ep DESC))) as Sub_Rep_Name,'
      '        (SELECT top 1 Operator.Name'
      
        #9'      FROM Operator INNER JOIN Customer_Operator ON Operator.Op' +
        'erator = Customer_Operator.Operator'
      
        #9'      WHERE Customer_Operator.Customer = Customer_Branch.Custom' +
        'er'
      
        '        ORDER BY Customer_Operator.Is_main_Operator DESC) as Acc' +
        'ount_Manager_Name,'
      '        Customer.Credit_Limit,'
      '        Customer.Credit_Score,'
      '        (SELECT Credit_Rating_Description'
      '         FROM Credit_Rating'
      
        '         WHERE Credit_Rating.Credit_Rating = Customer.Credit_Rat' +
        'ing) as Credit_Rating_Description,'
      '        (SELECT SIC_Code_Description'
      '         FROM SIC_Code'
      
        '         WHERE SIC_Code.SIC_Code = Customer.SIC_Code) as SIC_Cod' +
        'e_Description,'
      '         Analysis_Code_1,'
      '         Analysis_Code_2,'
      '         Analysis_Code_3,'
      '         Analysis_Code_4,'
      '        (SELECT Importance_Description'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Description,'
      '        (SELECT Color'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Color,'
      '        (SELECT Font_Color'
      '         FROM Level_of_importance'
      
        '         WHERE Level_of_importance.Level_of_importance = Custome' +
        'r.Level_of_importance) as Importance_Font_Color'
      'From Customer, Customer_Branch, Customer_Type, Customer_status'
      'Where'
      '      ('
      '      (Customer.Name Like :Code_From) or'
      '      (Customer_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      (Customer_Branch.Customer = Customer.Customer) AND'
      '      (Customer_Branch.Branch_no = 0) AND'
      '      (Customer_Type.Customer_Type = Customer.Customer_type) AND'
      
        '      (Customer_Status.Customer_Status = Customer.Customer_Statu' +
        's) AND'
      '      ((Customer.Customer_Status = 200))'
      '')
    Left = 160
    Top = 131
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end>
  end
end
