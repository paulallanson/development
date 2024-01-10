object frmWTRSSOStockDeAllocation: TfrmWTRSSOStockDeAllocation
  Left = 266
  Top = 44
  Width = 943
  Height = 568
  Caption = 'Stock Allocation'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 477
    Width = 935
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      935
      41)
    object btnClose: TButton
      Left = 832
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
      Caption = 'De-Allocate'
      Enabled = False
      ModalResult = 2
      TabOrder = 1
      OnClick = btnAllocateClick
    end
  end
  object stsBrDetails: TStatusBar
    Left = 0
    Top = 518
    Width = 935
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
    Top = 113
    Width = 935
    Height = 364
    Align = alClient
    DataSource = dtsSalesOrders
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
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
        Title.Caption = 'Order Date'
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
        FieldName = 'Date_Required'
        Title.Caption = 'Fitting Date'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Change_Date'
        Title.Caption = 'Move Date'
        Width = 91
        Visible = True
      end>
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 935
    Height = 113
    Align = alTop
    TabOrder = 3
    object grpbxDateSelect: TGroupBox
      Left = 240
      Top = 16
      Width = 209
      Height = 73
      Caption = 'Fitting Date'
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 26
        Height = 13
        Caption = 'From:'
      end
      object Label2: TLabel
        Left = 26
        Top = 48
        Width = 16
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
        TabOrder = 2
        OnClick = btnDatefromClick
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
      end
      object btnDateTo: TBitBtn
        Left = 168
        Top = 42
        Width = 25
        Height = 25
        TabOrder = 3
        OnClick = btnDateToClick
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
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 16
      Width = 209
      Height = 73
      Caption = 'Movement Date'
      TabOrder = 1
      object Label5: TLabel
        Left = 16
        Top = 20
        Width = 26
        Height = 13
        Caption = 'From:'
      end
      object Label6: TLabel
        Left = 26
        Top = 48
        Width = 16
        Height = 13
        Caption = 'To:'
      end
      object edtMoveDateFrom: TEdit
        Left = 56
        Top = 16
        Width = 100
        Height = 21
        TabOrder = 0
        OnExit = edtDateFromExit
      end
      object edtMoveDateTo: TEdit
        Left = 56
        Top = 44
        Width = 100
        Height = 21
        TabOrder = 1
        OnExit = edtDateFromExit
      end
      object BitBtn1: TBitBtn
        Left = 168
        Top = 14
        Width = 25
        Height = 25
        TabOrder = 2
        OnClick = BitBtn1Click
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
      end
      object BitBtn2: TBitBtn
        Left = 168
        Top = 42
        Width = 25
        Height = 25
        TabOrder = 3
        OnClick = BitBtn2Click
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
      end
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
    Top = 236
    Width = 289
    Height = 61
    TabOrder = 5
    Visible = False
    object lblProcessing: TLabel
      Left = 16
      Top = 12
      Width = 63
      Height = 13
      Caption = 'De-Allocating'
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
  object dtsSalesOrders: TDataSource
    DataSet = qrySalesOrders
    Left = 120
    Top = 280
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT'
      #9#9'    Sales_order_Date_log.Change_Date,'
      #9#9'    Sales_Order.Sales_Order,'
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
      
        '        (Thickness.Thickness_mm +   Worktop.Description +   Mate' +
        'rial_Type.Description) as Slab_Description,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        Sales_order_line.Unit_Price,'
      '        Sales_order_line.Sales_Order_line_no,'
      #9#9'    Sales_Order_Line.Stock_Allocation_Start_Date,'
      #9#9'    Sales_Order_Line.Stock_Allocation_End_Date,'
      '        ( SELECT TOP 1 Stock_item.Stock_code'
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
      'FROM Material_Type '
      #9#9'INNER JOIN (Thickness '
      #9#9'INNER JOIN (Worktop '
      #9#9'INNER JOIN ((((Sales_Order_Status '
      #9#9'INNER JOIN (Rep '
      #9#9'INNER JOIN (Customer'
      #9#9'INNER JOIN ((Sales_Order_Date_Log AS SODL '
      #9#9'INNER JOIN Sales_Order_Date_Log '
      
        #9#9#9'ON (SODL.Change_Date = Sales_Order_Date_Log.Change_Date) AND ' +
        '(SODL.Sales_Order = Sales_Order_Date_Log.Sales_Order)) '
      #9#9'INNER JOIN Sales_Order '
      #9#9#9'ON SODL.Sales_Order = Sales_Order.Sales_Order) '
      #9#9#9'ON Customer.Customer = Sales_Order.Customer)'
      #9#9#9'ON Rep.Rep = Sales_Order.Rep) '
      
        #9#9#9'ON Sales_Order_Status.Sales_Order_Status = Sales_Order.Sales_' +
        'Order_Status) '
      #9#9'INNER JOIN Sales_Order_Line '
      #9#9#9'ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order) '
      #9#9'INNER JOIN Quote '
      #9#9#9'ON Sales_Order_Line.Quote = Quote.Quote)'
      #9#9'INNER JOIN Quote_Slab '
      #9#9#9'ON Quote.Quote = Quote_Slab.Quote) '
      #9#9#9'ON Worktop.Worktop = Quote_Slab.Worktop) '
      #9#9#9'ON Thickness.Thickness = Quote_Slab.Thickness) '
      #9#9#9'ON Material_Type.Material_Type = Worktop.Material_Type'
      
        'WHERE (Sales_Order_Date_Log.Change_Function =  '#39'O'#39') AND (SODL.Ch' +
        'ange_Function = '#39'N'#39') AND'
      #9'    (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        '      ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To))'
      'GROUP BY'
      '       Sales_order_Date_log.Change_Date,'
      '       Sales_Order.Sales_Order,'
      '       Sales_Order_Line.Quote,'
      '       Sales_Order.Date_Raised,'
      '       Sales_Order.Sales_Order_Status,'
      '       Sales_Order.Template_Date,'
      '       Sales_Order.Date_Required,'
      '       Sales_Order.Customer_Name,'
      '       Sales_Order.Reference,'
      '       Sales_Order.IsFittingInOutlook,'
      '       Customer.Is_Retail_Customer, '
      '       Customer.Is_Commercial_Customer, '
      '       Sales_Order.Rep,'
      '       Rep.Rep_Name, '
      '       Worktop.Description, '
      '       Material_Type.Description, '
      '       Thickness.Thickness_mm, '
      '       Quote_Slab.Worktop,'
      '       Quote_Slab.Thickness, '
      '       Quote_Slab.Length, '
      '       Quote_Slab.Depth, '
      '       Sales_Order_Status.Sales_Order_Status_Desc, +'
      '       Sales_Order.Goods_Value, +'
      '       Sales_Order.VAT_Value, +'
      '       Sales_Order_Line.Unit_Price, +'
      '       Sales_order_line.Sales_Order_line_no,'
      #9'     Sales_Order_Line.Stock_Allocation_Start_Date,'
      '       Sales_Order_Line.Stock_Allocation_End_Date'
      '')
    Left = 32
    Top = 280
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date_Move_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Move_To'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT'
      #9#9'    Sales_order_Date_log.Change_Date,'
      #9#9'    Sales_Order.Sales_Order,'
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
      
        '        (Thickness.Thickness_mm +   Worktop.Description +   Mate' +
        'rial_Type.Description) as Slab_Description,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        Sales_order_line.Unit_Price,'
      '        Sales_order_line.Sales_Order_line_no,'
      #9#9'    Sales_Order_Line.Stock_Allocation_Start_Date,'
      #9#9'    Sales_Order_Line.Stock_Allocation_End_Date,'
      '        ( SELECT TOP 1 Stock_item.Stock_code'
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
      'FROM Material_Type '
      #9#9'INNER JOIN (Thickness '
      #9#9'INNER JOIN (Worktop '
      #9#9'INNER JOIN ((((Sales_Order_Status '
      #9#9'INNER JOIN (Rep '
      #9#9'INNER JOIN (Customer'
      #9#9'INNER JOIN ((Sales_Order_Date_Log AS SODL '
      #9#9'INNER JOIN Sales_Order_Date_Log '
      
        #9#9#9'ON (SODL.Change_Date = Sales_Order_Date_Log.Change_Date) AND ' +
        '(SODL.Sales_Order = Sales_Order_Date_Log.Sales_Order)) '
      #9#9'INNER JOIN Sales_Order '
      #9#9#9'ON SODL.Sales_Order = Sales_Order.Sales_Order) '
      #9#9#9'ON Customer.Customer = Sales_Order.Customer)'
      #9#9#9'ON Rep.Rep = Sales_Order.Rep) '
      
        #9#9#9'ON Sales_Order_Status.Sales_Order_Status = Sales_Order.Sales_' +
        'Order_Status) '
      #9#9'INNER JOIN Sales_Order_Line '
      #9#9#9'ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order) '
      #9#9'INNER JOIN Quote '
      #9#9#9'ON Sales_Order_Line.Quote = Quote.Quote)'
      #9#9'INNER JOIN Quote_Slab '
      #9#9#9'ON Quote.Quote = Quote_Slab.Quote) '
      #9#9#9'ON Worktop.Worktop = Quote_Slab.Worktop) '
      #9#9#9'ON Thickness.Thickness = Quote_Slab.Thickness) '
      #9#9#9'ON Material_Type.Material_Type = Worktop.Material_Type'
      
        'WHERE (Sales_Order_Date_Log.Change_Function =  '#39'O'#39') AND (SODL.Ch' +
        'ange_Function = '#39'N'#39') AND'
      #9'    (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        '      ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        #9'    ((Sales_Order.Date_Raised < Sales_Order_line.Stock_Allocati' +
        'on_Start_Date) OR (Sales_Order.Date_Raised > Sales_order_Line.St' +
        'ock_Allocation_End_Date))'
      'GROUP BY'
      '       Sales_order_Date_log.Change_Date,'
      '       Sales_Order.Sales_Order,'
      '       Sales_Order_Line.Quote,'
      '       Sales_Order.Date_Raised,'
      '       Sales_Order.Sales_Order_Status,'
      '       Sales_Order.Template_Date,'
      '       Sales_Order.Date_Required,'
      '       Sales_Order.Customer_Name,'
      '       Sales_Order.Reference,'
      '       Sales_Order.IsFittingInOutlook,'
      '       Customer.Is_Retail_Customer, '
      '       Customer.Is_Commercial_Customer, '
      '       Sales_Order.Rep,'
      '       Rep.Rep_Name, '
      '       Worktop.Description, '
      '       Material_Type.Description, '
      '       Thickness.Thickness_mm, '
      '       Quote_Slab.Worktop,'
      '       Quote_Slab.Thickness, '
      '       Quote_Slab.Length, '
      '       Quote_Slab.Depth, '
      '       Sales_Order_Status.Sales_Order_Status_Desc,'
      '       Sales_Order.Goods_Value,'
      '       Sales_Order.VAT_Value,'
      '       Sales_Order_Line.Unit_Price,'
      '       Sales_order_line.Sales_Order_line_no,'
      #9'     Sales_Order_Line.Stock_Allocation_Start_Date,'
      '       Sales_Order_Line.Stock_Allocation_End_Date'
      
        'HAVING (SUM(Quote_Slab.Quantity - ISNULL(Quote_Slab.Quantity_All' +
        'ocated,0)) = 0)'
      'ORDER BY'
      '       Sales_Order.Sales_Order'
      '')
    Left = 200
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Move_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Move_To'
        ParamType = ptUnknown
      end>
  end
  object qryGetGSmart: TFDQuery
    ConnectionName = 'STK'
    SQL.Strings = (
      'SELECT'
      #9#9'Stock.ID,'
      #9#9'Stock.Stockcode as Stock_Code,'
      #9#9'Stock.Description as Stock_Description,'
      #9#9'SUM(LocationStock.Quantity) as Total_Quantity,'
      '    (SELECT'#9'ISNULL(SUM(StockIssueItem.Remaining),0)'
      '     FROM StockIssueItem'
      
        #9#9' WHERE (StockIssueItem.StockID = Stock.ID)) as Allocated_Quant' +
        'ity,'
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
    Left = 808
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'StockCode'
        ParamType = ptUnknown
      end>
  end
  object qryGetStockCode: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Stock_item.Stock_code'
      'FROM Stock_item'
      '        RIGHT JOIN Worktop_Thickness_Slab_Size'
      
        '          ON Stock_item.Stock_item = Worktop_Thickness_Slab_Size' +
        '.Stock_Item'
      'WHERE Worktop_Thickness_Slab_Size.Worktop = :Worktop AND'
      '      Worktop_Thickness_Slab_Size.Thickness = :Thickness AND'
      '      Worktop_Thickness_Slab_Size.Length = :Length AND'
      '      Worktop_Thickness_Slab_Size.Depth = :Depth')
    Left = 728
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Length'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
        ParamType = ptUnknown
      end>
  end
  object wtstkDatabase: TFDConnection
    ConnectionDefName = 'GSmart'
    ConnectionName = 'STK'
    LoginPrompt = False
    Params.Strings = (
      'User Name=readonly'
      'Password=R34donly4')
    Left = 808
    Top = 96
  end
  object qryUpdSOLine: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order_line'
      'SET Quantity_Allocated = :Quantity_Allocated,'
      '    Stock_Allocation_Start_Date = :Stock_Allocation_Start_Date,'
      '    Stock_Allocation_End_Date = :Stock_Allocation_End_Date'
      'WHERE Sales_order = :Sales_Order AND'
      '      Sales_order_line_no = :Sales_order_line_No')
    Left = 872
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Stock_Allocation_Start_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Stock_Allocation_End_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_line_No'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET Stock_Allocation_Start_Date = :Stock_Allocation_Start_Date,'
      '    Stock_Allocation_End_Date = :Stock_Allocation_End_Date'
      'WHERE Sales_order = :Sales_Order')
    Left = 872
    Top = 104
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Stock_Allocation_Start_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Stock_Allocation_End_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
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
    Left = 720
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetStockSystem: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Stock_System'
      'WHERE Stock_System = :Stock_System')
    Left = 816
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_System'
        ParamType = ptUnknown
      end>
  end
  object qryDummyOld: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT'
      #9#9'    Sales_order_Date_log.Change_Date,'
      #9#9'    Sales_Order.Sales_Order,'
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
      
        '        (Thickness.Thickness_mm +   Worktop.Description +   Mate' +
        'rial_Type.Description) as Slab_Description,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        Sales_order_line.Unit_Price,'
      '        Sales_order_line.Sales_Order_line_no,'
      #9#9'    Sales_Order_Line.Stock_Allocation_Start_Date,'
      #9#9'    Sales_Order_Line.Stock_Allocation_End_Date,'
      '        ( SELECT TOP 1 Stock_item.Stock_code'
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
      'FROM Material_Type '
      #9#9'INNER JOIN (Thickness '
      #9#9'INNER JOIN (Worktop '
      #9#9'INNER JOIN ((((Sales_Order_Status '
      #9#9'INNER JOIN (Rep '
      #9#9'INNER JOIN (Customer'
      #9#9'INNER JOIN ((Sales_Order_Date_Log AS SODL '
      #9#9'INNER JOIN Sales_Order_Date_Log '
      
        #9#9#9'ON (SODL.Change_Date = Sales_Order_Date_Log.Change_Date) AND ' +
        '(SODL.Sales_Order = Sales_Order_Date_Log.Sales_Order)) '
      #9#9'INNER JOIN Sales_Order '
      #9#9#9'ON SODL.Sales_Order = Sales_Order.Sales_Order) '
      #9#9#9'ON Customer.Customer = Sales_Order.Customer)'
      #9#9#9'ON Rep.Rep = Sales_Order.Rep) '
      
        #9#9#9'ON Sales_Order_Status.Sales_Order_Status = Sales_Order.Sales_' +
        'Order_Status) '
      #9#9'INNER JOIN Sales_Order_Line '
      #9#9#9'ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order) '
      #9#9'INNER JOIN Quote '
      #9#9#9'ON Sales_Order_Line.Quote = Quote.Quote)'
      #9#9'INNER JOIN Quote_Slab '
      #9#9#9'ON Quote.Quote = Quote_Slab.Quote) '
      #9#9#9'ON Worktop.Worktop = Quote_Slab.Worktop) '
      #9#9#9'ON Thickness.Thickness = Quote_Slab.Thickness) '
      #9#9#9'ON Material_Type.Material_Type = Worktop.Material_Type'
      
        'WHERE (Sales_Order_Date_Log.Change_Function =  '#39'O'#39') AND (SODL.Ch' +
        'ange_Function = '#39'N'#39') AND'
      #9'    (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      #9'    (Sales_Order_line.Quantity_Allocated > 0) AND'
      
        '      ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        #9'    ((Sales_Order.Date_Raised < Sales_Order_line.Stock_Allocati' +
        'on_Start_Date) OR (Sales_Order.Date_Raised > Sales_order_Line.St' +
        'ock_Allocation_End_Date))'
      'GROUP BY'
      '       Sales_order_Date_log.Change_Date,'
      '       Sales_Order.Sales_Order,'
      '       Sales_Order_Line.Quote,'
      '       Sales_Order.Date_Raised,'
      '       Sales_Order.Sales_Order_Status,'
      '       Sales_Order.Template_Date,'
      '       Sales_Order.Date_Required,'
      '       Sales_Order.Customer_Name,'
      '       Sales_Order.Reference,'
      '       Sales_Order.IsFittingInOutlook,'
      '       Customer.Is_Retail_Customer, '
      '       Customer.Is_Commercial_Customer, '
      '       Sales_Order.Rep,'
      '       Rep.Rep_Name, '
      '       Worktop.Description, '
      '       Material_Type.Description, '
      '       Thickness.Thickness_mm, '
      '       Quote_Slab.Worktop,'
      '       Quote_Slab.Thickness, '
      '       Quote_Slab.Length, '
      '       Quote_Slab.Depth, '
      '       Sales_Order_Status.Sales_Order_Status_Desc,'
      '       Sales_Order.Goods_Value,'
      '       Sales_Order.VAT_Value,'
      '       Sales_Order_Line.Unit_Price,'
      '       Sales_order_line.Sales_Order_line_no,'
      #9'     Sales_Order_Line.Stock_Allocation_Start_Date,'
      '       Sales_Order_Line.Stock_Allocation_End_Date'
      'ORDER BY'
      '       Sales_Order.Sales_Order'
      '')
    Left = 280
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Move_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Move_To'
        ParamType = ptUnknown
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
    Left = 728
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Length'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
        ParamType = ptUnknown
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
      '      (SELECT Stock_item.Stock_code'
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
    Left = 720
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Code'
        ParamType = ptUnknown
      end>
  end
end
