object dmAccImport: TdmAccImport
  OldCreateOrder = False
  Left = 168
  Top = 18
  Height = 663
  Width = 904
  object AddBranchSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Building_No_Name'
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
        Name = 'PostCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Town'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inv_To_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inv_To_Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Short_Code'
        ParamType = ptUnknown
      end>
  end
  object AddCustSQL: TQuery
    DatabaseName = 'wt'
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
        Name = 'Credit_Limit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_Active'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Credit_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Created'
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
        Name = 'Telephone_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'County_State'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Use_Online_Ordering'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deposit_Terms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_of_Employees'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Web_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Source'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Prospect'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object GetBranchSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Account_Code = :Account_Code and'
      'Branch_no = 0')
    Left = 160
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'Account_Code'
        ParamType = ptUnknown
      end>
  end
  object UpCustSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Acc_Active'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Credit_Limit'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'VAT_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object UpBranchSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code_on_Ledger'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object GetNextBranchSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Branch_no) as Last_Branch'
      'from Customer_Branch'
      'where Customer = :Customer')
    Left = 320
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object GetNextCustSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(customer) as Last_Customer'
      'from Customer')
    Left = 256
    Top = 136
  end
  object GetNextContactSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(contact_no) as Last_Contact'
      'from Customer_Contact'
      'where Customer = :Customer')
    Left = 160
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object AddRepSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Percentage'
        ParamType = ptUnknown
      end>
  end
  object AddContactSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telephone_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail_address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mobile_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Forename'
        ParamType = ptUnknown
      end>
  end
  object AddSuppSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Acc_Active'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intrastat_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Currency_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAT_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Country_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code_Def'
        ParamType = ptUnknown
      end>
  end
  object GetNextSuppSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Supplier) as Last_Supplier'
      'from Supplier')
    Left = 96
    Top = 192
  end
  object AddSuppBranchSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Building_No_Name'
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
        Name = 'PostCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Town'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end>
  end
  object UpSuppSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Acc_Active'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object UpSuppBranchSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code_on_Ledger'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object GetLastNarrSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Select Max(Narrative) as Last_Code'
      'From Narrative_Line'
      '')
    Left = 312
    Top = 240
  end
  object GetCustBranchSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Customer, Branch_no,  Account_Code, Narrative'
      'from Customer_Branch'
      'where Customer = :Customer')
    Left = 240
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object AddSuppContSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Salutation'
        ParamType = ptUnknown
      end>
  end
  object GetNextSuppContactSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object GetSuppBranchSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Supplier_Branch'
      'where Account_Code = :Account_Code')
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'Account_Code'
        ParamType = ptUnknown
      end>
  end
  object AddNarrSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Narrative_Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Narrative_Text'
        ParamType = ptUnknown
      end>
  end
  object UpBranchNarrSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'update Customer_Branch'
      'set Narrative = :Narrative'
      'where '#9'Customer = :Customer and'
      #9#9#9'Branch_no = :Branch_no')
    Left = 112
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object GetSageCustomer: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from'
      'SALES_LEDGER')
    Left = 408
    Top = 80
  end
  object Sage50Database: TDatabase
    DatabaseName = 'dbSage50'
    SessionName = 'Default'
    Left = 408
    Top = 32
  end
  object CustExistSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end>
  end
  object GetNextRepSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Max(rep) as Last_Record'
      'from Rep')
    Left = 240
    Top = 288
  end
  object AddNewRepSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      
        'insert into Rep (Rep, Name, Building_no_name, Street, Locale, To' +
        'wn, PostCode, phone)'
      'values (:Rep,:Name,'#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39','#39' '#39')')
    Left = 312
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object CheckRepSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from Rep'
      'where Name like :Name')
    Left = 312
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object AddCurrencySQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'insert into Currency_Code (Currency_Code, Currency_Code_Descr)'
      'values (:Currency_Code, :Currency_Code_Descr)')
    Left = 240
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Currency_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Currency_Code_Descr'
        ParamType = ptUnknown
      end>
  end
  object GetSageSupplier: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from PURCHASE_LEDGER')
    Left = 408
    Top = 128
  end
  object SuppExistSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Supplier_Branch.Name'
      'from Supplier_Branch'
      'where Account_Code = :Account_Code')
    Left = 112
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end>
  end
  object UpCreditLimitSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'update Customer'
      
        'set Credit_Limit = :Credit_Limit, Available_Credit = :Available_' +
        'Credit'
      'where Customer = :Customer')
    Left = 408
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Credit_Limit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Available_Credit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object UpCompanyImpSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'update company'
      'set Data_Import_Directory = :Data_Import_Directory'
      'where company = 1')
    Left = 408
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Data_Import_Directory'
        ParamType = ptUnknown
      end>
  end
  object GetSagePayments: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Date_Entered'
        ParamType = ptUnknown
      end>
  end
  object UpPaymentSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Paid_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice_no'
        ParamType = ptUnknown
      end>
  end
  object GetCompanySQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from Company'
      'where company = 1')
    Left = 296
    Top = 32
  end
  object UpCompanyPayDateSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'update company'
      'set Last_Payment_Update = :Last_Payment_Update'
      'where company = 1')
    Left = 496
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_Payment_Update'
        ParamType = ptUnknown
      end>
  end
  object UpAuditHSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'insert into Sage_Audit_Header'
      
        'values (:Tran_Number, :Type, :Inv_Ref, :Date_Entered, :Paid_Flag' +
        ', :Paid_Status)')
    Left = 24
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Tran_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Entered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_Flag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_Status'
        ParamType = ptUnknown
      end>
  end
  object GetSageAuditH: TQuery
    DatabaseName = 'wt'
    Left = 96
    Top = 16
  end
  object GetSageAuditU: TQuery
    DatabaseName = 'wt'
    Left = 160
    Top = 16
  end
  object UPAuditUSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'usage_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'split_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'split_crossref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'deleted_flag'
        ParamType = ptUnknown
      end>
  end
  object DelSageAuditH: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'delete from Sage_Audit_Header')
    Left = 352
    Top = 16
  end
  object MaximiserDB: TDatabase
    DatabaseName = 'dbMaximiser'
    SessionName = 'Default'
    Left = 496
    Top = 8
  end
  object GetMaxContacts: TQuery
    DatabaseName = 'wt'
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
  object GetMaxEmail: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select U_e_mail_address.U_e_mail_address as E_Mail'
      'from U_e_mail_address'
      'where Client_id = :Client_id and'
      'Contact_Number = :Contact_Number')
    Left = 496
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Client_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Number'
        ParamType = ptUnknown
      end>
  end
  object GetMaxWebsite: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select U_web_site.U_web_site as Web_address'
      'from U_web_site'
      'where Client_id = :Client_id and'
      'Contact_Number = :Contact_Number')
    Left = 496
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Client_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Number'
        ParamType = ptUnknown
      end>
  end
  object CustNameExistSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Customer.Customer, Customer.Name'
      'from Customer'
      'where Name = :Name')
    Left = 497
    Top = 251
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object CheckContactSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select TOP 1 Contact_no, Contact_Name'
      'from Customer_contact'
      'where Contact_Name = :Name and'
      'Customer = :Customer')
    Left = 496
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object QuickbooksDB: TDatabase
    DatabaseName = 'dbQuickbooks'
    SessionName = 'Default'
    Left = 600
    Top = 8
  end
  object DelRepSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Delete from Reps_Branches'
      'where Customer = :Customer')
    Left = 600
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object GetRepSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Rep'
      'from Rep'
      'where Name = :Name or Rep_Suffix_or_Prefix = :Name')
    Left = 600
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object GetCustBrSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Branch'
      'where Customer = :Customer'
      'ORDER BY Branch_no')
    Left = 600
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object AddContactinfoSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Month'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pays_Online'
        ParamType = ptUnknown
      end>
  end
  object CheckBranchSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select top 1 *'
      'from Customer_Branch'
      'Where Customer = :Customer and Short_Code = :Short_Code')
    Left = 600
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Short_Code'
        ParamType = ptUnknown
      end>
  end
  object UpdBranchSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Building_No_Name'
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
        Name = 'PostCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Town'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inv_To_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inv_To_Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Short_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object UpdContactSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telephone_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email_address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mobile_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Forename'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object UpdContactInfoSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastCustType: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Customer_Type) as Last_Code'
      'from Customer_Type')
    Left = 688
    Top = 168
  end
  object qryGetCustType: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Type'
      'where Description = :Description')
    Left = 688
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryAddCustType: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'insert into Customer_Type'
      'values (:Customer_Type, :Description, '#39'N'#39', '#39#39')')
    Left = 688
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryGetLastContType: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Contact_Type) as Last_Code'
      'from Contact_Type')
    Left = 792
    Top = 168
  end
  object qryGetContType: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Contact_Type'
      'where Contact_Type_Description = :Contact_Type_Description')
    Left = 792
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_Type_Description'
        ParamType = ptUnknown
      end>
  end
  object qryAddContType: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'insert into Contact_Type'
      'values (:Contact_Type, :Contact_Type_Description)')
    Left = 792
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type_Description'
        ParamType = ptUnknown
      end>
  end
  object qryCheckMaterial: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Material_Type'
      'FROM Material_Type'
      'WHERE Description = :Description')
    Left = 24
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextMaterial: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Material_Type) as Last_Material'
      'from Material_Type')
    Left = 112
    Top = 384
  end
  object qryAddMaterialType: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'insert into Material_Type (Material_Type, Description, Inactive)'
      'values (:Material_Type, :Description, '#39'N'#39')')
    Left = 208
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryCheckWTGroup: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Worktop_Group'
      'FROM Worktop_Group'
      'WHERE Worktop_Group_Description = :Worktop_Group_Description and'
      'Material_Type = :Material_Type')
    Left = 24
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop_Group_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextWTGroup: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Worktop_Group) as Last_Group'
      'from Worktop_Group')
    Left = 112
    Top = 432
  end
  object qryAddWTGroup: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      
        'insert into Worktop_Group (Worktop_Group, Worktop_Group_Descript' +
        'ion, Material_Type, Inactive)'
      
        'values (:Worktop_Group, :Worktop_Group_Description, :Material_Ty' +
        'pe, '#39'N'#39')')
    Left = 208
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop_Group_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object qryCheckWorktop: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Worktop'
      'FROM Worktop'
      
        'WHERE Description = :Description AND Material_Type = :Material_T' +
        'ype')
    Left = 24
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextWorktop: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Worktop) as Last_Worktop'
      'from Worktop')
    Left = 112
    Top = 480
  end
  object qryAddWorktop: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      
        'insert into Worktop (Worktop, Description, Material_Type, Workto' +
        'p_Group, Inactive)'
      
        'values (:Worktop, :Description, :Material_Type, :Worktop_Group, ' +
        #39'N'#39')')
    Left = 208
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Worktop_Group'
        ParamType = ptUnknown
      end>
  end
  object qryCheckThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT Thickness'
      'FROM Thickness'
      'WHERE Thickness_mm = :Thickness_mm')
    Left = 24
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Thickness_mm'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextThickness: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select max(Thickness) as Last_Thickness'
      'from Thickness')
    Left = 112
    Top = 536
  end
  object qryAddThickness: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'insert into Thickness (Thickness, Thickness_mm, Inactive)'
      'values (:Thickness, :Thickness_mm, '#39'N'#39')')
    Left = 208
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness_mm'
        ParamType = ptUnknown
      end>
  end
  object qryAddWTThickness: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      
        'insert into Worktop_Thickness (Worktop, Thickness, Price_Pointer' +
        ')'
      'values (:Worktop, :Thickness, :Price_Pointer)')
    Left = 208
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Pointer'
        ParamType = ptUnknown
      end>
  end
  object qryCheckWorktopThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Worktop_Thickness'
      'Where Worktop = :Worktop AND Thickness = :Thickness')
    Left = 24
    Top = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
end
