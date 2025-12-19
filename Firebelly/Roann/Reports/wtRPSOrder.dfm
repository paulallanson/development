object frmwtRPSOrder: TfrmwtRPSOrder
  Left = 330
  Top = 5
  Caption = 'Sales Order Print'
  ClientHeight = 707
  ClientWidth = 1190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 144
    Top = -46
    Width = 992
    Height = 1403
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
      100.000000000000000000
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
      Left = 47
      Top = 532
      Width = 945
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgSalesOrderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sales_order'
      FooterBand = qrbSOFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 945
      Height = 485
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1026.583333333333000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 10
        Top = 443
        Width = 893
        Height = 39
        Size.Values = (
          82.020833333333340000
          21.166666666666670000
          936.625000000000100000
          1889.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 10
        Top = 370
        Width = 891
        Height = 61
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          783.166666666666800000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 530
        Top = 71
        Width = 371
        Height = 100
        Size.Values = (
          211.666666666666700000
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
        Left = 380
        Top = -10
        Width = 534
        Height = 55
        Size.Values = (
          116.416666666666700000
          804.333333333333300000
          -21.166666666666670000
          1130.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'ORDER CONFIRMATION'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -47
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 28
      end
      object QRLabel2: TQRLabel
        Left = 544
        Top = 114
        Width = 82
        Height = 18
        Size.Values = (
          38.100000000000000000
          1151.466666666667000000
          241.300000000000000000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 809
        Top = 114
        Width = 85
        Height = 20
        Size.Values = (
          42.333333333333330000
          1712.383333333333000000
          241.300000000000000000
          179.916666666666700000)
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
        Font.Height = -13
        Font.Name = 'Lucida Sans'
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
      object QRDBText2: TQRDBText
        Left = 812
        Top = 80
        Width = 82
        Height = 20
        Size.Values = (
          42.333333333333330000
          1718.733333333333000000
          169.333333333333300000
          173.566666666666700000)
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
        Font.Height = -13
        Font.Name = 'Lucida Sans'
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
      object QRLabel3: TQRLabel
        Left = 544
        Top = 80
        Width = 68
        Height = 18
        Size.Values = (
          38.100000000000000000
          1151.466666666667000000
          169.333333333333300000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 19
        Top = 406
        Width = 251
        Height = 19
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          859.895833333333400000
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
        Font.Height = -13
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
        Left = 19
        Top = 378
        Width = 109
        Height = 16
        Size.Values = (
          33.866666666666670000
          40.216666666666670000
          800.100000000000000000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 591
        Top = 376
        Width = 127
        Height = 16
        Size.Values = (
          33.866666666666670000
          1250.950000000000000000
          795.866666666666700000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Proposed Fit date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 20
        Top = 455
        Width = 74
        Height = 20
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          963.083333333333300000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 570
        Top = 455
        Width = 54
        Height = 20
        Size.Values = (
          42.333333333333330000
          1206.500000000000000000
          963.083333333333300000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 650
        Top = 455
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1375.833333333333000000
          963.083333333333300000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 824
        Top = 455
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1744.133333333333000000
          963.083333333333300000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 291
        Top = 376
        Width = 173
        Height = 16
        Size.Values = (
          33.866666666666670000
          615.950000000000000000
          795.866666666666700000
          366.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Proposed Template date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object memAddress: TQRRichText
        Left = 16
        Top = 110
        Width = 401
        Height = 71
        Size.Values = (
          150.812500000000000000
          34.395833333333340000
          232.833333333333400000
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
        Left = 686
        Top = 70
        Width = 11
        Height = 100
        Size.Values = (
          211.666666666666700000
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
        Left = 530
        Top = 99
        Width = 371
        Height = 6
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          209.020833333333300000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape1: TQRShape
        Left = 530
        Top = 135
        Width = 371
        Height = 6
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          285.750000000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 9
        Top = 191
        Width = 410
        Height = 171
        Size.Values = (
          361.950000000000000000
          19.050000000000000000
          404.283333333333300000
          867.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 18
        Top = 218
        Width = 361
        Height = 131
        Size.Values = (
          277.283333333333300000
          38.100000000000000000
          461.433333333333300000
          764.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRLabel1: TQRLabel
        Left = 544
        Top = 149
        Width = 104
        Height = 18
        Size.Values = (
          38.100000000000000000
          1151.466666666667000000
          315.383333333333300000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRDBText1: TQRDBText
        Left = 700
        Top = 149
        Width = 194
        Height = 20
        Size.Values = (
          42.333333333333340000
          1481.666666666667000000
          314.854166666666700000
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
        Font.Height = -13
        Font.Name = 'Lucida Sans'
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
      object gtQRShape2: TQRShape
        Left = 483
        Top = 191
        Width = 420
        Height = 171
        Size.Values = (
          362.479166666666700000
          1021.291666666667000000
          404.812500000000000000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmSiteAddress: TQRMemo
        Left = 500
        Top = 218
        Width = 361
        Height = 131
        Size.Values = (
          277.812500000000000000
          1058.333333333333000000
          460.375000000000000000
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
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRShape4: TQRShape
        Left = 276
        Top = 370
        Width = 11
        Height = 61
        Size.Values = (
          129.645833333333300000
          584.729166666666800000
          783.166666666666800000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 566
        Top = 370
        Width = 11
        Height = 61
        Size.Values = (
          129.645833333333300000
          1198.562500000000000000
          783.166666666666800000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 10
        Top = 396
        Width = 891
        Height = 6
        Size.Values = (
          13.229166666666670000
          21.166666666666670000
          838.729166666666800000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 18
        Top = 196
        Width = 67
        Height = 20
        Size.Values = (
          42.333333333333330000
          38.100000000000000000
          414.866666666666700000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel3: TQRLabel
        Left = 498
        Top = 196
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333330000
          1054.100000000000000000
          414.866666666666700000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qriHeadLogo: TQRImage
        Left = 65
        Top = -30
        Width = 306
        Height = 141
        Size.Values = (
          298.979166666666700000
          137.583333333333300000
          -63.500000000000000000
          648.229166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRLabel7: TQRLabel
        Left = 730
        Top = 455
        Width = 59
        Height = 20
        Size.Values = (
          42.333333333333330000
          1545.166666666667000000
          963.083333333333300000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT Rate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblTemplateDate: TQRLabel
        Left = 290
        Top = 405
        Width = 115
        Height = 20
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          857.250000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblTemplateDate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 590
        Top = 405
        Width = 115
        Height = 20
        Size.Values = (
          42.333333333333330000
          1248.833333333333000000
          857.250000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDateRequired'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdSOLines: TQRSubDetail
      Left = 47
      Top = 535
      Width = 945
      Height = 30
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
      object qrlblUnitPrice: TQRLabel
        Left = 636
        Top = 5
        Width = 83
        Height = 20
        Size.Values = (
          42.333333333333330000
          1346.200000000000000000
          10.583333333333330000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblTotalPrice: TQRLabel
        Left = 802
        Top = 5
        Width = 89
        Height = 20
        Size.Values = (
          42.333333333333330000
          1697.566666666667000000
          10.583333333333330000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 576
        Top = 5
        Width = 54
        Height = 20
        Size.Values = (
          42.333333333333330000
          1219.200000000000000000
          10.583333333333330000
          114.300000000000000000)
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
        Font.Height = -13
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
      object qrlblDescription: TQRLabel
        Left = 20
        Top = 5
        Width = 541
        Height = 20
        Size.Values = (
          42.333333333333340000
          42.333333333333340000
          10.583333333333330000
          1145.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRDBText2: TQRDBText
        Left = 733
        Top = 5
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          1551.516666666667000000
          10.583333333333330000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Vat_Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
    end
    object qrbSOFooter: TQRBand
      Left = 47
      Top = 692
      Width = 945
      Height = 3
      AfterPrint = qrbSOFooterAfterPrint
      AlignToBottom = True
      BeforePrint = qrbSOFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape10: TQRShape
        Left = 801
        Top = 11
        Width = 101
        Height = 230
        Size.Values = (
          486.833333333333400000
          1695.979166666667000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 945
        Top = 6
        Width = 8
        Height = 852
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
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 695
      Width = 945
      Height = 241
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        510.116666666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRShape9: TQRShape
        Left = 10
        Top = 8
        Width = 891
        Height = 9
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
      object qrshpPayment: TQRShape
        Left = 10
        Top = 19
        Width = 481
        Height = 153
        Size.Values = (
          322.791666666666700000
          21.166666666666670000
          39.687500000000000000
          1018.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 20
        Top = 31
        Width = 461
        Height = 130
        Size.Values = (
          275.166666666666700000
          42.333333333333340000
          66.145833333333340000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          'Payment by cheque payable etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRLabel4: TQRLabel
        Left = 718
        Top = 21
        Width = 58
        Height = 20
        Size.Values = (
          42.333333333333330000
          1519.766666666667000000
          44.450000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 715
        Top = 59
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333330000
          1513.416666666667000000
          124.883333333333300000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 695
        Top = 96
        Width = 81
        Height = 19
        Size.Values = (
          40.216666666666670000
          1471.083333333333000000
          203.200000000000000000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel5: TQRLabel
        Left = 680
        Top = 131
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          1439.333333333333000000
          277.283333333333300000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deposit To Pay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblDepositPaid: TQRLabel
        Left = 695
        Top = 169
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          1471.083333333333000000
          357.716666666666700000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Deposit paid'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 683
        Top = 202
        Width = 93
        Height = 21
        Size.Values = (
          44.450000000000000000
          1445.683333333333000000
          427.566666666666700000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Balance to pay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblBalance: TQRLabel
        Left = 815
        Top = 202
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          1725.083333333333000000
          427.566666666666700000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblBalance'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblDeposit: TQRLabel
        Left = 813
        Top = 169
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1720.850000000000000000
          357.716666666666700000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDeposit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblToPay: TQRLabel
        Left = 826
        Top = 131
        Width = 65
        Height = 20
        Size.Values = (
          42.333333333333330000
          1748.366666666667000000
          277.283333333333300000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblToPay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblGross: TQRLabel
        Left = 820
        Top = 95
        Width = 72
        Height = 20
        Size.Values = (
          42.333333333333330000
          1735.666666666667000000
          201.083333333333300000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblVAT: TQRLabel
        Left = 838
        Top = 59
        Width = 53
        Height = 20
        Size.Values = (
          42.333333333333330000
          1773.766666666667000000
          124.883333333333300000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblVAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape13: TQRShape
        Left = 803
        Top = 44
        Width = 98
        Height = 8
        Size.Values = (
          16.933333333333330000
          1699.683333333333000000
          93.133333333333330000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 803
        Top = 80
        Width = 98
        Height = 5
        Size.Values = (
          10.583333333333330000
          1699.683333333333000000
          169.333333333333300000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 803
        Top = 116
        Width = 98
        Height = 5
        Size.Values = (
          10.583333333333330000
          1699.683333333333000000
          245.533333333333300000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 803
        Top = 152
        Width = 98
        Height = 11
        Size.Values = (
          23.283333333333330000
          1699.683333333333000000
          321.733333333333300000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape12: TQRShape
        Left = 803
        Top = 188
        Width = 98
        Height = 11
        Size.Values = (
          23.283333333333330000
          1699.683333333333000000
          397.933333333333300000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblDepositTerms: TQRLabel
        Left = 579
        Top = 131
        Width = 93
        Height = 21
        Size.Values = (
          44.450000000000000000
          1225.550000000000000000
          277.283333333333300000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Deposit Terms'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 803
        Top = 224
        Width = 98
        Height = 3
        Size.Values = (
          6.350000000000000000
          1699.683333333333000000
          474.133333333333300000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblNett: TQRLabel
        Left = 837
        Top = 21
        Width = 55
        Height = 20
        Size.Values = (
          42.333333333333330000
          1771.650000000000000000
          44.450000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblNett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object gtQRShape9: TQRShape
      Left = 946
      Top = 490
      Width = 8
      Height = 850
      Size.Values = (
        1799.166666666667000000
        2002.366666666667000000
        1037.166666666667000000
        16.933333333333330000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape10: TQRShape
      Left = 53
      Top = 490
      Width = 8
      Height = 638
      Size.Values = (
        1350.433333333333000000
        112.183333333333300000
        1037.166666666667000000
        16.933333333333330000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape11: TQRShape
      Left = 845
      Top = 490
      Width = 8
      Height = 850
      Size.Values = (
        1799.166666666667000000
        1788.583333333333000000
        1037.166666666667000000
        16.933333333333330000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrsdQElements: TQRSubDetail
      Left = 47
      Top = 565
      Width = 945
      Height = 30
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
      object lblWorktopArea: TQRLabel
        Left = 463
        Top = 3
        Width = 99
        Height = 19
        Size.Values = (
          40.216666666666670000
          980.016666666666700000
          6.350000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblWorktopSize: TQRLabel
        Left = 20
        Top = 3
        Width = 475
        Height = 19
        Size.Values = (
          39.687500000000000000
          42.333333333333330000
          5.291666666666667000
          1005.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdQCutOuts: TQRSubDetail
      Left = 47
      Top = 595
      Width = 945
      Height = 33
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdSOLines
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TQRLabel
        Left = 482
        Top = 4
        Width = 81
        Height = 19
        Size.Values = (
          40.216666666666670000
          1020.233333333333000000
          8.466666666666667000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCutOut: TQRLabel
        Left = 20
        Top = 4
        Width = 475
        Height = 19
        Size.Values = (
          39.687500000000000000
          42.333333333333330000
          7.937500000000000000
          1005.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdQEdges: TQRSubDetail
      Left = 47
      Top = 628
      Width = 945
      Height = 31
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        65.616666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdSOLines
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TQRLabel
        Left = 491
        Top = 3
        Width = 72
        Height = 19
        Size.Values = (
          40.216666666666670000
          1039.283333333333000000
          6.350000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblEdgeDescription: TQRLabel
        Left = 20
        Top = 4
        Width = 475
        Height = 19
        Size.Values = (
          39.687500000000000000
          42.333333333333330000
          7.937500000000000000
          1005.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdQExtras: TQRSubDetail
      Left = 47
      Top = 659
      Width = 945
      Height = 33
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdSOLines
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraQuantity: TQRDBText
        Left = 507
        Top = 5
        Width = 54
        Height = 19
        Size.Values = (
          40.216666666666670000
          1073.150000000000000000
          10.583333333333330000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      object qrlblExtraDescription: TQRLabel
        Left = 20
        Top = 4
        Width = 475
        Height = 19
        Size.Values = (
          39.687500000000000000
          42.333333333333330000
          7.937500000000000000
          1005.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
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
      '(Sales_Order.Operator = Operator.Operator)'
      '')
    Left = 291
    Top = 102
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
    object qrySOLineDescription: TWideStringField
      FieldName = 'Description'
      Size = 255
    end
    object qrySOLineProduct: TIntegerField
      FieldName = 'Product'
    end
    object qrySOLineVat: TIntegerField
      FieldName = 'Vat'
    end
    object qrySOLineVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      DisplayFormat = '0.00%'
    end
    object qrySOLineVAT_Description: TWideStringField
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
  object qryQElements: TFDQuery
    MasterSource = dtsSOLine
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
  object dtsSOLine: TDataSource
    DataSet = qrySOLine
    Left = 478
    Top = 291
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
  object qryReportOld: TFDQuery
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
    Left = 563
    Top = 22
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end>
  end
  object qryReportNew: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Account_Manager.Telephone_number as AM_Telephone_Number,'
      '        Customer.Is_retail_customer,'
      '        Customer.Customer_is_Speculative,'
      '        Sales_Order.Contact_name'
      'FROM Customer'
      '        INNER JOIN (Operator AS Account_Manager'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN Sales_Order'
      '            ON Operator.Operator = Sales_Order.Operator)'
      
        '            ON Account_Manager.Operator = Sales_Order.Account_Ma' +
        'nager)'
      '            ON Customer.Customer = Sales_Order.Customer'
      'WHERE Sales_Order.Sales_Order = :Sales_Order')
    Left = 643
    Top = 22
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end>
  end
end
