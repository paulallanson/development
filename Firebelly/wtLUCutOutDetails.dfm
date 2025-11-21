object frmWTLUCutOutDetails: TfrmWTLUCutOutDetails
  Left = 192
  Top = 114
  Caption = 'Maintain Cut Out Details'
  ClientHeight = 382
  ClientWidth = 739
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 751
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClick = FormClick
  OnCreate = FormCreate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 73
    Width = 739
    Height = 221
    Align = alClient
    DataSource = srclkpCOutThickness
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
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
        Width = 270
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
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 294
    Width = 739
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 285
    ExplicitWidth = 733
    DesignSize = (
      739
      69)
    object Label4: TLabel
      Left = 16
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 44
      Width = 169
      Height = 17
      Caption = 'Show inactive cut outs'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 64
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 1
      OnChange = edtNameChange
    end
    object BitBtn1: TBitBtn
      Left = 303
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Add'
      TabOrder = 2
      OnClick = BitBtn1Click
      ExplicitLeft = 297
    end
    object btnEdit: TBitBtn
      Left = 391
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 3
      OnClick = btnEditClick
      ExplicitLeft = 385
    end
    object btnDelete: TBitBtn
      Left = 479
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 4
      OnClick = btnDeleteClick
      ExplicitLeft = 473
    end
    object BitBtn4: TBitBtn
      Left = 655
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 5
      ExplicitLeft = 649
    end
    object btnExcel: TBitBtn
      Left = 567
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 6
      OnClick = btnExcelClick
      ExplicitLeft = 561
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 363
    Width = 739
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitTop = 354
    ExplicitWidth = 733
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 733
    DesignSize = (
      739
      73)
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 67
      Height = 13
      Caption = 'Material Type'
    end
    object Label2: TLabel
      Left = 216
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Edge type'
    end
    object Label3: TLabel
      Left = 495
      Top = 16
      Width = 138
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Copy Cut Out Details from '
      ExplicitLeft = 501
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
      Left = 497
      Top = 35
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = srclkpMatTypeCopy
      TabOrder = 2
      OnClick = dblkpCopyMaterialClick
    end
    object btnGo: TButton
      Left = 656
      Top = 30
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Go'
      Enabled = False
      TabOrder = 3
      OnClick = btnGoClick
      ExplicitLeft = 650
    end
  end
  object srclkpCOutThickness: TDataSource
    DataSet = lkpCOutThickness
    OnDataChange = srclkpCOutThicknessDataChange
    Left = 216
    Top = 256
  end
  object lkpCOutThickness: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'SELECT'
      '    Cutout_thickness.Cutout,'
      '    Cutout_thickness.Edge_Type,'
      '    Cutout_thickness.Material_Type,'
      '    Cutout_thickness.Price_pointer,'
      '    CutOut.Description,'
      '    CutOut.inactive,'
      '    Edge_Type.Edge_Type_Description,'
      '    Material_Type.Description as Material_Description,'
      ' (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = Cutout_Thickness.price_pointer ' +
        'and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = Cutout_Thickness.price_pointer ' +
        'and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = Cutout_thickness.price_pointer ' +
        'and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= GetDate()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'FROM Edge_Type'
      '      INNER JOIN ((CutOut'
      '      INNER JOIN Cutout_thickness'
      '        ON CutOut.CutOut = Cutout_thickness.Cutout)'
      '      LEFT JOIN Material_Type'
      
        '        ON Cutout_thickness.Material_Type = Material_Type.Materi' +
        'al_Type)'
      '        ON Edge_Type.Edge_Type = Cutout_thickness.Edge_Type'
      'WHERE'
      
        '  ((CutOut_Thickness.Material_Type = :Material_Type) OR (:Materi' +
        'al_Type = 0)) AND'
      
        '  ((Cutout_Thickness.Edge_Type = :Edge_Type) OR (:Edge_Type = 0)' +
        ') AND'
      
        '  ((CutOut.inactive = '#39'N'#39') or (CutOut.inactive is null) or (CutO' +
        'ut.inactive = :inactive)) AND'
      '  (CutOut.Description LIKE :Description)'
      
        'ORDER BY Material_Type.Description, Edge_Type.Edge_Type_Descript' +
        'ion, CutOut.Description')
    Left = 128
    Top = 256
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
      end
      item
        Name = 'inactive'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object lkpCOutThicknessCutout: TIntegerField
      FieldName = 'Cutout'
      Origin = 'Cutout'
      Required = True
    end
    object lkpCOutThicknessEdge_Type: TIntegerField
      FieldName = 'Edge_Type'
      Origin = 'Edge_Type'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object lkpCOutThicknessMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
      Origin = 'Material_Type'
      Required = True
    end
    object lkpCOutThicknessPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
      Origin = 'Price_pointer'
      Required = True
    end
    object lkpCOutThicknessDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 40
    end
    object lkpCOutThicknessinactive: TWideStringField
      FieldName = 'inactive'
      Origin = 'inactive'
      Size = 1
    end
    object lkpCOutThicknessEdge_Type_Description: TWideStringField
      FieldName = 'Edge_Type_Description'
      Origin = 'Edge_Type_Description'
      Size = 50
    end
    object lkpCOutThicknessMaterial_Description: TWideStringField
      FieldName = 'Material_Description'
      Origin = 'Material_Description'
      Size = 100
    end
    object lkpCOutThicknessUnit_Price: TCurrencyField
      FieldName = 'Unit_Price'
      Origin = 'Unit_Price'
      ReadOnly = True
    end
    object lkpCOutThicknessUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
      Origin = 'Unit_Cost'
      ReadOnly = True
    end
    object lkpCOutThicknessPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      Origin = 'Price_Unit_Description'
      ReadOnly = True
    end
  end
  object lkpMatType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null)' +
        ')')
    Left = 68
    Top = 218
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 174
    Top = 218
  end
  object qryDelCOutThick: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from cutout_thickness'
      'where price_pointer = :price_pointer')
    Left = 56
    Top = 120
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
  object qryGetCutOutThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'
      '  CutOut_thickness.Material_Type,'
      '  CutOut_thickness.Edge_Type,'
      '  CutOut_thickness.CutOut,'
      '  CutOut_thickness.Price_pointer,'
      '  (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = CutOut_Thickness.price_pointer ' +
        'and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = CutOut_Thickness.price_pointer ' +
        'and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit'
      '    from Prices'
      
        '    where Prices.Price_pointer = CutOut_Thickness.price_pointer ' +
        'and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Price_Unit'
      'FROM CutOut_thickness'
      'WHERE   CutOut_thickness.Material_Type = :Material_Type AND'
      '        CutOut_thickness.Edge_Type = :Edge_Type'
      'ORDER BY  CutOut_thickness.CutOut'
      '')
    Left = 544
    Top = 112
    ParamData = <
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Edge_Type'
      end>
  end
  object qryAddCutOutThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'Insert into CutOut_Thickness (CutOut, Edge_Type, Material_Type, ' +
        'Price_Pointer)'
      'values (:CutOut, :Edge_Type, :Material_Type, :Price_Pointer)')
    Left = 552
    Top = 176
    ParamData = <
      item
        Name = 'CutOut'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
  object qryDeleteCutOutThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM CutOut_Thickness'
      'WHERE Material_Type = :Material_type AND'
      '      Edge_Type = :Edge_Type')
    Left = 224
    Top = 96
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end>
  end
  object tmrRefresh: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 504
    Top = 256
  end
  object lkpEdgeType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Edge_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is NULL)' +
        ')'
      'order by Edge_Type_Description')
    Left = 384
    Top = 32
  end
  object srclkpEdgeType: TDataSource
    DataSet = lkpEdgeType
    Left = 448
    Top = 32
  end
  object srclkpMatTypeCopy: TDataSource
    DataSet = lkpMatTypeCopy
    Left = 390
    Top = 218
  end
  object lkpMatTypeCopy: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null)' +
        ')')
    Left = 300
    Top = 218
  end
end
