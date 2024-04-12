object dtmdlSuppliers: TdtmdlSuppliers
  Height = 632
  Width = 706
  object qryMaterialType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Material_Type.*'
      'FROM Material_Type'
      'ORDER BY Description')
    Left = 32
    Top = 40
  end
  object qryGetMaterialGroups: TFDQuery
    MasterSource = dtsMaterialType
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Worktop_Group.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Worktop_Group.Material_Type,'
      '        Worktop_Group.inactive'
      'FROM Material_Type'
      '      INNER JOIN Worktop_Group'
      
        '        ON Material_Type.Material_Type = Worktop_Group.Material_' +
        'Type'
      'WHERE Worktop_Group.Material_Type = :Material_Type AND'
      
        '      ((Worktop_Group.inactive = '#39'N'#39') OR (Worktop_Group.inactive' +
        ' = '#39#39') OR (Worktop_Group.inactive is NULL))'
      'ORDER BY Worktop_Group.Worktop_Group_Description')
    Left = 32
    Top = 96
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsMaterialType: TDataSource
    DataSet = qryMaterialType
    Left = 136
    Top = 40
  end
  object dtsGetMaterialGroup: TDataSource
    DataSet = qryGetMaterialGroups
    Left = 136
    Top = 96
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop.Not_used_for_quoting,'
      '        Worktop.Material_Type,'
      '        Worktop.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Worktop.inactive,'
      '        Worktop.Show_Online,'
      '        Worktop.Worktop_Finish,'
      '        Material_Type.Description AS Material_Description,'
      '        Discount.Discount_Label,'
      '        Discount.Discount_Type,'
      '        Worktop_Finish.Description as Finish_Description'
      'FROM Worktop_Finish'
      '        RIGHT JOIN (Discount'
      '        RIGHT JOIN (Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        RIGHT JOIN Worktop'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      '          ON Discount.Discount = Worktop.Discount)'
      
        '          ON Worktop_Finish.Worktop_Finish = Worktop.Worktop_Fin' +
        'ish'
      
        'WHERE ((Worktop.Material_Type = :Material_Type) OR (:Material_Ty' +
        'pe = 0)) AND'
      
        '  ((Worktop.Worktop_Group = :Worktop_Group) OR (:Worktop_Group =' +
        ' 0)) and'
      
        '  ((Worktop.inactive = :inactive) or (Worktop.inactive = '#39'N'#39') or' +
        ' (Worktop.inactive is NULL)) AND'
      '  (Worktop.Description LIKE :Description)'
      
        'ORDER BY Worktop_Group.Worktop_Group_Description, Worktop.Descri' +
        'ption')
    Left = 384
    Top = 40
    ParamData = <
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Description'
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 464
    Top = 40
  end
  object qryGetWTThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Worktop_Thickness'
      'WHERE Worktop_Thickness.Worktop = :Worktop')
    Left = 32
    Top = 160
    ParamData = <
      item
        Name = 'Worktop'
      end>
  end
  object qryAddSupplierWT: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Supplier_Worktop (Supplier, Worktop, inactive)'
      'VALUES (:Supplier, :Worktop, '#39'N'#39')')
    Left = 32
    Top = 216
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qryAddSupplierWTThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Supplier_Worktop_Thickness'
      'VALUES (:Supplier, :Worktop, :Thickness, :Price_Pointer)')
    Left = 48
    Top = 280
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
  object qryWorktopPrices: TFDQuery
    ConnectionName = 'WT'
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT'
      '    Supplier_Worktop_Thickness.Worktop,'
      '    Worktop.Description AS Worktop_Description,'
      '    Supplier_Worktop_Thickness.Thickness,'
      '    Thickness.Thickness_mm,'
      '    Supplier_Worktop_Thickness.Price_pointer,'
      '    Worktop.Material_Type,'
      '    Worktop.Show_Online,'
      '    Material_Type.Description AS Material_Type_Description,'
      '    Worktop.Worktop_Group,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    (select top 1 Effective_Date'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion,'
      '    (select top 1 Operator.Operator_Name'
      '      from Prices, Operator'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.Operator = Operator.Operator and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Operator_Name'
      'FROM (Worktop_Group'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN Worktop'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '        ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group)'
      '      INNER JOIN (Thickness'
      '      INNER JOIN Supplier_Worktop_Thickness'
      
        '        ON Thickness.Thickness = Supplier_Worktop_Thickness.Thic' +
        'kness)'
      '        ON Worktop.Worktop = Supplier_Worktop_Thickness.Worktop'
      'WHERE 1=1 AND Supplier_Worktop_Thickness.Supplier = :Supplier'
      
        'ORDER BY Material_Type.Description, Worktop_Group.Worktop_Group_' +
        'Description, Worktop.Description, Thickness.Thickness_mm')
    Left = 40
    Top = 336
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object dtsWorktopPrices: TDataSource
    DataSet = qryWorktopPrices
    Left = 104
    Top = 336
  end
  object qryDummyPrices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Worktop_Thickness.Worktop,'
      '    Worktop.Description AS Worktop_Description,'
      '    Supplier_Worktop_Thickness.Thickness,'
      '    Thickness.Thickness_mm,'
      '    Supplier_Worktop_Thickness.Price_pointer,'
      '    Worktop.Material_Type,'
      '    Worktop.Show_Online,'
      '    Material_Type.Description AS Material_Type_Description,'
      '    Worktop.Worktop_Group,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    (select top 1 Effective_Date'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion,'
      '    (select top 1 Operator.Operator_Name'
      '      from Prices, Operator'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.Operator = Operator.Operator and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Operator_Name,'
      '      Supplier_Worktop.inactive'
      'FROM Supplier_Worktop'
      '      INNER JOIN (Worktop_Group'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN (Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN Supplier_Worktop_Thickness'
      
        '          ON Worktop.Worktop = Supplier_Worktop_Thickness.Workto' +
        'p)'
      
        '          ON Thickness.Thickness = Supplier_Worktop_Thickness.Th' +
        'ickness)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      
        '          ON (Supplier_Worktop.Worktop = Supplier_Worktop_Thickn' +
        'ess.Worktop)'
      
        '            AND (Supplier_Worktop.Supplier = Supplier_Worktop_Th' +
        'ickness.Supplier)'
      'WHERE Supplier_Worktop_Thickness.Supplier = :Supplier'
      '')
    Left = 200
    Top = 336
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryChkSupplierWT: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Supplier'
      'FROM Supplier_Worktop'
      'WHERE Supplier = :Supplier AND Worktop = :Worktop')
    Left = 128
    Top = 216
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qryChkSupplierWTThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Worktop_Thickness.Supplier,'
      '    Supplier_Worktop_Thickness.Worktop,'
      '    Supplier_Worktop_Thickness.Thickness,'
      '    Supplier_Worktop_Thickness.Price_Pointer,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Worktop_Thickness.pr' +
        'ice_pointer and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost'
      'FROM Supplier_Worktop_Thickness'
      
        'WHERE Supplier = :Supplier AND Worktop = :Worktop AND Thickness ' +
        '= :Thickness')
    Left = 128
    Top = 280
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qrySupplierWTInactive: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Supplier_Worktop'
      'SET Inactive = :Inactive'
      'WHERE Supplier = :Supplier AND Worktop = :Worktop')
    Left = 384
    Top = 96
    ParamData = <
      item
        Name = 'Inactive'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qrySupplierWTDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Supplier_Worktop'
      'WHERE Supplier = :Supplier AND Worktop = :Worktop')
    Left = 512
    Top = 152
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qrySupplierWTThickDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Supplier_Worktop_Thickness'
      'WHERE Supplier = :Supplier AND Worktop = :Worktop')
    Left = 512
    Top = 96
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qryChkSupplierProd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Product.Supplier_Product,'
      '    Supplier_Product.Supplier,'
      '    Supplier_Product.Supplier_Product_Code,'
      '    Supplier_Product.Price_Pointer,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost'
      'FROM Supplier_Product'
      
        'WHERE Supplier = :Supplier AND Supplier_Product_Code = :Supplier' +
        '_Product_Code')
    Left = 320
    Top = 216
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Supplier_Product_Code'
      end>
  end
  object qryAddSupplierProd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Supplier_Product'
      '('
      'Supplier,'
      'Supplier_Product_Code,'
      'Description,'
      'Cost_Pack_Quantity,'
      'Sell_Pack_Quantity,'
      'Inactive,'
      'Price_Pointer'
      ')'
      'VALUES'
      '('
      ':Supplier,'
      ':Supplier_Product_Code,'
      ':Description,'
      ':Cost_Pack_Quantity,'
      ':Sell_Pack_Quantity,'
      ':Inactive,'
      ':Price_Pointer'
      ')')
    Left = 320
    Top = 272
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Supplier_Product_Code'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Cost_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
  object qryUpdSupplierProd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Supplier_Product'
      'SET Supplier_Product_Code = :Supplier_Product_Code,'
      '    Description = :Description,'
      '    Cost_Pack_Quantity = :Cost_Pack_Quantity,'
      '    Sell_Pack_Quantity = :Sell_Pack_Quantity,'
      '    inactive = :inactive'
      'WHERE Supplier_Product = :Supplier_Product')
    Left = 320
    Top = 328
    ParamData = <
      item
        Name = 'Supplier_Product_Code'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Cost_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Supplier_Product'
      end>
  end
  object qryProductPrices: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT'
      '    Supplier_Product.Supplier_Product,'
      '    Supplier_Product.Supplier,'
      '    Supplier_Product.Supplier_Product_Code,'
      '    Supplier_Product.Description,'
      '    Supplier_Product.inactive,'
      '    Supplier_Product.Price_Pointer,'
      '    (select top 1 effective_date'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= Now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= Now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= Now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= Now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= Now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion,'
      '    (select top 1 Operator.Operator_Name'
      '      from Prices, Operator'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.Operator = Operator.Operator and'
      '            Prices.effective_date <= Now()'
      '      order by Prices.effective_date desc) AS Operator_Name'
      'FROM Supplier_Product'
      'WHERE 1=1 AND Supplier_Product.Supplier = :Supplier'
      'ORDER BY Supplier_Product.Supplier_Product_Code')
    Left = 40
    Top = 408
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsProductPrices: TDataSource
    DataSet = qryProductPrices
    Left = 104
    Top = 408
  end
  object qryDummyProductPrices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Product.Supplier_Product,'
      '    Supplier_Product.Supplier,'
      '    Supplier_Product.Supplier_Product_Code,'
      '    Supplier_Product.Description,'
      '    Supplier_Product.inactive,'
      '    Supplier_Product.Price_Pointer,'
      '    (select top 1 effective_date'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion,'
      '    (select top 1 Operator.Operator_Name'
      '      from Prices, Operator'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.Operator = Operator.Operator and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Operator_Name'
      'FROM Supplier_Product'
      'WHERE Supplier_Product.Supplier = :Supplier')
    Left = 200
    Top = 408
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryGetSupplierProd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Product.Supplier_Product,'
      '    Supplier_Product.Supplier,'
      '    Supplier_Product.Supplier_Product_Code,'
      '    Supplier_Product.Description,'
      '    Supplier_Product.Cost_Pack_Quantity,'
      '    Supplier_Product.Sell_Pack_Quantity,'
      '    Supplier_Product.inactive,'
      '    Supplier_Product.Price_Pointer,'
      '    (select top 1 effective_date'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion'
      'FROM Supplier_Product'
      'WHERE Supplier_Product = :Supplier_Product')
    Left = 320
    Top = 392
    ParamData = <
      item
        Name = 'Supplier_Product'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 320
    Top = 464
  end
  object qryDeletePrices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Prices'
      'WHERE Price_Pointer = :Price_Pointer')
    Left = 320
    Top = 520
    ParamData = <
      item
        Name = 'Price_Pointer'
      end>
  end
  object qrySupplierWorktops: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT  Worktop.Description AS Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Worktop.Show_Online,'
      '        Material_Type.Description AS Material_Type_Description,'
      '        Worktop.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Supplier_Worktop.Supplier,'
      '        Supplier_Worktop.Worktop,'
      '        Supplier_Worktop.inactive,'
      '        Supplier_Worktop.Adhesive_Product_Code,'
      '        Supplier_Worktop.Adhesive_Quantity_Per_Slab'
      'FROM (Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        INNER JOIN Worktop'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      
        '        INNER JOIN Supplier_Worktop ON Worktop.Worktop = Supplie' +
        'r_Worktop.Worktop'
      'WHERE (1=1) AND Supplier_Worktop.Supplier = :Supplier'
      
        'ORDER BY Material_Type.Description, Worktop_Group.Worktop_Group_' +
        'Description, Worktop.Description')
    Left = 40
    Top = 480
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object dtsSupplierWorktops: TDataSource
    DataSet = qrySupplierWorktops
    Left = 104
    Top = 480
  end
  object qryDummySupplierWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Worktop.Description AS Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Worktop.Show_Online,'
      '        Material_Type.Description AS Material_Type_Description,'
      '        Worktop.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Supplier_Worktop.Supplier,'
      '        Supplier_Worktop.Worktop,'
      '        Supplier_Worktop.inactive,'
      '        Supplier_Worktop.Adhesive_Product_Code,'
      '        Supplier_Worktop.Adhesive_Quantity_Per_Slab'
      'FROM (Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        INNER JOIN Worktop'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      
        '        INNER JOIN Supplier_Worktop ON Worktop.Worktop = Supplie' +
        'r_Worktop.Worktop'
      'WHERE Supplier_Worktop.Supplier = :Supplier')
    Left = 200
    Top = 480
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
end
