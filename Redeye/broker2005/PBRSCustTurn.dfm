object PBRSCustTurnFrm: TPBRSCustTurnFrm
  Left = 297
  Top = 202
  BorderStyle = bsDialog
  Caption = 'Customer Turnover selection'
  ClientHeight = 301
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    484
    301)
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 235
    Width = 36
    Height = 13
    Caption = 'Sort by'
  end
  object GroupBox1: TGroupBox
    Left = 256
    Top = 168
    Width = 115
    Height = 65
    Caption = 'No. of Customers '
    ParentBackground = False
    TabOrder = 7
  end
  object GrpBxDts: TGroupBox
    Left = 16
    Top = 96
    Width = 217
    Height = 137
    Caption = 'Selected Invoice Dates'
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 66
      Width = 81
      Height = 13
      Caption = 'To Invoice Date:'
    end
    object DateToButton: TSpeedButton
      Left = 119
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
    object Label1: TLabel
      Left = 16
      Top = 23
      Width = 95
      Height = 13
      Caption = 'From Invoice Date:'
    end
    object DateFromButton: TSpeedButton
      Left = 119
      Top = 39
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
    object DateToEdit: TEdit
      Left = 15
      Top = 82
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 1
      OnExit = DateToEditExit
    end
    object DateFromEdit: TEdit
      Left = 15
      Top = 39
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 0
      OnExit = DateFromEditExit
    end
  end
  object PrintBitBtn: TBitBtn
    Left = 408
    Top = 280
    Width = 75
    Height = 25
    Caption = '&Print'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 1
    OnClick = PrintBitBtnClick
  end
  object TotByRadioGroup: TRadioGroup
    Left = 256
    Top = 96
    Width = 115
    Height = 65
    Caption = 'Report Totals'
    ItemIndex = 1
    Items.Strings = (
      'Ascending'
      'Descending')
    ParentBackground = False
    TabOrder = 2
  end
  object cbSort1: TComboBox
    Left = 24
    Top = 249
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Items.Strings = (
      'Total Sales'
      'Total Cost'
      'Total Profit'
      'Profit %'
      'Name')
  end
  object PreviewReportBitBtn: TBitBtn
    Left = 326
    Top = 280
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
    TabOrder = 4
    OnClick = PreviewReportBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 22
    Top = 280
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object NoofCustSpin: TSpinEdit
    Tag = 108
    Left = 278
    Top = 192
    Width = 50
    Height = 22
    MaxValue = 99999
    MinValue = 0
    TabOrder = 6
    Value = 0
  end
  object chkbxExcludeCosts: TCheckBox
    Left = 200
    Top = 256
    Width = 185
    Height = 17
    Caption = 'exclude printing costs && profit'
    TabOrder = 8
  end
  object rgRep: TRadioGroup
    Left = 16
    Top = 16
    Width = 129
    Height = 65
    Caption = 'Selection'
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    ParentBackground = False
    TabOrder = 9
    OnClick = rgRepClick
  end
  object pnlRep: TPanel
    Left = 158
    Top = 24
    Width = 329
    Height = 57
    ParentBackground = False
    TabOrder = 10
    Visible = False
    object lblCustBran: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Rep Name'
    end
    object edtRep: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnRep: TButton
      Left = 288
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
      OnClick = btnRepClick
    end
  end
  object btnExcel: TBitBtn
    Left = 228
    Top = 280
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
    TabOrder = 11
    OnClick = btnExcelClick
  end
  object OleContainer1: TOleContainer
    Left = 232
    Top = 104
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 12
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 84
    Top = 132
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 13
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
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 208
    Top = 12
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 216
    Top = 44
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.00, 0.00, 0.00, 0.00,:Text100)'
      ''
      ' '
      ' ')
    Left = 224
    Top = 76
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object AddIntSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, text100)'
      'Values'
      '(:Int_Sel_Code, :Sel1, :Sel2, :Sel3, :Sel4,:Text100)'
      ''
      ''
      ''
      ''
      ''
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
    Left = 224
    Top = 104
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
        DataType = ftFloat
      end
      item
        Name = 'Sel2'
      end
      item
        Name = 'Sel3'
      end
      item
        Name = 'Sel4'
      end
      item
        Name = 'Text100'
      end>
  end
  object qrySalesByInv: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer,'
      #9'Sales_Invoice.Sales_Invoice,'
      #9'Sales_Invoice.Goods_Value,'
      #9'Sales_Invoice.Invoice_or_Credit,'
      '  '#9'Sales_Invoice.Sales_Invoice_type,'
      '  Sales_Invoice.Branch_No,'
      #9'Sales_Invoice.Reference'
      'FROM (Sales_Invoice'
      #9'INNER JOIN Sales_Invoice_Line ON'
      
        #9#9'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice' +
        ')'
      ' '
      ' '
      ' '
      ' ')
    Left = 136
    Top = 8
    object qrySalesByInvCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesByInvSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesByInvGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object qrySalesByInvInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesByInvSales_Invoice_type: TWideStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesByInvReference: TWideStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesByInvBranch_No: TIntegerField
      FieldName = 'Branch_No'
    end
  end
  object GetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '  Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor as O' +
        'rder_Unit_Factor'
      
        'FROM Price_Unit INNER JOIN (Purchase_OrderLine INNER JOIN (Sales' +
        '_Invoice'
      
        '  INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice =' +
        ' Sales_Invoice_Line.Sales_Invoice) ON (Purchase_OrderLine.Line =' +
        ' Sales_Invoice_Line.Line) AND (Purchase_OrderLine.Purchase_Order' +
        ' = Sales_Invoice_Line.Purchase_Order)) ON (Price_Unit.Price_Unit' +
        ' = Purchase_OrderLine.Order_Unit)'
      '  WHERE (((Sales_Invoice.Sales_Invoice)=:Invoice_No));'
      ''
      ' '
      ''
      ' '
      ' '
      ''
      ' '
      ' ')
    Left = 48
    Top = 120
    ParamData = <
      item
        Name = 'invoice_no'
      end>
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 80
    Top = 118
    ParamData = <
      item
        Name = 'PurchOrder'
        DataType = ftFloat
      end>
  end
  object qryGetPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_ord_no, '
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      'from Sales_invoice_line, Sales_order, Purch_Ord, Purch_Ord_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '(Sales_Invoice_Line.Sales_order = Sales_Order.Sales_order) and'
      '(Sales_Order.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_Invoice_Line.Sales_ord' +
        'er_Line_no)'
      ')'
      'Group By'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_Ord_no'
      ' ')
    Left = 112
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetSOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Part_Cost*((Sales_invoice_line.Qty_Invoiced*1.0000)/(' +
        'Purch_Pack_Quantity*1.0000))) as Total_Cost'
      'from Sales_Order_Line, Sales_invoice_line'
      'where Sales_invoice_line.Sales_Order = :Sales_Order and'
      'Sales_invoice_line.Sales_invoice = :Sales_invoice and'
      '('
      
        '(Sales_invoice_line.Sales_order = Sales_order_line.sales_order) ' +
        'and'
      
        '(Sales_invoice_line.Sales_order_line_no = Sales_order_line.Sales' +
        '_order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 96
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryAddPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Cost'
      'from Purch_Ord_add_charge'
      '  where (Purch_Ord_Add_Charge.Purch_Ord = :Purch_Ord) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 176
    Top = 118
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Sum(Amount)'
      '         from Purch_ord_line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Sales_Inv' +
        'oice_Line.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Sales_Invoice_Line.' +
        'Line) as Extra_Cost'
      'FROM Price_Unit'
      '     RIGHT JOIN (Purchase_OrderLine'
      '     RIGHT JOIN (Job_Bag_Line_Dets'
      '     INNER JOIN Sales_Invoice_Line ON'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line) AND'
      
        '        (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_Bag)' +
        ') ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'WHERE Sales_Invoice = :Sales_Invoice'
      ' '
      ' ')
    Left = 208
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object SQLUpdIntSel: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Int_Sel'
      'set Sel4 = Sel4 + :Sel4,'
      '  Sel3 = Sel3 + :Sel3'
      
        'where (Int_Sel_Code = :Int_Sel_Code) and (Sel1 = :Sel1) and (Sel' +
        '2 = :Sel2)'
      ''
      ''
      ''
      ''
      ''
      ''
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
      ' '
      ' '
      ' '
      ''
      ' ')
    Left = 376
    Top = 64
    ParamData = <
      item
        Name = 'Sel4'
      end
      item
        Name = 'Sel3'
      end
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
      end
      item
        Name = 'Sel2'
      end>
  end
  object qryCreditLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor as Invoice_Unit_Factor,'
      '        Sales_Invoice_Line.Cost_Price,'
      '        Sales_Invoice_Line.Purchase_order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_bag_Line,'
      '        Sales_Invoice_Line.Credit_Type'
      'FROM Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE Sales_invoice_Line.Sales_invoice = :Sales_invoice'
      ' '
      ' '
      ' ')
    Left = 418
    Top = 118
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryGetProdCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Order_Price,'
      '        Price_unit_Factor as Order_unit_Factor,'
      '        Quantity'
      'from Purchase_OrderLine, Price_Unit'
      'where Purchase_Order = :Purchase_Order AND'
      'Line = :Line AND'
      '(Purchase_OrderLine.Order_unit = Price_unit.Price_Unit)'
      ' ')
    Left = 418
    Top = 150
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetJBCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag_Line_Cost '
      'FROM Job_Bag_Line_Dets'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      'Job_Bag_Line_Dets.Job_Bag_line = :Job_Bag_Line'
      ' ')
    Left = 416
    Top = 184
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetPOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  Purch_Ord.Purch_Ord,'
      '  Purch_Ord.Purch_ord_no,'
      '  Purch_ord_Line.Purch_Pack_Quantity,'
      '  Purch_ord_Line.Purchase_Price'
      'from Sales_order_Line, Purch_Ord, Purch_Ord_Line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ') and'
      '(Sales_Order_Line.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_order_line.Sales_order' +
        '_Line_no)'
      ')'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 416
    Top = 216
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetSOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Sales_Order_line.Part_Cost,'
      '        Sales_Order_line.Purch_Pack_Quantity'
      'FROM Sales_Order_line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' ')
    Left = 416
    Top = 248
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetInvAddChrg: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from sales_invoice_add_charge'
      'where sales_invoice = :sales_invoice ')
    Left = 450
    Top = 120
    ParamData = <
      item
        Name = 'sales_invoice'
      end>
  end
  object SQLRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Rep, Name'
      'from Rep'
      'where Rep = :Rep'
      ' ')
    Left = 312
    Top = 9
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
end
