object STRSSOHistoryFrm: TSTRSSOHistoryFrm
  Left = 50
  Top = 89
  AutoScroll = False
  Caption = 'Sales Order History by Customer and Part'
  ClientHeight = 450
  ClientWidth = 731
  Color = clBtnFace
  Constraints.MinHeight = 369
  Constraints.MinWidth = 536
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DetsDBGrid: TDBGrid
    Left = 0
    Top = 81
    Width = 731
    Height = 329
    Align = alClient
    DataSource = DmLookupSOrd.DetsSRC
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Ordered'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity_Ordered'
        Title.Caption = 'Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity_Allocated'
        Title.Caption = 'Allocated'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity_Delivered'
        Title.Caption = 'Delivered'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity_Invoiced'
        Title.Caption = 'Invoiced'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Sales_Price'
        Title.Caption = 'Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Cost'
        Title.Caption = 'Cost'
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
        FieldName = 'Discount_value'
        Title.Caption = 'Discount'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Title.Caption = 'SO Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sales_Order_line_no'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Part'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Purch_Pack_Quantity'
        Title.Caption = 'Pack'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Contract'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Contract_Line_no'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Sales_order_Line_Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Line_Complete'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'vat_code'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Discount_Type'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Replacement_For_Line'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Original_Sell_Price'
        Visible = False
      end>
  end
  object pnlCustProd: TPanel
    Left = 0
    Top = 410
    Width = 731
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      731
      40)
    object CancelBitBtn: TBitBtn
      Left = 23
      Top = 8
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Kind = bkCancel
    end
    object PreviewBitBtn: TBitBtn
      Left = 423
      Top = 8
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Pre&view'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      Left = 511
      Top = 8
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Print'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = PrintBitBtnClick
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
    object btbtnCustCopy: TBitBtn
      Left = 595
      Top = 7
      Width = 129
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Customer Copy'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btbtnCustCopyClick
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
    object btnExcel: TBitBtn
      Left = 335
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excel'
      TabOrder = 4
      OnClick = btnExcelClick
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 81
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 18
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 22
      Height = 13
      Caption = 'Part:'
    end
    object Label2: TLabel
      Left = 376
      Top = 18
      Width = 85
      Height = 13
      Caption = 'Show sales since:'
    end
    object edtPart: TEdit
      Left = 70
      Top = 44
      Width = 257
      Height = 21
      TabStop = False
      Color = clBtnFace
      MaxLength = 30
      ReadOnly = True
      TabOrder = 0
    end
    object CustNameEdit: TEdit
      Left = 70
      Top = 13
      Width = 257
      Height = 21
      TabStop = False
      Color = clBtnFace
      MaxLength = 30
      ReadOnly = True
      TabOrder = 1
    end
    object CustBitBtn: TBitBtn
      Left = 336
      Top = 12
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = CustBitBtnClick
    end
    object btbtnPart: TBitBtn
      Left = 336
      Top = 42
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btbtnPartClick
    end
    object DateEdit: TEdit
      Left = 488
      Top = 13
      Width = 81
      Height = 21
      MaxLength = 30
      TabOrder = 4
    end
    object DateBitBtn: TBitBtn
      Left = 576
      Top = 12
      Width = 25
      Height = 25
      TabOrder = 5
      OnClick = DateBitBtnClick
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
  object pnlExportPrgrss: TPanel
    Left = 200
    Top = 171
    Width = 289
    Height = 61
    TabOrder = 3
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
    Left = 452
    Top = 179
    Width = 98
    Height = 53
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 4
    Visible = False
  end
end
