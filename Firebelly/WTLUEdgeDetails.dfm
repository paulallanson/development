object frmWTLUEdgeDetails: TfrmWTLUEdgeDetails
  Left = 269
  Top = 166
  Width = 759
  Height = 420
  Caption = 'Maintain Edge Details'
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 751
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 65
    Width = 751
    Height = 248
    Align = alClient
    DataSource = srclkpEdgeThickness
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Material_Description'
        Title.Caption = 'Material Type'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Edge_Type_Description'
        Title.Caption = 'Edge Type'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 289
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost Price'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Sell Price'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_Unit_Description'
        Title.Caption = 'Price Unit'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Title.Caption = 'Inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 370
    Width = 751
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object pnlFoot: TPanel
    ParentBackground = False
    Left = 0
    Top = 313
    Width = 751
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    Constraints.MinHeight = 57
    Constraints.MinWidth = 751
    TabOrder = 2
    DesignSize = (
      751
      57)
    object Label4: TLabel
      Left = 16
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object BitBtn4: TBitBtn
      Left = 665
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 0
      NumGlyphs = 2
    end
    object btnDelete: TBitBtn
      Left = 489
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btnEdit: TBitBtn
      Left = 401
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object BitBtn1: TBitBtn
      Left = 313
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Add'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 39
      Width = 169
      Height = 17
      Caption = 'Show inactive edges'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 64
      Top = 11
      Width = 217
      Height = 21
      TabOrder = 5
      OnChange = edtNameChange
    end
    object btnExcel: TBitBtn
      Left = 577
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 6
      OnClick = btnExcelClick
    end
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 751
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      751
      65)
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Material Type'
    end
    object Label2: TLabel
      Left = 216
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Edge type'
    end
    object Label3: TLabel
      Left = 490
      Top = 16
      Width = 113
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Copy Edge Details from '
    end
    object SpeedButton2: TSpeedButton
      Left = 165
      Top = 31
      Width = 23
      Height = 22
      Hint = 'Clear Material Type'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 365
      Top = 31
      Width = 23
      Height = 22
      Hint = 'Clear Edge Type'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object dblkpMaterialType: TDBLookupComboBox
      Left = 16
      Top = 32
      Width = 145
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = srclkpMatType
      TabOrder = 0
      OnClick = dblkpMaterialTypeClick
    end
    object dblkpEdgeType: TDBLookupComboBox
      Left = 216
      Top = 32
      Width = 145
      Height = 21
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = srclkpEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpCopyMaterial: TDBLookupComboBox
      Left = 490
      Top = 32
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = srclkpMatType
      TabOrder = 2
      OnClick = dblkpCopyMaterialClick
    end
    object btnGo: TButton
      Left = 666
      Top = 30
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Go'
      Enabled = False
      TabOrder = 3
      OnClick = btnGoClick
    end
  end
  object qryDelEdgeThick: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'delete from edge_thickness'
      'where price_pointer = :price_pointer')
    Left = 552
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
  object lkpEdgeThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT'
      '  Edge_thickness.Edge_profile,'
      '  Edge_thickness.Edge_Type,'
      '  Edge_thickness.Material_Type,'
      '  Edge_thickness.Price_pointer,'
      '  Edge_profile.Description,'
      '  Edge_profile.inactive,'
      '  Edge_Type.Edge_Type_Description,'
      '  Material_Type.Description as Material_Description,'
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
      'FROM (Edge_Type'
      '        INNER JOIN (Edge_profile'
      '        INNER JOIN Edge_thickness'
      
        '          ON Edge_profile.Edge_profile = Edge_thickness.Edge_pro' +
        'file)'
      '          ON Edge_Type.Edge_Type = Edge_thickness.Edge_Type)'
      '        LEFT JOIN Material_Type'
      
        '          ON Edge_thickness.Material_Type = Material_Type.Materi' +
        'al_Type'
      
        'WHERE ((Edge_Thickness.Material_Type = :Material_Type) OR (:Mate' +
        'rial_Type = 0)) AND'
      
        '      ((Edge_Thickness.Edge_Type = :Edge_Type) OR (:Edge_Type = ' +
        '0)) AND'
      
        '      ((Edge_Profile.inactive = '#39'N'#39') or (Edge_Profile.inactive i' +
        's null) or (Edge_Profile.inactive = :inactive)) AND'
      '      Edge_Profile.Description LIKE :Description'
      
        'ORDER BY Material_Type.Description, Edge_Type_Description, Edge_' +
        'Profile.Description')
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
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
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
    object lkpEdgeThicknessinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
    object lkpEdgeThicknessMaterial_Description: TStringField
      FieldName = 'Material_Description'
      Size = 50
    end
    object lkpEdgeThicknessEdge_Type_Description: TStringField
      FieldName = 'Edge_Type_Description'
      Size = 50
    end
  end
  object srclkpEdgeThickness: TDataSource
    DataSet = lkpEdgeThickness
    OnDataChange = srclkpEdgeThicknessDataChange
    Left = 112
    Top = 216
  end
  object lkpMatType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null)' +
        ')')
    Left = 208
    Top = 168
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 280
    Top = 168
  end
  object lkpEdgeType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Edge_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is NULL)' +
        ')'
      'order by Edge_Type_Description')
    Left = 376
    Top = 112
  end
  object srclkpEdgeType: TDataSource
    DataSet = lkpEdgeType
    Left = 440
    Top = 112
  end
  object qryGetEdgeThickness: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'SELECT'
      '  Edge_thickness.Material_Type,'
      '  Edge_thickness.Edge_Type,'
      '  Edge_thickness.Edge_profile,'
      '  Edge_thickness.Price_pointer,'
      '  (select top 1 Unit_price'
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
      '    (select top 1 Price_Unit'
      '    from Prices'
      
        '    where Prices.Price_pointer = Edge_Thickness.price_pointer an' +
        'd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Price_Unit'
      'FROM Edge_thickness'
      'WHERE   Edge_thickness.Material_Type = :Material_Type AND'
      '        Edge_thickness.Edge_Type = :Edge_Type'
      'ORDER BY  Edge_thickness.Edge_profile'
      '')
    Left = 544
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end>
  end
  object qryAddEdgeThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      
        'Insert into Edge_Thickness (Edge_Profile, Edge_Type, Material_Ty' +
        'pe, Price_Pointer)'
      
        'values (:Edge_Profile, :Edge_Type, :Material_Type, :Price_Pointe' +
        'r)')
    Left = 552
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Edge_Profile'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Pointer'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteEdgeThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'DELETE FROM Edge_Thickness'
      'WHERE Material_Type = :Material_type AND'
      '      Edge_Type = :Edge_Type')
    Left = 64
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end>
  end
  object tmrRefresh: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 384
    Top = 232
  end
end
