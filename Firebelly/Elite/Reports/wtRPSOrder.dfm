object frmwtRPSOrder: TfrmwtRPSOrder
  Left = 237
  Top = 92
  Caption = 'Sales Order Print'
  ClientHeight = 707
  ClientWidth = 1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 40
    Top = -246
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
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
      150.000000000000000000
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
      Top = 445
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
      Top = 57
      Width = 756
      Height = 388
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
        Left = 8
        Top = 354
        Width = 714
        Height = 31
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
        Left = 8
        Top = 296
        Width = 713
        Height = 49
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
        Left = 424
        Top = 57
        Width = 297
        Height = 80
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
        Left = 302
        Top = -7
        Width = 432
        Height = 43
        Size.Values = (
          113.770833333333300000
          799.041666666666700000
          -18.520833333333330000
          1143.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ORDER CONFIRMATION'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 28
      end
      object QRLabel2: TQRLabel
        Left = 435
        Top = 91
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1150.937500000000000000
          240.770833333333300000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText1: TQRDBText
        Left = 647
        Top = 91
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333330000
          1711.854166666667000000
          240.770833333333300000
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
      object QRDBText2: TQRDBText
        Left = 646
        Top = 64
        Width = 69
        Height = 16
        Size.Values = (
          42.333333333333330000
          1709.208333333333000000
          169.333333333333300000
          182.562500000000000000)
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
      object QRLabel3: TQRLabel
        Left = 435
        Top = 64
        Width = 53
        Height = 16
        Size.Values = (
          42.333333333333330000
          1150.937500000000000000
          169.333333333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText4: TQRDBText
        Left = 15
        Top = 325
        Width = 201
        Height = 15
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
      object QRLabel5: TQRLabel
        Left = 15
        Top = 302
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          799.041666666666700000
          238.125000000000000000)
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
        Font.Name = 'Arial'
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
        Top = 176
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          465.666666666666700000
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
      object qrlblFitDateLabel: TQRLabel
        Left = 473
        Top = 301
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          1251.479166666667000000
          796.395833333333300000
          267.229166666666700000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 16
        Top = 364
        Width = 55
        Height = 16
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          963.083333333333300000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel12: TQRLabel
        Left = 456
        Top = 364
        Width = 41
        Height = 16
        Size.Values = (
          42.333333333333330000
          1206.500000000000000000
          963.083333333333300000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel14: TQRLabel
        Left = 520
        Top = 364
        Width = 46
        Height = 16
        Size.Values = (
          42.333333333333330000
          1375.833333333333000000
          963.083333333333300000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel15: TQRLabel
        Left = 659
        Top = 364
        Width = 46
        Height = 16
        Size.Values = (
          42.333333333333330000
          1743.604166666667000000
          963.083333333333300000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblTemplateDateLabel: TQRLabel
        Left = 233
        Top = 301
        Width = 140
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666666700000
          796.395833333333300000
          370.416666666666700000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 549
        Top = 56
        Width = 9
        Height = 80
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
        Left = 424
        Top = 79
        Width = 297
        Height = 5
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
        Left = 424
        Top = 108
        Width = 297
        Height = 5
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
        Left = 8
        Top = 153
        Width = 328
        Height = 137
        Size.Values = (
          362.479166666666700000
          21.166666666666670000
          404.812500000000000000
          867.833333333333500000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 14
        Top = 174
        Width = 289
        Height = 105
        Size.Values = (
          277.812500000000000000
          37.041666666666670000
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
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRLabel1: TQRLabel
        Left = 435
        Top = 119
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          1150.937500000000000000
          314.854166666666700000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRDBText1: TQRDBText
        Left = 560
        Top = 119
        Width = 155
        Height = 16
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
      object gtQRShape2: TQRShape
        Left = 386
        Top = 153
        Width = 336
        Height = 137
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
        Left = 400
        Top = 174
        Width = 289
        Height = 105
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
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRShape4: TQRShape
        Left = 221
        Top = 296
        Width = 9
        Height = 49
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
        Left = 453
        Top = 296
        Width = 9
        Height = 49
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
        Left = 8
        Top = 317
        Width = 713
        Height = 5
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
        Left = 14
        Top = 157
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333330000
          37.041666666666670000
          415.395833333333300000
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
      object gtQRLabel3: TQRLabel
        Left = 398
        Top = 157
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333330000
          1053.041666666667000000
          415.395833333333300000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel7: TQRLabel
        Left = 584
        Top = 364
        Width = 48
        Height = 16
        Size.Values = (
          42.333333333333330000
          1545.166666666667000000
          963.083333333333300000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT Rate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblTemplateDate: TQRLabel
        Left = 232
        Top = 324
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          857.250000000000000000
          227.541666666666700000)
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
        Font.Name = 'Arial'
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
        Top = 324
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          1248.833333333333000000
          857.250000000000000000
          227.541666666666700000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qriHeadLogo: TQRImage
        Left = 12
        Top = 0
        Width = 220
        Height = 65
        Size.Values = (
          171.979166666666700000
          31.750000000000000000
          0.000000000000000000
          582.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
    end
    object qrsdSOLines: TQRSubDetail
      Left = 38
      Top = 447
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
      object qrlblUnitPrice: TQRLabel
        Left = 512
        Top = 4
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1354.666666666667000000
          10.583333333333330000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblTotalPrice: TQRLabel
        Left = 645
        Top = 4
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333330000
          1706.562500000000000000
          10.583333333333330000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText7: TQRDBText
        Left = 463
        Top = 4
        Width = 41
        Height = 16
        Size.Values = (
          42.333333333333330000
          1225.020833333333000000
          10.583333333333330000
          108.479166666666700000)
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
      object qrlblDescription: TQRLabel
        Left = 16
        Top = 4
        Width = 433
        Height = 16
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
      object gtQRDBText2: TQRDBText
        Left = 586
        Top = 4
        Width = 46
        Height = 16
        Size.Values = (
          42.333333333333330000
          1550.458333333333000000
          10.583333333333330000
          121.708333333333300000)
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
    object qrbSOFooter: TQRBand
      Left = 38
      Top = 572
      Width = 756
      Height = 5
      AfterPrint = qrbSOFooterAfterPrint
      AlignToBottom = True
      BeforePrint = qrbSOFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
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
      object qrlblDepositTerms: TQRLabel
        Left = 443
        Top = 107
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1172.104166666667000000
          283.104166666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Deposit Terms'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object QRBand1: TQRBand
      Left = 38
      Top = 577
      Width = 756
      Height = 232
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        613.833333333333300000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrshpPayment: TQRShape
        Left = 8
        Top = 39
        Width = 385
        Height = 122
        Size.Values = (
          322.791666666666700000
          21.166666666666670000
          103.187500000000000000
          1018.645833333333000000)
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
        Height = 183
        Size.Values = (
          484.187500000000000000
          1695.979166666667000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblPaymentTerms: TQRLabel
        Left = 15
        Top = 19
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          50.270833333333330000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Payment Terms:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object memPayment: TQRMemo
        Left = 16
        Top = 49
        Width = 369
        Height = 104
        Size.Values = (
          275.166666666666700000
          42.333333333333340000
          129.645833333333300000
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
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Payment by cheque payable etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRLabel8: TQRLabel
        Left = 15
        Top = 171
        Width = 406
        Height = 15
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          452.437500000000000000
          1074.208333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Order subject to our standard Terms and Conditions which are ava' +
          'ilable on request.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel4: TQRLabel
        Left = 535
        Top = 17
        Width = 46
        Height = 16
        Size.Values = (
          42.333333333333330000
          1415.520833333333000000
          44.979166666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel17: TQRLabel
        Left = 535
        Top = 47
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333330000
          1415.520833333333000000
          124.354166666666700000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel18: TQRLabel
        Left = 535
        Top = 77
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1415.520833333333000000
          203.729166666666700000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel5: TQRLabel
        Left = 535
        Top = 107
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          283.104166666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deposit To Pay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel6: TQRLabel
        Left = 535
        Top = 137
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          362.479166666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deposit Paid'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel13: TQRLabel
        Left = 535
        Top = 168
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          444.500000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Balance to pay:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblNett: TQRLabel
        Left = 673
        Top = 17
        Width = 40
        Height = 16
        Size.Values = (
          42.333333333333330000
          1780.645833333333000000
          44.979166666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblNett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblVAT: TQRLabel
        Left = 670
        Top = 47
        Width = 43
        Height = 16
        Size.Values = (
          42.333333333333330000
          1772.708333333333000000
          124.354166666666700000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblVAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblToPay: TQRLabel
        Left = 662
        Top = 107
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          1751.541666666667000000
          283.104166666666700000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblToPay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblDeposit: TQRLabel
        Left = 656
        Top = 137
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          362.479166666666700000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDeposit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblBalance: TQRLabel
        Left = 645
        Top = 168
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          444.500000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblBalance'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRShape13: TQRShape
        Left = 642
        Top = 36
        Width = 78
        Height = 6
        Size.Values = (
          15.875000000000000000
          1698.625000000000000000
          95.250000000000000000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 642
        Top = 66
        Width = 78
        Height = 4
        Size.Values = (
          10.583333333333330000
          1698.625000000000000000
          174.625000000000000000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 642
        Top = 97
        Width = 78
        Height = 4
        Size.Values = (
          10.583333333333330000
          1698.625000000000000000
          256.645833333333400000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 642
        Top = 127
        Width = 78
        Height = 9
        Size.Values = (
          23.812500000000000000
          1698.625000000000000000
          336.020833333333400000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape12: TQRShape
        Left = 642
        Top = 158
        Width = 78
        Height = 9
        Size.Values = (
          23.812500000000000000
          1698.625000000000000000
          418.041666666666700000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object memAddress: TQRRichText
        Left = 101
        Top = 214
        Width = 532
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333330000
          267.229166666666700000
          566.208333333333300000
          1407.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memAddress')
      end
    end
    object gtQRShape9: TQRShape
      Left = 756
      Top = 411
      Width = 6
      Height = 483
      Size.Values = (
        1277.937500000000000000
        2000.250000000000000000
        1087.437500000000000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape10: TQRShape
      Left = 43
      Top = 411
      Width = 6
      Height = 451
      Size.Values = (
        1193.270833333333000000
        113.770833333333300000
        1087.437500000000000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape11: TQRShape
      Left = 676
      Top = 411
      Width = 6
      Height = 483
      Size.Values = (
        1277.937500000000000000
        1788.583333333333000000
        1087.437500000000000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 471
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
        Left = 273
        Top = 2
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          722.312500000000000000
          5.291666666666667000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblWorktopArea: TQRLabel
        Left = 375
        Top = 2
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          992.187500000000000000
          5.291666666666667000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 495
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
        Left = 389
        Top = 3
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          1029.229166666667000000
          7.937500000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblCutOut: TQRLabel
        Left = 291
        Top = 3
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          769.937500000000000000
          7.937500000000000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 521
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
        Left = 396
        Top = 2
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          1047.750000000000000000
          5.291666666666667000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblEdgeDescription: TQRLabel
        Left = 246
        Top = 3
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          650.875000000000000000
          7.937500000000000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 546
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
        Left = 408
        Top = 4
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          1079.500000000000000000
          10.583333333333330000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
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
      object qrlblExtraDescription: TQRLabel
        Left = 245
        Top = 3
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          648.229166666666700000
          7.937500000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Account_Manager.Telephone_number as AM_Telephone_Number,'
      '        Customer.Is_retail_customer,'
      '        Customer.Customer_is_Speculative,'
      '        Customer.Account_is_Factored,'
      '        Customer.Credit_Status,'
      '        Customer.Credit_Limit'
      'FROM Customer'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Sales_Order'
      '        ON Operator.Operator = Sales_Order.Operator)'
      
        '        ON Account_Manager.Operator = Sales_Order.Account_Manage' +
        'r)'
      '        ON Customer.Customer = Sales_Order.Customer'
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
      'SELECT'
      '      Customer,'
      '      Customer_name,'
      '      Street,'
      '      Locale,'
      '      Town_City,'
      '      postcode,'
      '      County_State,'
      '      Vat.Vat_Rate,'
      '      Telephone_Number,'
      '      Email_Address,'
      '      Credit_Status,'
      '      Payment_Terms.Payment_Terms_Description'
      'FROM Payment_Terms'
      '    RIGHT JOIN (Vat'
      '    INNER JOIN Customer'
      '      ON Vat.Vat = Customer.Vat)'
      '      ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'WHERE Customer = :Customer')
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
    Left = 414
    Top = 159
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
      '  Sales_Order_Line.Markup_Value,'
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
      DisplayFormat = '0.00%'
    end
    object qrySOLineVAT_Description: TWideStringField
      FieldName = 'VAT_Description'
      Size = 40
    end
    object qrySOLineQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qrySOLineMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
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
  object qryQSlabs: TFDQuery
    MasterSource = dtsSOLine
    MasterFields = 'Quote'
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Slab.*,'
      '        Quote_Slab.Slab_Number as Element_Number,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description'
      'FROM Material_Type'
      '    INNER JOIN (Thickness'
      '    INNER JOIN (Worktop'
      '    INNER JOIN Quote_Slab'
      '        ON Worktop.Worktop = Quote_Slab.Worktop)'
      '        ON Thickness.Thickness = Quote_Slab.Thickness)'
      '        ON Material_Type.Material_Type = Worktop.Material_Type'
      'WHERE Quote = :Quote'
      'ORDER BY Slab_number')
    Left = 840
    Top = 80
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQElementsDummy: TFDQuery
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
    Left = 920
    Top = 80
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryGetQuote: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Contract_Quote_ID'
      'FROM Quote'
      'WHERE Quote = :Quote')
    Left = 920
    Top = 136
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
