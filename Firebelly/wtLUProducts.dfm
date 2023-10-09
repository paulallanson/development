object frmWTLUProducts: TfrmWTLUProducts
  Left = 298
  Top = 121
  Caption = 'Products'
  ClientHeight = 496
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 749
    Height = 409
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
    Top = 477
    Width = 839
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
    Left = 0
    Top = 409
    Width = 839
    Height = 68
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      839
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
      Left = 750
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 2
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
    Left = 749
    Top = 0
    Width = 90
    Height = 409
    Align = alRight
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      90
      409)
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
      Top = 379
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
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'select Product.*,'
      ' (select top 1 Unit_price'
      '    from Prices'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      '    where Prices.Price_pointer = Product.price_pointer and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= GetDate()'
      
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
    Left = 64
    Top = 136
    ParamData = <
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
    object lkpProductsProduct: TIntegerField
      FieldName = 'Product'
      Origin = 'Product'
      Required = True
    end
    object lkpProductsProduct_Description: TWideStringField
      FieldName = 'Product_Description'
      Origin = 'Product_Description'
      Required = True
      Size = 50
    end
    object lkpProductsProduct_code: TWideStringField
      FieldName = 'Product_code'
      Origin = 'Product_code'
      Required = True
    end
    object lkpProductsPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
      Origin = 'Price_pointer'
      Required = True
    end
    object lkpProductsDefault_sales_nominal: TWideStringField
      FieldName = 'Default_sales_nominal'
      Origin = 'Default_sales_nominal'
      Size = 10
    end
    object lkpProductsDefault_purchase_nominal: TWideStringField
      FieldName = 'Default_purchase_nominal'
      Origin = 'Default_purchase_nominal'
      Size = 10
    end
    object lkpProductsVat: TIntegerField
      FieldName = 'Vat'
      Origin = 'Vat'
      Required = True
    end
    object lkpProductsProduct_Group: TIntegerField
      FieldName = 'Product_Group'
      Origin = 'Product_Group'
    end
    object lkpProductsinactive: TWideStringField
      FieldName = 'inactive'
      Origin = 'inactive'
      Size = 1
    end
    object lkpProductsUnit_Price: TCurrencyField
      FieldName = 'Unit_Price'
      Origin = 'Unit_Price'
      ReadOnly = True
    end
    object lkpProductsUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
      Origin = 'Unit_Cost'
      ReadOnly = True
    end
    object lkpProductsPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      Origin = 'Price_Unit_Description'
      ReadOnly = True
    end
    object lkpProductsVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      Origin = 'Vat_Rate'
      Required = True
    end
    object lkpProductsVat_Description: TWideStringField
      FieldName = 'Vat_Description'
      Origin = 'Vat_Description'
      Required = True
      Size = 40
    end
    object lkpProductsProduct_Group_Description: TWideStringField
      FieldName = 'Product_Group_Description'
      Origin = 'Product_Group_Description'
      Size = 50
    end
  end
  object srcLkpProducts: TDataSource
    DataSet = lkpProducts
    OnDataChange = SetButtons
    Left = 176
    Top = 136
  end
  object qryDelProduct: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from product'
      'where price_pointer = :price_pointer')
    Left = 296
    Top = 136
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 680
    Top = 48
  end
end
