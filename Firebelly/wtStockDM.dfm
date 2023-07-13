object dtmdlStock: TdtmdlStock
  Height = 467
  Width = 572
  object qryAllStock: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *, product_group.product_group_description'
      'from Product, product_group'
      'where Product.product_group = product_group.product_group')
    Left = 24
    Top = 16
  end
  object dtsAllStock: TDataSource
    DataSet = qryAllStock
    Left = 104
    Top = 16
  end
  object qryDummy: TQuery
    Left = 168
    Top = 16
  end
  object qryProduct: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Product.*,'
      ' (select top 1 Unit_price'
      '    from Prices'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'from Product'
      'where Product_Code = :Product_Code')
    Left = 472
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Code'
        ParamType = ptUnknown
      end>
  end
end
