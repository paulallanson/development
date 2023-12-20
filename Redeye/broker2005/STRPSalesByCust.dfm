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
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByProd: TQuickRep
    Left = 0
    Top = 0
    Width = 1123
    Height = 794
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
      Left = 23
      Top = 19
      Width = 1081
      Height = 85
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        224.895833333333300000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 382
        Top = 8
        Width = 317
        Height = 23
        Size.Values = (
          60.854166666666670000
          1010.708333333333000000
          21.166666666666670000
          838.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Product Sales History Report - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 993
        Top = 11
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2627.312500000000000000
          29.104166666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Top = 84
        Width = 1080
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
        Left = 485
        Top = 32
        Width = 111
        Height = 17
        Size.Values = (
          44.979166666666670000
          1283.229166666667000000
          84.666666666666670000
          293.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Date Range From: '
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
        FontSize = 10
      end
      object PsQRLabel1: TQRLabel
        Left = 80
        Top = 64
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          169.333333333333300000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date'
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
      object PsQRLabel4: TQRLabel
        Left = 430
        Top = 64
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          169.333333333333300000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Qty Delivered'
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
      object PsQRLabel10: TQRLabel
        Left = 13
        Top = 64
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          34.395833333333330000
          169.333333333333300000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No'
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
      object PsQRLabel3: TQRLabel
        Left = 151
        Top = 64
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          399.520833333333300000
          169.333333333333300000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Code'
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
      object PsQRLabel2: TQRLabel
        Left = 564
        Top = 64
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          1492.250000000000000000
          169.333333333333300000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Box Qty'
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
      object PsQRLabel5: TQRLabel
        Left = 512
        Top = 64
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          169.333333333333300000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Boxes'
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
      object qrlblGoodsValue: TQRLabel
        Left = 708
        Top = 64
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          1873.250000000000000000
          169.333333333333300000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Goods Value'
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
      object qrlblGoodsTotal: TQRLabel
        Left = 816
        Top = 64
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          2159.000000000000000000
          169.333333333333300000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total'
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
      object PsQRLabel12: TQRLabel
        Left = 621
        Top = 64
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1643.062500000000000000
          169.333333333333300000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Delivered'
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
      object qrlblDelivery: TQRLabel
        Left = 854
        Top = 64
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          2259.541666666667000000
          169.333333333333300000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivered To'
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
    object qrbGroupFooter: TQRBand
      Left = 23
      Top = 253
      Width = 1081
      Height = 29
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object PsQRLabel8: TQRLabel
        Left = 646
        Top = 5
        Width = 98
        Height = 18
        Size.Values = (
          47.625000000000000000
          1709.208333333333000000
          13.229166666666670000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Sales Value:'
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
      object psqrlblCustTotal: TQRLabel
        Left = 766
        Top = 5
        Width = 78
        Height = 18
        Size.Values = (
          47.625000000000000000
          2026.708333333333000000
          13.229166666666670000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblCustTotal'
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
      object PsQRShape2: TQRShape
        Left = 649
        Top = 22
        Width = 196
        Height = 2
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
        Left = 649
        Top = 0
        Width = 194
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
      Left = 23
      Top = 313
      Width = 1081
      Height = 26
      AlignToBottom = False
      BeforePrint = qrbRepTotalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object PsQRLabel9: TQRLabel
        Left = 613
        Top = 6
        Width = 131
        Height = 17
        Size.Values = (
          44.979166666666670000
          1621.895833333333000000
          15.875000000000000000
          346.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Grand Total Sales Value'
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
      object psqrlblSalesTotal: TQRLabel
        Left = 766
        Top = 6
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          2026.708333333333000000
          15.875000000000000000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblCustTotal'
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
      object PsQRShape3: TQRShape
        Left = 613
        Top = 23
        Width = 232
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
      Left = 23
      Top = 181
      Width = 1081
      Height = 24
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSubDetail2
      Size.Values = (
        63.500000000000000000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByProd
      DataSet = DmLookupSOrd.qryProdSalesbyCust
      PrintBefore = False
      PrintIfEmpty = True
      object PsQRDBText11: TQRDBText
        Left = 14
        Top = 1
        Width = 49
        Height = 17
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
      object PsQRDBText10: TQRDBText
        Left = 72
        Top = 1
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          2.645833333333333000
          174.625000000000000000)
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
        Font.Height = -11
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
        Left = 151
        Top = 1
        Width = 73
        Height = 17
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
      object PsQRDBText3: TQRDBText
        Left = 227
        Top = 1
        Width = 205
        Height = 17
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
      object PsQRDBText8: TQRDBText
        Left = 445
        Top = 1
        Width = 59
        Height = 17
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
      object qrlblBoxes: TQRLabel
        Left = 519
        Top = 1
        Width = 28
        Height = 17
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
      object PsQRDBText4: TQRDBText
        Left = 556
        Top = 1
        Width = 49
        Height = 17
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
      object PsQRDBText13: TQRDBText
        Left = 629
        Top = 1
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          2.645833333333333000
          179.916666666666700000)
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
      object qrdbGoodsValue: TQRDBText
        Left = 717
        Top = 1
        Width = 62
        Height = 17
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
      object qrdbGoodsTotal: TQRDBText
        Left = 782
        Top = 1
        Width = 62
        Height = 17
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
      object qrdbDeliveryLocation: TQRDBText
        Left = 854
        Top = 0
        Width = 225
        Height = 17
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
    object QRSubDetail2: TQRSubDetail
      Left = 23
      Top = 205
      Width = 1081
      Height = 19
      AlignToBottom = False
      BeforePrint = QRSubDetail2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = DmLookupSOrd.qrySalesSerialNos
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialNos: TQRLabel
        Left = 151
        Top = 0
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          399.520833333333300000
          0.000000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
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
      object lblSerialNoRange: TQRLabel
        Left = 240
        Top = 0
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          635.000000000000000000
          0.000000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialNoRange'
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
    end
    object qrbRepGroupFtr: TQRBand
      Left = 23
      Top = 282
      Width = 1081
      Height = 31
      AlignToBottom = False
      BeforePrint = qrbRepGroupFtrBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object PsQRLabel7: TQRLabel
        Left = 646
        Top = 5
        Width = 98
        Height = 18
        Size.Values = (
          47.625000000000000000
          1709.208333333333000000
          13.229166666666670000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Sales Value:'
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
      object psqrlblRepTotal: TQRLabel
        Left = 769
        Top = 5
        Width = 75
        Height = 18
        Size.Values = (
          47.625000000000000000
          2034.645833333333000000
          13.229166666666670000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblRepTotal'
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
      object PsQRShape1: TQRShape
        Left = 649
        Top = 22
        Width = 196
        Height = 2
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
      Left = 23
      Top = 224
      Width = 1081
      Height = 29
      AlignToBottom = False
      BeforePrint = qrDelToFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object PsQRShape5: TQRShape
        Left = 649
        Top = 22
        Width = 196
        Height = 2
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
        Left = 649
        Top = 0
        Width = 194
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
        Left = 646
        Top = 5
        Width = 98
        Height = 18
        Size.Values = (
          47.625000000000000000
          1709.208333333333000000
          13.229166666666670000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Sales Value:'
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
      object psqrlblCust2Total: TQRLabel
        Left = 766
        Top = 5
        Width = 78
        Height = 18
        Size.Values = (
          47.625000000000000000
          2026.708333333333000000
          13.229166666666670000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'psqrlblCustTotal'
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
    end
    object qrRepGroup: TQRGroup
      Left = 23
      Top = 104
      Width = 1081
      Height = 25
      AfterPrint = qrRepGroupAfterPrint
      AlignToBottom = False
      BeforePrint = qrRepGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryProdSalesbyCust.repName'
      FooterBand = qrbRepGroupFtr
      Master = QRSubDetail1
      ReprintOnNewPage = True
      object PsQRLabel6: TQRLabel
        Left = 8
        Top = 4
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          66.145833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep:'
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
      object qrdbRepName: TQRDBText
        Left = 52
        Top = 4
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          137.583333333333300000
          10.583333333333330000
          134.937500000000000000)
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
        Font.Height = -11
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
      Left = 23
      Top = 129
      Width = 1081
      Height = 25
      AfterPrint = qrOrdByGroupAfterPrint
      AlignToBottom = False
      BeforePrint = qrOrdByGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrRepGroup
      Size.Values = (
        66.145833333333330000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryProdSalesbyCust.OrderedBy'
      FooterBand = qrbGroupFooter
      Master = QRSubDetail1
      ReprintOnNewPage = True
      object PsQRLabel13: TQRLabel
        Left = 8
        Top = 4
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/Branch:'
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
      object qrlblOrderedBy: TQRLabel
        Left = 124
        Top = 4
        Width = 85
        Height = 19
        Size.Values = (
          50.270833333333330000
          328.083333333333300000
          10.583333333333330000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblOrderedBy'
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
    object qrDelToGroup: TQRGroup
      Left = 23
      Top = 154
      Width = 1081
      Height = 27
      AlignToBottom = False
      BeforePrint = qrDelToGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        2860.145833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryProdSalesbyCust.DeliveryLocation'
      FooterBand = qrDelToFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object PsQRLabel11: TQRLabel
        Left = 8
        Top = 4
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/Branch:'
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
      object qrlblDelTo: TQRLabel
        Left = 124
        Top = 4
        Width = 57
        Height = 19
        Size.Values = (
          50.270833333333330000
          328.083333333333300000
          10.583333333333330000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDelTo'
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
  end
end
