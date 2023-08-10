inherited frmWtLUEdgeDtls: TfrmWtLUEdgeDtls
  Left = 96
  Top = 97
  Caption = 'Edge details'
  ClientHeight = 347
  ClientWidth = 571
  Position = poMainFormCenter
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 589
  ExplicitHeight = 394
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 224
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Edge type'
  end
  inherited dbgDetails: TDBGrid
    Width = 571
    Height = 198
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
  inherited stsbrDetails: TStatusBar
    Top = 328
    Width = 571
    ExplicitTop = 328
    ExplicitWidth = 571
  end
  inherited Panel1: TPanel
    Top = 263
    Width = 571
    ExplicitTop = 263
    ExplicitWidth = 571
    DesignSize = (
      571
      65)
    inherited BitBtn1: TBitBtn
      Left = 204
      Top = 312
      ExplicitLeft = 204
      ExplicitTop = 312
    end
    inherited btnEdit: TBitBtn
      Left = 292
      Top = 312
      ExplicitLeft = 292
      ExplicitTop = 312
    end
    inherited btnDelete: TBitBtn
      Left = 380
      Top = 312
      ExplicitLeft = 380
      ExplicitTop = 312
    end
    inherited BitBtn4: TBitBtn
      Left = 468
      Top = 312
      ExplicitLeft = 468
      ExplicitTop = 312
    end
    inherited btnThickness: TBitBtn
      Left = 249
      Top = 312
      Visible = False
      ExplicitLeft = 249
      ExplicitTop = 312
    end
    inherited btnExcel: TBitBtn
      Left = 594
      ExplicitLeft = 594
    end
  end
  inherited Panel2: TPanel
    Width = 571
    ExplicitWidth = 571
  end
  object dblkpEdgeType: TDBLookupComboBox [5]
    Left = 224
    Top = 32
    Width = 145
    Height = 21
    KeyField = 'Edge_Type'
    ListField = 'Edge_Type_Description'
    ListSource = srclkpEdgeType
    TabOrder = 4
    OnClick = dblkpEdgeTypeClick
  end
  object lkpEdgeType: TFDQuery
    ConnectionName = 'WT'
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
  object tblEdgethickness: TFDTable
    BeforePost = tblEdgethicknessBeforePost
    OnNewRecord = tblEdgethicknessNewRecord
    IndexFieldNames = 'Edge_profile;Edge_Type;Material_Type'
    ConnectionName = 'WT'
    TableName = 'Edge_thickness'
    Left = 208
    Top = 240
  end
  object srcEdgeThickness: TDataSource
    DataSet = tblEdgethickness
    Left = 296
    Top = 216
  end
  object lkpEdgeThickness: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'select Edge_Thickness.*,'
      'Edge_Profile.Description,'
      ' (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = Edge_Thickness.price_pointer an' +
        'd'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = Edge_Thickness.price_pointer an' +
        'd'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = Edge_thickness.price_pointer an' +
        'd'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= GetDate()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'from Edge_Thickness, Edge_Profile'
      'where Edge_Thickness.Material_Type = :Material_Type AND'
      'Edge_Thickness.Edge_Type = :Edge_Type AND'
      'Edge_Thickness.Edge_Profile = Edge_Profile.Edge_Profile'
      'Order By Edge_Profile.Description')
    Left = 40
    Top = 158
    ParamData = <
      item
        Name = 'Material_Type'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Edge_Type'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object lkpEdgeThicknessEdge_profile: TIntegerField
      FieldName = 'Edge_profile'
      Origin = 'Edge_profile'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object lkpEdgeThicknessEdge_Type: TIntegerField
      FieldName = 'Edge_Type'
      Origin = 'Edge_Type'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object lkpEdgeThicknessMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
      Origin = 'Material_Type'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object lkpEdgeThicknessPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
      Origin = 'Price_pointer'
      Required = True
    end
    object lkpEdgeThicknessDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 50
    end
    object lkpEdgeThicknessUnit_Price: TCurrencyField
      FieldName = 'Unit_Price'
      Origin = 'Unit_Price'
      ReadOnly = True
    end
    object lkpEdgeThicknessUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
      Origin = 'Unit_Cost'
      ReadOnly = True
    end
    object lkpEdgeThicknessPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      Origin = 'Price_Unit_Description'
      ReadOnly = True
    end
  end
  object srclkpEdgeThickness: TDataSource
    DataSet = lkpEdgeThickness
    OnDataChange = srclkpEdgeThicknessDataChange
    Left = 148
    Top = 158
  end
  object qryDelEdgeThick: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from edge_thickness'
      'where price_pointer = :price_pointer')
    Left = 504
    Top = 216
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
  object qryDelEdgThick: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Delete from Edge_thickness'
      'where price_pointer = :price_pointer')
    Left = 168
    Top = 16
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
end
