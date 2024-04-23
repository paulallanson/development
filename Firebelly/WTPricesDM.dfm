object dtmdlPrices: TdtmdlPrices
  Height = 367
  Width = 792
  object qryAllPrices: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'SELECT'
      '    Worktop_thickness.Worktop,'
      '    Worktop.Description AS Worktop_Description,'
      '    Worktop_thickness.Thickness,'
      '    Thickness.Thickness_mm,'
      '    Worktop_thickness.Price_pointer,'
      '    Worktop.Material_Type,'
      '    Material_Type.Description AS Material_Type_Description,'
      '    Worktop.Worktop_Group,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    (select top 1 Effective_Date'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= GetDate()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= GetDate()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= GetDate()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= GetDate()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= GetDate()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion,'
      '    (select top 1 Operator.Operator_Name'
      '      from Prices, Operator'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.Operator = Operator.Operator and'
      '            Prices.effective_date <= GetDate()'
      '      order by Prices.effective_date desc) AS Operator_Name'
      'FROM (Worktop_Group'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN Worktop'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '        ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group)'
      '      INNER JOIN (Thickness'
      '      INNER JOIN Worktop_thickness'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop'
      'WHERE 1=1')
    Left = 51
    Top = 34
    object qryAllPricesWorktop: TIntegerField
      FieldName = 'Worktop'
      Origin = 'Worktop'
      Required = True
    end
    object qryAllPricesWorktop_Description: TWideStringField
      FieldName = 'Worktop_Description'
      Origin = 'Worktop_Description'
      Required = True
      Size = 40
    end
    object qryAllPricesThickness: TIntegerField
      FieldName = 'Thickness'
      Origin = 'Thickness'
      Required = True
    end
    object qryAllPricesThickness_mm: TWideStringField
      FieldName = 'Thickness_mm'
      Origin = 'Thickness_mm'
      Required = True
      Size = 50
    end
    object qryAllPricesPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
      Origin = 'Price_pointer'
      Required = True
    end
    object qryAllPricesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
      Origin = 'Material_Type'
    end
    object qryAllPricesMaterial_Type_Description: TWideStringField
      FieldName = 'Material_Type_Description'
      Origin = 'Material_Type_Description'
      Size = 100
    end
    object qryAllPricesWorktop_Group: TIntegerField
      FieldName = 'Worktop_Group'
      Origin = 'Worktop_Group'
    end
    object qryAllPricesWorktop_Group_Description: TWideStringField
      FieldName = 'Worktop_Group_Description'
      Origin = 'Worktop_Group_Description'
      Size = 50
    end
    object qryAllPricesEffective_Date: TDateTimeField
      FieldName = 'Effective_Date'
      Origin = 'Effective_Date'
      ReadOnly = True
    end
    object qryAllPricesDate_Changed: TDateTimeField
      FieldName = 'Date_Changed'
      Origin = 'Date_Changed'
      ReadOnly = True
    end
    object qryAllPricesUnit_Price: TCurrencyField
      FieldName = 'Unit_Price'
      Origin = 'Unit_Price'
      ReadOnly = True
    end
    object qryAllPricesUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
      Origin = 'Unit_Cost'
      ReadOnly = True
    end
    object qryAllPricesPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      Origin = 'Price_Unit_Description'
      ReadOnly = True
    end
    object qryAllPricesOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      Origin = 'Operator_Name'
      ReadOnly = True
      Size = 30
    end
    object qryAllPricesinactive: TWideStringField
      FieldName = 'inactive'
      Origin = 'inactive'
      Size = 1
    end
    object qryAllPricesStock_Item: TIntegerField
      FieldName = 'Stock_Item'
    end
    object qryAllPricesStock_Code: TWideStringField
      FieldName = 'Stock_Code'
    end
    object qryAllPricesStock_Description: TWideStringField
      FieldName = 'Stock_Description'
      Size = 50
    end
    object qryAllPricesSlab_Count: TIntegerField
      FieldName = 'Slab_Count'
    end
  end
  object dtsAllPrices: TDataSource
    DataSet = qryAllPrices
    Left = 147
    Top = 34
  end
  object qryDummyCurrent: TFDQuery
    SQL.Strings = (
      'SELECT'
      '    Worktop.Worktop,'
      '    Worktop.inactive,'
      '    Worktop.Description AS Worktop_Description,'
      '    Worktop_thickness.Thickness,'
      '    (select Thickness_mm '
      '     from Thickness'
      
        '     where Thickness.Thickness = Worktop_Thickness.Thickness) as' +
        ' Thickness_mm, '
      '    Worktop_thickness.Price_pointer,'
      '    Worktop_thickness.Stock_item,'
      '    Worktop.Material_Type,'
      '    Worktop.Show_Online,'
      '    Material_Type.Description AS Material_Type_Description,'
      '    Worktop.Worktop_Group,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    (select top 1 Effective_Date'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion,'
      '    (select top 1 Operator.Operator_Name'
      '      from Prices, Operator'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.Operator = Operator.Operator and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Operator_Name,'
      '      Stock_item.Stock_Description,'
      '      Stock_item.Stock_code,'
      '      (SELECT COUNT(Slab_Size_ID)'
      '       FROM Worktop_Thickness_Slab_Size'
      
        '       WHERE Worktop_Thickness_Slab_Size.Worktop = worktop_thick' +
        'ness.Worktop AND'
      
        '             Worktop_Thickness_Slab_Size.Thickness = worktop_thi' +
        'ckness.Thickness) as Slab_Count'
      'FROM Stock_item'
      '        RIGHT JOIN ((Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        INNER JOIN Worktop'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      '        LEFT JOIN Worktop_thickness'
      '          ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '          ON Stock_item.Stock_item = Worktop_thickness.Stock_Ite' +
        'm'
      'WHERE 1=1'
      '')
    Left = 48
    Top = 120
  end
  object qryDummyFuture: TFDQuery
    SQL.Strings = (
      'SELECT  Worktop_thickness.Worktop,'
      '        Worktop.inactive,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop_thickness.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop_thickness.Stock_item,'
      '        Worktop.Material_Type,'
      '        Worktop.Show_Online,'
      '        Material_Type.Description as Material_Type_Description,'
      '        Worktop.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Price_Pointer.Price_Type,'
      '        Prices.Effective_Date,'
      '        Prices.Price_Basis,'
      '        Price_Basis.Description as Price_Basis_Description,'
      '        Prices.Unit_Price,'
      '        Prices.Unit_Cost,'
      '        Prices.Date_Changed,'
      '        Prices.Operator,'
      '        Operator.Operator_Name,'
      '        Prices.Price_unit,'
      '        Price_unit.Price_unit_description,'
      '        Stock_item.Stock_code,'
      '        Stock_item.Stock_Description,'
      '        (SELECT COUNT(Slab_Size_ID)'
      '        FROM Worktop_Thickness_Slab_Size'
      
        '        WHERE Worktop_Thickness_Slab_Size.Worktop = worktop_thic' +
        'kness.Worktop AND'
      
        '              Worktop_Thickness_Slab_Size.Thickness = worktop_th' +
        'ickness.Thickness) as Slab_Count'
      'FROM Stock_item'
      '        RIGHT JOIN ((Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        INNER JOIN Worktop'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Price_Pointer'
      '        INNER JOIN Worktop_thickness'
      
        '          ON Price_Pointer.Price_Pointer = Worktop_thickness.Pri' +
        'ce_pointer)'
      '        INNER JOIN (Price_Basis'
      '        INNER JOIN (Price_unit'
      '        INNER JOIN (Operator'
      '        INNER JOIN Prices'
      '          ON Operator.Operator = Prices.Operator)'
      '          ON Price_unit.Price_unit = Prices.Price_unit)'
      '          ON Price_Basis.Price_Basis = Prices.Price_Basis)'
      '          ON Price_Pointer.Price_Pointer = Prices.Price_Pointer)'
      '          ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '          ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '          ON Stock_item.Stock_item = Worktop_thickness.Stock_Ite' +
        'm'
      'WHERE 1=1')
    Left = 168
    Top = 120
  end
  object qryDeletePrices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Prices'
      
        'WHERE Price_Pointer = :Price_Pointer AND Effective_Date = :Effec' +
        'tive_Date')
    Left = 248
    Top = 32
    ParamData = <
      item
        Name = 'Price_Pointer'
      end
      item
        Name = 'Effective_Date'
      end>
  end
  object qryDummyCurrentOld: TFDQuery
    SQL.Strings = (
      'SELECT'
      '    Worktop.Worktop,'
      '    Worktop.inactive,'
      '    Worktop.Description AS Worktop_Description,'
      '    Worktop_thickness.Thickness,'
      '    (select Thickness_mm '
      '     from Thickness'
      
        '     where Thickness.Thickness = Worktop_Thickness.Thickness) as' +
        ' Thickness_mm, '
      '    Worktop_thickness.Price_pointer,'
      '    Worktop_thickness.Stock_item,'
      '    Worktop.Material_Type,'
      '    Worktop.Show_Online,'
      '    Material_Type.Description AS Material_Type_Description,'
      '    Worktop.Worktop_Group,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    (select top 1 Effective_Date'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion,'
      '    (select top 1 Operator.Operator_Name'
      '      from Prices, Operator'
      
        '      where Prices.Price_pointer = worktop_thickness.price_point' +
        'er and'
      '            Prices.Operator = Operator.Operator and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Operator_Name'
      'FROM (Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        INNER JOIN Worktop'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group' +
        ')'
      '        LEFT JOIN Worktop_thickness'
      '          ON Worktop.Worktop = Worktop_thickness.Worktop'
      'WHERE 1=1'
      '')
    Left = 288
    Top = 120
  end
  object qryDummyFutureOld: TFDQuery
    SQL.Strings = (
      'SELECT  Worktop_thickness.Worktop,'
      '        Worktop.inactive,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop_thickness.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop_thickness.Stock_item,'
      '        Worktop.Material_Type,'
      '        Worktop.Show_Online,'
      '        Material_Type.Description as Material_Type_Description,'
      '        Worktop.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Price_Pointer.Price_Type,'
      '        Prices.Effective_Date,'
      '        Prices.Price_Basis,'
      '        Price_Basis.Description as Price_Basis_Description,'
      '        Prices.Unit_Price,'
      '        Prices.Unit_Cost,'
      '        Prices.Date_Changed,'
      '        Prices.Operator,'
      '        Operator.Operator_Name,'
      '        Prices.Price_unit,'
      '        Price_unit.Price_unit_description'
      'FROM Price_unit'
      '        INNER JOIN (Operator'
      '        INNER JOIN (Price_Basis'
      '        INNER JOIN ((Price_Pointer'
      '        INNER JOIN (Thickness'
      '        INNER JOIN (Worktop_Group'
      '        RIGHT JOIN (Material_Type'
      '        INNER JOIN (Worktop'
      '        INNER JOIN Worktop_thickness'
      '            ON Worktop.Worktop = Worktop_thickness.Worktop)'
      
        '            ON Material_Type.Material_Type = Worktop.Material_Ty' +
        'pe)'
      
        '            ON Worktop_Group.Worktop_Group = Worktop.Worktop_Gro' +
        'up)'
      
        '            ON Thickness.Thickness = Worktop_thickness.Thickness' +
        ')'
      
        '            ON Price_Pointer.Price_Pointer = Worktop_thickness.P' +
        'rice_pointer)'
      '        INNER JOIN Prices'
      
        '            ON Price_Pointer.Price_Pointer = Prices.Price_Pointe' +
        'r)'
      '            ON Price_Basis.Price_Basis = Prices.Price_Basis)'
      '            ON Operator.Operator = Prices.Operator)'
      '            ON Price_unit.Price_unit = Prices.Price_unit'
      'WHERE 1=1')
    Left = 424
    Top = 120
  end
end
