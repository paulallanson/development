object STPrtAllocStStockFrm: TSTPrtAllocStStockFrm
  Left = 60
  Top = 94
  Caption = 'Allocate specific stock'
  ClientHeight = 337
  ClientWidth = 652
  Color = clBtnFace
  Constraints.MinHeight = 376
  Constraints.MinWidth = 668
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lblProduct: TLabel
      Left = 16
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Product:'
    end
    object lblPartStore: TLabel
      Left = 16
      Top = 32
      Width = 62
      Height = 13
      Caption = 'Warehouse:'
    end
    object Label1: TLabel
      Left = 376
      Top = 8
      Width = 90
      Height = 13
      Caption = 'Quantity Ordered'
    end
    object lblQtyOrdered: TLabel
      Left = 472
      Top = 8
      Width = 73
      Height = 13
      Caption = 'lblQtyOrdered'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 296
    Width = 652
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      652
      41)
    object BitBtn2: TBitBtn
      Left = 560
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 57
    Width = 652
    Height = 239
    Align = alClient
    DataSource = srcStoreStock
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Part_Bin'
        Title.Caption = 'Bin'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Store_Quantity'
        Title.Caption = 'Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity_Allocated'
        Title.Caption = 'Allocated'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Free_Stock'
        Title.Caption = 'Free Stock'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Received'
        Title.Caption = 'Date Received'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Pack_Quantity'
        Title.Caption = 'Pack Size'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Store_Stock_Description'
        Title.Caption = 'Reference'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'invoice_upfront'
        Title.Caption = 'Invoiced'
        Visible = True
      end>
  end
  object qryStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *, (Store_Quantity-Quantity_Allocated) as Free_Stock'
      'from Store_Stock, Part_Store_Bin'
      'where Part = :Part and Store_Stock.Part_Store = :Part_Store and'
      '(Store_Stock.Part_Store = Part_Store_Bin.Part_Store and'
      'Store_Stock.Part_Bin = Part_Store_Bin.Part_Bin'
      ') and'
      '((Store_Quantity-Quantity_Allocated) > 0) and'
      'Part_Store_Bin.Bin_Can_Pick = '#39'Y'#39
      'order by Store_Stock.Date_Received')
    Left = 152
    Top = 72
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end>
    object qryStoreStockStore_Stock: TIntegerField
      FieldName = 'Store_Stock'
    end
    object qryStoreStockQuantity_Allocated: TIntegerField
      FieldName = 'Quantity_Allocated'
    end
    object qryStoreStockStore_Quantity: TIntegerField
      FieldName = 'Store_Quantity'
    end
    object qryStoreStockStore_Cost: TCurrencyField
      FieldName = 'Store_Cost'
    end
    object qryStoreStockDate_Received: TDateTimeField
      FieldName = 'Date_Received'
    end
    object qryStoreStockPart: TWideStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object qryStoreStockPart_Store_Lot: TWideStringField
      FieldName = 'Part_Store_Lot'
      FixedChar = True
      Size = 40
    end
    object qryStoreStockPart_Store: TIntegerField
      FieldName = 'Part_Store'
    end
    object qryStoreStockPart_Bin: TWideStringField
      FieldName = 'Part_Bin'
      FixedChar = True
    end
    object qryStoreStockStock_Pack_Quantity: TIntegerField
      FieldName = 'Stock_Pack_Quantity'
    end
    object qryStoreStockStore_Stock_Description: TWideStringField
      FieldName = 'Store_Stock_Description'
      FixedChar = True
      Size = 60
    end
    object qryStoreStockinvoice_upfront: TWideStringField
      FieldName = 'invoice_upfront'
      FixedChar = True
      Size = 2
    end
    object qryStoreStockFree_Stock: TIntegerField
      FieldName = 'Free_Stock'
    end
  end
  object srcStoreStock: TDataSource
    DataSet = qryStoreStock
    Left = 232
    Top = 72
  end
  object UpdSOHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Sales_Order.Sales_Order_Head_Status = :status'
      'where'
      'Sales_Order.Sales_Order = :Sales_Order'
      ' '
      ' '
      ' ')
    Left = 478
    Top = 110
    ParamData = <
      item
        Name = 'status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
end
