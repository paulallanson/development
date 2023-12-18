object STRSBoxLabelsfrm: TSTRSBoxLabelsfrm
  Left = 475
  Top = 126
  BorderStyle = bsDialog
  Caption = 'Print Box Labels'
  ClientHeight = 430
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object LineDetsStringGrid: TStringGrid
    Left = 0
    Top = 121
    Width = 757
    Height = 249
    Align = alClient
    ColCount = 8
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 9
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    TabOrder = 0
    OnKeyPress = BoxQuantityEditKeyPress
    OnSelectCell = LineDetsStringGridSelectCell
    ColWidths = (
      38
      70
      182
      67
      64
      55
      73
      99)
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 411
    Width = 757
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 370
    Width = 757
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object CancelBitBtn: TBitBtn
      Left = 656
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object PreviewBitBtn: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pre&view'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 1
      OnClick = PreviewBitBtnClick
    end
    object PrintBitBtn: TBitBtn
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Print'
      Default = True
      Enabled = False
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
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = PrintBitBtnClick
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 757
    Height = 121
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    object POGroupBox: TGroupBox
      Left = 8
      Top = 8
      Width = 393
      Height = 49
      Caption = 'Delivery details for order '
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 52
        Height = 13
        Caption = 'Customer:'
      end
      object CustomerLbl: TLabel
        Left = 80
        Top = 20
        Width = 64
        Height = 13
        Caption = 'CustomerLbl'
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 66
      Width = 393
      Height = 45
      ParentBackground = False
      TabOrder = 1
      object Label9: TLabel
        Left = 16
        Top = 20
        Width = 67
        Height = 13
        Caption = 'Delivery Date'
      end
      object DeliveryDateEdit: TEdit
        Left = 104
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'DeliveryDateEdit'
        OnChange = DeliveryDateEditChange
        OnExit = DeliveryDateEditExit
      end
      object BitBtn2: TBitBtn
        Left = 232
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
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object chkAddressOnly: TCheckBox
        Left = 272
        Top = 18
        Width = 113
        Height = 17
        Caption = 'Print Address Only'
        TabOrder = 2
      end
    end
    object GroupBox5: TGroupBox
      Left = 408
      Top = 66
      Width = 329
      Height = 45
      ParentBackground = False
      TabOrder = 2
      object Label12: TLabel
        Left = 16
        Top = 20
        Width = 56
        Height = 13
        Caption = 'Label Logo'
      end
      object dblkpLogos: TDBLookupComboBox
        Left = 80
        Top = 16
        Width = 185
        Height = 21
        KeyField = 'ID'
        ListField = 'Logo_Name'
        ListSource = dtsLogos
        TabOrder = 0
      end
      object FormRefClrBitBtn: TBitBtn
        Left = 282
        Top = 14
        Width = 23
        Height = 23
        Hint = 'Clear'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = FormRefClrBitBtnClick
      end
    end
  end
  object GetDetailsSrc: TDataSource
    DataSet = GetSordSQL
    Left = 240
    Top = 176
  end
  object GetSordSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sell_pack_Quantity,'
      '        Sales_Order_line.Part,'
      '        Sales_Order_line.Quantity_Allocated,'
      '        Sales_order_Line.Quantity_Delivered,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Part.Part_Description,'
      '        Sales_Order_line.Sales_Order'
      
        'FROM Part INNER JOIN Sales_Order_line ON Part.Part = Sales_Order' +
        '_line.Part'
      'WHERE (((Sales_Order_Line.Sales_Order) = :sonumber)) and'
      '      ((Part.Product_class = '#39'STK'#39') or'
      '      (Part.Product_class = '#39'POD'#39') or'
      '      (Part.Product_class is NULL))'
      'ORDER BY Sales_Order_line.Sales_Order_Line_No'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 328
    Top = 176
    ParamData = <
      item
        Name = 'sonumber'
        DataType = ftInteger
      end>
  end
  object qryGetSerialNumbers: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from sales_order_line_serial_no'
      'where Sales_order = :Sales_order and '
      '  Sales_order_line_no = :Sales_order_line_no')
    Left = 329
    Top = 235
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_order_line_no'
      end>
  end
  object qryLogos: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Document_Logo'
      'WHERE Document_Type = '#39'L'#39' AND'
      '((inactive = '#39'N'#39') or (inactive is NULL))'
      'ORDER BY Logo_Name')
    Left = 648
    Top = 34
  end
  object dtsLogos: TDataSource
    DataSet = qryLogos
    Left = 704
    Top = 38
  end
end
