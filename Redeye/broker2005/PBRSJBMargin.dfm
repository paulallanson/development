object PBRSJBMarginfrm: TPBRSJBMarginfrm
  Left = 77
  Top = 88
  Caption = 'Job Bag Margin Report'
  ClientHeight = 489
  ClientWidth = 801
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 750
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 470
    Width = 801
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
    Left = 0
    Top = 429
    Width = 801
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      801
      41)
    object btnCancel: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancel'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnPreview: TBitBtn
      Left = 620
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
      TabOrder = 1
      OnClick = btnPreviewClick
    end
    object btnPrint: TBitBtn
      Left = 707
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnExcel: TBitBtn
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
      TabOrder = 3
      OnClick = btnExcelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 137
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object lblDateFrom: TLabel
      Left = 424
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Date From:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnDatefrom: TSpeedButton
      Left = 512
      Top = 24
      Width = 25
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      OnClick = btnDatefromClick
    end
    object lblDateto: TLabel
      Left = 424
      Top = 58
      Width = 42
      Height = 13
      Caption = 'Date To:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnDateTo: TSpeedButton
      Left = 512
      Top = 72
      Width = 25
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      OnClick = btnDateToClick
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 1
      Width = 113
      Height = 65
      Caption = 'By Customer'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object CustomerPanel: TPanel
      Left = 129
      Top = 12
      Width = 281
      Height = 49
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lblCustomer: TLabel
        Left = 8
        Top = 4
        Width = 88
        Height = 13
        Caption = 'Customer/Branch'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
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
    object rgSupplier: TRadioGroup
      Left = 8
      Top = 67
      Width = 113
      Height = 58
      Caption = ' By supplier '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'All Suppliers'
        'One Supplier')
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = rgSupplierClick
    end
    object SupplierPanel: TPanel
      Left = 129
      Top = 72
      Width = 281
      Height = 49
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
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
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnSupplier: TButton
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
        OnClick = btnSupplierClick
      end
    end
    object Panel3: TPanel
      Left = 532
      Top = 1
      Width = 268
      Height = 135
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      object chkbxPageBreak: TCheckBox
        Left = 140
        Top = 104
        Width = 125
        Height = 17
        Caption = 'Page break by total'
        Enabled = False
        TabOrder = 0
        WordWrap = True
      end
      object RdGrpRepType: TRadioGroup
        Left = 140
        Top = 8
        Width = 101
        Height = 57
        Caption = 'Report Type'
        ItemIndex = 0
        Items.Strings = (
          'Summary'
          'Detail')
        ParentBackground = False
        TabOrder = 1
      end
      object TotByRadioGroup: TRadioGroup
        Left = 1
        Top = 8
        Width = 132
        Height = 121
        Caption = 'Report Totals'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 4
        Items.Strings = (
          'By Customer'
          'By Supplier'
          'By Rep'
          'By Account Manager'
          'Do not total')
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = TotByRadioGroupClick
      end
      object chkbxInvoicedValues: TCheckBox
        Left = 140
        Top = 70
        Width = 125
        Height = 17
        Caption = 'Actual invoice values'
        TabOrder = 3
        WordWrap = True
      end
    end
    object edtDateFrom: TEdit
      Left = 424
      Top = 24
      Width = 81
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
      OnExit = edtDateFromExit
    end
    object edtDateTo: TEdit
      Left = 424
      Top = 74
      Width = 81
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
      OnExit = edtDateToExit
    end
  end
  object dbgJobBag: TDBGrid
    Left = 0
    Top = 137
    Width = 801
    Height = 292
    Align = alClient
    DataSource = dsReport
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Job_Bag'
        Title.Caption = 'Job Bag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 188
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Purchase_Order'
        Title.Caption = 'P.Order'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Line_Descr'
        Title.Caption = 'Description'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Line_Cost'
        Title.Caption = 'Cost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Line_Sell'
        Title.Caption = 'Sell'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Quantity'
        Title.Caption = 'Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 246
        Visible = True
      end>
  end
  object OleContainer1: TOleContainer
    Left = 368
    Top = 216
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 4
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 276
    Top = 228
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 5
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
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Line_Dets.Job_Bag,'
      '  Job_Bag_Line_Dets.Job_Bag_Line,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '  Customer.Name AS Customer_Name,'
      '  Supplier.Name AS Supplier_Name,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '  Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '  Job_Bag_Line_Dets.VAT_Code,'
      '  Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '  Job_Bag_Line_Dets.Purchase_Order,'
      '  Job_Bag.Cust_Order_No,'
      '  Rep.Rep,'
      '  Rep.Name AS Rep_Name,'
      '  Vat_Code.Vat_Rate,'
      '  Job_Bag.Date_Point,'
      '  Job_Bag.Customer,'
      '  Job_Bag.Branch_No,'
      '  Customer_Branch.Name AS Customer_Branch_Name,'
      '  Job_Bag_Line_Dets.Supplier,'
      '  Job_Bag_Line_Dets.Branch_No AS Supplier_Branch_no,'
      '  Supplier_Branch.Name AS Supplier_Branch_Name,'
      '  Purchase_OrderLine.Inactive,'
      '  Job_Bag.Job_Bag_Descr,'
      '  Job_Bag.Office_Contact,'
      '  Job_Bag.Goods_Required'
      'FROM Purchase_OrderLine'
      '  RIGHT JOIN (Vat_Code'
      '  INNER JOIN ((Supplier'
      '  INNER JOIN Supplier_Branch ON'
      '   Supplier.Supplier = Supplier_Branch.Supplier)'
      '  INNER JOIN (Customer'
      '  INNER JOIN ((Rep'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN Job_Bag ON'
      '   (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND'
      '   (Customer_Branch.Customer = Job_Bag.Customer)) ON'
      '    Rep.Rep = Job_Bag.Rep)'
      '  INNER JOIN Job_Bag_Line_Dets ON'
      '    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON'
      '    Customer.Customer = Customer_Branch.Customer) ON'
      
        '    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AN' +
        'D'
      '    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) ON'
      '    Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) ON'
      '    (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purch' +
        'ase_Order)'
      'WHERE ((Purchase_orderLine.InActive <> '#39'Y'#39') or'
      '       (Purchase_orderLine.Inactive is NULL))'
      ' ')
    Left = 416
    Top = 248
    object qryReportJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryReportJob_Bag_Line: TIntegerField
      FieldName = 'Job_Bag_Line'
    end
    object qryReportJob_Bag_Line_Descr: TWideStringField
      FieldName = 'Job_Bag_Line_Descr'
      FixedChar = True
      Size = 80
    end
    object qryReportCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportJob_Bag_Line_Cost: TCurrencyField
      FieldName = 'Job_Bag_Line_Cost'
    end
    object qryReportJob_Bag_Line_Sell: TCurrencyField
      FieldName = 'Job_Bag_Line_Sell'
    end
    object qryReportJob_Bag_Quantity: TIntegerField
      FieldName = 'Job_Bag_Quantity'
    end
    object qryReportVAT_Code: TIntegerField
      FieldName = 'VAT_Code'
    end
    object qryReportJob_Bag_Line_Type: TWideStringField
      FieldName = 'Job_Bag_Line_Type'
      FixedChar = True
      Size = 2
    end
    object qryReportCust_Order_No: TWideStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 80
    end
    object qryReportRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryReportRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryReportCustomer_Branch_Name: TWideStringField
      FieldName = 'Customer_Branch_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryReportSupplier_Branch_no: TIntegerField
      FieldName = 'Supplier_Branch_no'
    end
    object qryReportSupplier_Branch_Name: TWideStringField
      FieldName = 'Supplier_Branch_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportInactive: TWideStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object qryReportJob_Bag_Descr: TWideStringField
      FieldName = 'Job_Bag_Descr'
      FixedChar = True
      Size = 160
    end
    object qryReportAnalysis_Code_1: TWideStringField
      FieldName = 'Analysis_Code_1'
    end
    object qryReportAnalysis_Code_2: TWideStringField
      FieldName = 'Analysis_Code_2'
    end
  end
  object dsReport: TDataSource
    DataSet = qryReport
    Left = 328
    Top = 248
  end
  object oldqryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '        Customer.Name as Customer_Name,'
      '        Supplier.Name as Supplier_Name,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '        Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '        Job_Bag_Line_Dets.VAT_Code,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Job_Bag.Cust_Order_No,'
      '        Rep.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Vat_Code.Vat_Rate,'
      '        Job_Bag.Date_Point,'
      '        Job_Bag.Customer,'
      '        Job_Bag.Branch_no,'
      '        Customer_Branch.Name as Customer_Branch_Name,'
      '        Job_Bag_Line_Dets.Supplier,'
      '        Job_Bag_Line_Dets.Branch_no as Supplier_Branch_no,'
      '        Supplier_Branch.Name as Supplier_Branch_Name'
      'FROM Vat_Code'
      '  INNER JOIN (Rep'
      '  INNER JOIN (Supplier'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Customer'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Job_Bag'
      '  INNER JOIN Job_Bag_Line_Dets ON'
      '    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON'
      '    (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND'
      '    (Customer_Branch.Customer = Job_Bag.Customer)) ON'
      '    Customer.Customer = Customer_Branch.Customer) ON'
      
        '    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AN' +
        'D'
      '    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) ON'
      '    Supplier.Supplier = Supplier_Branch.Supplier) ON'
      '    Rep.Rep = Job_Bag.Rep) ON'
      '    Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code')
    Left = 520
    Top = 248
  end
end
