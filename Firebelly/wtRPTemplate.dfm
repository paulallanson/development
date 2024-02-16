object frmwtRPTemplate: TfrmwtRPTemplate
  Left = 88
  Top = 58
  Caption = 'Template Check List'
  ClientHeight = 854
  ClientWidth = 1535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 296
    Top = -30
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
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
      Top = 81
      Width = 718
      Height = 1000
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2645.833333333333000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpDetails
      ReprintOnNewPage = False
      object QRShape1: TQRShape
        Left = 1
        Top = 0
        Width = 716
        Height = 985
        Size.Values = (
          2606.145833333333000000
          2.645833333333333000
          0.000000000000000000
          1894.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel8: TQRLabel
        Left = 16
        Top = 440
        Width = 108
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1164.166666666667000000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Risk Assessment:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape3: TQRShape
        Left = 0
        Top = 568
        Width = 717
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          1502.833333333333000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 16
        Top = 912
        Width = 149
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2413.000000000000000000
          394.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Details agreed on site by:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape4: TQRShape
        Left = 176
        Top = 916
        Width = 209
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          2423.583333333333000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 88
        Top = 948
        Width = 207
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          2508.250000000000000000
          547.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 16
        Top = 944
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          2497.666666666667000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Print Name:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 416
        Top = 944
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          2497.666666666667000000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape6: TQRShape
        Left = 480
        Top = 948
        Width = 207
        Height = 17
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          2508.250000000000000000
          547.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 0
        Top = 888
        Width = 717
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2349.500000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel9: TQRLabel
        Left = 16
        Top = 584
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1545.166666666667000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 256
        Width = 717
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          677.333333333333300000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 144
        Top = 120
        Width = 217
        Height = 81
        Size.Values = (
          214.312500000000000000
          381.000000000000000000
          317.500000000000000000
          574.145833333333300000)
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
      object QRLabel2: TQRLabel
        Left = 487
        Top = 36
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          1288.520833333333000000
          95.250000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 144
        Top = 7
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          18.520833333333330000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 17
        Top = 7
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          18.520833333333330000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote Reference:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 16
        Top = 36
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          95.250000000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Templater Name:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 144
        Top = 240
        Width = 137
        Height = 17
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          635.000000000000000000
          362.479166666666700000)
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
      object QRLabel5: TQRLabel
        Left = 17
        Top = 240
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          635.000000000000000000
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
      object QRDBText5: TQRDBText
        Left = 144
        Top = 67
        Width = 561
        Height = 46
        Size.Values = (
          121.708333333333300000
          381.000000000000000000
          177.270833333333300000
          1484.312500000000000000)
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
      object gtQRLabel1: TQRLabel
        Left = 17
        Top = 64
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          169.333333333333300000
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
      object QRShape12: TQRShape
        Left = 144
        Top = 40
        Width = 313
        Height = 17
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          105.833333333333300000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 536
        Top = 40
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666670000
          1418.166666666667000000
          105.833333333333300000
          320.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 17
        Top = 120
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          317.500000000000000000
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
      object QRLabel1: TQRLabel
        Left = 16
        Top = 280
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          740.833333333333300000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material: '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 376
        Top = 280
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          740.833333333333300000
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
      object QRLabel10: TQRLabel
        Left = 16
        Top = 344
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          910.166666666666700000
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
      object QRLabel11: TQRLabel
        Left = 376
        Top = 344
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          910.166666666666700000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Upstand Detail:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 16
        Top = 376
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          994.833333333333300000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hob Cutout Size:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 16
        Top = 408
        Width = 106
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1079.500000000000000000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sink Cut Out Size'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 376
        Top = 376
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          994.833333333333300000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Drainer (L or R)'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 376
        Top = 408
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          1079.500000000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sink Type'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 128
        Top = 284
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          751.416666666666700000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 128
        Top = 348
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          920.750000000000000000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 128
        Top = 380
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          1005.416666666667000000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 128
        Top = 412
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          1090.083333333333000000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 472
        Top = 284
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          751.416666666666700000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 472
        Top = 348
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          920.750000000000000000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 472
        Top = 380
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          1005.416666666667000000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 472
        Top = 412
        Width = 235
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          1090.083333333333000000
          621.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 0
        Top = 424
        Width = 717
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          1121.833333333333000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblSalesOrder: TQRLabel
        Left = 487
        Top = 7
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          1288.520833333333000000
          18.520833333333330000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order No:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblSalesOrderNo: TQRDBText
        Left = 592
        Top = 7
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          18.520833333333330000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel4: TQRLabel
        Left = 377
        Top = 120
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          997.479166666666700000
          317.500000000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmSiteAddress: TQRMemo
        Left = 456
        Top = 120
        Width = 249
        Height = 81
        Size.Values = (
          214.312500000000000000
          1206.500000000000000000
          317.500000000000000000
          658.812500000000000000)
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
      object gtQRLabel5: TQRLabel
        Left = 17
        Top = 208
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          550.333333333333300000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTelephone: TQRLabel
        Left = 144
        Top = 208
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          550.333333333333300000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 16
        Top = 312
        Width = 107
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          825.500000000000000000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sample Required?'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape1: TQRShape
        Left = 128
        Top = 312
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          338.666666666666700000
          825.500000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 224
        Top = 312
        Width = 109
        Height = 17
        Size.Values = (
          44.979166666666670000
          592.666666666666700000
          825.500000000000000000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sample Approved?'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape2: TQRShape
        Left = 344
        Top = 312
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          910.166666666666700000
          825.500000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel6: TQRLabel
        Left = 377
        Top = 216
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          997.479166666666700000
          571.500000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText2: TQRDBText
        Left = 456
        Top = 216
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          571.500000000000000000
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
        Left = 377
        Top = 240
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          997.479166666666700000
          635.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText3: TQRDBText
        Left = 456
        Top = 240
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          635.000000000000000000
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
      object qrrchTextNotes: TQRRichText
        Left = 16
        Top = 610
        Width = 689
        Height = 271
        Size.Values = (
          717.020833333333300000
          42.333333333333330000
          1613.958333333333000000
          1822.979166666667000000)
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
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        113.770833333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTemplate: TQRLabel
        Left = 224
        Top = 8
        Width = 250
        Height = 33
        Size.Values = (
          87.312500000000000000
          592.666666666666700000
          21.166666666666670000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Check List'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 20
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  sales_order_line.quote,'
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
      '        sales_order.Template_Date,'
      '        sales_order.Contact_no'
      'FROM sales_order_line, Quote, Sales_Order'
      'WHERE sales_order_line.sales_order = :sales_order and'
      'sales_order_line.sales_order = sales_order.sales_order and'
      'sales_order_line.quote = quote.quote'
      'ORDER BY sales_order_line.quote')
    Left = 227
    Top = 14
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 160
    Top = 16
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 206
    Top = 83
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
    Left = 94
    Top = 54
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 6
    Top = 35
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 78
    Top = 119
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 142
    Top = 69
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
    Left = 70
    Top = 6
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qryQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Quote.quote,'
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
      '        Quote.Extra_Notes'
      'from Quote'
      'where quote.quote = :Quote'
      'order by Quote.quote')
    Left = 283
    Top = 14
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
