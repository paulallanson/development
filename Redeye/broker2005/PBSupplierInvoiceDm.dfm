object dmSupplierInvoice: TdmSupplierInvoice
  Height = 526
  Width = 795
  object qrySIHeaderGrid: TFDQuery
    OnCalcFields = qrySIHeaderGridCalcFields
    ConnectionName = 'pb'
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'select TOP 2000'
      '        Supplier_invoice.*,'
      '          Supplier.Name as Supplier_Name,'
      '          Supplier_Branch.Name as Branch_Name,'
      '          Supplier_Branch.Account_Code,'
      '          Supp_invoice_Status.Description as Status_Desc,'
      '          (select top 1 purchase_order'
      '           from Supplier_Invoice_line SIL'
      
        '           where SIL.supplier_invoice = Supplier_invoice.supplie' +
        'r_invoice) as Purchase_Order'
      'from Supplier_Invoice,'
      '        Supplier,'
      '        Supplier_Branch,'
      '        Supp_invoice_Status'
      'where'
      '  ('
      '  (Supplier_invoice.Invoice_or_Credit = '#39'I'#39') or'
      '  (Supplier_invoice.Invoice_or_Credit is Null)'
      '  ) and'
      '  ('
      '  (Supplier.Name Like :Code_From) or'
      '  (Supplier_Branch.Account_code Like :Code_From)'
      '  ) AND'
      
        '  (Supplier_Invoice.Supp_Invoice_status <= :Supp_Invoice_Status)' +
        ' and'
      
        '  ((Supplier_Invoice.Supp_Invoice_Status = :Match_Status) or (:M' +
        'atch_Status = 0)) and'
      '  (Supplier_Invoice.Supplier = Supplier.Supplier) AND'
      '  ('
      '  (Supplier_Invoice.Supplier = Supplier_Branch.Supplier) AND'
      '  (Supplier_Invoice.Branch_no = Supplier_Branch.Branch_no)'
      '  )'
      '  AND'
      
        '  (Supplier_Invoice.Supp_invoice_status = Supp_Invoice_status.Su' +
        'pp_Invoice_Status)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 248
    Top = 8
    ParamData = <
      item
        Name = 'Code_From'
      end
      item
        Name = 'Code_From'
      end
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Match_Status'
      end
      item
        Name = 'Match_Status'
      end>
    object qrySIHeaderGridSupplier_Invoice: TIntegerField
      FieldName = 'Supplier_Invoice'
    end
    object qrySIHeaderGridSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qrySIHeaderGridBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySIHeaderGridVat_Value: TFloatField
      FieldName = 'Vat_Value'
      currency = True
    end
    object qrySIHeaderGridGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      currency = True
    end
    object qrySIHeaderGridInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySIHeaderGridSupplier_Invoice_no: TWideStringField
      FieldName = 'Supplier_Invoice_no'
    end
    object qrySIHeaderGridSupp_Invoice_Status: TIntegerField
      FieldName = 'Supp_Invoice_Status'
    end
    object qrySIHeaderGridCurrency_Code: TIntegerField
      FieldName = 'Currency_Code'
    end
    object qrySIHeaderGridSupp_Inv_Alt_Ref: TWideStringField
      FieldName = 'Supp_Inv_Alt_Ref'
    end
    object qrySIHeaderGridSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      Size = 40
    end
    object qrySIHeaderGridBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Size = 40
    end
    object qrySIHeaderGridStatus_Desc: TWideStringField
      FieldName = 'Status_Desc'
      Size = 40
    end
    object qrySIHeaderGridPONum: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'PONum'
      OnGetText = qrySIHeaderGridPONumGetText
      Calculated = True
    end
    object qrySIHeaderGridtot_val: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tot_val'
      currency = True
      Calculated = True
    end
    object qrySIHeaderGridtot_invoices: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tot_invoices'
      currency = True
      Calculated = True
    end
    object qrySIHeaderGridAccount_Code: TWideStringField
      FieldName = 'Account_Code'
    end
    object qrySIHeaderGridSales_Invoice_No: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Sales_Invoice_No'
      OnGetText = qrySIHeaderGridSales_Invoice_NoGetText
      Size = 50
      Calculated = True
    end
    object qrySIHeaderGridDate_Created: TDateTimeField
      FieldName = 'Date_Created'
    end
    object qrySIHeaderGridNew_Date: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'New_Date'
      Calculated = True
    end
  end
  object dsSIHeaderGrid: TDataSource
    DataSet = qrySIHeaderGrid
    OnDataChange = dsSIHeaderGridDataChange
    Left = 336
    Top = 8
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company')
    Left = 312
    Top = 304
  end
  object qrySIAllCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier_invoice_Charge.*,'
      '          Vat_Code.Vat_Rate'
      'from Supplier_invoice_Charge, VAT_Code'
      'where Supplier_invoice = :Supplier_Invoice and'
      'Supplier_invoice_Charge.Vat_Code = Vat_Code.Vat_Code')
    Left = 320
    Top = 184
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qrySIHeader: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier_invoice.*,'
      '          Supplier.Name as Supplier_Name,'
      '          Supplier_Branch.Name as Branch_Name,'
      '          Supplier_Branch.Account_Code,'
      '          Supp_invoice_Status.Description as Status_Description'
      'from Supplier_Invoice,'
      '        Supplier,'
      '        Supplier_Branch,'
      '        Supp_invoice_Status'
      'where'
      '  (Supplier_Invoice.Supplier_Invoice = :Supplier_Invoice) AND'
      '  (Supplier_Invoice.Supplier = Supplier.Supplier) AND'
      '  ('
      '  (Supplier_Invoice.Supplier = Supplier_Branch.Supplier) AND'
      '  (Supplier_Invoice.Branch_no = Supplier_Branch.Branch_no)'
      '  )'
      '  AND'
      
        '  (Supplier_Invoice.Supp_invoice_status = Supp_Invoice_status.Su' +
        'pp_Invoice_Status)'
      ' ')
    Left = 320
    Top = 64
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qryOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Operator')
    Left = 464
    Top = 8
  end
  object dsOperator: TDataSource
    DataSet = qryOperator
    Left = 520
    Top = 8
  end
  object qryGetSuppBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      '          Building_no_Name,'
      '          Street,'
      '          Locale,'
      '          Town,'
      '          Postcode,'
      '          Account_code'
      'from Supplier_Branch'
      'where Supplier = :Supplier and'
      'Branch_no = :Branch_no')
    Left = 304
    Top = 248
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetPurchOrd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Purch_Ord'
      'where Purch_Ord = :Purch_Ord')
    Left = 376
    Top = 240
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryPOAllLines: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select top 1000  Purchase_OrderLine.Purchase_Order,'
      '          Purchase_OrderLine.Line,'
      '          Purchase_Order.Date_Point,'
      '          Purchase_OrderLine.Suppliers_Desc,'
      
        '          (Purchase_OrderLine.Quantity - (Purchase_OrderLine.Qty' +
        '_Supp_Inv'
      
        '          + Purchase_OrderLine.Qty_Supp_Inv_Pend)) as Invoice_Qu' +
        'antity,'
      '          Purchase_OrderLine.Quantity,'
      '          Purchase_OrderLine.Order_Price,'
      '          Purchase_OrderLine.Product_Type,'
      '          Purchase_OrderLine.Order_Unit,'
      '          Purchase_OrderLine.Supp_Inv_Recd,'
      '          Purchase_OrderLine.On_Hold,'
      '          Purchase_OrderLine.Cust_Order_No,'
      '          Supplier.Name as Supplier_Name,'
      '          Supplier_Branch.Name as Branch_Name,'
      '          Purchase_OrderLine.Purch_Ord_Line_Status,'
      
        '          Purch_Ord_Line_Status.Description as Status_Descriptio' +
        'n,'
      '          Vat_code.Vat_Rate,'
      '          Supplier.Vat_Code_Def as Supplier_Vat_Code,'
      '          Purchase_Order.Currency_Code,'
      '          Price_Unit.Description as Price_Unit_Description,'
      '          Price_Unit.Price_Unit_Factor,'
      '          Customer.Name as Customer_Name,'
      '          Purchase_Order.Needs_Authorising,'
      '          Purchase_Order.Authorised_By,'
      '          (SELECT Job_Bag_Line_Dets.Job_Bag'
      '           FROM Job_Bag_Line_Dets'
      
        '           WHERE Job_Bag_Line_Dets.Purchase_Order = Purchase_Ord' +
        'erLine.Purchase_Order AND'
      
        '                 Job_Bag_Line_Dets.Line = Purchase_OrderLine.Lin' +
        'e) as Job_Bag,'
      '          (SELECT TOP 1 sales_invoice.sales_invoice_no'
      '           FROM sales_invoice_line, sales_invoice'
      
        '           WHERE ((sales_invoice_line.purchase_order = Purchase_' +
        'OrderLine.Purchase_Order) AND'
      
        '                 (sales_invoice_line.Line = Purchase_OrderLine.L' +
        'ine)) AND'
      
        '                 (sales_invoice_line.sales_invoice = sales_invoi' +
        'ce.sales_invoice) AND'
      '                 (Sales_Invoice.Invoice_or_Credit = '#39'I'#39')'
      
        '           ORDER BY sales_invoice.sales_invoice DESC) as Sales_I' +
        'nvoice_no,'
      '          (SELECT TOP 1 sales_invoice.Invoice_Date'
      '           FROM sales_invoice_line, sales_invoice'
      
        '           WHERE ((sales_invoice_line.purchase_order = Purchase_' +
        'OrderLine.Purchase_Order) AND'
      
        '                 (sales_invoice_line.Line = Purchase_OrderLine.L' +
        'ine)) AND'
      
        '                 (sales_invoice_line.sales_invoice = sales_invoi' +
        'ce.sales_invoice) AND'
      '                 (Sales_Invoice.Invoice_or_Credit = '#39'I'#39')'
      
        '           ORDER BY sales_invoice.sales_invoice DESC) as Invoice' +
        '_Date'
      'from '#9'Purchase_OrderLine,'
      #9'Purch_Ord_Line_Status,'
      '       '#9'Supplier, Supplier_Branch,'
      '       '#9'VAT_Code, Purchase_Order, Price_Unit, Customer'
      'where'
      '(Supplier.Name Like :Code_From) AND'
      '(Purchase_orderLine.Order_Price >= :Include_Value) AND'
      '((Purchase_OrderLine.Quantity - (Purchase_OrderLine.Qty_Supp_Inv'
      '          + Purchase_OrderLine.Qty_Supp_Inv_Pend)) > 0) and'
      '(Purchase_OrderLine.Purch_Ord_Line_Status > 10) AND'
      '(Purchase_Order.Supplier = Supplier.Supplier) AND'
      '('
      '(Purchase_Order.Supplier = Supplier_Branch.Supplier) AND'
      '(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)'
      ') AND'
      '(Purchase_OrderLine.Customer = Customer.Customer) AND'
      '(Supplier.VAT_Code_Def = VAT_Code.VAT_Code) and'
      
        '(Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_OrderLine.Order_Unit = Price_Unit.Price_Unit)'
      'AND'
      
        '(Purchase_OrderLine.Purch_Ord_Line_Status = Purch_Ord_Line_Statu' +
        's.Purch_Ord_Line_Status)'
      'Order by Purchase_Order.Purchase_Order desc'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 24
    Top = 8
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Include_Value'
      end>
    object qryPOAllLinesPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryPOAllLinesLine: TIntegerField
      FieldName = 'Line'
    end
    object qryPOAllLinesSuppliers_Desc: TWideStringField
      FieldName = 'Suppliers_Desc'
      Size = 80
    end
    object qryPOAllLinesInvoice_Quantity: TFloatField
      FieldName = 'Invoice_Quantity'
    end
    object qryPOAllLinesOrder_Price: TFloatField
      FieldName = 'Order_Price'
      currency = True
    end
    object qryPOAllLinesProduct_Type: TIntegerField
      FieldName = 'Product_Type'
    end
    object qryPOAllLinesOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryPOAllLinesSupp_Inv_Recd: TWideStringField
      FieldName = 'Supp_Inv_Recd'
      Size = 1
    end
    object qryPOAllLinesSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      Size = 40
    end
    object qryPOAllLinesBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Size = 40
    end
    object qryPOAllLinesStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      Size = 40
    end
    object qryPOAllLinesVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryPOAllLinesSupplier_Vat_Code: TIntegerField
      FieldName = 'Supplier_Vat_Code'
    end
    object qryPOAllLinesCurrency_Code: TIntegerField
      FieldName = 'Currency_Code'
    end
    object qryPOAllLinesPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryPOAllLinesDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryPOAllLinesCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryPOAllLinesPOLine: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryPOAllLinesPOLineGetText
      Size = 15
      Calculated = True
    end
    object qryPOAllLinesQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryPOAllLinesPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryPOAllLinesNeeds_Authorising: TWideStringField
      FieldName = 'Needs_Authorising'
      Size = 1
    end
    object qryPOAllLinesOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Size = 1
    end
    object qryPOAllLinesAuthorised_By: TIntegerField
      FieldName = 'Authorised_By'
    end
    object qryPOAllLinesJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryPOAllLinesSales_Invoice_no: TWideStringField
      FieldName = 'Sales_Invoice_no'
    end
    object qryPOAllLinesInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qryPOAllLinesPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryPOAllLinesCust_Order_No: TWideStringField
      FieldName = 'Cust_Order_No'
      Size = 30
    end
  end
  object dsPOLine: TDataSource
    DataSet = qryPOsDeliv
    Left = 96
    Top = 8
  end
  object dsDummy: TDataSource
    Left = 152
    Top = 8
  end
  object qrySILine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier_invoice_line.*,'
      '          Price_Unit.Description as Price_Unit_Description,'
      '          Price_Unit.Price_unit_Factor,'
      '          VAT_Code.VAT_Rate'
      'from Supplier_invoice_line, Price_Unit, VAT_Code'
      'where '
      '('
      '(Supplier_invoice = :Supplier_Invoice) and'
      '(Invoice_Line_no = :Invoice_Line_no)'
      ') and'
      '(Supplier_invoice_Line.Price_Unit = Price_unit.Price_unit) and'
      '(Supplier_Invoice_Line.VAT_Code = VAT_Code.VAT_Code)'
      ' ')
    Left = 384
    Top = 120
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_orderLine.Suppliers_Desc,'
      '        Quantity,'
      '        Order_Price,'
      '        Order_Unit,'
      '        Price_Unit_Factor,'
      '        vat_code.vat_rate,'
      '        (select sum(Amount)'
      '         from Purch_Ord_Line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Purchase_' +
        'orderLine.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Purchase_orderLine.' +
        'Line) as Additional_Charge'
      'from Purchase_orderLine, Price_unit, vat_code'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line and'
      '(Purchase_orderline.Order_Unit = Price_Unit.Price_unit) and'
      '(Purchase_orderline.vat_code = vat_code.vat_code)'
      ' '
      ' '
      ' ')
    Left = 384
    Top = 296
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetPurchOrdL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purch_Ord_Line.Part,'
      ' Part.Part_description,'
      ' Purch_Ord_Line.Purch_Pack_Quantity,'
      ' Purch_Ord_Line.Quantity_Received,'
      ' Purch_Ord_Line.Purchase_Price,'
      ' vat_code.vat_rate'
      'from Purch_Ord_Line, Part, vat_code'
      'where Purch_Ord = :Purch_ord and'
      'Purch_ord_line_no = :Purch_Ord_Line_no and'
      'Purch_Ord_line.Part = Part.Part and'
      'part.vat_code = vat_code.vat_code'
      ' ')
    Left = 448
    Top = 296
    ParamData = <
      item
        Name = 'Purch_ord'
      end
      item
        Name = 'Purch_Ord_Line_no'
      end>
  end
  object qryGetJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Job_Bag_Line_Dets.Job_Bag_Line_Descr, Job_Bag_Line_Cost, ' +
        'Vat_Code.Vat_Rate'
      'from Job_Bag_Line_Dets, Vat_Code'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line and'
      'Job_Bag_Line_Dets.vat_code = vat_code.vat_code')
    Left = 448
    Top = 232
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qrySIAllLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Supplier_Invoice_Line.Supplier_Invoice,'
      '        Supplier_Invoice_Line.Invoice_Line_No,'
      '        Supplier_Invoice_Line.Purchase_Order,'
      '        Supplier_Invoice_Line.Credit_Type,'
      '        Supplier_Invoice_Line.Line,'
      '        Supplier_Invoice_Line.Purch_Ord,'
      '        Supplier_Invoice_Line.Purch_Ord_Line_no,'
      '        Supplier_Invoice_Line.Job_Bag,'
      '        Supplier_Invoice_Line.Job_Bag_Line,'
      '        Supplier_Invoice_Line.Qty_Invoiced,'
      '        Supplier_Invoice_Line.Goods_Value,'
      '        Supplier_Invoice_Line.Vat_Value,'
      '        Supplier_Invoice_Line.Vat_Code,'
      '        Supplier_Invoice_Line.Delivery_Note_No,'
      '        Supplier_Invoice_Line.Delivery_Date,'
      '        Supplier_Invoice_Line.Price_Unit,'
      '        Supplier_Invoice_Line.Supp_Invoice_Status,'
      '        Supplier_Invoice_Line.Nominal,'
      '        Supplier_Invoice_Line.Original_Supplier_invoice,'
      '        Supplier_Invoice_Line.Original_Invoice_Line,'
      '        Price_Unit.Description as Price_unit_Description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description as Vat_Description,'
      '        Vat_Code.VAT_Ref,'
      '        Supp_Invoice_Status.Description as Status_Description'
      'FROM Supp_Invoice_Status'
      '      INNER JOIN (Vat_Code'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Supplier_Invoice_Line ON'
      
        '        Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit' +
        ') ON'
      '        Vat_Code.Vat_Code = Supplier_Invoice_Line.Vat_Code) ON'
      
        '        Supp_Invoice_Status.Supp_Invoice_Status = Supplier_Invoi' +
        'ce_Line.Supp_Invoice_Status'
      'WHERE Supplier_Invoice = :Supplier_Invoice'
      ' ')
    Left = 320
    Top = 120
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qrySIAddHeader: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Supplier_invoice'
      '     (Supplier_Invoice,'
      '      Goods_Value, '
      '      VAT_Value,'
      '      Supplier,'
      '      Branch_no,'
      '      Supp_Invoice_Status,'
      '      Invoice_Date,'
      '      Currency_Code,'
      '      Supplier_invoice_no,'
      '      Supp_inv_alt_Ref,'
      '      Goods_Value_Diff,'
      '      VAT_Value_Diff,'
      '      Invoice_or_Credit,'
      '      Orig_Supplier_invoice_no,'
      '      Operator,'
      '      Date_Created)'
      'Values (:Supplier_Invoice,'
      '      :Goods_Value,'
      '      :VAT_Value,'
      '      :Supplier,'
      '      :Branch_no,'
      '      :Supp_Invoice_Status,'
      '      :Invoice_Date,'
      '      :Currency_Code,'
      '      :Supplier_Invoice_no,'
      '      :Supp_Inv_Alt_Ref,'
      '      :Goods_Value_Diff,'
      '      :VAT_Value_Diff,'
      '      :Invoice_or_Credit,'
      '      :Orig_Supplier_invoice_no,'
      '      :Operator,'
      '      :Date_Created)'
      '')
    Left = 448
    Top = 64
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'VAT_Value'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Supplier_Invoice_no'
      end
      item
        Name = 'Supp_Inv_Alt_Ref'
      end
      item
        Name = 'Goods_Value_Diff'
      end
      item
        Name = 'VAT_Value_Diff'
      end
      item
        Name = 'Invoice_or_Credit'
      end
      item
        Name = 'Orig_Supplier_invoice_no'
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Date_Created'
      end>
  end
  object qrySIUpHeader: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Supplier_invoice'
      'SET Goods_Value = :Goods_Value, '
      '        VAT_Value = :VAT_Value,'
      '        Supplier = :Supplier,'
      '        Branch_no = :Branch_no,'
      '        Supp_Invoice_Status = :Supp_Invoice_Status,'
      '        Invoice_Date = :Invoice_Date,'
      '        Currency_Code = :Currency_Code,'
      '        Supplier_invoice_no = :Supplier_Invoice_no,'
      '        Supp_inv_Alt_ref = :Supp_inv_Alt_ref,'
      '        Goods_Value_Diff = :Goods_Value_Diff,'
      '        VAT_Value_Diff = :Vat_Value_Diff,'
      '        Invoice_or_Credit = :Invoice_or_Credit,'
      '        Orig_supplier_invoice_no = :Orig_supplier_invoice_no,'
      '        Operator = :Operator'
      'WHERE Supplier_Invoice = :Supplier_Invoice')
    Left = 520
    Top = 64
    ParamData = <
      item
        Name = 'Goods_Value'
      end
      item
        Name = 'VAT_Value'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Supplier_Invoice_no'
      end
      item
        Name = 'Supp_inv_Alt_ref'
      end
      item
        Name = 'Goods_Value_Diff'
      end
      item
        Name = 'Vat_Value_Diff'
      end
      item
        Name = 'Invoice_or_Credit'
      end
      item
        Name = 'Orig_supplier_invoice_no'
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 384
    Top = 64
  end
  object qrySIGetLast: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Supplier_Invoice) as Last_Supplier_invoice'
      'from Supplier_invoice')
    Left = 408
    Top = 8
  end
  object qrySIAddCharge: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Supplier_Invoice_Charge'
      '    (Supplier_Invoice,'
      '     Additional_Charge,'
      '     Details,'
      '     Amount,'
      '     Nominal,'
      '     VAt_Code,'
      '     Purchase_Order,'
      '     Line)'
      'Values'
      '    (:Supplier_invoice,'
      '     :Additional_Charge,'
      '     :Details,'
      '     :Amount,'
      '     :Nominal,'
      '     :Vat_Code,'
      '     :Purchase_Order,'
      '     :Line)')
    Left = 384
    Top = 184
    ParamData = <
      item
        Name = 'Supplier_invoice'
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
        Name = 'VAt_Code'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySIAddLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Supplier_Invoice_Line'
      '  (Supplier_Invoice,'
      '   Invoice_Line_no,'
      '   Purchase_order,'
      '   Line,'
      '   Credit_Type,'
      '   Qty_Invoiced,'
      '   Goods_Value,'
      '   VAT_Code,'
      '   VAT_Value,'
      '   Supp_Invoice_Status,'
      '   Price_unit,'
      '   Nominal,'
      '   Job_Bag,'
      '   Job_Bag_Line,'
      '   Purch_Ord,'
      '   Purch_Ord_Line_no,'
      '   Delivery_Note_no,'
      '   Delivery_Date,'
      '   Original_Supplier_Invoice,'
      '   Original_Invoice_Line)'
      'values'
      '  (:Supplier_Invoice,'
      '   :Invoice_Line_no,'
      '   :Purchase_order,'
      '   :Line,'
      '   :Credit_Type,'
      '   :Qty_Invoiced,'
      '   :Goods_Value,'
      '   :VAT_Code,'
      '   :VAT_Value,'
      '   :Supp_Invoice_Status,'
      '   :Price_unit,'
      '   :Nominal,'
      '   :Job_Bag,'
      '   :Job_Bag_Line,'
      '   :Purch_Ord,'
      '   :Purch_Ord_Line_no,'
      '   :Delivery_Note_No,'
      '   :Delivery_Date,'
      '   :Original_Supplier_Invoice,'
      '   :Original_Invoice_Line)'
      ' ')
    Left = 448
    Top = 120
    ParamData = <
      item
        Name = 'Supplier_Invoice'
        DataType = ftInteger
      end
      item
        Name = 'Invoice_Line_no'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Credit_Type'
      end
      item
        Name = 'Qty_Invoiced'
        DataType = ftInteger
      end
      item
        Name = 'Goods_Value'
        DataType = ftFloat
      end
      item
        Name = 'VAT_Code'
        DataType = ftInteger
      end
      item
        Name = 'VAT_Value'
        DataType = ftFloat
      end
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Price_unit'
        DataType = ftInteger
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
      end
      item
        Name = 'Purch_Ord'
        DataType = ftInteger
      end
      item
        Name = 'Purch_Ord_Line_no'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Note_No'
        DataType = ftString
      end
      item
        Name = 'Delivery_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Original_Supplier_Invoice'
      end
      item
        Name = 'Original_Invoice_Line'
      end>
  end
  object qryGetVat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from VAT_Code'
      'where VAT_Code = :VAT_Code')
    Left = 520
    Top = 296
    ParamData = <
      item
        Name = 'VAT_Code'
      end>
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 520
    Top = 232
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qryPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Purchase_OrderLine.Purchase_Order,'
      #9'Purchase_OrderLine.Line, '
      #9'Supplier.VAT_Code_Def AS Vat_Code, '
      #9'Vat_Code.Vat_Rate, '
      #9'Purchase_Order.Supplier, '
      #9'Purchase_Order.Branch_No, '
      #9'Purchase_Order.Currency_Code, '
      #9'Supplier.Name AS Supplier_Name, '
      #9'Supplier_Branch.Account_Code, '
      #9'Supplier_Branch.Name AS Branch_Name, '
      #9'Purchase_OrderLine.Order_Unit, '
      #9'Price_Unit.Description AS Price_unit_Description, '
      #9'Price_Unit.Price_Unit_Factor, '
      #9'Purchase_OrderLine.Order_Price, '
      #9'Purchase_OrderLine.Suppliers_Desc,'
      '  Purchase_OrderLine.Product_Type, '
      #9'Supplier.Currency_Code_Def,'
      '                Purchase_OrderLine.Quantity'
      'FROM Vat_Code '
      #9'INNER JOIN ((Currency_Code '
      #9'RIGHT JOIN Supplier ON '
      #9#9'Currency_Code.Currency_Code = Supplier.Currency_Code_Def) '
      #9'INNER JOIN ((Supplier_Branch '
      #9'INNER JOIN Purchase_Order ON '
      #9#9'(Supplier_Branch.Supplier = Purchase_Order.Supplier) AND '
      #9#9'(Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN Purchase_OrderLine ON '
      #9#9'Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) ON '
      
        #9#9'Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_Or' +
        'der) ON '
      #9#9'Supplier.Supplier = Supplier_Branch.Supplier) ON '
      #9#9'Vat_Code.Vat_Code = Supplier.VAT_Code_Def'
      'WHERE Purchase_OrderLine.Purchase_Order = :Purchase_order and'
      'Purchase_OrderLine.Line = :Line'
      ''
      ' ')
    Left = 320
    Top = 360
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetInvStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supp_invoice_Status'
      'where Supp_invoice_Status = :Supp_invoice_Status')
    Left = 520
    Top = 352
    ParamData = <
      item
        Name = 'Supp_invoice_Status'
      end>
  end
  object qryPOLineChgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purch_Ord_Line_Add_Chg.Purchase_Order,'
      '        Purch_Ord_Line_Add_Chg.Line,'
      '        Purch_Ord_Line_Add_Chg.Additional_charge,'
      '        Purch_Ord_Line_Add_Chg.Details,'
      '        Purch_Ord_Line_Add_Chg.Amount,'
      '        Purch_Ord_Line_Add_Chg.Quotation_Price,'
      '        Purchase_Order.Supplier,'
      '        Vat_Code.Vat_Code,'
      '        Vat_Code.Vat_Rate'
      'FROM Vat_Code'
      '    INNER JOIN (Supplier'
      '    INNER JOIN (Supplier_Branch'
      '    INNER JOIN (Purchase_Order'
      '    INNER JOIN (Purchase_OrderLine'
      '    INNER JOIN Purch_Ord_Line_Add_Chg ON'
      
        '      (Purchase_OrderLine.Line = Purch_Ord_Line_Add_Chg.Line) AN' +
        'D'
      
        '      (Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_Add_Ch' +
        'g.Purchase_Order)) ON'
      
        '      Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchas' +
        'e_Order) ON'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier)) ON'
      '      Supplier.Supplier = Supplier_Branch.Supplier) ON'
      '      Vat_Code.Vat_Code = Supplier.VAT_Code_Def'
      'WHERE'
      '  Purch_Ord_Line_Add_Chg.Purchase_order = :Purchase_order and'
      '  Purch_Ord_Line_Add_Chg.Line = :Line and'
      '  Purch_Ord_Line_Add_Chg.Amount <> 0'
      ' ')
    Left = 392
    Top = 352
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryJBAllLines: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT TOP 1000'
      '  Job_Bag_Line_Dets.Job_Bag,'
      '  Job_Bag_Line_Dets.Job_Bag_Line,'
      '  Job_Bag_Line_Dets.Supplier,'
      '  Supplier.Name,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '  Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '  Vat_Code.Vat_Code,'
      '  Vat_Code.Vat_Rate'
      'FROM Vat_Code'
      '  INNER JOIN ((Supplier'
      '  INNER JOIN Supplier_Branch ON'
      '    Supplier.Supplier = Supplier_Branch.Supplier)'
      '  INNER JOIN Job_Bag_Line_Dets ON'
      
        '    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AN' +
        'D'
      '    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) ON'
      '    Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code'
      'WHERE Supplier.Name Like :Code_From AND'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Type <>'#39'P'#39' AND'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Type <>'#39'S'#39' AND'
      '  ((Job_Bag_Line_Dets.supp_inv_recd <>'#39'Y'#39') Or'
      '  (Job_Bag_Line_Dets.supp_inv_recd Is Null))'
      'ORDER BY Job_Bag_Line_Dets.Job_Bag DESC ')
    Left = 24
    Top = 56
    ParamData = <
      item
        Name = 'Code_From'
      end>
  end
  object dsJBLine: TDataSource
    DataSet = qryJBAllLines
    Left = 96
    Top = 56
  end
  object qryJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Job_Bag_Line_Dets.Job_Bag,'
      '  Job_Bag_Line_Dets.Job_Bag_Line,'
      '  Job_Bag_Line_Dets.Supplier,'
      '  Job_Bag_Line_Dets.Branch_No,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '  Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '  Job_Bag_Line_Dets.VAT_Code,'
      '  Job_Bag_Line_Dets.Currency_Code,'
      '  Vat_Code.Vat_Rate,'
      '  Supplier_Branch.Account_Code,'
      '  Supplier_Branch.Name AS Branch_Name,'
      '  Supplier.Name as Supplier_Name'
      'FROM Vat_Code'
      '  INNER JOIN ((Supplier'
      '  INNER JOIN Supplier_Branch ON'
      '    Supplier.Supplier = Supplier_Branch.Supplier)'
      '  INNER JOIN (Job_Bag INNER JOIN Job_Bag_Line_Dets ON'
      '    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON'
      
        '    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AN' +
        'D'
      '    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) ON'
      '    Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      '      Job_Bag_Line_Dets.Job_Bag_Line = :Job_Bag_Line')
    Left = 320
    Top = 408
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryCheckPIN: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Supplier.Name, Supplier_invoice_no'
      'from Supplier_invoice, Supplier'
      'where Supp_Inv_Alt_Ref = :Supp_Inv_Alt_Ref and'
      'Supplier_invoice <> :Supplier_Invoice and'
      '(Supplier_invoice.Supplier = Supplier.Supplier)')
    Left = 392
    Top = 408
    ParamData = <
      item
        Name = 'Supp_Inv_Alt_Ref'
      end
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qryPOUpLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Purchase_OrderLine'
      'set Qty_Supp_Inv_Pend = Qty_Supp_Inv_Pend + :Qty_Supp_Inv_Pend, '
      'Supp_Inv_recd = '#39'Y'#39
      'where '
      'Purchase_Order = :Purchase_order and'
      'Line = :Line')
    Left = 32
    Top = 222
    ParamData = <
      item
        Name = 'Qty_Supp_Inv_Pend'
      end
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryJBUpLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Job_Bag_line_Dets'
      'set Supp_inv_recd = :Supp_inv_recd'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 48
    Top = 352
    ParamData = <
      item
        Name = 'Supp_inv_recd'
      end
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qrySIUpStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Supplier_Invoice'
      'set Supp_invoice_Status = :Supp_Invoice_Status'
      'where (Supplier_Invoice = :Supplier_Invoice)')
    Left = 520
    Top = 120
    ParamData = <
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qrySIUpLineStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Supplier_Invoice_Line'
      'set Supp_invoice_Status = :Supp_Invoice_Status'
      'where (Supplier_Invoice = :Supplier_Invoice) and'
      '(Invoice_line_no = :Invoice_Line_no)')
    Left = 520
    Top = 176
    ParamData = <
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Supplier_Invoice'
      end
      item
        Name = 'Invoice_Line_no'
      end>
  end
  object qryPOUpLineStatus: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Purchase_OrderLine'
      'set Qty_Supp_Inv = Qty_Supp_inv + :Qty_Supp_Inv,'
      '    Qty_Supp_Inv_Pend = Qty_Supp_Inv_Pend - :Qty_Supp_Inv'
      'where Purchase_Order = :Purchase_Order AND Line = :Line'
      ' '
      ' ')
    Left = 32
    Top = 170
    ParamData = <
      item
        Name = 'Qty_Supp_Inv'
      end
      item
        Name = 'Qty_Supp_Inv'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySIGetAllStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Supplier_invoice'
      'where Supp_Invoice_Status = :Supp_Invoice_Status and'
      'Invoice_or_credit = :Invoice_or_Credit')
    Left = 448
    Top = 176
    ParamData = <
      item
        Name = 'Supp_Invoice_Status'
      end
      item
        Name = 'Invoice_or_Credit'
      end>
  end
  object qryPurchAll: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purch_Ord.Purch_Ord,'
      '        Purch_Ord.Purch_Ord_No,'
      '        Purch_Ord.Purch_Ord_Descr,'
      '        Purch_Ord.Purch_Ord_Date,'
      '        Purch_Ord.Sales_Order,'
      '        Supplier_Branch.Supplier,'
      '        Supplier_Branch.Branch_no,'
      '        Supplier.Name,'
      '        Purch_Ord.Purch_Ord_Status,'
      '        Purch_Ord_Status.Status_Descr'
      'FROM Purch_Ord_Status'
      '  INNER JOIN (Supplier'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN Purch_Ord ON'
      '    (Supplier_Branch.Branch_no = Purch_Ord.Branch_no) AND'
      '    (Supplier_Branch.Supplier = Purch_Ord.Supplier)) ON'
      '    Supplier.Supplier = Supplier_Branch.Supplier) ON'
      
        '    Purch_Ord_Status.Purch_Ord_Status = Purch_Ord.Purch_Ord_Stat' +
        'us'
      'WHERE Supplier.Name Like :Code_From and'
      '((Purch_Ord.Purch_Ord_Status = '#39'K'#39') or'
      '(Purch_Ord.Purch_Ord_Status = '#39'N'#39') or'
      '(Purch_Ord.Purch_Ord_Status = '#39'U'#39'))'
      'ORDER BY Purch_Ord_no desc')
    Left = 24
    Top = 112
    ParamData = <
      item
        Name = 'Code_From'
      end>
  end
  object dsPurchOrd: TDataSource
    DataSet = qryPurchAll
    Left = 96
    Top = 112
  end
  object qryPurchHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purch_Ord.Purch_Ord,'
      '        Supplier_Branch.Account_Code,'
      '        Purch_Ord.Supplier,'
      '        Purch_Ord.Branch_no,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier.Name as Supplier_name,'
      '        Supplier.Currency_Code_Def as Currency_Code'
      'FROM Supplier'
      '    INNER JOIN (Supplier_Branch'
      '    INNER JOIN Purch_Ord ON'
      '      (Supplier_Branch.Branch_no = Purch_Ord.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purch_Ord.Supplier)) ON'
      '      Supplier.Supplier = Supplier_Branch.Supplier'
      'WHERE Purch_Ord = :Purch_Ord')
    Left = 456
    Top = 408
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryPurchLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purch_Ord_Line.Purch_Ord,'
      '        Purch_Ord_Line.Purch_Ord_Line_No,'
      '        Purch_Ord_Line.Part,'
      '        Part.Part_Description,'
      '        Part.Purchase_Nominal,'
      '        Purch_Ord_Line.Quantity_Received,'
      '        Purch_Ord_Line.Quantity_Sent,'
      '        Purch_Ord_Line.Purchase_Price,'
      '        Purch_Ord_Line.Qty_invoiced,'
      
        '        (Purch_Ord_Line.Quantity_Received - Purch_Ord_Line.Qty_I' +
        'nvoiced) as Qty_To_Invoice,'
      '        Part.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Purch_Ord_Line.Purch_Pack_Quantity'
      'FROM Vat_Code'
      '    INNER JOIN (Part'
      '    INNER JOIN Purch_Ord_Line ON'
      '      Part.Part = Purch_Ord_Line.Part) ON'
      '      Vat_Code.Vat_Code = Part.Vat_Code'
      'WHERE Purch_ord = :Purch_Ord and'
      '((Quantity_Received - Qty_Invoiced) > 0)'
      ' '
      ' ')
    Left = 528
    Top = 408
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryPurchChgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purch_ord,'
      '          Additional_Charge,'
      '          Details,'
      '          Amount,'
      '         Nominal,'
      '         VAT_Code.VAT_Code,'
      '         VAT_Rate'
      'FROM Purch_Ord_Add_Charge, VAT_Code'
      'WHERE Purch_Ord = :Purch_Ord and'
      'Purch_Ord_Add_Charge.VAT_Code = VAT_Code.VAT_Code'
      'ORDER BY Additional_Charge')
    Left = 456
    Top = 344
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryPurchUpLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Purch_ord_line'
      'set Qty_Invoiced = Qty_Invoiced + :Qty_Invoiced'
      'where Purch_ord = :Purch_Ord and'
      'Purch_Ord_Line_no = :Purch_Ord_Line_no')
    Left = 48
    Top = 400
    ParamData = <
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_no'
      end>
  end
  object qryPurchChkStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purch_ord, '
      '          sum(Qty_Invoiced) as Qty_Invoiced,'
      '          sum(Quantity_Received) as Qty_Received,'
      '          sum(Quantity_Ordered) as Qty_Ordered'
      'from Purch_Ord_Line'
      'Group BY Purch_Ord'
      'Having Purch_Ord = :Purch_Ord'
      '')
    Left = 128
    Top = 344
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryPurchUpStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_ord'
      'set Purch_ord_Status = :Purch_Ord_Status'
      'where Purch_ord = :Purch_Ord')
    Left = 128
    Top = 400
    ParamData = <
      item
        Name = 'Purch_Ord_Status'
      end
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryPCHeaderGrid: TFDQuery
    OnCalcFields = qryPCHeaderGridCalcFields
    ConnectionName = 'pb'
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'select Supplier_invoice.*,'
      '          Supplier.Name as Supplier_Name,'
      '          Supplier_Branch.Name as Branch_Name,'
      '          Supplier_Branch.Account_Code,'
      '          Supp_invoice_Status.Description as Status_Desc,'
      '          (Supplier_invoice.Goods_Value * -1) as Goods_Credit,'
      '          (Supplier_invoice.Vat_Value * -1) as VAT_Credit'
      'from Supplier_Invoice,'
      '        Supplier,'
      '        Supplier_Branch,'
      '        Supp_invoice_Status'
      'where'
      '  (Supplier_invoice.Invoice_or_credit = '#39'C'#39') and'
      '  ('
      '  (Supplier.Name Like :Code_From) or'
      '  (Supplier_Branch.Account_code Like :Code_From)'
      '  ) AND'
      
        '  (Supplier_Invoice.Supp_Invoice_status <= :Supp_Invoice_Status)' +
        ' and'
      
        '  ((Supplier_Invoice.Supp_Invoice_Status = :Match_Status) or (:M' +
        'atch_Status = 0)) and'
      '  (Supplier_Invoice.Supplier = Supplier.Supplier) AND'
      '  ('
      '  (Supplier_Invoice.Supplier = Supplier_Branch.Supplier) AND'
      '  (Supplier_Invoice.Branch_no = Supplier_Branch.Branch_no)'
      '  )'
      '  AND'
      
        '  (Supplier_Invoice.Supp_invoice_status = Supp_Invoice_status.Su' +
        'pp_Invoice_Status)'
      'order by Supplier_Invoice desc'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 248
    Top = 64
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Supp_Invoice_Status'
        DataType = ftInteger
      end
      item
        Name = 'Match_Status'
        DataType = ftInteger
      end
      item
        Name = 'Match_Status'
        DataType = ftInteger
      end>
    object IntegerField1: TIntegerField
      FieldName = 'Supplier_Invoice'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Supplier'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Branch_no'
    end
    object FloatField1: TFloatField
      FieldName = 'Vat_Value'
      currency = True
    end
    object FloatField2: TFloatField
      FieldName = 'Goods_Value'
      currency = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object StringField1: TWideStringField
      FieldName = 'Supplier_Invoice_no'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Supp_Invoice_Status'
    end
    object IntegerField5: TIntegerField
      FieldName = 'Currency_Code'
    end
    object StringField2: TWideStringField
      FieldName = 'Supp_Inv_Alt_Ref'
    end
    object StringField3: TWideStringField
      FieldName = 'Supplier_Name'
      Size = 40
    end
    object StringField4: TWideStringField
      FieldName = 'Branch_Name'
      Size = 40
    end
    object StringField5: TWideStringField
      FieldName = 'Status_Desc'
      Size = 40
    end
    object qryPCHeaderGridInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qryPCHeaderGridGoods_Value_Diff: TCurrencyField
      FieldName = 'Goods_Value_Diff'
    end
    object qryPCHeaderGridVAT_Value_Diff: TCurrencyField
      FieldName = 'VAT_Value_Diff'
    end
    object qryPCHeaderGridGoods_Credit: TCurrencyField
      FieldName = 'Goods_Credit'
    end
    object qryPCHeaderGridVAT_Credit: TCurrencyField
      FieldName = 'VAT_Credit'
    end
    object qryPCHeaderGridOrig_Supplier_Invoice_no: TWideStringField
      FieldName = 'Orig_Supplier_Invoice_no'
    end
    object qryPCHeaderGridAccount_Code: TWideStringField
      FieldName = 'Account_Code'
    end
    object qryPCHeaderGridDate_Created: TDateTimeField
      FieldName = 'Date_Created'
    end
    object qryPCHeaderGridNew_Date: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'New_Date'
      Calculated = True
    end
  end
  object dsPCHeaderGrid: TDataSource
    DataSet = qryPCHeaderGrid
    Left = 248
    Top = 120
  end
  object qryPOLinePInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_Order,'
      '        Line,'
      '        Supplier_invoice_Line.Goods_Value,'
      '        Qty_Invoiced,'
      '        Supplier_Invoice_Line.Price_unit,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Price_unit.Price_Unit_Factor,'
      '        Supplier_invoice.Supplier,'
      '        Supplier.Name as Supplier_Name,'
      '        Supplier_Invoice_no,'
      '        Invoice_Date,'
      '        Supplier_invoice.Supplier_invoice,'
      '        Invoice_Line_no,'
      '        (select sum(Amount) from'
      '        Supplier_Invoice_Charge'
      
        '        where Supplier_Invoice.supplier_invoice = supplier_Invoi' +
        'ce_Charge.supplier_invoice and'
      
        '              Supplier_Invoice_Line.Purchase_Order = supplier_In' +
        'voice_Charge.Purchase_Order and'
      
        '              Supplier_Invoice_Line.Line = supplier_Invoice_Char' +
        'ge.Line) as Total_Charges'
      
        'from Supplier_Invoice_Line, Supplier_invoice, Supplier, Price_un' +
        'it'
      'where Supplier_Invoice_Line.Purchase_Order = :Purchase_Order and'
      '      Supplier_Invoice_Line.Line = :Line and'
      
        '      Supplier_invoice_Line.Supplier_invoice <> :Supplier_invoic' +
        'e and'
      
        '      Supplier_invoice_Line.Supplier_invoice = Supplier_invoice.' +
        'Supplier_invoice and'
      
        '      Supplier_invoice_Line.Price_unit = Price_unit.Price_unit a' +
        'nd'
      '      Supplier_invoice.Supplier = Supplier.Supplier'
      ''
      ' '
      ' ')
    Left = 128
    Top = 280
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier_invoice'
      end>
  end
  object qryJBLinePInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_Order,'
      '        Line,'
      '        Supplier_invoice_Line.Goods_Value,'
      '        Qty_Invoiced,'
      '        Supplier_Invoice_Line.Price_unit,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Price_unit.Price_Unit_Factor,'
      '        Supplier_invoice.Supplier,'
      '        Supplier.Name as Supplier_Name,'
      '        Supplier_Invoice_no,'
      '        Invoice_Date,'
      '        Supplier_invoice.Supplier_invoice,'
      '        Invoice_Line_no'
      
        'from Supplier_Invoice_Line, Supplier_invoice, Supplier, Price_un' +
        'it'
      'where Supplier_Invoice_Line.Job_Bag = :Job_Bag and'
      '      Supplier_Invoice_Line.Job_Bag_Line = :Job_Bag_Line and'
      
        '      Supplier_invoice_Line.Supplier_invoice <> :Supplier_invoic' +
        'e and'
      
        '      Supplier_invoice_Line.Supplier_invoice = Supplier_invoice.' +
        'Supplier_invoice and'
      
        '      Supplier_invoice_Line.Price_unit = Price_unit.Price_unit a' +
        'nd'
      '      Supplier_invoice.Supplier = Supplier.Supplier'
      ''
      ' '
      ' ')
    Left = 216
    Top = 280
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end
      item
        Name = 'Supplier_invoice'
      end>
  end
  object qryProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purchase_Nominal'
      'from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 24
    Top = 296
    ParamData = <
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end>
  end
  object qryPOsSalesInvd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1000  Purchase_OrderLine.Purchase_Order,'
      '          Purchase_OrderLine.Line,'
      '          Purchase_Order.Date_Point,'
      '          Purchase_OrderLine.Suppliers_Desc,'
      
        '          (Purchase_OrderLine.Quantity - (Purchase_OrderLine.Qty' +
        '_Supp_Inv'
      
        '          + Purchase_OrderLine.Qty_Supp_Inv_Pend)) as Invoice_Qu' +
        'antity,'
      '          Purchase_OrderLine.Quantity,'
      '          Purchase_OrderLine.Order_Price,'
      '          Purchase_OrderLine.Product_Type,'
      '          Purchase_OrderLine.Order_Unit,'
      '          Purchase_OrderLine.Supp_Inv_Recd,'
      '          Purchase_OrderLine.On_Hold,'
      '          Purchase_OrderLine.Cust_Order_No,'
      '          Supplier.Name as Supplier_Name,'
      '          Supplier_Branch.Name as Branch_Name,'
      '          Purchase_OrderLine.Purch_Ord_Line_Status,'
      
        '          Purch_Ord_Line_Status.Description as Status_Descriptio' +
        'n,'
      '          Vat_code.Vat_Rate,'
      '          Supplier.Vat_Code_Def as Supplier_Vat_Code,'
      '          Purchase_Order.Currency_Code,'
      '          Price_Unit.Description as Price_Unit_Description,'
      '          Price_Unit.Price_Unit_Factor,'
      '          Customer.Name as Customer_Name,'
      '          Purchase_Order.Needs_Authorising,'
      '          Purchase_Order.Authorised_By,'
      '          (SELECT Job_Bag_Line_Dets.Job_Bag'
      '           FROM Job_Bag_Line_Dets'
      
        '           WHERE Job_Bag_Line_Dets.Purchase_Order = Purchase_Ord' +
        'erLine.Purchase_Order AND'
      
        '                 Job_Bag_Line_Dets.Line = Purchase_OrderLine.Lin' +
        'e) as Job_Bag,'
      '          (SELECT TOP 1 sales_invoice.sales_invoice_no'
      '           FROM sales_invoice_line, sales_invoice'
      
        '           WHERE ((sales_invoice_line.purchase_order = Purchase_' +
        'OrderLine.Purchase_Order) AND'
      
        '                 (sales_invoice_line.Line = Purchase_OrderLine.L' +
        'ine)) AND'
      
        '                 (sales_invoice_line.sales_invoice = sales_invoi' +
        'ce.sales_invoice) AND'
      '                 (Sales_Invoice.Invoice_or_Credit = '#39'I'#39')'
      
        '           ORDER BY sales_invoice.sales_invoice DESC) as Sales_I' +
        'nvoice_no,'
      '          (SELECT TOP 1 sales_invoice.Invoice_Date'
      '           FROM sales_invoice_line, sales_invoice'
      
        '           WHERE ((sales_invoice_line.purchase_order = Purchase_' +
        'OrderLine.Purchase_Order) AND'
      
        '                 (sales_invoice_line.Line = Purchase_OrderLine.L' +
        'ine)) AND'
      
        '                 (sales_invoice_line.sales_invoice = sales_invoi' +
        'ce.sales_invoice) AND'
      '                 (Sales_Invoice.Invoice_or_Credit = '#39'I'#39')'
      
        '           ORDER BY sales_invoice.sales_invoice DESC) as Invoice' +
        '_Date'
      'from '#9'Purchase_OrderLine,'
      #9'Purch_Ord_Line_Status,'
      '       '#9'Supplier, Supplier_Branch,'
      '       '#9'VAT_Code, Purchase_Order, Price_Unit, Customer'
      'where'
      '(Supplier.Name Like :Code_From) AND'
      '(Purchase_orderLine.Order_Price >= :Include_Value) AND'
      '((Purchase_OrderLine.Quantity - (Purchase_OrderLine.Qty_Supp_Inv'
      '          + Purchase_OrderLine.Qty_Supp_Inv_Pend)) > 0) and'
      '(Purchase_OrderLine.Purch_Ord_Line_Status >= 25) AND'
      '(Purchase_Order.Supplier = Supplier.Supplier) AND'
      '('
      '(Purchase_Order.Supplier = Supplier_Branch.Supplier) AND'
      '(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)'
      ') AND'
      '(Purchase_OrderLine.Customer = Customer.Customer) AND'
      '(Supplier.VAT_Code_Def = VAT_Code.VAT_Code) and'
      
        '(Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_OrderLine.Order_Unit = Price_Unit.Price_Unit)'
      'AND'
      
        '(Purchase_OrderLine.Purch_Ord_Line_Status = Purch_Ord_Line_Statu' +
        's.Purch_Ord_Line_Status)'
      'Order by Purchase_Order.Purchase_Order desc')
    Left = 112
    Top = 168
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Include_Value'
      end>
    object qryPOsSalesInvdPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryPOsSalesInvdLine: TIntegerField
      FieldName = 'Line'
    end
    object qryPOsSalesInvdSuppliers_Desc: TWideStringField
      FieldName = 'Suppliers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryPOsSalesInvdInvoice_Quantity: TFloatField
      FieldName = 'Invoice_Quantity'
    end
    object qryPOsSalesInvdOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryPOsSalesInvdProduct_Type: TIntegerField
      FieldName = 'Product_Type'
    end
    object qryPOsSalesInvdOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryPOsSalesInvdSupp_Inv_Recd: TWideStringField
      FieldName = 'Supp_Inv_Recd'
      FixedChar = True
      Size = 2
    end
    object qryPOsSalesInvdSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryPOsSalesInvdBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object qryPOsSalesInvdStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      FixedChar = True
      Size = 80
    end
    object qryPOsSalesInvdVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryPOsSalesInvdSupplier_Vat_Code: TIntegerField
      FieldName = 'Supplier_Vat_Code'
    end
    object qryPOsSalesInvdCurrency_Code: TIntegerField
      FieldName = 'Currency_Code'
    end
    object qryPOsSalesInvdPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryPOsSalesInvdDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryPOsSalesInvdCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryPOsSalesInvdPOLine: TWideStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryPOsSalesInvdPOLineGetText
      Size = 15
      Calculated = True
    end
    object qryPOsSalesInvdQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryPOsSalesInvdPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryPOsSalesInvdNeeds_Authorising: TWideStringField
      FieldName = 'Needs_Authorising'
      Size = 1
    end
    object qryPOsSalesInvdOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Size = 1
    end
    object qryPOsSalesInvdAuthorised_By: TIntegerField
      FieldName = 'Authorised_By'
    end
    object qryPOsSalesInvdJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryPOsSalesInvdSales_Invoice_No: TWideStringField
      FieldName = 'Sales_Invoice_No'
    end
    object qryPOsSalesInvdInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qryPOsSalesInvdPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryPOsSalesInvdCust_Order_No: TWideStringField
      FieldName = 'Cust_Order_No'
      Size = 30
    end
  end
  object qrySelInvPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select supplier_invoice_line.purchase_order,'
      'purch_ord.purch_ord_no as purch_ord,'
      'supplier_invoice_line.Job_Bag '
      'from supplier_invoice_line left join purch_ord'
      '  on supplier_invoice_line.purch_ord = purch_ord.purch_ord '
      'where supplier_invoice_line.supplier_invoice = :SInv'
      'order by supplier_invoice_line.Invoice_Line_No '
      ' '
      ' ')
    Left = 176
    Top = 96
    ParamData = <
      item
        Name = 'SInv'
      end>
  end
  object qrySIPurchOrdLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct (Purch_Ord)'
      'from supplier_invoice_line '
      'where supplier_invoice = :Supplier_Invoice'
      'order by purch_ord;'
      ' ')
    Left = 224
    Top = 196
    ParamData = <
      item
        Name = 'Supplier_Invoice'
      end>
  end
  object qryGetPOInvs: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Purchase_Order,'
      '        Line,'
      '        Supplier_invoice_Line.Goods_Value,'
      '        Qty_Invoiced,'
      '        Supplier_Invoice_Line.Price_unit,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Price_unit.Price_Unit_Factor,'
      '        Supplier_invoice.Supplier,'
      '        Supplier_Invoice_no,'
      '        Invoice_Date,'
      '        Supplier_invoice.Supplier_invoice,'
      '        Invoice_Line_no,'
      '        Supplier_invoice_Line.Vat_Code,'
      '        Vat_Rate,'
      '        (select sum(Amount) from'
      '        Supplier_Invoice_Charge'
      
        '        where Supplier_Invoice.supplier_invoice = supplier_Invoi' +
        'ce_Charge.supplier_invoice and'
      
        '              Supplier_Invoice_Line.Purchase_Order = supplier_In' +
        'voice_Charge.Purchase_Order and'
      
        '              Supplier_Invoice_Line.Line = supplier_Invoice_Char' +
        'ge.Line) as Total_Charges'
      
        'from Supplier_Invoice_Line, Supplier_invoice, Price_unit, Vat_Co' +
        'de'
      'where Supplier_Invoice_Line.Purchase_Order = :Purchase_Order and'
      '      Supplier_Invoice_Line.Line = :Line and'
      
        '      Supplier_invoice_Line.Supplier_invoice = Supplier_invoice.' +
        'Supplier_invoice and'
      
        '      Supplier_invoice_Line.Price_unit = Price_unit.Price_unit a' +
        'nd'
      '      Supplier_invoice_Line.vat_code = vat_code.vat_code')
    Left = 624
    Top = 8
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetJBInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_Order,'
      '        Line,'
      '        Supplier_invoice_Line.Goods_Value,'
      '        Qty_Invoiced,'
      '        Supplier_Invoice_Line.Price_unit,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Price_unit.Price_Unit_Factor,'
      '        Supplier_invoice.Supplier,'
      '        Supplier_Invoice_no,'
      '        Invoice_Date,'
      '        Supplier_invoice.Supplier_invoice,'
      '        Invoice_Line_no,'
      '        Supplier_invoice_Line.Vat_Code,'
      '        Vat_Rate'
      
        'from Supplier_Invoice_Line, Supplier_invoice, Price_unit, Vat_Co' +
        'de'
      'where Supplier_Invoice_Line.Job_Bag = :Job_Bag and'
      '      Supplier_Invoice_Line.Job_Bag_Line = :Job_Bag_Line and'
      
        '      Supplier_invoice_Line.Supplier_invoice = Supplier_invoice.' +
        'Supplier_invoice and'
      
        '      Supplier_invoice_Line.Price_unit = Price_unit.Price_unit a' +
        'nd'
      '      Supplier_invoice_Line.vat_code = vat_code.vat_code')
    Left = 624
    Top = 64
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetPurchLineInvs: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Purchase_Order,'
      '        Line,'
      '        Supplier_invoice_Line.Goods_Value,'
      '        Qty_Invoiced,'
      '        Supplier_Invoice_Line.Price_unit,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Price_unit.Price_Unit_Factor,'
      '        Supplier_invoice.Supplier,'
      '        Supplier_Invoice_no,'
      '        Invoice_Date,'
      '        Supplier_invoice.Supplier_invoice,'
      '        Invoice_Line_no,'
      '        Supplier_invoice_Line.Vat_Code,'
      '        Vat_Rate'
      
        'from Supplier_Invoice_Line, Supplier_invoice, Price_unit, Vat_Co' +
        'de'
      'where Supplier_Invoice_Line.Purch_Ord = :Purch_Ord and'
      
        '      Supplier_Invoice_Line.Purch_Ord_Line_no = :Purch_Ord_Line_' +
        'no and'
      
        '      Supplier_invoice_Line.Supplier_invoice = Supplier_invoice.' +
        'Supplier_invoice and'
      
        '      Supplier_invoice_Line.Price_unit = Price_unit.Price_unit a' +
        'nd'
      '      Supplier_invoice_Line.vat_code = vat_code.vat_code')
    Left = 624
    Top = 120
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_no'
      end>
  end
  object qryPOsDeliv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1000  Purchase_OrderLine.Purchase_Order,'
      '          Purchase_OrderLine.Line,'
      '          Purchase_Order.Date_Point,'
      '          Purchase_OrderLine.Suppliers_Desc,'
      
        '          (Purchase_OrderLine.Quantity - (Purchase_OrderLine.Qty' +
        '_Supp_Inv'
      
        '          + Purchase_OrderLine.Qty_Supp_Inv_Pend)) as Invoice_Qu' +
        'antity,'
      '          Purchase_OrderLine.Quantity,'
      '          Purchase_OrderLine.Order_Price,'
      '          Purchase_OrderLine.Product_Type,'
      '          Purchase_OrderLine.Order_Unit,'
      '          Purchase_OrderLine.Supp_Inv_Recd,'
      '          Purchase_OrderLine.On_Hold,'
      '          Purchase_OrderLine.Cust_Order_No,'
      '          Supplier.Name as Supplier_Name,'
      '          Supplier_Branch.Name as Branch_Name,'
      '          Purchase_OrderLine.Purch_Ord_Line_Status,'
      
        '          Purch_Ord_Line_Status.Description as Status_Descriptio' +
        'n,'
      '          Vat_code.Vat_Rate,'
      '          Supplier.Vat_Code_Def as Supplier_Vat_Code,'
      '          Purchase_Order.Currency_Code,'
      '          Price_Unit.Description as Price_Unit_Description,'
      '          Price_Unit.Price_Unit_Factor,'
      '          Customer.Name as Customer_Name,'
      '          Purchase_Order.Needs_Authorising,'
      '          Purchase_Order.Authorised_By,'
      '          (SELECT Job_Bag_Line_Dets.Job_Bag'
      '           FROM Job_Bag_Line_Dets'
      
        '           WHERE Job_Bag_Line_Dets.Purchase_Order = Purchase_Ord' +
        'erLine.Purchase_Order AND'
      
        '                 Job_Bag_Line_Dets.Line = Purchase_OrderLine.Lin' +
        'e) as Job_Bag,'
      '          (SELECT TOP 1 sales_invoice.sales_invoice_no'
      '           FROM sales_invoice_line, sales_invoice'
      
        '           WHERE ((sales_invoice_line.purchase_order = Purchase_' +
        'OrderLine.Purchase_Order) AND'
      
        '                 (sales_invoice_line.Line = Purchase_OrderLine.L' +
        'ine)) AND'
      
        '                 (sales_invoice_line.sales_invoice = sales_invoi' +
        'ce.sales_invoice) AND'
      '                 (Sales_Invoice.Invoice_or_Credit = '#39'I'#39')'
      
        '           ORDER BY sales_invoice.sales_invoice DESC) as Sales_I' +
        'nvoice_no,'
      '          (SELECT TOP 1 sales_invoice.Invoice_Date'
      '           FROM sales_invoice_line, sales_invoice'
      
        '           WHERE ((sales_invoice_line.purchase_order = Purchase_' +
        'OrderLine.Purchase_Order) AND'
      
        '                 (sales_invoice_line.Line = Purchase_OrderLine.L' +
        'ine)) AND'
      
        '                 (sales_invoice_line.sales_invoice = sales_invoi' +
        'ce.sales_invoice) AND'
      '                 (Sales_Invoice.Invoice_or_Credit = '#39'I'#39')'
      
        '           ORDER BY sales_invoice.sales_invoice DESC) as Invoice' +
        '_Date'
      'from '#9'Purchase_OrderLine,'
      #9'Purch_Ord_Line_Status,'
      '       '#9'Supplier, Supplier_Branch,'
      '       '#9'VAT_Code, Purchase_Order, Price_Unit, Customer'
      'where'
      '(Supplier.Name Like :Code_From) AND'
      '(Purchase_orderLine.Order_Price >= :Include_Value) AND'
      '((Purchase_OrderLine.Quantity - (Purchase_OrderLine.Qty_Supp_Inv'
      '          + Purchase_OrderLine.Qty_Supp_Inv_Pend)) > 0) and'
      '(Purchase_OrderLine.Purch_Ord_Line_Status >= 21) AND'
      '(Purchase_Order.Supplier = Supplier.Supplier) AND'
      '('
      '(Purchase_Order.Supplier = Supplier_Branch.Supplier) AND'
      '(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)'
      ') AND'
      '(Purchase_OrderLine.Customer = Customer.Customer) AND'
      '(Supplier.VAT_Code_Def = VAT_Code.VAT_Code) and'
      
        '(Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_OrderLine.Order_Unit = Price_Unit.Price_Unit)'
      'AND'
      
        '(Purchase_OrderLine.Purch_Ord_Line_Status = Purch_Ord_Line_Statu' +
        's.Purch_Ord_Line_Status)'
      'Order by Purchase_Order.Purchase_Order desc')
    Left = 112
    Top = 224
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Include_Value'
      end>
    object qryPOsDelivPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryPOsDelivLine: TIntegerField
      FieldName = 'Line'
    end
    object qryPOsDelivDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryPOsDelivSuppliers_Desc: TWideStringField
      FieldName = 'Suppliers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryPOsDelivInvoice_Quantity: TFloatField
      FieldName = 'Invoice_Quantity'
    end
    object qryPOsDelivQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryPOsDelivOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryPOsDelivProduct_Type: TIntegerField
      FieldName = 'Product_Type'
    end
    object qryPOsDelivOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryPOsDelivSupp_Inv_Recd: TWideStringField
      FieldName = 'Supp_Inv_Recd'
      FixedChar = True
      Size = 2
    end
    object qryPOsDelivSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryPOsDelivBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object qryPOsDelivStatus_Description: TStringField
      FieldName = 'Status_Description'
      FixedChar = True
      Size = 80
    end
    object qryPOsDelivVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryPOsDelivSupplier_Vat_Code: TIntegerField
      FieldName = 'Supplier_Vat_Code'
    end
    object qryPOsDelivCurrency_Code: TIntegerField
      FieldName = 'Currency_Code'
    end
    object qryPOsDelivPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryPOsDelivPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryPOsDelivCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 92
    end
    object qryPOsDelivPOLine: TStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryPOsDelivPOLineGetText
      Calculated = True
    end
    object qryPOsDelivNeeds_Authorising: TStringField
      FieldName = 'Needs_Authorising'
      Size = 1
    end
    object qryPOsDelivOn_Hold: TStringField
      FieldName = 'On_Hold'
      Size = 1
    end
    object qryPOsDelivAuthorised_By: TIntegerField
      FieldName = 'Authorised_By'
    end
    object qryPOsDelivJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryPOsDelivSales_Invoice_no: TStringField
      FieldName = 'Sales_Invoice_no'
    end
    object qryPOsDelivInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qryPOsDelivPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryPOsDelivCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      Size = 30
    end
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Operator'
      'where Operator = :Operator')
    Left = 632
    Top = 408
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryCheckSInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select top 1 Supplier.Name, Supplier_invoice_no, Goods_Value, In' +
        'voice_Date, Supp_Invoice_Status'
      'from Supplier_invoice, Supplier'
      'where Supplier_Invoice_no = :Supplier_Invoice_no and'
      'Supplier_Invoice.Supplier = :Supplier and'
      'Supplier_Invoice.Branch_No = :Branch_No and'
      'Supplier_invoice.Supplier = Supplier.Supplier')
    Left = 240
    Top = 408
    ParamData = <
      item
        Name = 'Supplier_Invoice_no'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryPassSInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Supplier_Invoice'
      'set Supp_invoice_Status = 20'
      'where supplier = :Supplier and '
      'Branch_no = :Branch_no and '
      'supplier_invoice_no = :supplier_invoice_no')
    Left = 240
    Top = 352
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'supplier_invoice_no'
      end>
  end
  object qryUpPOPIStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Purchase_Orderline'
      'set Supp_inv_Recd = '#39'Y'#39
      'from Supplier_invoice_line'
      'where Supplier_invoice_line.Purchase_Order = :Purchase_Order and'
      'Supplier_invoice_Line.Line = :Line and'
      
        '((Supplier_invoice_Line.Purchase_Order = Purchase_orderLine.Purc' +
        'hase_Order) and'
      '(Supplier_Invoice_Line.Line = Purchase_Orderline.Line))')
    Left = 624
    Top = 176
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetSupplier: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from supplier'
      'where supplier = :Supplier')
    Left = 624
    Top = 232
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryGetPOInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice.Sales_Invoice_No, Sales_Invoice.Invoice_Dat' +
        'e as Sales_invoice_Date'
      'FROM Sales_Invoice_Line, Sales_Invoice'
      'WHERE '
      '((Sales_Invoice_Line.Purchase_Order = :Purchase_Order) AND'
      '(Sales_Invoice_Line.Line = 1)) AND'
      
        '(Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice)' +
        ' AND'
      '(Sales_Invoice.Invoice_or_Credit = '#39'I'#39')')
    Left = 624
    Top = 288
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
end
