object DMStoreStock: TDMStoreStock
  OldCreateOrder = False
  Left = 216
  Top = 144
  Height = 480
  Width = 696
  object qrySelStoreStock: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from store_stock '
      'where store_stock = :store_stock;')
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'store_stock'
        ParamType = ptUnknown
      end>
  end
  object qryUpdStoreStock: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Quantity'
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
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Lot'
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
        Name = 'invoice_upfront'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sets_per_pad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'store_stock'
        ParamType = ptUnknown
      end>
  end
  object qrySelPartStore: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from part_store '
      'where part_store = :part_store;')
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'part_store'
        ParamType = ptUnknown
      end>
  end
end
