object frmwtRPSOrder: TfrmwtRPSOrder
  Left = 237
  Top = 92
  Caption = 'Sales Order Print'
  ClientHeight = 707
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 48
    Top = 58
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      0.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      0.000000000000000000
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
    ReportTitle = 'Sales Order Print'
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
    object qrgSalesOrder: TQRGroup
      Left = 38
      Top = 454
      Width = 756
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgSalesOrderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sales_order'
      FooterBand = qrbSOFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 756
      Height = 416
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1100.666666666667000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 8
        Top = 378
        Width = 714
        Height = 31
        Size.Values = (
          82.020833333333340000
          21.166666666666670000
          1000.125000000000000000
          1889.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 8
        Top = 320
        Width = 714
        Height = 52
        Size.Values = (
          137.583333333333300000
          21.166666666666670000
          846.666666666666600000
          1889.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 424
        Top = 57
        Width = 297
        Height = 89
        Size.Values = (
          235.479166666666700000
          1121.833333333333000000
          150.812500000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSOCaption: TQRLabel
        Left = 409
        Top = -1
        Width = 310
        Height = 56
        Size.Values = (
          148.166666666666700000
          1082.145833333333000000
          -2.645833333333333000
          820.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SALES ORDER'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -48
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 36
      end
      object QRLabel2: TQRLabel
        Left = 435
        Top = 94
        Width = 77
        Height = 14
        Size.Values = (
          37.041666666666670000
          1150.937500000000000000
          248.708333333333300000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 633
        Top = 94
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          1674.812500000000000000
          248.708333333333300000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 638
        Top = 64
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          1688.041666666667000000
          169.333333333333300000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 435
        Top = 64
        Width = 63
        Height = 14
        Size.Values = (
          37.041666666666670000
          1150.937500000000000000
          169.333333333333300000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 16
        Top = 354
        Width = 201
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          936.625000000000100000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans'
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
      object QRLabel5: TQRLabel
        Left = 15
        Top = 328
        Width = 98
        Height = 13
        Size.Values = (
          34.395833333333330000
          39.687500000000000000
          867.833333333333300000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 202
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          534.458333333333300000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 16
        Top = 388
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          1026.583333333333000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 512
        Top = 388
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          1354.666666666667000000
          1026.583333333333000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel14: TQRLabel
        Left = 576
        Top = 388
        Width = 55
        Height = 16
        Size.Values = (
          42.333333333333330000
          1524.000000000000000000
          1026.583333333333000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 680
        Top = 388
        Width = 31
        Height = 16
        Size.Values = (
          42.333333333333330000
          1799.166666666667000000
          1026.583333333333000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object memAddress: TQRRichText
        Left = 13
        Top = 128
        Width = 321
        Height = 57
        Size.Values = (
          150.812500000000000000
          34.395833333333340000
          338.666666666666700000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object QRShape6: TQRShape
        Left = 549
        Top = 56
        Width = 9
        Height = 89
        Size.Values = (
          235.479166666666700000
          1452.562500000000000000
          148.166666666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 424
        Top = 82
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          216.958333333333400000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape1: TQRShape
        Left = 424
        Top = 113
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          298.979166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 8
        Top = 195
        Width = 328
        Height = 120
        Size.Values = (
          317.500000000000000000
          21.166666666666670000
          515.937500000000000000
          867.833333333333500000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 24
        Top = 216
        Width = 289
        Height = 90
        Size.Values = (
          238.125000000000000000
          63.500000000000000000
          571.500000000000000000
          764.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel1: TQRLabel
        Left = 435
        Top = 124
        Width = 98
        Height = 14
        Size.Values = (
          37.041666666666670000
          1150.937500000000000000
          328.083333333333300000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText1: TQRDBText
        Left = 560
        Top = 124
        Width = 155
        Height = 16
        Size.Values = (
          42.333333333333340000
          1481.666666666667000000
          328.083333333333400000
          410.104166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Ref_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape2: TQRShape
        Left = 384
        Top = 195
        Width = 336
        Height = 120
        Size.Values = (
          317.500000000000000000
          1016.000000000000000000
          515.937500000000000000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmSiteAddress: TQRMemo
        Left = 398
        Top = 216
        Width = 289
        Height = 90
        Size.Values = (
          238.125000000000000000
          1053.041666666667000000
          571.500000000000000000
          764.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape4: TQRShape
        Left = 221
        Top = 320
        Width = 9
        Height = 52
        Size.Values = (
          137.583333333333300000
          584.729166666666800000
          846.666666666666600000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 453
        Top = 320
        Width = 9
        Height = 52
        Size.Values = (
          137.583333333333300000
          1198.562500000000000000
          846.666666666666600000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 8
        Top = 344
        Width = 713
        Height = 7
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          910.166666666666600000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 22
        Top = 199
        Width = 66
        Height = 16
        Size.Values = (
          42.333333333333330000
          58.208333333333330000
          526.520833333333300000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel3: TQRLabel
        Left = 398
        Top = 199
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          1053.041666666667000000
          526.520833333333300000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel7: TQRLabel
        Left = 460
        Top = 388
        Width = 37
        Height = 16
        Size.Values = (
          42.333333333333330000
          1217.083333333333000000
          1026.583333333333000000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qriHeadLogo: TQRImage
        Left = 44
        Top = -23
        Width = 257
        Height = 145
        Size.Values = (
          383.645833333333300000
          116.416666666666700000
          -60.854166666666670000
          679.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object qrlblTemplateDate: TQRLabel
        Left = 232
        Top = 352
        Width = 100
        Height = 16
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          931.333333333333300000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblTemplateDate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblDateRequired: TQRLabel
        Left = 472
        Top = 352
        Width = 99
        Height = 16
        Size.Values = (
          42.333333333333330000
          1248.833333333333000000
          931.333333333333300000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDateRequired'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblTemplateDateLabel: TQRLabel
        Left = 233
        Top = 327
        Width = 154
        Height = 13
        Size.Values = (
          34.395833333333330000
          616.479166666666700000
          865.187500000000000000
          407.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Proposed Template date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblFitDateLabel: TQRLabel
        Left = 473
        Top = 327
        Width = 113
        Height = 13
        Size.Values = (
          34.395833333333330000
          1251.479166666667000000
          865.187500000000000000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Proposed Fit date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdSOLines: TQRSubDetail
      Left = 38
      Top = 456
      Width = 756
      Height = 24
      AlignToBottom = False
      BeforePrint = qrsdSOLinesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qrySOLine
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblTotalPrice: TQRLabel
        Left = 629
        Top = 4
        Width = 84
        Height = 16
        Size.Values = (
          42.333333333333330000
          1664.229166666667000000
          10.583333333333330000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblUnitPrice: TQRLabel
        Left = 554
        Top = 4
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          1465.791666666667000000
          10.583333333333330000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 16
        Top = 4
        Width = 441
        Height = 16
        Size.Values = (
          42.333333333333340000
          42.333333333333340000
          10.583333333333330000
          1166.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText7: TQRDBText
        Left = 513
        Top = 4
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          1357.312500000000000000
          10.583333333333330000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText2: TQRDBText
        Left = 462
        Top = 4
        Width = 37
        Height = 16
        Size.Values = (
          42.333333333333330000
          1222.375000000000000000
          10.583333333333330000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Quote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrbSOFooter: TQRBand
      Left = 38
      Top = 581
      Width = 756
      Height = 233
      AfterPrint = qrbSOFooterAfterPrint
      AlignToBottom = True
      BeforePrint = qrbSOFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        616.479166666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrshpPayment: TQRShape
        Left = 8
        Top = 15
        Width = 369
        Height = 106
        Size.Values = (
          280.458333333333300000
          21.166666666666670000
          39.687500000000000000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 641
        Top = 9
        Width = 81
        Height = 184
        Size.Values = (
          486.833333333333300000
          1695.979166666667000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 642
        Top = 127
        Width = 79
        Height = 9
        Size.Values = (
          23.812500000000000000
          1698.625000000000000000
          336.020833333333400000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 642
        Top = 97
        Width = 79
        Height = 4
        Size.Values = (
          10.583333333333330000
          1698.625000000000000000
          256.645833333333400000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 642
        Top = 66
        Width = 79
        Height = 4
        Size.Values = (
          10.583333333333330000
          1698.625000000000000000
          174.625000000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 642
        Top = 36
        Width = 79
        Height = 6
        Size.Values = (
          15.875000000000000000
          1698.625000000000000000
          95.250000000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 527
        Top = 47
        Width = 60
        Height = 16
        Size.Values = (
          42.333333333333330000
          1394.354166666667000000
          124.354166666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 527
        Top = 77
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          1394.354166666667000000
          203.729166666666700000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Order Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblVAT: TQRLabel
        Left = 661
        Top = 47
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          1748.895833333333000000
          124.354166666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblVAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblGross: TQRLabel
        Left = 653
        Top = 77
        Width = 60
        Height = 16
        Size.Values = (
          42.333333333333330000
          1727.729166666667000000
          203.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblNett: TQRLabel
        Left = 660
        Top = 17
        Width = 53
        Height = 16
        Size.Values = (
          42.333333333333330000
          1746.250000000000000000
          44.979166666666670000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblNett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDeposit: TQRLabel
        Left = 640
        Top = 137
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1693.333333333333000000
          362.479166666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDeposit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 527
        Top = 168
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1394.354166666667000000
          444.500000000000000000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Balance to pay:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblBalance: TQRLabel
        Left = 641
        Top = 168
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1695.979166666667000000
          444.500000000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblBalance'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape8: TQRShape
        Left = 756
        Top = 5
        Width = 6
        Height = 682
        Size.Values = (
          1804.458333333333000000
          2000.250000000000000000
          13.229166666666670000
          15.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel4: TQRLabel
        Left = 527
        Top = 17
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333330000
          1394.354166666667000000
          44.979166666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel5: TQRLabel
        Left = 527
        Top = 107
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          1394.354166666667000000
          283.104166666666700000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Deposit To Pay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel6: TQRLabel
        Left = 527
        Top = 137
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          1394.354166666667000000
          362.479166666666700000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Deposit Paid'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape9: TQRShape
        Left = 8
        Top = 6
        Width = 713
        Height = 7
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          15.875000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblToPay: TQRLabel
        Left = 651
        Top = 107
        Width = 62
        Height = 16
        Size.Values = (
          42.333333333333330000
          1722.437500000000000000
          283.104166666666700000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblToPay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape12: TQRShape
        Left = 642
        Top = 158
        Width = 79
        Height = 9
        Size.Values = (
          23.812500000000000000
          1698.625000000000000000
          418.041666666666700000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 16
        Top = 25
        Width = 353
        Height = 88
        Size.Values = (
          232.833333333333300000
          42.333333333333330000
          66.145833333333320000
          933.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          'Payment by cheque payable etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object qrlblDepositTerms: TQRLabel
        Left = 427
        Top = 107
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          1129.770833333333000000
          283.104166666666700000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Depoist Terms'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object gtQRShape9: TQRShape
      Left = 756
      Top = 416
      Width = 6
      Height = 483
      Size.Values = (
        1277.937500000000000000
        2000.250000000000000000
        1100.666666666667000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape10: TQRShape
      Left = 43
      Top = 416
      Width = 6
      Height = 483
      Size.Values = (
        1277.937500000000000000
        113.770833333333300000
        1100.666666666667000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape11: TQRShape
      Left = 676
      Top = 416
      Width = 6
      Height = 483
      Size.Values = (
        1277.937500000000000000
        1788.583333333333000000
        1100.666666666667000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 480
      Width = 756
      Height = 24
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdSOLines
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TQRLabel
        Left = 263
        Top = 2
        Width = 90
        Height = 16
        Size.Values = (
          42.333333333333330000
          695.854166666666700000
          5.291666666666667000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblWorktopArea: TQRLabel
        Left = 365
        Top = 2
        Width = 93
        Height = 16
        Size.Values = (
          42.333333333333330000
          965.729166666666700000
          5.291666666666667000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 504
      Width = 756
      Height = 26
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdSOLines
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TQRLabel
        Left = 381
        Top = 3
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          1008.062500000000000000
          7.937500000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblCutOut: TQRLabel
        Left = 285
        Top = 3
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333330000
          754.062500000000000000
          7.937500000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 530
      Width = 756
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdSOLines
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TQRLabel
        Left = 391
        Top = 2
        Width = 67
        Height = 16
        Size.Values = (
          42.333333333333330000
          1034.520833333333000000
          5.291666666666667000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblEdgeDescription: TQRLabel
        Left = 230
        Top = 3
        Width = 123
        Height = 16
        Size.Values = (
          42.333333333333330000
          608.541666666666700000
          7.937500000000000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 555
      Width = 756
      Height = 26
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdSOLines
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraQuantity: TQRDBText
        Left = 406
        Top = 4
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          1074.208333333333000000
          10.583333333333330000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblExtraDescription: TQRLabel
        Left = 230
        Top = 3
        Width = 123
        Height = 16
        Size.Values = (
          42.333333333333330000
          608.541666666666700000
          7.937500000000000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Account_Manager.Telephone_number as AM_Telephone_Number'
      'FROM Operator AS Account_Manager'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN Sales_Order'
      '          ON Operator.Operator = Sales_Order.Operator)'
      
        '          ON Account_Manager.Operator = Sales_Order.Account_Mana' +
        'ger'
      'WHERE Sales_Order.Sales_Order = :Sales_Order AND'
      '(Sales_Order.Operator = Operator.Operator)')
    Left = 379
    Top = 110
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 296
    Top = 56
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 374
    Top = 35
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Customer, Customer_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate,'
      'Telephone_Number,'
      'Email_Address,'
      'Credit_Status'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 454
    Top = 38
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 230
    Top = 51
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 454
    Top = 119
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 206
    Top = 199
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryEndUser: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select End_User, End_User_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate'
      'from End_User, VAT'
      'where End_User = :End_User and'
      'End_User.VAT = Vat.Vat')
    Left = 342
    Top = 158
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qrySOLine: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_Order_Line.Sales_Order,'
      '  Sales_Order_Line.Sales_order_Line_no,'
      '  Sales_Order_Line.Job,'
      '  Sales_Order_Line.Unit_price,'
      '  Sales_Order_Line.Quantity,'
      '  Sales_Order_Line.Sell_Unit,'
      
        '  ((Sales_Order_Line.Quantity / Sales_Order_Line.Sell_unit)* Sal' +
        'es_Order_Line.Unit_Price) as Total_Price,'
      '  Sales_Order_Line.Nett_Price,'
      '  Sales_Order_Line.Discount_Value,'
      '  Sales_Order_Line.Installation_price,'
      '  Sales_Order_Line.Survey_price,'
      '  Sales_Order_Line.Delivery_Price,'
      '  Sales_Order_Line.Description,'
      '  Sales_Order_Line.Product,'
      '  Sales_Order_Line.Quote,'
      '  Sales_Order_Line.Vat,'
      '  Vat.Vat_Rate,'
      '  Vat.Description as VAT_Description'
      'FROM Sales_Order_Line'
      '  INNER JOIN Vat ON Sales_Order_Line.Vat = Vat.Vat'
      'WHERE Sales_Order = :Sales_Order'
      'Order BY Sales_Order_Line_no')
    Left = 406
    Top = 288
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end>
    object qrySOLineSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySOLineSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
    end
    object qrySOLineJob: TFloatField
      FieldName = 'Job'
    end
    object qrySOLineUnit_price: TFloatField
      FieldName = 'Unit_price'
      DisplayFormat = '0.00'
    end
    object qrySOLineQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object qrySOLineSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qrySOLineTotal_Price: TFloatField
      FieldName = 'Total_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLineNett_Price: TFloatField
      FieldName = 'Nett_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLineDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      DisplayFormat = '0.00'
    end
    object qrySOLineInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = '0.00'
    end
    object qrySOLineSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = '0.00'
    end
    object qrySOLineDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLineDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object qrySOLineProduct: TIntegerField
      FieldName = 'Product'
    end
    object qrySOLineVat: TIntegerField
      FieldName = 'Vat'
    end
    object qrySOLineVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      DisplayFormat = '0.00'
    end
    object qrySOLineVAT_Description: TStringField
      FieldName = 'VAT_Description'
      Size = 40
    end
    object qrySOLineQuote: TIntegerField
      FieldName = 'Quote'
    end
  end
  object qryCompanyAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number, '
      'Company_Name,'
      'VAT_Number '
      'from Company')
    Left = 464
    Top = 249
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_Code = :Notes_Code)'
      'Order By Notes_Line')
    Left = 240
    Top = 21
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object dtsSOLine: TDataSource
    DataSet = qrySOLine
    Left = 478
    Top = 291
  end
  object qryQElements: TFDQuery
    MasterSource = dtsSOLine
    MasterFields = 'Quote'
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description'
      'FROM Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN (Material_Use'
      '      RIGHT JOIN Quote_Element'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Element_number')
    Left = 840
    Top = 24
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQEdges: TFDQuery
    MasterSource = dtsSOLine
    MasterFields = 'Quote'
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 910
    Top = 22
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQCutOuts: TFDQuery
    MasterSource = dtsSOLine
    MasterFields = 'Quote'
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 974
    Top = 22
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQExtras: TFDQuery
    MasterSource = dtsSOLine
    MasterFields = 'Quote'
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 1038
    Top = 25
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryUpSOStatus: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'update Sales_Order'
      'set Sales_Order_Status = :Sales_Order_Status'
      'Where Sales_Order = :Sales_Order')
    Left = 326
    Top = 293
    ParamData = <
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
end
