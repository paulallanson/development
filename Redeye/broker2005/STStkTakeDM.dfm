object STStkTkDM: TSTStkTkDM
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 436
  Width = 544
  object PartSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part_Description, Track_Serial_No, Purch_Pack_quantity'
      'from Part'
      'where Part = :Part')
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object CountListSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT distinct Stock_Take.Stock_Take_Ref,Stock_Take.Stock_Take_' +
        'Status,'
      '  Part_Store.Part_Store, Stock_Lots_In_Use, Stock_Bins_In_Use'
      'FROM'
      '  Stock_Take, Part_Store'
      'where'
      '  (Stock_Take.Stock_Take_ref is not null) and'
      '  (Stock_Take.Stock_Take_ref <> '#39#39') and'
      
        '  ((Stock_Take_Status >= :Status_From) and (Stock_Take_Status <=' +
        ' :Status_To)) and'
      '  (Stock_Take.Part_Store = Part_Store.Part_Store)'
      'order by Stock_Take_Ref'
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'Status_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Status_To'
        ParamType = ptUnknown
      end>
  end
  object CountListSRC: TDataSource
    DataSet = CountListSQL
    Left = 128
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
    Top = 120
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
  object CheckValidLotSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from store_Stock'
      'where part = :Part and'
      'Part_Store_lot = :Part_Store_lot')
    Left = 128
    Top = 120
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
  object PartStoreSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Part_Store'
      'where Part_Store = :Part_Store')
    Left = 128
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end>
  end
  object CountHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Stock_Take.Stock_Take_Ref,'
      '  Part_Store.Part_Store, Stock_Lots_In_Use, Stock_Bins_In_Use'
      'FROM'
      '  Stock_Take, Part_Store'
      'where'
      '  (Stock_Take.Stock_Take_Ref = :Stock_Take_Ref) and'
      '  (Stock_Take.Part_Store = Part_Store.Part_Store)'
      ' ')
    Left = 32
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Take_Ref'
        ParamType = ptUnknown
      end>
  end
  object CountDtlsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Stock_Take.*, Part.Part_Description, Part.Track_Serial_No' +
        ', Stock_Take.Stock_Take_Ref'
      'FROM Stock_Take LEFT JOIN Part ON Stock_Take.Part = Part.Part'
      'WHERE (((Stock_Take.Stock_Take_Ref)= :Stock_Take_ref))'
      
        'ORDER BY Stock_Take.Part_Bin, Stock_Take.Part, Stock_Take.Part_S' +
        'tore_Lot'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 32
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_take_ref'
        ParamType = ptUnknown
      end>
  end
  object CountDtlsSRC: TDataSource
    DataSet = CountDtlsSQL
    Left = 136
    Top = 232
  end
  object CountPartDtlsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select stock_take.*, part.Part_Description, Part.Track_Serial_No'
      'from stock_take, Part'
      'where (stock_take_ref = :Stock_take_ref) and'
      '      (Part.Part = Stock_Take.Part) and'
      '      (Stock_Take.part = :Part) and'
      '      (Stock_Take.Part_Bin = :Part_Bin) and'
      '      (Stock_Take.Part_Store_Lot = :Part_Lot)'
      ''
      ''
      ' ')
    Left = 128
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_take_ref'
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
        Name = 'Part_Lot'
        ParamType = ptUnknown
      end>
  end
  object GetCountStkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select stock_take.*'
      'from stock_take'
      'where (stock_take_ref = :Stock_take_ref)'
      ''
      ' '
      ' ')
    Left = 32
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_take_ref'
        ParamType = ptUnknown
      end>
  end
  object FreezeCountSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Stock_take'
      'set Date_Received = :Date_Received,'
      '      Store_Cost = :Store_Cost,'
      '      Stock_Take_Prior_Qty = :Store_Quantity,'
      '      Stock_Take_Status = '#39'F'#39
      'where Stock_take = :Stock_Take'
      ' ')
    Left = 136
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Store_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Store_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Take'
        ParamType = ptUnknown
      end>
  end
  object UpdCountSql: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Stock_Take'
      
        'set Stock_Take_Qty = :Stock_Take_Qty, Stock_Take_Status  = :Stoc' +
        'k_Take_Status ,'
      '  Part_Store_Lot = :Part_Store_Lot, Part_Bin = :Part_Bin ,'
      '  Stock_Take_Pack_Qty = :Pack_Qty, part = :Part'
      'where Stock_Take = :Stock_Take'
      ' '
      ' '
      ' '
      ' ')
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Take_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Take_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Pack_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Take'
        ParamType = ptUnknown
      end>
  end
  object NextStockTakeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Stock_Take) as Max_Stock_Take'
      'from Stock_Take'
      ' ')
    Left = 216
    Top = 136
  end
  object AddStockTakeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Stock_Take'
      
        '  (Stock_Take, Part_Store, Part_Bin, Part_Store_Lot, Stock_Take_' +
        'Prior_Qty,'
      
        '    Stock_Take_Qty, Store_Cost, Date_Received, Stock_Take_Status' +
        ', Stock_Take_Ref,'
      
        '      Part, Part_Bin_Orig, Part_Store_Lot_Orig, Stock_Take_Pack_' +
        'qty, Stock_Take_Pack_Qty_Orig,'
      '      Invoice_upfront, Store_Stock_Description)'
      'values'
      '  (:Stock_Take, :Store, :Bin, :Lot, :PriorQty,'
      
        '    :CountQty, :Store_Cost, :Date_Received, :status, :Ref, :Part' +
        ', :OrigBin, :OrigLot, :Stock_Take_Pack_qty,'
      
        '      :Stock_Take_Pack_Qty_Orig, :Invoice_upfront, :Store_Stock_' +
        'Description)'
      '  '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 216
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'Stock_Take'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Lot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PriorQty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CountQty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OrigBin'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OrigLot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Take_Pack_qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Take_Pack_Qty_Orig'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_upfront'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Stock_Description'
        ParamType = ptUnknown
      end>
  end
  object DelCountSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Stock_Take'
      'set Stock_Take_Qty = 0, Stock_Take_Status = :Status'
      'where Stock_Take = :Stock_Take'
      ' '
      ' ')
    Left = 224
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Take'
        ParamType = ptUnknown
      end>
  end
  object UpdStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update stock_take'
      'set stock_take_status = :status'
      'where stock_take.stock_take = :stock_take'
      ' ')
    Left = 224
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'stock_take'
        ParamType = ptUnknown
      end>
  end
  object StoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Store_Stock.*'
      'from Store_Stock'
      'where Store_Stock = :Store_Stock')
    Left = 232
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object GetStoreStockNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Store_Stock.Store_Stock, Store_Stock.Sets_Per_Pad, Purcha' +
        'se_Order'
      'from Store_Stock'
      'where (Part_Store = :Part_Store) and'
      '      (Part_Bin = :Part_Bin) and'
      '      (Part_Store_Lot = :Part_Store_Lot) and'
      '      (Part = :Part)'
      '')
    Left = 328
    Top = 16
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
  object DelCountRecSQl: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Stock_Take'
      'where Stock_Take.Stock_Take = :Stock_Take')
    Left = 288
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Take'
        ParamType = ptUnknown
      end>
  end
  object GetCountQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Stock_Take.Stock_Take, Store_Stock.Store_Quantity, Store_' +
        'Stock.Store_Cost, Store_Stock.Part'
      'FROM Stock_Take LEFT JOIN Store_Stock ON'
      #9'((Stock_Take.Part_Store_Lot_Orig = Store_Stock.Part_Store_Lot)'
      #9#9'or (Stock_Take.Part_Store_Lot_Orig is NULL)) AND'
      #9'((Stock_Take.Part_Bin_Orig = Store_Stock.Part_Bin) '
      #9#9'or (Stock_Take.Part_Bin_Orig is NULL)) AND'
      #9'(Stock_Take.Part_Store = Store_Stock.Part_Store) AND'
      #9'(Stock_Take.Part = Store_Stock.Part)'
      'WHERE (Stock_Take.Stock_Take_Ref = :Stock_Take_Ref)'
      ''
      ''
      ' ')
    Left = 272
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Take_Ref'
        ParamType = ptUnknown
      end>
  end
  object GetPartSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Part.Track_Serial_No, Part.Part_Purchase_Price, Part.Purc' +
        'h_Pack_Quantity'
      'From Part'
      'Where (Part.Part = :Part)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 286
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object GetStockDescSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Store_Stock.Store_Stock_Description, Store_Stock.Invoice_' +
        'Upfront'
      'from Store_Stock'
      'where (Part_Store = :Part_Store) and'
      '      (Part_Bin = :Part_Bin) and'
      '      (Part_Store_Lot = :Part_Store_Lot) and'
      '      (Part = :Part)'
      ''
      ' '
      ' ')
    Left = 328
    Top = 288
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
  object qryGetLastLot: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select store_stock.*'
      'from store_stock'
      'where part_store = :part_store and '
      'part = :part'
      'order by Part_store_lot desc')
    Left = 432
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'part_store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part.Part, Part.Customer, Invoice_upfront'
      'from Part, Customer'
      'where Part.Part = :Part and'
      'Part.Customer = Customer.Customer')
    Left = 432
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
