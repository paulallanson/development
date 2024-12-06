object STStockDataMod: TSTStockDataMod
  OnCreate = DataModuleCreate
  Height = 637
  Width = 922
  object AddMoveSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part_Movement'
      
        '(Part_Movement, Part, Date_Received, Part_Movement_Type, Part_Mo' +
        'vement_Bin,'
      
        ' Part_Store_Lot,Store_Cost,Store_Quantity, Part_Movement_Referen' +
        'ce,'
      
        ' Part_Movement_Store, Audit_User, Audit_Workstation, Print_On_Au' +
        'dit,'
      
        ' Stock_Pack_Quantity, Part_Store_Total_Quantity, Part_Store_Tota' +
        'l_Value, Part_Store_Total_Allocated, Purchase_Order,'
      ' Pallet_ID, Product_ID)'
      ' Values'
      
        '(:Part_Movement, :Part, :Date_Received, :Part_Movement_Type, :Pa' +
        'rt_Movement_Bin,'
      
        ' :Part_Store_Lot,:Store_Cost,:Store_Quantity, :Part_Movement_Ref' +
        'erence,'
      
        ' :Part_Movement_Store, :Audit_User, :Audit_Workstation, :Print_O' +
        'n_Audit,'
      
        ' :Stock_Pack_Quantity, :Part_Store_Total_Quantity, :Part_Store_T' +
        'otal_Value, :Part_Store_Total_Allocated, :Purchase_Order,'
      ' :Pallet_ID, :Product_ID)'
      ' '
      ' '
      ' '
      '')
    Left = 56
    Top = 24
    ParamData = <
      item
        Name = 'Part_Movement'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Part_Movement_Type'
      end
      item
        Name = 'Part_Movement_Bin'
        DataType = ftString
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end
      item
        Name = 'Store_Cost'
      end
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Part_Movement_Reference'
      end
      item
        Name = 'Part_Movement_Store'
      end
      item
        Name = 'Audit_User'
      end
      item
        Name = 'Audit_Workstation'
      end
      item
        Name = 'Print_On_Audit'
      end
      item
        Name = 'Stock_Pack_Quantity'
      end
      item
        Name = 'Part_Store_Total_Quantity'
      end
      item
        Name = 'Part_Store_Total_Value'
      end
      item
        Name = 'Part_Store_Total_Allocated'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Pallet_ID'
      end
      item
        Name = 'Product_ID'
      end>
  end
  object GetNextMoveSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Part_Movement) as Last_Code'
      'From Part_Movement')
    Left = 144
    Top = 112
  end
  object GetMoveTypesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Part_Movement_Type'
      'Order by Part_Move_Type_Descr'
      ' ')
    Left = 32
    Top = 192
  end
  object MoveTypesDataSource: TDataSource
    DataSet = GetMoveTypesSQL
    Left = 208
    Top = 160
  end
  object GetStoresFromSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store.*'
      'From Part_Store, Part_Store_Type'
      
        'Where (Part_Store_Type.Part_Store_Type = Part_Store.Part_Store_T' +
        'ype)'
      
        'Order by Part_Store_Type.Part_Store_Is_Van, Part_Store.Part_Stor' +
        'e_Name'
      ' ')
    Left = 288
    Top = 176
  end
  object StoresFromDataSource: TDataSource
    DataSet = GetStoresFromSQL
    Left = 256
    Top = 112
  end
  object GetStoreStocksSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Store_Stock'
      'Where (Part_Store = :Part_Store) and'
      '      (Part = :Part)'
      'Order by Part_Bin, Part_Store_Lot'
      ' '
      ' ')
    Left = 392
    Top = 112
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part'
      end>
  end
  object GetPartSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Part'
      'Where (Part = :Part)')
    Left = 368
    Top = 160
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object UpdLastLotSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set Last_Store_Lot = :Last_Store_Lot'
      'Where (Part = :Part)'
      ' ')
    Left = 64
    Top = 248
    ParamData = <
      item
        Name = 'Last_Store_Lot'
      end
      item
        Name = 'Part'
      end>
  end
  object AddStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Store_Stock'
      
        '       (Store_Stock, Part_Store_Lot, Date_Received, Store_Cost, ' +
        'Store_Quantity,'
      
        '        Quantity_Allocated, Part, Part_Store, Part_Bin, Stock_Pa' +
        'ck_Quantity, Purchase_Order)'
      'Values'
      
        '       (:Store_Stock, :Part_Store_Lot, :Date_Received, :Store_Co' +
        'st, :Store_Quantity,'
      
        '        :Quantity_Allocated, :Part, :Part_Store, :Part_Bin, :Sto' +
        'ck_Pack_Quantity, :Purchase_Order)'
      ' '
      ' '
      ' '
      ' ')
    Left = 248
    Top = 24
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Store_Cost'
      end
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
        DataType = ftString
      end
      item
        Name = 'Stock_Pack_Quantity'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetNextStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Store_Stock) as Last_Code'
      'From Store_Stock'
      ' ')
    Left = 320
    Top = 88
  end
  object UpdStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Store_Stock'
      'Set'
      '   Store_Cost = Store_Cost + :Store_Cost_Adj,'
      '   Store_Quantity = Store_Quantity + :Store_Quantity_Adj,'
      
        '   Quantity_Allocated = Quantity_Allocated + :Quantity_Allocated' +
        '_Adj'
      'Where Store_Stock = :Store_Stock'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 72
    ParamData = <
      item
        Name = 'Store_Cost_Adj'
      end
      item
        Name = 'Store_Quantity_Adj'
      end
      item
        Name = 'Quantity_Allocated_Adj'
      end
      item
        Name = 'Store_Stock'
      end>
  end
  object DelStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Store_Stock'
      'Where (Store_Stock = :Store_Stock) and'
      '      (Quantity_Allocated = 0) and'
      '      (Store_Quantity = 0) ')
    Left = 160
    Top = 24
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
  object GetMoveTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Part_Movement_Type'
      'Where (Part_Movement_Type = :Part_Movement_Type)'
      ' '
      ' ')
    Left = 112
    Top = 184
    ParamData = <
      item
        Name = 'Part_Movement_Type'
      end>
  end
  object GetStoreSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Part_Store'
      'Where Part_Store = :Part_Store'
      ' '
      ' ')
    Left = 448
    Top = 264
    ParamData = <
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end>
  end
  object GetFreeStoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    Left = 48
    Top = 136
  end
  object AddAllocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part_Store_Allocation'
      
        '(Part_Store_Allocation,Purch_Ord, Purch_Ord_Line_No, Sales_Order' +
        ',Sales_Order_Line_no,'
      
        ' Store_Stock, Quantity_Allocated, Quantity_Overs, Part, Quantity' +
        '_Over_Picked)'
      ' Values'
      
        '(:Part_Store_Allocation, :Purch_Ord, :Purch_Ord_Line_No, :Sales_' +
        'Order,:Sales_Order_Line_no,'
      
        ' :Store_Stock, :Quantity_Allocated, :Quantity_Overs, :Part, :Qua' +
        'ntity_Over_Picked)'
      ''
      ''
      ' '
      ' ')
    Left = 392
    Top = 64
    ParamData = <
      item
        Name = 'Part_Store_Allocation'
      end
      item
        Name = 'Purch_Ord'
        DataType = ftString
      end
      item
        Name = 'Purch_Ord_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Line_no'
        DataType = ftInteger
      end
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Overs'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Quantity_Over_Picked'
      end>
  end
  object GetNextAllocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Part_Store_Allocation) as Last_Code'
      'From Part_Store_Allocation'
      ' '
      ' ')
    Left = 200
    Top = 72
  end
  object GetStoreStockIntSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Store_Stock.Store_Quantity,'
      '       Store_Stock.Store_Cost,'
      '       Store_Stock.Quantity_Allocated'
      'From Store_Stock'
      'Where (Store_Stock.Store_Stock = :Store_Stock)'
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 232
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
  object GetAllocStockByRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store_Allocation.Quantity_Allocated,'
      '       Part_Store_Allocation.Quantity_Overs,'
      '       Part_Store_Allocation.Quantity_Over_Picked,'
      '       Part_Store_Allocation.Part_Store_Allocation,'
      '       Part_Store_Allocation.Store_Stock,'
      '       Store_Stock.Part_Bin,'
      '       Store_Stock.Part_Store_Lot,'
      '       Store_Stock.Part_Store,'
      '       Store_Stock.Store_Cost as PS_Store_Cost,'
      '       Store_Stock.Store_Quantity as PS_Store_Quantity'
      'From Part_Store_Allocation, Store_Stock'
      
        'Where (((Purch_Ord = :Purch_Ord)  and (Purch_Ord_Line_No = :Purc' +
        'h_Ord_Line_No))'
      '                                      or (:Purch_Ord = 0)) and'
      
        '      (((Sales_order = :Sales_order) and (Sales_Order_Line_No = ' +
        ':Sales_order_Line_No))'
      '                                      or (:Sales_order = 0)) and'
      
        '      (Store_Stock.Store_Stock = Part_Store_Allocation.Store_Sto' +
        'ck)'
      'Order by Part_Store_Allocation'
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 432
    Top = 200
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_order_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Sales_order'
      end>
  end
  object UpdAllocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part_Store_Allocation'
      
        'Set Quantity_Allocated = Quantity_Allocated + :Quantity_Allocate' +
        'd,'
      'Quantity_Overs = Quantity_Overs + :Quantity_Overs,'
      
        'Quantity_Over_Picked = Quantity_Over_Picked + :Quantity_Over_Pic' +
        'ked'
      'Where Part_Store_Allocation = :Part_Store_Allocation'
      ''
      ' '
      ' ')
    Left = 504
    Top = 200
    ParamData = <
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Overs'
      end
      item
        Name = 'Quantity_Over_Picked'
      end
      item
        Name = 'Part_Store_Allocation'
      end>
  end
  object DelAllocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Part_Store_Allocation'
      'Where Part_Store_Allocation = :Part_Store_Allocation'
      ''
      ' '
      ' ')
    Left = 472
    Top = 88
    ParamData = <
      item
        Name = 'Part_Store_Allocation'
      end>
  end
  object AddTransferSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Part_Transfer'
      '      (Part_Transfer,'
      '       Part_Store_Lot,'
      '       Part,'
      '       Sales_Order,'
      '       Sales_Order_Line_no,'
      '       Purch_Ord,'
      '       Purch_Ord_Line_No,'
      '       Part_Store_From,'
      '       Store_Quantity,'
      '       Date_Received,'
      '       Store_Cost,'
      '       Part_Bin,'
      '       Part_Store,'
      '       Quantity_Received,'
      '       Stock_Pack_Quantity,'
      '       Store_Stock,'
      '       Invoice_Upfront)'
      'values (:Part_Transfer,'
      '        :Part_Store_Lot,'
      '        :Part,'
      '        :Sales_Order,'
      '        :Sales_Order_Line_no,'
      '        :Purch_Ord,'
      '        :Purch_Ord_Line_No,'
      '        :Part_Store_From,'
      '        :Store_Quantity,'
      '        :Date_Received,'
      '        :Store_Cost,'
      '        :Part_Bin,'
      '        :Part_Store,'
      '        0,'
      '        :Stock_Pack_Quantity,'
      '        :Store_Stock,'
      '        :Invoice_Upfront) '
      ' '
      ' ')
    Left = 24
    Top = 280
    ParamData = <
      item
        Name = 'Part_Transfer'
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Line_no'
        DataType = ftInteger
      end
      item
        Name = 'Purch_Ord'
        DataType = ftString
      end
      item
        Name = 'Purch_Ord_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store_From'
      end
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Store_Cost'
      end
      item
        Name = 'Part_Bin'
        DataType = ftString
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Stock_Pack_Quantity'
      end
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Invoice_Upfront'
      end>
  end
  object NextTransfer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Part_Transfer) as Max_Part_Transfer'
      'from Part_Transfer')
    Left = 24
    Top = 328
  end
  object UpdSOAllocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord_Line'
      'Set Quantity_Allocated = Quantity_Allocated + :Qty_Alloc'
      'Where (Purch_Ord = :Purch_Ord) and'
      '      (Purch_Ord_Line_No = :Purch_Ord_Line_No)'
      ' ')
    Left = 272
    Top = 224
    ParamData = <
      item
        Name = 'Qty_Alloc'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
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
    Left = 448
    Top = 144
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Part_Store_Lot'
      end
      item
        Name = 'Part_Store_Lot'
      end>
  end
  object GetStoreBinSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Part_Store_Bin'
      'Where (Part_Store = :Part_Store) and'
      '      (Part_Bin = :Part_Bin)'
      ' '
      ' '
      ' ')
    Left = 216
    Top = 280
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
      end>
  end
  object AddStoreBinSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part_Store_Bin'
      '(Part_Store, Part_Bin, Bin_Can_Pick)'
      'Values'
      '(:Part_Store, :Part_Bin, :Bin_Can_Pick)'
      ''
      ' '
      ' '
      ' ')
    Left = 360
    Top = 240
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Bin_Can_Pick'
      end>
  end
  object GetDefPartStoreSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store.Part_Store'
      'From Part_Store, Part_Store_Type'
      
        'Where (Part_Store.Part_Store_Type = Part_Store_Type.Part_Store_T' +
        'ype) and'
      '      (Part_Store_Type.Part_Store_Is_Van <> '#39'Y'#39')'
      ' ')
    Left = 488
    Top = 40
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' ')
    Left = 312
    Top = 292
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, sel1, sel2, sel3, sel4, Tag, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.0, 0.0, 0.0, 0.0, '#39' '#39', :Text100)'
      ''
      ' ')
    Left = 384
    Top = 292
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) ')
    Left = 336
    Top = 20
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object UpdSalesOrderAllocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order_Line'
      'Set Quantity_Allocated = Quantity_Allocated + :Qty_Alloc'
      'Where (Sales_order = :Sales_Order) and'
      '      (Sales_order_Line_No = :Sales_order_Line_No)'
      ' ')
    Left = 136
    Top = 320
    ParamData = <
      item
        Name = 'Qty_Alloc'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_Line_No'
      end>
  end
  object GetPriceUnitSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit')
    Left = 384
    Top = 336
  end
  object dtSrcPriceUnit: TDataSource
    DataSet = GetPriceUnitSQL
    Left = 280
    Top = 336
  end
  object AddStoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Store_Stock'
      
        '       (Store_Stock, Part_Store_Lot, Date_Received, Store_Cost, ' +
        'Store_Quantity,'
      
        '        Quantity_Allocated, Part, Part_Store, Part_Bin, Stock_Pa' +
        'ck_Quantity,'
      
        '        Store_Stock_Description, Invoice_Upfront, Sets_Per_Pad, ' +
        'Purchase_Order,'
      '        Pallet_ID, Product_ID, Stock_is_Overs)'
      'Values'
      
        '       (:Store_Stock, :Part_Store_Lot, :Date_Received, :Store_Co' +
        'st, :Store_Quantity,'
      
        '        :Quantity_Allocated, :Part, :Part_Store, :Part_Bin, :Sto' +
        'ck_Pack_Quantity,'
      
        '        :Store_Stock_Description, :Invoice_Upfront, :Sets_Per_Pa' +
        'd, :Purchase_Order,'
      '        :Pallet_ID, :Product_ID, :Stock_is_Overs)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 424
    Top = 16
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Store_Cost'
      end
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
        DataType = ftString
      end
      item
        Name = 'Stock_Pack_Quantity'
      end
      item
        Name = 'Store_Stock_Description'
      end
      item
        Name = 'Invoice_Upfront'
        DataType = ftString
      end
      item
        Name = 'Sets_Per_Pad'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Pallet_ID'
      end
      item
        Name = 'Product_ID'
      end
      item
        Name = 'Stock_is_Overs'
      end>
  end
  object GetCouriersSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Courier'
      'Order by Courier_Name'
      ''
      ' '
      ' '
      ' ')
    Left = 456
    Top = 320
  end
  object CouriersDataSource: TDataSource
    DataSet = GetCouriersSQL
    Left = 48
    Top = 80
  end
  object DelStockSNSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Store_Stock_serial_item'
      'Where'
      '(Store_Stock_serial_item.store_stock = (select store_stock'
      '                                        from store_stock'
      
        '                                        where store_stock.store_' +
        'stock = :store_stock))'
      'and (Store_Stock_serial_item.sales_order = :Sales_order)')
    Left = 24
    Top = 384
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object GetStkSerialSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Store_stock_serial_item'
      'where Store_Stock = :Store_stock and'
      'Sales_order = :sales_order and'
      'Sales_order_Line_no = :sales_order_line_no')
    Left = 584
    Top = 40
    ParamData = <
      item
        Name = 'Store_stock'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object ResetStockSNSQl: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Store_Stock_serial_item'
      'Set Sales_Order = NULL, Sales_order_line_no = NULL'
      'Where'
      '(Store_Stock_serial_item.store_stock = (select store_stock'
      '                                        from store_stock'
      
        '                                        where store_stock.store_' +
        'stock = :store_stock))'
      'and (Store_Stock_serial_item.sales_order = :Sales_order)')
    Left = 128
    Top = 386
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object qryUpdStockBin: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Store_Stock'
      'Set Part_bin = :Part_Bin'
      'Where Store_Stock = :Store_Stock'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 584
    Top = 96
    ParamData = <
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Store_Stock'
      end>
  end
  object GetSalesOrderLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Sales_order_line'
      'where Sales_Order = :Sales_Order and'
      'Sales_order_line_no = :sales_order_line_no')
    Left = 704
    Top = 40
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryGetTransferStStk: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Transfer.Part_Transfer, Store_Stock.*'
      'From Store_Stock, Part_Transfer, Sales_Order'
      'Where (Store_Stock.Part_Store = :Part_Store) and'
      '      (Store_Stock.Part = :Part) and'
      '      (Part_Transfer.Store_Stock = Store_Stock.Store_Stock) and'
      '      (Part_Transfer.Sales_order = Sales_Order.Sales_Order) and'
      '      (Sales_Order.Sales_Order_Head_Status > 150)'
      'Order by Store_Stock.Part_Bin, Store_Stock.Part_Store_Lot'
      ' '
      ' ')
    Left = 704
    Top = 96
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part'
      end>
  end
  object qryGetNonTransferStStk: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Store_Stock'
      'Where (Part_Store = :Part_Store) and'
      '      (Part = :Part) and'
      '      Store_Stock not in (select Store_Stock from Part_Transfer'
      '                          where Part_Transfer.Part = :Part and'
      
        '                                Part_Transfer.Part_Store = :Part' +
        '_Store)'
      'Order by Part_Bin, Part_Store_Lot'
      ' '
      ' ')
    Left = 704
    Top = 160
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store'
      end>
  end
  object qryGetStoreStock: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select isnull(Sum(Store_Quantity),0) as Total_Stock,'
      '       isnull(Sum(Store_Cost),0.00) as Total_Stock_Value,'
      
        '       isnull(Sum(Quantity_Allocated),0) as Total_Allocated_Stoc' +
        'k'
      'from Store_Stock'
      
        'where ((Part_Store = :Part_Store) or (0 = :Part_Store)) and Part' +
        ' = :Part')
    Left = 32
    Top = 448
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part'
      end>
  end
  object qryGetJobBagRtn: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select max(Job_Bag_Return) as Last_Return'
      'from Job_Bag_Return')
    Left = 704
    Top = 224
  end
  object qryAddJobBagRtn: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Job_Bag_Return'
      '(Job_Bag_Return,'
      'Job_bag,'
      'Store_stock,'
      'Quantity,'
      'Part)'
      'values '
      '(:Job_Bag_Return,'
      ':Job_bag,'
      ':Store_stock,'
      ':Quantity,'
      ':Part)')
    Left = 704
    Top = 280
    ParamData = <
      item
        Name = 'Job_Bag_Return'
      end
      item
        Name = 'Job_bag'
      end
      item
        Name = 'Store_stock'
        DataType = ftInteger
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Part'
      end>
  end
  object qryGetReturns: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Select Job_Bag_Return.Job_Bag,'
      '      Store_Stock.Store_Stock,'
      #9'Store_Stock.Quantity_allocated,'
      #9'Store_Stock.Store_quantity,'
      #9'Store_Stock.Store_Cost,'
      #9'Store_Stock.Date_received,'
      #9'Store_Stock.Part,'
      #9'Store_Stock.Part_Store_lot,'
      #9'Store_Stock.Part_Store,'
      #9'Store_Stock.Part_Bin,'
      #9'Store_Stock.Stock_Pack_Quantity,'
      #9'Store_Stock.Store_Stock_Description,'
      #9'Store_Stock.Invoice_upfront,'
      #9'Store_Stock.sets_per_pad,'
      #9'Store_Stock.Quantity_Over_picked,'
      #9'Store_Stock.Purchase_Order,'
      #9'Store_Stock.Pallet_ID,'
      #9'Store_Stock.Stock_is_Overs,'
      '      sum(Job_Bag_Return.Quantity) as Quantity_Overs'
      'From Job_Bag_Return, Store_Stock'
      'Where  (Job_Bag_Return.Job_Bag = :Job_Bag) and'
      '      (Store_Stock.Part = :Part) and'
      '      (Job_Bag_Return.store_stock = store_Stock.store_stock)'
      'GROUP BY'
      '      Job_Bag_Return.Job_Bag,'
      '      Store_Stock.Store_Stock,'
      #9'Store_Stock.Quantity_allocated,'
      #9'Store_Stock.Store_quantity,'
      #9'Store_Stock.Store_Cost,'
      #9'Store_Stock.Date_received,'
      #9'Store_Stock.Part,'
      #9'Store_Stock.Part_Store_lot,'
      #9'Store_Stock.Part_Store,'
      #9'Store_Stock.Part_Bin,'
      #9'Store_Stock.Stock_Pack_Quantity,'
      #9'Store_Stock.Store_Stock_Description,'
      #9'Store_Stock.Invoice_upfront,'
      #9'Store_Stock.sets_per_pad,'
      #9'Store_Stock.Quantity_Over_picked'
      'Order by Store_Stock.Part_Bin, Store_Stock.Part_Store_Lot'
      '')
    Left = 704
    Top = 344
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Part'
      end>
  end
  object qryPartInactive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'set Not_in_Use = '#39'Y'#39
      'where Part = :Part')
    Left = 128
    Top = 448
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object GetAllocStockbyStoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store_Allocation.Quantity_Allocated,'
      '       Part_Store_Allocation.Quantity_Overs,'
      '       Part_Store_Allocation.Quantity_Over_Picked,'
      '       Part_Store_Allocation.Part_Store_Allocation,'
      '       Part_Store_Allocation.Store_Stock,'
      '       Store_Stock.Part_Bin,'
      '       Store_Stock.Part_Store_Lot,'
      '       Store_Stock.Part_Store,'
      '       Store_Stock.Store_Cost as PS_Store_Cost,'
      '       Store_Stock.Store_Quantity as PS_Store_Quantity'
      'From Part_Store_Allocation, Store_Stock'
      'Where (Part_Store_Allocation.Store_Stock = :Store_Stock) and'
      
        '      (Store_Stock.Store_Stock = Part_Store_Allocation.Store_Sto' +
        'ck)'
      'Order by Part_Store_Allocation'
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 584
    Top = 200
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'SELECT Customer, Branch_no, Contact_no, Rep, Office_Contact, Cus' +
        't_Order_No, Account_Team'
      'FROM Job_Bag'
      'WHERE Job_Bag = :Job_Bag')
    Left = 280
    Top = 400
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryAddSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order'
      '  (Sales_Order,'
      '  Office_Contact,'
      '  Operator,'
      '  Date_Required,'
      '  Date_Ordered,'
      '  Cust_Order_No,'
      '  Customer,'
      '  Branch_No,'
      '  Cost_Centre,'
      '  Customer0,'
      '  Order_Type,'
      '  Sales_Order_Head_Status,'
      '  Narrative,'
      '  Contact_No,'
      '  Part_Store,'
      '  Delivery_Notes,'
      '  Delivery_Customer,'
      '  Delivery_Branch,'
      '  Replenish_Source,'
      '  Supplier,'
      '  Branch_no0,'
      '  Supp_Order_type,'
      '  Ad_Hoc_Address,'
      '  Production_Location,'
      '  Account_Team,'
      '  Delivery_Contact_Name,'
      '  Cash_Sales,'
      '  inactive)'
      'values'
      '  (:Sales_Order,'
      '  :Office_Contact,'
      '  :Operator,'
      '  :Date_Reqd,'
      '  :Date_Ordrd,'
      '  :Cust_Order_no,'
      '  :Customer,'
      '  :Branch_No,'
      '  :Cost_Centre,'
      '  :Customer0,'
      '  :Order_Type,'
      '  :Sales_Order_Head_Status,'
      '  :Narrative,'
      '  :Contact_No,'
      '  :Part_Store,'
      '  :Delivery_Notes,'
      '  :Delivery_Customer,'
      '  :Delivery_Branch,'
      '  :Replenish_Source,'
      '  :Supplier,'
      '  :Branch_no0,'
      '  :Supp_Order_type,'
      '  :Ad_Hoc_Address,'
      '  :Production_Location,'
      '  :Account_Team,'
      '  :Delivery_Contact_Name,'
      '  :Cash_Sales,'
      '  :inactive)'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 352
    Top = 400
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Date_Reqd'
        DataType = ftDateTime
      end
      item
        Name = 'Date_Ordrd'
        DataType = ftDateTime
      end
      item
        Name = 'Cust_Order_no'
        DataType = ftString
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Cost_Centre'
        DataType = ftString
      end
      item
        Name = 'Customer0'
        DataType = ftInteger
      end
      item
        Name = 'Order_Type'
        DataType = ftString
      end
      item
        Name = 'Sales_Order_Head_Status'
        DataType = ftInteger
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Notes'
        DataType = ftString
      end
      item
        Name = 'Delivery_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Replenish_Source'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no0'
        DataType = ftInteger
      end
      item
        Name = 'Supp_Order_type'
        DataType = ftString
      end
      item
        Name = 'Ad_Hoc_Address'
        DataType = ftInteger
      end
      item
        Name = 'Production_Location'
        DataType = ftInteger
      end
      item
        Name = 'Account_Team'
      end
      item
        Name = 'Delivery_Contact_Name'
      end
      item
        Name = 'Cash_Sales'
      end
      item
        Name = 'inactive'
      end>
  end
  object qryGetBin: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Production_Location'
      'FROM Production_Location'
      'WHERE Part_Bin = :Part_Bin')
    Left = 280
    Top = 504
    ParamData = <
      item
        Name = 'Part_Bin'
      end>
  end
  object UpdLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_SO_Number = :Last_SO_Number'
      'Where Company = 1'
      ' ')
    Left = 560
    Top = 448
    ParamData = <
      item
        Name = 'Last_SO_Number'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select In_Use_By, Name from Company Where Company = 1'
      ' ')
    Left = 560
    Top = 392
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_SO_Number, Last_Invoice_No'
      'From Company'
      'Where Company = 1'
      ' ')
    Left = 560
    Top = 504
  end
  object qryAddSORep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_OrderRep'
      '(Sales_Order, Rep, Rep_Percentage)'
      'Values'
      '(:Sales_Order, :Rep, :Rep_Percentage)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 352
    Top = 456
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep_Percentage'
      end>
  end
  object qryAddSOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order_Line'
      
        '(Sales_Order, Sales_Order_Line_No, Part, Part_Cost, Purch_pack_q' +
        'uantity, Part_Sales_Price, Sell_Pack_Quantity,'
      
        '  Quantity_Ordered, Quantity_Allocated, Quantity_Delivered, Cont' +
        'ract,'
      '  Contract_Line_No, Sales_Order_Line_Status, Quantity_Invoiced,'
      '  Discount_Type, Discount_Value, Vat_Code, Original_Sell_Price,'
      '  Markup_Type, Markup_Value, Quantity_Overs, Line_is_sample)'
      'Values'
      
        '(:Sales_Order, :Line, :Part, :Part_Cost, :Purch_pack_quantity, :' +
        'Part_Sales_Price, :Sell_Pack_Quantity,'
      
        '  :Quantity_Ordered, :Quantity_Allocated, :Quantity_Delivered, :' +
        'Contract,'
      
        '  :Contract_Line_No, :Sales_Order_Line_Status, :Quantity_Invoice' +
        'd,'
      '  :Discount_Type,'
      '  :Discount_Value,'
      '  :Vat_Code,'
      '  :Original_Sell_Price,'
      '  :Markup_Type, '
      '  :Markup_Value,'
      '  :Quantity_Overs, :Line_is_Sample)'
      ''
      '  '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 352
    Top = 504
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Part_Cost'
      end
      item
        Name = 'Purch_pack_quantity'
      end
      item
        Name = 'Part_Sales_Price'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Contract'
        DataType = ftInteger
      end
      item
        Name = 'Contract_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Line_Status'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Discount_Type'
        DataType = ftString
      end
      item
        Name = 'Discount_Value'
        DataType = ftFloat
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Original_Sell_Price'
        DataType = ftCurrency
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Value'
        DataType = ftFloat
      end
      item
        Name = 'Quantity_Overs'
        DataType = ftInteger
      end
      item
        Name = 'Line_is_Sample'
      end>
  end
  object qryGetPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Part,'
      '      Part_Purchase_Price,'
      '      Purch_pack_Quantity,'
      '      Part_Cost_Cat,'
      '      Sell_pack_Quantity,'
      '      Vat_Code'
      'FROM Part'
      'WHERE Part = :Part')
    Left = 280
    Top = 456
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryAddJobBagRequest: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Job_Bag_Stock_Request'
      
        'SELECT :Job_Bag, ISNULL(Max(Request_no),0)+1, :Sales_Order, :Sal' +
        'es_order_Line_No, '#39'N'#39
      'FROM Job_Bag_Stock_Request'
      'WHERE Job_Bag_Stock_Request.Job_Bag = :Job_Bag')
    Left = 432
    Top = 400
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_Line_No'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetSalesOrderLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order.Part_Store,'
      '        Sales_Order_Line.Sales_Order_Line_No,'
      '        Sales_Order_Line.Part,'
      '        Sales_Order_Line.Quantity_Ordered,'
      '        Sales_Order_Line.Quantity_Delivered,'
      '        Sales_Order_Line.Quantity_Overs,'
      '        Sales_Order_Line.Quantity_Allocated'
      'FROM Sales_Order, Sales_Order_Line'
      'WHERE Sales_Order.Sales_Order = :Sales_Order AND'
      'Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order'
      
        'ORDER BY Sales_Order_Line.Sales_Order, Sales_Order_Line.Sales_Or' +
        'der_line_no')
    Left = 432
    Top = 456
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryUpdSOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Sales_Order_Head_Status = :Sales_Order_Head_Status'
      'WHERE Sales_Order = :Sales_Order')
    Left = 440
    Top = 504
    ParamData = <
      item
        Name = 'Sales_Order_Head_Status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetNextPickNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Sales_Order_Picking) as Last_Picking'
      'from Sales_Order_Picking')
    Left = 640
    Top = 392
  end
  object qryGetSOAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Part_Store_Allocation.*,'
      '        Part.Part_Description,'
      '        Store_Stock.Part_Bin,'
      '        Store_Stock.Part_Store_Lot,'
      '        Store_Stock.Part_Store,'
      '        Store_Stock.Invoice_upfront,'
      '        Store_Stock.Stock_Pack_Quantity,'
      '        Store_Stock.Date_Received,'
      '        Store_Stock.Sets_per_pad,'
      '        Store_Stock.Purchase_Order,'
      '        ISNULL((Select sum(Quantity_to_Pick)'
      '         from Sales_Order_Picking'
      
        '         where Sales_Order_Picking.Sales_Order = Part_Store_Allo' +
        'cation.Sales_Order AND'
      
        '               Sales_Order_Picking.Sales_Order_line_no = Part_St' +
        'ore_Allocation.Sales_Order_Line_no AND'
      
        '               Sales_Order_Picking.Part_Bin = Store_Stock.Part_B' +
        'in AND'
      
        '               ((Sales_Order_Picking.Pick_Note_Confirmed is NULL' +
        ') or'
      
        '               (Sales_Order_Picking.Pick_Note_Confirmed = '#39'N'#39')) ' +
        'AND'
      
        '               Sales_Order_Picking.Part_Store_Lot = Store_Stock.' +
        'Part_Store_Lot),0) as Quantity_Used,'
      
        '        (Part_Store_Allocation.Quantity_Allocated - ISNULL((Sele' +
        'ct sum(Quantity_to_Pick)'
      '         from Sales_Order_Picking'
      
        '         where Sales_Order_Picking.Sales_Order = Part_Store_Allo' +
        'cation.Sales_Order AND'
      
        '               Sales_Order_Picking.Sales_Order_line_no = Part_St' +
        'ore_Allocation.Sales_Order_Line_no AND'
      
        '               Sales_Order_Picking.Part_Bin = Store_Stock.Part_B' +
        'in AND'
      
        '               ((Sales_Order_Picking.Pick_Note_Confirmed is NULL' +
        ') or'
      
        '               (Sales_Order_Picking.Pick_Note_Confirmed = '#39'N'#39')) ' +
        'AND'
      
        '               Sales_Order_Picking.Part_Store_Lot = Store_Stock.' +
        'Part_Store_Lot),0)) as Quantity_to_Pick'
      'from Part_Store_Allocation, Part, store_Stock'
      'where'
      '  Sales_order = :sales_Order AND'
      '  Part.Part = Part_Store_Allocation.Part AND'
      '  Store_Stock.Store_Stock = Part_Store_Allocation.Store_Stock'
      'Order by Sales_Order_Line_No')
    Left = 640
    Top = 449
    ParamData = <
      item
        Name = 'sales_Order'
      end>
  end
  object qryAddSOPick: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Order_Picking'
      '(Sales_Order_Picking,'
      'Picking_No,'
      'Sales_Order,'
      'Sales_Order_Line_No,'
      'Quantity_To_Pick,'
      'Picking_List_Ref,'
      'Date_Picked,'
      'Part_Bin,'
      'Part_Store_Lot,'
      'Stock_Pack_Quantity,'
      'Part_Store,'
      'Invoice_upfront,'
      'Part_Store_Allocation,'
      'Pick_Note_Confirmed,'
      'Date_Received,'
      'Sets_Per_Pad,'
      'Purchase_Order)'
      'Values'
      '(:Sales_Order_Picking,'
      ':Picking_No,'
      ':Sales_Order,'
      ':Sales_Order_Line_No,'
      ':Quantity_To_Pick,'
      ':Picking_List_Ref,'
      ':Date_Picked,'
      ':Part_Bin,'
      ':Part_Store_Lot,'
      ':Stock_Pack_Quantity,'
      ':Part_Store,'
      ':Invoice_upfront,'
      ':Part_Store_Allocation,'
      ':Pick_Note_Confirmed,'
      ':Date_Received,'
      ':Sets_Per_Pad,'
      ':Purchase_Order)'
      '')
    Left = 640
    Top = 504
    ParamData = <
      item
        Name = 'Sales_Order_Picking'
      end
      item
        Name = 'Picking_No'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_No'
      end
      item
        Name = 'Quantity_To_Pick'
      end
      item
        Name = 'Picking_List_Ref'
      end
      item
        Name = 'Date_Picked'
      end
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Part_Store_Lot'
      end
      item
        Name = 'Stock_Pack_Quantity'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Invoice_upfront'
      end
      item
        Name = 'Part_Store_Allocation'
      end
      item
        Name = 'Pick_Note_Confirmed'
        DataType = ftString
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Sets_Per_Pad'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryAddSODelivNote: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery'
      
        '(Sales_Order, Sales_Order_Delivery_No, Delivery_Date, Despatch_N' +
        'ote_No, Delivery_Type,'
      
        '  Date_Picked, Delivery_Weight_Kilos, No_of_Boxes, Delivery_Inst' +
        'ructions,'
      '  Consignment_Number, Courier, Service_No)'
      'values'
      
        '(:Sales_Order,:Sales_Order_Deliv, :Del_Dt, :Desp_Note_No, :Del_T' +
        'ype,'
      '  :Del_Dt, 0, 1, :Delivery_Instructions,'
      '  '#39#39', :Courier, 0)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 742
    Top = 396
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Desp_Note_No'
      end
      item
        Name = 'Del_Type'
        DataType = ftString
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Delivery_Instructions'
      end
      item
        Name = 'Courier'
        DataType = ftInteger
      end>
  end
  object qryAddSODelivLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery_Line'
      
        '(Sales_Order, Sales_Order_Delivery_No, Sales_Order_line_No, Quan' +
        'tity_Delivered,'
      '  Quantity_Picked)'
      'values'
      '(:Sales_Order, :Sales_Order_Deliv, :Sales_order_Line_No, 0, 0)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 742
    Top = 452
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Sales_order_Line_No'
      end>
  end
  object qryGetPickNote: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Order_Picking'
      'FROM Sales_Order_Picking'
      'WHERE Sales_Order = :Sales_Order')
    Left = 744
    Top = 504
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryUpdPartStoreBin: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Part_Store_Bin'
      'Set Bin_Can_Pick = :Bin_Can_Pick'
      'WHERE Part_Store = :Part_Store and'
      '      Part_Bin = :Part_Bin')
    Left = 848
    Top = 376
    ParamData = <
      item
        Name = 'Bin_Can_Pick'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
      end>
  end
  object GetStoresToSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store.*'
      'From Part_Store, Part_Store_Type'
      
        'Where (Part_Store_Type.Part_Store_Type = Part_Store.Part_Store_T' +
        'ype)'
      
        'Order by Part_Store_Type.Part_Store_Is_Van, Part_Store.Part_Stor' +
        'e_Name'
      ' ')
    Left = 312
    Top = 184
  end
  object StoresToDataSource: TDataSource
    DataSet = GetStoresToSQL
    Left = 272
    Top = 128
  end
end
