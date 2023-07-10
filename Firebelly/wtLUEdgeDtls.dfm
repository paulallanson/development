inherited frmWtLUEdgeDtls: TfrmWtLUEdgeDtls
  Left = 96
  Top = 97
  Caption = 'Edge details'
  ClientHeight = 347
  ClientWidth = 571
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [1]
    Left = 224
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Edge type'
  end
  inherited dbgDetails: TDBGrid
    Width = 553
    DataSource = srclkpEdgeThickness
    Columns = <
      item
        Expanded = False
        FieldName = 'Description'
        Width = 222
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
        Width = 99
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
  inherited BitBtn1: TBitBtn
    Left = 216
    Top = 312
  end
  inherited btnEdit: TBitBtn
    Left = 304
    Top = 312
  end
  inherited btnDelete: TBitBtn
    Left = 392
    Top = 312
  end
  inherited BitBtn4: TBitBtn
    Left = 480
    Top = 312
  end
  inherited btnThickness: TBitBtn
    Top = 312
    Visible = False
  end
  object dblkpEdgeType: TDBLookupComboBox [9]
    Left = 224
    Top = 32
    Width = 145
    Height = 21
    KeyField = 'Edge_Type'
    ListField = 'Edge_Type_Description'
    ListSource = srclkpEdgeType
    TabOrder = 7
    OnClick = dblkpEdgeTypeClick
  end
  object lkpEdgeType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Edge_Type'
      'order by Edge_Type_Description')
    Left = 384
    Top = 32
  end
  object srclkpEdgeType: TDataSource
    DataSet = lkpEdgeType
    Left = 448
    Top = 32
  end
  object tblEdgethickness: TTable
    BeforePost = tblEdgethicknessBeforePost
    OnNewRecord = tblEdgethicknessNewRecord
    DatabaseName = 'WT'
    IndexFieldNames = 'Edge_profile;Edge_Type;Material_Type'
    TableName = 'Edge_thickness'
    Left = 208
    Top = 240
  end
  object srcEdgeThickness: TDataSource
    DataSet = tblEdgethickness
    Left = 296
    Top = 216
  end
  object lkpEdgeThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select Edge_Thickness.*,'
      'Edge_Profile.Description,'
      ' (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = Edge_Thickness.price_pointer an' +
        'd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = Edge_Thickness.price_pointer an' +
        'd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = Edge_thickness.price_pointer an' +
        'd'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'from Edge_Thickness, Edge_Profile'
      'where Edge_Thickness.Material_Type = :Material_Type AND'
      'Edge_Thickness.Edge_Type = :Edge_Type AND'
      'Edge_Thickness.Edge_Profile = Edge_Profile.Edge_Profile'
      'Order By Edge_Profile.Description')
    Left = 64
    Top = 216
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
    object lkpEdgeThicknessEdge_profile: TIntegerField
      FieldName = 'Edge_profile'
    end
    object lkpEdgeThicknessEdge_Type: TIntegerField
      FieldName = 'Edge_Type'
    end
    object lkpEdgeThicknessMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object lkpEdgeThicknessPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
    end
    object lkpEdgeThicknessDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object lkpEdgeThicknessUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      DisplayFormat = '0.00'
      currency = True
    end
    object lkpEdgeThicknessUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      DisplayFormat = '0.00'
      currency = True
    end
    object lkpEdgeThicknessPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
    end
  end
  object srclkpEdgeThickness: TDataSource
    DataSet = lkpEdgeThickness
    OnDataChange = srclkpEdgeThicknessDataChange
    Left = 112
    Top = 216
  end
  object qryDelEdgeThick: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'delete from edge_thickness'
      'where price_pointer = :price_pointer')
    Left = 504
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
  object qryDelEdgThick: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Delete from Edge_thickness'
      'where price_pointer = :price_pointer')
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
end
