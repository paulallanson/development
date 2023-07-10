object dmAccExport: TdmAccExport
  OldCreateOrder = False
  Left = 231
  Top = 109
  Height = 503
  Width = 968
  object InvCustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select distinct'#9'customer_branch.*,'
      '        Customer.Name as Customer_Name,'
      '        Customer.Currency_Code_def,'
      '        Customer.Intrastat_id,'
      #9'      Customer_Status_Descr,'
      '        Customer_Type.Description as Customer_Type_Descr,'
      #9'      VAT_Reference,'
      '        Settlement_Discount,'
      '        Settlement_Days,'
      '        Credit_Limit,'
      '        (SELECT Payment_Terms_Description'
      '         FROM Payment_Terms'
      
        '         WHERE Payment_Terms.Payment_Terms = Customer.Payment_Te' +
        'rms) as Payment_Terms_Description,'
      '        (select top 1 Name'
      '         from Reps_Branches, Rep'
      '         where ('
      
        '              (Reps_Branches.customer = customer_branch.customer' +
        ') and'
      
        '     '#9#9'      (Reps_Branches.branch_no = customer_branch.branch_n' +
        'o)'
      '              ) and'
      '              (Reps_Branches.Rep = Rep.Rep)'
      '              ) as Rep_Name,'
      '        (select Name'
      '         from Customer_contact'
      '         where '#9'('
      
        '         '#9#9#9'(customer_contact.customer = customer_branch.Inv_to_' +
        'customer) and'
      
        '     '#9#9#9#9'(customer_contact.branch_no = customer_branch.Inv_to_br' +
        'anch) and'
      
        '     '#9#9#9#9'(customer_contact.Contact_no = customer_branch.Inv_to_C' +
        'ontact)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name,'
      '        (select Email'
      '         from Customer_contact'
      '         where '#9'('
      
        '         '#9#9#9'(customer_contact.customer = customer_branch.Inv_to_' +
        'customer) and'
      
        '     '#9#9#9#9'(customer_contact.branch_no = customer_branch.Inv_to_br' +
        'anch) and'
      
        '     '#9#9#9#9'(customer_contact.Contact_no = customer_branch.Inv_to_C' +
        'ontact)'
      '     '#9#9#9#9')'
      '         ) as Accounts_Contact_Email'
      
        'from Sales_Invoice, Customer, Customer_Branch, Customer_Status, ' +
        'Customer_type'
      'where'
      #9#9'  (Sales_Invoice.Sales_Invoice_Status = 25) and'
      '     ('
      '    (Customer_Branch.Account_Code_on_Ledger = '#39'I'#39') or'
      '    (Customer_Branch.Account_Code_on_Ledger = '#39'Y'#39')'
      '     ) and'
      '     ('
      
        '     (Sales_Invoice.Inv_To_Customer = Customer_Branch.Customer) ' +
        'and'
      '     (Sales_Invoice.Inv_To_Branch = Customer_Branch.Branch_no)'
      '     ) and'
      '     (customer_branch.customer = customer.customer) and'
      
        #9'(Customer_Status.Customer_Status = Customer.Customer_Status) an' +
        'd'
      '  (Customer_type.customer_type = Customer.Customer_type)'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 248
    Top = 176
  end
  object SalesInvNarrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Narrative_line'
      'where Narrative = :Narrative'
      'order by Narrative, Narrative_line')
    Left = 24
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object SalesInvAddSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '
      'sales_inv_line_add_chg.Additional_Charge, '
      'sales_inv_line_add_chg.Sales_Invoice, '
      'sales_inv_line_add_chg.Invoice_Line_No, '
      'sales_inv_line_add_chg.Details,'
      'sales_inv_line_add_chg.Nominal, '
      'sales_inv_line_add_chg.Amount, '
      'sales_inv_line_add_chg.Quotation_Price, '
      'sales_inv_line_add_chg.Vat_Code, '
      'Vat_Code.Vat_Rate'
      'FROM sales_inv_line_add_chg '
      'LEFT JOIN Vat_Code ON '
      'sales_inv_line_add_chg.Vat_Code = Vat_Code.Vat_Code'
      'where Sales_Invoice = :Sales_Invoice and'
      'Invoice_Line_No = :Invoice_Line_No'
      '')
    Left = 24
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Line_No'
        ParamType = ptUnknown
      end>
  end
  object customerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'customer_branch.*,'
      '        Customer.Name as Customer_Name,'
      '        Customer.Currency_Code_def,'
      '        Customer.Intrastat_id,'
      #9'      Customer_Status_Descr,'
      '        Customer_Type.Description as Customer_Type_Descr,'
      #9'      VAT_Reference,'
      '        Settlement_Discount,'
      '        Settlement_Days,'
      '        Credit_Limit,'
      '        (SELECT Payment_Terms_Description'
      '         FROM Payment_Terms'
      
        '         WHERE Payment_Terms.Payment_Terms = Customer.Payment_Te' +
        'rms) as Payment_Terms_Description,'
      '        (select top 1 Name'
      '         from Reps_Branches, Rep'
      '         where ('
      
        '              (Reps_Branches.customer = customer_branch.customer' +
        ') and'
      
        '     '#9#9'      (Reps_Branches.branch_no = customer_branch.branch_n' +
        'o)'
      '              ) and'
      '              (Reps_Branches.Rep = Rep.Rep)'
      '              ) as Rep_Name,'
      '        (select Name'
      '         from Customer_contact'
      '         where '#9'('
      
        '         '#9#9#9'(customer_contact.customer = customer_branch.Inv_to_' +
        'customer) and'
      
        '     '#9#9#9#9'(customer_contact.branch_no = customer_branch.Inv_to_br' +
        'anch) and'
      
        '     '#9#9#9#9'(customer_contact.Contact_no = customer_branch.Inv_to_C' +
        'ontact)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name,'
      '        (select Email'
      '         from Customer_contact'
      '         where '#9'('
      
        '         '#9#9#9'(customer_contact.customer = customer_branch.Inv_to_' +
        'customer) and'
      
        '     '#9#9#9#9'(customer_contact.branch_no = customer_branch.Inv_to_br' +
        'anch) and'
      
        '     '#9#9#9#9'(customer_contact.Contact_no = customer_branch.Inv_to_C' +
        'ontact)'
      '     '#9#9#9#9')'
      '         ) as Accounts_Contact_Email'
      'from customer_branch,'
      #9#9'customer, Customer_Status, Customer_Type'
      'where'
      #9#9'(customer_branch.account_code is not null) and'
      '     (customer.acc_active = '#39'Y'#39') and'
      '     ('
      '      Customer.Customer_Status = 100'
      '     ) and'
      #9#9'(customer_branch.customer = customer.customer) and'
      
        #9'(Customer_Status.Customer_Status = Customer.Customer_Status) an' +
        'd'
      '  (Customer_Type.Customer_Type = Customer.Customer_Type)'
      '')
    Left = 24
    Top = 16
  end
  object SupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'supplier_branch.*,'
      '        supplier.Name as supplier_Name,'
      '        supplier.Currency_Code_def,'
      '        supplier.Intrastat_id,'
      #9'      VAT_Reference,'
      '        (select top 1 Name'
      '         from supplier_branchcontacts'
      '         where '#9'('
      
        '         '#9#9#9'(supplier_branchcontacts.supplier = supplier_branch.' +
        'supplier) and'
      
        '     '#9#9#9#9'(supplier_branchcontacts.branch_no = supplier_branch.br' +
        'anch_no)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name'
      'from supplier_branch,'
      #9#9'supplier'
      'where'
      #9#9'(supplier_branch.account_code is not null) and'
      '    (supplier.acc_active = '#39'Y'#39') and'
      #9#9'(supplier_branch.supplier = supplier.supplier)'
      ''
      ' ')
    Left = 24
    Top = 64
  end
  object UpCompanyAccSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update company'
      'set '#9'Last_File_No_Acc = :Last_File_No_Acc')
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_File_No_Acc'
        ParamType = ptUnknown
      end>
  end
  object CompanySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Company.*, Accounts_Package.Accounts_Package_Description '
      'from Company, Accounts_Package'
      
        'where Company.Accounts_package = Accounts_Package.Accounts_Packa' +
        'ge')
    Left = 24
    Top = 120
  end
  object oldPurchaseInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'Supplier_Invoice.Vat_Value as Total_Vat_Value,'
      '        Supplier_Invoice.Goods_Value as Total_Goods_Value,'
      '        Supplier_Invoice.Invoice_Date,'
      '        Supplier_Invoice.Supplier_Invoice_no,'
      '        Supplier_Invoice.Currency_Code,'
      '        Supplier_Invoice.Supp_Inv_Alt_Ref,'
      #9#9#9'Supplier_Invoice_Line.*,'
      '        VAT_Code.VAT_Ref,'
      '        VAT_Code.VAT_Rate,'
      '        Purchase_OrderLine.Suppliers_Desc as Description,'
      '        Supplier_Branch.Account_Code,'
      '        Price_Unit.Price_Unit_Factor'
      
        'from Supplier_Invoice, Supplier_Invoice_Line, VAT_Code, Purchase' +
        '_OrderLine,'
      #9#9'Supplier_Branch, Price_Unit'
      'where '#9'(Supplier_Invoice.Supp_Invoice_Status = 25) and'
      
        #9#9#9'(Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Line.Su' +
        'pplier_Invoice) and'
      '        (Supplier_Invoice_Line.VAT_Code = VAT_Code.Vat_Code) and'
      '        ('
      
        '        (Supplier_Invoice_Line.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_order) and'
      '        (Supplier_Invoice_Line.Line = Purchase_OrderLine.Line)'
      '        ) and'
      '        ('
      
        '        (Supplier_Invoice.Supplier = Supplier_Branch.Supplier) a' +
        'nd'
      '        (Supplier_Invoice.Branch_no = Supplier_Branch.Branch_no)'
      '        ) and'
      
        '        (Supplier_Invoice_Line.Price_Unit = Price_Unit.Price_Uni' +
        't)'
      'order by Supplier_Invoice_Line.Supplier_Invoice, Invoice_Line_no'
      ' '
      ' '
      ' ')
    Left = 272
    Top = 8
  end
  object UpSupplierInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Supplier_Invoice_Line'
      'set Supp_invoice_Status = :Status_To'
      'where (Supplier_Invoice_line.Supp_Invoice_Status = :Status_From)')
    Left = 320
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_From'
        ParamType = ptUnknown
      end>
  end
  object UpCustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Customer_Branch'
      'set Account_Code_on_Ledger = :Status_To'
      'where'
      '     ('
      '     (customer_branch.Account_Code_on_Ledger = :Status_From)'
      '     )')
    Left = 104
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_From'
        ParamType = ptUnknown
      end>
  end
  object POCustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select customer_branch.*,'
      '        Customer.Name as Customer_Name,'
      '        Customer.Currency_Code_def,'
      '        Customer.Intrastat_id,'
      #9'      Customer_Status_Descr,'
      #9'      VAT_Reference,'
      '        Settlement_Discount,'
      '        Settlement_Days,'
      '        Credit_Limit,'
      '        (select top 1 Name'
      '         from Reps_Branches, Rep'
      '         where ('
      
        '              (Reps_Branches.customer = customer_branch.customer' +
        ') and'
      
        '     '#9#9'      (Reps_Branches.branch_no = customer_branch.branch_n' +
        'o)'
      '              ) and'
      '              (Reps_Branches.Rep = Rep.Rep)'
      '              ) as Rep_Name,'
      '        (select Name'
      '         from Customer_contact'
      '         where '#9'('
      
        '         '#9#9#9'(customer_contact.customer = customer_branch.Inv_to_' +
        'customer) and'
      
        '     '#9#9#9#9'(customer_contact.branch_no = customer_branch.Inv_to_br' +
        'anch) and'
      
        '     '#9#9#9#9'(customer_contact.Contact_no = customer_branch.Inv_to_C' +
        'ontact)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name,'
      '        (select Email'
      '         from Customer_contact'
      '         where '#9'('
      
        '         '#9#9#9'(customer_contact.customer = customer_branch.Inv_to_' +
        'customer) and'
      
        '     '#9#9#9#9'(customer_contact.branch_no = customer_branch.Inv_to_br' +
        'anch) and'
      
        '     '#9#9#9#9'(customer_contact.Contact_no = customer_branch.Inv_to_C' +
        'ontact)'
      '     '#9#9#9#9')'
      '         ) as Accounts_Contact_Email'
      
        'from Purchase_OrderLine, Customer_Branch, Customer, Customer_Sta' +
        'tus'
      'where '#9'(Purchase_OrderLine.Purch_Ord_Line_status = 10) and'
      #9#9#9'('
      
        '        (Purchase_OrderLine.Customer = Customer_Branch.Customer)' +
        ' and'
      
        '        (Purchase_OrderLine.Branch_no = Customer_Branch.Branch_n' +
        'o)'
      '        ) and'
      '        (Purchase_OrderLine.Customer = Customer.Customer) and'
      '        ('
      '        (Customer_Branch.Account_Code_on_Ledger = '#39'P'#39') '
      '        ) and'
      
        #9'      (Customer_Status.Customer_Status = Customer.Customer_Stat' +
        'us)'
      '')
    Left = 248
    Top = 120
  end
  object POSupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'supplier_branch.*,'
      '        supplier.Name as supplier_Name,'
      '        supplier.Currency_Code_def,'
      '        supplier.Intrastat_id,'
      #9'      VAT_Reference,'
      '        (select top 1 Name'
      '         from supplier_branchcontacts'
      '         where '#9'('
      
        '         '#9#9#9'(supplier_branchcontacts.supplier = supplier_branch.' +
        'supplier) and'
      
        '     '#9#9#9#9'(supplier_branchcontacts.branch_no = supplier_branch.br' +
        'anch_no)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name'
      'from Purchase_Order, Supplier_Branch, Supplier'
      'where '#9'(Purchase_Order.Purch_Ord_Head_Status = 10) and'
      #9#9#9'('
      '        (Purchase_Order.Supplier = Supplier_Branch.Supplier) and'
      '        (Purchase_Order.Branch_no = Supplier_Branch.Branch_no)'
      '        ) and'
      '        (Purchase_Order.Supplier = Supplier.Supplier) and'
      '        ('
      #9#9#9'(Supplier_Branch.Account_Code_on_Ledger = '#39'P'#39')'
      '        )'
      ' ')
    Left = 248
    Top = 72
  end
  object UpSupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Supplier_Branch'
      'set Account_Code_on_Ledger = :Status_To'
      'where'
      '     ('
      '     (Supplier_branch.Account_Code_on_Ledger = :Status_From) '
      '     )')
    Left = 104
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_From'
        ParamType = ptUnknown
      end>
  end
  object UpSalesInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Sales_invoice_Line'
      'set Sales_Invoice_Line.Sales_Invoice_Status = :Status_To'
      'where'
      '(Sales_Invoice_Line.Sales_Invoice_Status = :Status_From) and'
      '(((Select Sales_invoice.Inactive'
      'from Sales_invoice'
      
        'where (Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_In' +
        'voice)) is null) or'
      '((Select Sales_invoice.Inactive'
      'from Sales_invoice'
      
        'where (Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_In' +
        'voice))<>'#39'Y'#39'))')
    Left = 176
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_From'
        ParamType = ptUnknown
      end>
  end
  object SalesInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sales_Invoice_Line.Sales_Invoice, '
      #9'Sales_Invoice_Line.Invoice_Line_No, '
      #9'Sales_Invoice_Line.Purchase_Order, '
      #9'Sales_Invoice_Line.Line, '
      #9'Sales_Invoice_Line.Sales_Order, '
      #9'Sales_Invoice_Line.Sales_Order_Line_no, '
      #9'Sales_Invoice_Line.Job_Bag, '
      #9'Sales_Invoice_Line.Job_Bag_Line, '
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Sales_Invoice_Line.Goods_Value, '
      #9'Sales_Invoice_Line.Vat_Code, '
      #9'Sales_Invoice_Line.Vat_Value, '
      #9'Sales_Invoice_Line.Product_Type, '
      #9'Sales_Invoice_Line.Price_Unit, '
      #9'Sales_Invoice_Line.Nominal, '
      #9'Sales_Invoice_Line.Narrative,'
      '  Sales_invoice_Line.Credit_type, '
      #9'Vat_Code.Vat_Rate, '
      #9'Vat_Code.VAT_Ref,'
      #9'Vat_Code.Description as Vat_Description,'
      #9'Vat_Code.Sales_Ledger_Description,'
      #9'Price_Unit.Price_Unit_Factor,'
      #9'Price_Unit.Description as Price_Unit_Description,'
      #9'Customer_Branch.Building_No_name,'
      #9'Customer_Branch.Street, '
      #9'Customer_Branch.Locale, '
      #9'Customer_Branch.Town, '
      #9'Customer_Branch.Postcode, '
      #9'Customer_Branch.Account_Code, '
      #9'Customer.Name, '
      '  Customer.Payment_Terms,'
      #9'Sales_Invoice.Inv_to_Customer, '
      #9'Sales_Invoice.Inv_to_Branch, '
      #9'Sales_Invoice.Vat_Value AS Total_Vat_Value, '
      #9'Sales_Invoice.Goods_Value AS Total_Goods_Value, '
      #9'Sales_Invoice.Invoice_Date, '
      #9'Sales_Invoice.Sales_Invoice_No, '
      #9'Sales_Invoice.Currency_Code, '
      #9'Sales_Invoice.Invoice_or_Credit,'
      #9'Sales_invoice.Invoice_Description as Description,'
      '  Sales_invoice.Sales_invoice_type,'
      '  Sales_invoice.Reference,'
      '  Sales_invoice.Cash_Sales,'
      '  Sales_invoice.Category,'
      '  Sales_invoice.Cust_Order_No'
      'FROM Vat_Code '
      #9'INNER JOIN (Customer '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN ((Customer_Branch '
      #9'INNER JOIN Sales_Invoice ON '
      
        #9#9'(Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) AND' +
        ' '
      #9#9'(Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch)) '
      #9'INNER JOIN Sales_Invoice_Line ON '
      
        #9#9'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice' +
        ') ON '
      #9#9'Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) ON '
      #9#9'Customer.Customer = Customer_Branch.Customer) ON '
      #9#9'Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code'
      'WHERE (((Sales_Invoice.Sales_Invoice_Status)=25) AND '
      #9'((Sales_Invoice.Inactive) Is Null))'
      'ORDER BY Sales_Invoice_Line.Sales_Invoice, '
      '                    Sales_Invoice_Line.Invoice_Line_No')
    Left = 24
    Top = 280
  end
  object CustPendingSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer_Branch.Name'
      'from Customer_Branch'
      'where Account_Code_on_Ledger = '#39'U'#39)
    Left = 176
    Top = 16
  end
  object UpInvCustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Customer_Branch'
      'set Account_Code_on_Ledger = '#39'I'#39
      'where'
      '(Customer_Branch.Account_Code_on_Ledger <> '#39'Y'#39') and'
      '(Customer_Branch.Account_Code is not null) and'
      '('
      '(Customer_Branch.Customer in'
      '    '#9'(select Sales_Invoice.Inv_To_Customer '
      #9'    from Sales_Invoice'
      #9'    where'
      #9'    (Sales_Invoice.Sales_Invoice_Status = 20))) and'
      '(Customer_Branch.Branch_no in'
      '    '#9'(select Sales_Invoice.Inv_To_Branch '
      #9'    from Sales_Invoice'
      #9'    where'
      #9'    (Sales_Invoice.Sales_Invoice_Status = 20)))'
      ')'
      ' ')
    Left = 320
    Top = 176
  end
  object UpSalesInvHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Sales_Invoice_Status = :Status_To'
      'where (Sales_Invoice.Sales_Invoice_Status = :Status_From) and'
      '(Inactive is null) and'
      '(((Cash_Sales is null) or (Cash_Sales = '#39'N'#39')) or'
      '((Cash_Sales = '#39'Y'#39') and (Paid_Status = '#39'Y'#39')))')
    Left = 176
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_From'
        ParamType = ptUnknown
      end>
  end
  object SuppPendingSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Supplier_Branch.Name'
      'from Supplier_Branch'
      'where Account_Code_on_Ledger = '#39'U'#39)
    Left = 176
    Top = 64
  end
  object SalesPendingSQl: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_invoice'
      'from Sales_invoice'
      'where Sales_invoice_Status = 25')
    Left = 320
    Top = 280
  end
  object UpSupplierInvHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Supplier_Invoice'
      'set Supp_invoice_Status = :Status_To'
      'where (Supplier_Invoice.Supp_Invoice_Status = :Status_From)'
      '')
    Left = 400
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_From'
        ParamType = ptUnknown
      end>
  end
  object UpInvSupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Supplier_Branch'
      'set Account_Code_on_Ledger = '#39'O'#39
      'where'
      '(Supplier_Branch.Account_Code_on_Ledger <> '#39'Y'#39') and'
      '(Supplier_Branch.Account_Code is not null) and'
      '('
      '(Supplier_Branch.Supplier in'
      '    '#9'(select Supplier_Invoice.Supplier'
      #9'    from Supplier_Invoice'
      #9'    where'
      #9'    (Supplier_Invoice.Supp_Invoice_Status = 20))) and'
      '(Supplier_Branch.Branch_no in'
      '    '#9'(select Supplier_Invoice.Branch_no'
      #9'    from Supplier_Invoice'
      #9'    where'
      #9'    (Supplier_Invoice.Supp_Invoice_Status = 20)))'
      ')'
      ' ')
    Left = 320
    Top = 224
  end
  object PurchPendingSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Supplier_invoice'
      'from Supplier_invoice'
      'where Supp_invoice_Status = 25')
    Left = 400
    Top = 64
  end
  object UpPOCustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Customer_Branch'
      'set Account_Code_on_Ledger = '#39'P'#39
      'where'
      '(Customer_Branch.Account_Code_on_Ledger <> '#39'Y'#39') and'
      '(Customer_Branch.Account_Code is not null) and'
      '('
      '(Customer_Branch.Customer in'
      '    '#9'(select Purchase_OrderLine.Customer '
      #9'    from Purchase_OrderLine'
      #9'    where'
      #9'    (Purchase_OrderLine.Purch_Ord_Line_status = 10))) and'
      '(Customer_Branch.Branch_no in'
      '    '#9'(select Purchase_OrderLine.Branch_no '
      #9'    from Purchase_OrderLine'
      #9'    where'
      #9'    (Purchase_OrderLine.Purch_Ord_Line_status = 10)))'
      ')')
    Left = 336
    Top = 120
  end
  object UpPOSupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Supplier_Branch'
      'set Account_Code_on_Ledger = '#39'P'#39
      'where'
      '(Supplier_Branch.Account_Code_on_Ledger <> '#39'Y'#39') and'
      '(Supplier_Branch.Account_Code is not null) and'
      '('
      '(Supplier_Branch.Supplier in'
      '    '#9'(select Purchase_Order.Supplier '
      #9'    from Purchase_Order'
      #9'    where'
      #9'    (Purchase_Order.Purch_Ord_Head_status = 10))) and'
      '(Supplier_Branch.Branch_no in'
      '    '#9'(select Purchase_Order.Branch_no '
      #9'    from Purchase_Order'
      #9'    where'
      #9'    (Purchase_Order.Purch_Ord_Head_status = 10)))'
      ')')
    Left = 320
    Top = 72
  end
  object BranchSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'Customer,'
      #9#9#9'Branch_no'
      'from Customer_Branch'
      'where '#9'Account_Code = :Account_Code')
    Left = 424
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end>
  end
  object UpStockSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Form_Reference ('#9'Customer,'
      #9#9#9#9#9#9#9#9#9#9'Branch_no,'
      #9#9#9#9#9#9#9#9#9#9'Form_Reference,'
      '                          '#9'Form_Reference_descr,'
      '                             Form_Reference_ID, '
      '                           Stocked_item)'
      'values (:Customer,'
      #9#9#9':Branch_no,'
      '        :Form_Reference,'
      '        :Form_Reference_Descr,'
      '        :Form_Reference_ID,'
      '        '#39'Y'#39')')
    Left = 104
    Top = 16
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
        Name = 'Form_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Form_Reference_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Form_Reference_ID'
        ParamType = ptUnknown
      end>
  end
  object UpCurrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into currency_code (currency_code,'
      #9#9#9#9#9#9#9#9#9'currency_code_Descr,'
      '                          currency_symbol,'
      '                          currency_rate)'
      'values (:Code,'
      #9#9#9':Description,'
      '        :symbol,'
      '        :rate)')
    Left = 480
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'symbol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rate'
        ParamType = ptUnknown
      end>
  end
  object CurrencySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select currency_code'
      'from currency_code'
      'where currency_code = :Code')
    Left = 424
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Code'
        ParamType = ptUnknown
      end>
  end
  object UpCustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Customer'
      'set Credit_Limit = :Credit_Limit,'
      #9#9'Available_Credit = :Available_Credit,'
      '     Credit_Status = :Credit_Status,'
      '     Intrastat_ID = :Intrastat_ID'
      'where Customer = :Customer')
    Left = 360
    Top = 16
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
        Name = 'Credit_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Intrastat_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object StockSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Form_Reference'
      'from form_Reference'
      'where '#9'Form_Reference_ID = :Form_Reference_ID And'
      #9#9#9'Customer = :Customer and'
      '        Branch_no = :Branch_no')
    Left = 472
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Form_Reference_ID'
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
  object MaxStockSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(Form_Reference) as Last_Reference'
      'from Form_Reference')
    Left = 424
    Top = 240
  end
  object UpCompanyInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update company'
      'set '#9'Last_File_No_Inv = :Last_File_No_Inv')
    Left = 104
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_File_No_Inv'
        ParamType = ptUnknown
      end>
  end
  object UpCompanySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update company'
      'set '#9'Last_File_No_Acc = :Last_File_No_Acc,'
      '                Last_File_No_Inv = :Last_File_No_Inv')
    Left = 104
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_File_No_Acc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Last_File_No_Inv'
        ParamType = ptUnknown
      end>
  end
  object PurchaseInvAddSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supp_Inv_Line_Add_Chg'
      'where Supplier_Invoice = :Supplier_Invoice and'
      'Invoice_Line_No = :Invoice_Line_No')
    Left = 424
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Line_No'
        ParamType = ptUnknown
      end>
  end
  object GetFormRefSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Form_Reference_ID, Form_Reference_Descr, Stocked_Item'
      'from Form_Reference'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Form_reference = :Form_Reference')
    Left = 24
    Top = 328
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
        Name = 'Form_Reference'
        ParamType = ptUnknown
      end>
  end
  object UpCompanyExpSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update company'
      'set data_export_directory = :data_export_directory'
      'where company = 1')
    Left = 104
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data_export_directory'
        ParamType = ptUnknown
      end>
  end
  object InvSupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select distinct'
      #9#9#9'supplier_branch.*,'
      '        supplier.Name as supplier_Name,'
      '        supplier.Currency_Code_def,'
      '        supplier.Intrastat_id,'
      #9'      VAT_Reference,'
      '        (select top 1 Name'
      '         from supplier_branchcontacts'
      '         where '#9'('
      
        '         '#9#9#9'(supplier_branchcontacts.supplier = supplier_branch.' +
        'supplier) and'
      
        '     '#9#9#9#9'(supplier_branchcontacts.branch_no = supplier_branch.br' +
        'anch_no)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name'
      'from Supplier_Invoice, supplier_branch,'
      #9#9'supplier'
      'where (Supplier_Invoice.Supp_Invoice_Status = 25) and'
      '     ('
      '     (Supplier_Invoice.Supplier = Supplier_Branch.Supplier) and'
      '     (Supplier_Invoice.Branch_no = Supplier_Branch.Branch_no)'
      '     ) and'
      #9#9'(supplier_branch.supplier = supplier.supplier)')
    Left = 248
    Top = 240
  end
  object qryDelSageInvs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Sage_Invoice_Import'
      'where Operator = :Operator')
    Left = 320
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryUpSageInvs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Sage_Invoice_Import'
      '(Operator,'
      'Invoice_no,'
      'Reference,'
      'Invoice_Date,'
      'Nominal,'
      'Account_Code,'
      'Description,'
      'Vat_Code,'
      'Vat_Ref,'
      'Vat_Value,'
      'Goods_Value,'
      'Transaction_Type,'
      'Department,'
      'Invoice_Code)'
      'values '
      '(:Operator,'
      ':Invoice_no,'
      ':Reference,'
      ':Invoice_Date,'
      ':Nominal,'
      ':Account_Code,'
      ':Description,'
      ':Vat_Code,'
      ':Vat_Ref,'
      ':Vat_Value,'
      ':Goods_Value,'
      ':Transaction_Type,'
      ':Department,'
      ':Invoice_Code)')
    Left = 240
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nominal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Transaction_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Department'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Code'
        ParamType = ptUnknown
      end>
  end
  object SalesInvChgsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Sales_Invoice_Add_Charge.*,'
      '        VAT_Code.VAT_Rate,'
      '        Vat_Code.Vat_Ref,'
      '        Vat_Code.Description as Vat_Description,'
      #9'      Vat_Code.Sales_Ledger_Description'
      'from Sales_Invoice_Add_Charge, VAT_Code'
      'where Sales_Invoice = :Sales_Invoice and'
      '(Sales_Invoice_Add_Charge.Vat_Code = VAT_Code.Vat_Code)')
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetSageImport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      '  Invoice_Date,'
      '  Reference,'
      '  Nominal,'
      '  Account_Code,'
      '  Description,'
      '  Vat_Code,'
      '  Vat_Ref,'
      '  Sum(Goods_Value) as Total_Goods_Value,'
      '  Sum(Vat_Value) as Total_Vat_Value,'
      '  Transaction_Type,'
      '  Department,'
      '  Invoice_Code'
      'from Sage_Invoice_Import'
      'WHERE Operator = :Operator'
      'Group by'
      '  Invoice_Date,'
      '  Reference,'
      '  Nominal,'
      '  Account_Code,'
      '  Description,'
      '  Vat_Code,'
      '  Vat_Ref,'
      '  Transaction_Type,'
      '  Department, '
      '  Invoice_Code'
      ''
      ' ')
    Left = 392
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object oldSalesInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Goods_Value,'
      '        Sales_Invoice_Line.Vat_Code,'
      '        Sales_Invoice_Line.Vat_Value,'
      '        Sales_Invoice_Line.Product_Type,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Sales_Invoice_Line.Nominal,'
      '        Sales_Invoice_Line.Narrative,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.VAT_Ref,'
      '        Purchase_OrderLine.Form_Reference,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Customers_Desc as Description,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name,'
      '        Sales_Invoice.Inv_to_Customer,'
      '        Sales_Invoice.Inv_to_Branch,'
      '        Sales_Invoice.Vat_Value as Total_Vat_Value,'
      '        Sales_Invoice.Goods_Value as Total_Goods_Value,'
      '        Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Sales_invoice_No,'
      '        Sales_Invoice.Currency_Code,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        (select Price_Unit_Factor from Price_Unit'
      
        '        '#9'where Price_unit.Price_Unit = Purchase_OrderLine.Order_' +
        'Unit) as Order_Unit_factor'
      'FROM (Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Vat_Code'
      '      INNER JOIN (Purchase_OrderLine'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN (Sales_Invoice'
      '      INNER JOIN Sales_Invoice_Line ON'
      
        '        Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_I' +
        'nvoice) ON'
      
        '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) O' +
        'N'
      '        (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.' +
        'Purchase_Order)) ON'
      '        Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code) ON'
      
        '        (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch' +
        ') AND'
      
        '        (Customer_Branch.Customer = Sales_Invoice.Inv_to_Custome' +
        'r)'
      'WHERE (((Sales_Invoice.Sales_Invoice_Status)=25)) and'
      '(sales_invoice_type is null) and'
      '(Sales_Invoice.Inactive is null) and'
      '(Sales_invoice.Goods_Value <> 0)'
      'ORDER BY'
      
        'Sales_Invoice_Line.Sales_Invoice, Sales_Invoice_Line.Invoice_Lin' +
        'e_No'
      ' ')
    Left = 192
    Top = 224
  end
  object oldUpSalesInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice_Line'
      'set Sales_Invoice_Line.Sales_Invoice_Status = :Status_To'
      'from Sales_invoice_Line, Sales_invoice'
      'where '
      
        '(Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice)' +
        ' and '
      '('
      
        '(Sales_Invoice.Inactive <> '#39'Y'#39') or (Sales_Invoice.Inactive is nu' +
        'll)'
      ') and'
      '(Sales_Invoice_Line.Sales_Invoice_Status = :Status_From)')
    Left = 176
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_From'
        ParamType = ptUnknown
      end>
  end
  object PurchaseInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'#9'Supplier_Invoice_Line.Supplier_Invoice, '
      #9#9'Supplier_Invoice_Line.Invoice_Line_No, '
      #9#9'Supplier_Invoice_Line.Purchase_Order, '
      #9#9'Supplier_Invoice_Line.Line, '
      #9#9'Supplier_Invoice_Line.Qty_Invoiced, '
      #9#9'Supplier_Invoice_Line.Goods_Value, '
      #9#9'Supplier_Invoice_Line.Vat_Value, '
      #9#9'Supplier_Invoice_Line.Vat_Code, '
      #9#9'Supplier_Invoice_Line.Delivery_Note_No, '
      #9#9'Supplier_Invoice_Line.Delivery_Date, '
      #9#9'Supplier_Invoice_Line.Supp_Invoice_Status, '
      #9#9'Supplier_Invoice_Line.Price_Unit, '
      #9#9'Supplier_Invoice_Line.Nominal, '
      #9#9'Supplier_Invoice_Line.Credit_Type, '
      #9#9'Supplier_Invoice.Supplier, '
      #9#9'Supplier_Invoice.Invoice_Date, '
      #9#9'Supplier_Invoice.Supplier_Invoice_no, '
      #9#9'Supplier_Invoice.Supp_Inv_Alt_Ref, '
      #9#9'Supplier_Invoice.Currency_Code, '
      #9#9'Supplier_Invoice.Goods_Value AS Total_Goods_Value, '
      #9#9'Supplier_Invoice.Vat_Value AS Total_Vat_Value, '
      #9#9'Supplier_Invoice.Invoice_or_Credit, '
      #9#9'Supplier_Invoice.Goods_Value_Diff, '
      #9#9'Supplier_Invoice.Vat_Value_Diff, '
      #9#9'Vat_Code.VAT_Ref, Vat_Code.Vat_Rate,'
      #9#9'Vat_Code.Description AS Vat_Description,'
      '    Vat_Code.Purchase_Ledger_Description,'
      #9#9'Supplier_Branch.Account_Code, '
      #9#9'Price_Unit.Description AS Price_Unit_Description, '
      #9#9'Price_Unit.Price_Unit_Factor, '
      #9#9'Supplier.Payment_Terms'
      'FROM Supplier '
      #9#9'INNER JOIN (Vat_Code '
      #9#9'INNER JOIN (Supplier_Branch '
      #9#9'INNER JOIN (Price_Unit '
      #9#9'INNER JOIN (Supplier_Invoice '
      #9#9'INNER JOIN Supplier_Invoice_Line '
      
        #9#9#9#9'ON Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Line' +
        '.Supplier_Invoice) '
      
        #9#9#9#9'ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit)' +
        ' '
      
        #9#9#9#9'ON (Supplier_Branch.Branch_no = Supplier_Invoice.Branch_no) ' +
        'AND (Supplier_Branch.Supplier = Supplier_Invoice.Supplier)) '
      #9#9#9#9'ON Vat_Code.Vat_Code = Supplier_Invoice_Line.Vat_Code) '
      #9#9#9#9'ON Supplier.Supplier = Supplier_Branch.Supplier'
      'WHERE (((Supplier_Invoice.Supp_Invoice_Status)=25))'
      
        'ORDER BY Supplier_Invoice_Line.Supplier_Invoice, Supplier_Invoic' +
        'e_Line.Invoice_Line_No')
    Left = 224
    Top = 16
  end
  object PurchaseInvChgsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Supplier_Invoice_Charge.*,'
      '        VAT_Code.VAT_Rate,'
      '        Vat_Code.Vat_Ref,'
      '        Vat_Code.Description as Vat_Description,'
      #9'      Vat_Code.Purchase_Ledger_Description'
      'from Supplier_Invoice_Charge, VAT_Code'
      'where Supplier_Invoice = :Supplier_Invoice and'
      '(Supplier_Invoice_Charge.Vat_Code = VAT_Code.Vat_Code)')
    Left = 176
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Goods_Value,'
      '        Vat_Value,'
      '        Customer.Name as Customer_Name,'
      '        Invoice_Description'
      'from sales_invoice, Customer'
      'where sales_invoice = :Sales_invoice and'
      'Sales_invoice.Inv_To_Customer = Customer.Customer')
    Left = 528
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetSupplierInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Goods_Value,'
      '        Vat_Value,'
      '        Goods_Value_Diff,'
      '        Vat_Value_diff,'
      '        Supp_Inv_Alt_Ref,'
      '        Supplier.Name as Supplier_Name'
      'from supplier_invoice, Supplier'
      'where supplier_invoice = :supplier_invoice and'
      'Supplier_invoice.Supplier = Supplier.Supplier')
    Left = 528
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier_invoice'
        ParamType = ptUnknown
      end>
  end
  object qryVATCode: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from VAT_Code'
      'where VAT_Code = :VAT_Code')
    Left = 528
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VAT_Code'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPendingSI: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'update sales_invoice'
      'set export_filename = :export_filename'
      'where sales_invoice_status = 25')
    Left = 560
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'export_filename'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPendingPI: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'update supplier_invoice'
      'set export_filename = :export_filename'
      'where supp_invoice_status = 25')
    Left = 560
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'export_filename'
        ParamType = ptUnknown
      end>
  end
  object DDPendingSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_invoice'
      'where Direct_Debit_Pending = '#39'Y'#39)
    Left = 32
    Top = 416
  end
  object DDResetSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Sales_invoice'
      
        'set Direct_Debit_Date = NULL, Direct_Debit_Filename = NULL, Dire' +
        'ct_Debit_PEnding = NULL'
      'where Direct_Debit_Pending = '#39'Y'#39)
    Left = 128
    Top = 416
  end
  object DDUpdateSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Sales_invoice'
      'set Direct_Debit_Pending = NULL'
      'where Direct_Debit_Pending = '#39'Y'#39)
    Left = 216
    Top = 416
  end
  object qryDelXeroInvs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Xero_Invoice_Import'
      'where Operator = :Operator')
    Left = 496
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryUpXeroInvs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Xero_Invoice_Import'
      '(Operator,'
      'Customer_Name,'
      'Invoice_no,'
      'Invoice_Date,'
      'Due_Date,'
      'Description,'
      'Reference,'
      'Quantity,'
      'Unit_Price,'
      'Nominal,'
      'Tax_Rate,'
      'Job_Number,'
      'Alt_Purchase_Order,'
      'Price_Unit_Quantity,'
      'Tax_Rate_Percentage,'
      'Total_Vat,'
      'Total_Goods,'
      'Total_Invoice)'
      'values'
      '(:Operator,'
      ':Customer_Name,'
      ':Invoice_no,'
      ':Invoice_Date,'
      ':Due_Date,'
      ':Description,'
      ':Reference,'
      ':Quantity,'
      ':Unit_Price,'
      ':Nominal,'
      ':Tax_Rate,'
      ':Job_Number,'
      ':Alt_Purchase_Order,'
      ':Price_Unit_Quantity,'
      ':Tax_Rate_Percentage,'
      ':Total_Vat,'
      ':Total_Goods,'
      ':Total_Invoice)'
      '')
    Left = 416
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Due_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Unit_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nominal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tax_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Alt_Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tax_Rate_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Goods'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetXeroImport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'
      'Customer_Name,'
      'Invoice_no,'
      'Invoice_Date,'
      'Due_Date,'
      'Description,'
      'Reference,'
      'Quantity,'
      'Unit_Price,'
      'Nominal,'
      'Tax_Rate,'
      'Job_Number,'
      'Alt_Purchase_Order,'
      'Price_Unit_Quantity,'
      'Tax_Rate_Percentage,'
      'Total_Vat,'
      'Total_Goods,'
      'Total_Invoice'
      'FROM Xero_Invoice_Import'
      'WHERE Operator = :Operator'
      '')
    Left = 568
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qrySOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Part.Part, '
      '          Part_Description, '
      '          Sales_order_line.Sell_Pack_Quantity, '
      '          Price_Unit'
      'from Sales_order_line, '
      '        Part'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no and'
      '(Sales_order_line.Part = Part.Part)')
    Left = 720
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryJBLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Descr'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 720
    Top = 127
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
  object qryPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_orderLine.Customers_Desc,'
      '        Purchase_orderLine.Alt_Purchase_Order,'
      '        Purchase_OrderLine.Cust_Order_no,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr'
      'FROM Form_Reference'
      '      RIGHT JOIN Purchase_orderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_orderLine.Form_' +
        'Reference'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line'
      ' ')
    Left = 720
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetPaymentTerms: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Payment_Terms'
      'WHERE Payment_Terms = :Payment_Terms')
    Left = 728
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Payment_Terms'
        ParamType = ptUnknown
      end>
  end
  object qryGetSupplier: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Name'
      'FROM Supplier'
      'WHERE Supplier = :Supplier')
    Left = 728
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryPOJBLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select TOP 1 Job_Bag'
      'from Job_Bag_Line_Dets'
      'where Purchase_Order = :Purchase_Order and'
      '      Line = :Line')
    Left = 792
    Top = 127
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
end
