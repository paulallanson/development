object dmLookUpSInv: TdmLookUpSInv
  Height = 375
  Width = 544
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 24
    Top = 16
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT  Sales_Invoice.Sales_Invoice,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Goods_Value,'
      '        Sales_Invoice.Vat_Value,'
      '        Sales_Invoice.Inv_to_Customer,'
      '        Sales_Invoice.Invoice_Description,'
      '        Sales_invoice.Reference,'
      '        Sales_Invoice.Inv_to_Branch,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Sales_Invoice_Status.Sales_Invoice_Status,'
      '        Customer.Name,'
      '        Customer_Branch.Branch_no,'
      '        Customer_Branch.Account_Code,'
      '        Sales_Invoice.statement_reference,'
      '        Sales_Invoice.statement_date'
      'FROM Customer'
      '      INNER JOIN (Sales_Invoice_Status'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN Sales_Invoice ON'
      
        '        (Customer_Branch.Customer = Sales_Invoice.Inv_to_Custome' +
        'r) AND'
      
        '        (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch' +
        ')) ON'
      
        '        Sales_Invoice_Status.Sales_Invoice_Status = Sales_Invoic' +
        'e.Sales_Invoice_Status) ON'
      '        Customer.Customer = Customer_Branch.Customer ')
    Left = 88
    Top = 16
    object GetDetsSQLSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object GetDetsSQLSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object GetDetsSQLInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object GetDetsSQLGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object GetDetsSQLVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object GetDetsSQLInv_to_Customer: TIntegerField
      FieldName = 'Inv_to_Customer'
    end
    object GetDetsSQLInvoice_Description: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object GetDetsSQLReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object GetDetsSQLInv_to_Branch: TIntegerField
      FieldName = 'Inv_to_Branch'
    end
    object GetDetsSQLInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object GetDetsSQLSales_Invoice_Status: TIntegerField
      FieldName = 'Sales_Invoice_Status'
    end
    object GetDetsSQLName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object GetDetsSQLAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object GetDetsSQLstatement_reference: TStringField
      FieldName = 'statement_reference'
      FixedChar = True
      Size = 30
    end
    object GetDetsSQLstatement_date: TDateTimeField
      FieldName = 'statement_date'
    end
  end
  object GetCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Customer.Name as Customer_Name, '
      '                      Customer_Branch.Name as Branch_Name,'
      '                      Customer_Branch.Customer,'
      '                      Customer_Branch.Branch_no'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Account_Code LIKE :Code_From) or'
      #9'(Customer.Name LIKE :Code_From)) and'
      'Customer.Customer = Customer_Branch.Customer')
    Left = 160
    Top = 16
    ParamData = <
      item
        Name = 'Code_From'
      end
      item
        Name = 'Code_From'
      end>
  end
  object Query1: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Goods_Value,'
      '        Sales_Invoice.Vat_Value,'
      '        Sales_Invoice.Inv_to_Customer,'
      '        Sales_Invoice.Inv_to_Branch,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Sales_Invoice_Status.Sales_Invoice_Status,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Customer.Name,'
      '        Customer_Branch.Branch_no,'
      '        Customer_Branch.Account_Code'
      'FROM (Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Sales_Invoice_Status'
      '      INNER JOIN (Purchase_OrderLine'
      '      INNER JOIN (Sales_Invoice'
      '      INNER JOIN Sales_Invoice_Line ON'
      
        '        Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_I' +
        'nvoice) ON'
      '        (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.' +
        'Purchase_Order)) ON'
      
        '        Sales_Invoice_Status.Sales_Invoice_Status = Sales_Invoic' +
        'e.Sales_Invoice_Status) ON'
      
        '        (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch' +
        ') AND'
      
        '        (Customer_Branch.Customer = Sales_Invoice.Inv_to_Custome' +
        'r)'
      'Where'
      '(Sales_Invoice.Sales_invoice_Status >=20) and'
      
        '(Customer.Name like :Code_from) or (Customer_Branch.Account_Code' +
        ' LIKE :Code_from) and'
      '('
      '(Sales_invoice.Invoice_Date >= :Date_From) and'
      '(Sales_Invoice.Invoice_Date <= :Date_To)'
      ')'
      'order by'
      ' Sales_Invoice.Sales_Invoice_no desc'
      ''
      '')
    Left = 160
    Top = 136
    ParamData = <
      item
        Name = 'Code_from'
      end
      item
        Name = 'Code_from'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object DummySQL: TFDQuery
    SQL.Strings = (
      'SELECT  Sales_Invoice.Sales_Invoice,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Goods_Value,'
      '        Sales_Invoice.Vat_Value,'
      '        Sales_Invoice.Inv_to_Customer,'
      '        Sales_Invoice.Invoice_Description,'
      '        Sales_invoice.Reference,'
      '        Sales_Invoice.Inv_to_Branch,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Sales_Invoice_Status.Sales_Invoice_Status,'
      '        Customer.Name,'
      '        Customer_Branch.Branch_no,'
      '        Customer_Branch.Account_Code,'
      '        Sales_Invoice.statement_reference,'
      '        Sales_Invoice.statement_date'
      'FROM Customer'
      '      INNER JOIN (Sales_Invoice_Status'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN Sales_Invoice ON'
      
        '        (Customer_Branch.Customer = Sales_Invoice.Inv_to_Custome' +
        'r) AND'
      
        '        (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch' +
        ')) ON'
      
        '        Sales_Invoice_Status.Sales_Invoice_Status = Sales_Invoic' +
        'e.Sales_Invoice_Status) ON'
      '        Customer.Customer = Customer_Branch.Customer ')
    Left = 88
    Top = 72
  end
  object GetStatementSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Last_Statement_ref'
      'from Customer_Branch'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no')
    Left = 88
    Top = 136
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object GetCustStatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct'
      '          Statement_Reference,'
      '          Statement_Date,'
      '          Statement_from,'
      '          Statement_to'
      'from Sales_Invoice'
      'where Inv_to_Customer = :Customer and'
      'Inv_to_Branch = :Branch_no'
      'order by statement_date desc')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object SetStatementSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update sales_invoice'
      'set statement_reference = NULL,'
      'Statement_date = NULL'
      'where Sales_invoice = :sales_invoice')
    Left = 88
    Top = 192
    ParamData = <
      item
        Name = 'sales_invoice'
      end>
  end
  object oldDummySQL: TFDQuery
    SQL.Strings = (
      'SELECT  '
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Goods_Value,'
      '        Sales_Invoice.Vat_Value,'
      '        Sales_Invoice.Inv_to_Customer,'
      '        Sales_Invoice.Inv_to_Branch,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Sales_Invoice_Status.Sales_Invoice_Status,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Customer.Name,'
      '        Customer_Branch.Branch_no,'
      '        Customer_Branch.Account_Code,'
      '        Sales_Invoice.Statement_reference,'
      '        Sales_Invoice.Statement_Date'
      'FROM (Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Sales_Invoice_Status'
      '      INNER JOIN (Purchase_OrderLine'
      '      INNER JOIN (Sales_Invoice'
      '      INNER JOIN Sales_Invoice_Line ON'
      
        '        Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_I' +
        'nvoice) ON'
      '        (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.' +
        'Purchase_Order)) ON'
      
        '        Sales_Invoice_Status.Sales_Invoice_Status = Sales_Invoic' +
        'e.Sales_Invoice_Status) ON'
      
        '        (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch' +
        ') AND'
      
        '        (Customer_Branch.Customer = Sales_Invoice.Inv_to_Custome' +
        'r)')
    Left = 244
    Top = 80
  end
end
