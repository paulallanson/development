object dtmdlPOrders: TdtmdlPOrders
  OldCreateOrder = False
  Left = 99
  Top = 106
  Height = 451
  Width = 676
  object qryPOHeaderGrid: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select '#9'purch_ord,'
      #9'purch_ord_no,'
      #9'purch_ord_date,'
      #9'date_required,'
      #9'sales_order,'
      #9'purch_ord.supplier,'
      #9'purch_ord.Branch_no,'
      #9'supplier.Name as Supplier_Name,'
      #9'supplier_branch.Name as Branch_Name,'
      #9'purch_ord_descr,'
      #9'purch_ord_rec_ref,'
      #9'purch_ord.purch_ord_status,'
      #9'purch_ord_Status.Status_Descr as Status_Description,'
      '  supplier_branch.account_code,'
      '  (Supplier.Name + '#39','#39' + supplier_branch.Name) as From_Name,'
      '  Part_Store_from,'
      '  Part_Store,'
      '  Requested_by,'
      '  (select Name'
      '   from Operator'
      
        '   where Operator.Operator = Purch_Ord.Operator) as Operator_Nam' +
        'e'
      'from '#9'purch_ord, '
      #9'supplier_branch, '
      #9'supplier, '
      #9'purch_ord_status'
      'where '
      
        #9'(purch_ord.purch_ord_status = purch_ord_status.purch_ord_status' +
        ') and'
      #9'('
      #9'(purch_ord.supplier = supplier_branch.supplier) and'
      #9'(purch_ord.branch_no = supplier_branch.branch_no)'
      #9') and'
      #9'(supplier_branch.supplier = supplier.supplier) and'
      '  ('
      '  (Supplier.Name Like :Supplier) or'
      '  (Supplier_Branch.Account_code Like :Supplier)'
      '  )'
      'order by Purch_ord_no desc'
      ' ')
    Left = 40
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object dtsPOHeaderGrid: TDataSource
    DataSet = qryPOHeaderGrid
    Left = 128
    Top = 16
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 40
    Top = 80
  end
  object qryUpd: TQuery
    DatabaseName = 'PB'
    Left = 112
    Top = 80
  end
  object qryUpdPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord_Line'
      'Set'
      'Quantity_Received = Quantity_Ordered,'
      'Quantity_Sent = Quantity_Ordered,'
      'Date_Deliv_Actual = :Date_Deliv_Actual,'
      'GRN_No = :GRN_No,'
      'Fully_Received = :Fully_Received'
      'Where (Purch_Ord = :Purch_Ord) and'
      '      (Purch_Ord_Line_No = :Purch_Ord_Line_No)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 352
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRN_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fully_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOLines: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Purch_Ord_Line.Purch_Ord,'
      '        Purch_Ord_Line.Purch_Ord_Line_No,'
      '        Purch_Ord_Line.Quantity_Ordered,'
      '        Purch_Ord.Purch_Ord_No,'
      '        Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no'
      'FROM ((Purch_Ord'
      '        INNER JOIN Purch_Ord_Line'
      '          ON Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord)'
      '        INNER JOIN Sales_Order'
      '          ON Purch_Ord.Sales_order = Sales_Order.Sales_Order)'
      '        INNER JOIN Sales_Order_line'
      
        '          ON (Purch_Ord_Line.Part = Sales_Order_line.Part) AND (' +
        'Sales_Order.Sales_Order = Sales_Order_line.Sales_Order)'
      'WHERE Purch_Ord_line.Purch_Ord = :Purch_Ord'
      'Order by Purch_Ord_Line_no')
    Left = 256
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryCheckPOStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Purch_Ord.Purch_Ord_Status,'
      '       (Select Count(Purch_Ord_Line_No)'
      '               From Purch_Ord_Line'
      '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      
        '                     (Purch_Ord_Line.Fully_Received = '#39'N'#39')) as N' +
        'o_Not_Deliv,'
      '       (Select Count(Purch_Ord_Line_No)'
      '               From Purch_Ord_Line'
      '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      
        '                     (Purch_Ord_Line.Fully_Received = '#39'Y'#39')) as N' +
        'o_Deliv,'
      '       (Select Count(Purch_Ord_Line_No)'
      '               From Purch_Ord_Line'
      '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      
        '                     (Purch_Ord_Line.Fully_Received = '#39'P'#39')) as N' +
        'o_Part_Deliv,'
      '       (Select sum(Qty_Invoiced)'
      '               From Purch_Ord_Line'
      
        '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord)) as' +
        ' Qty_Invoiced,'
      '       (Select sum(Quantity_Received)'
      '               From Purch_Ord_Line'
      
        '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord)) as' +
        ' Qty_Received'
      'From Purch_Ord'
      'Where  (Purch_Ord.Purch_Ord = :Purch_Ord)'
      ''
      ''
      '')
    Left = 448
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPOStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord'
      'Set'
      'Purch_Ord_Status = :Purch_Ord_Status'
      'Where (Purch_Ord = :Purch_Ord)'
      ' '
      ' '
      ' ')
    Left = 560
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
end
