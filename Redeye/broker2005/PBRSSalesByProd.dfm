object PBRSSalesByProdFrm: TPBRSSalesByProdFrm
  Left = 24
  Top = 192
  AutoScroll = False
  Caption = 'Invoiced Sales by Product'
  ClientHeight = 500
  ClientWidth = 786
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 794
  Font.Charset = ANSI_CHARSET
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
  object stsDetails: TStatusBar
    Left = 0
    Top = 481
    Width = 786
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 440
    Width = 786
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      786
      41)
    object PrintReportBitBtn: TBitBtn
      Left = 612
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Print'
      TabOrder = 0
      OnClick = PrintReportBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object PreviewReportBitBtn: TBitBtn
      Left = 524
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Preview'
      TabOrder = 1
      OnClick = PreviewReportBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
    object CancelBitBtn: TBitBtn
      Left = 700
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 2
      Kind = bkClose
    end
    object btbtnExcel: TBitBtn
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 3
      OnClick = btbtnExcelClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
        FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
        00000000000000000000A4070707000707070707070700070707A40707070007
        07000700070700070707A4070707000707000000070700070707A40707070007
        07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 786
    Height = 121
    Align = alTop
    TabOrder = 2
    DesignSize = (
      786
      121)
    object Label1: TLabel
      Left = 646
      Top = 10
      Width = 90
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'From Invoice Date:'
    end
    object DateFromButton: TSpeedButton
      Left = 749
      Top = 24
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
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
      OnClick = DateFromButtonClick
    end
    object Label2: TLabel
      Left = 646
      Top = 58
      Width = 80
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'To Invoice Date:'
    end
    object DateToButton: TSpeedButton
      Left = 749
      Top = 72
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
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
      OnClick = DateToButtonClick
    end
    object rgCustomer: TRadioGroup
      ParentBackground = False
      Left = 8
      Top = 8
      Width = 113
      Height = 81
      Caption = 'By Customer'
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer ')
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object chkbxCustomer: TCheckBox
      Left = 8
      Top = 96
      Width = 193
      Height = 17
      Caption = 'Report on Ordering Customer'
      TabOrder = 1
      OnClick = chkbxCustomerClick
    end
    object pnlCustSearch: TPanel
      ParentBackground = False
      Left = 128
      Top = 11
      Width = 328
      Height = 78
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Visible = False
      DesignSize = (
        328
        78)
      object lblCustBran: TLabel
        Left = 8
        Top = 2
        Width = 89
        Height = 13
        Caption = 'Customer / Branch'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 18
        Width = 276
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 291
        Top = 18
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
      object chkbxBranches: TCheckBox
        Left = 8
        Top = 48
        Width = 306
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Report on all branches'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkbxBranchesClick
      end
    end
    object DateFromEdit: TEdit
      Left = 645
      Top = 26
      Width = 98
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 10
      TabOrder = 3
      OnExit = DateFromEditExit
    end
    object DateToEdit: TEdit
      Left = 645
      Top = 74
      Width = 98
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 10
      TabOrder = 4
      OnExit = DateToEditExit
    end
    object chkbxTotalbyBranch: TCheckBox
      Left = 465
      Top = 96
      Width = 161
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Total by Customer Branch'
      TabOrder = 5
    end
    object chkbxTotalbyProduct: TCheckBox
      Left = 465
      Top = 72
      Width = 161
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Total by Product'
      TabOrder = 6
    end
    object ChkBxShwVl: TCheckBox
      Left = 465
      Top = 8
      Width = 161
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Exclude Goods Value'
      TabOrder = 7
      OnClick = ChkBxShwVlClick
    end
    object ChkBxExcCsts: TCheckBox
      Left = 465
      Top = 32
      Width = 170
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Exclude Cost /Profit Values'
      TabOrder = 8
      OnClick = ChkBxShwVlClick
    end
    object chkbxShowFormRefs: TCheckBox
      Left = 224
      Top = 96
      Width = 181
      Height = 17
      Caption = 'Show Form References'
      TabOrder = 9
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 121
    Width = 786
    Height = 319
    Align = alClient
    DataSource = dtsSalesByProd
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sales_Invoice_No'
        Title.Caption = 'Invoice'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_Date'
        Title.Caption = 'Date'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Goods'
        Title.Caption = 'Total Goods'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order'
        Visible = True
      end>
  end
  object OleContainer1: TOleContainer
    Left = 416
    Top = 200
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 4
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    ParentBackground = False
    Left = 252
    Top = 184
    Width = 289
    Height = 61
    TabOrder = 5
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object dtsSalesByProd: TDataSource
    DataSet = qrySalesbyProd
    Left = 104
    Top = 168
  end
  object qrySalesbyProd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '     '#9'Sales_Invoice_Line.Sales_Invoice,'
      #9'     Sales_Invoice_Line.Invoice_Line_No,'
      #9'     Sales_Invoice_Line.Purchase_Order,'
      #9'     Sales_Invoice_Line.Line,'
      #9'     Sales_Invoice_Line.Qty_Invoiced,'
      #9'     Sales_Invoice_Line.Goods_Value,'
      #9'     Sales_Invoice_Line.Vat_Code,'
      #9'     Sales_Invoice_Line.Vat_Value,'
      #9'     Sales_Invoice_Line.Price_Unit,'
      #9'     Sales_Invoice_Line.sales_Order,'
      #9'     Sales_Invoice_Line.Sales_Order_Line_no,'
      #9'     Sales_Invoice_Line.Job_Bag,'
      #9'     Sales_Invoice_Line.Job_Bag_Line,'
      #9'     Sales_Invoice_Line.Credit_type,'
      #9'     Sales_Invoice.Invoice_Date,'
      #9'     Sales_Invoice.Sales_Invoice_No,'
      #9'     Sales_Invoice.Inv_to_Customer,'
      #9'     Sales_Invoice.Inv_to_Branch,'
      #9'     Sales_Invoice.Inv_to_Customer AS Customer,'
      #9'     Sales_Invoice.Inv_to_Branch AS Branch_no,'
      #9'     Customer.Name AS Customer_Name,'
      '       Customer_Branch.Name AS Branch_Name,'
      #9'     Price_Unit.Price_Unit_Factor,'
      #9'     (case sales_invoice_type'
      #9'       when '#39'S'#39' then'
      #9#9'     (select distinct Part.Part_Description'
      #9' '#9'       from Sales_order_Line, Part'
      
        #9' '#9'       where ((Sales_order_line.Sales_order = Sales_invoice_L' +
        'ine.Sales_Order) and'
      
        '   '#9#9#9'          (Sales_order_Line.Sales_Order_Line_no = Sales_in' +
        'voice_Line.Sales_order_line_no)) and'
      #9#9#9'            (Part.Part = Sales_order_Line.Part))'
      #9'       when '#39'J'#39' then'
      ' '#9#9'     (select distinct Job_bag_line_dets.Job_Bag_Line_Descr'
      #9' '#9'       from Job_bag_Line_dets'
      
        #9' '#9'       where ((Job_bag_Line_dets.Job_Bag = Sales_invoice_Line' +
        '.Job_Bag) and'
      
        '   '#9#9#9'          (Job_bag_Line_dets.Job_bag_Line = Sales_invoice_' +
        'Line.Job_Bag_Line)))'
      #9'       else'
      #9#9'     (select distinct Customers_Desc'
      #9' '#9'       from Purchase_orderline'
      
        #9' '#9'       where Purchase_Orderline.Purchase_Order = Sales_Invoic' +
        'e_Line.Purchase_Order and'
      #9#9'       '#9'Purchase_orderLine.Line = Sales_invoice_line.Line)'
      #9'    end) as Description'
      '     FROM Customer'
      #9'     INNER JOIN (Price_Unit'
      #9'     INNER JOIN ((Customer_Branch'
      #9'     INNER JOIN Sales_Invoice ON'
      
        #9#9'   (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) ' +
        'AND'
      #9#9'   (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch))'
      #9'     INNER JOIN Sales_Invoice_Line ON'
      
        #9#9'   Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invo' +
        'ice) ON'
      '       Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) ON'
      #9#9'   Customer.Customer = Customer_Branch.Customer'
      '')
    Left = 200
    Top = 168
    object qrySalesbyProdSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesbyProdInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qrySalesbyProdPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qrySalesbyProdLine: TIntegerField
      FieldName = 'Line'
    end
    object qrySalesbyProdQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qrySalesbyProdGoods_Value: TFloatField
      FieldName = 'Goods_Value'
    end
    object qrySalesbyProdVat_Code: TIntegerField
      FieldName = 'Vat_Code'
    end
    object qrySalesbyProdVat_Value: TFloatField
      FieldName = 'Vat_Value'
    end
    object qrySalesbyProdPrice_Unit: TIntegerField
      FieldName = 'Price_Unit'
    end
    object qrySalesbyProdsales_Order: TIntegerField
      FieldName = 'sales_Order'
    end
    object qrySalesbyProdSales_Order_Line_no: TIntegerField
      FieldName = 'Sales_Order_Line_no'
    end
    object qrySalesbyProdJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qrySalesbyProdJob_Bag_Line: TIntegerField
      FieldName = 'Job_Bag_Line'
    end
    object qrySalesbyProdCredit_type: TStringField
      FieldName = 'Credit_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyProdInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesbyProdSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesbyProdCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesbyProdBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesbyProdCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyProdBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyProdPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qrySalesbyProdDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesbyProdOrder: TStringField
      FieldKind = fkCalculated
      FieldName = 'Order'
      OnGetText = qrySalesbyProdOrderGetText
      Calculated = True
    end
    object qrySalesbyProdQuantity: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Quantity'
      OnGetText = qrySalesbyProdQuantityGetText
      Calculated = True
    end
    object qrySalesbyProdTotal_Goods: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Goods'
      OnGetText = qrySalesbyProdTotal_GoodsGetText
      Calculated = True
    end
  end
end
