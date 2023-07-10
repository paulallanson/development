object dtmdlPrices: TdtmdlPrices
  OldCreateOrder = False
  Left = 214
  Top = 105
  Height = 361
  Width = 794
  object qryAllPrices: TQuery
    DatabaseName = 'WT'
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
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN Worktop'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '        ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group)'
      '      INNER JOIN (Thickness'
      '      INNER JOIN Worktop_thickness'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop'
      'WHERE 1=1')
    Left = 24
    Top = 8
    object qryAllPricesWorktop: TIntegerField
      FieldName = 'Worktop'
    end
    object qryAllPricesWorktop_Description: TStringField
      FieldName = 'Worktop_Description'
      Size = 40
    end
    object qryAllPricesThickness: TIntegerField
      FieldName = 'Thickness'
    end
    object qryAllPricesThickness_mm: TStringField
      FieldName = 'Thickness_mm'
      Size = 10
    end
    object qryAllPricesPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
    end
    object qryAllPricesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object qryAllPricesMaterial_Type_Description: TStringField
      FieldName = 'Material_Type_Description'
      Size = 100
    end
    object qryAllPricesWorktop_Group: TIntegerField
      FieldName = 'Worktop_Group'
    end
    object qryAllPricesWorktop_Group_Description: TStringField
      FieldName = 'Worktop_Group_Description'
      Size = 30
    end
    object qryAllPricesEffective_Date: TDateTimeField
      FieldName = 'Effective_Date'
    end
    object qryAllPricesDate_Changed: TDateTimeField
      FieldName = 'Date_Changed'
    end
    object qryAllPricesUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      DisplayFormat = '0.00'
    end
    object qryAllPricesUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      DisplayFormat = '0.00'
    end
    object qryAllPricesPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
    end
    object qryAllPricesOperator_Name: TStringField
      FieldName = 'Operator_Name'
      Size = 30
    end
    object qryAllPricesinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
  end
  object dtsAllPrices: TDataSource
    DataSet = qryAllPrices
    Left = 80
    Top = 8
  end
  object qryDummyCurrent: TQuery
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
      'WHERE 1=1')
    Left = 152
    Top = 8
  end
  object qryDummyFuture: TQuery
    SQL.Strings = (
      'SELECT  Worktop_thickness.Worktop,'
      '        Worktop.inactive,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop_thickness.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Worktop_thickness.Price_pointer,'
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
    Left = 240
    Top = 8
  end
  object qryDeletePrices: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'DELETE FROM Prices'
      
        'WHERE Price_Pointer = :Price_Pointer AND Effective_Date = :Effec' +
        'tive_Date')
    Left = 24
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Pointer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Effective_Date'
        ParamType = ptUnknown
      end>
  end
end
