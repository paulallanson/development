object STPrtAllocSalesFrm: TSTPrtAllocSalesFrm
  Left = 15
  Top = 33
  Caption = 'Allocate Stock To Store Orders'
  ClientHeight = 485
  ClientWidth = 733
  Color = clBtnFace
  Constraints.MinHeight = 524
  Constraints.MinWidth = 713
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object DetsDBGrid: TDBGrid
    Left = 0
    Top = 41
    Width = 733
    Height = 384
    Align = alClient
    DataSource = DetsDataSource
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    PopupMenu = pmnuAllocate
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnCellClick = DetsDBGridCellClick
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_Order_Line_No'
        Title.Caption = 'Line'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part'
        Title.Caption = 'Product'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Description'
        Title.Caption = 'Description'
        Width = 225
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Quantity_Requested'
        Title.Caption = 'Qty Ordered'
        Width = 75
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Qty_Alloc'
        Title.Caption = 'Qty Allocated'
        Width = 77
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Qty_Free'
        Title.Caption = 'Qty Free'
        Width = 73
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Qty_Paid'
        Title.Caption = 'Paid For'
        Width = 63
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 425
    Width = 733
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      733
      41)
    object lblAllocateSeq: TLabel
      Left = 8
      Top = 16
      Width = 93
      Height = 13
      Caption = 'Allocate sequence'
    end
    object OKBitBtn: TBitBtn
      Left = 554
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
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
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 642
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object AllBitBtn: TBitBtn
      Left = 462
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Select All'
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = AllBitBtnClick
    end
    object cmbAllocateSeq: TComboBox
      Left = 112
      Top = 8
      Width = 169
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      Items.Strings = (
        'oldest stock first'
        '"paid for" stock first'
        '"unpaid" stock first')
    end
  end
  object stsDetails: TStatusBar
    Left = 0
    Top = 466
    Width = 733
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
    Top = 0
    Width = 733
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    object lblSalesOrderNo: TLabel
      Left = 16
      Top = 16
      Width = 84
      Height = 13
      Caption = 'lblSalesOrderNo'
    end
  end
  object DetsDataSource: TDataSource
    DataSet = GetDetsSQL
    Left = 432
    Top = 232
  end
  object DetsTimer: TTimer
    Enabled = False
    OnTimer = DetsTimerTimer
    Left = 560
    Top = 248
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select'
      '    Sales_Order_Line.Sales_Order_Line_No,'
      '    Sales_Order_Line.Part,'
      '    Sales_Order_Line.Quantity_Ordered,'
      '    Sales_Order_Line.Quantity_Overs,'
      '    Sales_Order_Line.Quantity_Delivered,'
      '    Sales_Order_Line.Sales_Order,'
      
        '    (Sales_Order_Line.Quantity_Ordered + isnull(Sales_Order_Line' +
        '.Quantity_Overs,0)) as Quantity_Requested,'
      '    Part.Sell_Pack_Quantity,'
      '    Part.Purch_Pack_Quantity,'
      '    Part.Part_Description,'
      '    Part.Part_Has_Children,'
      '    Sales_Order_Line.Quantity_Allocated as Qty_Alloc,'
      '    (Select Sum(Store_Quantity - Quantity_Allocated)'
      '      from Store_Stock'
      
        '        Left Join Part_Store_Bin on ((Store_Stock.Part_Bin = Par' +
        't_Store_Bin.Part_Bin) and'
      '        (Part_Store_Bin.Part_Store = :Part_Store))'
      '      where (Store_Stock.Part_Store = :Part_Store) and'
      '        (Store_Stock.Part = Sales_Order_Line.Part) and'
      
        '        ((Part_Store_Bin.Bin_Can_Pick = '#39'Y'#39') or (Part_Store_Bin.' +
        'Bin_Can_Pick = Null))) as Qty_Free,'
      '    (Select Sum(Store_Quantity - Quantity_Allocated)'
      '      from Store_Stock'
      
        '        Left Join Part_Store_Bin on ((Store_Stock.Part_Bin = Par' +
        't_Store_Bin.Part_Bin) and'
      '        (Part_Store_Bin.Part_Store = :Part_Store))'
      '      where (Store_Stock.Part_Store = :Part_Store) and'
      '        (Store_Stock.Part = Sales_Order_Line.Part) and'
      '        (Store_Stock.Invoice_upfront = '#39'Y'#39') and'
      
        '        ((Part_Store_Bin.Bin_Can_Pick = '#39'Y'#39') or (Part_Store_Bin.' +
        'Bin_Can_Pick = Null))) as Qty_Paid'
      'From Sales_Order_Line, Part'
      'Where (Sales_Order_Line.Sales_Order = :Sales_Order) and'
      '      (Sales_Order_Line.Part = Part.Part) and'
      '      (Sales_Order_Line.Part Like :Part) and'
      '      ((Part.Product_class = '#39'STK'#39') or'
      '      (Part.Product_class is NULL))'
      'Order by Sales_Order_Line.Sales_Order_Line_no'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 120
    Top = 256
    ParamData = <
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Part'
        DataType = ftString
      end>
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
    Left = 270
    Top = 310
    ParamData = <
      item
        Name = 'status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object GetPartStoreSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * '
      'from Part_Store'
      'where Part_Store = :Part_Store')
    Left = 272
    Top = 256
    ParamData = <
      item
        Name = 'Part_Store'
      end>
  end
  object pmnuAllocate: TPopupMenu
    OnPopup = pmnuAllocatePopup
    Left = 400
    Top = 136
    object mnuAllocatethisline: TMenuItem
      Caption = 'Allocate selected line'
      OnClick = mnuAllocatethislineClick
    end
    object mnuAllocatebyBin: TMenuItem
      Caption = 'Allocate selected line by bin'
      OnClick = mnuAllocatebyBinClick
    end
    object mnuAllocateAllLines: TMenuItem
      Caption = 'Allocate all lines'
      OnClick = mnuAllocateAllLinesClick
    end
  end
  object qryGetCompositeParts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '     Part,'
      '     Composite_Part'
      '     Quantity, '
      '    (Select Sum(Store_Quantity - Quantity_Allocated)'
      '      from Store_Stock'
      
        '        Left Join Part_Store_Bin on ((Store_Stock.Part_Bin = Par' +
        't_Store_Bin.Part_Bin) and'
      '        (Part_Store_Bin.Part_Store = :Part_Store))'
      '      where (Store_Stock.Part_Store = :Part_Store) and'
      '        (Store_Stock.Part = Part_Element.Composite_Part) and'
      
        '        ((Part_Store_Bin.Bin_Can_Pick = '#39'Y'#39') or (Part_Store_Bin.' +
        'Bin_Can_Pick = Null))) as Qty_Free,'
      '    (Select Sum(Store_Quantity - Quantity_Allocated)'
      '      from Store_Stock'
      
        '        Left Join Part_Store_Bin on ((Store_Stock.Part_Bin = Par' +
        't_Store_Bin.Part_Bin) and'
      '        (Part_Store_Bin.Part_Store = :Part_Store))'
      '      where (Store_Stock.Part_Store = :Part_Store) and'
      '        (Store_Stock.Part = Part_Element.Composite_Part) and'
      '        (Store_Stock.Invoice_upfront = '#39'Y'#39') and'
      
        '        ((Part_Store_Bin.Bin_Can_Pick = '#39'Y'#39') or (Part_Store_Bin.' +
        'Bin_Can_Pick = Null))) as Qty_Paid'
      'from part_element'
      'where Part = :Part')
    Left = 128
    Top = 112
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part'
      end>
  end
end
