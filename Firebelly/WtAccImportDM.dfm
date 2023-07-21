object dmAccImport: TdmAccImport
  Height = 663
  Width = 904
  object AddBranchSQL: TFDQuery
    ConnectionName = 'wt'
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
      '        Fax_Number,'
      '        EMail,'
      '        Narrative,'
      '        Account_Code,'
      '        Inv_To_Customer,'
      '        Inv_To_Branch,'
      '        Short_Code,'
      '        Account_Code_On_Ledger)'
      'Values'
      '        (:Customer,'
      '        :Branch_no,'
      '        :Name,'
      '        :Building_No_Name,'
      '        :Street,'
      '        :Locale,'
      '        :PostCode,'
      '        :Town,'
      '        :Phone,'
      '        :Fax_Number,'
      '        :EMail,'
      '        :Narrative,'
      '        :Account_Code,'
      '        :Inv_To_Customer,'
      '        :Inv_To_Branch,'
      '        :Short_Code,'
      '        '#39'Y'#39')'
      ''
      '')
    Left = 24
    Top = 80
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
        Name = 'Short_Code'
      end>
  end
  object AddCustSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Customer'
      
        #9#9#9'(Customer, Customer_Name, Credit_Limit, Not_Active, Credit_St' +
        'atus,'
      
        '        Customer_Type, Vat, Date_Created, Street, Locale, Town_C' +
        'ity, Postcode,'
      
        '        Telephone_Number, Fax_Number, Email_Address, Account_Cod' +
        'e,'
      
        '        Is_Retail_Customer, County_State, Use_Online_Ordering, D' +
        'iscount_Rate,'
      
        '        Deposit_Terms, No_of_Employees, Web_Address, Data_Source' +
        ', Prospect, Rep)'
      
        'values'#9'(:Customer, :Customer_Name, :Credit_Limit, :Not_Active, :' +
        'Credit_Status,'
      
        '        :Customer_Type, :Vat, :Date_Created, :Street, :Locale, :' +
        'Town_City, :Postcode,'
      
        '        :Telephone_Number, :Fax_Number, :Email_Address, :Account' +
        '_code,'
      
        '        :Is_Retail_Customer, :County_State, :Use_Online_Ordering' +
        ', :Discount_Rate,'
      
        '        :Deposit_Terms, :No_of_Employees, :Web_Address, :Data_So' +
        'urce, :Prospect, :Rep)'
      '')
    Left = 96
    Top = 80
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Credit_Limit'
      end
      item
        Name = 'Not_Active'
      end
      item
        Name = 'Credit_Status'
      end
      item
        Name = 'Customer_Type'
      end
      item
        Name = 'Vat'
      end
      item
        Name = 'Date_Created'
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
        Name = 'Telephone_Number'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'Email_Address'
      end
      item
        Name = 'Account_code'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'County_State'
      end
      item
        Name = 'Use_Online_Ordering'
      end
      item
        Name = 'Discount_Rate'
      end
      item
        Name = 'Deposit_Terms'
      end
      item
        Name = 'No_of_Employees'
      end
      item
        Name = 'Web_Address'
      end
      item
        Name = 'Data_Source'
      end
      item
        Name = 'Prospect'
      end
      item
        Name = 'Rep'
      end>
  end
  object GetBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Account_Code = :Account_Code and'
      'Branch_no = 0')
    Left = 160
    Top = 80
    ParamData = <
      item
        Name = 'Account_Code'
        DataType = ftString
      end>
  end
  object UpCustSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer'
      'Set     Acc_Active = :Acc_Active,'
      '        Credit_Limit = :Credit_Limit,'
      '        VAT_Reference = :VAT_Reference'
      'Where'
      '(Customer = :Customer) '
      '')
    Left = 232
    Top = 80
    ParamData = <
      item
        Name = 'Acc_Active'
      end
      item
        Name = 'Credit_Limit'
      end
      item
        Name = 'VAT_Reference'
        DataType = ftString
      end
      item
        Name = 'Customer'
      end>
  end
  object UpBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer_Branch'
      'Set'
      '        Phone = :Phone,'
      '        Account_Code_on_Ledger = :Account_Code_on_Ledger'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = 0)')
    Left = 296
    Top = 80
    ParamData = <
      item
        Name = 'Phone'
      end
      item
        Name = 'Account_Code_on_Ledger'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetNextBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Branch_no) as Last_Branch'
      'from Customer_Branch'
      'where Customer = :Customer')
    Left = 320
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetNextCustSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(customer) as Last_Customer'
      'from Customer')
    Left = 256
    Top = 136
  end
  object GetNextContactSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(contact_no) as Last_Contact'
      'from Customer_Contact'
      'where Customer = :Customer')
    Left = 160
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object AddRepSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert Into Reps_Branches'
      '        (Customer,'
      '        Branch_No,'
      '        Rep,'
      '        Percentage)'
      'Values'
      '        (:Customer,'
      '        :Branch_No,'
      '        :Rep,'
      '        :Percentage)'
      '')
    Left = 96
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Percentage'
      end>
  end
  object AddContactSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer,'
      '        Contact_No,'
      '        Contact_Name,'
      '        Telephone_number,'
      '        Fax_number,'
      '        EMail_Address,'
      '        Mobile_number,'
      '        Contact_Type,'
      '        Title,'
      '        Forename)'
      'Values'
      '        (:Customer,'
      '        :Contact_No,'
      '        :Contact_Name,'
      '        :Telephone_number,'
      '        :Fax_number,'
      '        :EMail_address,'
      '        :Mobile_Number,'
      '        :Contact_Type,'
      '        :Title,'
      '        :Forename)'
      '')
    Left = 24
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Contact_Name'
      end
      item
        Name = 'Telephone_number'
      end
      item
        Name = 'Fax_number'
      end
      item
        Name = 'EMail_address'
      end
      item
        Name = 'Mobile_Number'
      end
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Title'
      end
      item
        Name = 'Forename'
      end>
  end
  object AddSuppSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert Into Supplier'
      '        (Supplier,'
      '        Name,'
      '        Acc_Active,'
      '        Discount,'
      '        Intrastat_Id,'
      '        Currency_Code_def,'
      '        VAT_Reference,'
      '        Country_id,'
      '        Vat_Code_Def)'
      'Values'
      '        (:Supplier,'
      '        :Name,'
      '        :Acc_Active,'
      '        :Discount,'
      '        :Intrastat_Id,'
      '        :Currency_Code,'
      '        :VAT_Reference,'
      '        :Country_id,'
      '        :Vat_Code_Def)'
      ''
      '')
    Left = 24
    Top = 192
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Acc_Active'
      end
      item
        Name = 'Discount'
      end
      item
        Name = 'Intrastat_Id'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'VAT_Reference'
      end
      item
        Name = 'Country_id'
        DataType = ftInteger
      end
      item
        Name = 'Vat_Code_Def'
      end>
  end
  object GetNextSuppSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Supplier) as Last_Supplier'
      'from Supplier')
    Left = 96
    Top = 192
  end
  object AddSuppBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert Into Supplier_Branch'
      '        (Supplier,'
      '        Branch_No,'
      '        Name,'
      '        Building_No_Name,'
      '        Street,'
      '        Locale,'
      '        PostCode,'
      '        Town,'
      '        Phone,'
      '        Fax_Number,'
      '        EMail,'
      '        Narrative,'
      '        Account_Code,'
      '        Account_Code_On_Ledger)'
      'Values'
      '        (:Supplier,'
      '        0,'
      '        :Name,'
      '        :Building_No_Name,'
      '        :Street,'
      '        :Locale,'
      '        :PostCode,'
      '        :Town,'
      '        :Phone,'
      '        :Fax_Number,'
      '        :EMail,'
      '        :Narrative,'
      '        :Account_Code,'
      '        '#39'Y'#39')'
      '')
    Left = 160
    Top = 192
    ParamData = <
      item
        Name = 'Supplier'
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
      end>
  end
  object UpSuppSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Supplier'
      'Set     Acc_Active = :Acc_Active'
      'Where'
      '(Supplier = :Supplier) '
      '')
    Left = 240
    Top = 192
    ParamData = <
      item
        Name = 'Acc_Active'
      end
      item
        Name = 'Supplier'
      end>
  end
  object UpSuppBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Supplier_Branch'
      'Set'
      '        Phone = :Phone,'
      '        Account_Code_on_Ledger = :Account_Code_on_Ledger'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = 0)')
    Left = 320
    Top = 192
    ParamData = <
      item
        Name = 'Phone'
      end
      item
        Name = 'Account_Code_on_Ledger'
      end
      item
        Name = 'Supplier'
      end>
  end
  object GetLastNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Max(Narrative) as Last_Code'
      'From Narrative_Line'
      '')
    Left = 312
    Top = 240
  end
  object GetCustBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer, Branch_no,  Account_Code, Narrative'
      'from Customer_Branch'
      'where Customer = :Customer')
    Left = 240
    Top = 240
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object AddSuppContSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert Into Supplier_BranchContacts'
      '        (Supplier,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type,'
      '        Phone,'
      '        EMail,'
      #9#9#9'Salutation)'
      'Values'
      '        (:Supplier,'
      '        :Branch_No,'
      '        :Contact_No,'
      '        :Name,'
      '        :Contact_Type,'
      '        :Phone,'
      '        :Email,'
      '        :Salutation)')
    Left = 168
    Top = 240
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Salutation'
      end>
  end
  object GetNextSuppContactSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(contact_no) as Last_Contact'
      'from Supplier_BranchContacts'
      'where Supplier = :Supplier and'
      #9#9#9'Branch_no = :Branch_no'
      '')
    Left = 104
    Top = 240
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object GetSuppBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Supplier_Branch'
      'where Account_Code = :Account_Code')
    Left = 24
    Top = 240
    ParamData = <
      item
        Name = 'Account_Code'
        DataType = ftString
      end>
  end
  object AddNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert into Narrative_Line'
      
        '(Narrative, Narrative_Line, Narrative_Text, Narrative_Line_Updat' +
        'ed)'
      'Values'
      '(:Narrative, :Narrative_Line, :Narrative_Text, '#39'Y'#39')'
      '')
    Left = 24
    Top = 288
    ParamData = <
      item
        Name = 'Narrative'
      end
      item
        Name = 'Narrative_Line'
      end
      item
        Name = 'Narrative_Text'
        DataType = ftString
      end>
  end
  object UpBranchNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Customer_Branch'
      'set Narrative = :Narrative'
      'where '#9'Customer = :Customer and'
      #9#9#9'Branch_no = :Branch_no')
    Left = 112
    Top = 288
    ParamData = <
      item
        Name = 'Narrative'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object GetSageCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from'
      'SALES_LEDGER')
    Left = 408
    Top = 80
  end
  object Sage50Database: TFDConnection
    ConnectionName = 'dbSage50'
    Left = 408
    Top = 32
  end
  object CustExistSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer.Customer, Customer.Customer_Name'
      'from Customer'
      'where '
      
        '((Account_Code = :Account_Code) or (Customer.Customer_name = :Cu' +
        'stomer_Name))'
      '')
    Left = 24
    Top = 336
    ParamData = <
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Customer_Name'
      end>
  end
  object GetNextRepSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Max(rep) as Last_Record'
      'from Rep')
    Left = 240
    Top = 288
  end
  object AddNewRepSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'insert into Rep (Rep, Name, Building_no_name, Street, Locale, To' +
        'wn, PostCode, phone)'
      'values (:Rep,:Name,'#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39')')
    Left = 312
    Top = 288
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Name'
      end>
  end
  object CheckRepSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Rep'
      'where Name like :Name')
    Left = 312
    Top = 336
    ParamData = <
      item
        Name = 'Name'
      end>
  end
  object AddCurrencySQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Currency_Code (Currency_Code, Currency_Code_Descr)'
      'values (:Currency_Code, :Currency_Code_Descr)')
    Left = 240
    Top = 336
    ParamData = <
      item
        Name = 'Currency_Code'
      end
      item
        Name = 'Currency_Code_Descr'
      end>
  end
  object GetSageSupplier: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from PURCHASE_LEDGER')
    Left = 408
    Top = 128
  end
  object SuppExistSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Supplier_Branch.Name'
      'from Supplier_Branch'
      'where Account_Code = :Account_Code')
    Left = 112
    Top = 336
    ParamData = <
      item
        Name = 'Account_Code'
      end>
  end
  object UpCreditLimitSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Customer'
      
        'set Credit_Limit = :Credit_Limit, Available_Credit = :Available_' +
        'Credit'
      'where Customer = :Customer')
    Left = 408
    Top = 336
    ParamData = <
      item
        Name = 'Credit_Limit'
      end
      item
        Name = 'Available_Credit'
      end
      item
        Name = 'Customer'
      end>
  end
  object UpCompanyImpSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set Data_Import_Directory = :Data_Import_Directory'
      'where company = 1')
    Left = 408
    Top = 192
    ParamData = <
      item
        Name = 'Data_Import_Directory'
      end>
  end
  object GetSagePayments: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Audit_header.tran_number,'
      'Audit_header.type,'
      'Audit_usage.split_number,'
      'Audit_usage.amount,'
      'AuditH.inv_ref,'
      'Audit_Header.Date_Entered,'
      'AuditH.Paid_Flag,'
      'AuditH.Paid_Status'
      'from Audit_header, Audit_usage, Audit_header AuditH'
      'where Audit_header.type = '#39'SR'#39' and'
      '(Audit_header.date_entered >= :Date_Entered) and'
      '(Audit_header.tran_number = Audit_usage.split_crossref) and'
      '(Audit_usage.split_number = AuditH.tran_number)'
      ' '
      ' ')
    Left = 408
    Top = 248
    ParamData = <
      item
        Name = 'Date_Entered'
      end>
  end
  object UpPaymentSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Paid_Status = :Paid_Status,'
      '      Paid_Amount = Paid_Amount + :Paid_Amount,'
      '      Paid_Date = :Paid_Date'
      'where Sales_Invoice_no = :Sales_Invoice_no'
      ' ')
    Left = 408
    Top = 296
    ParamData = <
      item
        Name = 'Paid_Status'
      end
      item
        Name = 'Paid_Amount'
      end
      item
        Name = 'Paid_Date'
      end
      item
        Name = 'Sales_Invoice_no'
      end>
  end
  object GetCompanySQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Company'
      'where company = 1')
    Left = 296
    Top = 32
  end
  object UpCompanyPayDateSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set Last_Payment_Update = :Last_Payment_Update'
      'where company = 1')
    Left = 496
    Top = 208
    ParamData = <
      item
        Name = 'Last_Payment_Update'
      end>
  end
  object UpAuditHSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Sage_Audit_Header'
      
        'values (:Tran_Number, :Type, :Inv_Ref, :Date_Entered, :Paid_Flag' +
        ', :Paid_Status)')
    Left = 24
    Top = 16
    ParamData = <
      item
        Name = 'Tran_Number'
      end
      item
        Name = 'Type'
      end
      item
        Name = 'Inv_Ref'
      end
      item
        Name = 'Date_Entered'
      end
      item
        Name = 'Paid_Flag'
      end
      item
        Name = 'Paid_Status'
      end>
  end
  object GetSageAuditH: TFDQuery
    ConnectionName = 'wt'
    Left = 96
    Top = 16
  end
  object GetSageAuditU: TFDQuery
    ConnectionName = 'wt'
    Left = 160
    Top = 16
  end
  object UPAuditUSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Sage_Audit_Usage'
      'values (:type,'
      '        :usage_Number,'
      '        :split_number,'
      '        :split_crossref,'
      '        :reference,'
      '        :details,'
      '        :user_name,'
      '        :date,'
      '        :amount,'
      '        :deleted_flag) ')
    Left = 232
    Top = 16
    ParamData = <
      item
        Name = 'type'
      end
      item
        Name = 'usage_Number'
      end
      item
        Name = 'split_number'
      end
      item
        Name = 'split_crossref'
      end
      item
        Name = 'reference'
      end
      item
        Name = 'details'
      end
      item
        Name = 'user_name'
      end
      item
        Name = 'date'
      end
      item
        Name = 'amount'
      end
      item
        Name = 'deleted_flag'
      end>
  end
  object DelSageAuditH: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Sage_Audit_Header')
    Left = 352
    Top = 16
  end
  object MaximiserDB: TFDConnection
    ConnectionName = 'dbMaximiser'
    Left = 496
    Top = 8
  end
  object GetMaxContacts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  CLIENT.Client_Id,'
      '        CLIENT.Contact_Number,'
      '        CLIENT.Name,'
      '        CLIENT.Phone_1,'
      '        CLIENT.Phone_1_Extension,'
      '        CLIENT.Phone_2,'
      '        CLIENT.Phone_2_Extension,'
      '        CLIENT.Phone_3,'
      '        CLIENT.Phone_3_Extension,'
      '        CLIENT.First_Name,'
      '        CLIENT.Initial,'
      '        CLIENT.Title,'
      '        CLIENT.Salutation,'
      '        CLIENT.Address_Line_1 as Address_1,'
      '        CLIENT.Address_Line_2 as Address_2,'
      '        CLIENT.City as Address_3,'
      '        CLIENT.State_Province as Address_4,'
      '        CLIENT.Country,'
      '        CLIENT.Zip_Code as Address_5,'
      '        CLIENT.Record_type'
      'FROM CLIENT'
      'ORDER BY CLIENT.Client_Id, CLIENT.Record_type')
    Left = 496
    Top = 56
  end
  object GetMaxEmail: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select U_e_mail_address.U_e_mail_address as E_Mail'
      'from U_e_mail_address'
      'where Client_id = :Client_id and'
      'Contact_Number = :Contact_Number')
    Left = 496
    Top = 104
    ParamData = <
      item
        Name = 'Client_id'
      end
      item
        Name = 'Contact_Number'
      end>
  end
  object GetMaxWebsite: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select U_web_site.U_web_site as Web_address'
      'from U_web_site'
      'where Client_id = :Client_id and'
      'Contact_Number = :Contact_Number')
    Left = 496
    Top = 152
    ParamData = <
      item
        Name = 'Client_id'
      end
      item
        Name = 'Contact_Number'
      end>
  end
  object CustNameExistSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer.Customer, Customer.Name'
      'from Customer'
      'where Name = :Name')
    Left = 497
    Top = 251
    ParamData = <
      item
        Name = 'Name'
      end>
  end
  object CheckContactSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select TOP 1 Contact_no, Contact_Name'
      'from Customer_contact'
      'where Contact_Name = :Name and'
      'Customer = :Customer')
    Left = 496
    Top = 296
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Customer'
      end>
  end
  object QuickbooksDB: TFDConnection
    ConnectionName = 'dbQuickbooks'
    Left = 600
    Top = 8
  end
  object DelRepSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Delete from Reps_Branches'
      'where Customer = :Customer')
    Left = 600
    Top = 56
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetRepSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Rep'
      'from Rep'
      'where Name = :Name or Rep_Suffix_or_Prefix = :Name')
    Left = 600
    Top = 104
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Name'
      end>
  end
  object GetCustBrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Customer = :Customer'
      'ORDER BY Branch_no')
    Left = 600
    Top = 152
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object AddContactinfoSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert Into Contact_Info'
      '  (Contact_Info,'
      '   Contact_Name,'
      '   Account_Number,'
      '   Account_Month,'
      '   Account_Year,'
      '   Pays_Online)'
      
        'Select isnull(Max(Contact_Info)+1,1), :Contact_Name, :Account_Nu' +
        'mber, :Account_Month, :Account_Year, :Pays_Online'
      'From Contact_info'
      '')
    Left = 600
    Top = 200
    ParamData = <
      item
        Name = 'Contact_Name'
      end
      item
        Name = 'Account_Number'
      end
      item
        Name = 'Account_Month'
      end
      item
        Name = 'Account_Year'
      end
      item
        Name = 'Pays_Online'
      end>
  end
  object CheckBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select top 1 *'
      'from Customer_Branch'
      'Where Customer = :Customer and Short_Code = :Short_Code')
    Left = 600
    Top = 256
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Short_Code'
      end>
  end
  object UpdBranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer_Branch'
      'set     Name = :Name,'
      '        Building_No_Name = :Building_No_Name,'
      '        Street = :Street,'
      '        Locale = :Locale,'
      '        PostCode = :Postcode,'
      '        Town = :Town,'
      '        Phone = :Phone,'
      '        Fax_Number = :Fax_Number,'
      '        EMail = :Email,'
      '        Narrative = :Narrative,'
      '        Account_Code = :Account_Code,'
      '        Inv_To_Customer = :Inv_To_Customer,'
      '        Inv_To_Branch = :Inv_To_Branch,'
      '        Short_Code = :Short_Code,'
      '        Account_Code_On_Ledger = '#39'Y'#39
      'Where Customer = :Customer and Branch_no = :Branch_No')
    Left = 688
    Top = 16
    ParamData = <
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
        Name = 'Short_Code'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object UpdContactSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer_Contact'
      'set    Contact_Name = :Contact_Name,'
      '        Telephone_number = :Telephone_number,'
      '        EMail_Address = :Email_address,'
      '        Fax_Number = :Fax_Number,'
      '        Mobile_Number = :Mobile_Number,'
      '        Contact_Type = :Contact_Type,'
      '        Title = :Title,'
      '        Forename = :Forename'
      'WHERE Customer = :Customer and Contact_no = :Contact_No'
      '')
    Left = 688
    Top = 64
    ParamData = <
      item
        Name = 'Contact_Name'
      end
      item
        Name = 'Telephone_number'
      end
      item
        Name = 'Email_address'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'Mobile_Number'
      end
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Title'
      end
      item
        Name = 'Forename'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object UpdContactInfoSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer_Contact'
      
        'set     Contact_info = (select max(Contact_info) from Contact_in' +
        'fo)'
      
        'WHERE Customer = :Customer and Branch_no = :Branch_No and Contac' +
        't_no = :Contact_No'
      '')
    Left = 688
    Top = 112
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qryGetLastCustType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Customer_Type) as Last_Code'
      'from Customer_Type')
    Left = 688
    Top = 168
  end
  object qryGetCustType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Type'
      'where Description = :Description')
    Left = 688
    Top = 216
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryAddCustType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Customer_Type'
      'values (:Customer_Type, :Description, '#39'N'#39', '#39#39')')
    Left = 688
    Top = 272
    ParamData = <
      item
        Name = 'Customer_Type'
      end
      item
        Name = 'Description'
      end>
  end
  object qryGetLastContType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Contact_Type) as Last_Code'
      'from Contact_Type')
    Left = 792
    Top = 168
  end
  object qryGetContType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Contact_Type'
      'where Contact_Type_Description = :Contact_Type_Description')
    Left = 792
    Top = 216
    ParamData = <
      item
        Name = 'Contact_Type_Description'
      end>
  end
  object qryAddContType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Contact_Type'
      'values (:Contact_Type, :Contact_Type_Description)')
    Left = 792
    Top = 272
    ParamData = <
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Contact_Type_Description'
      end>
  end
  object qryCheckMaterial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Material_Type'
      'FROM Material_Type'
      'WHERE Description = :Description')
    Left = 24
    Top = 384
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryGetNextMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Material_Type) as Last_Material'
      'from Material_Type')
    Left = 112
    Top = 384
  end
  object qryAddMaterialType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Material_Type (Material_Type, Description, Inactive)'
      'values (:Material_Type, :Description, '#39'N'#39')')
    Left = 208
    Top = 384
    ParamData = <
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Description'
      end>
  end
  object qryCheckWTGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Worktop_Group'
      'FROM Worktop_Group'
      'WHERE Worktop_Group_Description = :Worktop_Group_Description and'
      'Material_Type = :Material_Type')
    Left = 24
    Top = 432
    ParamData = <
      item
        Name = 'Worktop_Group_Description'
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryGetNextWTGroup: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Worktop_Group) as Last_Group'
      'from Worktop_Group')
    Left = 112
    Top = 432
  end
  object qryAddWTGroup: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'insert into Worktop_Group (Worktop_Group, Worktop_Group_Descript' +
        'ion, Material_Type, Inactive)'
      
        'values (:Worktop_Group, :Worktop_Group_Description, :Material_Ty' +
        'pe, '#39'N'#39')')
    Left = 208
    Top = 432
    ParamData = <
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Worktop_Group_Description'
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryCheckWorktop: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Worktop'
      'FROM Worktop'
      
        'WHERE Description = :Description AND Material_Type = :Material_T' +
        'ype')
    Left = 24
    Top = 480
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryGetNextWorktop: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Worktop) as Last_Worktop'
      'from Worktop')
    Left = 112
    Top = 480
  end
  object qryAddWorktop: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'insert into Worktop (Worktop, Description, Material_Type, Workto' +
        'p_Group, Inactive)'
      
        'values (:Worktop, :Description, :Material_Type, :Worktop_Group, ' +
        #39'N'#39')')
    Left = 208
    Top = 480
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Worktop_Group'
        DataType = ftInteger
      end>
  end
  object qryCheckThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Thickness'
      'FROM Thickness'
      'WHERE Thickness_mm = :Thickness_mm')
    Left = 24
    Top = 536
    ParamData = <
      item
        Name = 'Thickness_mm'
      end>
  end
  object qryGetNextThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Thickness) as Last_Thickness'
      'from Thickness')
    Left = 112
    Top = 536
  end
  object qryAddThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Thickness (Thickness, Thickness_mm, Inactive)'
      'values (:Thickness, :Thickness_mm, '#39'N'#39')')
    Left = 208
    Top = 536
    ParamData = <
      item
        Name = 'Thickness'
      end
      item
        Name = 'Thickness_mm'
      end>
  end
  object qryAddWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'insert into Worktop_Thickness (Worktop, Thickness, Price_Pointer' +
        ')'
      'values (:Worktop, :Thickness, :Price_Pointer)')
    Left = 208
    Top = 584
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
  object qryCheckWorktopThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Worktop_Thickness'
      'Where Worktop = :Worktop AND Thickness = :Thickness')
    Left = 24
    Top = 592
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
end
