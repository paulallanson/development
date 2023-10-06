object dmAccImport: TdmAccImport
  Height = 634
  Width = 1280
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Customer'
      #9#9#9'(Customer, Name, Settlement_Discount,'
      #9#9#9'Settlement_Days, Credit_Limit, Acc_Active, Credit_Status,'
      '        Customer_Type, Intrastat_id, Country_id,'
      '        Vat_Reference, Customer_Status, Available_Credit,'
      
        '        Currency_Code_Def, VAT_Code_Def, Date_Created, Created_b' +
        'y,'
      '        Company_Reg_Number,'
      '        Analysis_Code_1,'
      '        Analysis_Code_2,'
      '        Analysis_Code_3,'
      '        Analysis_Code_4,'
      '        GDPR_Letter_Sent,'
      '        GDPR_Letter_Signed,'
      '        Payment_Terms)'
      'values'#9'(:Customer, :Name, :Settlement_Discount,'
      #9#9#9':Settlement_Days, :Credit_Limit, :Acc_Active, :Credit_Status,'
      '        :Customer_Type, :Intrastat_id, :Country_id,'
      '        :Vat_Reference, :Customer_Status, :Available_Credit,'
      
        '        :Currency_Code_Def, :VAT_Code_Def, :Date_Created, :Creat' +
        'ed_by,'
      '        :Company_Reg_Number,'
      '        :Analysis_Code_1,'
      '        :Analysis_Code_2,'
      '        :Analysis_Code_3,'
      '        :Analysis_Code_4,'
      '        :GDPR_Letter_Sent,'
      '        :GDPR_Letter_Signed,'
      '        :Payment_Terms)'
      ' ')
    Left = 96
    Top = 80
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Settlement_Discount'
      end
      item
        Name = 'Settlement_Days'
      end
      item
        Name = 'Credit_Limit'
      end
      item
        Name = 'Acc_Active'
      end
      item
        Name = 'Credit_Status'
      end
      item
        Name = 'Customer_Type'
      end
      item
        Name = 'Intrastat_id'
      end
      item
        Name = 'Country_id'
        DataType = ftInteger
      end
      item
        Name = 'Vat_Reference'
      end
      item
        Name = 'Customer_Status'
      end
      item
        Name = 'Available_Credit'
      end
      item
        Name = 'Currency_Code_Def'
      end
      item
        Name = 'VAT_Code_Def'
      end
      item
        Name = 'Date_Created'
      end
      item
        Name = 'Created_by'
      end
      item
        Name = 'Company_Reg_Number'
      end
      item
        Name = 'Analysis_Code_1'
      end
      item
        Name = 'Analysis_Code_2'
      end
      item
        Name = 'Analysis_Code_3'
      end
      item
        Name = 'Analysis_Code_4'
      end
      item
        Name = 'GDPR_Letter_Sent'
      end
      item
        Name = 'GDPR_Letter_Signed'
      end
      item
        Name = 'Payment_Terms'
      end>
  end
  object GetBranchSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(customer) as Last_Customer'
      'from Customer')
    Left = 256
    Top = 136
  end
  object GetNextContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(contact_no) as Last_Contact'
      'from Customer_Contact'
      'where Customer = :Customer and'
      #9#9#9'Branch_no = :Branch_no'
      '')
    Left = 160
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object AddRepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Reps_Branches'
      '        (Customer,'
      '        Branch_No,'
      '        Rep,'
      '        Percentage,'
      '        Is_Main_Rep)'
      'Values'
      '        (:Customer,'
      '        :Branch_No,'
      '        :Rep,'
      '        :Percentage,'
      '        :Is_Main_Rep)'
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
      end
      item
        Name = 'Is_Main_Rep'
      end>
  end
  object AddContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type,'
      '        Phone,'
      '        Mobile_no,'
      '        EMail,'
      '        ExportFilter,'
      '        Salutation)'
      'Values'
      '        (:Customer,'
      '        :Branch_No,'
      '        :Contact_No,'
      '        :Name,'
      '        :Contact_Type,'
      '        :Phone,'
      '        :Mobile_no,'
      '        :EMail,'
      '        :ExportFilter,'
      '        :Salutation)'
      '')
    Left = 24
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
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
        Name = 'Mobile_no'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'ExportFilter'
      end
      item
        Name = 'Salutation'
      end>
  end
  object AddSuppSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Supplier) as Last_Supplier'
      'from Supplier')
    Left = 96
    Top = 192
  end
  object AddSuppBranchSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Narrative) as Last_Code'
      'From Narrative_Line'
      '')
    Left = 312
    Top = 240
  end
  object GetCustBranchSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Supplier_BranchContacts'
      '        (Supplier,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type,'
      '        Phone,'
      '        Mobile_no,'
      '        EMail,'
      '        ExportFilter,'
      #9#9#9'  Salutation)'
      'Values'
      '        (:Supplier,'
      '        :Branch_No,'
      '        :Contact_No,'
      '        :Name,'
      '        :Contact_Type,'
      '        :Phone,'
      '        :Mobile_no,'
      '        :Email,'
      '        :ExportFilter,'
      '        :Salutation)')
    Left = 184
    Top = 392
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
        Name = 'Mobile_no'
      end
      item
        Name = 'Email'
      end
      item
        Name = 'ExportFilter'
      end
      item
        Name = 'Salutation'
      end>
  end
  object GetNextSuppContactSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'dBSage50'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Customer_Branch.Customer, Customer_Branch.Name, Customer_' +
        'Branch.Branch_no'
      'from Customer_Branch, customer'
      'where '
      'Customer_Branch.customer = customer.customer and'
      
        '(((Account_Code = :Account_Code) and (:Account_Code <> '#39#39')) or (' +
        'Customer.name = :Customer_Name))'
      '')
    Left = 24
    Top = 336
    ParamData = <
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Customer_Name'
      end>
  end
  object GetNextRepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Max(rep) as Last_Record'
      'from Rep')
    Left = 240
    Top = 288
  end
  object AddNewRepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'insert into Rep (Rep, Name, Building_no_name, Street, Locale, To' +
        'wn, PostCode, phone, Rep_Is_Sub_Rep)'
      'values (:Rep,:Name,'#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39', :Rep_Is_Sub_Rep)')
    Left = 312
    Top = 288
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Rep_Is_Sub_Rep'
      end>
  end
  object CheckRepSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'dbSage50'
    SQL.Strings = (
      'select *'
      'from PURCHASE_LEDGER')
    Left = 408
    Top = 128
  end
  object SuppExistSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Supplier_Branch.Name, Supplier_Branch.Supplier, Supplier_' +
        'Branch.Branch_no'
      'from Supplier_Branch, Supplier'
      'where'
      'Supplier_Branch.Supplier = Supplier.Supplier and'
      
        '(((Account_Code = :Account_Code) and (:Account_Code <> '#39#39')) or (' +
        'Supplier.name = :Supplier_Name))'
      '')
    Left = 112
    Top = 336
    ParamData = <
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Supplier_Name'
      end>
  end
  object UpCreditLimitSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Company'
      'where company = 1')
    Left = 296
    Top = 32
  end
  object UpCompanyPayDateSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'dbSage50'
    Left = 96
    Top = 16
  end
  object GetSageAuditU: TFDQuery
    ConnectionName = 'dbSage50'
    Left = 160
    Top = 16
  end
  object UPAuditUSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sage_Audit_Header')
    Left = 824
    Top = 312
  end
  object MaximiserDB: TFDConnection
    ConnectionName = 'dbMaximiser'
    Left = 496
    Top = 8
  end
  object GetMaxContacts: TFDQuery
    ConnectionName = 'dbMaximiser'
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
    ConnectionName = 'dbMaximiser'
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
    ConnectionName = 'dbMaximiser'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP 1 Contact_no, Name'
      'from Customer_contact'
      'WHERE ((Name = :Name) OR (Email = :Email) AND (Email <> '#39#39')) AND'
      '      Customer = :Customer and Branch_no = :Branch_no')
    Left = 496
    Top = 296
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetCType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Contact_Type, Description'
      'from Contact_Type'
      'where Description = :Description')
    Left = 600
    Top = 304
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryNextCType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select max(Contact_Type)+1 as Next_Contact_Type'
      'from Contact_type')
    Left = 496
    Top = 344
  end
  object qryAddCType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Contact_Type(Contact_Type, Description)'
      'values (:Contact_Type, :Description)')
    Left = 600
    Top = 352
    ParamData = <
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Description'
      end>
  end
  object QuickbooksDB: TFDConnection
    ConnectionName = 'dbQuickbooks'
    Left = 600
    Top = 8
  end
  object DelRepSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
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
      '        Account_Code = :Account_Code,'
      '        Short_Code = :Short_Code'
      'Where Customer = :Customer and Branch_no = :Branch_No')
    Left = 688
    Top = 56
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
        Name = 'Account_Code'
      end
      item
        Name = 'Short_Code'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object UpdContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'set     Name = :Name,'
      '        Phone = :Phone,'
      '        Mobile_no = :Mobile_no,'
      '        EMail = :Email,'
      '        Salutation = :Salutation'
      
        'WHERE Customer = :Customer and Branch_no = :Branch_No and Contac' +
        't_no = :Contact_No'
      '')
    Left = 688
    Top = 104
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Mobile_no'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'Salutation'
      end
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
  object UpdContactInfoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      
        'set     Contact_info = (select max(Contact_info) from Contact_in' +
        'fo)'
      
        'WHERE Customer = :Customer and Branch_no = :Branch_No and Contac' +
        't_no = :Contact_No'
      '')
    Left = 688
    Top = 152
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
  object qryGetCustomerContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 * '
      'FROM Customer_Contact'
      'WHERE Customer = :Customer AND Branch_no = :Branch_No')
    Left = 800
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryGetSupplierContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 * '
      'FROM Supplier_BranchContacts'
      'WHERE Supplier = :Supplier AND Branch_no = :Branch_No')
    Left = 928
    Top = 24
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryGetProductTYpe: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Product_Type'
      'WHERE Description = :Description')
    Left = 808
    Top = 72
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryAddPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Purchase_Order'
      '      (Purchase_order,'
      '      Date_Point,'
      '      Supplier,'
      '      Branch_No,'
      '      Operator,'
      '      Purch_Ord_Head_Status,'
      '      Contact_no,'
      '      Office_Contact)'
      'VALUES'
      '      ('
      '      :Purchase_order,'
      '      :Date_Point,'
      '      :Supplier,'
      '      :Branch_No,'
      '      :Operator,'
      '      :Purch_Ord_Head_Status,'
      '      :Contact_no,'
      '      :Office_Contact'
      '      )')
    Left = 1048
    Top = 24
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Purch_Ord_Head_Status'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Office_Contact'
      end>
  end
  object qryAddPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      ' INSERT INTO Purchase_OrderLine'
      ' ('
      '  Purchase_order,'
      '  Line,'
      '  Cust_Order_no,'
      '  Customer,'
      '  Branch_No,'
      '  Supplier_Reference,'
      '  Goods_Required,'
      '  Purch_Ord_Line_Status,'
      '  Vat_Code,'
      '  Suppliers_Desc,'
      '  Customers_Desc,'
      '  Quantity,'
      '  Order_Price,'
      '  Selling_Price,'
      '  List_Price,'
      '  Product_Type,'
      '  Printed_PO,'
      '  Sell_Unit,'
      '  Order_Unit,'
      '  Supp_Inv_Recd,'
      '  Rep,'
      '  Contact_no,'
      '  Qty_Supp_Inv,'
      '  Qty_Invoiced,'
      '  Goods_Reqd_by_Customer'
      ')'
      'VALUES'
      '  ('
      '  :Purchase_order,'
      '  :Line,'
      '  :Cust_Order_no,'
      '  :Customer,'
      '  :Branch_No,'
      '  :Supplier_Reference,'
      '  :Goods_Required,'
      '  :Purch_Ord_Line_Status,'
      '  :Vat_Code,'
      '  :Suppliers_Desc,'
      '  :Customers_Desc,'
      '  :Quantity,'
      '  :Order_Price,'
      '  :Selling_Price,'
      '  :List_Price,'
      '  :Product_Type,'
      '  :Printed_PO,'
      '  :Sell_Unit,'
      '  :Order_Unit,'
      '  :Supp_Inv_Recd,'
      '  :Rep,'
      '  :Contact_no,'
      '  :Qty_Supp_Inv,'
      '  :Qty_Invoiced,'
      '  :Goods_Reqd_by_Customer'
      '  )')
    Left = 1048
    Top = 80
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier_Reference'
      end
      item
        Name = 'Goods_Required'
      end
      item
        Name = 'Purch_Ord_Line_Status'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Suppliers_Desc'
      end
      item
        Name = 'Customers_Desc'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Order_Price'
      end
      item
        Name = 'Selling_Price'
      end
      item
        Name = 'List_Price'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Printed_PO'
      end
      item
        Name = 'Sell_Unit'
      end
      item
        Name = 'Order_Unit'
      end
      item
        Name = 'Supp_Inv_Recd'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Qty_Supp_Inv'
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Goods_Reqd_by_Customer'
      end>
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Price_Unit'
      'FROM Price_Unit'
      'Where Price_Unit_Factor = 0')
    Left = 816
    Top = 128
  end
  object qryGetRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 * '
      'FROM Reps_Branches'
      'WHERE Customer = :Customer AND Branch_no = :Branch_No')
    Left = 816
    Top = 192
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryAddDelivLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Delivery_Detail'
      '    ('
      '    Purchase_order,'
      '    Line,'
      '    Delivery_No,'
      '    Qty_To_Deliver,'
      '    Qty_Delivered,'
      '    Qty_Invoiced,'
      '    Date_Point,'
      '    Customer,'
      '    Branch_No0,'
      '    Date_Deliv_Actual,'
      '    Is_Updated,'
      '    No_of_Boxes,'
      '    Delivery_Instructions,'
      '    Delivery_To_Stock,'
      '    Goods_Reqd_by_Customer,'
      '    Contact_Name'
      '    )'
      'VALUES'
      '    ('
      '    :Purchase_order,'
      '    :Line,'
      '    :Delivery_No,'
      '    :Qty_To_Deliver,'
      '    :Qty_Delivered,'
      '    :Qty_Invoiced,'
      '    :Date_Point,'
      '    :Customer,'
      '    :Branch_No0,'
      '    :Date_Deliv_Actual,'
      '    :Is_Updated,'
      '    :No_of_Boxes,'
      '    :Delivery_Instructions,'
      '    :Delivery_To_Stock,'
      '    :Goods_Reqd_by_Customer,'
      '    :Contact_Name'
      '    )'
      '')
    Left = 1048
    Top = 136
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Delivery_No'
      end
      item
        Name = 'Qty_To_Deliver'
      end
      item
        Name = 'Qty_Delivered'
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No0'
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDateTime
      end
      item
        Name = 'Is_Updated'
      end
      item
        Name = 'No_of_Boxes'
      end
      item
        Name = 'Delivery_Instructions'
      end
      item
        Name = 'Delivery_To_Stock'
      end
      item
        Name = 'Goods_Reqd_by_Customer'
      end
      item
        Name = 'Contact_Name'
      end>
  end
  object qryAddSI: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Sales_Invoice'
      '    ('
      '    Sales_Invoice,'
      '    Invoice_Date,'
      '    Customer,'
      '    Branch_No,'
      '    Operator,'
      '    Sales_Invoice_Status,'
      '    Contact_no,'
      '    Office_Contact,'
      '    Goods_Value,'
      '    Vat_Value,'
      '    Sales_Invoice_no,'
      '    Inv_to_Customer,'
      '    Inv_To_Branch,'
      '    Invoice_Or_Credit,'
      '    Reference,'
      '    Rep,'
      '    Invoice_Description,'
      '    Currency_Code,'
      '    Cash_Sales,'
      '    Electronic_Invoice,'
      '    Cust_Order_No,'
      '    Paid_status,'
      '    Paid_Amount,'
      '    Paid_Date,'
      '    Sales_Invoice_Type'
      '    )'
      'VALUES'
      '    ('
      '    :Sales_Invoice,'
      '    :Invoice_Date,'
      '    :Customer,'
      '    :Branch_No,'
      '    :Operator,'
      '    :Sales_Invoice_Status,'
      '    :Contact_no,'
      '    :Office_Contact,'
      '    :Goods_Value,'
      '    :Vat_Value,'
      '    :Sales_Invoice_no,'
      '    :Inv_to_Customer,'
      '    :Inv_To_Branch,'
      '    :Invoice_Or_Credit,'
      '    :Reference,'
      '    :Rep,'
      '    :Invoice_Description,'
      '    :Currency_Code,'
      '    :Cash_Sales,'
      '    :Electronic_Invoice,'
      '    :Cust_Order_No,'
      '    :Paid_status,'
      '    :Paid_Amount,'
      '    :Paid_Date,'
      '    :Sales_Invoice_Type'
      '    )')
    Left = 1136
    Top = 24
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Sales_Invoice_no'
      end
      item
        Name = 'Inv_to_Customer'
      end
      item
        Name = 'Inv_To_Branch'
      end
      item
        Name = 'Invoice_Or_Credit'
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Invoice_Description'
      end
      item
        Name = 'Currency_Code'
      end
      item
        Name = 'Cash_Sales'
      end
      item
        Name = 'Electronic_Invoice'
      end
      item
        Name = 'Cust_Order_No'
      end
      item
        Name = 'Paid_status'
      end
      item
        Name = 'Paid_Amount'
      end
      item
        Name = 'Paid_Date'
      end
      item
        Name = 'Sales_Invoice_Type'
      end>
  end
  object qryAddSILine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Sales_Invoice_Line'
      '    ('
      '      Sales_Invoice,'
      '      Invoice_Line_no,'
      '      Purchase_Order,'
      '      Line,'
      '      Qty_Invoiced,'
      '      Goods_Value,'
      '      Vat_Value,'
      '      Vat_Code,'
      '      Product_Type,'
      '      Sales_Invoice_Status,'
      '      Price_Unit,'
      '      Nominal,'
      '      Job_Bag,'
      '      Job_Bag_Line'
      '    )'
      'VALUES'
      '    ('
      '      :Sales_Invoice,'
      '      :Invoice_Line_no,'
      '      :Purchase_Order,'
      '      :Line,'
      '      :Qty_Invoiced,'
      '      :Goods_Value,'
      '      :Vat_Value,'
      '      :Vat_Code,'
      '      :Product_Type,'
      '      :Sales_Invoice_Status,'
      '      :Price_Unit,'
      '      :Nominal,'
      '      :Job_Bag,'
      '      :Job_Bag_Line'
      '    )'
      ''
      '')
    Left = 1136
    Top = 80
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_Line'
        DataType = ftInteger
      end>
  end
  object qryGetNextSI: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ISNULL(MAX(Sales_Invoice),0)+1 as Next_SI_Number'
      'FROM Sales_Invoice')
    Left = 928
    Top = 80
  end
  object qryGetNextPI: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ISNULL(MAX(Supplier_Invoice),0)+1 as Next_PI_Number'
      'FROM Supplier_Invoice')
    Left = 928
    Top = 136
  end
  object qryAddPI: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Supplier_Invoice'
      '      ('
      '      Supplier_Invoice,'
      '      Invoice_Date,'
      '      Supplier,'
      '      Branch_No,'
      '      Operator,'
      '      Supp_Invoice_Status,'
      '      Supp_Inv_Alt_Ref,'
      '      Goods_Value,'
      '      Vat_Value,'
      '      Supplier_Invoice_no,'
      '      Invoice_Or_Credit,'
      '      Goods_Value_Diff,'
      '      Vat_Value_Diff,'
      '      Currency_Code'
      '      )'
      'VALUES'
      '      ('
      '      :Supplier_Invoice,'
      '      :Invoice_Date,'
      '      :Supplier,'
      '      :Branch_No,'
      '      :Operator,'
      '      :Supp_Invoice_Status,'
      '      :Supp_Inv_Alt_Ref,'
      '      :Goods_Value,'
      '      :Vat_Value,'
      '      :Supplier_Invoice_no,'
      '      :Invoice_Or_Credit,'
      '      :Goods_Value_Diff,'
      '      :Vat_Value_Diff,'
      '      :Currency_Code'
      '      )'
      '')
    Left = 1208
    Top = 24
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Supp_Inv_Alt_Ref'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Supplier_Invoice_no'
      end
      item
        Name = 'Invoice_Or_Credit'
      end
      item
        Name = 'Goods_Value_Diff'
      end
      item
        Name = 'Vat_Value_Diff'
      end
      item
        Name = 'Currency_Code'
      end>
  end
  object qryAddPILine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Supplier_Invoice_Line'
      '    ('
      '      Supplier_Invoice,'
      '      Invoice_Line_no,'
      '      Purchase_Order,'
      '      Line,'
      '      Qty_Invoiced,'
      '      Goods_Value,'
      '      Vat_Value,'
      '      Vat_Code,'
      '      Supp_Invoice_Status,'
      '      Price_Unit,'
      '      Nominal'
      '    )'
      'VALUES'
      '    ('
      '      :Supplier_Invoice,'
      '      :Invoice_Line_no,'
      '      :Purchase_Order,'
      '      :Line,'
      '      :Qty_Invoiced,'
      '      :Goods_Value,'
      '      :Vat_Value,'
      '      :Vat_Code,'
      '      :Supp_Invoice_Status,'
      '      :Price_Unit,'
      '      :Nominal'
      '    )'
      ''
      '')
    Left = 1208
    Top = 80
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Nominal'
      end>
  end
  object qryGetTopRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP 1 Rep'
      'FROM Rep'
      'WHERE ((inactive = '#39'N'#39') or (inactive is NULL))')
    Left = 824
    Top = 248
  end
  object qryCheckSINumber: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ISNULL(Sales_Invoice,0) as Sales_Invoice'
      'FROM Sales_Invoice'
      'WHERE Sales_Invoice_No = :Sales_Invoice_No')
    Left = 928
    Top = 200
    ParamData = <
      item
        Name = 'Sales_Invoice_No'
      end>
  end
  object qryUpdSI: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Invoice'
      'SET    Goods_Value = Goods_Value + :Goods_Value,'
      '       VAT_Value = VAT_Value + :VAT_Value'
      'WHERE'
      '      Sales_Invoice = :Sales_Invoice')
    Left = 1136
    Top = 144
    ParamData = <
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetNextSILine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ISNULL(MAX(Invoice_Line_No),0)+1 as Next_SI_Line_Number'
      'FROM Sales_Invoice_Line'
      'WHERE Sales_Invoice = :Sales_Invoice')
    Left = 928
    Top = 256
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object UpCreditNoteSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Invoice'
      'SET Paid_Status = '#39'Y'#39','
      '    Paid_Amount = (Goods_Value + Vat_Value),'
      '    Paid_Date = :Paid_Date'
      
        'WHERE Sales_Invoice.Reference = :Reference AND Sales_Invoice.Inv' +
        'oice_or_Credit = '#39'C'#39' ')
    Left = 1136
    Top = 200
    ParamData = <
      item
        Name = 'Paid_Date'
      end
      item
        Name = 'Reference'
      end>
  end
  object UpdCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Customer'
      'SET Name = :Name,'
      '    Customer_Status = :Customer_Status'
      'WHERE Customer = :Customer'
      ' ')
    Left = 688
    Top = 8
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Customer_Status'
      end
      item
        Name = 'Customer'
      end>
  end
  object CheckSuppContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select TOP 1 Contact_no, Name'
      'from Supplier_BranchContacts'
      'WHERE ((Name = :Name) OR (Email = :Email) AND (Email <> '#39#39')) AND'
      '      Supplier = :Supplier and Branch_no = :Branch_no')
    Left = 24
    Top = 392
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object UpdSuppContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_BranchContacts'
      'set     Name = :Name,'
      '        Phone = :Phone,'
      '        Mobile_no = :Mobile_no,'
      '        EMail = :Email,'
      '        Salutation = :Salutation'
      
        'WHERE Supplier = :Supplier and Branch_no = :Branch_No and Contac' +
        't_no = :Contact_No'
      '')
    Left = 112
    Top = 392
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Mobile_no'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'Salutation'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object DelSageAuditU: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sage_Audit_Usage')
    Left = 824
    Top = 368
  end
  object qryAddCustomerType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Type'
      '(Customer_Type, Description)'
      'Select Max(Customer_Type)+1, :Description From Customer_Type'
      '')
    Left = 312
    Top = 392
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryGetCustomerType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Customer_Type '
      'FROM Customer_Type'
      'WHERE Description = :Description'
      '')
    Left = 312
    Top = 448
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryAddCountry: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Country_Id'
      '(Country_Id, Country_Id_Descr)'
      'Select Max(Country_Id)+1, :Description From Country_Id'
      '')
    Left = 408
    Top = 392
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryGetCountry: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Country_Id '
      'FROM Country_Id'
      'WHERE Country_Id_Descr = :Description'
      '')
    Left = 408
    Top = 448
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object qryGetVatCode: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Vat_Code '
      'FROM Vat_Code'
      'WHERE Vat_Ref = :Vat_Ref'
      '')
    Left = 496
    Top = 448
    ParamData = <
      item
        Name = 'Vat_Ref'
      end>
  end
  object qryGetPaymentTerms: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Payment_Terms'
      'FROM Payment_Terms'
      'WHERE Number_of_Days = :Number_of_Days'
      '')
    Left = 592
    Top = 448
    ParamData = <
      item
        Name = 'Number_of_Days'
      end>
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Operator'
      'FROM Operator'
      'WHERE Short_Name = :Short_Name')
    Left = 688
    Top = 200
    ParamData = <
      item
        Name = 'Short_Name'
      end>
  end
  object qryGetPriceUnitByDesc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Price_Unit'
      
        'WHERE (Description = :Description) or (Price_unit_Factor = :Pric' +
        'e_Unit_Factor)')
    Left = 592
    Top = 496
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Price_Unit_Factor'
      end>
  end
  object qryGetNextJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT (Last_Job_Bag_Number + 1) as Next_Job_bag_Number'
      'FROM Company'
      'WHERE Company = 1')
    Left = 824
    Top = 424
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Company'
      'Set Last_Job_Bag_Number = :Last_Job_Bag_Number'
      'WHERE Company = 1')
    Left = 824
    Top = 480
    ParamData = <
      item
        Name = 'Last_Job_Bag_Number'
      end>
  end
  object qryAddJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Job_Bag'
      '      ('
      '      Job_Bag,'
      '      Job_Bag_Descr,'
      '      Customer,'
      '      Branch_No,'
      '      Contact_no,'
      '      Date_Point,'
      '      Rep,'
      '      Cust_Order_no,'
      '      Goods_Required,'
      '      Quantity,'
      '      Office_Contact,'
      '      Job_Bag_Status,'
      '      Description_Reference,'
      '      Operator,'
      '      Date_Start,'
      '      Job_Bag_Production_Status,'
      '      Qty_Invoiced)'
      'VALUES'
      '      ('
      '      :Job_Bag,'
      '      :Job_Bag_Descr,'
      '      :Customer,'
      '      :Branch_No,'
      '      :Contact_no,'
      '      :Date_Point,'
      '      :Rep,'
      '      :Cust_Order_no,'
      '      :Goods_Required,'
      '      :Quantity,'
      '      :Office_Contact,'
      '      :Job_Bag_Status,'
      '      :Description_Reference,'
      '      :Operator,'
      '      :Date_Point,'
      '      0,'
      '      :Qty_Invoiced)')
    Left = 928
    Top = 312
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Descr'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Goods_Required'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Job_Bag_Status'
      end
      item
        Name = 'Description_Reference'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Qty_Invoiced'
      end>
  end
  object qryAddJobBagLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Job_bag_line_Dets'
      '('
      'Job_bag,'
      'Job_bag_line,'
      'Job_bag_line_Type,'
      'Purchase_Order,'
      'Line,'
      'Supplier,'
      'Branch_no,'
      'Job_Bag_line_Descr,'
      'Job_Bag_Line_Cost,'
      'Job_Bag_line_Sell,'
      'Job_Bag_Line_Invoiced,'
      'Job_Bag_Quantity,'
      'Vat_Code,'
      'Product_Type,'
      'Inactive,'
      'Job_Bag_line_Status,'
      'Price_Unit,'
      'Selling_Price,'
      'Sequence_no,'
      'Ready_to_Invoice,'
      'Qty_Invoiced'
      ')'
      'Values'
      '('
      ':Job_bag,'
      ':Job_bag_line,'
      ':Job_bag_line_Type,'
      ':Purchase_Order,'
      ':Line,'
      ':Supplier,'
      ':Branch_no,'
      ':Job_Bag_line_Descr,'
      ':Job_Bag_Line_Cost,'
      ':Job_Bag_line_Sell,'
      ':Job_Bag_Line_Invoiced,'
      ':Job_Bag_Quantity,'
      ':Vat_Code,'
      ':Product_Type,'
      ':Inactive,'
      ':Job_Bag_line_Status,'
      ':Price_Unit,'
      ':Selling_Price,'
      ':Sequence_no,'
      ':Ready_to_Invoice,'
      ':Qty_Invoiced'
      ')')
    Left = 928
    Top = 360
    ParamData = <
      item
        Name = 'Job_bag'
      end
      item
        Name = 'Job_bag_line'
      end
      item
        Name = 'Job_bag_line_Type'
      end
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Job_Bag_line_Descr'
      end
      item
        Name = 'Job_Bag_Line_Cost'
      end
      item
        Name = 'Job_Bag_line_Sell'
      end
      item
        Name = 'Job_Bag_Line_Invoiced'
      end
      item
        Name = 'Job_Bag_Quantity'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Job_Bag_line_Status'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Selling_Price'
      end
      item
        Name = 'Sequence_no'
      end
      item
        Name = 'Ready_to_Invoice'
      end
      item
        Name = 'Qty_Invoiced'
      end>
  end
  object qryGetPriceUnitFactor: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Price_Unit_Factor'
      'FROM Price_Unit'
      'Where Price_Unit = :Price_Unit')
    Left = 592
    Top = 544
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qryGetPOImport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Purchase_Orders_Import'
      'WHERE Purchase_Order = :Purchase_Order')
    Left = 832
    Top = 536
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetSupplierByAccount: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Supplier, Branch_no'
      'FROM Supplier_Branch'
      'WHERE Account_Code = :Account_Code')
    Left = 312
    Top = 504
    ParamData = <
      item
        Name = 'Account_Code'
      end>
  end
  object qryGetPurchaseOrder: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Supplier, Branch_No'
      'FROM Purchase_order'
      'WHERE Purchase_Order = :Purchase_Order')
    Left = 312
    Top = 552
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryUpdPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Purchase_orderline'
      'SET Quantity = Quantity + :Quantity,'
      '    Qty_Invoiced = Qty_Invoiced + :Quantity'
      'WHERE Purchase_order = :Purchase_Order')
    Left = 24
    Top = 544
    ParamData = <
      item
        Name = 'Quantity'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryUpdDeliveryDetail: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Delivery_Detail'
      'SET Qty_To_Deliver = Qty_To_Deliver + :Quantity,'
      '    Qty_Delivered = Qty_Delivered + :Quantity'
      'WHERE Purchase_order = :Purchase_Order')
    Left = 88
    Top = 544
    ParamData = <
      item
        Name = 'Quantity'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryUpdJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Job_Bag_Line_Dets'
      'SET Job_Bag_Quantity = Job_Bag_Quantity + :Quantity,'
      '    Job_Bag_Line_Cost = Job_Bag_Line_Cost + :Job_Bag_Line_Cost,'
      '    Job_Bag_line_Sell = Job_Bag_line_Sell + :Job_Bag_line_Sell'
      'WHERE Purchase_order = :Purchase_Order')
    Left = 160
    Top = 544
    ParamData = <
      item
        Name = 'Quantity'
      end
      item
        Name = 'Job_Bag_Line_Cost'
      end
      item
        Name = 'Job_Bag_line_Sell'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetJobBagRef: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 Job_Bag.Job_Bag, Job_Bag_Descr'
      'FROM Job_Bag'
      'WHERE Description_Reference = :Description_Reference')
    Left = 1144
    Top = 264
    ParamData = <
      item
        Name = 'Description_Reference'
      end>
  end
  object qryGetJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag'
      'FROM Job_Bag_Line_Dets'
      'WHERE Job_Bag = :Job_Bag AND  Job_Bag_Line = :Job_Bag_Line')
    Left = 1144
    Top = 320
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetNextSICharge: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT ISNULL(MAX(Additional_Charge),0)+1 as Next_SI_Charge_Numb' +
        'er'
      'FROM Sales_Invoice_Add_Charge'
      'WHERE Sales_Invoice = :Sales_Invoice')
    Left = 1024
    Top = 256
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryAddSICharge: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Sales_Invoice_Add_Charge'
      '    ('
      '      Sales_Invoice,'
      '      Additional_Charge,'
      '      Details,'
      '      Amount,'
      '      Nominal,'
      '      Vat_Code'
      '    )'
      'VALUES'
      '    ('
      '      :Sales_Invoice,'
      '      :Additional_Charge,'
      '      :Details,'
      '      :Amount,'
      '      :Nominal,'
      '      :Vat_Code'
      '    )'
      ''
      '')
    Left = 1024
    Top = 312
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Additional_Charge'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Vat_Code'
      end>
  end
  object qryGetVat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Vat_Rate '
      'FROM Vat_Code'
      'WHERE Vat_Code = :Vat_Code'
      '')
    Left = 496
    Top = 496
    ParamData = <
      item
        Name = 'Vat_Code'
      end>
  end
end
