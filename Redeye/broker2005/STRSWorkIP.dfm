object STRSWorkIPfrm: TSTRSWorkIPfrm
  Left = 16
  Top = 43
  AutoScroll = False
  Caption = 'Work In Progress'
  ClientHeight = 489
  ClientWidth = 760
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 768
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
  object pnlControl: TPanel
    Left = 0
    Top = 448
    Width = 760
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object pnlRightControl: TPanel
      Left = 429
      Top = 0
      Width = 331
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        331
        41)
      object PreviewBitBtn: TBitBtn
        Left = 160
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Pre&view'
        TabOrder = 0
        OnClick = PreviewBitBtnClick
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
      object PrintBitBtn: TBitBtn
        Left = 248
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Print'
        TabOrder = 1
        OnClick = PrintBitBtnClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object ExcelBitBtn: TBitBtn
        Left = 72
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Excel'
        TabOrder = 2
        OnClick = ExcelBitBtnClick
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
    object CancelBitBtn: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 177
    Width = 760
    Height = 271
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 760
      Height = 271
      Align = alClient
      DataSource = dsReport
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Width = 204
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sales_Order'
          Title.Caption = 'Order No.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Required'
          Title.Caption = 'Date Req'#39'd'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Ordered'
          Title.Caption = 'Order Date'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cust_Order_No'
          Title.Caption = 'Cust. Ord. No.'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty_Outstanding'
          Title.Caption = 'Qty Outstanding'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sell_Pack_Quantity'
          Title.Caption = 'Pack Size'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantity_Ordered'
          Title.Caption = 'Order Qty'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantity_Delivered'
          Title.Caption = 'Qty Deliv'#39'd'
          Visible = True
        end>
    end
    object pnlExportPrgrss: TPanel
      Left = 228
      Top = 36
      Width = 289
      Height = 61
      TabOrder = 1
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
    object OleContainer1: TOleContainer
      Left = 360
      Top = 32
      Width = 129
      Height = 89
      Caption = 'OleContainer1'
      Color = clBtnFace
      TabOrder = 2
      Visible = False
    end
  end
  object pnlSelections: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 52
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 160
      Top = 128
      Width = 55
      Height = 13
      Caption = 'then sort by'
    end
    object Label5: TLabel
      Left = 312
      Top = 128
      Width = 81
      Height = 13
      Caption = 'and finally sort by'
    end
    object Label1: TLabel
      Left = 439
      Top = 3
      Width = 69
      Height = 13
      Caption = 'Ordered since:'
    end
    object DateFromButton: TSpeedButton
      Left = 552
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
      OnClick = DateFromButtonClick
    end
    object Label2: TLabel
      Left = 439
      Top = 48
      Width = 95
      Height = 13
      Caption = 'Delivery due before:'
    end
    object DateToButton: TSpeedButton
      Left = 552
      Top = 59
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
    object rgRep: TRadioGroup
      Left = 8
      Top = 1
      Width = 100
      Height = 58
      Caption = ' By Rep'
      ItemIndex = 0
      Items.Strings = (
        'All Reps'
        'One Rep')
      TabOrder = 0
      OnClick = rgRepClick
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 63
      Width = 100
      Height = 58
      Caption = ' By customer '
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      TabOrder = 1
      OnClick = rgCustomerClick
    end
    object RepPanel: TPanel
      Left = 113
      Top = 6
      Width = 281
      Height = 49
      TabOrder = 2
      object lblSupplier: TLabel
        Left = 8
        Top = 4
        Width = 20
        Height = 13
        Caption = 'Rep'
      end
      object edtRep: TEdit
        Left = 8
        Top = 20
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnRep: TButton
        Left = 248
        Top = 19
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnRepClick
      end
    end
    object CustomerPanel: TPanel
      Left = 115
      Top = 68
      Width = 281
      Height = 49
      TabOrder = 3
      object lblCustomer: TLabel
        Left = 8
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Customer/Branch'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 20
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 248
        Top = 19
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cbSortChange
      Items.Strings = (
        'Customer'
        'Order Number'
        'Order Date'
        'Delivery Date'
        ' ')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnChange = cbSortChange
      Items.Strings = (
        'Customer'
        'Order Number'
        'Order Date'
        'Delivery Date'
        ' ')
    end
    object cbSort3: TComboBox
      Left = 312
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = cbSortChange
      Items.Strings = (
        'Customer'
        'Order Number'
        'Order Date'
        'Delivery Date'
        ' ')
    end
    object pnlDates: TPanel
      Left = 582
      Top = 0
      Width = 178
      Height = 177
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 7
      object chkbxPageBreak: TCheckBox
        Left = 33
        Top = 96
        Width = 145
        Height = 17
        Caption = 'Page break on total'
        Enabled = False
        TabOrder = 0
        OnClick = chkbxPageBreakClick
      end
      object TotByRadioGroup: TRadioGroup
        Left = 33
        Top = 8
        Width = 105
        Height = 73
        Caption = 'Report Totals'
        ItemIndex = 2
        Items.Strings = (
          'By Customer'
          'By Rep'
          'Do not total')
        TabOrder = 1
        OnClick = TotByRadioGroupClick
      end
    end
    object DateFromEdit: TEdit
      Left = 439
      Top = 16
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 8
      OnExit = DateFromEditExit
    end
    object DateToEdit: TEdit
      Left = 439
      Top = 61
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 9
      OnExit = DateToEditExit
    end
  end
  object qryReport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Sales_Order.*, Customer.Name, Sales_Order_line.Part,'
      
        'Sales_Order_line.Sell_pack_Quantity, Sales_Order_line.Quantity_O' +
        'rdered, Sales_order_Line.Purch_Pack_Quantity,'
      'Sales_Order_line.Quantity_Delivered,'
      
        '(Sales_order_Line.Quantity_Ordered-Sales_Order_Line.Quantity_Del' +
        'ivered) AS Qty_Outstanding,'
      
        'Rep.Name AS Rep_Name, Part.Part_Description, Sales_Order_line.Pa' +
        'rt_Cost,'
      'Sales_Order_line.Part_Sales_Price'
      
        'FROM Part INNER JOIN ((((Sales_Order INNER JOIN Customer_Branch ' +
        'ON'
      '(Sales_Order.Branch_no = Customer_Branch.Branch_no) AND'
      
        '(Sales_Order.Customer = Customer_Branch.Customer)) INNER JOIN Cu' +
        'stomer ON'
      
        'Sales_Order.Customer = Customer.Customer) INNER JOIN Sales_Order' +
        '_line ON'
      'Sales_Order.Sales_Order = Sales_Order_line.Sales_Order)'
      
        'LEFT JOIN (Rep RIGHT JOIN Sales_OrderRep ON Rep.Rep = Sales_Orde' +
        'rRep.Rep) ON'
      'Sales_Order.Sales_Order = Sales_OrderRep.Sales_Order) ON'
      'Part.Part = Sales_Order_line.Part'
      
        'WHERE (((Sales_Order_line.Quantity_Delivered) < Sales_Order_Line' +
        '.Quantity_Ordered))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 408
    Top = 48
    object qryReportSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qryReportOffice_Contact: TIntegerField
      FieldName = 'Office_Contact'
    end
    object qryReportOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryReportDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryReportDate_Ordered: TDateTimeField
      FieldName = 'Date_Ordered'
    end
    object qryReportCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 80
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryReportContact_no: TIntegerField
      FieldName = 'Contact_no'
    end
    object qryReportCost_Centre: TStringField
      FieldName = 'Cost_Centre'
      FixedChar = True
    end
    object qryReportCustomer0: TIntegerField
      FieldName = 'Customer0'
    end
    object qryReportOrder_Type: TStringField
      FieldName = 'Order_Type'
      FixedChar = True
      Size = 2
    end
    object qryReportSales_order_Head_Status: TIntegerField
      FieldName = 'Sales_order_Head_Status'
    end
    object qryReportNarrative: TIntegerField
      FieldName = 'Narrative'
    end
    object qryReportPart_Store: TIntegerField
      FieldName = 'Part_Store'
    end
    object qryReportDelivery_Customer: TIntegerField
      FieldName = 'Delivery_Customer'
    end
    object qryReportDelivery_Branch: TIntegerField
      FieldName = 'Delivery_Branch'
    end
    object qryReportDiscount: TFloatField
      FieldName = 'Discount'
    end
    object qryReportAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object qryReportDelivery_Notes: TStringField
      FieldName = 'Delivery_Notes'
      FixedChar = True
      Size = 200
    end
    object qryReportReplenish_Source: TIntegerField
      FieldName = 'Replenish_Source'
    end
    object qryReportSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryReportBranch_no0: TIntegerField
      FieldName = 'Branch_no0'
    end
    object qryReportSupp_order_type: TStringField
      FieldName = 'Supp_order_type'
      FixedChar = True
      Size = 8
    end
    object qryReportName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qryReportPart: TStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object qryReportSell_Pack_Quantity: TIntegerField
      FieldName = 'Sell_Pack_Quantity'
    end
    object qryReportQuantity_Ordered: TIntegerField
      FieldName = 'Quantity_Ordered'
    end
    object qryReportQuantity_Delivered: TIntegerField
      FieldName = 'Quantity_Delivered'
    end
    object qryReportQty_Outstanding: TIntegerField
      FieldName = 'Qty_Outstanding'
    end
    object qryReportPurch_Pack_Quantity: TIntegerField
      FieldName = 'Purch_Pack_Quantity'
    end
    object qryReportRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportPart_Description: TStringField
      FieldName = 'Part_Description'
      FixedChar = True
      Size = 100
    end
    object qryReportPart_Cost: TCurrencyField
      FieldName = 'Part_Cost'
    end
    object qryReportPart_Sales_Price: TCurrencyField
      FieldName = 'Part_Sales_Price'
    end
  end
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qryReport
    Left = 400
    Top = 88
  end
end
