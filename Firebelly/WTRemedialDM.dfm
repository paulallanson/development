object dtmdlRemedial: TdtmdlRemedial
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object qryGetProduct: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'
      #160#160#160' Supplier_Product.Supplier_Product,'
      #160#160#160' Supplier_Product.Supplier,'
      #160#160#160' Supplier_Product.Supplier_Product_Code,'
      #160#160#160' Supplier_Product.Description,'
      #160#160#160' Supplier_Product.Price_Pointer,'
      #160#160#160' (select top 1 Unit_cost'
      #160#160#160#160#160' from Prices'
      
        #160#160#160#160#160' where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      #160#160#160#160#160#160#160#160#160#160#160' Prices.effective_date <= now()'
      #160#160#160#160#160' order by Prices.effective_date desc) AS Unit_Cost'
      'FROM Supplier_Product'
      'WHERE (Supplier = :Supplier) AND'
      #160#160#160#160#160' (Supplier_Product_Code = :Supplier_Product_Code) AND'
      #160#160#160#160#160' (Inactive = '#39'N'#39')'
      '')
    Left = 363
    Top = 46
    ParamData = <
      item
        Name = 'SUPPLIER'
        ParamType = ptInput
      end
      item
        Name = 'SUPPLIER_PRODUCT_CODE'
        ParamType = ptInput
      end>
  end
  object qryRHeader: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'
      #160#160#160' Remedial.ID,'
      #160#160#160' Remedial.Date_Raised,'
      #160#160#160' Remedial.Operator,'
      #160#160#160' Operator.Operator_Name,'
      #160#160#160' Remedial.Remedial_Type,'
      #160#160#160' Remedial_Type.Remedial_Type_Descr,'
      #160#160#160' Remedial.Remedial_Dept,'
      #160#160#160' Remedial_Dept.Remedial_Dept_Descr,'
      #160#160#160' Remedial.Remedial_Category,'
      #160#160#160' Remedial_Category.Remedial_Category_Descr,'
      #160#160#160' Remedial.Job,'
      #160#160#160' Remedial.Remedial_Number,'
      #160#160#160' Sales_Order.Sales_Order,'
      #160#160#160' Job_Remedial.Production_Required'
      'FROM'
      #160#160#160' Remedial_Type'
      #160#160#160' RIGHT JOIN ('
      #160#160#160#160#160#160#160' Remedial_Dept'
      #160#160#160#160#160#160#160' RIGHT JOIN ('
      #160#160#160#160#160#160#160#160#160#160#160' Remedial_Category'
      #160#160#160#160#160#160#160#160#160#160#160' RIGHT JOIN ('
      #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' ('
      #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' ('
      #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' Operator'
      
        #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' RIGHT JOIN Remedial ON Operator.Operator' +
        ' = Remedial.Operator'
      #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' )'
      
        #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' LEFT JOIN Sales_Order ON Remedial.Sales_Orde' +
        'r = Sales_Order.Sales_Order'
      #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' )'
      
        #160#160#160#160#160#160#160#160#160#160#160#160#160#160#160' LEFT JOIN Job_Remedial ON Remedial.ID = Job_Reme' +
        'dial.Remedial'
      
        #160#160#160#160#160#160#160#160#160#160#160' ) ON Remedial_Category.Remedial_Category = Remedial.' +
        'Remedial_Category'
      
        #160#160#160#160#160#160#160' ) ON Remedial_Dept.Remedial_Dept = Remedial.Remedial_Dep' +
        't'
      #160#160#160' ) ON Remedial_Type.Remedial_Type = Remedial.Remedial_Type'
      'WHERE Remedial.ID = :ID'
      '')
    Left = 51
    Top = 38
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryRAddSlab: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'insert into Remedial_Slab ('
      'Remedial_ID,'
      'Slab_Number,'
      'Worktop,'
      'Depth,'
      'Length,'
      'Thickness,'
      'Unit_Cost,'
      'Price_unit,'
      'Supplier,'
      'Waste_Percentage,'
      'Waste_Value,'
      'Waste_Cost_Multiplier,'
      'Quantity,'
      'Markup_Percentage,'
      'Unit_Price,'
      'Slab_Size,'
      'Adhesive_Product_Code,'
      'Adhesive_Quantity,'
      'Adhesive_Unit_Cost,'
      'Adhesive_Cost_Pack_Quantity'
      ')'
      'values'
      '('
      ':Remedial_ID,'
      ':Slab_Number,'
      ':Worktop,'
      ':Depth,'
      ':Length,'
      ':Thickness,'
      ':Unit_Cost,'
      ':Price_unit,'
      ':Supplier,'
      ':Waste_Percentage,'
      ':Waste_Value,'
      ':Waste_Cost_Multiplier,'
      ':Quantity,'
      ':Markup_Percentage,'
      ':Unit_Price,'
      ':Slab_Size,'
      ':Adhesive_Product_Code,'
      ':Adhesive_Quantity,'
      ':Adhesive_Unit_Cost,'
      ':Adhesive_Cost_Pack_Quantity'
      ')'
      '')
    Left = 131
    Top = 38
    ParamData = <
      item
        Name = 'REMEDIAL_ID'
        ParamType = ptInput
      end
      item
        Name = 'SLAB_NUMBER'
        ParamType = ptInput
      end
      item
        Name = 'WORKTOP'
        ParamType = ptInput
      end
      item
        Name = 'DEPTH'
        ParamType = ptInput
      end
      item
        Name = 'LENGTH'
        ParamType = ptInput
      end
      item
        Name = 'THICKNESS'
        ParamType = ptInput
      end
      item
        Name = 'UNIT_COST'
        ParamType = ptInput
      end
      item
        Name = 'PRICE_UNIT'
        ParamType = ptInput
      end
      item
        Name = 'SUPPLIER'
        ParamType = ptInput
      end
      item
        Name = 'WASTE_PERCENTAGE'
        ParamType = ptInput
      end
      item
        Name = 'WASTE_VALUE'
        ParamType = ptInput
      end
      item
        Name = 'WASTE_COST_MULTIPLIER'
        ParamType = ptInput
      end
      item
        Name = 'QUANTITY'
        ParamType = ptInput
      end
      item
        Name = 'MARKUP_PERCENTAGE'
        ParamType = ptInput
      end
      item
        Name = 'UNIT_PRICE'
        ParamType = ptInput
      end
      item
        Name = 'SLAB_SIZE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ADHESIVE_PRODUCT_CODE'
        ParamType = ptInput
      end
      item
        Name = 'ADHESIVE_QUANTITY'
        ParamType = ptInput
      end
      item
        Name = 'ADHESIVE_UNIT_COST'
        ParamType = ptInput
      end
      item
        Name = 'ADHESIVE_COST_PACK_QUANTITY'
        ParamType = ptInput
      end>
  end
  object qryRAllSlabs: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'#160' Remedial_Slab.ID,'
      #160#160#160#160#160#160#160' Remedial_Slab.Remedial_ID,'
      #160#160#160#160#160#160#160' Remedial_Slab.Slab_Number,'
      #160#160#160#160#160#160#160' Remedial_Slab.Worktop,'
      #160#160#160#160#160#160#160' Worktop.Description as Worktop_Description,'
      #160#160#160#160#160#160#160' Worktop.Material_Type,'
      #160#160#160#160#160#160#160' Remedial_Slab.Thickness,'
      #160#160#160#160#160#160#160' Thickness.Thickness_mm as Thickness_Description,'
      #160#160#160#160#160#160#160' Remedial_Slab.Supplier,'
      #160#160#160#160#160#160#160' Supplier.Supplier_name,'
      #160#160#160#160#160#160#160' Remedial_Slab.Length,'
      #160#160#160#160#160#160#160' Remedial_Slab.Depth,'
      #160#160#160#160#160#160#160' Remedial_Slab.Quantity,'
      #160#160#160#160#160#160#160' Remedial_Slab.Unit_Cost,'
      #160#160#160#160#160#160#160' Remedial_Slab.Price_Unit,'
      #160#160#160#160#160#160#160' Remedial_Slab.Waste_Cost_Multiplier,'
      #160#160#160#160#160#160#160' Remedial_Slab.Waste_Percentage,'
      #160#160#160#160#160#160#160' Remedial_Slab.Waste_Value,'
      #160#160#160#160#160#160#160' Price_unit.Price_unit_description,'
      #160#160#160#160#160#160#160' Remedial_Slab.Markup_Percentage,'
      #160#160#160#160#160#160#160' Remedial_Slab.Unit_Price,'
      #160#160#160#160#160#160#160' Remedial_Slab.Slab_Size,'
      #160#160#160#160#160#160#160' Remedial_Slab.Adhesive_Product_Code,'
      #160#160#160#160#160#160#160' Remedial_Slab.Adhesive_Quantity,'
      #160#160#160#160#160#160#160' Remedial_Slab.Adhesive_Unit_Cost,'
      #160#160#160#160#160#160#160' Remedial_Slab.Adhesive_Cost_Pack_Quantity,'
      #160#160#160#160#160#160#160' Supplier_Product.Description as Adhesive_Description'
      'FROM Supplier_Product'
      #160#160#160#160#160' RIGHT JOIN (Worktop'
      #160#160#160#160#160' INNER JOIN (Thickness'
      #160#160#160#160#160' INNER JOIN (Supplier'
      #160#160#160#160#160' INNER JOIN (Remedial_Slab'
      #160#160#160#160#160' LEFT JOIN Price_unit'
      #160#160#160#160#160#160#160' ON Remedial_Slab.Price_Unit = Price_unit.Price_unit)'
      #160#160#160#160#160#160#160' ON Supplier.Supplier = Remedial_Slab.Supplier)'
      #160#160#160#160#160#160#160' ON Thickness.Thickness = Remedial_Slab.Thickness)'
      #160#160#160#160#160#160#160' ON Worktop.Worktop = Remedial_Slab.Worktop)'
      
        #160#160#160#160#160#160#160' ON (Supplier_Product.Supplier_Product_Code = Remedial_Sl' +
        'ab.Adhesive_Product_Code)'
      
        #160#160#160#160#160#160#160#160#160' AND (Supplier_Product.Supplier = Remedial_Slab.Supplie' +
        'r)'
      'WHERE Remedial_ID = :Remedial_ID'
      'ORDER BY Slab_Number')
    Left = 225
    Top = 41
    ParamData = <
      item
        Name = 'REMEDIAL_ID'
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'wt'
    Left = 489
    Top = 41
  end
end
