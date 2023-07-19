object frmWTLUProducts: TfrmWTLUProducts
  Left = 298
  Top = 121
  Width = 857
  Height = 543
  Caption = 'Products'
  Color = clBtnFace
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 759
    Height = 425
    Align = alClient
    DataSource = srcLkpProducts
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'Product_code'
        Title.Caption = 'Product Code'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product_Description'
        Title.Caption = 'Description'
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Product_Group_Description'
        Title.Caption = 'Product Group'
        Width = 175
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 493
    Width = 849
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
    Top = 425
    Width = 849
    Height = 68
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      849
      68)
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object edtSearch: TEdit
      Left = 56
      Top = 11
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 43
      Width = 169
      Height = 17
      Caption = 'Show inactive products'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn4: TBitBtn
      Left = 767
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 2
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 264
      Top = 9
      Width = 75
      Height = 25
      Caption = 'S&weep'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 759
    Top = 0
    Width = 90
    Height = 425
    Align = alRight
    TabOrder = 3
    DesignSize = (
      90
      425)
    object BitBtn1: TBitBtn
      Left = 7
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 7
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnSelect: TBitBtn
      Left = 7
      Top = 387
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Select'
      ModalResult = 1
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object btnDelete: TBitBtn
      Left = 7
      Top = 96
      Width = 75
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object btnExcel: TBitBtn
      Left = 7
      Top = 136
      Width = 75
      Height = 25
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object lkpProducts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Product.*,'
      ' (select top 1 Unit_price'
      '    from Prices'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on,'
      '    Vat.Vat_Rate,'
      '    Vat.Description as Vat_Description,'
      '    Product_Group.Product_Group_Description'
      'FROM (Vat'
      '      INNER JOIN Product'
      '          ON Vat.Vat = Product.Vat)'
      '      LEFT JOIN Product_Group'
      '          ON Product.Product_Group = Product_Group.Product_Group'
      
        'WHERE ((Product.inactive = '#39'N'#39') or (Product.inactive is NULL) or' +
        ' (Product.inactive = :inactive)) and'
      
        '((Product_Description like :Description) OR (Product_Code LIKE :' +
        'Description))'
      'ORDER BY Product.Product_Code')
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
    object lkpProductsProduct: TIntegerField
      FieldName = 'Product'
    end
    object lkpProductsProduct_Description: TStringField
      FieldName = 'Product_Description'
      Size = 50
    end
    object lkpProductsProduct_code: TStringField
      FieldName = 'Product_code'
    end
    object lkpProductsPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
    end
    object lkpProductsDefault_sales_nominal: TStringField
      FieldName = 'Default_sales_nominal'
      Size = 10
    end
    object lkpProductsDefault_purchase_nominal: TStringField
      FieldName = 'Default_purchase_nominal'
      Size = 10
    end
    object lkpProductsVat: TIntegerField
      FieldName = 'Vat'
    end
    object lkpProductsProduct_Group: TIntegerField
      FieldName = 'Product_Group'
    end
    object lkpProductsUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      DisplayFormat = '0.00'
    end
    object lkpProductsUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      DisplayFormat = '0.00'
    end
    object lkpProductsPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
    end
    object lkpProductsinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
    object lkpProductsVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object lkpProductsVat_Description: TStringField
      FieldName = 'Vat_Description'
      Size = 30
    end
    object lkpProductsProduct_Group_Description: TStringField
      FieldName = 'Product_Group_Description'
      Size = 50
    end
  end
  object srcLkpProducts: TDataSource
    DataSet = lkpProducts
    OnDataChange = SetButtons
    Left = 192
    Top = 128
  end
  object qryDelProduct: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from product'
      'where price_pointer = :price_pointer')
    Left = 264
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 72
  end
end
