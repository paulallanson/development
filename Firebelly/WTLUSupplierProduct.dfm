object frmWTLUSupplierProduct: TfrmWTLUSupplierProduct
  Left = 371
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Supplier Products Lookup'
  ClientHeight = 453
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFunctions: TPanel
    Left = 528
    Top = 0
    Width = 98
    Height = 345
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btnAdd: TBitBtn
      Left = 15
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnChange: TBitBtn
      Left = 15
      Top = 40
      Width = 75
      Height = 25
      Caption = '&Change'
      Enabled = False
      TabOrder = 1
      OnClick = btnChangeClick
    end
    object btnDelete: TBitBtn
      Left = 15
      Top = 72
      Width = 75
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 528
    Height = 345
    Align = alClient
    DataSource = dtsDetails
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Supplier_Product_Code'
        Title.Caption = 'Product'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 270
        Visible = True
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 345
    Width = 626
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      626
      89)
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 74
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Product Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 8
      Width = 193
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Show inactive products'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object edtSearch: TEdit
      Left = 8
      Top = 56
      Width = 257
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      OnChange = edtSearchChange
    end
    object btnSelect: TBitBtn
      Left = 543
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      ModalResult = 1
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object BitBtn2: TBitBtn
      Left = 543
      Top = 54
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Canc&el'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object stbrDetails: TStatusBar
    Left = 0
    Top = 434
    Width = 626
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object qryDetails: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Product,'
      '    Supplier,'
      '    Supplier_Product_Code,'
      '    Cost_Pack_Quantity,'
      '    Description,'
      '    inactive,'
      '    Supplier_Product.Price_Pointer,'
      '    (select top 1 effective_date'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Effective_Date,'
      '    (select top 1 Date_Changed'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Date_Changed,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion'
      'FROM Supplier_Product'
      'WHERE Supplier = :Supplier AND'
      
        '((Supplier_Product_Code LIKE :Supplier_Product_Code) OR (Descrip' +
        'tion LIKE :Supplier_Product_Code)) AND'
      '((Inactive = :Inactive) or (inactive = '#39'N'#39'))'
      'ORDER BY Supplier_Product_Code')
    Left = 64
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Product_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Product_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end>
  end
  object dtsDetails: TDataSource
    DataSet = qryDetails
    Left = 120
    Top = 64
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 96
    Top = 128
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 216
    Top = 64
  end
end
