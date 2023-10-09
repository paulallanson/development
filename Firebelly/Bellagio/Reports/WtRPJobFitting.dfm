object frmwtRPJobFitting: TfrmwtRPJobFitting
  Left = 41
  Top = 0
  Caption = 'frmwtRPJobFitting'
  ClientHeight = 845
  ClientWidth = 1356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpJobSheet: TQuickRep
    Left = 232
    Top = -246
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpJobSheetBeforePrint
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
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    ReportTitle = 'Job Fitting Sheet'
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
      Top = 38
      Width = 718
      Height = 1019
      AfterPrint = qrgQuoteAfterPrint
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2696.104166666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpJobSheet
      ReprintOnNewPage = False
      object gtQRShape27: TQRShape
        Left = 361
        Top = 646
        Width = 355
        Height = 163
        Size.Values = (
          431.270833333333300000
          955.145833333333300000
          1709.208333333333000000
          939.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 3
        Top = 646
        Width = 352
        Height = 163
        Size.Values = (
          431.270833333333300000
          7.937500000000000000
          1709.208333333333000000
          931.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memAddress: TQRRichText
        Left = 200
        Top = 37
        Width = 513
        Height = 16
        Size.Values = (
          42.333333333333340000
          529.166666666666800000
          97.895833333333340000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memAddress')
      end
      object qriHeadLogo: TQRImage
        Left = 12
        Top = 8
        Width = 180
        Height = 120
        Size.Values = (
          317.500000000000000000
          31.750000000000000000
          21.166666666666670000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object qrlblSOCaption: TQRLabel
        Left = 319
        Top = -5
        Width = 400
        Height = 43
        Size.Values = (
          113.770833333333300000
          844.020833333333300000
          -13.229166666666670000
          1058.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'INSTALLATION SHEET'
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
      object gtQRShape1: TQRShape
        Left = 417
        Top = 57
        Width = 297
        Height = 56
        Size.Values = (
          148.166666666666700000
          1103.312500000000000000
          150.812500000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText2: TQRDBText
        Left = 612
        Top = 62
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1619.250000000000000000
          164.041666666666700000
          209.020833333333300000)
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
      object gtQRLabel2: TQRLabel
        Left = 427
        Top = 62
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1129.770833333333000000
          164.041666666666700000
          164.041666666666700000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape2: TQRShape
        Left = 542
        Top = 56
        Width = 9
        Height = 56
        Size.Values = (
          148.166666666666700000
          1434.041666666667000000
          148.166666666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 417
        Top = 83
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1103.312500000000000000
          219.604166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 3
        Top = 816
        Width = 713
        Height = 113
        Size.Values = (
          298.979166666666700000
          7.937500000000000000
          2159.000000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 8
        Top = 820
        Width = 91
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2169.583333333333000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes to Office:'
        Color = clBtnFace
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
      object gtQRShape7: TQRShape
        Left = 3
        Top = 614
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          1624.541666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel5: TQRLabel
        Left = 8
        Top = 618
        Width = 108
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1635.125000000000000000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sinks supplied by:'
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
      object gtQRLabel6: TQRLabel
        Left = 208
        Top = 618
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          1635.125000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Showroom'
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
      object gtQRLabel7: TQRLabel
        Left = 320
        Top = 618
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          846.666666666666700000
          1635.125000000000000000
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
      object gtQRShape23: TQRShape
        Left = 184
        Top = 619
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          486.833333333333300000
          1637.770833333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 296
        Top = 619
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          783.166666666666700000
          1637.770833333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape9: TQRShape
        Left = 3
        Top = 416
        Width = 713
        Height = 73
        Size.Values = (
          193.145833333333300000
          7.937500000000000000
          1100.666666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape10: TQRShape
        Left = 3
        Top = 488
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          1291.166666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TQRShape
        Left = 3
        Top = 512
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          1354.666666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape12: TQRShape
        Left = 3
        Top = 536
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          1418.166666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape13: TQRShape
        Left = 3
        Top = 560
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          1481.666666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape14: TQRShape
        Left = 3
        Top = 584
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          1545.166666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 129
        Top = 417
        Width = 7
        Height = 192
        Size.Values = (
          508.000000000000000000
          341.312500000000000000
          1103.312500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Left = 9
        Top = 420
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1111.250000000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
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
      object QRDBText5: TQRDBText
        Left = 141
        Top = 420
        Width = 569
        Height = 61
        Size.Values = (
          161.395833333333300000
          373.062500000000000000
          1111.250000000000000000
          1505.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel8: TQRLabel
        Left = 9
        Top = 492
        Width = 114
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1301.750000000000000000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material Thickness:'
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
      object gtQRLabel9: TQRLabel
        Left = 9
        Top = 516
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1365.250000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edge Profile:'
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
      object qrlblUpstandLabel: TQRLabel
        Left = 9
        Top = 540
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1428.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Upstands:'
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
      object qrlblCillsLabel: TQRLabel
        Left = 9
        Top = 564
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1492.250000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Window Cills:'
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
      object qrlblSlashbackLabel: TQRLabel
        Left = 9
        Top = 588
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1555.750000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Splashbacks:'
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
      object gtQRShape15: TQRShape
        Left = 3
        Top = 160
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          423.333333333333300000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape16: TQRShape
        Left = 3
        Top = 184
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          486.833333333333400000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape17: TQRShape
        Left = 3
        Top = 208
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          550.333333333333400000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel13: TQRLabel
        Left = 9
        Top = 164
        Width = 164
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          433.916666666666700000
          433.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Showroom/Customer Name:'
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
      object QRDBText8: TQRDBText
        Left = 200
        Top = 164
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          433.916666666666700000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape19: TQRShape
        Left = 3
        Top = 232
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          613.833333333333400000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel16: TQRLabel
        Left = 9
        Top = 236
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          624.416666666666700000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date:'
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
      object gtQRShape18: TQRShape
        Left = 177
        Top = 161
        Width = 7
        Height = 96
        Size.Values = (
          254.000000000000000000
          468.312500000000100000
          425.979166666666700000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape20: TQRShape
        Left = 3
        Top = 272
        Width = 713
        Height = 137
        Size.Values = (
          362.479166666666700000
          7.937500000000000000
          719.666666666666700000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrrchTextInstallAddress: TQRRichText
        Left = 144
        Top = 280
        Width = 241
        Height = 97
        Size.Values = (
          256.645833333333400000
          381.000000000000000000
          740.833333333333400000
          637.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'InstallAddress')
      end
      object QRLabel4: TQRLabel
        Left = 8
        Top = 280
        Width = 80
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          740.833333333333300000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Address:'
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
      object QRLabel3: TQRLabel
        Left = 428
        Top = 91
        Width = 49
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1132.416666666667000000
          240.770833333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job No.'
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
      object gtQRShape22: TQRShape
        Left = 3
        Top = 384
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          1016.000000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape21: TQRShape
        Left = 129
        Top = 273
        Width = 7
        Height = 136
        Size.Values = (
          359.833333333333400000
          341.312500000000000000
          722.312500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel14: TQRLabel
        Left = 9
        Top = 388
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1026.583333333333000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Contact Name:'
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
      object QRDBText3: TQRDBText
        Left = 144
        Top = 387
        Width = 241
        Height = 19
        Size.Values = (
          50.270833333333330000
          381.000000000000000000
          1023.937500000000000000
          637.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Install_Name'
        Font.Charset = ANSI_CHARSET
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
      object QRLabel15: TQRLabel
        Left = 9
        Top = 187
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          494.770833333333300000
          132.291666666666700000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel15: TQRLabel
        Left = 393
        Top = 388
        Width = 99
        Height = 17
        Size.Values = (
          44.979166666666670000
          1039.812500000000000000
          1026.583333333333000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Number:'
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
      object QRDBText6: TQRDBText
        Left = 496
        Top = 388
        Width = 201
        Height = 19
        Size.Values = (
          50.270833333333330000
          1312.333333333333000000
          1026.583333333333000000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Install_Phone'
        Font.Charset = ANSI_CHARSET
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
      object qrlblContact: TQRLabel
        Left = 200
        Top = 187
        Width = 201
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666800000
          494.770833333333400000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblContact'
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
      object QRLabel5: TQRLabel
        Left = 9
        Top = 212
        Width = 100
        Height = 19
        Size.Values = (
          50.270833333333330000
          23.812500000000000000
          560.916666666666700000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Client Reference:'
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
      object QRDBText4: TQRDBText
        Left = 200
        Top = 212
        Width = 98
        Height = 19
        Size.Values = (
          50.270833333333330000
          529.166666666666700000
          560.916666666666700000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Reference'
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape24: TQRShape
        Left = 385
        Top = 272
        Width = 7
        Height = 137
        Size.Values = (
          362.479166666666700000
          1018.645833333333000000
          719.666666666666700000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRDBText3: TQRDBText
        Left = 200
        Top = 236
        Width = 125
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          624.416666666666700000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Date_Required'
        Font.Charset = ANSI_CHARSET
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
      object gtQRRichText1: TQRRichText
        Left = 5
        Top = 936
        Width = 708
        Height = 65
        Size.Values = (
          171.979166666666700000
          13.229166666666670000
          2476.500000000000000000
          1873.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          
            'All fitters MUST sign in at the site office (where applicable). ' +
            'Please ensure this form is '
          
            'returned to the office with the completed sign off form. Please ' +
            'ensure all installations are left '
          'with Akemi cleaner and handover pack.')
      end
      object QRDBText2: TQRDBText
        Left = 668
        Top = 91
        Width = 24
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1767.416666666667000000
          240.770833333333300000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job'
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape4: TQRShape
        Left = 417
        Top = 121
        Width = 297
        Height = 32
        Size.Values = (
          84.666666666666680000
          1103.312500000000000000
          320.145833333333400000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape26: TQRShape
        Left = 542
        Top = 121
        Width = 9
        Height = 32
        Size.Values = (
          84.666666666666680000
          1434.041666666667000000
          320.145833333333400000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 428
        Top = 129
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          1132.416666666667000000
          341.312500000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Arrival Time:'
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
      object qrlblEdgeDetail: TQRLabel
        Left = 142
        Top = 515
        Width = 563
        Height = 17
        Size.Values = (
          44.979166666666670000
          375.708333333333400000
          1362.604166666667000000
          1489.604166666667000000)
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
        Left = 142
        Top = 492
        Width = 563
        Height = 17
        Size.Values = (
          44.979166666666670000
          375.708333333333400000
          1301.750000000000000000
          1489.604166666667000000)
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
        Left = 142
        Top = 539
        Width = 563
        Height = 17
        Size.Values = (
          44.979166666666670000
          375.708333333333400000
          1426.104166666667000000
          1489.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'No'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblWindowCill: TQRLabel
        Left = 142
        Top = 563
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          375.708333333333300000
          1489.604166666667000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblSplashback: TQRLabel
        Left = 142
        Top = 587
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          375.708333333333300000
          1553.104166666667000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel4: TQRLabel
        Left = 364
        Top = 649
        Width = 39
        Height = 19
        Size.Values = (
          50.270833333333330000
          963.083333333333300000
          1717.145833333333000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
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
      object gtQRLabel12: TQRLabel
        Left = 8
        Top = 649
        Width = 106
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1717.145833333333000000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Appliance Details:'
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
      object memApplianceDetails: TQRMemo
        Left = 8
        Top = 667
        Width = 343
        Height = 135
        Size.Values = (
          357.187500000000000000
          21.166666666666670000
          1764.770833333333000000
          907.520833333333300000)
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
      object qrrchTextNotes: TQRMemo
        Left = 365
        Top = 667
        Width = 347
        Height = 136
        Size.Values = (
          359.833333333333300000
          965.729166666666700000
          1764.770833333333000000
          918.104166666666700000)
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
      object gtQRShape33: TQRShape
        Left = 388
        Top = 360
        Width = 328
        Height = 25
        Size.Values = (
          66.145833333333330000
          1026.583333333333000000
          952.500000000000000000
          867.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape25: TQRShape
        Left = 489
        Top = 360
        Width = 7
        Height = 49
        Size.Values = (
          129.645833333333300000
          1293.812500000000000000
          952.500000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel22: TQRLabel
        Left = 393
        Top = 364
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          1039.812500000000000000
          963.083333333333300000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Email:'
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
      object gtQRDBText12: TQRDBText
        Left = 496
        Top = 364
        Width = 217
        Height = 19
        Size.Values = (
          50.270833333333330000
          1312.333333333333000000
          963.083333333333300000
          574.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Install_Email'
        Font.Charset = ANSI_CHARSET
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
    end
    object qrchdSatisfaction: TQRChildBand
      Left = 38
      Top = 1393
      Width = 718
      Height = 995
      AlignToBottom = False
      BeforePrint = qrchdSatisfactionBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        2632.604166666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbAdditionalItemsFooter
      PrintOrder = cboAfterParent
      object QRLabel11: TQRLabel
        Left = 399
        Top = 20
        Width = 306
        Height = 45
        Size.Values = (
          119.062500000000000000
          1055.687500000000000000
          52.916666666666660000
          809.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'SIGN OFF FORM'
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
      object memAddress1: TQRRichText
        Left = 200
        Top = 72
        Width = 497
        Height = 16
        Size.Values = (
          42.333333333333340000
          529.166666666666800000
          190.500000000000000000
          1314.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memAddress1')
      end
      object QRLabel17: TQRLabel
        Left = 16
        Top = 544
        Width = 143
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1439.333333333333000000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATE ..........................'
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
      object QRLabel18: TQRLabel
        Left = 16
        Top = 320
        Width = 125
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          846.666666666666700000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'It'#39's agreed as follows:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRMemo1: TQRMemo
        Left = 40
        Top = 352
        Width = 660
        Height = 17
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          931.333333333333500000
          1746.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Lines.Strings = (
          
            'That <Company> has completed the works required by the customer ' +
            'in line with the original quotation.')
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 16
        Top = 352
        Width = 12
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          931.333333333333300000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '1.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 16
        Top = 400
        Width = 12
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1058.333333333333000000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '2.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRMemo2: TQRMemo
        Left = 40
        Top = 400
        Width = 662
        Height = 34
        Size.Values = (
          89.958333333333330000
          105.833333333333300000
          1058.333333333333000000
          1751.541666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Lines.Strings = (
          
            'That the customer has had the opportunity to inspect the work an' +
            'd confirms that they are satisfied with the quality '
          
            'of the workmanship, materials and fittings used by the contracto' +
            'r.')
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel48: TQRLabel
        Left = 16
        Top = 448
        Width = 12
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1185.333333333333000000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '3.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRMemo3: TQRMemo
        Left = 40
        Top = 448
        Width = 391
        Height = 17
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          1185.333333333333000000
          1034.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Lines.Strings = (
          
            'The customer accepts delivery of the materials, fixtures and fit' +
            'tings.')
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel49: TQRLabel
        Left = 16
        Top = 488
        Width = 12
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1291.166666666667000000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '4.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRMemo4: TQRMemo
        Left = 40
        Top = 488
        Width = 543
        Height = 17
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          1291.166666666667000000
          1436.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Lines.Strings = (
          
            'Nothing in this agreement shall affect any guarantee on the work' +
            ' carried out by the contractor.')
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel50: TQRLabel
        Left = 368
        Top = 544
        Width = 328
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          1439.333333333333000000
          867.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Signature: .....................................................' +
          '.............'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel52: TQRLabel
        Left = 16
        Top = 648
        Width = 124
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          1714.500000000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Comments'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = 16
        Top = 672
        Width = 673
        Height = 249
        Size.Values = (
          658.812500000000000000
          42.333333333333340000
          1778.000000000000000000
          1780.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel51: TQRLabel
        Left = 368
        Top = 592
        Width = 330
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          1566.333333333333000000
          873.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Print Name: ....................................................' +
          '............'
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
      object QRShape48: TQRShape
        Left = 16
        Top = 592
        Width = 18
        Height = 19
        Size.Values = (
          50.270833333333330000
          42.333333333333340000
          1566.333333333333000000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel74: TQRLabel
        Left = 48
        Top = 593
        Width = 217
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          1568.979166666667000000
          574.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Care pack and questionnaire received'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qriheadlogo1: TQRImage
        Left = 12
        Top = 24
        Width = 180
        Height = 120
        Size.Values = (
          317.500000000000000000
          31.750000000000000000
          63.500000000000000000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRLabel10: TQRLabel
        Left = 16
        Top = 156
        Width = 106
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          412.750000000000000000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Name:'
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
      object gtQRDBText6: TQRDBText
        Left = 132
        Top = 156
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          349.250000000000000000
          412.750000000000000000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel11: TQRLabel
        Left = 16
        Top = 185
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          489.479166666666700000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Address:'
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
      object qrrchTextInstallAddress1: TQRMemo
        Left = 16
        Top = 208
        Width = 401
        Height = 97
        Size.Values = (
          256.645833333333300000
          42.333333333333330000
          550.333333333333300000
          1060.979166666667000000)
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
      object QRLabel70: TQRLabel
        Left = 432
        Top = 304
        Width = 45
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1143.000000000000000000
          804.333333333333300000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job No:'
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
      object QRDBText10: TQRDBText
        Left = 692
        Top = 304
        Width = 21
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1830.916666666667000000
          804.333333333333300000
          55.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job'
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
        Left = 432
        Top = 155
        Width = 57
        Height = 19
        Size.Values = (
          50.270833333333330000
          1143.000000000000000000
          410.104166666666700000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
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
      object gtQRDBText4: TQRDBText
        Left = 640
        Top = 155
        Width = 73
        Height = 19
        Size.Values = (
          50.270833333333330000
          1693.333333333333000000
          410.104166666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
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
      object gtQRLabel18: TQRLabel
        Left = 432
        Top = 255
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          1143.000000000000000000
          674.687500000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer PO:'
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
      object gtQRDBText1: TQRDBText
        Left = 520
        Top = 255
        Width = 193
        Height = 19
        Size.Values = (
          50.270833333333330000
          1375.833333333333000000
          674.687500000000000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Ref_No'
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
      object gtQRLabel24: TQRLabel
        Left = 432
        Top = 207
        Width = 63
        Height = 19
        Size.Values = (
          50.270833333333330000
          1143.000000000000000000
          547.687500000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
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
      object gtQRDBText13: TQRDBText
        Left = 504
        Top = 207
        Width = 209
        Height = 19
        Size.Values = (
          50.270833333333330000
          1333.500000000000000000
          547.687500000000000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Reference'
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
    end
    object qrchdSnagging: TQRChildBand
      Left = 38
      Top = 2388
      Width = 718
      Height = 394
      Frame.Width = 3
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1042.458333333333000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrchdSatisfaction
      PrintOrder = cboAfterParent
      object QRLabel53: TQRLabel
        Left = 335
        Top = 20
        Width = 370
        Height = 45
        Size.Values = (
          119.062500000000000000
          886.354166666666900000
          52.916666666666660000
          978.958333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'SNAGGING REPORT'
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
      object QRLabel54: TQRLabel
        Left = 16
        Top = 200
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          529.166666666666700000
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
      object QRLabel55: TQRLabel
        Left = 16
        Top = 229
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          605.895833333333300000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel56: TQRLabel
        Left = 16
        Top = 258
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          682.625000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitters Name:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel57: TQRLabel
        Left = 16
        Top = 288
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          762.000000000000000000
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
      object QRDBText1: TQRDBText
        Left = 112
        Top = 200
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          529.166666666666700000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
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
      object QRDBText7: TQRDBText
        Left = 112
        Top = 288
        Width = 593
        Height = 65
        Size.Values = (
          171.979166666666700000
          296.333333333333400000
          762.000000000000000000
          1568.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape8: TQRShape
        Left = -1
        Top = 357
        Width = 718
        Height = 450
        Frame.Width = 2
        Size.Values = (
          1190.625000000000000000
          -2.645833333333333000
          944.562500000000000000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 360
        Top = 358
        Width = 9
        Height = 450
        Size.Values = (
          1190.625000000000000000
          952.500000000000000000
          947.208333333333200000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel58: TQRLabel
        Left = 8
        Top = 366
        Width = 199
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          968.375000000000000000
          526.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Work outstanding to complete Job'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel59: TQRLabel
        Left = 374
        Top = 366
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          989.541666666666700000
          968.375000000000000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material required'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel69: TQRLabel
        Left = 638
        Top = 366
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1688.041666666667000000
          968.375000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Complete'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel71: TQRLabel
        Left = 500
        Top = 228
        Width = 45
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1322.916666666667000000
          603.250000000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job No:'
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
      object QRDBText11: TQRDBText
        Left = 660
        Top = 228
        Width = 21
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          603.250000000000000000
          55.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job'
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
      object QRLabel72: TQRLabel
        Left = 112
        Top = 229
        Width = 265
        Height = 17
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          605.895833333333300000
          701.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '..'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel73: TQRLabel
        Left = 112
        Top = 258
        Width = 265
        Height = 17
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          682.625000000000000000
          701.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '..'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object memAddress2: TQRRichText
        Left = 200
        Top = 72
        Width = 505
        Height = 16
        Size.Values = (
          42.333333333333340000
          529.166666666666800000
          190.500000000000000000
          1336.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memAddress2')
      end
      object qriHeadLogo2: TQRImage
        Left = 12
        Top = 24
        Width = 180
        Height = 120
        Size.Values = (
          317.500000000000000000
          31.750000000000000000
          63.500000000000000000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRLabel17: TQRLabel
        Left = 499
        Top = 200
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1320.270833333333000000
          529.166666666666700000
          164.041666666666700000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText5: TQRDBText
        Left = 602
        Top = 200
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1592.791666666667000000
          529.166666666666700000
          209.020833333333300000)
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
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 2814
      Width = 718
      Height = 184
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        486.833333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel60: TQRLabel
        Left = 16
        Top = 10
        Width = 242
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          26.458333333333330000
          640.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All outstanding work completed'
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
      object QRLabel61: TQRLabel
        Left = 16
        Top = 49
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          129.645833333333300000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Signature:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel62: TQRLabel
        Left = 16
        Top = 81
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          214.312500000000000000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Completed:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel63: TQRLabel
        Left = 16
        Top = 113
        Width = 126
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          298.979166666666700000
          333.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Balance Outstanding:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel64: TQRLabel
        Left = 16
        Top = 145
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          383.645833333333300000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitter Signature:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel65: TQRLabel
        Left = 208
        Top = 81
        Width = 465
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          214.312500000000000000
          1230.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '....................................................'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel66: TQRLabel
        Left = 208
        Top = 113
        Width = 465
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          298.979166666666700000
          1230.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '....................................................'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel67: TQRLabel
        Left = 208
        Top = 145
        Width = 465
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          383.645833333333300000
          1230.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '....................................................'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel68: TQRLabel
        Left = 208
        Top = 49
        Width = 465
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          129.645833333333300000
          1230.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '....................................................'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrbAdditionalItemsHeader: TQRBand
      Left = 38
      Top = 1057
      Width = 718
      Height = 272
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        719.666666666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRShape32: TQRShape
        Left = 3
        Top = 184
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          486.833333333333400000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape30: TQRShape
        Left = 3
        Top = 160
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          423.333333333333300000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel37: TQRLabel
        Left = 5
        Top = 250
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          661.458333333333300000
          190.500000000000000000)
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
        Left = 573
        Top = 250
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1516.062500000000000000
          661.458333333333300000
          142.875000000000000000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel19: TQRLabel
        Left = 364
        Top = 4
        Width = 352
        Height = 43
        Size.Values = (
          113.770833333333300000
          963.083333333333300000
          10.583333333333330000
          931.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ADDITIONAL ITEMS'
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
      object qriHeadLogo3: TQRImage
        Left = 12
        Top = 8
        Width = 180
        Height = 120
        Size.Values = (
          317.500000000000000000
          31.750000000000000000
          21.166666666666670000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRShape28: TQRShape
        Left = 417
        Top = 62
        Width = 297
        Height = 25
        Size.Values = (
          66.145833333333330000
          1103.312500000000000000
          164.041666666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape29: TQRShape
        Left = 542
        Top = 61
        Width = 9
        Height = 25
        Size.Values = (
          66.145833333333330000
          1434.041666666667000000
          161.395833333333300000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel20: TQRLabel
        Left = 427
        Top = 67
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1129.770833333333000000
          177.270833333333300000
          164.041666666666700000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText7: TQRDBText
        Left = 612
        Top = 67
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1619.250000000000000000
          177.270833333333300000
          209.020833333333300000)
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
      object gtQRLabel21: TQRLabel
        Left = 9
        Top = 164
        Width = 164
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          433.916666666666700000
          433.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Showroom/Customer Name:'
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
      object gtQRDBText8: TQRDBText
        Left = 200
        Top = 164
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          433.916666666666700000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape31: TQRShape
        Left = 177
        Top = 160
        Width = 7
        Height = 49
        Size.Values = (
          129.645833333333300000
          468.312500000000000000
          423.333333333333300000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel23: TQRLabel
        Left = 9
        Top = 188
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          497.416666666666700000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Client Reference:'
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
      object gtQRDBText11: TQRDBText
        Left = 200
        Top = 188
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          497.416666666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
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
      object memAddress3: TQRRichText
        Left = 200
        Top = 42
        Width = 513
        Height = 16
        Size.Values = (
          42.333333333333330000
          529.166666666666700000
          111.125000000000000000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memAddress')
      end
      object gtQRMemo1: TQRMemo
        Left = 320
        Top = 96
        Width = 393
        Height = 49
        Size.Values = (
          129.645833333333300000
          846.666666666666700000
          254.000000000000000000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        Lines.Strings = (
          'The items below are to be supplied with this order, along with '
          'those stated within the standard spec sheet.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
    end
    object qrsdSOLines: TQRSubDetail
      Left = 38
      Top = 1329
      Width = 718
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qrySOLine
      FooterBand = qrbAdditionalItemsFooter
      HeaderBand = qrbAdditionalItemsHeader
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText9: TQRDBText
        Left = 574
        Top = 7
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          1518.708333333333000000
          18.520833333333330000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Quantity'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText10: TQRDBText
        Left = 6
        Top = 7
        Width = 555
        Height = 17
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          18.520833333333330000
          1468.437500000000000000)
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrbAdditionalItemsFooter: TQRBand
      Left = 38
      Top = 1361
      Width = 718
      Height = 32
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      BeforePrint = qrbAdditionalItemsFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblAdditionalItems: TQRLabel
        Left = 5
        Top = 2
        Width = 219
        Height = 18
        Size.Values = (
          47.625000000000000000
          13.229166666666670000
          5.291666666666667000
          579.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No additional items to be supplied'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
    end
    object qrsubRemedial: TQRSubDetail
      Left = 38
      Top = 2782
      Width = 718
      Height = 32
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = qrsubRemedialBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qryJRemedials
      HeaderBand = qrchdSnagging
      PrintBefore = False
      PrintIfEmpty = True
      object qrmRemedials: TQRMemo
        Left = 8
        Top = 7
        Width = 337
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          18.520833333333330000
          891.645833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 374
        Top = 7
        Width = 259
        Height = 17
        Size.Values = (
          44.979166666666670000
          989.541666666666700000
          18.520833333333330000
          685.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryJRemedials
        DataField = 'Material_Required'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrshpRemedialLine: TQRShape
        Left = 360
        Top = 1
        Width = 9
        Size.Values = (
          171.979166666666700000
          952.500000000000000000
          2.645833333333333000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Job.*,'
      '        Operator.Operator_Name,'
      '        (select TOP 1 Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order,'
      '         (select TOP 1 Sales_order.Order_Ref_No'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Ref_No,'
      '         (select TOP 1 Sales_order.Appliance_Details'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Appliance_Details,'
      '         (select TOP 1 Sales_order.Extra_Notes'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Extra_Notes,'
      '         (select TOP 1 Sales_order.Install_Address'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Install_Address,'
      '         (select TOP 1 Sales_order.Install_Name'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Install_Name,'
      '         (select TOP 1 Sales_order.Install_Phone'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Install_Phone,'
      '         (select TOP 1 Sales_order.Reference'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Reference,'
      '         (select TOP 1 Sales_order.Date_Required'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Date_Required,'
      '         (select TOP 1 Sales_order.Contact_Name'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Contact_Name,'
      '         (select Sales_order.Revenue_Centre'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '              Sales_Order_line.sales_Order = Sales_order.sales_o' +
        'rder) as Revenue_Centre,'
      '         (SELECT Customer_Branch.Special_Instructions'
      '         FROM Customer_Branch'
      '              INNER JOIN (Sales_Order'
      '              INNER JOIN Sales_Order_Line'
      
        '                  ON Sales_Order.Sales_Order = Sales_Order_Line.' +
        'Sales_Order)'
      
        '                  ON (Customer_Branch.Branch_No = Sales_Order.Br' +
        'anch_no) AND (Customer_Branch.Customer = Sales_Order.Customer)'
      
        '         WHERE sales_order_line.Job = Job.Job) as Site_Instructi' +
        'ons'
      'from Job, Operator'
      'where Job = :Job and'
      'Job.Operator = Operator.Operator')
    Left = 1035
    Top = 54
    ParamData = <
      item
        Name = 'Job'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1152
    Top = 136
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 1046
    Top = 331
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
      'Vat_Rate'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 1046
    Top = 390
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsAddress: TDataSource
    Left = 1110
    Top = 331
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 1149
    Top = 522
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code')
    Left = 1182
    Top = 213
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryUpJStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Job'
      
        'set Job_status = :Job_Status, Production_Date_Actual = :Producti' +
        'on_Date_Actual'
      'where Job = :Job')
    Left = 1216
    Top = 64
    ParamData = <
      item
        Name = 'Job_Status'
      end
      item
        Name = 'Production_Date_Actual'
      end
      item
        Name = 'Job'
      end>
  end
  object qryCompanyAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Company_Name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number '
      'from Company')
    Left = 1048
    Top = 521
  end
  object qryJRemedials: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'Wt'
    SQL.Strings = (
      'select Job_Remedial.*, Fitter.Fitter_Name'
      'from Job_Remedial, Fitter'
      'where Job= :Job and'
      'Job_Remedial.Fitter = Fitter.Fitter'
      'ORDER BY Job, Remedial_Number')
    Left = 1043
    Top = 450
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJobEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Edge.Job,'
      '        Job_Edge.Edge_number,'
      '        Job_Edge.Edge_profile,'
      '        Edge_profile.Description'
      'FROM Edge_profile'
      '      INNER JOIN Job_Edge'
      '      ON Edge_profile.Edge_profile = Job_Edge.Edge_profile'
      'WHERE Job = :Job'
      'ORDER BY Job, Edge_Number')
    Left = 1043
    Top = 118
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJobThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Element.Job,'
      '        Job_Element.Element_Number,'
      '        Job_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Job_Element'
      '      INNER JOIN Thickness'
      '        ON Job_Element.Thickness = Thickness.Thickness'
      'WHERE Job = :Job'
      'ORDER BY Job, Element_Number')
    Left = 1043
    Top = 182
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJobUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT Material_Use.Use_Description'
      'FROM Material_Use'
      '  RIGHT JOIN (Job_Element'
      '  INNER JOIN Thickness'
      '    ON Job_Element.Thickness = Thickness.Thickness)'
      '    ON Material_Use.Material_Use = Job_Element.Material_Use'
      'WHERE Element_number > 1000 AND Job = :Job'
      'GROUP BY Material_Use.Use_Description'
      '')
    Left = 1043
    Top = 254
    ParamData = <
      item
        Name = 'Job'
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
      
        'WHERE Sales_Order = :Sales_Order AND ((Sales_Order_Line.quote = ' +
        '0) or (Sales_Order_Line.quote is NULL))'
      'Order BY Sales_Order_Line_no')
    Left = 78
    Top = 296
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
      DisplayFormat = '0.00%'
    end
    object qrySOLineVAT_Description: TStringField
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
  object dtsSOLine: TDataSource
    DataSet = qrySOLine
    Left = 150
    Top = 299
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'WHERE Revenue_Centre = :Revenue_Centre')
    Left = 1048
    Top = 600
    ParamData = <
      item
        Name = 'Revenue_Centre'
      end>
  end
  object qryReportOld: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Job.*,'
      '        Operator.Operator_Name,'
      '        (select Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order,'
      '         (select Sales_order.Reference'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Reference,'
      '         (select Sales_order.Order_Ref_No'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Ref_No,'
      '         (select Sales_order.Appliance_Details'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Appliance_Details,'
      '        (select Sales_order.Extra_Notes'
      '        from Sales_Order_Line, sales_Order'
      '        where sales_order_line.Job = Job.Job and'
      
        '              Sales_Order_line.sales_Order = Sales_order.sales_o' +
        'rder) as SO_Extra_Notes,'
      '        (select Sales_order.Revenue_Centre'
      '        from Sales_Order_Line, sales_Order'
      '        where sales_order_line.Job = Job.Job and'
      
        '              Sales_Order_line.sales_Order = Sales_order.sales_o' +
        'rder) as Revenue_Centre'
      'from Job, Operator'
      'where Job = :Job and'
      'Job.Operator = Operator.Operator')
    Left = 1107
    Top = 54
    ParamData = <
      item
        Name = 'Job'
        DataType = ftInteger
      end>
  end
end
