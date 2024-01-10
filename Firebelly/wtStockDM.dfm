object dtmdlStock: TdtmdlStock
  OnCreate = DataModuleCreate
  Height = 467
  Width = 572
  object qryAllStock: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *, product_group.product_group_description'
      'from Product, product_group'
      'where Product.product_group = product_group.product_group')
    Left = 24
    Top = 16
  end
  object dtsAllStock: TDataSource
    DataSet = qryAllStock
    Left = 240
    Top = 88
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT  Stock_item.Stock_item,'
      '        Stock_item.Stock_code,'
      '        Stock_item.Stock_Description,'
      '        0 as Total_Quantity,'
      '        0 as Allocated_Quantity,'
      '        0 as PO_Quantity,'
      '        Stock_item.Product_group,'
      '        Product_Group.Product_Group_Description,'
      '        Stock_item.inactive'
      'FROM Product_Group'
      '        RIGHT JOIN Stock_item'
      
        '          ON Product_Group.Product_Group = Stock_item.Product_Gr' +
        'oup'
      
        'WHERE (Stock_item.Stock_code LIKE '#39'%'#39' + :Code + '#39'%'#39') or (Stock_i' +
        'tem.Stock_Description LIKE '#39'%'#39' + :Code + '#39'%'#39')'
      'ORDER BY'
      '    Stock_item.Stock_code'
      '')
    Left = 96
    Top = 16
    ParamData = <
      item
        Name = 'Code'
      end
      item
        Name = 'Code'
      end>
  end
  object wtStkDatabase: TFDConnection
    ConnectionDefName = 'GSmart'
    ConnectionName = 'STK'
    Params.Strings = (
      'User_Name=readonly'
      'Password=R34donly4'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 496
    Top = 16
  end
  object qryStockSystem: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Stock_System'
      'WHERE Stock_System = :Stock_System')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Stock_System'
      end>
  end
  object qryProduct: TFDQuery
    ConnectionName = 'wt'
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
        Name = 'Product_Code'
      end>
  end
  object qryGSmart: TFDQuery
    ConnectionName = 'STK'
    SQL.Strings = (
      'SELECT  Stock.ID,'
      '        Stock.Stockcode AS Stock_Code,'
      '        Stock.Description AS Stock_Description,'
      '        Sum(LocationStock.Quantity) AS Total_Quantity,'
      #9#9'    (SELECT'#9'ISNULL(SUM(StockIssueItem.Remaining),0)'
      '         FROM StockIssueItem'
      
        #9#9'     WHERE (StockIssueItem.StockID = Stock.ID)) as Allocated_Q' +
        'uantity,'
      #9#9'    (SELECT'#9'ISNULL(SUM(StockReceiptItem.Remaining),0)'
      #9#9'     FROM StockReceiptItem'
      
        #9#9'      WHERE (StockReceiptItem.StockID = Stock.ID)) as PO_Quant' +
        'ity'
      'FROM Stock'
      '             RIGHT JOIN LocationStock '
      '                    ON Stock.ID = LocationStock.StockID'
      
        'WHERE (Stock.Stockcode LIKE '#39'%'#39' + :Code + '#39'%'#39') or (Stock.Descrip' +
        'tion LIKE '#39'%'#39' + :Code + '#39'%'#39')'
      'GROUP BY'
      '             Stock.ID, '
      '             Stock.Stockcode,'
      '             Stock.Description'
      'ORDER BY'
      '             Stock.Stockcode'
      '')
    Left = 496
    Top = 80
    ParamData = <
      item
        Name = 'Code'
      end
      item
        Name = 'Code'
      end>
  end
end
