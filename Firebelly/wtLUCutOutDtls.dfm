inherited frmWtLUCutOutDtls: TfrmWtLUCutOutDtls
  Caption = 'Cut out details'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgDetails: TDBGrid
    DataSource = srclkpCOutThickness
    Columns = <
      item
        Expanded = False
        FieldName = 'Description'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Sell Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_Unit_Description'
        Title.Caption = 'Price Unit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'In_Use'
        Title.Caption = 'Active'
        Width = 40
        Visible = True
      end>
  end
  object tblCOutThickness: TFDTable [25]
    BeforePost = tblCOutThicknessBeforePost
    OnNewRecord = tblCOutThicknessNewRecord
    ConnectionName = 'WT'
    IndexFieldNames = 'Cutout'
    TableName = 'Cutout_thickness'
    Left = 312
    Top = 256
  end
  object srcCOutThickness: TDataSource [26]
    DataSet = tblCOutThickness
    Left = 352
    Top = 256
  end
  object lkpCOutThickness: TFDQuery [27]
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Cutout_Thickness.*,'
      '  CutOut.Description,'
      ' (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = Cutout_Thickness.price_pointer ' +
        'and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = Cutout_Thickness.price_pointer ' +
        'and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = Cutout_thickness.price_pointer ' +
        'and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'from CutOut_Thickness, Cutout'
      'where CutOut_Thickness.Material_Type = :Material_Type AND'
      'Cutout_Thickness.Edge_Type = :Edge_Type AND'
      'Cutout_Thickness.Cutout = Cutout.Cutout'
      'Order By CutOut.Description')
    Left = 128
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end>
    object lkpCOutThicknessCutout: TIntegerField
      FieldName = 'Cutout'
    end
    object lkpCOutThicknessEdge_Type: TIntegerField
      FieldName = 'Edge_Type'
    end
    object lkpCOutThicknessMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object lkpCOutThicknessPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
    end
    object lkpCOutThicknessDescription: TStringField
      FieldName = 'Description'
      Size = 40
    end
    object lkpCOutThicknessUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      DisplayFormat = '0.00'
      currency = True
    end
    object lkpCOutThicknessUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      DisplayFormat = '0.00'
      currency = True
    end
    object lkpCOutThicknessPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
    end
  end
  object srclkpCOutThickness: TDataSource [28]
    DataSet = lkpCOutThickness
    OnDataChange = srclkpCOutThicknessDataChange
    Left = 216
    Top = 256
  end
  object qryDelCOutThick: TFDQuery [29]
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from cutout_thickness'
      'where price_pointer = :price_pointer')
    Left = 56
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
  object qryDelCOThick: TFDQuery [30]
    ConnectionName = 'wt'
    SQL.Strings = (
      'Delete from CutOut_thickness'
      'where price_pointer = :price_pointer')
    Left = 208
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
end
