object PBSalesOrdertoPOFrm: TPBSalesOrdertoPOFrm
  Left = 352
  Top = 121
  Width = 505
  Height = 378
  Caption = 'Create Purchase Order from Sales Order'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 303
    Width = 497
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      497
      41)
    object OKBitBtn: TBitBtn
      Left = 331
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Create'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = OKBitBtnClick
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
    end
    object CancelBitBtn: TBitBtn
      Left = 411
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
    object AllBitBtn: TBitBtn
      Left = 11
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Select All'
      Anchors = [akLeft, akBottom]
      Caption = 'Select'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = AllBitBtnClick
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
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 497
    Height = 303
    Align = alClient
    DataSource = dtsDirectSO
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
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Ordered'
        Title.Caption = 'Date Ordered'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Required'
        Title.Caption = 'Date Required'
        Width = 89
        Visible = True
      end>
  end
  object qryDirectSO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  sales_order,'
      '        date_ordered,'
      '        date_required,'
      '        supplier.name as supplier_name'
      'from sales_order, supplier'
      'where ((replenish_source = 1) or (replenish_source = 3)) and'
      
        '(sales_order_head_status >= 10 and sales_order_head_status < 250' +
        ') and'
      'sales_order.supplier = supplier.supplier and'
      '((select top 1 purch_ord.sales_order'
      '  from purch_ord'
      
        '  where purch_ord.sales_order = sales_order.sales_order) is NULL' +
        ') AND'
      
        '((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is NULL) ' +
        'or (Sales_Order.inactive = '#39#39'))'
      'ORDER BY Sales_Order DESC')
    Left = 120
    Top = 152
  end
  object dtsDirectSO: TDataSource
    DataSet = qryDirectSO
    Left = 176
    Top = 160
  end
end
