object frmwtRPTemplate: TfrmwtRPTemplate
  Left = 2
  Top = 32
  Caption = 'Template Check List'
  ClientHeight = 699
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 320
    Top = 56
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
    PrinterSettings.ColorOption = 2
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
      object gtQRShape13: TQRShape
        Left = 320
        Top = 129
        Width = 397
        Height = 32
        Size.Values = (
          84.666666666666680000
          846.666666666666600000
          341.312500000000000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 320
        Top = 450
        Width = 397
        Height = 190
        Size.Values = (
          502.708333333333400000
          846.666666666666600000
          1190.625000000000000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 159
        Width = 717
        Height = 291
        Size.Values = (
          769.937500000000000000
          0.000000000000000000
          420.687500000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblTemplate: TQRLabel
        Left = 288
        Top = 0
        Width = 428
        Height = 43
        Size.Values = (
          113.770833333333300000
          762.000000000000000000
          0.000000000000000000
          1132.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TEMPLATE CHECK LIST'
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
      object gtQRLabel4: TQRLabel
        Left = 324
        Top = 254
        Width = 391
        Height = 23
        Size.Values = (
          60.854166666666670000
          857.250000000000000000
          672.041666666666700000
          1034.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Always phone 30 mins ahead of arrival'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object qrmSiteAddress: TQRMemo
        Left = 328
        Top = 281
        Width = 377
        Height = 98
        Size.Values = (
          259.291666666666700000
          867.833333333333500000
          743.479166666666800000
          997.479166666666900000)
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
      object gtQRLabel6: TQRLabel
        Left = 327
        Top = 382
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          1010.708333333333000000
          161.395833333333300000)
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
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText2: TQRDBText
        Left = 390
        Top = 382
        Width = 315
        Height = 17
        Size.Values = (
          44.979166666666670000
          1031.875000000000000000
          1010.708333333333000000
          833.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        Top = 406
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          1074.208333333333000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
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
        FontSize = 10
      end
      object gtQRDBText3: TQRDBText
        Left = 390
        Top = 406
        Width = 315
        Height = 17
        Size.Values = (
          44.979166666666670000
          1031.875000000000000000
          1074.208333333333000000
          833.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        Top = 302
        Width = 321
        Height = 63
        Size.Values = (
          166.687500000000000000
          0.000000000000000000
          799.041666666666800000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSalesOrder: TQRLabel
        Left = 15
        Top = 168
        Width = 127
        Height = 19
        Size.Values = (
          50.270833333333330000
          39.687500000000000000
          444.500000000000000000
          336.020833333333300000)
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
        Font.Name = 'Lucida Sans'
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
        Top = 168
        Width = 97
        Height = 19
        Size.Values = (
          50.270833333333330000
          412.750000000000000000
          444.500000000000000000
          256.645833333333300000)
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
        Font.Name = 'Lucida Sans'
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
        Top = 159
        Width = 397
        Height = 40
        Size.Values = (
          105.833333333333300000
          846.666666666666600000
          420.687500000000000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 0
        Top = 198
        Width = 717
        Height = 51
        Size.Values = (
          134.937500000000000000
          0.000000000000000000
          523.875000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 0
        Top = 248
        Width = 321
        Height = 55
        Size.Values = (
          145.520833333333300000
          0.000000000000000000
          656.166666666666800000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 15
        Top = 201
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          531.812500000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Colour:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 15
        Top = 257
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          679.979166666666700000
          201.083333333333300000)
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
        Top = 314
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          830.791666666666700000
          179.916666666666700000)
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
        Top = 364
        Width = 321
        Height = 67
        Size.Values = (
          177.270833333333300000
          0.000000000000000000
          963.083333333333400000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel9: TQRLabel
        Left = 15
        Top = 377
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          997.479166666666700000
          169.333333333333300000)
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
        Top = 402
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          1063.625000000000000000
          121.708333333333300000)
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
        Top = 409
        Width = 153
        Height = 8
        Size.Values = (
          21.166666666666670000
          269.875000000000000000
          1082.145833333333000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel11: TQRLabel
        Left = 263
        Top = 402
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          695.854166666666700000
          1063.625000000000000000
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
        Height = 85
        Size.Values = (
          224.895833333333300000
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
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          870.479166666666700000
          153.458333333333300000
          177.270833333333300000)
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
        Top = 135
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          870.479166666666700000
          357.187500000000000000
          185.208333333333300000)
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
        Left = 400
        Top = 135
        Width = 297
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          357.187500000000000000
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
        Top = 430
        Width = 321
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1137.708333333333000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel14: TQRLabel
        Left = 15
        Top = 433
        Width = 252
        Height = 16
        Size.Values = (
          42.333333333333330000
          39.687500000000000000
          1145.645833333333000000
          666.750000000000000000)
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
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape20: TQRShape
        Left = 320
        Top = 430
        Width = 397
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666600000
          1137.708333333333000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel21: TQRLabel
        Left = 327
        Top = 433
        Width = 257
        Height = 16
        Size.Values = (
          42.333333333333330000
          865.187500000000000000
          1145.645833333333000000
          679.979166666666700000)
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
        Font.Name = 'Lucida Sans'
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
        Top = 450
        Width = 321
        Height = 89
        Size.Values = (
          235.479166666666700000
          0.000000000000000000
          1190.625000000000000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape23: TQRShape
        Left = 16
        Top = 462
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1222.375000000000000000
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
        Top = 486
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1285.875000000000000000
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
        Top = 510
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          1349.375000000000000000
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
        Top = 462
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          1222.375000000000000000
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
        Top = 462
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          1222.375000000000000000
          95.250000000000000000)
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
        Top = 486
        Width = 206
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          1285.875000000000000000
          545.041666666666700000)
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
        Top = 510
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          1349.375000000000000000
          166.687500000000000000)
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
        Top = 462
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          1222.375000000000000000
          124.354166666666700000)
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
        Left = 336
        Top = 462
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          889.000000000000000000
          1222.375000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel26: TQRLabel
        Left = 363
        Top = 462
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          960.437500000000000000
          1222.375000000000000000
          158.750000000000000000)
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
        Left = 472
        Top = 462
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          1222.375000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel27: TQRLabel
        Left = 496
        Top = 462
        Width = 129
        Height = 49
        Size.Values = (
          129.645833333333300000
          1312.333333333333000000
          1222.375000000000000000
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
        Left = 363
        Top = 529
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          960.437500000000000000
          1399.645833333333000000
          71.437500000000000000)
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
        Left = 336
        Top = 529
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          889.000000000000000000
          1399.645833333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape30: TQRShape
        Left = 336
        Top = 572
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          889.000000000000000000
          1513.416666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel29: TQRLabel
        Left = 363
        Top = 572
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666670000
          960.437500000000000000
          1513.416666666667000000
          320.145833333333300000)
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
        Left = 363
        Top = 481
        Width = 107
        Height = 17
        Size.Values = (
          44.979166666666670000
          960.437500000000000000
          1272.645833333333000000
          283.104166666666700000)
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
        Left = 472
        Top = 529
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          1399.645833333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel31: TQRLabel
        Left = 496
        Top = 529
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          1399.645833333333000000
          246.062500000000000000)
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
        Left = 360
        Top = 612
        Width = 265
        Height = 8
        Size.Values = (
          21.166666666666670000
          952.500000000000000000
          1619.250000000000000000
          701.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape33: TQRShape
        Left = 0
        Top = 558
        Width = 321
        Height = 82
        Size.Values = (
          216.958333333333400000
          0.000000000000000000
          1476.375000000000000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape34: TQRShape
        Left = 8
        Top = 572
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          21.166666666666670000
          1513.416666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel32: TQRLabel
        Left = 35
        Top = 572
        Width = 28
        Height = 18
        Size.Values = (
          47.625000000000000000
          92.604166666666670000
          1513.416666666667000000
          74.083333333333330000)
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
        Left = 147
        Top = 572
        Width = 27
        Height = 18
        Size.Values = (
          47.625000000000000000
          388.937500000000000000
          1513.416666666667000000
          71.437500000000000000)
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
        Left = 120
        Top = 572
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          317.500000000000000000
          1513.416666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape37: TQRShape
        Left = 8
        Top = 604
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          21.166666666666670000
          1598.083333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel35: TQRLabel
        Left = 35
        Top = 604
        Width = 41
        Height = 18
        Size.Values = (
          47.625000000000000000
          92.604166666666670000
          1598.083333333333000000
          108.479166666666700000)
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
        Left = 224
        Top = 572
        Width = 15
        Height = 16
        Size.Values = (
          42.333333333333340000
          592.666666666666800000
          1513.416666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel37: TQRLabel
        Left = 248
        Top = 572
        Width = 54
        Height = 18
        Size.Values = (
          47.625000000000000000
          656.166666666666700000
          1513.416666666667000000
          142.875000000000000000)
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
        Left = 88
        Top = 615
        Width = 209
        Height = 9
        Size.Values = (
          23.812500000000000000
          232.833333333333400000
          1627.187500000000000000
          552.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape35: TQRShape
        Left = 320
        Top = 198
        Width = 397
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666600000
          523.875000000000000000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel36: TQRLabel
        Left = 327
        Top = 201
        Width = 85
        Height = 16
        Size.Values = (
          42.333333333333330000
          865.187500000000000000
          531.812500000000000000
          224.895833333333300000)
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
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape42: TQRShape
        Left = 320
        Top = 218
        Width = 397
        Height = 31
        Size.Values = (
          82.020833333333340000
          846.666666666666600000
          576.791666666666800000
          1050.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 400
        Top = 57
        Width = 313
        Height = 19
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          150.812500000000000000
          828.145833333333200000)
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
      object gtQRShape12: TQRShape
        Left = 1
        Top = 538
        Width = 320
        Height = 21
        Size.Values = (
          55.562500000000000000
          2.645833333333333000
          1423.458333333333000000
          846.666666666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel16: TQRLabel
        Left = 7
        Top = 541
        Width = 153
        Height = 16
        Size.Values = (
          42.333333333333330000
          18.520833333333330000
          1431.395833333333000000
          404.812500000000000000)
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
        Font.Name = 'Lucida Sans'
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
        Top = 169
        Width = 85
        Height = 19
        Size.Values = (
          50.270833333333330000
          870.479166666666700000
          447.145833333333300000
          224.895833333333300000)
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
        Font.Name = 'Lucida Sans'
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
        Top = 169
        Width = 52
        Height = 19
        Size.Values = (
          50.270833333333330000
          1121.833333333333000000
          447.145833333333300000
          137.583333333333300000)
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
        Font.Name = 'Lucida Sans'
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
        Top = 257
        Width = 211
        Height = 17
        Size.Values = (
          44.979166666666670000
          269.875000000000000000
          679.979166666666800000
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
        Top = 314
        Width = 211
        Height = 17
        Size.Values = (
          44.979166666666670000
          269.875000000000000000
          830.791666666666800000
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
        Top = 377
        Width = 211
        Height = 17
        Size.Values = (
          44.979166666666670000
          269.875000000000000000
          997.479166666666900000
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
        Left = 328
        Top = 226
        Width = 305
        Height = 16
        Size.Values = (
          42.333333333333340000
          867.833333333333500000
          597.958333333333400000
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
      object gtQRShape45: TQRShape
        Left = 0
        Top = 659
        Width = 717
        Height = 116
        Size.Values = (
          306.916666666666700000
          0.000000000000000000
          1743.604166666667000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape1: TQRShape
        Left = 0
        Top = 639
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1690.687500000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel5: TQRLabel
        Left = 6
        Top = 642
        Width = 102
        Height = 16
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          1698.625000000000000000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Appliance Info:'
        Color = clBtnFace
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
        FontSize = 10
      end
      object gtQRShape2: TQRShape
        Left = 0
        Top = 774
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2047.875000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TQRShape
        Left = 1
        Top = 794
        Width = 717
        Height = 247
        Size.Values = (
          653.520833333333400000
          2.645833333333333000
          2100.791666666667000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel12: TQRLabel
        Left = 6
        Top = 777
        Width = 46
        Height = 16
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          2055.812500000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
        Color = clBtnFace
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
        FontSize = 10
      end
      object qrlblColour: TQRLabel
        Left = 70
        Top = 201
        Width = 243
        Height = 46
        Size.Values = (
          121.708333333333300000
          185.208333333333300000
          531.812500000000000000
          642.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblWorktop'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel13: TQRLabel
        Left = 329
        Top = 82
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          870.479166666666700000
          216.958333333333300000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel15: TQRLabel
        Left = 329
        Top = 106
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          870.479166666666700000
          280.458333333333300000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCustomerPhone: TQRLabel
        Left = 400
        Top = 81
        Width = 313
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          214.312500000000000000
          828.145833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblCustomerPhone'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCustomerEmail: TQRLabel
        Left = 400
        Top = 105
        Width = 313
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          277.812500000000000000
          828.145833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblCustomerEmail'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qriHeadLogo: TQRImage
        Left = 1
        Top = 1
        Width = 270
        Height = 142
        Size.Values = (
          375.708333333333300000
          2.645833333333333000
          2.645833333333333000
          714.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  sales_order_line.quote,'
      '        sales_order_line.description,'
      '        sales_order.customer_name,'
      '        sales_order.reference,'
      '        sales_order.address,'
      '        sales_order.customer,'
      '        sales_order.contact_name,'
      '        Sales_order_line.Sales_order,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
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
    Top = 116
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1024
    Top = 62
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 1030
    Top = 297
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
      'Telephone_number,'
      'Email_Address'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 1030
    Top = 364
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 1030
    Top = 233
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 1030
    Top = 157
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 1102
    Top = 51
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
    Top = 436
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
      '        Operator.Operator_Name as Account_Manager_Name'
      'FROM Operator'
      '      RIGHT JOIN Quote'
      '        ON Operator.Operator = Quote.Account_Manager'
      'WHERE Quote.Quote = :Quote'
      'ORDER BY Quote.Quote')
    Left = 1107
    Top = 236
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
    Top = 364
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
    Top = 428
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
    Top = 500
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteElement: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  TOP 1'
      '        Quote_Element.Worktop,'
      '        Worktop.Description as Colour,'
      '        Quote_Element.Material_type,'
      '        Material_Type.Description as Material_Type_Desc'
      'FROM (Material_Type'
      '        INNER JOIN Quote_Element'
      
        '          ON Material_Type.Material_Type = Quote_Element.Materia' +
        'l_type)'
      '        INNER JOIN Worktop'
      '          ON Quote_Element.Worktop = Worktop.Worktop'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 300
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
