object STPickDM: TSTPickDM
  OldCreateOrder = False
  Left = 132
  Top = 179
  Height = 479
  Width = 814
  object PickListSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store.Part_Store, Stock_Lots_In_Use, Stock_Bins_In_Use'
      'FROM'
      '  Part_Store_Allocation, store_stock, Part_Store'
      'where'
      '  (Part_Store_Allocation.Picking_List_ref <> null) and'
      '  (Part_Store_Allocation.Picking_List_ref <> '#39#39') and'
      
        '  (Part_Store_Allocation.Store_Stock = Store_Stock.Store_Stock) ' +
        'and'
      '  (Store_Stock.Part_Store = Part_Store.Part_Store)'
      'order by Picking_List_Ref'
      ' ')
    Left = 24
    Top = 16
  end
  object PickListSRC: TDataSource
    DataSet = PickListSQL
    Left = 96
    Top = 16
  end
  object PickDtlsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT       Part_Store_Allocation.Store_Stock,'
      '             Part_Store_Allocation.Picking_List_Ref,'
      '             Store_Stock.Part_Bin,'
      '             Store_Stock.Part_Store_Lot,'
      '             Store_Stock.Stock_Pack_Quantity,'
      '             Store_Stock.Date_Received,'
      '             Store_Stock.Store_Stock_Description,'
      '             Store_Stock.Sets_per_Pad,'
      '             Store_Stock.Invoice_Upfront,'
      
        '             SUM(Part_Store_allocation.Quantity_Allocated) as qt' +
        'y_alloc,'
      '             Part_Store.Part_Store,'
      '             Part.Part,  '
      '             Part.Track_Serial_No,'
      '             Part_Store_Allocation.Purch_Ord,'
      '             Part_Store_Allocation.Purch_Ord_Line_No ,'
      '             Part_Store_Allocation.Sales_Order,'
      '             Part_Store_Allocation.Sales_Order_Line_No'
      'FROM (Part INNER JOIN (Store_Stock '
      '           INNER JOIN Part_Store'
      
        '               ON Store_Stock.Part_Store = Part_Store.Part_Store' +
        ')'
      '               ON Part.Part = Store_Stock.Part) '
      '           INNER JOIN Part_Store_Allocation'
      
        '               ON Store_Stock.Store_Stock = Part_Store_Allocatio' +
        'n.Store_Stock'
      'where'
      '  Part_Store_Allocation.Picking_list_Ref = :Picking_List_Ref'
      'GROUP BY'
      '             Part_Store_Allocation.Store_Stock,'
      '             Part_Store_Allocation.Picking_List_Ref, '
      '             Store_Stock.Part_Bin,'
      '             Store_Stock.Part_Store_Lot,'
      '             Store_Stock.Stock_Pack_Quantity,'
      '             Store_Stock.Date_Received,'
      '             Store_Stock.Store_Stock_Description,'
      '             Store_Stock.Sets_per_Pad,'
      '             Store_Stock.Invoice_Upfront,'
      '             Part_Store.Part_Store,'
      '             Part.Part,  '
      '             Part.Track_Serial_No,'
      '             Part_Store_Allocation.Purch_Ord, '
      '             Part_Store_Allocation.Purch_Ord_Line_No,'
      '             Part_Store_Allocation.Sales_Order,'
      '             Part_Store_Allocation.Sales_Order_Line_No'
      'ORDER BY'
      
        'Part_Store.Part_Store, Part.Part, Store_Stock.Part_Bin, Store_St' +
        'ock.Part_Store_Lot'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 24
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'Picking_List_Ref'
        ParamType = ptUnknown
      end>
  end
  object PartSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part_Description, Track_Serial_No'
      'from Part'
      'where Part = :Part')
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object PickDtlsSRC: TDataSource
    DataSet = PickDtlsSQL
    Left = 96
    Top = 72
  end
  object PickPartDtlsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT       Part_Store_Allocation.Store_Stock,'
      '             Part_Store_Allocation.Picking_List_Ref,'
      '             Store_Stock.Part_Bin,'
      '             Store_Stock.Part_Store_Lot,'
      
        '             SUM(Part_Store_allocation.Quantity_Allocated) as qt' +
        'y_alloc,'
      '             Part_Store.Part_Store,'
      '             Part.Part,  '
      '             Part.Track_Serial_No,'
      '             Part_Store_Allocation.Sales_Order,'
      '             Part_Store_Allocation.Sales_Order_Line_No'
      'FROM (Part INNER JOIN (Store_Stock '
      '           INNER JOIN Part_Store'
      
        '               ON Store_Stock.Part_Store = Part_Store.Part_Store' +
        ')'
      '               ON Part.Part = Store_Stock.Part) '
      '           INNER JOIN Part_Store_Allocation'
      
        '               ON Store_Stock.Store_Stock = Part_Store_Allocatio' +
        'n.Store_Stock'
      'where'
      '  ('
      
        '  (Part_Store_Allocation.Picking_list_Ref = :Picking_List_Ref) a' +
        'nd'
      '  (Part.Part = :Part) and'
      '  (Store_Stock.Part_Bin = :Part_Bin) and'
      '  (Store_Stock.Part_Store_Lot = :Part_Store_Lot)'
      '  )'
      'GROUP BY'
      '             Part_Store_Allocation.Store_Stock,'
      '             Part_Store_Allocation.Picking_List_Ref, '
      '             Store_Stock.Part_Bin,'
      '             Store_Stock.Part_Store_Lot,'
      '             Part_Store.Part_Store,'
      '             Part.Part,  '
      '             Part.Track_Serial_No,'
      '             Part_Store_Allocation.Sales_Order,'
      '             Part_Store_Allocation.Sales_Order_Line_No'
      'ORDER BY'
      
        'Part_Store.Part_Store, Store_Stock.Part_Bin, Store_Stock.Part_St' +
        'ore_Lot'
      ''
      ''
      ' '
      ' ')
    Left = 24
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'Picking_List_Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end>
  end
  object StoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Store_Stock.*'
      'from Store_Stock'
      'where Store_Stock = :Store_Stock')
    Left = 24
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object PickHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store.Part_Store, Stock_Lots_In_Use, Stock_Bins_In_Use'
      'FROM'
      '  Part_Store_Allocation, store_stock, Part_Store'
      'where'
      
        '  (Part_Store_Allocation.Picking_List_Ref = :Picking_List_Ref) a' +
        'nd'
      
        '  (Part_Store_Allocation.Store_Stock = Store_Stock.Store_Stock) ' +
        'and'
      '  (Store_Stock.Part_Store = Part_Store.Part_Store)')
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Picking_List_Ref'
        ParamType = ptUnknown
      end>
  end
  object ClearPickSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Part_Store_Allocation'
      'set Picking_List_Ref = null'
      'where Picking_List_Ref = :Picking_List_Ref')
    Left = 24
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Picking_List_Ref'
        ParamType = ptUnknown
      end>
  end
  object UpdPurchOrdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Purch_Ord_line'
      'set Quantity_Sent = Quantity_Sent + :Quantity_Sent'
      'where Purch_Ord = :Purch_Ord and'
      'Purch_Ord_Line_No = :Purch_Ord_Line_No'
      ' ')
    Left = 24
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity_Sent'
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
  object CheckPickBinSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from part_Store_bin'
      'where Part_Store = :Part_Store and'
      'Part_Bin = :Part_Bin')
    Left = 96
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end>
  end
  object CheckPickLotSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from store_Stock'
      'where part = :Part and'
      'Part_Store_lot = :Part_Store_lot')
    Left = 96
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_lot'
        ParamType = ptUnknown
      end>
  end
  object UpdPFJSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Parts_For_Job'
      'set Part_Status = :Part_Status'
      'where Parts_For_Job = :Parts_For_Job')
    Left = 96
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parts_For_Job'
        ParamType = ptUnknown
      end>
  end
  object PartStoreSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Part_Store'
      'where Part_Store = :Part_Store')
    Left = 96
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end>
  end
  object UpdSalesOrdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Order_line'
      
        'set Quantity_Delivered = Quantity_Delivered + :Quantity_Delivere' +
        'd'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_No = :Sales_Order_Line_No'
      ' ')
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object UpdSalesOrdHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Order'
      'set Sales_Order_Head_Status = :Status'
      'where Sales_Order = :Sales_Order')
    Left = 184
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object UpdDirectSalesOrdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Order_line'
      'set Quantity_Delivered = :Quantity_Delivered,'
      'Quantity_Allocated = :Quantity_Allocated'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_No = :Sales_Order_Line_No'
      ' '
      ' '
      ' ')
    Left = 184
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object CheckPickBinLotSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from store_Stock'
      'where (part_Store = :Part_store) and'
      '(Part = :Part) and'
      '(part_Bin = :Part_bin) and'
      '(Part_Store_lot = :Part_Store_lot)'
      '')
    Left = 192
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Store_lot'
        ParamType = ptUnknown
      end>
  end
  object GetStoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Store_Stock'
      'From Store_Stock'
      'Where (Part_Store = :Part_Store) and'
      '      (Part = :Part) and'
      '      ((Part_Bin = :Part_Bin) or (:Part_Bin = '#39#39')) and'
      
        '      ((Part_Store_Lot = :Part_Store_Lot) or (:Part_Store_Lot = ' +
        #39#39'))'
      ''
      ' '
      ' ')
    Left = 192
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end>
  end
  object UpdSalesOrderInvQty: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Order_line'
      'set Quantity_Invoiced = Quantity_Invoiced + :Quantity_Invoiced'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_No = :Sales_Order_Line_No'
      ' '
      ' ')
    Left = 280
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object CheckSOStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Sales_Order.Sales_Order_Head_Status,'
      '       (Select Sum(Quantity_Delivered - Quantity_Invoiced)'
      '               From Sales_Order_Line'
      
        '               Where (Sales_Order_Line.Sales_Order = :Sales_Orde' +
        'r))'
      '       as Qty_Not_Inv,'
      '       (Select Sum(Quantity_Invoiced)'
      '               From Sales_Order_Line'
      
        '               Where (Sales_Order_Line.Sales_Order = :Sales_Orde' +
        'r))'
      '       as Qty_Inv,'
      '       (Select Sum(Quantity_Delivered)'
      '               From Sales_Order_Line'
      
        '               Where (Sales_Order_Line.Sales_Order = :Sales_Orde' +
        'r))'
      '       as Qty_Deliv,'
      '       (Select Sum(Quantity_Allocated)'
      '               From Sales_Order_Line'
      
        '               Where (Sales_Order_Line.Sales_Order = :Sales_Orde' +
        'r))'
      '       as Qty_Alloc'
      'From Sales_Order'
      'Where  (Sales_Order.Sales_Order = :Sales_Order)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 296
    Top = 116
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object UpdOrderStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Sales_Order_Head_Status = :Status'
      'where Sales_Order = :OrderNo')
    Left = 312
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OrderNo'
        ParamType = ptUnknown
      end>
  end
  object UpdSalesOrdDelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Order_Delivery_Line'
      'set Quantity_Delivered = Quantity_Delivered + :Deliv_Qty,'
      '  Quantity_Picked = Quantity_Picked + :Deliv_Qty'
      
        'where (sales_order = :Sales_Order) and (Sales_Order_Line_No = :S' +
        'ales_Order_Line_No)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 302
    Top = 268
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Deliv_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deliv_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object qrySOAddCharge: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select count(*) as LineCount '
      'from Sales_Order_Add_Charge '
      'where '
      '  sales_order = :sales_order ')
    Left = 184
    Top = 332
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrder: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Sales_order, Order_type, Part_Store'
      'from Sales_Order'
      'where sales_order = :sales_order')
    Left = 432
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrderLines: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from sales_order_line'
      'where sales_order = :sales_order'
      'order by sales_order_line_no')
    Left = 432
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryUpdJobBagLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update job_bag_line_dets'
      'set Job_Bag_line_cost = :Job_Bag_Line_Cost,'
      'Job_Bag_Line_Sell = :Job_Bag_Line_Sell,'
      'Job_Bag_line_Invoiced = :Job_Bag_Line_Invoiced,'
      'Job_Bag_Quantity = :Job_Bag_Quantity'
      
        'where sales_order = :sales_order and sales_order_Line_no = :Sale' +
        's_Order_line_no')
    Left = 432
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line_Sell'
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
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_line_no'
        ParamType = ptUnknown
      end>
  end
  object qrySalesOrderJB: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select distinct Order_Type, Job_Bag'
      'from Sales_order, job_bag_stock_request'
      'where Sales_Order.Sales_order = :sales_order and'
      'sales_order.sales_order = job_bag_stock_request.sales_order')
    Left = 432
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryJBChkStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      
        #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag) as Total_Lin' +
        'es,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      #9#9'(Job_Bag_Line_dets.Job_Bag_Line_invoiced <> '#39'Y'#39') and'
      
        '    (Job_Bag_Line_dets.Job_Bag_Line_invoiced <> '#39'C'#39')) as Lines_N' +
        'ot_invoiced,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      '    Job_bag_line_dets.Job_Bag_Line_type = '#39'P'#39') as Total_POs,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      
        '    Job_bag_line_dets.Job_Bag_Line_type = '#39'A'#39') as Total_Sundries' +
        ','
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_Line_dets'
      #9'where Job_Bag_Line_dets.Job_Bag = JoB_Bag.Job_bag and'
      '    Job_bag_line_dets.Job_Bag_Line_type = '#39'S'#39') as Total_SOs'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 432
    Top = 268
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryJBUpHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_bag'
      'Set Job_Bag_Status = :Job_Bag_Status'
      'where Job_Bag = :Job_Bag')
    Left = 512
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetProductionLoc: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Production_Location.Part_Store,  Production_Location.Part' +
        '_Bin'
      'from Sales_Order, Production_location'
      'where Sales_order = :sales_order and '
      
        'Sales_order.Production_Location = Production_location.Production' +
        '_Location')
    Left = 568
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object PartTransferSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part_Transfer'
      'where Store_stock = :Store_Stock and'
      'sales_order = :sales_order and'
      'sales_order_line_no = :sales_order_line_no')
    Left = 568
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order_line_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrderLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from sales_order_line'
      
        'where sales_order = :sales_order and sales_order_line_no = :sale' +
        's_order_line_no')
    Left = 560
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order_line_no'
        ParamType = ptUnknown
      end>
  end
  object qrySOPickHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Sales_Order_Picking.Sales_Order_Picking,'
      
        '  Stock_Lots_In_Use, Stock_Bins_In_Use, Sales_order_Picking.Part' +
        '_Store'
      'FROM'
      '  Sales_Order_Picking, Part_Store'
      'where'
      
        '  (Sales_Order_Picking.Sales_Order_Picking = :Sales_Order_Pickin' +
        'g) and'
      '  (Sales_Order_Picking.Part_Store = Part_Store.Part_Store)')
    Left = 432
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Picking'
        ParamType = ptUnknown
      end>
  end
  object qrySOPickLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_Picking.Sales_Order_Picking,'
      '        Sales_Order_Picking.Picking_No,'
      '        Sales_Order_Picking.Picking_List_Ref,'
      '        Part_Store_Allocation.Store_Stock,'
      '        Store_Stock.Part_Bin,'
      '        Store_Stock.Part_Store_Lot,'
      '        Store_Stock.Stock_Pack_Quantity,'
      '        Store_Stock.Store_Stock_Description,'
      '        Store_Stock.Invoice_Upfront,'
      '        Store_Stock.Date_Received,'
      '        Store_Stock.Sets_per_pad,'
      '        Sales_Order_Picking.Quantity_To_Pick as Qty_Alloc,'
      '        Store_Stock.Part_Store,'
      '        Store_Stock.Part,'
      '        Store_Stock.Purchase_Order,'
      '        Store_Stock.Pallet_ID,'
      '        Store_Stock.Product_ID,'
      '        Store_Stock.Stock_is_Overs,'
      '        Part.Track_Serial_No,'
      '        Part_Store_Allocation.Purch_Ord,'
      '        Part_Store_Allocation.Purch_Ord_Line_No ,'
      '        Part_Store_Allocation.Sales_Order,'
      '        Part_Store_Allocation.Sales_Order_Line_No'
      'FROM Part'
      '      INNER JOIN ((Sales_Order_Picking'
      
        '      INNER JOIN Part_Store_Allocation ON Sales_Order_Picking.Pa' +
        'rt_Store_Allocation = Part_Store_Allocation.Part_Store_Allocatio' +
        'n)'
      
        '      INNER JOIN Store_Stock ON Part_Store_Allocation.Store_Stoc' +
        'k = Store_Stock.Store_Stock) ON Part.Part = Store_Stock.Part'
      'where'
      '  Sales_Order_Picking.Sales_Order_Picking = :Sales_Order_Picking'
      'ORDER BY'
      '      Store_Stock.Part_Store,'
      '      Store_Stock.Part,'
      '      Store_Stock.Part_Bin,'
      '      Store_Stock.Part_Store_Lot'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 512
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Picking'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSOPicking: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order_Picking'
      'set Pick_Note_Confirmed = '#39'Y'#39
      'where Sales_Order_Picking = :Sales_Order_Picking')
    Left = 608
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Picking'
        ParamType = ptUnknown
      end>
  end
  object qrySOPicking: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Sales_Order_Picking.Sales_Order,'
      #9'count(Sales_Order_Picking.Sales_order_Picking) as Pick_Lines,'
      #9'(select count(SOP.Sales_Order_Picking)'
      #9' from Sales_Order_Picking SOP'
      
        #9' where SOP.Sales_Order = Sales_Order_Picking.Sales_Order AND Pi' +
        'ck_Note_Confirmed = '#39'Y'#39') as Pick_Confirmed'
      'from Sales_Order_Picking'
      'GROUP BY Sales_Order_Picking.Sales_Order'
      'HAVING Sales_Order_Picking.Sales_Order = :Sales_Order')
    Left = 608
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qrySOProductionLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Part_Store_Allocation.Store_Stock,'
      '        Store_Stock.Part_Bin,'
      '        Store_Stock.Part_Store_Lot,'
      '        Store_Stock.Stock_Pack_Quantity,'
      '        Store_Stock.Store_Stock_Description,'
      '        Store_Stock.Invoice_Upfront,'
      '        Store_Stock.Date_Received,'
      '        Store_Stock.Sets_per_pad,'
      '        Store_Stock.Purchase_Order,'
      '        Store_Stock.Pallet_ID,'
      '        Store_Stock.Product_ID,'
      '        Store_Stock.Stock_is_Overs,'
      '        Part_Store_Allocation.Quantity_Allocated,'
      '        Part_Store_Allocation.Quantity_Over_Picked,'
      '        Part_Store_Allocation.Quantity_Overs,'
      '        Store_Stock.Part_Store,'
      '        Store_Stock.Part,'
      '        Part.Track_Serial_No,'
      '        Part_Store_Allocation.Purch_Ord,'
      '        Part_Store_Allocation.Purch_Ord_Line_No,'
      '        Part_Store_Allocation.Sales_Order,'
      '        Part_Store_Allocation.Sales_Order_Line_No'
      'FROM Part_store_allocation, Store_stock, Part'
      'WHERE'
      '  Sales_Order = :sales_order and'
      'Part_store_allocation.store_stock = store_stock.store_stock and'
      'store_stock.part = part.part'
      'ORDER BY'
      '      Store_Stock.Part_Store,'
      '      Store_Stock.Part,'
      '      Store_Stock.Part_Bin,'
      '      Store_Stock.Part_Store_Lot')
    Left = 312
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qrySalesOrderJBReq: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select distinct Order_Type, Job_Bag'
      'from Sales_order, Job_Bag_Stock_Request'
      'where Sales_Order.Sales_order = :sales_order and'
      'sales_order.sales_order = Job_Bag_Stock_Request.Sales_Order')
    Left = 560
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryJBChkStockReq: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_stock_request, Sales_Order_line'
      #9'where Job_Bag_stock_request.Job_Bag = Job_Bag.Job_bag and'
      
        '        Job_Bag_stock_request.Sales_Order = Sales_Order_Line.Sal' +
        'es_Order and'
      
        '        Job_Bag_stock_request.Sales_Order_line_no = Sales_Order_' +
        'Line.Sales_Order_Line_no) as Total_Lines,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_stock_request, Sales_Order_Line, Sales_Order'
      #9'where Job_Bag_stock_request.Job_Bag = Job_Bag.Job_bag and'
      
        '        Job_Bag_stock_request.Sales_Order = Sales_Order_Line.Sal' +
        'es_Order and'
      
        '        Job_Bag_stock_request.Sales_Order_line_no = Sales_Order_' +
        'Line.Sales_Order_Line_no and'
      
        '        Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order a' +
        'nd'
      '        Sales_Order.Sales_Order_Head_Status <= 150 and'
      
        '        Job_Bag_Stock_Request.Included_in_Charges <> '#39'Y'#39') as UnR' +
        'econciled_Lines,'
      #9'(select count(Job_Bag)'
      #9'from Job_Bag_stock_request, Sales_Order_Line, Sales_Order'
      #9'where Job_Bag_stock_request.Job_Bag = Job_Bag.Job_bag and'
      
        '        Job_Bag_stock_request.Sales_Order = Sales_Order_Line.Sal' +
        'es_Order and'
      
        '        Job_Bag_stock_request.Sales_Order_line_no = Sales_Order_' +
        'Line.Sales_Order_Line_no and'
      
        '        Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order a' +
        'nd'
      
        '        Sales_Order.Sales_Order_Head_Status >= 150) as Invoiced_' +
        'Lines'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 432
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object GetSalesOrderHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_order,'
      '  Sales_Order_Head_Status,'
      '  Replenish_Source,'
      '  (select count(sales_order_line.sales_order_line_no)'
      '   from sales_order_line'
      '   where sales_order = Sales_Order.sales_order) as Total_lines,'
      '  (select count(sales_order_line.sales_order_line_no)'
      '   from sales_order_line'
      '   where sales_order = Sales_Order.sales_order and'
      '         quantity_delivered > 0) as Total_delivered,'
      '  (select count(sales_order_line.sales_order_line_no)'
      '   from sales_order_line'
      '   where sales_order = Sales_Order.sales_order and'
      '         quantity_allocated > 0) as Total_allocated'
      'from sales_order'
      'where sales_order = :sales_order')
    Left = 704
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteSODelivLine: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Delete Sales_order_Delivery_line'
      'where Sales_order = :Sales_Order')
    Left = 704
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteSODeliv: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Delete Sales_order_Delivery'
      'where Sales_order = :Sales_Order')
    Left = 704
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteSOPicking: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Delete Sales_order_Picking'
      'where Sales_order = :Sales_Order'
      ''
      '')
    Left = 704
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
end
