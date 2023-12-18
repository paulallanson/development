inherited frmWtLUCutOutDtls: TfrmWtLUCutOutDtls
  Caption = 'Cut out details'
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
  inherited Panel1: TPanel
    inherited BitBtn1: TBitBtn
      Left = 186
      ExplicitLeft = 186
    end
    inherited btnEdit: TBitBtn
      Left = 274
      ExplicitLeft = 274
    end
    inherited btnDelete: TBitBtn
      Left = 362
      ExplicitLeft = 362
    end
    inherited BitBtn4: TBitBtn
      Left = 450
      ExplicitLeft = 450
    end
    inherited btnThickness: TBitBtn
      Left = 231
      ExplicitLeft = 231
    end
    inherited btnExcel: TBitBtn
      Left = 576
      ExplicitLeft = 576
    end
  end
  inherited lkpEdgeThickness: TFDQuery
    Top = 142
  end
  inherited srclkpEdgeThickness: TDataSource
    Top = 142
  end
  object tblCOutThickness: TFDTable
    BeforePost = tblCOutThicknessBeforePost
    OnNewRecord = tblCOutThicknessNewRecord
    IndexFieldNames = 'Cutout'
    ConnectionName = 'WT'
    TableName = 'Cutout_thickness'
    Left = 312
    Top = 256
  end
  object srcCOutThickness: TDataSource
    DataSet = tblCOutThickness
    Left = 352
    Top = 256
  end
  object lkpCOutThickness: TFDQuery
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
        Name = 'Material_Type'
        DataType = ftInteger
      end
      item
        Name = 'Edge_Type'
        DataType = ftInteger
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
  object srclkpCOutThickness: TDataSource
    DataSet = lkpCOutThickness
    OnDataChange = srclkpCOutThicknessDataChange
    Left = 216
    Top = 256
  end
  object qryDelCOutThick: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from cutout_thickness'
      'where price_pointer = :price_pointer')
    Left = 56
    Top = 256
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
  object qryDelCOThick: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Delete from CutOut_thickness'
      'where price_pointer = :price_pointer')
    Left = 208
    Top = 64
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
end
