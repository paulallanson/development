object frmWtLUWTGroupPrices: TfrmWtLUWTGroupPrices
  Left = 191
  Top = 113
  BorderStyle = bsDialog
  Caption = 'Worktop Group Prices'
  ClientHeight = 333
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 57
    Width = 608
    Height = 206
    Align = alClient
    DataSource = srclkpWTGPrices
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Material_Description'
        Title.Caption = 'Material'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Worktop_Group_Description'
        Title.Caption = 'Worktop Group'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Thickness_mm'
        Title.Caption = 'Thickness'
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
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 314
    Width = 608
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 263
    Width = 608
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 8
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 90
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 172
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 528
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 3
      NumGlyphs = 2
    end
    object btnExcel: TBitBtn
      Left = 446
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 608
    Height = 57
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Material Type'
    end
    object SpeedButton2: TSpeedButton
      Left = 157
      Top = 22
      Width = 25
      Height = 25
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
    object dblkpMaterialType: TDBLookupComboBox
      Left = 8
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = srclkpMatType
      TabOrder = 0
      OnClick = dblkpMaterialTypeClick
    end
    object Button1: TButton
      Left = 192
      Top = 22
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object lkpMatType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive is null) or (inactive = '#39#39')' +
        ')'
      'order by Description')
    Left = 312
    Top = 16
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 352
    Top = 16
  end
  object qryDelWTGPrices: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Delete from worktop_group_prices'
      'where price_pointer = :price_pointer')
    Left = 304
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
  object srclkpWTGPrices: TDataSource
    DataSet = lkpWTGPrices
    OnDataChange = srclkpWTGPricesDataChange
    Left = 208
    Top = 128
  end
  object lkpWTGPrices: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Worktop_Group_Prices.*,'
      '    Thickness.Thickness_mm,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    Material_Type.Description as Material_Description,'
      '    (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = Worktop_Group_Prices.price_poin' +
        'ter and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = Worktop_Group_Prices.price_poin' +
        'ter and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = Worktop_Group_Prices.price_poin' +
        'ter and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'FROM (Thickness'
      '      INNER JOIN (Worktop_Group'
      '      INNER JOIN Worktop_Group_Prices'
      
        '        ON Worktop_Group.Worktop_Group = Worktop_Group_Prices.Wo' +
        'rktop_Group)'
      '        ON Thickness.Thickness = Worktop_Group_Prices.Thickness)'
      '      INNER JOIN Material_Type'
      
        '        ON Worktop_Group_Prices.Material_Type = Material_Type.Ma' +
        'terial_Type'
      
        'WHERE ((Worktop_Group_Prices.Material_Type = :Material_Type) OR ' +
        '(:Material_Type = 0))'
      
        'ORDER BY Material_Type.Description, Worktop_Group_Description, T' +
        'hickness_mm'
      '')
    Left = 112
    Top = 128
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
      end>
    object lkpWTGPricesWorktop_group: TIntegerField
      FieldName = 'Worktop_group'
    end
    object lkpWTGPricesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object lkpWTGPricesThickness: TIntegerField
      FieldName = 'Thickness'
    end
    object lkpWTGPricesPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
    end
    object lkpWTGPricesThickness_mm: TStringField
      FieldName = 'Thickness_mm'
      Size = 10
    end
    object lkpWTGPricesWorktop_Group_Description: TStringField
      FieldName = 'Worktop_Group_Description'
      Size = 30
    end
    object lkpWTGPricesUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      currency = True
    end
    object lkpWTGPricesUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      currency = True
    end
    object lkpWTGPricesPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
    end
    object lkpWTGPricesMaterial_Description: TStringField
      FieldName = 'Material_Description'
      Size = 50
    end
  end
end
