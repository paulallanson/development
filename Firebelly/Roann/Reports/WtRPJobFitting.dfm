object frmwtRPJobFitting: TfrmwtRPJobFitting
  Left = 41
  Top = 104
  Caption = 'Installation Sheet'
  ClientHeight = 720
  ClientWidth = 1316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpJobSheet: TQuickRep
    Left = 192
    Top = -2400
    Width = 992
    Height = 3089
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
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
      Left = 47
      Top = 47
      Width = 898
      Height = 1274
      AfterPrint = qrgQuoteAfterPrint
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2696.633333333333000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpJobSheet
      ReprintOnNewPage = False
      object memAddress: TQRRichText
        Left = 250
        Top = 46
        Width = 641
        Height = 20
        Enabled = False
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
      object qrlblSOCaption: TQRLabel
        Left = 399
        Top = -6
        Width = 499
        Height = 54
        Size.Values = (
          114.300000000000000000
          844.550000000000000000
          -12.700000000000000000
          1056.216666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'INSTALLATION SHEET'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -47
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
        Left = 521
        Top = 71
        Width = 371
        Height = 38
        Size.Values = (
          79.375000000000000000
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
        Left = 767
        Top = 79
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          1623.483333333333000000
          167.216666666666700000
          207.433333333333300000)
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
        Font.Height = -17
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
        Left = 535
        Top = 79
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          1132.416666666667000000
          167.216666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
        Left = 678
        Top = 70
        Width = 11
        Height = 38
        Size.Values = (
          79.375000000000000000
          1434.041666666667000000
          148.166666666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 4
        Top = 1062
        Width = 891
        Height = 131
        Size.Values = (
          277.812500000000000000
          7.937500000000000000
          2248.958333333333000000
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
        Left = 10
        Top = 1068
        Width = 114
        Height = 24
        Size.Values = (
          50.800000000000000000
          21.166666666666670000
          2260.600000000000000000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes to Office:'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape6: TQRShape
        Left = 4
        Top = 878
        Width = 891
        Height = 181
        Size.Values = (
          383.645833333333300000
          7.937500000000000000
          1857.375000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 5
        Top = 687
        Width = 890
        Height = 31
        Size.Values = (
          66.145833333333330000
          10.583333333333330000
          1455.208333333333000000
          1883.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel5: TQRLabel
        Left = 10
        Top = 693
        Width = 134
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          1466.850000000000000000
          283.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sinks supplied by:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel6: TQRLabel
        Left = 210
        Top = 693
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          444.500000000000000000
          1466.850000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Showroom'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel7: TQRLabel
        Left = 350
        Top = 693
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          740.833333333333300000
          1466.850000000000000000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape23: TQRShape
        Left = 180
        Top = 694
        Width = 19
        Height = 19
        Size.Values = (
          39.687500000000000000
          381.000000000000000000
          1468.437500000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 320
        Top = 694
        Width = 19
        Height = 19
        Size.Values = (
          39.687500000000000000
          677.333333333333300000
          1468.437500000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape9: TQRShape
        Left = 4
        Top = 520
        Width = 891
        Height = 79
        Size.Values = (
          166.687500000000000000
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
        Left = 4
        Top = 627
        Width = 891
        Height = 31
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          1328.208333333333000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TQRShape
        Left = 4
        Top = 657
        Width = 891
        Height = 31
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          1391.708333333333000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Left = 11
        Top = 525
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          1111.250000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText5: TQRDBText
        Left = 176
        Top = 525
        Width = 711
        Height = 66
        Size.Values = (
          140.229166666666700000
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
        Font.Height = -17
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
        Left = 11
        Top = 633
        Width = 141
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          1339.850000000000000000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material Thickness:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel9: TQRLabel
        Left = 11
        Top = 663
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          1403.350000000000000000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edge Profile:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape15: TQRShape
        Left = 4
        Top = 200
        Width = 891
        Height = 31
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
        Left = 4
        Top = 230
        Width = 891
        Height = 31
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
        Left = 4
        Top = 260
        Width = 891
        Height = 31
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
        Left = 11
        Top = 205
        Width = 205
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
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
      object QRDBText8: TQRDBText
        Left = 250
        Top = 205
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          529.166666666666700000
          433.916666666666700000
          258.233333333333300000)
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
        Font.Height = -17
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
        Left = 4
        Top = 290
        Width = 891
        Height = 31
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
        Left = 11
        Top = 295
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          624.416666666666700000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape18: TQRShape
        Left = 221
        Top = 201
        Width = 9
        Height = 120
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
        Left = 4
        Top = 340
        Width = 891
        Height = 171
        Size.Values = (
          362.479166666666700000
          7.937500000000000000
          719.666666666666800000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrrchTextInstallAddress: TQRRichText
        Left = 180
        Top = 350
        Width = 301
        Height = 121
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
        Left = 10
        Top = 350
        Width = 99
        Height = 24
        Size.Values = (
          50.800000000000000000
          21.166666666666670000
          740.833333333333300000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Address:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape22: TQRShape
        Left = 4
        Top = 480
        Width = 891
        Height = 31
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
        Left = 161
        Top = 341
        Width = 9
        Height = 170
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
        Left = 11
        Top = 485
        Width = 142
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          1026.583333333333000000
          300.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Contact Name:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText3: TQRDBText
        Left = 180
        Top = 484
        Width = 301
        Height = 24
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
        Font.Height = -17
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
        Left = 11
        Top = 234
        Width = 62
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          495.300000000000000000
          131.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel15: TQRLabel
        Left = 491
        Top = 485
        Width = 124
        Height = 21
        Size.Values = (
          44.450000000000000000
          1039.283333333333000000
          1026.583333333333000000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Number:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText6: TQRDBText
        Left = 640
        Top = 485
        Width = 251
        Height = 24
        Size.Values = (
          50.270833333333330000
          1354.666666666667000000
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
        Font.Height = -17
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
        Left = 250
        Top = 234
        Width = 251
        Height = 21
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
      object QRLabel5: TQRLabel
        Left = 11
        Top = 265
        Width = 128
        Height = 24
        Size.Values = (
          50.800000000000000000
          23.283333333333330000
          560.916666666666700000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Client Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText4: TQRDBText
        Left = 250
        Top = 265
        Width = 128
        Height = 24
        Size.Values = (
          50.800000000000000000
          529.166666666666700000
          560.916666666666700000
          270.933333333333300000)
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
        Font.Height = -17
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
        Left = 481
        Top = 481
        Width = 9
        Height = 30
        Size.Values = (
          63.500000000000000000
          1018.645833333333000000
          1018.645833333333000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape25: TQRShape
        Left = 621
        Top = 481
        Width = 9
        Height = 30
        Size.Values = (
          63.500000000000000000
          1314.979166666667000000
          1018.645833333333000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRRichText1: TQRRichText
        Left = 6
        Top = 1200
        Width = 890
        Height = 75
        Size.Values = (
          158.750000000000000000
          13.229166666666670000
          2540.000000000000000000
          1883.833333333333000000)
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
          
            'All fitters MUST sign in at the site office (where applicable) P' +
            'lease ensure this form is returned to the office with '
          
            'the completed sign off form. Please ensure all installations are' +
            ' left with Akemi cleaner and handover pack.')
      end
      object gtQRShape4: TQRShape
        Left = 521
        Top = 151
        Width = 371
        Height = 40
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
        Left = 678
        Top = 151
        Width = 11
        Height = 40
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
        Left = 535
        Top = 161
        Width = 136
        Height = 21
        Size.Values = (
          44.450000000000000000
          1132.416666666667000000
          340.783333333333300000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Weight (kgs)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
        Left = 177
        Top = 661
        Width = 704
        Height = 21
        Size.Values = (
          44.979166666666670000
          375.708333333333300000
          1399.645833333333000000
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
      object qrlblThickness: TQRLabel
        Left = 177
        Top = 633
        Width = 704
        Height = 21
        Size.Values = (
          44.979166666666670000
          375.708333333333300000
          1338.791666666667000000
          1489.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblThickness'
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
      object qriHeadLogo: TQRImage
        Left = 65
        Top = -10
        Width = 306
        Height = 141
        Size.Values = (
          298.979166666666700000
          137.583333333333300000
          -21.166666666666670000
          648.229166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRShape27: TQRShape
        Left = 4
        Top = 597
        Width = 891
        Height = 31
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          1264.708333333333000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel12: TQRLabel
        Left = 11
        Top = 603
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          1276.350000000000000000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Colour:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblColour: TQRLabel
        Left = 177
        Top = 603
        Width = 504
        Height = 21
        Size.Values = (
          44.979166666666670000
          375.708333333333300000
          1275.291666666667000000
          1066.270833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblColour'
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
      object gtQRLabel19: TQRLabel
        Left = 10
        Top = 891
        Width = 127
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          1885.950000000000000000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Appliance Details'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel20: TQRLabel
        Left = 460
        Top = 891
        Width = 149
        Height = 21
        Size.Values = (
          44.450000000000000000
          973.666666666666700000
          1885.950000000000000000
          315.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Special Instructions:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape31: TQRShape
        Left = 691
        Top = 603
        Width = 19
        Height = 19
        Size.Values = (
          39.687500000000000000
          1463.145833333333000000
          1275.291666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel24: TQRLabel
        Left = 715
        Top = 601
        Width = 172
        Height = 21
        Size.Values = (
          44.450000000000000000
          1513.416666666667000000
          1272.116666666667000000
          364.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Silicone Colour Match'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape32: TQRShape
        Left = 631
        Top = 694
        Width = 19
        Height = 19
        Size.Values = (
          39.687500000000000000
          1336.145833333333000000
          1468.437500000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel25: TQRLabel
        Left = 665
        Top = 693
        Width = 213
        Height = 21
        Size.Values = (
          44.450000000000000000
          1407.583333333333000000
          1466.850000000000000000
          450.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sink and Tap Pack loaded?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape35: TQRShape
        Left = 161
        Top = 521
        Width = 5
        Height = 195
        Size.Values = (
          412.750000000000000000
          341.312500000000000000
          1103.312500000000000000
          10.583333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlblWorktopWeight: TQRLabel
        Left = 720
        Top = 161
        Width = 145
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
          340.783333333333300000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblWorktopWeight'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblDateRequired: TQRLabel
        Left = 250
        Top = 295
        Width = 131
        Height = 21
        Size.Values = (
          44.450000000000000000
          529.166666666666700000
          624.416666666666700000
          277.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDateRequired'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrrchTextRiskNotes: TQRMemo
        Left = 460
        Top = 914
        Width = 431
        Height = 138
        Size.Values = (
          291.041666666666700000
          973.666666666666700000
          1934.104166666667000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrrchTextNotes: TQRMemo
        Left = 10
        Top = 914
        Width = 431
        Height = 138
        Size.Values = (
          291.041666666666700000
          21.166666666666670000
          1934.104166666667000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRShape12: TQRShape
        Left = 4
        Top = 717
        Width = 891
        Height = 174
        Size.Values = (
          367.770833333333300000
          7.937500000000000000
          1518.708333333333000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel4: TQRLabel
        Left = 10
        Top = 721
        Width = 123
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          1526.116666666667000000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Instructions:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextSiteNotes: TQRMemo
        Left = 10
        Top = 744
        Width = 431
        Height = 138
        Size.Values = (
          291.041666666666700000
          21.166666666666670000
          1574.270833333333000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRLabel17: TQRLabel
        Left = 460
        Top = 721
        Width = 47
        Height = 21
        Size.Values = (
          44.450000000000000000
          973.666666666666700000
          1526.116666666667000000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextOrderNotes: TQRMemo
        Left = 460
        Top = 744
        Width = 431
        Height = 138
        Size.Values = (
          291.041666666666700000
          973.666666666666700000
          1574.270833333333000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object qrchdSatisfaction: TQRChildBand
      Left = 47
      Top = 1321
      Width = 898
      Height = 1275
      AlignToBottom = False
      BeforePrint = qrchdSatisfactionBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        2698.750000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrgQuote
      PrintOrder = cboAfterParent
      object gtQRShape37: TQRShape
        Left = 1
        Top = 430
        Width = 891
        Height = 740
        Size.Values = (
          1566.333333333333000000
          2.116666666666667000
          910.166666666666700000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 499
        Top = 25
        Width = 383
        Height = 56
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
        Font.Height = -47
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
        Left = 250
        Top = 90
        Width = 621
        Height = 20
        Enabled = False
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
      object QRLabel18: TQRLabel
        Left = 4
        Top = 240
        Width = 157
        Height = 21
        Size.Values = (
          44.450000000000000000
          8.466666666666667000
          508.000000000000000000
          332.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'It'#39's agreed as follows:'
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
      object QRMemo1: TQRMemo
        Left = 70
        Top = 280
        Width = 825
        Height = 21
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          592.666666666666700000
          1746.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'That <Company> has completed the works required by the customer ' +
            'in line with the original quotation.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 40
        Top = 280
        Width = 15
        Height = 21
        Size.Values = (
          44.450000000000000000
          84.666666666666670000
          592.666666666666700000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '1.'
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
      object QRLabel25: TQRLabel
        Left = 40
        Top = 310
        Width = 15
        Height = 21
        Size.Values = (
          44.450000000000000000
          84.666666666666670000
          656.166666666666700000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '2.'
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
      object QRMemo2: TQRMemo
        Left = 70
        Top = 310
        Width = 567
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          656.166666666666700000
          1200.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'That the customer has checked the work and they are satisfied wi' +
            'th the install.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel48: TQRLabel
        Left = 40
        Top = 340
        Width = 15
        Height = 21
        Size.Values = (
          44.450000000000000000
          84.666666666666670000
          719.666666666666700000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '3.'
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
      object QRMemo3: TQRMemo
        Left = 70
        Top = 340
        Width = 490
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          719.666666666666700000
          1037.166666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'The customer accepts delivery of the materials, fixtures and fit' +
            'tings.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel49: TQRLabel
        Left = 40
        Top = 370
        Width = 15
        Height = 21
        Size.Values = (
          44.450000000000000000
          84.666666666666670000
          783.166666666666700000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '4.'
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
      object QRMemo4: TQRMemo
        Left = 70
        Top = 370
        Width = 686
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          783.166666666666700000
          1452.033333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Nothing in this agreement shall affect any guarantee on the work' +
            ' carried out by the contractor.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel50: TQRLabel
        Left = 8
        Top = 1238
        Width = 425
        Height = 21
        Size.Values = (
          44.450000000000000000
          16.933333333333330000
          2620.433333333333000000
          899.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Fitter signature: ..............................................' +
          '...............'
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
      object QRLabel51: TQRLabel
        Left = 458
        Top = 1238
        Width = 448
        Height = 21
        Size.Values = (
          44.450000000000000000
          969.433333333333300000
          2620.433333333333000000
          948.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Customer signature: ............................................' +
          '...............'
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
      object qriheadlogo1: TQRImage
        Left = 65
        Top = 30
        Width = 306
        Height = 141
        Size.Values = (
          298.979166666666700000
          137.583333333333300000
          63.500000000000000000
          648.229166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRShape38: TQRShape
        Left = 411
        Top = 430
        Width = 105
        Height = 740
        Size.Values = (
          1566.333333333333000000
          869.950000000000000000
          910.166666666666700000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape39: TQRShape
        Left = 458
        Top = 430
        Width = 11
        Height = 740
        Size.Values = (
          1566.333333333333000000
          969.433333333333300000
          910.166666666666700000
          23.283333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape40: TQRShape
        Left = 0
        Top = 490
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          0.000000000000000000
          1037.166666666667000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel3: TQRLabel
        Left = 9
        Top = 465
        Width = 210
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          984.250000000000000000
          444.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All worktops fitted to template'
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
      object gtQRShape41: TQRShape
        Left = 0
        Top = 455
        Width = 891
        Height = 3
        Size.Values = (
          5.291666666666667000
          0.000000000000000000
          963.083333333333300000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel10: TQRLabel
        Left = 423
        Top = 432
        Width = 29
        Height = 21
        Size.Values = (
          44.450000000000000000
          895.350000000000000000
          914.400000000000000000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes'
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
      object gtQRLabel11: TQRLabel
        Left = 479
        Top = 432
        Width = 21
        Height = 21
        Size.Values = (
          44.450000000000000000
          1013.883333333333000000
          914.400000000000000000
          44.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
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
      object gtQRShape42: TQRShape
        Left = 0
        Top = 525
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          0.000000000000000000
          1111.250000000000000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel18: TQRLabel
        Left = 9
        Top = 500
        Width = 290
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          1058.333333333333000000
          613.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Worktops at the correct height and level'
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
      object gtQRLabel47: TQRLabel
        Left = 9
        Top = 533
        Width = 141
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          1128.183333333333000000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hob cut out correct'
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
      object gtQRLabel48: TQRLabel
        Left = 9
        Top = 567
        Width = 393
        Height = 38
        Size.Values = (
          80.433333333333330000
          19.050000000000000000
          1200.150000000000000000
          831.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Sink cut out correct and installed with rim sealant to worktops'
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
      object gtQRLabel49: TQRLabel
        Left = 10
        Top = 621
        Width = 255
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          1314.450000000000000000
          539.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Worktop joint good, clean and level'
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
      object gtQRLabel50: TQRLabel
        Left = 9
        Top = 654
        Width = 356
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          1384.300000000000000000
          753.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mitred joints (if any) to be clean, sealed and level'
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
      object gtQRLabel51: TQRLabel
        Left = 9
        Top = 689
        Width = 288
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          1458.383333333333000000
          609.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Check worktops for chips and scatches'
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
      object gtQRLabel52: TQRLabel
        Left = 11
        Top = 724
        Width = 170
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          1532.466666666667000000
          359.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Check taphole is drilled'
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
      object gtQRLabel53: TQRLabel
        Left = 9
        Top = 759
        Width = 387
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          1606.550000000000000000
          819.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Colour consistent across slabs if more than one used'
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
      object gtQRLabel54: TQRLabel
        Left = 9
        Top = 794
        Width = 235
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          1680.633333333333000000
          497.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Check units are clear of rubbish'
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
      object gtQRLabel55: TQRLabel
        Left = 11
        Top = 829
        Width = 394
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          1754.716666666667000000
          833.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Picture of worktop complete prior to protection applied'
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
      object gtQRLabel56: TQRLabel
        Left = 9
        Top = 864
        Width = 385
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          1828.800000000000000000
          814.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Picture of worktops after protection has been applied'
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
      object gtQRLabel57: TQRLabel
        Left = 12
        Top = 899
        Width = 393
        Height = 41
        Size.Values = (
          86.783333333333330000
          25.400000000000000000
          1902.883333333333000000
          831.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          'Picture of waste kit in sink unit (those who Roann supply sinks ' +
          'to)'
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
      object gtQRShape43: TQRShape
        Left = 0
        Top = 890
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          0.000000000000000000
          1883.833333333333000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape44: TQRShape
        Left = 0
        Top = 855
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          0.000000000000000000
          1809.750000000000000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape45: TQRShape
        Left = 0
        Top = 820
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          0.000000000000000000
          1735.666666666667000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape46: TQRShape
        Left = 0
        Top = 785
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          0.000000000000000000
          1661.583333333333000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape47: TQRShape
        Left = 1
        Top = 750
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          2.116666666666667000
          1587.500000000000000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape49: TQRShape
        Left = 0
        Top = 560
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          0.000000000000000000
          1185.333333333333000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape50: TQRShape
        Left = 0
        Top = 610
        Width = 891
        Height = 5
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          1291.166666666667000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape51: TQRShape
        Left = 1
        Top = 645
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          2.116666666666667000
          1365.250000000000000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape52: TQRShape
        Left = -1
        Top = 680
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          -2.116666666666667000
          1439.333333333333000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape53: TQRShape
        Left = 1
        Top = 715
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          2.116666666666667000
          1513.416666666667000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel58: TQRLabel
        Left = 522
        Top = 432
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1104.900000000000000000
          914.400000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Comments'
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
      object gtQRLabel59: TQRLabel
        Left = 490
        Top = 129
        Width = 73
        Height = 24
        Size.Values = (
          50.800000000000000000
          1037.166666666667000000
          273.050000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
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
      object gtQRDBText4: TQRDBText
        Left = 779
        Top = 129
        Width = 92
        Height = 24
        Size.Values = (
          50.800000000000000000
          1648.883333333333000000
          273.050000000000000000
          194.733333333333300000)
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
        Font.Height = -17
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
      object gtQRLabel60: TQRLabel
        Left = 490
        Top = 209
        Width = 122
        Height = 24
        Size.Values = (
          50.800000000000000000
          1037.166666666667000000
          442.383333333333300000
          258.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Reference:'
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
      object gtQRDBText1: TQRDBText
        Left = 610
        Top = 209
        Width = 261
        Height = 24
        Size.Values = (
          50.270833333333330000
          1291.166666666667000000
          441.854166666666700000
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
        DataField = 'Order_Ref_No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
      object QRShape1: TQRShape
        Left = -1
        Top = 1015
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          -2.116666666666667000
          2148.416666666667000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = -1
        Top = 980
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          -2.116666666666667000
          2074.333333333333000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 1
        Top = 945
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          2.116666666666667000
          2000.250000000000000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = -1
        Top = 1050
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          -2.116666666666667000
          2222.500000000000000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = -1
        Top = 1107
        Width = 891
        Height = 3
        Size.Values = (
          6.350000000000000000
          -2.116666666666667000
          2343.150000000000000000
          1885.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 12
        Top = 955
        Width = 393
        Height = 22
        Size.Values = (
          46.566666666666670000
          25.400000000000000000
          2021.416666666667000000
          831.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Have you been inducted and signed in to site?'
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
      object QRLabel2: TQRLabel
        Left = 12
        Top = 989
        Width = 393
        Height = 22
        Size.Values = (
          46.566666666666670000
          25.400000000000000000
          2093.383333333333000000
          831.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Have you signed the project RAMS?'
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
      object QRLabel3: TQRLabel
        Left = 12
        Top = 1024
        Width = 393
        Height = 22
        Size.Values = (
          46.566666666666670000
          25.400000000000000000
          2167.466666666667000000
          831.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Are you wearing the correct PPE?'
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
      object QRLabel6: TQRLabel
        Left = 12
        Top = 1059
        Width = 393
        Height = 42
        Size.Values = (
          88.900000000000000000
          25.400000000000000000
          2241.550000000000000000
          831.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          'Have hazardous sunstances been used in accordance with the COSHH' +
          ' assessments?'
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
      object QRLabel7: TQRLabel
        Left = 12
        Top = 1116
        Width = 393
        Height = 42
        Size.Values = (
          88.900000000000000000
          25.400000000000000000
          2362.200000000000000000
          831.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          'Have you carried out the installation safely and in accordance w' +
          'ith our RAMS?'
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
    end
    object qrbSignature: TQRBand
      Left = 47
      Top = 3129
      Width = 898
      Height = 230
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        486.833333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel60: TQRLabel
        Left = 20
        Top = 12
        Width = 447
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          25.400000000000000000
          946.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Goods checked and received in good condition'
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
      object QRLabel61: TQRLabel
        Left = 20
        Top = 61
        Width = 151
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          129.116666666666700000
          319.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Signature:'
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
      object QRLabel62: TQRLabel
        Left = 20
        Top = 181
        Width = 112
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          383.116666666666700000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Received:'
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
      object QRLabel65: TQRLabel
        Left = 260
        Top = 111
        Width = 581
        Height = 21
        Size.Values = (
          44.450000000000000000
          550.333333333333300000
          234.950000000000000000
          1229.783333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '....................................................'
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
      object QRLabel67: TQRLabel
        Left = 260
        Top = 181
        Width = 581
        Height = 21
        Size.Values = (
          44.450000000000000000
          550.333333333333300000
          383.116666666666700000
          1229.783333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '....................................................'
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
      object QRLabel68: TQRLabel
        Left = 260
        Top = 61
        Width = 581
        Height = 21
        Size.Values = (
          44.450000000000000000
          550.333333333333300000
          129.116666666666700000
          1229.783333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '....................................................'
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
      object gtQRLabel46: TQRLabel
        Left = 20
        Top = 111
        Width = 105
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          234.950000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Printed Name:'
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
    end
    object qrchdDelivery: TQRChildBand
      Left = 47
      Top = 2596
      Width = 898
      Height = 500
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1058.333333333333000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbSignature
      PrintOrder = cboAfterParent
      object gtQRLabel28: TQRLabel
        Left = 499
        Top = 25
        Width = 383
        Height = 56
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
        Caption = 'DELIVERY NOTE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -47
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 28
      end
      object qriheadlogo3: TQRImage
        Left = 65
        Top = 30
        Width = 306
        Height = 141
        Size.Values = (
          298.979166666666700000
          137.583333333333300000
          63.500000000000000000
          648.229166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRLabel31: TQRLabel
        Left = 470
        Top = 229
        Width = 73
        Height = 24
        Size.Values = (
          50.800000000000000000
          994.833333333333300000
          484.716666666666700000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
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
      object gtQRDBText8: TQRDBText
        Left = 759
        Top = 229
        Width = 92
        Height = 24
        Size.Values = (
          50.800000000000000000
          1606.550000000000000000
          484.716666666666700000
          194.733333333333300000)
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
        Font.Height = -17
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
      object gtQRLabel32: TQRLabel
        Left = 470
        Top = 309
        Width = 118
        Height = 24
        Size.Values = (
          50.800000000000000000
          994.833333333333300000
          654.050000000000000000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Order Ref:'
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
      object gtQRDBText9: TQRDBText
        Left = 590
        Top = 309
        Width = 261
        Height = 24
        Size.Values = (
          50.270833333333330000
          1248.833333333333000000
          653.520833333333300000
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
        DataField = 'Order_Ref_No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
      object gtQRLabel33: TQRLabel
        Left = 20
        Top = 195
        Width = 133
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          412.750000000000000000
          281.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Name:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText10: TQRDBText
        Left = 165
        Top = 195
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          349.250000000000000000
          412.750000000000000000
          258.233333333333300000)
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
        Font.Height = -17
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
      object gtQRLabel34: TQRLabel
        Left = 20
        Top = 231
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          488.950000000000000000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Address:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel44: TQRLabel
        Left = 20
        Top = 465
        Width = 236
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          984.250000000000000000
          499.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of supplied goods'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel45: TQRLabel
        Left = 720
        Top = 465
        Width = 146
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
          984.250000000000000000
          309.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity Delivered'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextInstallAddress2: TQRMemo
        Left = 20
        Top = 260
        Width = 401
        Height = 121
        Size.Values = (
          256.645833333333300000
          42.333333333333330000
          550.333333333333300000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'InstallAddress')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 470
        Top = 260
        Width = 82
        Height = 24
        Size.Values = (
          50.800000000000000000
          994.833333333333300000
          550.333333333333300000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
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
      object QRDBText1: TQRDBText
        Left = 558
        Top = 260
        Width = 293
        Height = 24
        Size.Values = (
          50.800000000000000000
          1181.100000000000000000
          550.333333333333300000
          620.183333333333300000)
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
        Font.Height = -17
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
    object qrsdQElements: TQRSubDetail
      Left = 47
      Top = 3096
      Width = 898
      Height = 33
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qryQElements
      HeaderBand = qrchdDelivery
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TQRLabel
        Left = 20
        Top = 5
        Width = 671
        Height = 24
        Size.Values = (
          50.270833333333330000
          42.333333333333330000
          10.583333333333330000
          1420.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblQuantity: TQRLabel
        Left = 770
        Top = 5
        Width = 76
        Height = 24
        Size.Values = (
          50.800000000000000000
          1629.833333333333000000
          10.583333333333330000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    Left = 1043
    Top = 6
    ParamData = <
      item
        Name = 'Job'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1152
    Top = 8
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
  object qryGetNotes: TFDQuery
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
    Left = 1152
    Top = 56
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
      
        'SELECT DISTINCT Material_Use.Use_Description, sum(Job_Element.Qu' +
        'antity) as Use_Count,'
      '        sum(Job_Element.Total_Upstand_Pieces) as Total_Pieces'
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
  object qryJobWorktop: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Worktop.Worktop,'
      '                Worktop.Description as Worktop_Description,'
      '                Material_Type.Material_Type,'
      
        '                Material_Type.Description as Material_Descriptio' +
        'n'
      'FROM Material_Type'
      '      INNER JOIN (Worktop'
      '      INNER JOIN Job_Element'
      '        ON Worktop.Worktop = Job_Element.Worktop)'
      '        ON Material_Type.Material_Type = Worktop.Material_Type'
      'WHERE Job_Element.Job = :Job'
      'ORDER BY Job_Element.Job, Job_Element.Element_number')
    Left = 1043
    Top = 54
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJobWorktopCount: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sum(Job_Element.Quantity) AS Total_Pieces'
      
        'FROM Job_Element INNER JOIN Thickness ON Job_Element.Thickness =' +
        ' Thickness.Thickness'
      
        'WHERE (Job_Element.Element_number < 1000) AND Job_Element.job = ' +
        ':Job'
      '')
    Left = 1179
    Top = 262
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryQElements: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description,'
      '        Material_Type.Description as Material_Description'
      'FROM Material_Type'
      '        INNER JOIN (Worktop'
      '        INNER JOIN ((Thickness'
      '        INNER JOIN Worktop_thickness'
      '          ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        INNER JOIN (Material_Use'
      '        RIGHT JOIN Quote_Element'
      
        '          ON Material_Use.Material_Use = Quote_Element.Material_' +
        'Use)'
      
        '          ON (Worktop_thickness.Thickness = Quote_Element.Thickn' +
        'ess) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      
        '          ON Worktop.Worktop = Worktop_thickness.Worktop) ON Mat' +
        'erial_Type.Material_Type = Worktop.Material_Type'
      'WHERE Quote = :Quote'
      'ORDER BY Element_number')
    Left = 1152
    Top = 120
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryJobWorktopWeight: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'SELECT Sum((((Job_Element.Length * Job_Element.Depth)/1000000.00' +
        '000) * Job_Element.Quantity) * Worktop_Type_Thickness.Weight_kg)' +
        ' AS Total_Weight'
      'FROM Worktop_Type_Thickness'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN Job_Element'
      
        '          ON Material_Type.Material_Type = Job_Element.Material_' +
        'type)'
      
        '          ON (Worktop_Type_Thickness.Thickness = Job_Element.Thi' +
        'ckness) AND (Worktop_Type_Thickness.Worktop_Type = Material_Type' +
        '.Worktop_Type)'
      'WHERE (Job_Element.job = :Job)')
    Left = 1179
    Top = 382
    ParamData = <
      item
        Name = 'Job'
      end>
  end
end
