object STMaintStockUsageFrm: TSTMaintStockUsageFrm
  Left = 256
  Top = 114
  Caption = 'Maintain Fulfillment Stock Usage'
  ClientHeight = 433
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 414
    Width = 852
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 373
    Width = 852
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      852
      41)
    object Label2: TLabel
      Left = 16
      Top = 15
      Width = 77
      Height = 13
      Caption = 'Product Search'
    end
    object edtSearch: TEdit
      Left = 96
      Top = 11
      Width = 209
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object btbtnClose: TBitBtn
      Left = 768
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnOK: TBitBtn
      Left = 680
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 102
      Height = 13
      Caption = 'Fulfillment Location'
    end
    object Label3: TLabel
      Left = 640
      Top = 12
      Width = 89
      Height = 13
      Caption = 'Transaction  Date'
    end
    object lblBinLocation: TLabel
      Left = 352
      Top = 12
      Width = 74
      Height = 13
      Caption = 'Associated Bin'
    end
    object dblkpProductionLocation: TDBLookupComboBox
      Left = 120
      Top = 8
      Width = 209
      Height = 21
      KeyField = 'Production_Location'
      ListField = 'Production_Location_Name'
      TabOrder = 0
      OnClick = dblkpProductionLocationClick
    end
    object dtTransaction: TDateTimePicker
      Left = 744
      Top = 8
      Width = 97
      Height = 21
      Date = 39470.000000000000000000
      Time = 0.402405902779719300
      TabOrder = 1
    end
  end
  object sgdetails: TStringGrid
    Left = 0
    Top = 41
    Width = 750
    Height = 332
    Align = alClient
    DefaultRowHeight = 20
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    TabOrder = 3
    OnDrawCell = sgdetailsDrawCell
    OnKeyPress = sgdetailsKeyPress
    OnSelectCell = sgdetailsSelectCell
    ColWidths = (
      178
      201
      83
      83
      81)
  end
  object Panel1: TPanel
    Left = 750
    Top = 41
    Width = 102
    Height = 332
    Align = alRight
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      102
      332)
    object btnChange: TBitBtn
      Left = 16
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Change'
      Enabled = False
      TabOrder = 0
      OnClick = btnChangeClick
    end
    object btnInsert: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Insert'
      TabOrder = 1
      OnClick = btnInsertClick
    end
    object btnMovements: TBitBtn
      Left = 16
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Movements'
      Enabled = False
      TabOrder = 2
      OnClick = btnMovementsClick
    end
    object btnExcel: TBitBtn
      Left = 16
      Top = 296
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Excel'
      Enabled = False
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
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 296
    Top = 88
  end
  object qryAddPartAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Part_Store_Allocation'
      '(Part_Store_Allocation, Store_Stock, Quantity_Allocated, Part)'
      
        'Select Max(Part_Store_Allocation)+1, :Store_Stock, :Quantity_All' +
        'ocated, :Part From Part_Store_Allocation')
    Left = 656
    Top = 152
    ParamData = <
      item
        Name = 'Store_Stock'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Part'
      end>
  end
  object qryGetStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 *'
      'from Store_Stock'
      'Where Part = :Part and'
      '      Part_Store = :Part_Store and'
      '      Part_Bin = :Part_Bin and'
      '      Part_Store_Lot = :Part_Store_Lot and'
      '      Store_Quantity = :Store_Quantity and'
      '      Date_Received = :Date_Received'
      'ORDER BY Store_Stock.Store_Stock DESC')
    Left = 664
    Top = 216
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Part_Store_Lot'
      end
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Date_Received'
      end>
  end
end
