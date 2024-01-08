object PBRSPurchInvFrm: TPBRSPurchInvFrm
  Left = 35
  Top = 29
  Caption = 'Invoice Daybook'
  ClientHeight = 463
  ClientWidth = 765
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 137
    Width = 765
    Height = 285
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object dbgrdProofStatus: TDBGrid
      Left = 1
      Top = 1
      Width = 763
      Height = 283
      Align = alClient
      DataSource = dtsrcPurchInv
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'POLine'
          Title.Caption = 'P.O.'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Point'
          Title.Caption = 'Date'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Customer_Name'
          Title.Caption = 'Customer'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Customers_Desc'
          Title.Caption = 'Description'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sales_Qty'
          Title.Caption = 'Quantity'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total_sell'
          Title.Caption = 'Sell Price'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sales_invoice_no'
          Title.Caption = 'Invoice No.'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sales_invoice_date'
          Title.Caption = 'Inv. Date'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_Name'
          Title.Caption = 'Supplier'
          Width = 194
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_invoice_no'
          Title.Caption = 'Supp Invoice No.'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_invoice_date'
          Title.Caption = 'Inv. Date'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total_Purch'
          Title.Caption = 'Buying Price'
          Visible = True
        end>
    end
    object pnlExportPrgrss: TPanel
      Left = 276
      Top = 85
      Width = 289
      Height = 61
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblExporting: TLabel
        Left = 16
        Top = 12
        Width = 59
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
  end
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 137
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 92
      Width = 59
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 160
      Top = 92
      Width = 62
      Height = 13
      Caption = 'then sort by'
    end
    object rgSupplier: TRadioGroup
      Left = 8
      Top = 16
      Width = 113
      Height = 57
      Caption = 'By Supplier'
      ItemIndex = 0
      Items.Strings = (
        'All Suppliers'
        'One Supplier ')
      ParentBackground = False
      TabOrder = 0
      OnClick = rgSupplierClick
    end
    object pnlSuppSearch: TPanel
      Left = 128
      Top = 16
      Width = 305
      Height = 57
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 8
        Width = 85
        Height = 13
        Caption = 'Supplier/ Branch'
      end
      object edtSupplier: TEdit
        Left = 8
        Top = 24
        Width = 257
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnSupplier: TButton
        Left = 272
        Top = 24
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnSupplierClick
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 106
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbSortChange
      Items.Strings = (
        'Order Number'
        'Order Date'
        'Invoice Number'
        'Supplier'
        '')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 106
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbSortChange
      Items.Strings = (
        'Order Number'
        'Order Date'
        'Invoice Number'
        'Supplier')
    end
    object TotByRadioGroup: TRadioGroup
      Left = 608
      Top = 8
      Width = 153
      Height = 57
      Caption = 'Report Totals'
      Items.Strings = (
        'By Supplier'
        'By Rep')
      ParentBackground = False
      TabOrder = 4
    end
    object chkbxUnmatchedOnly: TCheckBox
      Left = 608
      Top = 72
      Width = 161
      Height = 17
      Caption = 'Only show unmatched orders'
      TabOrder = 5
    end
    object chkbxExcludeZero: TCheckBox
      Left = 608
      Top = 112
      Width = 153
      Height = 17
      Caption = 'Exclude zero cost orders'
      TabOrder = 6
    end
    object chkbxInvoiced: TCheckBox
      Left = 608
      Top = 92
      Width = 161
      Height = 17
      Caption = 'Only show invoiced orders'
      TabOrder = 7
    end
    object GroupBox1: TGroupBox
      Left = 440
      Top = 8
      Width = 153
      Height = 121
      ParentBackground = False
      TabOrder = 8
      object lblDatefrom: TLabel
        Left = 16
        Top = 24
        Width = 89
        Height = 13
        Caption = 'From Order Date:'
      end
      object DateFromButton: TSpeedButton
        Left = 120
        Top = 38
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
        OnClick = DateFromButtonClick
      end
      object lblDateto: TLabel
        Left = 16
        Top = 72
        Width = 75
        Height = 13
        Caption = 'To Order Date:'
      end
      object DateToButton: TSpeedButton
        Left = 120
        Top = 80
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
        OnClick = DateToButtonClick
      end
      object DateFromEdit: TEdit
        Left = 15
        Top = 40
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 0
        OnChange = DateFromEditChange
        OnExit = DateFromEditExit
      end
      object DateToEdit: TEdit
        Left = 15
        Top = 84
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 1
        OnChange = DateToEditChange
        OnExit = DateToEditExit
      end
      object chkbxbyInvoice: TCheckBox
        Left = 8
        Top = -1
        Width = 137
        Height = 17
        Caption = 'Report by Invoice Date'
        TabOrder = 2
        OnClick = chkbxbyInvoiceClick
      end
    end
  end
  object pnlPrintControl: TPanel
    Left = 0
    Top = 422
    Width = 765
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object lblRecordCount: TLabel
      Left = 104
      Top = 16
      Width = 3
      Height = 13
    end
    object Label6: TLabel
      Left = 24
      Top = 16
      Width = 74
      Height = 13
      Caption = 'Record Count:'
    end
    object Panel1: TPanel
      Left = 444
      Top = 1
      Width = 320
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        320
        39)
      object PreviewReportBitBtn: TBitBtn
        Left = 134
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Preview'
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
        TabOrder = 0
        OnClick = PreviewReportBitBtnClick
      end
      object PrintReportBitBtn: TBitBtn
        Left = 230
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Print'
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
        TabOrder = 1
        OnClick = PrintReportBitBtnClick
      end
      object btbtnExcel: TBitBtn
        Left = 37
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Excel'
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
        TabOrder = 2
        OnClick = btbtnExcelClick
      end
    end
    object CancelBitBtn: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object OleContainer1: TOleContainer
      Left = 112
      Top = -64
      Width = 129
      Height = 89
      Caption = 'OleContainer1'
      Color = clBtnFace
      TabOrder = 2
      Visible = False
    end
  end
  object OldqryPurchInv: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Invoice_Line.Supplier_Invoice,'
      '    Supplier_Invoice_Line.Invoice_Line_No,'
      '    Supplier_Invoice_Line.Purchase_Order,'
      '    Supplier_Invoice_Line.Line,'
      '    Customer.Name AS Customer_Name,'
      '    Purchase_OrderLine.Customers_Desc,'
      '    Sales_Invoice_Line.Qty_Invoiced AS Sales_Qty,'
      '    Sales_Invoice_Line.Goods_Value AS Sell_Price,'
      '    Sales_Invoice.Sales_Invoice_No,'
      '    Sales_Invoice.Invoice_Date AS Sales_Invoice_Date,'
      '    Supplier.Name AS Supplier_Name,'
      '    Supplier_Invoice.Supplier_Invoice_no,'
      '    Supplier_Invoice.Invoice_Date AS Supplier_Invoice_Date,'
      '    Supplier_Invoice_Line.Qty_Invoiced AS Purchase_Qty,'
      '    Supplier_Invoice_Line.Goods_Value AS Purchase_Price,'
      '    Rep.Name AS Rep_Name,'
      '    Cost_Unit.Price_Unit_Factor AS Cost_Unit_Factor,'
      '    Price_Unit.Price_Unit_Factor AS Price_Unit_Factor,'
      '    Purchase_Order.Date_Point'
      'FROM Purchase_Order'
      '    INNER JOIN (Rep'
      '    INNER JOIN ((Purchase_OrderLine'
      '    INNER JOIN (Price_Unit'
      '    INNER JOIN ((Customer'
      '    INNER JOIN Sales_Invoice ON'
      '      Customer.Customer = Sales_Invoice.Customer)'
      '    INNER JOIN Sales_Invoice_Line ON'
      
        '      Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Inv' +
        'oice) ON'
      '      Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) ON'
      '      (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Pu' +
        'rchase_Order))'
      '    INNER JOIN ((Supplier_Invoice'
      '    INNER JOIN Supplier ON'
      '      Supplier_Invoice.Supplier = Supplier.Supplier)'
      '    INNER JOIN (Price_Unit AS Cost_Unit'
      '    INNER JOIN Supplier_Invoice_Line ON'
      
        '      Cost_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit) O' +
        'N'
      
        '      Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Line.' +
        'Supplier_Invoice) ON'
      '      (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line' +
        '.Purchase_Order)) ON'
      '      Rep.Rep = Purchase_OrderLine.Rep) ON'
      
        '      Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchas' +
        'e_Order '
      ' ')
    Left = 216
    Top = 216
    object OldqryPurchInvSupplier_Invoice: TIntegerField
      FieldName = 'Supplier_Invoice'
    end
    object OldqryPurchInvInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object OldqryPurchInvPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object OldqryPurchInvLine: TIntegerField
      FieldName = 'Line'
    end
    object OldqryPurchInvCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object OldqryPurchInvCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object OldqryPurchInvSales_Qty: TFloatField
      FieldName = 'Sales_Qty'
    end
    object OldqryPurchInvSell_Price: TCurrencyField
      FieldName = 'Sell_Price'
    end
    object OldqryPurchInvSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object OldqryPurchInvSales_Invoice_Date: TDateTimeField
      FieldName = 'Sales_Invoice_Date'
    end
    object OldqryPurchInvSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object OldqryPurchInvSupplier_Invoice_no: TStringField
      FieldName = 'Supplier_Invoice_no'
      FixedChar = True
      Size = 40
    end
    object OldqryPurchInvSupplier_Invoice_Date: TDateTimeField
      FieldName = 'Supplier_Invoice_Date'
    end
    object OldqryPurchInvPurchase_Qty: TFloatField
      FieldName = 'Purchase_Qty'
    end
    object OldqryPurchInvPurchase_Price: TCurrencyField
      FieldName = 'Purchase_Price'
    end
    object OldqryPurchInvRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object OldqryPurchInvPOLine: TStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = OldqryPurchInvPOLineGetText
      Size = 15
      Calculated = True
    end
    object OldqryPurchInvTotal_sell: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_sell'
      OnGetText = OldqryPurchInvTotal_sellGetText
      Calculated = True
    end
    object OldqryPurchInvTotal_Purch: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Purch'
      OnGetText = OldqryPurchInvTotal_PurchGetText
      Calculated = True
    end
    object OldqryPurchInvCost_Unit_Factor: TFloatField
      FieldName = 'Cost_Unit_Factor'
    end
    object OldqryPurchInvPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object OldqryPurchInvDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
  end
  object dtsrcPurchInv: TDataSource
    DataSet = qryPurchInv
    Left = 112
    Top = 200
  end
  object qryPurchInv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_Order.Date_Point,'
      '        Customer.Name AS Customer_Name,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Quantity AS Sales_Qty,'
      '        Purchase_OrderLine.Selling_Price AS Sell_Price,'
      '        Purchase_OrderLine.Order_Price AS Purchase_Price,'
      '        Supplier_Invoice_Line.Qty_Invoiced AS Purchase_qty,'
      '        Supplier_Invoice_Line.Supplier_Invoice,'
      '        Supplier_Invoice_Line.Invoice_Line_No,'
      '        Supplier_Invoice_Line.Goods_Value as SP_Goods_Val,'
      '        Supplier_Invoice_Line.Qty_Invoiced as SP_Qty_Invoiced,'
      '        Sales_Invoice_Line.Goods_Value as SI_Goods_Val,'
      '        Sales_Invoice_Line.Qty_Invoiced as SI_Qty_Invoiced,'
      '        Supplier.Name AS Supplier_Name,'
      '        (select Sales_invoice_no'
      '          from Sales_invoice'
      
        '          where Sales_Invoice = Sales_invoice_Line.Sales_Invoice' +
        ') AS Sales_invoice_no,'
      '        (select Invoice_Date'
      '          from Sales_invoice'
      
        '          where Sales_Invoice = Sales_invoice_Line.Sales_Invoice' +
        ') AS Sales_invoice_date,'
      '        (select Supplier_invoice_no'
      '          from Supplier_invoice'
      
        '          where Supplier_Invoice = Supplier_invoice_Line.Supplie' +
        'r_Invoice) AS Supplier_invoice_no,'
      '        (select Invoice_Date'
      '          from Supplier_invoice'
      
        '          where Supplier_Invoice = Supplier_invoice_Line.Supplie' +
        'r_Invoice) AS Supplier_invoice_date,'
      '        (select Price_unit_factor'
      '          from Price_unit'
      
        '          where Price_Unit = Purchase_OrderLine.Sell_Unit) AS Pr' +
        'ice_Unit_Factor,'
      '        (select Price_unit_factor'
      '          from Price_unit'
      
        '          where Price_Unit = Purchase_OrderLine.Order_Unit) AS C' +
        'ost_Unit_Factor,'
      '        (select Price_unit_factor'
      '           from Price_unit'
      
        '           where Price_Unit = Supplier_Invoice_Line.Price_Unit) ' +
        'AS SP_Cost_Unit_Factor,'
      '        (select Price_unit_factor'
      '           from Price_unit'
      
        '           where Price_Unit = Sales_Invoice_Line.Price_Unit) AS ' +
        'SI_Cost_Unit_Factor,'
      '        Rep.Name as Rep_Name'
      'FROM Rep'
      '    INNER JOIN ((Supplier'
      '    INNER JOIN Purchase_Order ON'
      '      Supplier.Supplier = Purchase_Order.Supplier)'
      '    INNER JOIN (((Purchase_OrderLine'
      '    INNER JOIN Customer ON'
      '      Purchase_OrderLine.Customer = Customer.Customer)'
      '      LEFT JOIN Sales_Invoice_Line ON'
      '      (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Pu' +
        'rchase_Order))'
      '      LEFT JOIN Supplier_Invoice_Line ON'
      '      (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line' +
        '.Purchase_Order)) ON Purchase_Order.Purchase_Order = Purchase_Or' +
        'derLine.Purchase_Order) ON'
      '      Rep.Rep = Purchase_OrderLine.Rep'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 304
    Top = 209
    object qryPurchInvPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryPurchInvLine: TIntegerField
      FieldName = 'Line'
    end
    object qryPurchInvDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryPurchInvCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvSales_Qty: TFloatField
      FieldName = 'Sales_Qty'
    end
    object qryPurchInvSell_Price: TCurrencyField
      FieldName = 'Sell_Price'
    end
    object qryPurchInvPurchase_Price: TCurrencyField
      FieldName = 'Purchase_Price'
    end
    object qryPurchInvPurchase_qty: TFloatField
      FieldName = 'Purchase_qty'
    end
    object qryPurchInvSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvSales_invoice_no: TStringField
      FieldName = 'Sales_invoice_no'
      FixedChar = True
      Size = 30
    end
    object qryPurchInvSales_invoice_date: TDateTimeField
      FieldName = 'Sales_invoice_date'
    end
    object qryPurchInvSupplier_invoice_no: TStringField
      FieldName = 'Supplier_invoice_no'
      FixedChar = True
      Size = 40
    end
    object qryPurchInvSupplier_invoice_date: TDateTimeField
      FieldName = 'Supplier_invoice_date'
    end
    object qryPurchInvPOLine: TStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryPurchInvPOLineGetText
      Size = 15
      Calculated = True
    end
    object qryPurchInvTotal_sell: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_sell'
      OnGetText = qryPurchInvTotal_sellGetText
      Calculated = True
    end
    object qryPurchInvTotal_Purch: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Purch'
      OnGetText = qryPurchInvTotal_PurchGetText
      Calculated = True
    end
    object qryPurchInvRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryPurchInvCost_Unit_Factor: TFloatField
      FieldName = 'Cost_Unit_Factor'
    end
    object qryPurchInvSupplier_Invoice: TIntegerField
      FieldName = 'Supplier_Invoice'
    end
    object qryPurchInvInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qryPurchInvSP_Goods_Val: TCurrencyField
      FieldName = 'SP_Goods_Val'
    end
    object qryPurchInvSP_Qty_Invoiced: TFloatField
      FieldName = 'SP_Qty_Invoiced'
    end
    object qryPurchInvSI_Goods_Val: TFloatField
      FieldName = 'SI_Goods_Val'
    end
    object qryPurchInvSI_Qty_Invoiced: TFloatField
      FieldName = 'SI_Qty_Invoiced'
    end
    object qryPurchInvSP_Cost_Unit_Factor: TFloatField
      FieldName = 'SP_Cost_Unit_Factor'
    end
    object qryPurchInvSI_Cost_Unit_Factor: TFloatField
      FieldName = 'SI_Cost_Unit_Factor'
    end
  end
end
