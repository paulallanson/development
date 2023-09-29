object DMStoreStock: TDMStoreStock
  Height = 480
  Width = 696
  object qrySelStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from store_stock '
      'where store_stock = :store_stock;')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'store_stock'
      end>
  end
  object qryUpdStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update store_stock'
      'set Quantity_Allocated = :Quantity_Allocated,'
      ' Store_Quantity = :Store_Quantity,'
      ' Store_Cost = :Store_Cost,'
      ' Date_Received = :Date_Received,'
      ' Part = :Part,'
      ' Part_Store_Lot = :Part_Store_Lot,'
      ' Part_Store = :Part_Store,'
      ' Part_Bin = :Part_Bin,'
      ' Stock_Pack_Quantity = :Stock_Pack_Quantity,'
      ' Store_Stock_Description = :Store_Stock_Description,'
      ' invoice_upfront = :invoice_upfront,'
      ' sets_per_pad = :sets_per_pad'
      'where store_stock = :store_stock;')
    Left = 40
    Top = 56
    ParamData = <
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Store_Cost'
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store_Lot'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Stock_Pack_Quantity'
      end
      item
        Name = 'Store_Stock_Description'
      end
      item
        Name = 'invoice_upfront'
      end
      item
        Name = 'sets_per_pad'
      end
      item
        Name = 'store_stock'
      end>
  end
  object qrySelPartStore: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from part_store '
      'where part_store = :part_store;')
    Left = 144
    Top = 8
    ParamData = <
      item
        Name = 'part_store'
      end>
  end
end
