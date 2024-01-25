object PBRSWorkIPfrm: TPBRSWorkIPfrm
  Left = 283
  Top = 87
  Caption = 'Work In Progress Report'
  ClientHeight = 461
  ClientWidth = 834
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 850
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object pnlControl: TPanel
    Left = 0
    Top = 401
    Width = 834
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      834
      41)
    object pnlRightControl: TPanel
      Left = 503
      Top = 0
      Width = 331
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        331
        41)
      object PreviewBitBtn: TBitBtn
        Left = 144
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Pre&view'
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
        OnClick = PreviewBitBtnClick
      end
      object PrintBitBtn: TBitBtn
        Left = 232
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Print'
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
        TabOrder = 1
        OnClick = PrintBitBtnClick
      end
      object btnExcel: TBitBtn
        Left = 56
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
        OnClick = btnExcelClick
      end
    end
    object CancelBitBtn: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Cancel'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlSelections: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 201
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object pnlDates: TPanel
      Left = 656
      Top = 0
      Width = 178
      Height = 201
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object chkbxPageBreak: TCheckBox
        Left = 17
        Top = 136
        Width = 145
        Height = 17
        Caption = 'Page break on total'
        Enabled = False
        TabOrder = 0
      end
      object TotByRadioGroup: TRadioGroup
        Left = 17
        Top = 4
        Width = 136
        Height = 113
        Caption = 'Report Totals'
        ItemIndex = 4
        Items.Strings = (
          'By Customer'
          'By Supplier'
          'By Rep'
          'By Account Manager'
          'Do not total')
        ParentBackground = False
        TabOrder = 1
        OnClick = TotByRadioGroupClick
      end
      object chkbxShowCosts: TCheckBox
        Left = 17
        Top = 173
        Width = 145
        Height = 17
        Caption = 'Hide cost/margin values'
        TabOrder = 2
      end
      object chkbxShowSales: TCheckBox
        Left = 17
        Top = 154
        Width = 145
        Height = 17
        Caption = 'Hide sales value'
        TabOrder = 3
        OnClick = chkbxShowSalesClick
      end
    end
    object Panel1: TPanel
      Left = 459
      Top = 0
      Width = 197
      Height = 201
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 19
        Top = 3
        Width = 93
        Height = 13
        Caption = 'Delivery due after:'
      end
      object DateFromButton: TSpeedButton
        Left = 124
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
        Left = 19
        Top = 48
        Width = 103
        Height = 13
        Caption = 'Delivery due before:'
      end
      object DateToButton: TSpeedButton
        Left = 124
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
      object DateFromEdit: TEdit
        Left = 19
        Top = 16
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 0
        OnExit = DateFromEditExit
      end
      object DateToEdit: TEdit
        Left = 19
        Top = 61
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 1
        OnExit = DateToEditExit
      end
      object chkbxExcludeInvCallOff: TCheckBox
        Left = 19
        Top = 119
        Width = 182
        Height = 17
        Caption = 'Exclude Inv On Call Off'
        TabOrder = 2
        OnClick = ExcOnHoldCheckBoxClick
      end
      object ExcOnHoldCheckBox: TCheckBox
        Left = 19
        Top = 137
        Width = 182
        Height = 17
        Caption = 'Exclude on hold items'
        TabOrder = 3
        OnClick = ExcOnHoldCheckBoxClick
      end
      object chkbxIncludeJB: TCheckBox
        Left = 19
        Top = 154
        Width = 182
        Height = 17
        Caption = 'Include orders in Job bags'
        TabOrder = 4
        OnClick = chkbxIncludeJBClick
      end
      object chkbxincludezero: TCheckBox
        Left = 19
        Top = 173
        Width = 182
        Height = 17
        Hint = 'Show zero sales values for confirmed deliveries'
        Caption = 'Include zero sales values'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = chkbxIncludeJBClick
      end
      object chkbxExcludeDelivered: TCheckBox
        Left = 19
        Top = 101
        Width = 182
        Height = 17
        Caption = 'Exclude Fully Delivered Orders'
        TabOrder = 6
        OnClick = ExcOnHoldCheckBoxClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 459
      Height = 201
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 152
        Width = 59
        Height = 13
        Caption = 'Sort first by'
      end
      object Label4: TLabel
        Left = 160
        Top = 152
        Width = 62
        Height = 13
        Caption = 'then sort by'
      end
      object Label5: TLabel
        Left = 312
        Top = 152
        Width = 92
        Height = 13
        Caption = 'and finally sort by'
      end
      object rgSupplier: TRadioGroup
        Left = 8
        Top = 1
        Width = 100
        Height = 58
        Caption = ' By supplier '
        ItemIndex = 0
        Items.Strings = (
          'All Suppliers'
          'One Supplier')
        ParentBackground = False
        TabOrder = 0
        OnClick = rgSupplierClick
      end
      object rgCustomer: TRadioGroup
        Left = 8
        Top = 63
        Width = 100
        Height = 60
        Caption = ' By customer '
        ItemIndex = 0
        Items.Strings = (
          'All Customers'
          'One Customer')
        ParentBackground = False
        TabOrder = 1
        OnClick = rgCustomerClick
      end
      object SupplierPanel: TPanel
        Left = 113
        Top = 6
        Width = 336
        Height = 49
        ParentBackground = False
        TabOrder = 2
        object lblSupplier: TLabel
          Left = 8
          Top = 4
          Width = 82
          Height = 13
          Caption = 'Supplier/Branch'
        end
        object edtSupplier: TEdit
          Left = 8
          Top = 20
          Width = 273
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object btnSupplier: TButton
          Left = 296
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
          OnClick = btnSupplierClick
        end
      end
      object CustomerPanel: TPanel
        Left = 115
        Top = 68
        Width = 334
        Height = 57
        ParentBackground = False
        TabOrder = 3
        object lblCustomer: TLabel
          Left = 8
          Top = 1
          Width = 88
          Height = 13
          Caption = 'Customer/Branch'
        end
        object edtCustomer: TEdit
          Left = 8
          Top = 17
          Width = 273
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object btnCustomer: TButton
          Left = 296
          Top = 16
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
        object chkbxBranches: TCheckBox
          Left = 8
          Top = 38
          Width = 193
          Height = 17
          Caption = 'Report on all branches'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object cbSort1: TComboBox
        Left = 8
        Top = 168
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnChange = cbSortChange
        Items.Strings = (
          'Customer'
          'Supplier'
          'Order Number'
          'Order Date'
          'Delivery Date'
          'Rep')
      end
      object cbSort2: TComboBox
        Left = 160
        Top = 168
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        OnChange = cbSortChange
        Items.Strings = (
          'Customer'
          'Supplier'
          'Order Number'
          'Order Date'
          'Delivery Date'
          'Rep')
      end
      object cbSort3: TComboBox
        Left = 312
        Top = 168
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnChange = cbSortChange
        Items.Strings = (
          'Customer'
          'Supplier'
          'Order Number'
          'Order Date'
          'Delivery Date'
          'Rep')
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 442
    Width = 834
    Height = 19
    Panels = <>
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 201
    Width = 834
    Height = 200
    Align = alClient
    DataSource = dsReport
    DrawingStyle = gdsGradient
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'POLine'
        Title.Caption = 'Order'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Customer Name'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customers_Desc'
        Title.Caption = 'Form Title'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivery_Date'
        Title.Caption = 'Delivery Date'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Deliv_Actual'
        Title.Caption = 'Date Delivered'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Code'
        Title.Caption = 'Supplier'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_Order_No'
        Title.Caption = 'Order Ref'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Order Date'
        Width = 77
        Visible = True
      end>
  end
  object pnlExportPrgrss: TPanel
    Left = 250
    Top = 212
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 4
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
  object OleContainer1: TOleContainer
    Left = 306
    Top = 240
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 5
    Visible = False
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order, '
      #9'Delivery_Detail.Line, '
      #9'Delivery_Detail.Delivery_no, '
      #9'Purchase_OrderLine.Cust_Order_No, '
      #9'Delivery_Detail.Date_Point AS Delivery_Date, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Purchase_OrderLine.Purch_Ord_Line_Status, '
      #9'Purchase_OrderLine.Proof_Required, '
      #9'Purchase_OrderLine.Goods_Required, '
      #9'Purchase_OrderLine.Customers_Desc, '
      #9'Purchase_OrderLine.On_Hold,'
      '                Purchase_OrderLine.Quantity,'
      #9'Purchase_Order.Date_Point, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Customer.Name, Supplier_Branch.Account_Code, '
      #9'Rep.Name AS Rep_Name, '
      #9'Purchase_OrderLine.Rep, '
      #9'Delivery_Detail.Qty_to_Deliver, '
      #9'Delivery_Detail.Qty_Delivered, '
      #9'Purchase_OrderLine.Selling_Price, '
      #9'Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit '
      #9'INNER JOIN (Rep '
      #9'INNER JOIN ((Customer '
      #9'INNER JOIN Customer_Branch ON '
      #9#9'Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN ((Purchase_OrderLine '
      #9'LEFT JOIN Form_Reference ON '
      
        #9#9'Purchase_OrderLine.Form_Reference = Form_Reference.Form_Refere' +
        'nce)'
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Delivery_Detail '
      #9'INNER JOIN Purchase_Order ON '
      
        #9#9'Delivery_Detail.Purchase_Order = Purchase_Order.Purchase_Order' +
        ') ON '
      #9#9'(Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND '
      #9#9'(Supplier_Branch.Supplier = Purchase_Order.Supplier)) ON '
      
        #9#9'(Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_O' +
        'rder) AND '
      #9#9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9#9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_' +
        'Order)) ON '
      
        #9#9'(Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) AND' +
        ' '
      #9#9'(Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON '
      #9#9'Rep.Rep = Purchase_OrderLine.Rep) ON '
      #9#9'Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit'
      'WHERE (Purchase_OrderLine.Purch_Ord_Line_Status>=20) And '
      #9'(Purchase_OrderLine.Purch_Ord_Line_Status <= 24) and'
      '    (not((Delivery_to_Stock = '#39'Y'#39') and'
      '    (Delivery_Detail.Date_deliv_actual is not null)) and'
      '    ((Purchase_orderline.Inactive <> '#39'Y'#39') or'
      '    (Purchase_orderline.Inactive is null)))')
    Left = 512
    Top = 32
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object qryReportGoods_Required: TDateTimeField
      FieldName = 'Goods_Required'
    end
    object qryReportPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryReportProof_Required: TStringField
      FieldName = 'Proof_Required'
      FixedChar = True
      Size = 2
    end
    object qryReportCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 16
    end
    object qryReportName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qryReportAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qryReportPOLine: TStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryReportPOLineGetText
      Calculated = True
    end
    object qryReportDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryReportDelivery_Date: TDateTimeField
      FieldName = 'Delivery_Date'
    end
    object qryReportDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryReportOn_Hold: TStringField
      FieldName = 'On_Hold'
      FixedChar = True
      Size = 2
    end
    object qryReportQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryReportRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryReportQty_to_Deliver: TFloatField
      FieldName = 'Qty_to_Deliver'
    end
    object qryReportQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryReportSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryReportPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryReportProduct_Type_Description: TStringField
      FieldName = 'Product_Type_Description'
      Size = 50
    end
    object qryReportProduct_Type_Short_Desc: TStringField
      FieldName = 'Product_Type_Short_Desc'
    end
    object qryReportProduct_Type_Sales_Nominal: TStringField
      FieldName = 'Product_Type_Sales_Nominal'
    end
  end
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qryReport
    Left = 464
    Top = 32
  end
  object qryRepName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Rep.Name'
      'From Rep'
      'Where (Rep.Rep = :sel_rep)'
      ' ')
    Left = 384
    Top = 208
    ParamData = <
      item
        Name = 'sel_rep'
      end>
  end
end
