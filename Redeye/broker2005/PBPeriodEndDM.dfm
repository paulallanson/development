object dmPeriodEnd: TdmPeriodEnd
  OldCreateOrder = False
  Left = 55
  Top = 92
  Height = 479
  Width = 741
  object qryUpdPeriod: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Period'
      '        (Period,'
      '        Period_Year,'
      '        Description,'
      '        Period_no,'
      '        Period_End_date,'
      '        Last_Period_End_Date)'
      'Values (:Period,'
      '        :Period_Year,'
      '        :Description,'
      '        :Period_no,'
      '        :Period_End_date,'
      '        :Last_Period_End_Date)'
      ''
      ' ')
    Left = 24
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period_Year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period_End_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Last_Period_End_Date'
        ParamType = ptUnknown
      end>
  end
  object qryPeriod: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 *'
      'from period'
      'order by period desc')
    Left = 96
    Top = 8
  end
  object qryNextPeriod: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Max(period) as Last_Period'
      'from Period')
    Left = 160
    Top = 8
  end
  object qrySalesInv: TQuery
    DatabaseName = 'PB'
    Left = 24
    Top = 72
  end
  object qryAddSalesProfit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Sales_Profit'
      '  (Sales_Profit,'
      '  Sales_invoice,'
      '  Total_Sales_Value,'
      '  Customer,'
      '  Branch_no0,'
      '  Rep,'
      '  Purchase_Order,'
      '  Line,'
      '  Supplier,'
      '  Branch_no,'
      '  Total_Cost_Value,'
      '  Sales_order,'
      '  Period,'
      '  Job_Bag,'
      '  Job_Bag_Line,'
      '  Office_Contact,'
      '  Account_Team,'
      '  Rep_Team,'
      '  Product_Type,'
      '  Category,'
      '  Sub_Rep,'
      '  Invoice_Location,'
      '  Total_Invoiced_Cost_Value)'
      'Values'
      '  (:Sales_Profit,'
      '  :Sales_invoice,'
      '  :Total_Sales_Value,'
      '  :Customer,'
      '  :Branch_no0,'
      '  :Rep,'
      '  :Purchase_Order,'
      '  :Line,'
      '  :Supplier,'
      '  :Branch_no,'
      '  :Total_Cost_Value,'
      '  :Sales_order,'
      '  :Period,'
      '  :Job_Bag,'
      '  :Job_Bag_Line,'
      '  :Office_Contact,'
      '  :Account_Team,'
      '  :Rep_Team,'
      '  :Product_Type,'
      '  :Category,'
      '  :Sub_Rep,'
      '  :Invoice_Location,'
      '  :Total_Invoiced_Cost_Value)')
    Left = 96
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Profit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Total_Sales_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no0'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
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
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Total_Cost_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
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
      end
      item
        DataType = ftInteger
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Category'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sub_Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoice_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Invoiced_Cost_Value'
        ParamType = ptUnknown
      end>
  end
  object qryGetPO: TQuery
    DatabaseName = 'PB'
    Left = 160
    Top = 72
  end
  object qryGetLastSProfit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Max(Sales_Profit) as Last_Sales_Profit'
      'from'
      'Sales_Profit')
    Left = 224
    Top = 80
  end
  object qryPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Purchase_Order'
      'where Purchase_Order = :Purchase_Order')
    Left = 24
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Purchase_orderLine.Purchase_order,'
      '       Line,'
      '       Customer,'
      '       Purchase_orderLine.Branch_no,'
      '       Rep,'
      '       Order_Price,'
      '       Quantity,'
      '       Office_Contact,'
      '       Account_Team,'
      '       Price_unit.Price_unit,'
      '       Price_unit.Price_unit_Factor,'
      '       (select sum(Amount)'
      '        from Purch_ord_Line_Add_Chg'
      
        '        where Purch_ord_Line_Add_Chg.Purchase_order = Purchase_o' +
        'rderLine.Purchase_Order AND'
      
        '                   Purch_ord_Line_Add_Chg.Line = Purchase_OrderL' +
        'ine.Line and'
      '                   ('
      '                   (Purch_ord_Line_Add_Chg.Sales_profit is null)'
      '                   )) as Total_Charges'
      'from Purchase_orderLine, Price_unit, Purchase_Order'
      'where Purchase_orderLine.Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      '(Purchase_orderLine.Order_unit = Price_unit.Price_unit) and'
      
        '(Purchase_orderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er)'
      '')
    Left = 24
    Top = 200
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
  object qrySO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Order,'
      '        Supplier,'
      '        Branch_no0,'
      '        Replenish_Source.Replenish_Source,'
      '        Replenish_ID,'
      '        Office_Contact,'
      '        Account_Team'
      'from Sales_order, Replenish_Source'
      'where Sales_order = :Sales_order and'
      
        '(Sales_order.Replenish_Source = Replenish_Source.Replenish_Sourc' +
        'e)'
      ' ')
    Left = 96
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object qrySORep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 *'
      'from Sales_OrderRep'
      'where Sales_order = :Sales_order')
    Left = 96
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from company'
      'where company = 1')
    Left = 160
    Top = 144
  end
  object qrySOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_order_line'
      'where Sales_order = :Sales_Order and'
      'Sales_order_Line_no = :Sales_order_Line_no')
    Left = 96
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryPurchOrd: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Purch_Ord.Purch_ord,'
      '       Purch_ord_Line.Purchase_Price,'
      #9'Purch_ord_line.Purch_pack_Quantity'
      'from Purch_ord, Purch_Ord_Line'
      'where Purch_Ord.Sales_order = :Sales_Order and'
      #9'Purch_Ord_line.Purch_ord_line_no = :Purch_Ord_Line_no and'
      '(Purch_ord.Purch_ord = Purch_ord_Line.Purch_ord)')
    Left = 160
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qrySinvAddChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Charges'
      'from Sales_invoice_Add_Charge'
      'where Sales_invoice = :Sales_invoice')
    Left = 232
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end>
  end
  object qryUpPOLineChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Purch_Ord_Line_Add_Chg'
      'set Sales_Profit = :Sales_Profit'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line and'
      'Sales_Profit is null')
    Left = 24
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Profit'
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
      end>
  end
  object qrySPOAddChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select SUM(Amount) as Total_Charges'
      'from Purch_Ord, Purch_Ord_Add_Charge'
      'where Purch_Ord.Sales_order = :Sales_Order and'
      'Purch_Ord_Add_Charge.Purch_Ord = Purch_Ord.Purch_Ord and'
      '('
      '(Purch_Ord_add_Charge.Period_end_run <> '#39'Y'#39') or'
      '(Purch_Ord_add_Charge.Period_end_run is null)'
      ')')
    Left = 160
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpSPOchgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Purch_ord_Add_Charge'
      'set Period_end_run = '#39'Y'#39
      'where '
      'Purch_ord = (Select top 1 Purch_Ord from Purch_ord'
      '                      where Sales_order = :Sales_order)')
    Left = 240
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryJB: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Office_Contact, Account_Team'
      'from Job_Bag '
      'where Job_Bag = :Job_Bag')
    Left = 288
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryJBLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Job_Bag_Line_dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 344
    Top = 8
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
  object qryGetPeriod: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Period'
      'where Period = :Period')
    Left = 432
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end>
  end
  object qryUpCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Company'
      'set Financial_year = :Financial_year, Period = :Period')
    Left = 432
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end>
  end
  object qryCustomerReps: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Reps_branches'
      'where customer = :customer and'
      'branch_no = :branch_no and'
      'Rep <> :Rep')
    Left = 432
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object qryRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where Rep = :Rep')
    Left = 432
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object qryProductType: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 432
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
  object qryAddAnalysis: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Analysis'
      '  (Operator,'
      '  Analysis,'
      '  Analysis_Type,'
      '  Sales_invoice,'
      '  Total_Sales_Value,'
      '  Customer,'
      '  Branch_no0,'
      '  Rep,'
      '  Purchase_Order,'
      '  Line,'
      '  Supplier,'
      '  Branch_no,'
      '  Total_Cost_Value,'
      '  Sales_order,'
      '  Job_Bag,'
      '  Job_Bag_Line,'
      '  Office_Contact,'
      '  Account_Team,'
      '  Rep_Team,'
      '  Product_Type,'
      '  Category)'
      'Values'
      '  (:Operator,'
      '  :Analysis,'
      '  :Analysis_Type,'
      '  :Sales_invoice,'
      '  :Total_Sales_Value,'
      '  :Customer,'
      '  :Branch_no0,'
      '  :Rep,'
      '  :Purchase_Order,'
      '  :Line,'
      '  :Supplier,'
      '  :Branch_no,'
      '  :Total_Cost_Value,'
      '  :Sales_order,'
      '  :Job_Bag,'
      '  :Job_Bag_Line,'
      '  :Office_Contact,'
      '  :Account_Team,'
      '  :Rep_Team,'
      '  :Product_Type,'
      '  :Category)'
      ' ')
    Left = 336
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Analysis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Analysis_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Total_Sales_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no0'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
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
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Total_Cost_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_order'
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
      end
      item
        DataType = ftInteger
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
  object qry4Cast: TQuery
    DatabaseName = 'pb'
    Left = 432
    Top = 312
  end
  object qryPOLineCost: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Purchase_orderLine.Purchase_order,'
      '       Line,'
      '       Customer,'
      '       Purchase_orderLine.Branch_no,'
      '       Rep,'
      '       Order_Price,'
      '       Quantity,'
      '       Office_Contact,'
      '       Account_Team,'
      '       Price_unit.Price_unit,'
      '       Price_unit.Price_unit_Factor,'
      '       (select sum(Amount)'
      '        from Purch_ord_Line_Add_Chg'
      
        '        where Purch_ord_Line_Add_Chg.Purchase_order = Purchase_o' +
        'rderLine.Purchase_Order AND'
      
        '                   Purch_ord_Line_Add_Chg.Line = Purchase_OrderL' +
        'ine.Line) as Total_Charges'
      'from Purchase_orderLine, Price_unit, Purchase_Order'
      'where Purchase_orderLine.Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      '(Purchase_orderLine.Order_unit = Price_unit.Price_unit) and'
      
        '(Purchase_orderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er)'
      '')
    Left = 432
    Top = 376
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
  object qryPOInvLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Supplier_Invoice_Line.Supplier_Invoice,'
      '       Supplier_Invoice_Line.Invoice_Line_no,'
      '       Supplier_Invoice_Line.Purchase_order,'
      '       Line,'
      '       Goods_Value,'
      '       Qty_Invoiced,'
      '       Price_unit.Price_unit,'
      '       Price_unit.Price_unit_Factor,'
      '       (select sum(Amount)'
      '        from Supplier_Invoice_Charge'
      
        '        where Supplier_Invoice_Charge.Purchase_Order = Supplier_' +
        'Invoice_Line.Purchase_Order AND'
      
        '                   Supplier_Invoice_Charge.Line = Supplier_Invoi' +
        'ce_Line.Line and'
      '                   ('
      
        '                   (Supplier_Invoice_Charge.Sales_profit is null' +
        ')'
      '                   )) as Total_Charges'
      'from Supplier_Invoice_Line, Price_unit'
      'where Supplier_Invoice_Line.Purchase_Order = :Purchase_Order and'
      'Supplier_Invoice_Line.Line = :Line and'
      '(Supplier_Invoice_Line.Price_unit = Price_unit.Price_unit) and'
      '(Supplier_Invoice_Line.Supp_Invoice_Status >= 20) AND'
      '(Supplier_Invoice_Line.Sales_Profit is NULL)')
    Left = 24
    Top = 320
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
  object qryUpPOInvAddChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Supplier_Invoice_Charge'
      'set Supplier_Invoice_Charge.Sales_Profit = :Sales_Profit'
      'from Supplier_Invoice_Line'
      'where'
      '('
      '(Supplier_Invoice_Charge.Purchase_order = :Purchase_Order) and'
      '(Supplier_Invoice_Charge.Line = :Line)'
      ') and'
      '('
      
        '(Supplier_Invoice_Charge.Purchase_Order = Supplier_Invoice_Line.' +
        'Purchase_Order) and'
      '(Supplier_Invoice_Charge.Line = Supplier_Invoice_Line.Line)'
      ') and'
      '(Supplier_invoice_Line.Supp_Invoice_Status >= 20) and'
      '(Supplier_Invoice_Charge.Sales_Profit is null)')
    Left = 48
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Profit'
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
      end>
  end
  object qryUpPurchInvLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Supplier_Invoice_Line'
      'set Sales_Profit = :Sales_Profit'
      'Where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 160
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Profit'
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
      end>
  end
  object qryGetRepTeam: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Rep_Team'
      'FROM Rep_Team_Member'
      'WHERE Rep = :Rep')
    Left = 504
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
end
