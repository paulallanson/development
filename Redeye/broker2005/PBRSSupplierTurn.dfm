object PBRSSupplierTurnFrm: TPBRSSupplierTurnFrm
  Left = 190
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Supplier Purchase Cost Selection'
  ClientHeight = 204
  ClientWidth = 365
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
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 139
    Width = 33
    Height = 13
    Caption = 'Sort by'
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 248
    Top = 80
    Width = 115
    Height = 65
    Caption = 'No. of Suppliers'
    TabOrder = 7
  end
  object GrpBxDts: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 137
    Caption = 'Selected Invoice Dates'
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 66
      Width = 80
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
      Width = 90
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
    Left = 288
    Top = 176
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
    Left = 248
    Top = 8
    Width = 115
    Height = 65
    Caption = 'Report Totals'
    ItemIndex = 1
    Items.Strings = (
      'Ascending'
      'Descending')
    TabOrder = 2
  end
  object cbSort1: TComboBox
    Left = 8
    Top = 153
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Visible = False
    Items.Strings = (
      'Total Sales'
      'Total Cost'
      'Total Profit'
      'Profit %')
  end
  object PreviewReportBitBtn: TBitBtn
    Left = 206
    Top = 176
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
    Left = 6
    Top = 176
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object spnRecords: TSpinEdit
    Tag = 108
    Left = 270
    Top = 104
    Width = 50
    Height = 22
    MaxValue = 99999
    MinValue = 0
    TabOrder = 6
    Value = 0
  end
  object chkbxExcludeCosts: TCheckBox
    Left = 184
    Top = 155
    Width = 185
    Height = 17
    Caption = 'exclude printing costs && profit'
    TabOrder = 8
    Visible = False
  end
  object OleContainer1: TOleContainer
    Left = 88
    Top = 40
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 9
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 64
    Top = 44
    Width = 289
    Height = 61
    TabOrder = 10
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
  object btbtnExcel: TBitBtn
    Left = 125
    Top = 176
    Width = 75
    Height = 25
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
    OnClick = btbtnExcelClick
  end
  object qryPurchByInv: TFDQuery
    ConnectionName = 'PB'
    Left = 80
    Top = 16
  end
  object qryUpdIntSel: TFDQuery
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
    Left = 200
    Top = 16
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
  object GetSalesQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Supplier_Invoice_Line.Qty_Invoiced,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor as Sell_Unit_Factor'
      'FROM Price_Unit'
      '  INNER JOIN (Purchase_OrderLine'
      '  INNER JOIN (Supplier_Invoice'
      '  INNER JOIN Supplier_Invoice_Line ON'
      
        '    Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Line.Su' +
        'pplier_Invoice) ON'
      '    (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line.P' +
        'urchase_Order)) ON'
      '    (Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit)'
      'WHERE Supplier_Invoice.Supplier_Invoice = :Invoice_No'
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
    Left = 218
    Top = 62
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
end
