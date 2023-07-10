object STStockDataMod: TSTStockDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 103
  Top = 119
  Height = 637
  Width = 922
  object AddMoveSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Movement'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Movement_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Movement_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Movement_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Movement_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_User'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Workstation'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Print_On_Audit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Total_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Total_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Total_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pallet_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_ID'
        ParamType = ptUnknown
      end>
  end
  object GetNextMoveSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Part_Movement) as Last_Code'
      'From Part_Movement')
    Left = 144
    Top = 112
  end
  object GetMoveTypesSQL: TQuery
    DatabaseName = 'PB'
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
  object GetStoresSQL: TQuery
    DatabaseName = 'PB'
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
  object StoresDataSource: TDataSource
    DataSet = GetStoresSQL
    Left = 256
    Top = 112
  end
  object GetStoreStocksSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object GetPartSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Part'
      'Where (Part = :Part)')
    Left = 368
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object UpdLastLotSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set Last_Store_Lot = :Last_Store_Lot'
      'Where (Part = :Part)'
      ' ')
    Left = 64
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_Store_Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object AddStockSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object GetNextStockSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Store_Stock) as Last_Code'
      'From Store_Stock'
      ' ')
    Left = 320
    Top = 88
  end
  object UpdStockSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_Cost_Adj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Quantity_Adj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated_Adj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object DelStockSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From Store_Stock'
      'Where (Store_Stock = :Store_Stock) and'
      '      (Quantity_Allocated = 0) and'
      '      (Store_Quantity = 0) ')
    Left = 160
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object GetMoveTypeSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Movement_Type'
        ParamType = ptUnknown
      end>
  end
  object GetStoreSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftInteger
        Name = 'Part_Store'
        ParamType = ptUnknown
      end>
  end
  object GetFreeStoreStockSQL: TQuery
    DatabaseName = 'PB'
    Left = 48
    Top = 136
  end
  object AddAllocSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Store_Allocation'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Purch_Ord_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Overs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Over_Picked'
        ParamType = ptUnknown
      end>
  end
  object GetNextAllocSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Part_Store_Allocation) as Last_Code'
      'From Part_Store_Allocation'
      ' '
      ' ')
    Left = 200
    Top = 72
  end
  object GetStoreStockIntSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object GetAllocStockByRefSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Purch_Ord_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_order_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object UpdAllocSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Overs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Over_Picked'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Allocation'
        ParamType = ptUnknown
      end>
  end
  object DelAllocSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Store_Allocation'
        ParamType = ptUnknown
      end>
  end
  object AddTransferSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Transfer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Purch_Ord_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Upfront'
        ParamType = ptUnknown
      end>
  end
  object NextTransfer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(Part_Transfer) as Max_Part_Transfer'
      'from Part_Transfer')
    Left = 24
    Top = 328
  end
  object UpdSOAllocSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Qty_Alloc'
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
  object GetStoreStockSQL: TQuery
    DatabaseName = 'PB'
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
  object GetStoreBinSQL: TQuery
    DatabaseName = 'PB'
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
  object AddStoreBinSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Bin_Can_Pick'
        ParamType = ptUnknown
      end>
  end
  object GetDefPartStoreSQL: TQuery
    DatabaseName = 'PB'
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
  object GetLastIntSelSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' ')
    Left = 312
    Top = 292
  end
  object AddWorkSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Text100'
        ParamType = ptUnknown
      end>
  end
  object DelWorkSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) ')
    Left = 336
    Top = 20
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object UpdSalesOrderAllocSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Qty_Alloc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object GetPriceUnitSQL: TQuery
    DatabaseName = 'PB'
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
  object AddStoreStockSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Stock_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Invoice_Upfront'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sets_Per_Pad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pallet_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_is_Overs'
        ParamType = ptUnknown
      end>
  end
  object GetCouriersSQL: TQuery
    DatabaseName = 'PB'
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
  object DelStockSNSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object GetStkSerialSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_stock'
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
  object ResetStockSNSQl: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryUpdStockBin: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object GetSalesOrderLineSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Sales_order_line'
      'where Sales_Order = :Sales_Order and'
      'Sales_order_line_no = :sales_order_line_no')
    Left = 704
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_order_line_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetTransferStStk: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryGetNonTransferStStk: TQuery
    DatabaseName = 'PB'
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
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end>
  end
  object qryGetStoreStock: TQuery
    DatabaseName = 'pb'
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
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryGetJobBagRtn: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select max(Job_Bag_Return) as Last_Return'
      'from Job_Bag_Return')
    Left = 704
    Top = 224
  end
  object qryAddJobBagRtn: TQuery
    DatabaseName = 'pb'
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
        DataType = ftUnknown
        Name = 'Job_Bag_Return'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Store_stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryGetReturns: TQuery
    DatabaseName = 'pb'
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
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryPartInactive: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Part'
      'set Not_in_Use = '#39'Y'#39
      'where Part = :Part')
    Left = 128
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object GetAllocStockbyStoreStockSQL: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object qryGetJobBag: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      
        'SELECT Customer, Branch_no, Contact_no, Rep, Office_Contact, Cus' +
        't_Order_No, Account_Team'
      'FROM Job_Bag'
      'WHERE Job_Bag = :Job_Bag')
    Left = 280
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryAddSO: TQuery
    DatabaseName = 'PB'
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
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Reqd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Ordrd'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Cust_Order_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer0'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Order_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_Head_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Delivery_Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Delivery_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Delivery_Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Replenish_Source'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_no0'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Supp_Order_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Ad_Hoc_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Production_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Contact_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cash_Sales'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object qryGetBin: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Production_Location'
      'FROM Production_Location'
      'WHERE Part_Bin = :Part_Bin')
    Left = 280
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end>
  end
  object UpdLastSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_SO_Number = :Last_SO_Number'
      'Where Company = 1'
      ' ')
    Left = 560
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_SO_Number'
        ParamType = ptUnknown
      end>
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select In_Use_By, Name from Company Where Company = 1'
      ' ')
    Left = 560
    Top = 392
  end
  object GetLastSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Last_SO_Number, Last_Invoice_No'
      'From Company'
      'Where Company = 1'
      ' ')
    Left = 560
    Top = 504
  end
  object qryAddSORep: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep_Percentage'
        ParamType = ptUnknown
      end>
  end
  object qryAddSOLine: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_pack_quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Sales_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Ordered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contract'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contract_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Discount_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Discount_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'Original_Sell_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Markup_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Markup_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quantity_Overs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_is_Sample'
        ParamType = ptUnknown
      end>
  end
  object qryGetPart: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryAddJobBagRequest: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrderLines: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSOStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Sales_Order_Head_Status = :Sales_Order_Head_Status'
      'WHERE Sales_Order = :Sales_Order')
    Left = 440
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Head_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextPickNo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(Sales_Order_Picking) as Last_Picking'
      'from Sales_Order_Picking')
    Left = 640
    Top = 392
  end
  object qryGetSOAlloc: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryAddSOPick: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Sales_Order_Picking'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Picking_No'
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
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_To_Pick'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Picking_List_Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Picked'
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
        Name = 'Stock_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_upfront'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Allocation'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Pick_Note_Confirmed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sets_Per_Pad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryAddSODelivNote: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Del_Dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Desp_Note_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Del_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Del_Dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Courier'
        ParamType = ptUnknown
      end>
  end
  object qryAddSODelivLine: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetPickNote: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Order_Picking'
      'FROM Sales_Order_Picking'
      'WHERE Sales_Order = :Sales_Order')
    Left = 744
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPartStoreBin: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Part_Store_Bin'
      'Set Bin_Can_Pick = :Bin_Can_Pick'
      'WHERE Part_Store = :Part_Store and'
      '      Part_Bin = :Part_Bin')
    Left = 848
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Bin_Can_Pick'
        ParamType = ptUnknown
      end
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
end
