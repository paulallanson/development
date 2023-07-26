object dtmdlStockMove: TdtmdlStockMove
  OldCreateOrder = False
  Left = 22
  Top = 66
  Height = 479
  Width = 741
  object GetStoresSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store.*'
      'From Part_Store, Part_Store_Type'
      
        'Where (Part_Store_Type.Part_Store_Type = Part_Store.Part_Store_T' +
        'ype)'
      
        'Order by Part_Store_Type.Part_Store_Is_Van, Part_Store.Part_Stor' +
        'e_Name'
      ' ')
    Left = 24
    Top = 16
  end
  object StoresDataSource: TDataSource
    DataSet = GetStoresSQL
    Left = 104
    Top = 16
  end
  object CheckValidBinSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from part_Store_bin'
      'where Part_Store = :Part_Store and'
      'Part_Bin = :Part_Bin')
    Left = 32
    Top = 80
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
  object GetPartSql: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Part'
      'Where (Part = :Part)'
      '  ')
    Left = 128
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object UpdLastLotSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set Last_Store_Lot = :Last_Store_Lot'
      'Where (Part = :Part)'
      ' ')
    Left = 32
    Top = 144
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
    Left = 128
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
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
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Part_Store'
        ParamType = ptUnknown
      end>
  end
  object UpdStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Store_Stock'
      'Set'
      '   Store_Cost = Store_Cost + :Store_Cost_Adj,'
      '   Store_Quantity = Store_Quantity + :Store_Quantity_Adj,'
      
        '   Quantity_Allocated = Quantity_Allocated + :Quantity_Allocated' +
        '_Adj ,'
      '   Store_Stock_Description = :Store_Stock_Description,'
      '   Store_Stock_Invoice_Upfront = :Invoice_Upfront,'
      '   Sets_per_pad = :Sets_per_Pad'
      'Where Store_Stock = :Store_Stock'
      ' '
      ' '
      ' '
      ' ')
    Left = 224
    Top = 144
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
        DataType = ftString
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
        Name = 'Sets_per_Pad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object DelStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Store_Stock'
      'Where (Store_Stock = :Store_Stock) and'
      '      (Quantity_Allocated = 0) and'
      '      (Store_Quantity = 0)'
      ' ')
    Left = 200
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
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
    Left = 40
    Top = 200
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
    Left = 232
    Top = 200
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
    Left = 136
    Top = 200
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
  object GetNextStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Store_Stock) as Last_Code'
      'From Store_Stock'
      ' ')
    Left = 272
    Top = 16
  end
  object AddStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Store_Stock'
      
        '       (Store_Stock, Part_Store_Lot, Date_Received, Store_Cost, ' +
        'Store_Quantity,'
      
        '        Quantity_Allocated, Part, Part_Store, Part_Bin, Stock_Pa' +
        'ck_Quantity,'
      
        '        Store_Stock_Description, Invoice_Upfront, Sets_per_pad, ' +
        'Purchase_Order, Pallet_ID, Product_ID, Stock_is_Overs)'
      'Values'
      
        '       (:Store_Stock, :Part_Store_Lot, :Date_Received, :Store_Co' +
        'st, :Store_Quantity,'
      
        '        :Quantity_Allocated, :Part, :Part_Store, :Part_Bin, :Sto' +
        'ck_Pack_Quantity,'
      
        '        :Store_Stock_Description, :Up_front, :Sets_per_pad, :Pur' +
        'chase_Order, :Pallet_ID, :Product_ID, :Stock_is_Overs)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 80
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
        DataType = ftUnknown
        Name = 'Up_front'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sets_per_pad'
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
  object GetNextMoveSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Part_Movement) as Last_Code'
      'From Part_Movement')
    Left = 40
    Top = 248
  end
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
      
        ' Stock_Pack_Quantity, Part_Movement_Notes, Part_Store_Total_Quan' +
        'tity, Part_Store_Total_Value, Part_Store_Total_Allocated,'
      ' Purchase_Order, Pallet_ID, Product_ID)'
      ' Values'
      
        '(:Part_Movement, :Part, :Date_Received, :Part_Movement_Type, :Pa' +
        'rt_Movement_Bin,'
      
        ' :Part_Store_Lot,:Store_Cost,:Store_Quantity, :Part_Movement_Ref' +
        'erence,'
      
        ' :Part_Movement_Store, :Audit_User, :Audit_Workstation, :Print_O' +
        'n_Audit,'
      
        ' :Stock_Pack_Quantity,:Part_Movement_Notes, :Part_Store_Total_Qu' +
        'antity, :Part_Store_Total_Value, :Part_Store_Total_Allocated,'
      ' :Purchase_Order, :Pallet_ID, :Product_ID)'
      ' '
      ' '
      ' '
      ' ')
    Left = 136
    Top = 248
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
        Name = 'Part_Movement_Notes'
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
  object GetStoreStockNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Store_Stock.Store_Stock'
      'from Store_Stock'
      'where (Part_Store = :Part_Store) and'
      '      (Part_Bin = :Part_Bin) and'
      '      (Part_Store_Lot = :Part_Store_Lot) and'
      '      (Part = :Part)'
      '')
    Left = 246
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Bin'
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
      end>
  end
  object CheckPartExistsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part From Part Where Part = :Part'
      ' ')
    Left = 296
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object AddPartQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part'
      
        '(Part, Part_Description, Part_Cost_List, Part_Cost_Cat, Vat_Code' +
        ', Part_Updated,'
      
        '       Auto_Update, Part_Group, Purch_Pack_Quantity, Sell_Pack_Q' +
        'uantity,'
      '       Part_Purchase_Price, Part_Mark_Up_List, Part_Mark_Up_Cat,'
      
        '       Not_In_Use, Track_Serial_No, Last_Store_Lot, Price_unit, ' +
        'Customer, Branch_no,'
      
        '       Numbered, Product_Type, Product_Class, inactive_when_bala' +
        'nce_zero, Product_id,'
      '       FSC_Material_Claim, FSC_Mixed_Percentage)'
      'Values'
      
        '(:Part, :Part_Description, :Part_Cost_List, :Part_Cost_Cat, :Vat' +
        ', '#39'Y'#39','
      
        '       :Auto_Update, :Part_Group, :Purch_Pack_Quantity, :Sell_Pa' +
        'ck_Quantity,'
      
        '       :Part_Purchase_Price, :Part_Mark_Up_List, :Part_Mark_Up_C' +
        'at,'
      
        '       :Not_In_Use, :Track_Serial_No, '#39'LOT00000'#39', :Price_unit, :' +
        'Customer, :Branch_no,'
      
        '       :Numbered, :Product_Type, :Product_Class, '#39'N'#39', :Product_i' +
        'd,'
      '       :FSC_Material_Claim, :FSC_Mixed_Percentage)'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 301
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_List'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_Cat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Auto_Update'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Mark_Up_List'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Mark_Up_Cat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_In_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Track_Serial_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_unit'
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
      end
      item
        DataType = ftUnknown
        Name = 'Numbered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Class'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSC_Material_Claim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSC_Mixed_Percentage'
        ParamType = ptUnknown
      end>
  end
  object UpdPartQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set Part_Purchase_Price = :Part_Purchase_Price,'
      '  Purch_Pack_Quantity = :Purch_Pack_Quantity,'
      '  Part_Cost_List = :Part_Cost_List,'
      '  Part_Cost_Cat = :Part_Cost_Cat,'
      '  Sell_Pack_Quantity = :Sell_Pack_Quantity,'
      '  Price_Unit = :Price_unit,'
      '  Product_Type = :Product_Type,'
      '  FSC_Material_Claim = :FSC_Material_Claim,'
      '  FSC_Mixed_Percentage = :FSC_Mixed_Percentage'
      'where'
      '  Part = :Part'
      ' ')
    Left = 296
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_List'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_Cat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSC_Material_Claim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSC_Mixed_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object PriceUnitSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_unit = :Price_Unit')
    Left = 130
    Top = 301
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end>
  end
  object AddStStkSerial: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into store_stock_Serial_item'
      '(Store_Stock, Serial_Item_no, Serial_item_from, serial_item_to)'
      'values'
      
        '(:Store_Stock, :Serial_Item_no, :Serial_item_from, :serial_item_' +
        'to)')
    Left = 352
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Serial_Item_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Serial_item_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serial_item_to'
        ParamType = ptUnknown
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
    Left = 40
    Top = 365
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
  object qryPartInactive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'set Not_in_Use = '#39'Y'#39
      'where Part = :Part')
    Left = 352
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
