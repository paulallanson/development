object frmwtRPTemplate: TfrmwtRPTemplate
  Left = 2
  Top = 32
  Caption = 'Template Check List'
  ClientHeight = 699
  ClientWidth = 1215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 224
    Top = -462
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
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
    ReportTitle = 'Template Check List'
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
    object qrgQuote: TQRGroup
      Left = 38
      Top = 1081
      Width = 718
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 1043
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2759.604166666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object gtQRShape14: TQRShape
        Left = 320
        Top = 83
        Width = 397
        Height = 39
        Size.Values = (
          103.187500000000000000
          846.666666666666600000
          219.604166666666700000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape45: TQRShape
        Left = 0
        Top = 725
        Width = 717
        Height = 317
        Size.Values = (
          838.729166666666700000
          0.000000000000000000
          1918.229166666667000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 121
        Width = 717
        Height = 291
        Size.Values = (
          769.937500000000000000
          0.000000000000000000
          320.145833333333400000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblTemplate: TQRLabel
        Left = 368
        Top = -5
        Width = 335
        Height = 43
        Size.Values = (
          113.770833333333300000
          973.666666666666700000
          -13.229166666666670000
          886.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Check List'
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
      object QRLabel14: TQRLabel
        Left = 248
        Top = 780
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          2063.750000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Right / Left'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 248
        Top = 876
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          2317.750000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sink Style'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel4: TQRLabel
        Left = 327
        Top = 216
        Width = 128
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          571.500000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation address:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrmSiteAddress: TQRMemo
        Left = 328
        Top = 235
        Width = 377
        Height = 98
        Size.Values = (
          259.291666666666700000
          867.833333333333300000
          621.770833333333300000
          997.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 16
        Top = 756
        Width = 99
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2000.250000000000000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hob/Drop In Sink'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape1: TQRShape
        Left = 152
        Top = 756
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          2000.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 16
        Top = 780
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2063.750000000000000000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Polished Cutout'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape2: TQRShape
        Left = 152
        Top = 780
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          2063.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel6: TQRLabel
        Left = 327
        Top = 344
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          910.166666666666700000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRDBText2: TQRDBText
        Left = 406
        Top = 344
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          1074.208333333333000000
          910.166666666666700000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Name'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel7: TQRLabel
        Left = 327
        Top = 370
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          978.958333333333300000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRDBText3: TQRDBText
        Left = 406
        Top = 370
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1074.208333333333000000
          978.958333333333300000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Phone'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape3: TQRShape
        Left = 0
        Top = 264
        Width = 321
        Height = 63
        Size.Values = (
          166.687500000000000000
          0.000000000000000000
          698.500000000000000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSalesOrder: TQRLabel
        Left = 15
        Top = 130
        Width = 122
        Height = 20
        Size.Values = (
          52.916666666666670000
          39.687500000000000000
          343.958333333333300000
          322.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblSalesOrderNo: TQRDBText
        Left = 156
        Top = 130
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666670000
          412.750000000000000000
          343.958333333333300000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object gtQRShape4: TQRShape
        Left = 320
        Top = 121
        Width = 397
        Height = 40
        Size.Values = (
          105.833333333333300000
          846.666666666666600000
          320.145833333333400000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 0
        Top = 160
        Width = 717
        Height = 51
        Size.Values = (
          134.937500000000000000
          0.000000000000000000
          423.333333333333300000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 0
        Top = 210
        Width = 321
        Height = 55
        Size.Values = (
          145.520833333333300000
          0.000000000000000000
          555.625000000000000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 15
        Top = 171
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          452.437500000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 96
        Top = 171
        Width = 617
        Height = 36
        Size.Values = (
          95.250000000000000000
          254.000000000000000000
          452.437500000000000000
          1632.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
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
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 15
        Top = 219
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          579.437500000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edge Detail:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel8: TQRLabel
        Left = 15
        Top = 276
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          730.250000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Thickness:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape7: TQRShape
        Left = 0
        Top = 326
        Width = 321
        Height = 67
        Size.Values = (
          177.270833333333300000
          0.000000000000000000
          862.541666666666900000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel9: TQRLabel
        Left = 15
        Top = 339
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          896.937500000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Upstands:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel10: TQRLabel
        Left = 15
        Top = 364
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          963.083333333333300000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Height:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape7: TQRShape
        Left = 102
        Top = 371
        Width = 153
        Height = 8
        Size.Values = (
          21.166666666666670000
          269.875000000000000000
          981.604166666666800000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel11: TQRLabel
        Left = 263
        Top = 364
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          695.854166666666700000
          963.083333333333300000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel12: TQRLabel
        Left = 15
        Top = 301
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          796.395833333333300000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Height:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape8: TQRShape
        Left = 102
        Top = 308
        Width = 153
        Height = 8
        Size.Values = (
          21.166666666666670000
          269.875000000000000000
          814.916666666666800000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel13: TQRLabel
        Left = 263
        Top = 301
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          695.854166666666700000
          796.395833333333300000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape9: TQRShape
        Left = 320
        Top = 45
        Width = 397
        Height = 39
        Size.Values = (
          103.187500000000000000
          846.666666666666600000
          119.062500000000000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 329
        Top = 58
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          870.479166666666700000
          153.458333333333300000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 329
        Top = 94
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          870.479166666666700000
          248.708333333333300000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 408
        Top = 94
        Width = 297
        Height = 17
        Size.Values = (
          44.979166666666670000
          1079.500000000000000000
          248.708333333333300000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape10: TQRShape
        Left = 0
        Top = 392
        Width = 321
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1037.166666666667000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TQRShape
        Left = 320
        Top = 392
        Width = 397
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666600000
          1037.166666666667000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel14: TQRLabel
        Left = 15
        Top = 395
        Width = 230
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          1045.104166666667000000
          608.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Access to site/Special Requirements'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel15: TQRLabel
        Left = 327
        Top = 395
        Width = 207
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          1045.104166666667000000
          547.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Additional Template Information'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape13: TQRShape
        Left = 320
        Top = 412
        Width = 397
        Height = 89
        Size.Values = (
          235.479166666666700000
          846.666666666666600000
          1090.083333333333000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape18: TQRShape
        Left = 320
        Top = 500
        Width = 397
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666600000
          1322.916666666667000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel20: TQRLabel
        Left = 327
        Top = 503
        Width = 187
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          1330.854166666667000000
          494.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Additional Fitting Information'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape19: TQRShape
        Left = 320
        Top = 520
        Width = 397
        Size.Values = (
          171.979166666666700000
          846.666666666666600000
          1375.833333333333000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape20: TQRShape
        Left = 0
        Top = 500
        Width = 321
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1322.916666666667000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape21: TQRShape
        Left = 0
        Top = 520
        Width = 321
        Height = 161
        Size.Values = (
          425.979166666666700000
          0.000000000000000000
          1375.833333333333000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel21: TQRLabel
        Left = 15
        Top = 503
        Width = 231
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          1330.854166666667000000
          611.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Items taken from site, to be returned'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape22: TQRShape
        Left = 0
        Top = 412
        Width = 321
        Height = 89
        Size.Values = (
          235.479166666666700000
          0.000000000000000000
          1090.083333333333000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape23: TQRShape
        Left = 16
        Top = 424
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1121.833333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape24: TQRShape
        Left = 16
        Top = 448
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1185.333333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape25: TQRShape
        Left = 16
        Top = 472
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1248.833333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape26: TQRShape
        Left = 152
        Top = 424
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          1121.833333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel22: TQRLabel
        Left = 48
        Top = 424
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          1121.833333333333000000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stairs'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel23: TQRLabel
        Left = 48
        Top = 448
        Width = 192
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          1185.333333333333000000
          508.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Building Site (see Addn Site Info)'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel24: TQRLabel
        Left = 48
        Top = 472
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          1248.833333333333000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Obstacles'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel25: TQRLabel
        Left = 176
        Top = 424
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          1121.833333333333000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Parking'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape27: TQRShape
        Left = 16
        Top = 528
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1397.000000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel26: TQRLabel
        Left = 43
        Top = 528
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          1397.000000000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sink Only'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape28: TQRShape
        Left = 152
        Top = 528
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          1397.000000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel27: TQRLabel
        Left = 176
        Top = 528
        Width = 129
        Height = 49
        Size.Values = (
          129.645833333333300000
          465.666666666666800000
          1397.000000000000000000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sink in unopened box (inc plumbing kit)'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel28: TQRLabel
        Left = 43
        Top = 592
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          1566.333333333333000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hob'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape29: TQRShape
        Left = 16
        Top = 592
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1566.333333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape30: TQRShape
        Left = 16
        Top = 624
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1651.000000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel29: TQRLabel
        Left = 43
        Top = 624
        Width = 114
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          1651.000000000000000000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Other. Please state'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel30: TQRLabel
        Left = 43
        Top = 547
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          1447.270833333333000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(no plumbing kit)'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape31: TQRShape
        Left = 152
        Top = 592
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          1566.333333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel31: TQRLabel
        Left = 176
        Top = 592
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          1566.333333333333000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pop up socket'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape32: TQRShape
        Left = 40
        Top = 667
        Width = 265
        Height = 8
        Size.Values = (
          21.166666666666670000
          105.833333333333300000
          1764.770833333333000000
          701.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape33: TQRShape
        Left = 320
        Top = 599
        Width = 397
        Height = 82
        Size.Values = (
          216.958333333333400000
          846.666666666666600000
          1584.854166666667000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape34: TQRShape
        Left = 336
        Top = 614
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          889.000000000000000000
          1624.541666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel32: TQRLabel
        Left = 363
        Top = 614
        Width = 27
        Height = 18
        Size.Values = (
          47.625000000000000000
          960.437500000000000000
          1624.541666666667000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sink'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel34: TQRLabel
        Left = 507
        Top = 614
        Width = 24
        Height = 18
        Size.Values = (
          47.625000000000000000
          1341.437500000000000000
          1624.541666666667000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hob'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape36: TQRShape
        Left = 480
        Top = 614
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          1270.000000000000000000
          1624.541666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape37: TQRShape
        Left = 336
        Top = 646
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          889.000000000000000000
          1709.208333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel35: TQRLabel
        Left = 363
        Top = 646
        Width = 37
        Height = 18
        Size.Values = (
          47.625000000000000000
          960.437500000000000000
          1709.208333333333000000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Other.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape38: TQRShape
        Left = 600
        Top = 614
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          1587.500000000000000000
          1624.541666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel37: TQRLabel
        Left = 624
        Top = 614
        Width = 49
        Height = 18
        Size.Values = (
          47.625000000000000000
          1651.000000000000000000
          1624.541666666667000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Drainers'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape39: TQRShape
        Left = 416
        Top = 657
        Width = 265
        Height = 9
        Size.Values = (
          23.812500000000000000
          1100.666666666667000000
          1738.312500000000000000
          701.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape35: TQRShape
        Left = 0
        Top = 680
        Width = 321
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1799.166666666667000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape40: TQRShape
        Left = 320
        Top = 680
        Width = 185
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666600000
          1799.166666666667000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape41: TQRShape
        Left = 504
        Top = 680
        Width = 213
        Height = 21
        Size.Values = (
          55.562500000000000000
          1333.500000000000000000
          1799.166666666667000000
          563.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel36: TQRLabel
        Left = 7
        Top = 683
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          1807.104166666667000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Person'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel38: TQRLabel
        Left = 327
        Top = 683
        Width = 152
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          1807.104166666667000000
          402.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No of pieces to Drawing'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel33: TQRLabel
        Left = 511
        Top = 683
        Width = 155
        Height = 17
        Size.Values = (
          44.979166666666670000
          1352.020833333333000000
          1807.104166666667000000
          410.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No of pieces to template'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape42: TQRShape
        Left = 0
        Top = 700
        Width = 321
        Height = 25
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          1852.083333333333000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape43: TQRShape
        Left = 320
        Top = 700
        Width = 185
        Height = 25
        Size.Values = (
          66.145833333333340000
          846.666666666666600000
          1852.083333333333000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape44: TQRShape
        Left = 504
        Top = 700
        Width = 213
        Height = 25
        Size.Values = (
          66.145833333333340000
          1333.500000000000000000
          1852.083333333333000000
          563.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel39: TQRLabel
        Left = 16
        Top = 804
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2127.250000000000000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Collect Payment'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape46: TQRShape
        Left = 152
        Top = 804
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          2127.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel40: TQRLabel
        Left = 16
        Top = 828
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2190.750000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Splashback'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape47: TQRShape
        Left = 152
        Top = 828
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          2190.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel41: TQRLabel
        Left = 16
        Top = 852
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2254.250000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Upstands'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape48: TQRShape
        Left = 152
        Top = 852
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          2254.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel42: TQRLabel
        Left = 16
        Top = 876
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2317.750000000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sink Overhang'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape49: TQRShape
        Left = 152
        Top = 876
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          2317.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape50: TQRShape
        Left = 192
        Top = 756
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          2000.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape51: TQRShape
        Left = 192
        Top = 780
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          2063.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape53: TQRShape
        Left = 192
        Top = 804
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          2127.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape54: TQRShape
        Left = 192
        Top = 828
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          2190.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape55: TQRShape
        Left = 192
        Top = 852
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          2254.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape56: TQRShape
        Left = 192
        Top = 876
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          2317.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel43: TQRLabel
        Left = 150
        Top = 732
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          396.875000000000000000
          1936.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes     No'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel44: TQRLabel
        Left = 16
        Top = 904
        Width = 141
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2391.833333333333000000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Overhang Amount - front'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape52: TQRShape
        Left = 176
        Top = 913
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          465.666666666666700000
          2415.645833333333000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel45: TQRLabel
        Left = 271
        Top = 904
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          717.020833333333300000
          2391.833333333333000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel46: TQRLabel
        Left = 382
        Top = 732
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1010.708333333333000000
          1936.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes     No'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape57: TQRShape
        Left = 424
        Top = 756
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1121.833333333333000000
          2000.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape58: TQRShape
        Left = 384
        Top = 756
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          2000.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel47: TQRLabel
        Left = 248
        Top = 756
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          2000.250000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Drainers'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape59: TQRShape
        Left = 384
        Top = 780
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          2063.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape60: TQRShape
        Left = 424
        Top = 780
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1121.833333333333000000
          2063.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel49: TQRLabel
        Left = 248
        Top = 804
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          2127.250000000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hob Style'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel50: TQRLabel
        Left = 248
        Top = 852
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          2254.250000000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Recess'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape63: TQRShape
        Left = 384
        Top = 852
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1016.000000000000000000
          2254.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape64: TQRShape
        Left = 424
        Top = 852
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1121.833333333333000000
          2254.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel51: TQRLabel
        Left = 622
        Top = 732
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1645.708333333333000000
          1936.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes     No'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape65: TQRShape
        Left = 664
        Top = 756
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          2000.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape66: TQRShape
        Left = 624
        Top = 756
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1651.000000000000000000
          2000.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel52: TQRLabel
        Left = 488
        Top = 756
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2000.250000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Plug Tower'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel53: TQRLabel
        Left = 488
        Top = 780
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2063.750000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pan Stands'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape67: TQRShape
        Left = 624
        Top = 780
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1651.000000000000000000
          2063.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape68: TQRShape
        Left = 664
        Top = 780
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          2063.750000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape69: TQRShape
        Left = 664
        Top = 804
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          2127.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape70: TQRShape
        Left = 624
        Top = 804
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1651.000000000000000000
          2127.250000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel54: TQRLabel
        Left = 488
        Top = 804
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2127.250000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Window Cills'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel55: TQRLabel
        Left = 488
        Top = 828
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2190.750000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cill Thickness'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape61: TQRShape
        Left = 312
        Top = 815
        Width = 129
        Height = 8
        Size.Values = (
          21.166666666666670000
          825.500000000000000000
          2156.354166666667000000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape62: TQRShape
        Left = 312
        Top = 887
        Width = 129
        Height = 8
        Size.Values = (
          21.166666666666670000
          825.500000000000000000
          2346.854166666667000000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape71: TQRShape
        Left = 616
        Top = 839
        Height = 8
        Size.Values = (
          21.166666666666670000
          1629.833333333333000000
          2219.854166666667000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel48: TQRLabel
        Left = 687
        Top = 832
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          1817.687500000000000000
          2201.333333333333000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel56: TQRLabel
        Left = 488
        Top = 876
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2317.750000000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tap Pos/Size'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmAddress: TQRMemo
        Left = 408
        Top = 57
        Width = 297
        Height = 19
        Size.Values = (
          50.270833333333330000
          1079.500000000000000000
          150.812500000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRShape72: TQRShape
        Left = 576
        Top = 887
        Width = 132
        Height = 8
        Size.Values = (
          21.166666666666670000
          1524.000000000000000000
          2346.854166666667000000
          349.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 488
        Top = 930
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2460.625000000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Templated by:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape73: TQRShape
        Left = 0
        Top = 952
        Width = 717
        Height = 89
        Size.Values = (
          235.479166666666700000
          0.000000000000000000
          2518.833333333333000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel5: TQRLabel
        Left = 16
        Top = 960
        Width = 289
        Height = 41
        Size.Values = (
          108.479166666666700000
          42.333333333333330000
          2540.000000000000000000
          764.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Appliances we are providing and which need to go back to site:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel57: TQRLabel
        Left = 16
        Top = 930
        Width = 117
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2460.625000000000000000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Under mounted sink'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape74: TQRShape
        Left = 576
        Top = 938
        Width = 132
        Height = 8
        Size.Values = (
          21.166666666666670000
          1524.000000000000000000
          2481.791666666667000000
          349.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape12: TQRShape
        Left = 320
        Top = 580
        Width = 397
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666600000
          1534.583333333333000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel16: TQRLabel
        Left = 327
        Top = 583
        Width = 139
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          1542.520833333333000000
          367.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Items to be confirmed'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
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
      object qrlblQuoteLabel: TQRLabel
        Left = 329
        Top = 131
        Width = 79
        Height = 20
        Size.Values = (
          52.916666666666670000
          870.479166666666700000
          346.604166666666700000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblQuote: TQRDBText
        Left = 424
        Top = 131
        Width = 47
        Height = 20
        Size.Values = (
          52.916666666666670000
          1121.833333333333000000
          346.604166666666700000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrlblEdgeDetail: TQRLabel
        Left = 102
        Top = 219
        Width = 211
        Height = 17
        Size.Values = (
          44.979166666666670000
          269.875000000000000000
          579.437500000000000000
          558.270833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeDetail'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblThickness: TQRLabel
        Left = 102
        Top = 276
        Width = 211
        Height = 17
        Size.Values = (
          44.979166666666670000
          269.875000000000000000
          730.250000000000000000
          558.270833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblThickness'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblUpstand: TQRLabel
        Left = 102
        Top = 339
        Width = 211
        Height = 17
        Size.Values = (
          44.979166666666670000
          269.875000000000000000
          896.937500000000000000
          558.270833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblUpstand'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblOfficeContact: TQRLabel
        Left = 8
        Top = 704
        Width = 305
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1862.666666666667000000
          806.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblOfficeContact'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel17: TQRLabel
        Left = 152
        Top = 931
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          402.166666666666700000
          2463.270833333333000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Landscape'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape15: TQRShape
        Left = 232
        Top = 931
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          613.833333333333400000
          2463.270833333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel18: TQRLabel
        Left = 264
        Top = 931
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          2463.270833333333000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Portrait'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape16: TQRShape
        Left = 328
        Top = 931
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          867.833333333333500000
          2463.270833333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrrchTextNotes: TQRRichText
        Left = 328
        Top = 418
        Width = 381
        Height = 79
        Size.Values = (
          209.020833333333300000
          867.833333333333500000
          1105.958333333333000000
          1008.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object gtQRLabel19: TQRLabel
        Left = 328
        Top = 528
        Width = 160
        Height = 17
        Size.Values = (
          44.979166666666670000
          867.833333333333300000
          1397.000000000000000000
          423.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No. of people required to fit:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel58: TQRLabel
        Left = 328
        Top = 556
        Width = 136
        Height = 17
        Size.Values = (
          44.979166666666670000
          867.833333333333300000
          1471.083333333333000000
          359.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Approximate time to fit:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape17: TQRShape
        Left = 518
        Top = 539
        Width = 123
        Height = 8
        Size.Values = (
          21.166666666666670000
          1370.541666666667000000
          1426.104166666667000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape75: TQRShape
        Left = 518
        Top = 567
        Width = 123
        Height = 8
        Size.Values = (
          21.166666666666670000
          1370.541666666667000000
          1500.187500000000000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel59: TQRLabel
        Left = 315
        Top = 904
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          833.437500000000000000
          2391.833333333333000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sides'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape76: TQRShape
        Left = 355
        Top = 913
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          939.270833333333300000
          2415.645833333333000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel60: TQRLabel
        Left = 445
        Top = 904
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          1177.395833333333000000
          2391.833333333333000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel61: TQRLabel
        Left = 488
        Top = 852
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2254.250000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No. Sockets'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape77: TQRShape
        Left = 616
        Top = 863
        Height = 8
        Size.Values = (
          21.166666666666670000
          1629.833333333333000000
          2283.354166666667000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape78: TQRShape
        Left = 320
        Top = 952
        Width = 397
        Height = 89
        Size.Values = (
          235.479166666666700000
          846.666666666666700000
          2518.833333333333000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel62: TQRLabel
        Left = 327
        Top = 955
        Width = 192
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          2526.770833333333000000
          508.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Templating Client Agreement:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel63: TQRLabel
        Left = 327
        Top = 973
        Width = 380
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          2574.395833333333000000
          1005.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'I agree with the above specification & instruct production to be' +
          'gin.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel64: TQRLabel
        Left = 327
        Top = 996
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          2635.250000000000000000
          320.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Client Name (PRINT)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel65: TQRLabel
        Left = 365
        Top = 1022
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          965.729166666666700000
          2704.041666666667000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '(SIGNATURE)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape79: TQRShape
        Left = 464
        Top = 1005
        Width = 249
        Height = 8
        Size.Values = (
          21.166666666666670000
          1227.666666666667000000
          2659.062500000000000000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape80: TQRShape
        Left = 576
        Top = 938
        Width = 132
        Height = 8
        Size.Values = (
          21.166666666666670000
          1524.000000000000000000
          2481.791666666667000000
          349.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape81: TQRShape
        Left = 464
        Top = 1031
        Width = 249
        Height = 8
        Size.Values = (
          21.166666666666670000
          1227.666666666667000000
          2727.854166666667000000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object gtQRSysData1: TQRSysData
      Left = 647
      Top = 1088
      Width = 108
      Height = 16
      Size.Values = (
        42.333333333333330000
        1711.854166666667000000
        2878.666666666667000000
        285.750000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      Data = qrsDateTime
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      Text = 'Printed: '
      Transparent = False
      ExportAs = exptText
      VerticalAlignment = tlTop
      FontSize = 8
    end
    object qriHeadLogo: TQRImage
      Left = 39
      Top = 24
      Width = 245
      Height = 133
      Size.Values = (
        351.895833333333300000
        103.187500000000000000
        63.500000000000000000
        648.229166666666700000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  sales_order_line.quote,'
      '        sales_order_line.description,'
      '        Sales_Order.customer_name,'
      '        Sales_Order.reference,'
      '        Sales_Order.address,'
      '        Sales_Order.customer,'
      '        Sales_Order.contact_name,'
      '        Sales_order_line.Sales_order,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Sales_Order.Extra_Notes,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Operator.Telephone_number'
      'FROM Operator'
      '      RIGHT JOIN ((Sales_Order'
      '      INNER JOIN Sales_Order_Line'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '      LEFT JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '        ON Operator.Operator = Sales_Order.Account_Manager'
      
        'WHERE sales_order_line.sales_order = :sales_order AND Sales_Orde' +
        'r_Line.quote <> 0'
      'ORDER BY sales_order_line.quote')
    Left = 1091
    Top = 118
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1024
    Top = 64
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 1030
    Top = 299
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
      'Credit_Status,'
      'Telephone_number'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 1030
    Top = 366
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 1030
    Top = 235
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 1030
    Top = 159
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 1102
    Top = 53
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
    Left = 1030
    Top = 438
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qryQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.Quote,'
      '        Quote.description,'
      '        quote.customer_name,'
      '        quote.reference,'
      '        quote.address,'
      '        quote.customer,'
      '        quote.contact_name,'
      '        0 as Sales_order,'
      '        Quote.Install_address,'
      '        Quote,Install_Name,'
      '        Quote.Install_Phone,'
      '        Quote.Account_Manager,'
      '        Quote.Extra_Notes,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Operator.Telephone_number'
      'FROM Operator'
      '      RIGHT JOIN Quote'
      '        ON Operator.Operator = Quote.Account_Manager'
      'WHERE Quote.Quote = :Quote'
      'ORDER BY Quote.Quote')
    Left = 1107
    Top = 238
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Edge.Quote,'
      '        Quote_Edge.Edge_number,'
      '        Quote_Edge.Edge_profile,'
      '        Edge_profile.Description'
      'FROM Edge_profile'
      '      INNER JOIN Quote_Edge'
      '      ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Edge_Number')
    Left = 1107
    Top = 302
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Quote_Element'
      '      INNER JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 366
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Quote_Element'
      '    INNER JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness'
      'WHERE Element_number > 1000 AND Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 438
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
