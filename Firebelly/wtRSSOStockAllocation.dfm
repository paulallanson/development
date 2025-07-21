object frmWTRSSOStockAllocation: TfrmWTRSSOStockAllocation
  Left = 266
  Top = 44
  Caption = 'Stock Allocation'
  ClientHeight = 588
  ClientWidth = 1036
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 528
    Width = 1036
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1036
      41)
    object btnClose: TButton
      Left = 893
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnAllocate: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Allocate'
      Enabled = False
      ModalResult = 2
      TabOrder = 1
      OnClick = btnAllocateClick
    end
    object btnExclude: TButton
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Exclude'
      Enabled = False
      TabOrder = 2
      OnClick = btnExcludeClick
    end
    object btnExcel: TBitBtn
      Left = 798
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Excel'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C8807FF7777777777FF700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnExcelClick
    end
  end
  object stsBrDetails: TStatusBar
    Left = 0
    Top = 569
    Width = 1036
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 233
    Width = 1036
    Height = 295
    Align = alClient
    DataSource = dtsSalesOrders
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Raised'
        Title.Caption = 'Date'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Slab_Description'
        Title.Caption = 'Worktop'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Code'
        Title.Caption = 'Stock Code'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Slab_Quantity'
        Title.Caption = 'No of Slabs'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Allocated_Stock_Code'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Slab_Depth'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Slab_Length'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Thickness_mm'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Slab_Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Required'
        Title.Caption = 'Fitting Date'
        Width = 80
        Visible = True
      end>
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1036
    Height = 233
    Align = alTop
    TabOrder = 3
    object rdgrpCustomer: TRadioGroup
      Left = 8
      Top = 8
      Width = 105
      Height = 57
      Caption = 'Customers'
      ItemIndex = 0
      Items.Strings = (
        'All'
        'Selected')
      TabOrder = 0
      OnClick = rdgrpCustomerClick
    end
    object grpbxCustomer: TGroupBox
      Left = 120
      Top = 8
      Width = 249
      Height = 113
      Enabled = False
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 10
        Width = 49
        Height = 13
        Caption = 'Customer'
      end
      object btnCustomer: TButton
        Left = 216
        Top = 24
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnCustomerClick
      end
      object lstbxCustomers: TListBox
        Left = 8
        Top = 24
        Width = 201
        Height = 83
        ItemHeight = 13
        Items.Strings = (
          'All Customers')
        MultiSelect = True
        PopupMenu = pmnCustomers
        TabOrder = 1
      end
    end
    object rdgrpSortBy: TRadioGroup
      Left = 384
      Top = 8
      Width = 113
      Height = 89
      Caption = 'Sort by: '
      ItemIndex = 0
      Items.Strings = (
        'Sales Order'
        'Fitting Date'
        'Customer'
        'Rep')
      TabOrder = 2
      OnClick = rdgrpSortByClick
    end
    object lstbxCustomersCode: TListBox
      Left = 96
      Top = 8
      Width = 25
      Height = 105
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object grpbxDateSelect: TGroupBox
      Left = 8
      Top = 128
      Width = 209
      Height = 89
      Caption = 'Fitting Date'
      TabOrder = 4
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 29
        Height = 13
        Caption = 'From:'
      end
      object Label2: TLabel
        Left = 26
        Top = 48
        Width = 14
        Height = 13
        Caption = 'To:'
      end
      object edtDateFrom: TEdit
        Left = 56
        Top = 16
        Width = 100
        Height = 21
        TabOrder = 0
        OnExit = edtDateFromExit
      end
      object edtDateTo: TEdit
        Left = 56
        Top = 44
        Width = 100
        Height = 21
        TabOrder = 1
        OnExit = edtDateFromExit
      end
      object btnDatefrom: TBitBtn
        Left = 168
        Top = 14
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnDatefromClick
      end
      object btnDateTo: TBitBtn
        Left = 168
        Top = 42
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = btnDateToClick
      end
    end
    object rdgrpCategory: TRadioGroup
      Left = 232
      Top = 128
      Width = 105
      Height = 90
      Caption = 'Category'
      ItemIndex = 0
      Items.Strings = (
        'All'
        'Trade'
        'Retail'
        'Commercial')
      TabOrder = 5
      OnClick = rdgrpCategoryClick
    end
    object rdgrpSelectBy: TRadioGroup
      Left = 384
      Top = 128
      Width = 113
      Height = 73
      Caption = 'Select by '
      ItemIndex = 0
      Items.Strings = (
        'All Orders'
        'Confirmed'
        'Provisonal')
      TabOrder = 6
      OnClick = rdgrpSelectByClick
    end
    object chkbxShowOnlyScheduled: TCheckBox
      Left = 528
      Top = 131
      Width = 217
      Height = 17
      Caption = 'Only Allocate Scheduled Orders'
      TabOrder = 7
      OnClick = chkbxShowOnlyScheduledClick
    end
    object chkbxIncludeInvoiced: TCheckBox
      Left = 528
      Top = 155
      Width = 217
      Height = 17
      Caption = 'Include Orders up to Fully Invoiced'
      TabOrder = 8
      OnClick = chkbxIncludeInvoicedClick
    end
    object rdgrpAllocate: TRadioGroup
      Left = 528
      Top = 8
      Width = 145
      Height = 57
      Caption = 'Allocation Type'
      ItemIndex = 0
      Items.Strings = (
        'Allocate'
        'DeAllocate')
      TabOrder = 9
      OnClick = rdgrpAllocateClick
    end
  end
  object OleContainer1: TOleContainer
    Left = 364
    Top = 312
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 4
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 292
    Top = 340
    Width = 289
    Height = 61
    TabOrder = 5
    Visible = False
    object lblProcessing: TLabel
      Left = 16
      Top = 12
      Width = 55
      Height = 13
      Caption = 'Processing'
    end
    object prgbrRecords: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object pmnCustomers: TPopupMenu
    OnPopup = pmnCustomersPopup
    Left = 376
    Top = 72
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object dtsSalesOrders: TDataSource
    DataSet = qrySalesOrders
    OnDataChange = dtsSalesOrdersDataChange
    Left = 120
    Top = 280
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.IsFittingInOutlook,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        Sales_order_line.Unit_Price,'
      '        SUM(Quote_Slab.Quantity) as Slab_Quantity,'
      
        '        SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/1000000.00' +
        '0000) * Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_S' +
        'lab.Adhesive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1)))) as ' +
        'Total_Slab_Cost'
      'FROM Sales_Order_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN ((Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      '      INNER JOIN (Worktop'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN Quote_Slab'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      'WHERE'
      
        '    ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.Sal' +
        'es_Order_Status < :Sales_Order_Status)) AND'
      '    ((Sales_Order.Rep = :Rep) or (0 = :Rep)) AND'
      
        '    ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Order.' +
        'Date_Required <= :Date_To)) AND'
      
        '    ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR (' +
        'Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittingI' +
        'nOutlook IS NULL)) AND'
      
        '    (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (C' +
        'ustomer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:' +
        'Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 32
    Top = 280
    ParamData = <
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Date_From'
        DataType = ftString
      end
      item
        Name = 'Date_To'
        DataType = ftString
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.IsFittingInOutlook,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      
        '        (Thickness.Thickness_mm + '#39' '#39' + Worktop.Description + '#39' ' +
        #39' + Material_Type.Description) as Slab_Description,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        Sales_order_line.Unit_Price,'
      '        Sales_order_line.Sales_Order_line_no,'
      '        (SELECT TOP 1 Stock_item.Stock_code'
      '          FROM Stock_item'
      '              RIGHT JOIN Worktop_thickness_Slab_Size'
      
        '                ON Stock_item.Stock_item = Worktop_thickness_Sla' +
        'b_Size.Stock_Item'
      
        '          WHERE Worktop_thickness_Slab_Size.Worktop = Quote_Slab' +
        '.Worktop AND'
      
        '                Worktop_thickness_Slab_Size.Thickness = Quote_Sl' +
        'ab.Thickness AND'
      
        '                Worktop_thickness_Slab_Size.Length = Quote_Slab.' +
        'Length AND'
      
        '                Worktop_thickness_Slab_Size.Depth = Quote_Slab.D' +
        'epth) as Stock_Code,'
      '        Quote_Slab.Allocated_Stock_Code,'
      
        '        Quote_Slab.Allocated_Stock_Alternative as Use_Alternativ' +
        'e,'
      '        SUM(Quote_Slab.Quantity) as Slab_Quantity,'
      
        '        SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/1000000.00' +
        '0000) * Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_S' +
        'lab.Adhesive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1)))) as ' +
        'Total_Slab_Cost'
      'FROM Sales_Order_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN ((Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      '      INNER JOIN (Worktop'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN Quote_Slab'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      'WHERE'
      
        '    ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.Sal' +
        'es_Order_Status < :Sales_Order_Status)) AND'
      '    ((Sales_Order.inactive = '#39'N'#39')) AND'
      '    ((Sales_Order.Rep = :Rep) or (0 = :Rep)) AND'
      
        '    ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Order.' +
        'Date_Required <= :Date_To)) AND'
      
        '    ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR (' +
        'Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittingI' +
        'nOutlook IS NULL)) AND'
      
        '    (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (C' +
        'ustomer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:' +
        'Is_Retail_Customer = '#39'A'#39'))')
    Left = 200
    Top = 280
    ParamData = <
      item
        Name = 'Sales_Order_Status'
        ParamType = ptInput
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Date_From'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IsFittingInOutlook'
        ParamType = ptInput
      end
      item
        Name = 'Is_Retail_Customer'
        ParamType = ptInput
      end
      item
        Name = 'Is_Commercial_Customer'
        ParamType = ptInput
      end>
  end
  object qryGetGSMStock: TFDQuery
    ConnectionName = 'STK'
    SQL.Strings = (
      'SELECT'
      #9#9'Stock.ID,'
      #9#9'Stock.Stockcode as Stock_Code,'
      #9#9'Stock.Description as Stock_Description,'
      #9#9'SUM(LocationStock.Quantity) as Total_Quantity,'
      #9#9'(SELECT'#9'ISNULL(SUM(StockTransaction.Quantity),0)'
      #9#9' FROM StockTransaction'
      #9#9' WHERE (StockTransaction.Stock_Code = Stock.Stockcode) AND'
      
        #9#9#9'   (StockTransaction.Posted = 0 AND StockTransaction.Directio' +
        'n = '#39'OUT'#39')) as Allocated_Quantity,'
      #9#9'(SELECT'#9'ISNULL(SUM(StockReceiptItem.Remaining),0)'
      #9#9' FROM StockReceiptItem'
      #9#9' WHERE (StockReceiptItem.StockID = Stock.ID)) as PO_Quantity'
      'FROM Stock'
      '      LEFT JOIN LocationStock'
      '          ON Stock.ID = LocationStock.StockID'
      'WHERE (Stock.Stockcode = :StockCode)'
      'GROUP BY'
      '  Stock.ID,'
      #9'Stock.Stockcode,'
      #9'Stock.Description'
      '')
    Left = 652
    Top = 196
    ParamData = <
      item
        Name = 'StockCode'
      end>
  end
  object qryGetStockCode: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Stock_item.Stock_code'
      'FROM Stock_item'
      '        RIGHT JOIN Worktop_Thickness_Slab_Size'
      
        '          ON Stock_item.Stock_item = Worktop_Thickness_Slab_Size' +
        '.Stock_Item'
      'WHERE Worktop_Thickness_Slab_Size.Worktop = :Worktop AND'
      '      Worktop_Thickness_Slab_Size.Thickness = :Thickness AND'
      '      Worktop_Thickness_Slab_Size.Length = :Length AND'
      '      Worktop_Thickness_Slab_Size.Depth = :Depth')
    Left = 542
    Top = 196
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end>
  end
  object wtStkDatabase: TFDConnection
    ConnectionName = 'STK'
    Params.Strings = (
      'User Name=readonly'
      'Password=R34donly4'
      'ConnectionDef=GSmart'
      'DriverID=MSSQL')
    LoginPrompt = False
    OnError = wtStkDatabaseError
    BeforeConnect = wtStkDatabaseBeforeConnect
    Left = 682
    Top = 96
  end
  object qryUpdSOLine: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order_line'
      'SET Stock_Allocation_Start_Date = :Stock_Allocation_Start_Date,'
      '    Stock_Allocation_End_Date = :Stock_Allocation_End_Date'
      'WHERE Sales_order = :Sales_Order AND'
      '      Sales_order_line_no = :Sales_order_line_No')
    Left = 762
    Top = 196
    ParamData = <
      item
        Name = 'Stock_Allocation_Start_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Stock_Allocation_End_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_line_No'
      end>
  end
  object qryUpdSO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Stock_Allocation_Start_Date = :Stock_Allocation_Start_Date,'
      '    Stock_Allocation_End_Date = :Stock_Allocation_End_Date'
      'WHERE Sales_order = :Sales_Order')
    Left = 762
    Top = 106
    ParamData = <
      item
        Name = 'Stock_Allocation_Start_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Stock_Allocation_End_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetSalesOrder: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Account_Code,'
      '        Sales_Order.Reference,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_order_line.Sales_Order_Line_no,'
      '        SUM(Quote_Slab.Quantity) as Slab_Quantity'
      'FROM Sales_Order_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN ((Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      '      INNER JOIN (Worktop'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN Quote_Slab'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      'WHERE Sales_Order.Sales_Order = :Sales_Order'
      'GROUP BY Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Account_Code,'
      '        Sales_Order.Reference,'
      '        Worktop.Description,'
      '        Material_Type.Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Sales_order_line.Sales_Order_Line_no')
    Left = 572
    Top = 6
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetStockSystem: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Stock_System'
      'WHERE Stock_System = :Stock_System')
    Left = 692
    Top = 6
    ParamData = <
      item
        Name = 'Stock_System'
      end>
  end
  object qryDeleteStoreStock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Store_Stock')
    Left = 24
    Top = 424
  end
  object qryGetGSmartAll: TFDQuery
    ConnectionName = 'STK'
    SQL.Strings = (
      'SELECT  Stock.ID,'
      '        Stock.Stockcode AS Stock_Code,'
      '        Stock.Description AS Stock_Description,'
      '        Sum(LocationStock.Quantity) AS Total_Quantity,'
      #9#9'    (SELECT'#9'ISNULL(SUM(StockIssueItem.Remaining),0)'
      '         FROM StockIssueItem'
      
        #9#9'     WHERE (StockIssueItem.StockID = Stock.ID)) as Allocated_Q' +
        'uantity,'
      #9#9'    (SELECT'#9'ISNULL(SUM(StockReceiptItem.Remaining),0)'
      #9#9'     FROM StockReceiptItem'
      
        #9#9'      WHERE (StockReceiptItem.StockID = Stock.ID)) as PO_Quant' +
        'ity'
      'FROM Stock'
      '             RIGHT JOIN LocationStock '
      '                    ON Stock.ID = LocationStock.StockID'
      'GROUP BY'
      '             Stock.ID, '
      '             Stock.Stockcode,'
      '             Stock.Description'
      'ORDER BY'
      '             Stock.Stockcode'
      '')
    Left = 542
    Top = 306
  end
  object qryCheckStockCode: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT TOP 1 Stock_Item.Stock_Item'
      'FROM Stock_Item'
      'WHERE Stock_Code = :Stock_Code')
    Left = 542
    Top = 386
    ParamData = <
      item
        Name = 'Stock_Code'
      end>
  end
  object qryAddStock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Stock_Item'
      '        (Stock_Item,'
      '         Stock_Code,'
      '         Stock_Description)'
      'SELECT Max(Stock_Item)+1, '#39'Dummy'#39', :GUID'
      'FROM Stock_Item'
      '')
    Left = 24
    Top = 488
    ParamData = <
      item
        Name = 'GUID'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Worktop_Thickness_Slab_Size'
      '( Slab_Size_Description,'
      '  Length,'
      '  Depth,'
      '  Worktop,'
      '  Thickness,'
      '  Stock_Item'
      ')'
      'Values'
      '( :Slab_Size_Description,'
      '  :Length,'
      '  :Depth,'
      '  :Worktop,'
      '  :Thickness,'
      '  :Stock_Item'
      ')')
    Left = 272
    Top = 432
    ParamData = <
      item
        Name = 'Slab_Size_Description'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Stock_Item'
        DataType = ftInteger
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Worktop_Thickness_Slab_Size'
      'SET'
      '  Slab_Size_Description = :Slab_Size_Description,'
      '  Length = :Length,'
      '  Depth = :Depth,'
      '  Stock_Item = :Stock_Item'
      'WHERE'
      '  Slab_Size_ID = :Slab_Size_ID')
    Left = 272
    Top = 488
    ParamData = <
      item
        Name = 'Slab_Size_Description'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Stock_Item'
        DataType = ftInteger
      end
      item
        Name = 'Slab_Size_ID'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Stock_Item'
      'From Stock_Item'
      'Where Stock_Description = :GUID')
    Left = 160
    Top = 488
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 224
    Top = 488
  end
  object qryUpdStock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Stock_Item'
      'SET Stock_Code = :Stock_Code,'
      '    Stock_Description = :Stock_Description'
      'WHERE Stock_Item = :Stock_Item')
    Left = 88
    Top = 488
    ParamData = <
      item
        Name = 'Stock_Code'
      end
      item
        Name = 'Stock_Description'
      end
      item
        Name = 'Stock_Item'
      end>
  end
  object qryAddStoreStock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Store_Stock'
      '(     Store_Stock,'
      '      Stock_item,'
      '      Store,'
      '      Bin,'
      '      Quantity_in_stock,'
      '      Quantity_Allocated,'
      '      Unit_price,'
      '      Price_unit,'
      '      Store_stock_description,'
      '      Lot_reference,'
      '      Date_Received,'
      '      Serial_no,'
      '      Depth,'
      '      Length,'
      '      Product'
      ')'
      'VALUES'
      '(     :Store_Stock,'
      '      :Stock_item,'
      '      :Store,'
      '      :Bin,'
      '      :Quantity_in_stock,'
      '      :Quantity_Allocated,'
      '      :Unit_price,'
      '      :Price_unit,'
      '      :Store_stock_description,'
      '      :Lot_reference,'
      '      :Date_Received,'
      '      :Serial_no,'
      '      :Depth,'
      '      :Length,'
      '      :Product'
      ')')
    Left = 352
    Top = 488
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Stock_item'
      end
      item
        Name = 'Store'
      end
      item
        Name = 'Bin'
      end
      item
        Name = 'Quantity_in_stock'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Unit_price'
      end
      item
        Name = 'Price_unit'
      end
      item
        Name = 'Store_stock_description'
      end
      item
        Name = 'Lot_reference'
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Serial_no'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Product'
        DataType = ftInteger
      end>
  end
  object qryGetLastSS: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT ISNULL(MAX(Store_Stock),0) as Last_Item'
      'FROM Store_Stock')
    Left = 432
    Top = 488
  end
  object qryGetStock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1'
      '        Store_Stock.Store_Stock,'
      '        Stock_Item.Stock_Code,'
      '        Stock_Item.Stock_Description,'
      '        Quantity_in_Stock as Total_Quantity,'
      '        Quantity_Allocated as Allocated_Quantity'
      'FROM store_stock,stock_item'
      'WHERE (store_stock.stock_item = stock_item.stock_item) AND'
      '      (Stock_Item.Stock_code = :StockCode)'
      '')
    Left = 652
    Top = 266
    ParamData = <
      item
        Name = 'StockCode'
      end>
  end
  object qryUpStoreStock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Store_Stock'
      
        'SET Quantity_Allocated = Quantity_Allocated + :Quantity_Allocate' +
        'd'
      'WHERE Store_Stock = :Store_Stock')
    Left = 642
    Top = 466
    ParamData = <
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Store_Stock'
      end>
  end
  object qryGetSalesOrderLine: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Account_Code,'
      '        Sales_Order.Reference,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_order_line.Sales_Order_Line_no,'
      '        SUM(Quote_Slab.Quantity) as Slab_Quantity'
      'FROM Sales_Order_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN ((Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      '      INNER JOIN (Worktop'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN Quote_Slab'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      
        'WHERE (Sales_Order.Sales_Order = :Sales_Order) AND (Sales_Order_' +
        'Line.Sales_Order_Line_No = :Sales_Order_Line_No) AND'
      '      (SELECT TOP 1 Stock_item.Stock_code'
      '          FROM Stock_item'
      '              RIGHT JOIN Worktop_thickness_Slab_Size'
      
        '                ON Stock_item.Stock_item = Worktop_thickness_Sla' +
        'b_Size.Stock_Item'
      
        '          WHERE Worktop_thickness_Slab_Size.Worktop = Quote_Slab' +
        '.Worktop AND'
      
        '                Worktop_thickness_Slab_Size.Thickness = Quote_Sl' +
        'ab.Thickness AND'
      
        '                Worktop_thickness_Slab_Size.Length = Quote_Slab.' +
        'Length AND'
      
        '                Worktop_thickness_Slab_Size.Depth = Quote_Slab.D' +
        'epth) = :Stock_Code'
      'GROUP BY Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Account_Code,'
      '        Sales_Order.Reference,'
      '        Worktop.Description,'
      '        Material_Type.Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Length,'
      '        Quote_Slab.Depth,'
      '        Sales_order_line.Sales_Order_Line_no')
    Left = 572
    Top = 66
    ParamData = <
      item
        Name = 'Sales_Order'
        ParamType = ptInput
      end
      item
        Name = 'Sales_Order_Line_No'
        ParamType = ptInput
      end
      item
        Name = 'Stock_Code'
        ParamType = ptInput
      end>
  end
  object qryDummyOld: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.IsFittingInOutlook,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      
        '        (Thickness.Thickness_mm + '#39' '#39' + Worktop.Description + '#39' ' +
        #39' + Material_Type.Description) as Slab_Description,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        Sales_order_line.Unit_Price,'
      '        Sales_order_line.Sales_Order_line_no,'
      '        ( SELECT Stock_item.Stock_code'
      '          FROM Stock_item'
      '              RIGHT JOIN Worktop_thickness_Slab_Size'
      
        '                ON Stock_item.Stock_item = Worktop_thickness_Sla' +
        'b_Size.Stock_Item'
      
        '          WHERE Worktop_thickness_Slab_Size.Worktop = Quote_Slab' +
        '.Worktop AND'
      
        '                Worktop_thickness_Slab_Size.Thickness = Quote_Sl' +
        'ab.Thickness AND'
      
        '                Worktop_thickness_Slab_Size.Length = Quote_Slab.' +
        'Length AND'
      
        '                Worktop_thickness_Slab_Size.Depth = Quote_Slab.D' +
        'epth) as Stock_Code,'
      '        SUM(Quote_Slab.Quantity) as Slab_Quantity,'
      
        '        SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/1000000.00' +
        '0000) * Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_S' +
        'lab.Adhesive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1)))) as ' +
        'Total_Slab_Cost'
      'FROM Sales_Order_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN ((Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      '      INNER JOIN (Worktop'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN Quote_Slab'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      'WHERE'
      
        '    (Sales_Order_Line.Quantity_Allocated = :Quantity_Allocated) ' +
        'AND'
      
        '    ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.Sal' +
        'es_Order_Status < :Sales_Order_Status)) AND'
      '    ((Sales_Order.Rep = :Rep) or (0 = :Rep)) AND'
      
        '    ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Order.' +
        'Date_Required <= :Date_To)) AND'
      
        '    ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR (' +
        'Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittingI' +
        'nOutlook IS NULL)) AND'
      
        '    (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (C' +
        'ustomer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:' +
        'Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 272
    Top = 280
    ParamData = <
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Date_From'
        DataType = ftString
      end
      item
        Name = 'Date_To'
        DataType = ftString
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qryAllocQuoteSlab: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Quote_Slab'
      'SET Quantity_Allocated = Quantity'
      'WHERE'
      '  (Quote_Slab.Quote = :Quote) AND'
      '  (Quote_Slab.Worktop = :Worktop) AND'
      '  (Quote_Slab.Thickness = :Thickness) AND'
      '  (Quote_Slab.Length = :Length) AND'
      '  (Quote_Slab.Depth = :Depth)')
    Left = 642
    Top = 526
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end>
  end
  object qryDeAllocQuoteSlab: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Quote_Slab'
      'SET Quantity_Allocated = 0'
      'WHERE'
      '  (Quote_Slab.Quote = :Quote) AND'
      '  (Quote_Slab.Worktop = :Worktop) AND'
      '  (Quote_Slab.Thickness = :Thickness) AND'
      '  (Quote_Slab.Length = :Length) AND'
      '  (Quote_Slab.Depth = :Depth)')
    Left = 642
    Top = 586
    ParamData = <
      item
        Name = 'Quote'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end>
  end
  object qrySalesOrdersOSize: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      '')
    Left = 32
    Top = 360
  end
  object qryGetStockCodeOSize: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Stock_item.Stock_code, Stock_item.Stock_item'
      'FROM Stock_item'
      '        RIGHT JOIN Worktop_Thickness_Slab_Size'
      
        '          ON Stock_item.Stock_item = Worktop_Thickness_Slab_Size' +
        '.Stock_Item'
      'WHERE Worktop_Thickness_Slab_Size.Worktop = :Worktop AND'
      '      Worktop_Thickness_Slab_Size.Thickness = :Thickness AND'
      '      Worktop_Thickness_Slab_Size.Length > :Length AND'
      '      Worktop_Thickness_Slab_Size.Depth > :Depth')
    Left = 790
    Top = 268
    ParamData = <
      item
        Name = 'WORKTOP'
        ParamType = ptInput
      end
      item
        Name = 'THICKNESS'
        ParamType = ptInput
      end
      item
        Name = 'LENGTH'
        ParamType = ptInput
      end
      item
        Name = 'DEPTH'
        ParamType = ptInput
      end>
  end
end
