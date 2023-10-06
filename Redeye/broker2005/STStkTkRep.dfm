object StStkTkRepFrm: TStStkTkRepFrm
  Left = 28
  Top = 103
  Caption = 'Stock Count Listing Report Form'
  ClientHeight = 574
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object StkTkQuickReport: TQuickRep
    Left = 40
    Top = 24
    Width = 794
    Height = 1123
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Frame.Style = psClear
    Frame.Width = 0
    ShowingPreview = False
    BeforePrint = StkTkQuickReportBeforePrint
    DataSet = GetDetsQuery
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand: TQRBand
      Left = 38
      Top = 38
      Width = 737
      Height = 119
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        314.854166666666700000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 12
        Top = 2
        Width = 133
        Height = 25
        Size.Values = (
          66.145833333333330000
          31.750000000000000000
          5.291666666666667000
          351.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Title of Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object QRShape5: TQRShape
        Left = 529
        Top = 0
        Width = 185
        Height = 57
        Size.Values = (
          150.812500000000000000
          1399.645833333330000000
          0.000000000000000000
          489.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 551
        Top = 8
        Width = 137
        Height = 25
        Size.Values = (
          66.145833333333300000
          1457.854166666670000000
          21.166666666666700000
          362.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabel1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object ReprintQRLabel: TQRLabel
        Left = 551
        Top = 35
        Width = 137
        Height = 17
        Size.Values = (
          44.979166666666700000
          1457.854166666670000000
          92.604166666666700000
          362.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ReprintQRLabel'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object DateQRLabel: TQRLabel
        Left = 12
        Top = 35
        Width = 35
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          92.604166666666670000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object OptionQRLabel: TQRLabel
        Left = 12
        Top = 60
        Width = 47
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          158.750000000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Option'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object RngQRLabel: TQRLabel
        Left = 12
        Top = 82
        Width = 47
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          216.958333333333300000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Range'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 157
      Width = 737
      Height = 52
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        137.583333333333300000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetDetsQuery.Part_Store_Name'
      FooterBand = GrpFootQRBand
      Master = StkTkQuickReport
      ReprintOnNewPage = True
      object SeqByQRLabel: TQRLabel
        Left = 2
        Top = 0
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'STORE : '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 66
        Top = 32
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          174.625000000000000000
          84.666666666666670000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 256
        Top = 32
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          677.333333333333300000
          84.666666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 590
        Top = 32
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          1561.041666666667000000
          84.666666666666670000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box Count'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object BinQRLabel: TQRLabel
        Left = 3
        Top = 32
        Width = 18
        Height = 17
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          84.666666666666670000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object CountQRLabel: TQRLabel
        Left = 673
        Top = 32
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          84.666666666666670000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Count'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 64
        Top = 0
        Width = 369
        Height = 17
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          0.000000000000000000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Store_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 514
        Top = 32
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          1359.958333333333000000
          84.666666666666670000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Size'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object GrpFootQRBand: TQRBand
      Left = 38
      Top = 239
      Width = 737
      Height = 26
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object PageFootQRBand: TQRBand
      Left = 38
      Top = 265
      Width = 737
      Height = 95
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        251.354166666666700000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRShape8: TQRShape
        Left = 16
        Top = 8
        Width = 289
        Height = 73
        Size.Values = (
          193.145833333333300000
          42.333333333333340000
          21.166666666666670000
          764.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 32
        Top = 16
        Width = 241
        Height = 15
        Size.Values = (
          39.687500000000000000
          84.666666666666680000
          42.333333333333340000
          637.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'COUNTED BY:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 32
        Top = 56
        Width = 241
        Height = 15
        Size.Values = (
          39.687500000000000000
          84.666666666666680000
          148.166666666666700000
          637.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CHECKED BY:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 622
        Top = 64
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          1645.708333333333000000
          169.333333333333300000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 209
      Width = 737
      Height = 30
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = StkTkQuickReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 2
        Top = 8
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          21.166666666666670000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Bin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object Seq2QRDBText: TQRDBText
        Left = 66
        Top = 8
        Width = 183
        Height = 15
        Size.Values = (
          39.687500000000000000
          174.625000000000000000
          21.166666666666670000
          484.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object DescQRDBText: TQRDBText
        Left = 256
        Top = 8
        Width = 241
        Height = 15
        Size.Values = (
          39.687500000000000000
          677.333333333333400000
          21.166666666666670000
          637.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 662
        Top = 3
        Width = 67
        Height = 22
        Size.Values = (
          58.208333333333340000
          1751.541666666667000000
          7.937500000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLblQty: TQRLabel
        Left = 598
        Top = 8
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1582.208333333333000000
          21.166666666666670000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblQty'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBTxtPackSize: TQRDBText
        Left = 497
        Top = 8
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1314.979166666667000000
          21.166666666666670000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Stock_Pack_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
  end
  object GetDetsDataSource: TDataSource
    DataSet = GetDetsQuery
    Left = 485
    Top = 29
  end
  object GetDetsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Store_Stock.part, Store_Stock.part_store_lot, Store_Stock' +
        '.Part_Bin,'
      '  sum(store_stock.store_quantity) as stock_qty,'
      
        '  Store_Stock.Date_Received, Store_Stock.Store_Cost, Store_Stock' +
        '.Part_Store,'
      
        '  Store_Stock.Store_Stock, Store_Stock.Stock_Pack_Quantity, Part' +
        '.Part_Description,'
      
        '  Part_Store.Part_Store_Name, Store_Stock.Invoice_upfront, Store' +
        '_Stock.Store_Stock_Description,'
      '  Part_Store_Bin.Production_Bin'
      'from Store_Stock, Part, Part_Store, Part_Store_Bin'
      
        'where ((((Store_Stock.part_Bin >= :RngFrom) and (Store_Stock.Par' +
        't_Bin <= :RngTo)) or'
      '    (:RngFrom = '#39#39')) and'
      '  (Store_Stock.Part = Part.Part) and'
      '  (Part_Store.Part_Store = Store_Stock.Part_Store) and'
      '  (Part_Store.Part_Store = :Part_Store)) and'
      '  ((Part.Customer = :Customer) or (0 = :customer)) and'
      
        '  ((Store_Stock.Invoice_upfront = :Invoice_upfront) or ('#39'X'#39' = :I' +
        'nvoice_upfront)) and'
      '  ('
      '  (Part_Store_bin.Part_Store = Store_Stock.Part_Store) and'
      '  (Part_Store_bin.Part_Bin = Store_Stock.Part_Bin)'
      '  ) and'
      
        '  ((Part_Store_bin.Production_Bin = '#39'N'#39') or (Part_Store_bin.Prod' +
        'uction_Bin is NULL))'
      
        'Group by  Store_Stock.part, Store_Stock.part_store_lot, Store_St' +
        'ock.Part_bin,'
      
        '   Store_Stock.Date_Received, Store_Stock.Store_Cost, Store_Stoc' +
        'k.Part_Store,'
      
        '   Store_Stock.Store_Stock, Store_Stock.Stock_Pack_Quantity,Part' +
        '.Part_Description,'
      
        '  Part_Store.Part_Store_Name, Store_Stock.Invoice_upfront, Store' +
        '_Stock.Store_Stock_Description,'
      '  Part_Store_Bin.Production_Bin'
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
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 507
    Top = 91
    ParamData = <
      item
        Name = 'RngFrom'
        DataType = ftString
      end
      item
        Name = 'RngTo'
        DataType = ftString
      end
      item
        Name = 'RngFrom'
        DataType = ftString
      end
      item
        Name = 'Part_Store'
        DataType = ftString
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'customer'
      end
      item
        Name = 'Invoice_upfront'
      end
      item
        Name = 'Invoice_upfront'
      end>
  end
  object GetAllBinQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Part_Store.Part_Store_Name, Part_Store_Bin.Part_Bin,'
      
        #9'Store_Stock.Part, Store_Stock.Part_Store_Lot, sum(Store_Stock.S' +
        'tore_Quantity) as stock_qty,'
      
        '   Store_Stock.Date_Received, Store_Stock.Store_Cost, Part_Store' +
        '.Part_Store,'
      
        '   Store_Stock.Store_Stock, Store_Stock.Stock_Pack_Quantity, Par' +
        't.Part_Description,'
      
        '   Store_Stock.Invoice_upfront, Store_Stock.Store_Stock_Descript' +
        'ion,'
      '   Part_Store_Bin.Production_Bin'
      'FROM (Part_Store'
      
        '      INNER JOIN Part_Store_Bin ON Part_Store.Part_Store = Part_' +
        'Store_Bin.Part_Store)'
      '           LEFT JOIN (Store_Stock '
      '               LEFT JOIN Part ON Store_Stock.Part = Part.Part) '
      
        '           ON (Part_Store_Bin.Part_Bin = Store_Stock.Part_Bin) A' +
        'ND '
      
        '                     (Part_Store_Bin.Part_Store = Store_Stock.Pa' +
        'rt_Store)'
      'where Part_Store.Part_Store = :Part_Store  and'
      '  ((Part.Customer = :Customer) or (0 = :customer))'
      'Group by Part_Store.Part_Store_Name, Part_Store_Bin.Part_Bin,'
      
        #9'Store_Stock.Part,  Store_Stock.Part_Store_Lot, Store_Stock.Date' +
        '_Received, Store_Stock.Store_Cost, Part_Store.Part_Store,'
      
        '  Store_Stock.Store_Stock, Store_Stock.Stock_Pack_Quantity, Part' +
        '.Part_Description,'
      
        '   Store_Stock.Invoice_upfront, Store_Stock.Store_Stock_Descript' +
        'ion,'
      '   Part_Store_Bin.Production_Bin'
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
    Left = 222
    Top = 126
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'customer'
      end>
  end
  object AddCountDetQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Stock_Take'
      '  (Stock_Take, Part_Store, Part_Bin, Part_store_Lot,'
      '   Stock_Take_Qty, Store_Cost, Date_Received,'
      
        '   Stock_Take_Status, Stock_Take_Ref, Part, Part_Bin_Orig, Part_' +
        'Store_Lot_Orig, Stock_Take_Prior_Qty,'
      
        '   Stock_Take_Pack_Qty, Stock_Take_Pack_Qty_Orig, Invoice_upfron' +
        't, Store_stock_Description)'
      'values'
      '  (:Stock_Take, :Part_store, :Part_Bin, :Part_Store_Lot,'
      '    :Stock_Take_Qty, :Store_Cost, :Date_Received,'
      
        '    :Stock_Take_Status, :Stock_Take_Ref, :Part, :Part_Bin, :Part' +
        '_Store_Lot, :Stock_Take_Prior_Qty,'
      
        '    :Stock_take_Pack_Qty, :Stock_Take_Pack_Qty, :Invoice_upfront' +
        ', :Store_stock_Description)'
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 390
    Top = 110
    ParamData = <
      item
        Name = 'Stock_Take'
        DataType = ftString
      end
      item
        Name = 'Part_Store'
        DataType = ftString
      end
      item
        Name = 'Part_Bin'
        DataType = ftString
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end
      item
        Name = 'Stock_Take_Qty'
        DataType = ftInteger
      end
      item
        Name = 'Store_Cost'
        DataType = ftFloat
      end
      item
        Name = 'Date_Received'
        DataType = ftDateTime
      end
      item
        Name = 'Stock_Take_Status'
        DataType = ftString
      end
      item
        Name = 'Stock_Take_Ref'
        DataType = ftString
      end
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Part_Bin'
        DataType = ftString
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end
      item
        Name = 'Stock_Take_Prior_Qty'
        DataType = ftInteger
      end
      item
        Name = 'Stock_take_Pack_Qty'
      end
      item
        Name = 'Stock_Take_Pack_Qty'
      end
      item
        Name = 'Invoice_upfront'
      end
      item
        Name = 'Store_stock_Description'
      end>
  end
  object GetNextRefQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Stock_Take) as Last_Code'
      'From Stock_Take')
    Left = 520
    Top = 168
  end
  object ReprintQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Stock_Take.*, Stock_Take.Stock_Take_Prior_Qty as Stock_Qt' +
        'y,'
      '  Stock_Take.Stock_Take_Pack_qty as Stock_Pack_Quantity,'
      '  Part.Part_Description, Part_Store.Part_Store_Name'
      'from Stock_take, Part, Part_Store'
      'where (Stock_Take_Ref like :Ref) and'
      '(Stock_Take.Part = Part.Part) and'
      '  (Part_Store.Part_Store = Stock_Take.Part_Store)'
      ''
      ' '
      ' '
      ' ')
    Left = 390
    Top = 40
    ParamData = <
      item
        Name = 'Ref'
        DataType = ftString
      end>
  end
  object GetByPartSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Store_Stock.part, Store_Stock.part_store_lot, Store_Stock' +
        '.Part_Bin,'
      '  sum(store_stock.store_quantity) as stock_qty,'
      
        '  Store_Stock.Date_Received, Store_Stock.Store_Cost, Store_Stock' +
        '.Part_Store,'
      
        '  Store_Stock.Store_Stock, Store_Stock.Stock_Pack_Quantity, Part' +
        '.Part_Description,'
      '  Part_Store.Part_Store_Name'
      'from Store_Stock, Part, Part_Store'
      
        'where ((((Store_Stock.part >= :RngFrom) and (Store_Stock.Part <=' +
        ' :RngTo)) or'
      '    (:RngFrom = '#39#39')) and'
      '  (Store_Stock.Part = Part.Part) and'
      '  (Part_Store.Part_Store = Store_Stock.Part_Store) and'
      '  (Part_Store.Part_Store = :Part_Store)) and'
      '  ((Part.Customer = :Customer) or (0 = :customer))'
      
        'Group by  Store_Stock.part, Store_Stock.part_store_lot, Store_St' +
        'ock.Part_bin,'
      
        '   Store_Stock.Date_Received, Store_Stock.Store_Cost, Store_Stoc' +
        'k.Part_Store,'
      
        '   Store_Stock.Store_Stock, Store_Stock.Stock_Pack_Quantity, Par' +
        't.Part_Description,'
      '  Part_Store.Part_Store_Name'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 222
    Top = 62
    ParamData = <
      item
        Name = 'RngFrom'
      end
      item
        Name = 'RngTo'
      end
      item
        Name = 'RngFrom'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'customer'
      end>
  end
end
