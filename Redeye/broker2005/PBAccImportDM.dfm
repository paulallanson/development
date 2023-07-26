object dmAccImport: TdmAccImport
  OldCreateOrder = False
  Top = 86
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Settlement_Discount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Settlement_Days'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Credit_Limit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Acc_Active'
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
        Name = 'Intrastat_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Country_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Available_Credit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Currency_Code_Def'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAT_Code_Def'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Created'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Created_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Company_Reg_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Analysis_Code_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Analysis_Code_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Analysis_Code_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Analysis_Code_4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GDPR_Letter_Sent'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GDPR_Letter_Signed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Payment_Terms'
        ParamType = ptUnknown
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
        DataType = ftString
        Name = 'Account_Code'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
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
      end
      item
        DataType = ftUnknown
        Name = 'Is_Main_Rep'
        ParamType = ptUnknown
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
        Name = 'Mobile_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ExportFilter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Salutation'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
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
        Name = 'Mobile_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ExportFilter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Salutation'
        ParamType = ptUnknown
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
        DataType = ftString
        Name = 'Account_Code'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
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
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep_Is_Sub_Rep'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Data_Import_Directory'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Date_Entered'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Last_Payment_Update'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email'
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Account_Code'
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
        Name = 'Branch_No'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mobile_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Salutation'
        ParamType = ptUnknown
      end
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
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
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Head_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Order_no'
        ParamType = ptUnknown
      end
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
        Name = 'Supplier_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Suppliers_Desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customers_Desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Order_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Selling_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'List_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Printed_PO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Order_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supp_Inv_Recd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Supp_Inv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Reqd_by_Customer'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_To_Deliver'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No0'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Updated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_of_Boxes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_To_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Reqd_by_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end
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
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
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
        Name = 'Sales_Invoice_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_to_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_To_Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Or_Credit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Currency_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cash_Sales'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Electronic_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Order_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_status'
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
        Name = 'Sales_Invoice_Type'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
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
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nominal'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Supplier_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end
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
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supp_Invoice_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supp_Inv_Alt_Ref'
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
        Name = 'Supplier_Invoice_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Or_Credit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Value_Diff'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Value_Diff'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Currency_Code'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Supplier_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
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
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supp_Invoice_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nominal'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Invoice_No'
        ParamType = ptUnknown
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
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Paid_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email'
        ParamType = ptUnknown
      end
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
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mobile_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Salutation'
        ParamType = ptUnknown
      end
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Vat_Ref'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Number_of_Days'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Short_Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit_Factor'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Last_Job_Bag_Number'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Descr'
        ParamType = ptUnknown
      end
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
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Order_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Job_bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_bag_line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_bag_line_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_line_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_line_Sell'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Selling_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sequence_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ready_to_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_line_Sell'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Description_Reference'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nominal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end>
  end
end
