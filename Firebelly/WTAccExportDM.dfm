object dmAccExport: TdmAccExport
  Height = 559
  Width = 814
  object SalesInvNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from Narrative_line'
      'where Narrative = :Narrative'
      'order by Narrative, Narrative_line')
    Left = 24
    Top = 224
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object SalesInvAddSQL: TFDQuery
    ConnectionName = 'wt'
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
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Invoice_Line_No'
      end>
  end
  object UpCompanyAccSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set '#9'Last_File_No_Acc = :Last_File_No_Acc')
    Left = 104
    Top = 128
    ParamData = <
      item
        Name = 'Last_File_No_Acc'
      end>
  end
  object oldPurchaseInvSQL: TFDQuery
    ConnectionName = 'wt'
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
    Left = 408
    Top = 8
  end
  object UpSupplierInvSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Supplier_Invoice_Line'
      'set Supp_invoice_Status = :Status_To'
      'where (Supplier_Invoice_line.Supp_Invoice_Status = :Status_From)')
    Left = 456
    Top = 16
    ParamData = <
      item
        Name = 'Status_To'
      end
      item
        Name = 'Status_From'
      end>
  end
  object UpCustomerSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Customer'
      'set Account_Code_on_Ledger = :Status_To'
      'where'
      '     ('
      '     (customer.Account_Code_on_Ledger = :Status_From)'
      '     )')
    Left = 104
    Top = 16
    ParamData = <
      item
        Name = 'Status_To'
      end
      item
        Name = 'Status_From'
      end>
  end
  object POCustomerSQL: TFDQuery
    ConnectionName = 'wt'
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
      '        (select top 1 Name'
      '         from Customer_contact'
      '         where '#9'('
      
        '         '#9#9#9'(customer_contact.customer = customer_branch.custome' +
        'r) and'
      
        '     '#9#9#9#9'(customer_contact.branch_no = customer_branch.branch_no' +
        ')'
      '     '#9#9#9#9')'
      '         ) as Contact_Name'
      
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
    Left = 384
    Top = 120
  end
  object POSupplierSQL: TFDQuery
    ConnectionName = 'wt'
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
    Left = 384
    Top = 72
  end
  object UpSupplierSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Supplier'
      'set Account_Code_on_Ledger = :Status_To'
      'where'
      '     ('
      '     (Supplier_branch.Account_Code_on_Ledger = :Status_From) '
      '     )')
    Left = 104
    Top = 64
    ParamData = <
      item
        Name = 'Status_To'
      end
      item
        Name = 'Status_From'
      end>
  end
  object UpSalesInvHeadSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Sales_Invoice_Status = :Status_To'
      'where (Sales_Invoice.Sales_Invoice_Status = :Status_From) and'
      '(Inactive is null)')
    Left = 232
    Top = 272
    ParamData = <
      item
        Name = 'Status_To'
      end
      item
        Name = 'Status_From'
      end>
  end
  object UpSupplierInvHeadSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Supplier_Invoice'
      'set Supp_invoice_Status = :Status_To'
      'where (Supplier_Invoice.Supp_Invoice_Status = :Status_From)'
      '')
    Left = 536
    Top = 16
    ParamData = <
      item
        Name = 'Status_To'
      end
      item
        Name = 'Status_From'
      end>
  end
  object UpInvSupplierSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Supplier'
      'set Account_Code_on_Ledger = '#39'I'#39
      'where'
      '(Supplier.Account_Code_on_Ledger <> '#39'Y'#39') and'
      '(Supplier.Account_Code is not null) and'
      '('
      '(Supplier.Supplier in'
      '    '#9'(select Supplier_Invoice.Supplier'
      #9'    from Supplier_Invoice'
      #9'    where'
      #9'    (Supplier_Invoice.Supplier_Invoice_Status = 20)))'
      ')'
      ' ')
    Left = 456
    Top = 224
  end
  object UpPOCustomerSQL: TFDQuery
    ConnectionName = 'wt'
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
    Left = 472
    Top = 120
  end
  object UpPOSupplierSQL: TFDQuery
    ConnectionName = 'wt'
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
    Left = 456
    Top = 72
  end
  object BranchSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select '#9'Customer,'
      #9#9#9'Branch_no'
      'from Customer_Branch'
      'where '#9'Account_Code = :Account_Code')
    Left = 560
    Top = 184
    ParamData = <
      item
        Name = 'Account_Code'
      end>
  end
  object UpStockSQL: TFDQuery
    ConnectionName = 'wt'
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
    Left = 168
    Top = 24
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Form_Reference'
      end
      item
        Name = 'Form_Reference_Descr'
      end
      item
        Name = 'Form_Reference_ID'
      end>
  end
  object UpCurrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into currency_code (currency_code,'
      #9#9#9#9#9#9#9#9#9'currency_code_Descr,'
      '                          currency_symbol,'
      '                          currency_rate)'
      'values (:Code,'
      #9#9#9':Description,'
      '        :symbol,'
      '        :rate)')
    Left = 616
    Top = 296
    ParamData = <
      item
        Name = 'Code'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'symbol'
      end
      item
        Name = 'rate'
      end>
  end
  object CurrencySQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select currency_code'
      'from currency_code'
      'where currency_code = :Code')
    Left = 560
    Top = 296
    ParamData = <
      item
        Name = 'Code'
      end>
  end
  object UpCustSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Customer'
      'set Credit_Limit = :Credit_Limit,'
      #9#9'Available_Credit = :Available_Credit,'
      '     Credit_Status = :Credit_Status,'
      '     Intrastat_ID = :Intrastat_ID'
      'where Customer = :Customer')
    Left = 496
    Top = 16
    ParamData = <
      item
        Name = 'Credit_Limit'
      end
      item
        Name = 'Available_Credit'
      end
      item
        Name = 'Credit_Status'
      end
      item
        Name = 'Intrastat_ID'
      end
      item
        Name = 'Customer'
      end>
  end
  object StockSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Form_Reference'
      'from form_Reference'
      'where '#9'Form_Reference_ID = :Form_Reference_ID And'
      #9#9#9'Customer = :Customer and'
      '        Branch_no = :Branch_no')
    Left = 608
    Top = 184
    ParamData = <
      item
        Name = 'Form_Reference_ID'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object MaxStockSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select max(Form_Reference) as Last_Reference'
      'from Form_Reference')
    Left = 560
    Top = 240
  end
  object UpCompanyInvSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set '#9'Last_File_No_Inv = :Last_File_No_Inv')
    Left = 104
    Top = 176
    ParamData = <
      item
        Name = 'Last_File_No_Inv'
      end>
  end
  object UpCompanySQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set '#9'Last_File_No_Acc = :Last_File_No_Acc,'
      '                Last_File_No_Inv = :Last_File_No_Inv')
    Left = 104
    Top = 224
    ParamData = <
      item
        Name = 'Last_File_No_Acc'
      end
      item
        Name = 'Last_File_No_Inv'
      end>
  end
  object PurchaseInvAddSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Supp_Inv_Line_Add_Chg'
      'where Supplier_Invoice = :Supplier_Invoice and'
      'Invoice_Line_No = :Invoice_Line_No')
    Left = 560
    Top = 120
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end
      item
        Name = 'Invoice_Line_No'
      end>
  end
  object GetFormRefSQL: TFDQuery
    ConnectionName = 'wt'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Form_Reference'
      end>
  end
  object UpCompanyExpSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set data_export_directory = :data_export_directory'
      'where company = 1')
    Left = 104
    Top = 328
    ParamData = <
      item
        Name = 'data_export_directory'
      end>
  end
  object InvSupplierSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select distinct'#9'Supplier.*,'
      #9'      '#39#39' as VAT_Reference,'
      '        0 as Settlement_Discount,'
      '        0 as Settlement_Days,'
      '        (select top 1 Rep_Name'
      '         from Rep'
      '         where (Supplier.Rep = Rep.Rep)'
      '              ) as Rep_Name,'
      '        (select top 1 Contact_Name'
      '         from Supplier_contact'
      '         where '#9'('
      '         '#9#9#9'(Supplier_contact.Supplier = Supplier.Supplier)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name'
      'from Supplier_Invoice, Supplier'
      'where'
      #9#9'  (Supplier_Invoice.Supplier_Invoice_Status = 25) and'
      '     ('
      '     (Supplier_Invoice.Supplier = Supplier.Supplier)'
      '     )'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 384
    Top = 240
  end
  object qryDelSageInvs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Sage_Invoice_Import'
      'where Operator = :Operator')
    Left = 456
    Top = 336
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryUpSageInvs: TFDQuery
    ConnectionName = 'wt'
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
      ':Vat_Value,'
      ':Goods_Value,'
      ':Transaction_Type,'
      ':Department,'
      ':Invoice_Code)')
    Left = 376
    Top = 336
    ParamData = <
      item
        Name = 'Operator'
      end
      item
        Name = 'Invoice_no'
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Vat_Value'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'Transaction_Type'
      end
      item
        Name = 'Department'
      end
      item
        Name = 'Invoice_Code'
      end>
  end
  object SalesInvChgsSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice_Add_Charge.*, VAT_Code.VAT_Rate'
      'from Sales_Invoice_Add_Charge, VAT_Code'
      'where Sales_Invoice = :Sales_Invoice and'
      '(Sales_Invoice_Add_Charge.Vat_Code = VAT_Code.Vat_Code)')
    Left = 312
    Top = 176
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetSageImport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select'
      '  Invoice_Date,'
      '  Reference,'
      '  Nominal,'
      '  Account_Code,'
      '  Description,'
      '  Vat_Code,'
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
      '  Transaction_Type,'
      '  Department, '
      '  Invoice_Code'
      ''
      ' ')
    Left = 528
    Top = 344
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object PurchaseInvSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Supplier_Invoice_Line.Supplier_Invoice,'
      '        Supplier_Invoice_Line.Invoice_Line_No,'
      '        Supplier_Invoice_Line.Purchase_Order,'
      '        Supplier_Invoice_Line.Line,'
      '        Supplier_Invoice_Line.Qty_Invoiced,'
      '        Supplier_Invoice_Line.Goods_Value,'
      '        Supplier_Invoice_Line.Vat_Value,'
      '        Supplier_Invoice_Line.Vat_Code,'
      '        Supplier_Invoice_Line.Delivery_Note_No,'
      '        Supplier_Invoice_Line.Delivery_Date,'
      '        Supplier_Invoice_Line.Supp_Invoice_Status,'
      '        Supplier_Invoice_Line.Price_Unit,'
      '        Supplier_Invoice_Line.Nominal,'
      '        Supplier_Invoice_Line.Credit_Type,'
      '        Supplier_Invoice.Invoice_Date,'
      '        Supplier_Invoice.Supplier_Invoice_no,'
      '        Supplier_Invoice.Supp_Inv_Alt_Ref,'
      '        Supplier_Invoice.Currency_Code,'
      '        Supplier_Invoice.Goods_Value as Total_Goods_Value,'
      '        Supplier_Invoice.Vat_Value as Total_Vat_Value,'
      '        Supplier_invoice.Invoice_or_Credit,'
      '        Supplier_invoice.Goods_Value_Diff,'
      '        Supplier_invoice.Vat_Value_Diff,'
      '        Vat_Code.VAT_Ref,'
      '        Vat_Code.Vat_Rate,'
      '        Supplier_Branch.Account_Code,'
      '        Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit'
      '      INNER JOIN (Vat_Code'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN (Supplier_Invoice'
      '      INNER JOIN Supplier_Invoice_Line ON'
      
        '        Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Lin' +
        'e.Supplier_Invoice) ON'
      
        '        (Supplier_Branch.Branch_no = Supplier_Invoice.Branch_no)' +
        ' AND'
      
        '        (Supplier_Branch.Supplier = Supplier_Invoice.Supplier)) ' +
        'ON'
      '        Vat_Code.Vat_Code = Supplier_Invoice_Line.Vat_Code) ON'
      '        Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit'
      'WHERE'
      '  (Supplier_Invoice.Supp_Invoice_Status = 25)'
      'ORDER BY Supplier_Invoice_Line.Supplier_Invoice, Invoice_Line_no')
    Left = 360
    Top = 16
  end
  object PurchaseInvChgsSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Supplier_Invoice_Charge.*, VAT_Code.VAT_Rate'
      'from Supplier_Invoice_Charge, VAT_Code'
      'where Supplier_Invoice = :Supplier_Invoice and'
      '(Supplier_Invoice_Charge.Vat_Code = VAT_Code.Vat_Code)')
    Left = 312
    Top = 120
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qryGetSalesInvoice: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Goods_Value,'
      '        Vat_Value,'
      '        Customer.Name as Customer_Name,'
      '        Invoice_Description'
      'from sales_invoice, Customer'
      'where sales_invoice = :Sales_invoice and'
      'Sales_invoice.Inv_To_Customer = Customer.Customer')
    Left = 664
    Top = 24
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryGetSupplierInvoice: TFDQuery
    ConnectionName = 'wt'
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
    Left = 664
    Top = 72
    ParamData = <
      item
        Name = 'supplier_invoice'
      end>
  end
  object qryVATCode: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from VAT_Code'
      'where VAT_Code = :VAT_Code')
    Left = 664
    Top = 128
    ParamData = <
      item
        Name = 'VAT_Code'
      end>
  end
  object qryUpdPendingSI: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update sales_invoice'
      'set export_filename = :export_filename'
      'where sales_invoice_status = 25')
    Left = 696
    Top = 208
    ParamData = <
      item
        Name = 'export_filename'
      end>
  end
  object qryUpdPendingPI: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update supplier_invoice'
      'set export_filename = :export_filename'
      'where supp_invoice_status = 25')
    Left = 696
    Top = 272
    ParamData = <
      item
        Name = 'export_filename'
      end>
  end
  object CompanySQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Company.*, Accounts_Package.Accounts_package_Description'
      'from Company, Accounts_Package'
      
        'where Company.Accounts_Package = Accounts_Package.Accounts_Packa' +
        'ge')
    Left = 24
    Top = 120
  end
  object CustPendingSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer.Customer_Name'
      'from Customer'
      'where 1=0')
    Left = 224
    Top = 16
  end
  object SuppPendingSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Supplier.Supplier_Name'
      'from Supplier'
      'where 1=0')
    Left = 224
    Top = 64
  end
  object SalesPendingSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_invoice'
      'from Sales_invoice'
      'where Sales_invoice_Status = 25')
    Left = 232
    Top = 384
  end
  object PurchPendingSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Supplier_invoice'
      'from Supplier_invoice'
      'where Supplier_invoice_Status = 25')
    Left = 224
    Top = 176
  end
  object UpInvCustomerSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Customer'
      'set Account_Code_on_Ledger = '#39'I'#39
      'where'
      '(Customer.Account_Code_on_Ledger <> '#39'Y'#39') and'
      '(Customer.Account_Code is not null) and'
      '('
      '(Customer.Customer in'
      '    '#9'(select Sales_Invoice.Customer '
      #9'    from Sales_Invoice'
      #9'    where'
      #9'    (Sales_Invoice.Sales_Invoice_Status = 20)))'
      ')'
      ' ')
    Left = 456
    Top = 176
  end
  object customerSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select '#9'customer.*,'
      '        '#39#39' as Vat_Reference,'
      '        0 as Settlement_Days,'
      '        0.00 as Settlement_Discount,'
      '        (select Rep_Name'
      '         from Rep'
      '         where (Rep.Rep = customer.Rep)) as Rep_Name,'
      '        (select top 1 Contact_Name'
      '         from Customer_contact'
      
        '         where (customer_contact.customer = customer.customer)) ' +
        'as Contact_Name'
      'from customer'
      'where'
      #9#9'(customer.account_code is not null) and'
      '     (customer.not_active = '#39'N'#39')'
      '')
    Left = 24
    Top = 16
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select '#9'supplier.*,'
      '        '#39#39' as Vat_Reference,'
      '        (select top 1 Contact_Name'
      '         from supplier_contact'
      '         where (supplier_contact.supplier = supplier.supplier)'
      '         ) as Contact_Name'
      'from supplier'
      'where'
      #9#9'(supplier.account_code is not null) and'
      '     (supplier.Inactive <> '#39'Y'#39')'
      '')
    Left = 24
    Top = 64
  end
  object InvCustomerSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select distinct'#9'customer.*,'
      #9'      '#39#39' as VAT_Reference,'
      '        0 as Settlement_Discount,'
      '        0 as Settlement_Days,'
      '        (select top 1 Rep_Name'
      '         from Rep'
      '         where (Customer.Rep = Rep.Rep)'
      '              ) as Rep_Name,'
      '        (select top 1 Contact_Name'
      '         from Customer_contact'
      '         where '#9'('
      '         '#9#9#9'(customer_contact.customer = customer.customer)'
      '     '#9#9#9#9')'
      '         ) as Contact_Name'
      'from Sales_Invoice, Customer'
      'where'
      #9#9'  (Sales_Invoice.Sales_Invoice_Status = 25) and'
      '     ('
      '     (Sales_Invoice.Customer = Customer.Customer)'
      '     )'
      ''
      ''
      ''
      ' '
      ' ')
    Left = 384
    Top = 176
  end
  object SalesInvSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_invoice_line.Sales_invoice,'
      'Sales_invoice_line.Invoice_line_no,'
      'Sales_invoice_line.Vat, '
      'Sales_invoice_line.Nominal, '
      'Sales_invoice_line.Job, '
      'Sales_invoice_line.Description,'
      'Sales_invoice_line.Quantity_Invoiced, '
      'Sales_invoice_line.Unit_Price, '
      'Sales_invoice_line.Sell_Unit, '
      'Sales_invoice_line.Sales_Order,'
      'Sales_invoice_line.Sales_Order_line_no, '
      'Sales_invoice_line.Credit_Type, '
      'Sales_invoice_line.Cost_price, '
      'Sales_invoice_line.Vat_Value, '
      'Sales_invoice.Customer,'
      'Sales_invoice.Customer_Name as Actual_Customer_Name,'
      'Sales_invoice.Account_code,'
      'Sales_invoice.Invoice_no, '
      'Sales_invoice.Invoice_date, '
      'Sales_Invoice.Vat_Value AS Total_Vat_Value,'
      'Sales_Invoice.Goods_Value AS Total_Goods_Value,'
      'Sales_invoice.Sales_invoice_status,'
      'Sales_invoice.Invoice_or_Credit,'
      'Sales_invoice.Reference,'
      'Vat.Vat_Rate, '
      'Vat.Vat_Code,'
      'Vat.Description as Vat_Description,'
      #9'Customer.Is_Retail_Customer,'
      #9'Customer.County_State,'
      #9'Customer.Street,'
      #9'Customer.Locale,'
      #9'Customer.Town_City,'
      #9'Customer.Postcode,'
      #9'Customer.Customer_Name,'
      '  Payment_Terms.Number_of_Days,'
      '  Sales_Order.Reference,'
      '  Sales_Order.Order_ref_no'
      'FROM (Payment_Terms'
      '      RIGHT JOIN (Vat'
      '      INNER JOIN (Customer'
      '      INNER JOIN (Sales_invoice'
      '      INNER JOIN Sales_invoice_line'
      
        '        ON Sales_invoice.Sales_invoice = Sales_invoice_line.Sale' +
        's_invoice)'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      
        '        ON (Vat.Vat = Sales_invoice_line.Vat) AND (Vat.Vat = Sal' +
        'es_invoice_line.Vat))'
      
        '        ON Payment_Terms.Payment_Terms = Sales_invoice.Payment_T' +
        'erms)'
      '      LEFT JOIN Sales_Order'
      
        '        ON Sales_invoice_line.Sales_Order = Sales_Order.Sales_Or' +
        'der'
      'WHERE (((Sales_Invoice.Sales_Invoice_Status)=25) AND'
      '((Sales_Invoice.Inactive) Is Null))'
      '')
    Left = 24
    Top = 280
  end
  object qrySOHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Sales_order,'
      '        Reference,'
      '        Order_Ref_no,'
      '        Customer,'
      '        Install_address,'
      '        Contact_Name,'
      '        Date_Raised,'
      '        Date_Required'
      'from Sales_order'
      'where Sales_order = :Sales_order')
    Left = 24
    Top = 392
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object qryDelXeroInvs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Xero_Invoice_Import'
      'where Operator = :Operator')
    Left = 456
    Top = 400
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryUpXeroInvs: TFDQuery
    ConnectionName = 'wt'
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
      'Tax_Rate)'
      'values '
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
      ':Tax_Rate)')
    Left = 376
    Top = 400
    ParamData = <
      item
        Name = 'Operator'
      end
      item
        Name = 'Customer_Name'
      end
      item
        Name = 'Invoice_no'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Due_Date'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Reference'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Unit_Price'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Tax_Rate'
      end>
  end
  object qryGetXeroImport: TFDQuery
    ConnectionName = 'wt'
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
      'Tax_Rate'
      'FROM Xero_Invoice_Import'
      'WHERE Operator = :Operator'
      '')
    Left = 528
    Top = 400
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object SalesPendingBaseSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_invoice'
      'from Sales_invoice'
      'where Sales_invoice_Status = 25')
    Left = 232
    Top = 440
  end
  object UpSalesInvHeadBaseSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Sales_Invoice_Status = :Status_To'
      'where (Sales_Invoice.Sales_Invoice_Status = :Status_From) and'
      '(Inactive is null)')
    Left = 232
    Top = 320
    ParamData = <
      item
        Name = 'Status_To'
      end
      item
        Name = 'Status_From'
      end>
  end
end
