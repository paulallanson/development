object STRPSalesByCustFrm: TSTRPSalesByCustFrm
  Left = 0
  Top = 0
  Caption = 'Product Sales by Customer'
  ClientHeight = 687
  ClientWidth = 1262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByProd: TQuickRep
    Left = 0
    Top = 0
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qckrpSalesByProdBeforePrint
    DataSet = DmLookupSOrd.qryProdSalesbyCust
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      50.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      2970.000000000000000000
      60.000000000000000000
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
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
    object QRBand1: TQRBand
      Left = 28
      Top = 24
      Width = 1351
      Height = 106
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        224.366666666666700000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 477
        Top = 10
        Width = 396
        Height = 29
        Size.Values = (
          61.383333333333330000
          1009.650000000000000000
          21.166666666666670000
          838.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Product Sales History Report - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRSysData1: TQRSysData
        Left = 1244
        Top = 14
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2633.133333333333000000
          29.633333333333330000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 105
        Width = 1350
        Height = 1
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          222.250000000000000000
          2857.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblDateRange: TQRLabel
        Left = 605
        Top = 40
        Width = 140
        Height = 21
        Size.Values = (
          44.450000000000000000
          1280.583333333333000000
          84.666666666666670000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Date Range From: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object PsQRLabel1: TQRLabel
        Left = 100
        Top = 80
        Width = 70
        Height = 21
        Size.Values = (
          44.450000000000000000
          211.666666666666700000
          169.333333333333300000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date'
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
        FontSize = 8
      end
      object PsQRLabel4: TQRLabel
        Left = 543
        Top = 80
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          1149.350000000000000000
          169.333333333333300000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Qty Delivered'
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
        FontSize = 8
      end
      object PsQRLabel10: TQRLabel
        Left = 16
        Top = 80
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          33.866666666666670000
          169.333333333333300000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No'
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
        FontSize = 8
      end
      object PsQRLabel3: TQRLabel
        Left = 189
        Top = 80
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          400.050000000000000000
          169.333333333333300000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Code'
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
        FontSize = 8
      end
      object PsQRLabel2: TQRLabel
        Left = 706
        Top = 80
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          1494.366666666667000000
          169.333333333333300000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Box Qty'
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
        FontSize = 8
      end
      object PsQRLabel5: TQRLabel
        Left = 644
        Top = 80
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          1363.133333333333000000
          169.333333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Boxes'
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
        FontSize = 8
      end
      object qrlblGoodsValue: TQRLabel
        Left = 891
        Top = 80
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          1885.950000000000000000
          169.333333333333300000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Goods Value'
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
        FontSize = 8
      end
      object qrlblGoodsTotal: TQRLabel
        Left = 1022
        Top = 80
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          2163.233333333333000000
          169.333333333333300000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total'
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
        FontSize = 8
      end
      object PsQRLabel12: TQRLabel
        Left = 776
        Top = 80
        Width = 95
        Height = 21
        Size.Values = (
          44.450000000000000000
          1642.533333333333000000
          169.333333333333300000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Delivered'
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
        FontSize = 8
      end
      object qrlblDelivery: TQRLabel
        Left = 1068
        Top = 80
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          2260.600000000000000000
          169.333333333333300000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivered To'
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
        FontSize = 8
      end
    end
    object qrbGroupFooter: TQRBand
      Left = 28
      Top = 316
      Width = 1351
      Height = 36
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object PsQRLabel8: TQRLabel
        Left = 813
        Top = 6
        Width = 117
        Height = 23
        Size.Values = (
          48.683333333333330000
          1720.850000000000000000
          12.700000000000000000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Sales Value:'
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
        FontSize = 8
      end
      object psqrlblCustTotal: TQRLabel
        Left = 961
        Top = 6
        Width = 94
        Height = 23
        Size.Values = (
          48.683333333333330000
          2034.116666666667000000
          12.700000000000000000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblCustTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object PsQRShape2: TQRShape
        Left = 811
        Top = 27
        Width = 245
        Height = 3
        Size.Values = (
          5.291666666666670000
          1717.145833333330000000
          58.208333333333300000
          518.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object PsQRShape4: TQRShape
        Left = 811
        Top = 0
        Width = 243
        Height = 1
        Size.Values = (
          2.645833333333330000
          1717.145833333330000000
          0.000000000000000000
          513.291666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrbRepTotal: TQRBand
      Left = 28
      Top = 391
      Width = 1351
      Height = 32
      AlignToBottom = False
      BeforePrint = qrbRepTotalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object PsQRLabel9: TQRLabel
        Left = 774
        Top = 8
        Width = 156
        Height = 21
        Size.Values = (
          44.450000000000000000
          1638.300000000000000000
          16.933333333333330000
          330.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Grand Total Sales Value'
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
        FontSize = 8
      end
      object psqrlblSalesTotal: TQRLabel
        Left = 961
        Top = 8
        Width = 94
        Height = 21
        Size.Values = (
          44.450000000000000000
          2034.116666666667000000
          16.933333333333330000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblCustTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object PsQRShape3: TQRShape
        Left = 766
        Top = 29
        Width = 290
        Height = 1
        Size.Values = (
          2.645833333333330000
          1621.895833333330000000
          60.854166666666700000
          613.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 28
      Top = 226
      Width = 1351
      Height = 30
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSubDetail2
      Size.Values = (
        63.500000000000000000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByProd
      DataSet = DmLookupSOrd.qryProdSalesbyCust
      PrintBefore = False
      PrintIfEmpty = True
      object PsQRDBText11: TQRDBText
        Left = 18
        Top = 1
        Width = 61
        Height = 21
        Size.Values = (
          44.979166666666700000
          37.041666666666700000
          2.645833333333330000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'sales_order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object PsQRDBText10: TQRDBText
        Left = 96
        Top = 1
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          203.200000000000000000
          2.116666666666667000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'date_ordered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object PsQRDBText2: TQRDBText
        Left = 189
        Top = 1
        Width = 91
        Height = 21
        Size.Values = (
          44.979166666666700000
          399.520833333333000000
          2.645833333333330000
          193.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'part'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object PsQRDBText3: TQRDBText
        Left = 284
        Top = 1
        Width = 256
        Height = 21
        Size.Values = (
          44.979166666666700000
          600.604166666667000000
          2.645833333333330000
          542.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'part_description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object PsQRDBText8: TQRDBText
        Left = 556
        Top = 1
        Width = 74
        Height = 21
        Size.Values = (
          44.979166666666700000
          1177.395833333330000000
          2.645833333333330000
          156.104166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'quantity_delivered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object qrlblBoxes: TQRLabel
        Left = 649
        Top = 1
        Width = 35
        Height = 21
        Size.Values = (
          44.979166666666700000
          1373.187500000000000000
          2.645833333333330000
          74.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblBoxes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object PsQRDBText4: TQRDBText
        Left = 695
        Top = 1
        Width = 61
        Height = 21
        Size.Values = (
          44.979166666666700000
          1471.083333333330000000
          2.645833333333330000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'sell_pack_quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object PsQRDBText13: TQRDBText
        Left = 791
        Top = 1
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          1674.283333333333000000
          2.116666666666667000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'Delivery_Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object qrdbGoodsValue: TQRDBText
        Left = 896
        Top = 1
        Width = 78
        Height = 21
        Size.Values = (
          44.979166666666700000
          1897.062500000000000000
          2.645833333333330000
          164.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'part_sales_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object qrdbGoodsTotal: TQRDBText
        Left = 978
        Top = 1
        Width = 78
        Height = 21
        Size.Values = (
          44.979166666666700000
          2069.041666666670000000
          2.645833333333330000
          164.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'SalesValue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object qrdbDeliveryLocation: TQRDBText
        Left = 1068
        Top = 0
        Width = 281
        Height = 21
        Size.Values = (
          44.979166666666700000
          2259.541666666670000000
          0.000000000000000000
          595.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'DeliveryLocation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
    object QRSubDetail2: TQRSubDetail
      Left = 28
      Top = 256
      Width = 1351
      Height = 24
      AlignToBottom = False
      BeforePrint = QRSubDetail2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.800000000000000000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = DmLookupSOrd.qrySalesSerialNos
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialNos: TQRLabel
        Left = 189
        Top = 0
        Width = 94
        Height = 19
        Size.Values = (
          40.216666666666670000
          400.050000000000000000
          0.000000000000000000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblSerialNoRange: TQRLabel
        Left = 300
        Top = 0
        Width = 100
        Height = 19
        Size.Values = (
          40.216666666666670000
          635.000000000000000000
          0.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialNoRange'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbRepGroupFtr: TQRBand
      Left = 28
      Top = 352
      Width = 1351
      Height = 39
      AlignToBottom = False
      BeforePrint = qrbRepGroupFtrBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.550000000000000000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object PsQRLabel7: TQRLabel
        Left = 813
        Top = 6
        Width = 117
        Height = 23
        Size.Values = (
          48.683333333333330000
          1720.850000000000000000
          12.700000000000000000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Sales Value:'
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
        FontSize = 8
      end
      object psqrlblRepTotal: TQRLabel
        Left = 965
        Top = 6
        Width = 90
        Height = 23
        Size.Values = (
          48.683333333333330000
          2042.583333333333000000
          12.700000000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblRepTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object PsQRShape1: TQRShape
        Left = 811
        Top = 27
        Width = 245
        Height = 3
        Size.Values = (
          5.291666666666670000
          1717.145833333330000000
          58.208333333333300000
          518.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrDelToFooter: TQRBand
      Left = 28
      Top = 280
      Width = 1351
      Height = 36
      AlignToBottom = False
      BeforePrint = qrDelToFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object PsQRShape5: TQRShape
        Left = 811
        Top = 27
        Width = 245
        Height = 3
        Size.Values = (
          5.291666666666670000
          1717.145833333330000000
          58.208333333333300000
          518.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object PsQRShape6: TQRShape
        Left = 811
        Top = 0
        Width = 243
        Height = 1
        Size.Values = (
          2.645833333333330000
          1717.145833333330000000
          0.000000000000000000
          513.291666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object PsQRLabel14: TQRLabel
        Left = 813
        Top = 6
        Width = 117
        Height = 23
        Size.Values = (
          48.683333333333330000
          1720.850000000000000000
          12.700000000000000000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Sales Value:'
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
        FontSize = 8
      end
      object psqrlblCust2Total: TQRLabel
        Left = 961
        Top = 6
        Width = 94
        Height = 23
        Size.Values = (
          48.683333333333330000
          2034.116666666667000000
          12.700000000000000000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblCustTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrRepGroup: TQRGroup
      Left = 28
      Top = 130
      Width = 1351
      Height = 31
      AfterPrint = qrRepGroupAfterPrint
      AlignToBottom = False
      BeforePrint = qrRepGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        65.616666666666670000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryProdSalesbyCust.repName'
      FooterBand = qrbRepGroupFtr
      Master = QRSubDetail1
      ReprintOnNewPage = True
      object PsQRLabel6: TQRLabel
        Left = 10
        Top = 5
        Width = 30
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          10.583333333333330000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep:'
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
        FontSize = 8
      end
      object qrdbRepName: TQRDBText
        Left = 65
        Top = 5
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          137.583333333333300000
          10.583333333333330000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = DmLookupSOrd.qryProdSalesbyCust
        DataField = 'repName'
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
        FontSize = 8
      end
    end
    object qrOrdByGroup: TQRGroup
      Left = 28
      Top = 161
      Width = 1351
      Height = 31
      AfterPrint = qrOrdByGroupAfterPrint
      AlignToBottom = False
      BeforePrint = qrOrdByGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrRepGroup
      Size.Values = (
        65.616666666666670000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryProdSalesbyCust.OrderedBy'
      FooterBand = qrbGroupFooter
      Master = QRSubDetail1
      ReprintOnNewPage = True
      object PsQRLabel13: TQRLabel
        Left = 10
        Top = 5
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          10.583333333333330000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/Branch:'
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
        FontSize = 8
      end
      object qrlblOrderedBy: TQRLabel
        Left = 155
        Top = 5
        Width = 98
        Height = 24
        Size.Values = (
          50.800000000000000000
          328.083333333333300000
          10.583333333333330000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblOrderedBy'
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
        FontSize = 8
      end
    end
    object qrDelToGroup: TQRGroup
      Left = 28
      Top = 192
      Width = 1351
      Height = 34
      AlignToBottom = False
      BeforePrint = qrDelToGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.966666666666670000
        2859.616666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryProdSalesbyCust.DeliveryLocation'
      FooterBand = qrDelToFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object PsQRLabel11: TQRLabel
        Left = 10
        Top = 5
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          10.583333333333330000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/Branch:'
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
        FontSize = 8
      end
      object qrlblDelTo: TQRLabel
        Left = 155
        Top = 5
        Width = 67
        Height = 24
        Size.Values = (
          50.800000000000000000
          328.083333333333300000
          10.583333333333330000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDelTo'
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
        FontSize = 8
      end
    end
  end
end
