object frmwtRPJobFitting: TfrmwtRPJobFitting
  Left = 41
  Top = 104
  Caption = 'frmwtRPJobFitting'
  ClientHeight = 720
  ClientWidth = 1282
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
    Left = 216
    Top = 18
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
      object qrlblSOCaption: TQRLabel
        Left = 452
        Top = -5
        Width = 265
        Height = 43
        Size.Values = (
          113.770833333333300000
          1195.916666666667000000
          -13.229166666666670000
          701.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'INSTALLATION'
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
        Left = 465
        Top = 57
        Width = 250
        Height = 56
        Size.Values = (
          148.166666666666700000
          1230.312500000000000000
          150.812500000000000000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText2: TQRDBText
        Left = 621
        Top = 90
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1643.062500000000000000
          238.125000000000000000
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
        Left = 476
        Top = 90
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          238.125000000000000000
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
        Left = 558
        Top = 56
        Width = 9
        Height = 56
        Size.Values = (
          148.166666666666700000
          1476.375000000000000000
          148.166666666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 465
        Top = 83
        Width = 250
        Height = 5
        Size.Values = (
          13.229166666666670000
          1230.312500000000000000
          219.604166666666700000
          661.458333333333300000)
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
      object gtQRShape6: TQRShape
        Left = 3
        Top = 656
        Width = 713
        Height = 153
        Size.Values = (
          404.812500000000000000
          7.937500000000000000
          1735.666666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel4: TQRLabel
        Left = 8
        Top = 659
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1743.604166666667000000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Special Instructions:'
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
      object gtQRShape7: TQRShape
        Left = 3
        Top = 624
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          1651.000000000000000000
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
        Top = 628
        Width = 108
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1661.583333333333000000
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
        Top = 628
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          1661.583333333333000000
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
        Top = 628
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          846.666666666666700000
          1661.583333333333000000
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
        Top = 629
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          486.833333333333400000
          1664.229166666667000000
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
        Top = 629
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          783.166666666666800000
          1664.229166666667000000
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
        Left = 476
        Top = 64
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          169.333333333333300000
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
        DataField = 'Install_Name'
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
        Left = 512
        Top = 388
        Width = 201
        Height = 19
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
        DataField = 'Install_Phone'
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
        Width = 59
        Height = 19
        Size.Values = (
          50.270833333333330000
          529.166666666666700000
          560.916666666666700000
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
      object gtQRShape24: TQRShape
        Left = 385
        Top = 385
        Width = 7
        Height = 24
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
        Left = 497
        Top = 385
        Width = 7
        Height = 24
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
      object gtQRDBText3: TQRDBText
        Left = 200
        Top = 236
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          624.416666666666700000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Required'
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
          'All fitters '
          'MUST sign '
          'in at the site '
          'office '
          '(where '
          'applicable)'
          'Please '
          'ensure this '
          'form is '
          'returned to '
          'the office '
          'with the '
          'completed '
          'sign off '
          'form.')
      end
      object QRDBText2: TQRDBText
        Left = 676
        Top = 64
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          1788.583333333333000000
          169.333333333333300000
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
        Left = 465
        Top = 121
        Width = 250
        Height = 32
        Size.Values = (
          84.666666666666670000
          1230.312500000000000000
          320.145833333333300000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape26: TQRShape
        Left = 558
        Top = 121
        Width = 9
        Height = 32
        Size.Values = (
          84.666666666666670000
          1476.375000000000000000
          320.145833333333300000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 468
        Top = 129
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          1238.250000000000000000
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
      object qrrchTextNotes: TQRRichText
        Left = 8
        Top = 680
        Width = 700
        Height = 121
        Size.Values = (
          320.145833333333400000
          21.166666666666670000
          1799.166666666667000000
          1852.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
          'Special Instuctions')
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
      object qriHeadLogo: TQRImage
        Left = 8
        Top = 4
        Width = 245
        Height = 133
        Size.Values = (
          351.895833333333300000
          21.166666666666670000
          10.583333333333330000
          648.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object memAddress: TQRMemo
        Left = 259
        Top = 6
        Width = 76
        Height = 131
        Size.Values = (
          346.604166666666700000
          685.270833333333300000
          15.875000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object qrchdSatisfaction: TQRChildBand
      Left = 38
      Top = 1057
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
      ParentBand = qrgQuote
      PrintOrder = cboAfterParent
      object QRLabel11: TQRLabel
        Left = 519
        Top = 4
        Width = 202
        Height = 85
        Size.Values = (
          224.895833333333300000
          1373.187500000000000000
          10.583333333333330000
          534.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
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
      object QRLabel70: TQRLabel
        Left = 456
        Top = 184
        Width = 45
        Height = 19
        Size.Values = (
          50.270833333333330000
          1206.500000000000000000
          486.833333333333300000
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
        Left = 660
        Top = 184
        Width = 21
        Height = 19
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          486.833333333333300000
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
      object gtQRLabel3: TQRLabel
        Left = 456
        Top = 215
        Width = 57
        Height = 19
        Size.Values = (
          50.270833333333330000
          1206.500000000000000000
          568.854166666666700000
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
        Left = 608
        Top = 215
        Width = 73
        Height = 19
        Size.Values = (
          50.270833333333330000
          1608.666666666667000000
          568.854166666666700000
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
        Left = 456
        Top = 247
        Width = 94
        Height = 19
        Size.Values = (
          50.270833333333330000
          1206.500000000000000000
          653.520833333333300000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Reference:'
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
        Left = 599
        Top = 247
        Width = 82
        Height = 19
        Size.Values = (
          50.270833333333330000
          1584.854166666667000000
          653.520833333333300000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
      object qrrchTextInstallAddress1: TQRRichText
        Left = 16
        Top = 208
        Width = 417
        Height = 97
        Size.Values = (
          256.645833333333400000
          42.333333333333340000
          550.333333333333400000
          1103.312500000000000000)
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
      object qriHeadLogo1: TQRImage
        Left = 8
        Top = 4
        Width = 245
        Height = 133
        Size.Values = (
          351.895833333333300000
          21.166666666666670000
          10.583333333333330000
          648.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object memAddress1: TQRMemo
        Left = 259
        Top = 6
        Width = 83
        Height = 131
        Size.Values = (
          346.604166666666700000
          685.270833333333300000
          15.875000000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object qrchdSnagging: TQRChildBand
      Left = 38
      Top = 2052
      Width = 718
      Height = 389
      Frame.DrawBottom = True
      Frame.Width = 3
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1029.229166666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrchdSatisfaction
      PrintOrder = cboAfterParent
      object QRLabel53: TQRLabel
        Left = 495
        Top = 4
        Width = 218
        Height = 109
        Size.Values = (
          288.395833333333300000
          1309.687500000000000000
          10.583333333333330000
          576.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
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
        Left = 504
        Top = 196
        Width = 45
        Height = 19
        Size.Values = (
          50.270833333333330000
          1333.500000000000000000
          518.583333333333300000
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
        Top = 196
        Width = 21
        Height = 19
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          518.583333333333300000
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
      object gtQRLabel17: TQRLabel
        Left = 504
        Top = 228
        Width = 57
        Height = 19
        Size.Values = (
          50.270833333333330000
          1333.500000000000000000
          603.250000000000000000
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
      object gtQRDBText5: TQRDBText
        Left = 608
        Top = 228
        Width = 73
        Height = 19
        Size.Values = (
          50.270833333333330000
          1608.666666666667000000
          603.250000000000000000
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
      object qriHeadLogo2: TQRImage
        Left = 8
        Top = 4
        Width = 245
        Height = 133
        Size.Values = (
          351.895833333333300000
          21.166666666666670000
          10.583333333333330000
          648.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object memAddress2: TQRMemo
        Left = 259
        Top = 6
        Width = 83
        Height = 131
        Size.Values = (
          346.604166666666700000
          685.270833333333300000
          15.875000000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object qrsubRemedial: TQRSubDetail
      Left = 38
      Top = 2441
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
        Width = 315
        Height = 17
        Size.Values = (
          44.979166666666670000
          989.541666666666800000
          18.520833333333330000
          833.437500000000000000)
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
    object qrSnaggingSummary: TQRBand
      Left = 38
      Top = 2473
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
    object qrchdFittingReport: TQRChildBand
      Left = 38
      Top = 2657
      Width = 718
      Height = 1046
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        2767.541666666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrSnaggingSummary
      PrintOrder = cboAfterParent
      object gtQRShape81: TQRShape
        Left = 3
        Top = 932
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          2465.916666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel12: TQRLabel
        Left = 504
        Top = 4
        Width = 209
        Height = 109
        Size.Values = (
          288.395833333333300000
          1333.500000000000000000
          10.583333333333330000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'FITTING REPORT'
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
      object gtQRShape27: TQRShape
        Left = 465
        Top = 89
        Width = 250
        Height = 56
        Size.Values = (
          148.166666666666700000
          1230.312500000000000000
          235.479166666666700000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText7: TQRDBText
        Left = 621
        Top = 122
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1643.062500000000000000
          322.791666666666700000
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
      object gtQRLabel19: TQRLabel
        Left = 476
        Top = 122
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          322.791666666666700000
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
      object gtQRShape28: TQRShape
        Left = 558
        Top = 88
        Width = 9
        Height = 56
        Size.Values = (
          148.166666666666700000
          1476.375000000000000000
          232.833333333333300000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape29: TQRShape
        Left = 465
        Top = 115
        Width = 250
        Height = 5
        Size.Values = (
          13.229166666666670000
          1230.312500000000000000
          304.270833333333300000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape30: TQRShape
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
      object gtQRShape31: TQRShape
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
      object gtQRShape32: TQRShape
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
      object gtQRLabel20: TQRLabel
        Left = 9
        Top = 164
        Width = 99
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          433.916666666666700000
          261.937500000000000000)
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
      object gtQRShape33: TQRShape
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
      object gtQRLabel21: TQRLabel
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
      object gtQRShape34: TQRShape
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
      object gtQRShape35: TQRShape
        Left = 3
        Top = 272
        Width = 713
        Height = 137
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
      object qrrchTextInstallAddress2: TQRRichText
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
      object gtQRLabel22: TQRLabel
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
      object gtQRLabel23: TQRLabel
        Left = 476
        Top = 96
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          254.000000000000000000
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
      object gtQRShape36: TQRShape
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
      object gtQRShape37: TQRShape
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
      object gtQRLabel24: TQRLabel
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
      object gtQRDBText9: TQRDBText
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
        DataField = 'Install_Name'
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
      object gtQRLabel25: TQRLabel
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
      object gtQRLabel26: TQRLabel
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
      object gtQRDBText10: TQRDBText
        Left = 512
        Top = 388
        Width = 201
        Height = 19
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
        DataField = 'Install_Phone'
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
      object qrlblContact1: TQRLabel
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
      object gtQRLabel28: TQRLabel
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
      object gtQRDBText11: TQRDBText
        Left = 200
        Top = 212
        Width = 59
        Height = 19
        Size.Values = (
          50.270833333333330000
          529.166666666666700000
          560.916666666666700000
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
      object gtQRShape38: TQRShape
        Left = 385
        Top = 385
        Width = 7
        Height = 24
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
      object gtQRShape39: TQRShape
        Left = 497
        Top = 385
        Width = 7
        Height = 24
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
      object gtQRDBText12: TQRDBText
        Left = 200
        Top = 236
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          624.416666666666700000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Required'
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
      object qriHeadlogo3: TQRImage
        Left = 8
        Top = 12
        Width = 245
        Height = 133
        Size.Values = (
          351.895833333333300000
          21.166666666666670000
          31.750000000000000000
          648.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object memAddress3: TQRMemo
        Left = 259
        Top = 14
        Width = 83
        Height = 131
        Size.Values = (
          346.604166666666700000
          685.270833333333300000
          37.041666666666670000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape40: TQRShape
        Left = 3
        Top = 416
        Width = 713
        Height = 45
        Size.Values = (
          119.062500000000000000
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
      object gtQRMemo2: TQRMemo
        Left = 312
        Top = 421
        Width = 393
        Height = 36
        Size.Values = (
          95.250000000000000000
          825.500000000000000000
          1113.895833333333000000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'Please provide as much detail as possible so we can ACCURATELY f' +
            'eed back to the client on why we haven'#39't finished etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape41: TQRShape
        Left = 299
        Top = 416
        Width = 7
        Height = 45
        Size.Values = (
          119.062500000000000000
          791.104166666666700000
          1100.666666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel29: TQRLabel
        Left = 235
        Top = 435
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          621.770833333333300000
          1150.937500000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes'
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
      object gtQRLabel30: TQRLabel
        Left = 275
        Top = 435
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          727.604166666666700000
          1150.937500000000000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
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
      object gtQRShape42: TQRShape
        Left = 219
        Top = 416
        Width = 7
        Height = 45
        Size.Values = (
          119.062500000000000000
          579.437500000000000000
          1100.666666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape43: TQRShape
        Left = 3
        Top = 459
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          1214.437500000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape44: TQRShape
        Left = 219
        Top = 459
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          1214.437500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape45: TQRShape
        Left = 299
        Top = 459
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          1214.437500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo3: TQRMemo
        Left = 8
        Top = 468
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          1238.250000000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Was the access clear and/or the fitting area clear before you ar' +
            'rived?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape46: TQRShape
        Left = 237
        Top = 475
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          1256.770833333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape47: TQRShape
        Left = 275
        Top = 475
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          1256.770833333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel31: TQRLabel
        Left = 313
        Top = 460
        Width = 184
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          1217.083333333333000000
          486.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If NOT describe the issues you faced.'
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
      object gtQRShape48: TQRShape
        Left = 3
        Top = 522
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          1381.125000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape49: TQRShape
        Left = 219
        Top = 522
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          1381.125000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape50: TQRShape
        Left = 299
        Top = 522
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          1381.125000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo4: TQRMemo
        Left = 8
        Top = 531
        Width = 212
        Height = 46
        Size.Values = (
          121.708333333333300000
          21.166666666666670000
          1404.937500000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Did you take photographs of the site before starting work? If so' +
            ', pass to office as soon as you can.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape51: TQRShape
        Left = 237
        Top = 538
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          1423.458333333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape52: TQRShape
        Left = 275
        Top = 538
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          1423.458333333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel32: TQRLabel
        Left = 313
        Top = 523
        Width = 111
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          1383.770833333333000000
          293.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If NOT explain why not'
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
      object gtQRShape53: TQRShape
        Left = 3
        Top = 585
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          1547.812500000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape54: TQRShape
        Left = 219
        Top = 585
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          1547.812500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo5: TQRMemo
        Left = 8
        Top = 594
        Width = 212
        Height = 47
        Size.Values = (
          124.354166666666700000
          21.166666666666670000
          1571.625000000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Describe any damage to units or surrounding area before you star' +
            'ted fitting.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape55: TQRShape
        Left = 3
        Top = 648
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          1714.500000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape56: TQRShape
        Left = 219
        Top = 648
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          1714.500000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape57: TQRShape
        Left = 299
        Top = 648
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          1714.500000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo6: TQRMemo
        Left = 8
        Top = 657
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          1738.312500000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Before starting, did you check the units were level?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape58: TQRShape
        Left = 237
        Top = 664
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          1756.833333333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape59: TQRShape
        Left = 275
        Top = 664
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          1756.833333333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel33: TQRLabel
        Left = 313
        Top = 649
        Width = 341
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          1717.145833333333000000
          902.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'If NOT level, describe what you used to level the surface during' +
          ' fitting.'
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
      object gtQRShape60: TQRShape
        Left = 3
        Top = 774
        Width = 713
        Height = 64
        Size.Values = (
          169.333333333333300000
          7.937500000000000000
          2047.875000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape61: TQRShape
        Left = 219
        Top = 774
        Width = 7
        Height = 64
        Size.Values = (
          169.333333333333300000
          579.437500000000000000
          2047.875000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape62: TQRShape
        Left = 299
        Top = 774
        Width = 7
        Height = 64
        Size.Values = (
          169.333333333333300000
          791.104166666666700000
          2047.875000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo7: TQRMemo
        Left = 8
        Top = 783
        Width = 212
        Height = 35
        Size.Values = (
          92.604166666666670000
          21.166666666666670000
          2071.687500000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Did you check the fit of the hob, sink, taps etc (as relevant)?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape63: TQRShape
        Left = 237
        Top = 790
        Width = 20
        Height = 19
        Size.Values = (
          50.270833333333330000
          627.062500000000000000
          2090.208333333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape64: TQRShape
        Left = 275
        Top = 790
        Width = 20
        Height = 19
        Size.Values = (
          50.270833333333330000
          727.604166666666700000
          2090.208333333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel34: TQRLabel
        Left = 313
        Top = 775
        Width = 386
        Height = 16
        Size.Values = (
          42.333333333333330000
          828.145833333333300000
          2050.520833333333000000
          1021.291666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'If NOT explain why not. If the items were on site, check the fit' +
          ' before you leave.'
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
      object gtQRShape65: TQRShape
        Left = 3
        Top = 711
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          1881.187500000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape66: TQRShape
        Left = 219
        Top = 711
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          1881.187500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape67: TQRShape
        Left = 299
        Top = 711
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          1881.187500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo8: TQRMemo
        Left = 8
        Top = 720
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          1905.000000000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Were there ANY problems with fitting of the worktops/cladding pa' +
            'nels etc?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape68: TQRShape
        Left = 237
        Top = 727
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          1923.520833333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape69: TQRShape
        Left = 275
        Top = 727
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          1923.520833333333000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel35: TQRLabel
        Left = 313
        Top = 712
        Width = 126
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          1883.833333333333000000
          333.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If YES please give details.'
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
      object gtQRShape70: TQRShape
        Left = 3
        Top = 836
        Width = 713
        Height = 97
        Size.Values = (
          256.645833333333300000
          7.937500000000000000
          2211.916666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape71: TQRShape
        Left = 219
        Top = 836
        Width = 7
        Height = 97
        Size.Values = (
          256.645833333333300000
          579.437500000000000000
          2211.916666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape72: TQRShape
        Left = 299
        Top = 836
        Width = 7
        Height = 97
        Size.Values = (
          256.645833333333300000
          791.104166666666700000
          2211.916666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo9: TQRMemo
        Left = 8
        Top = 845
        Width = 212
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          2235.729166666667000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Did you check the following?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape73: TQRShape
        Left = 237
        Top = 863
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          2283.354166666667000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape74: TQRShape
        Left = 275
        Top = 863
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          2283.354166666667000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo10: TQRMemo
        Left = 124
        Top = 864
        Width = 88
        Height = 16
        Size.Values = (
          42.333333333333330000
          328.083333333333300000
          2286.000000000000000000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Upstands Flush')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRMemo11: TQRMemo
        Left = 10
        Top = 895
        Width = 203
        Height = 32
        Size.Values = (
          84.666666666666670000
          26.458333333333330000
          2368.020833333333000000
          537.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Overhang as per drawings/client request')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape75: TQRShape
        Left = 237
        Top = 897
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          2373.312500000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape76: TQRShape
        Left = 275
        Top = 897
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          2373.312500000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo12: TQRMemo
        Left = 8
        Top = 941
        Width = 212
        Height = 49
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          2489.729166666667000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Did you apply Silicon at all points where stone meets stone and ' +
            'around sink if fitted?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape77: TQRShape
        Left = 219
        Top = 932
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          2465.916666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel36: TQRLabel
        Left = 313
        Top = 933
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          2468.562500000000000000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Describe ANY issues'
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
      object gtQRShape78: TQRShape
        Left = 275
        Top = 948
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          2508.250000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape79: TQRShape
        Left = 237
        Top = 948
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          2508.250000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape80: TQRShape
        Left = 299
        Top = 932
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          2465.916666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRDBText13: TQRDBText
        Left = 676
        Top = 96
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          1788.583333333333000000
          254.000000000000000000
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
      object gtQRLabel27: TQRLabel
        Left = 665
        Top = 1013
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1759.479166666667000000
          2680.229166666667000000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page 1/2'
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
    object QRChildBand1: TQRChildBand
      Left = 38
      Top = 3703
      Width = 718
      Height = 1605
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        4246.562500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrchdFittingReport
      PrintOrder = cboAfterParent
      object gtQRShape118: TQRShape
        Left = 3
        Top = 492
        Width = 713
        Height = 133
        Size.Values = (
          351.895833333333300000
          7.937500000000000000
          1301.750000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape119: TQRShape
        Left = 3
        Top = 428
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          1132.416666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape120: TQRShape
        Left = 3
        Top = 364
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          963.083333333333300000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape121: TQRShape
        Left = 3
        Top = 300
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          793.750000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape122: TQRShape
        Left = 3
        Top = 236
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          624.416666666666700000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape123: TQRShape
        Left = 3
        Top = 172
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          455.083333333333300000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape124: TQRShape
        Left = 3
        Top = 108
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          285.750000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape125: TQRShape
        Left = 3
        Top = 44
        Width = 713
        Size.Values = (
          171.979166666666700000
          7.937500000000000000
          116.416666666666700000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape140: TQRShape
        Left = 3
        Top = 0
        Width = 713
        Height = 45
        Size.Values = (
          119.062500000000000000
          7.937500000000000000
          0.000000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo21: TQRMemo
        Left = 312
        Top = 5
        Width = 393
        Height = 36
        Size.Values = (
          95.250000000000000000
          825.500000000000000000
          13.229166666666670000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'Please provide as much detail as possible so we can ACCURATELY f' +
            'eed back to the client on why we haven'#39't finished etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape141: TQRShape
        Left = 299
        Top = 0
        Width = 7
        Height = 45
        Size.Values = (
          119.062500000000000000
          791.104166666666700000
          0.000000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel55: TQRLabel
        Left = 235
        Top = 19
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          621.770833333333300000
          50.270833333333330000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes'
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
      object gtQRLabel56: TQRLabel
        Left = 275
        Top = 19
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          727.604166666666700000
          50.270833333333330000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
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
      object gtQRShape142: TQRShape
        Left = 219
        Top = 0
        Width = 7
        Height = 45
        Size.Values = (
          119.062500000000000000
          579.437500000000000000
          0.000000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo32: TQRMemo
        Left = 8
        Top = 53
        Width = 212
        Height = 49
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          140.229166666666700000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Did you clean the work surfaces, thoroughly removing all dust, m' +
            'arks and smearing?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape181: TQRShape
        Left = 219
        Top = 44
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          116.416666666666700000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel63: TQRLabel
        Left = 313
        Top = 45
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          119.062500000000000000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If NOT, explain why not?'
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
      object gtQRShape182: TQRShape
        Left = 275
        Top = 60
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          158.750000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape183: TQRShape
        Left = 237
        Top = 60
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          158.750000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape184: TQRShape
        Left = 299
        Top = 44
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          116.416666666666700000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRMemo33: TQRMemo
        Left = 8
        Top = 117
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          309.562500000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Did you leave protection on surfaces when completed?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape185: TQRShape
        Left = 219
        Top = 108
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          285.750000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape186: TQRShape
        Left = 275
        Top = 124
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          328.083333333333300000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape187: TQRShape
        Left = 237
        Top = 124
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          328.083333333333300000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape188: TQRShape
        Left = 299
        Top = 108
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          285.750000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel64: TQRLabel
        Left = 313
        Top = 110
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          291.041666666666700000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If NOT, explain why not?'
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
      object gtQRMemo34: TQRMemo
        Left = 8
        Top = 181
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          478.895833333333300000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'In your opinion was the job 100% finished?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape189: TQRShape
        Left = 219
        Top = 172
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          455.083333333333300000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape190: TQRShape
        Left = 275
        Top = 188
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          497.416666666666700000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape191: TQRShape
        Left = 237
        Top = 188
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          497.416666666666700000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape192: TQRShape
        Left = 299
        Top = 172
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          455.083333333333300000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel65: TQRLabel
        Left = 313
        Top = 174
        Width = 259
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          460.375000000000000000
          685.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If NOT, explain what was NOT finished and why not?'
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
      object gtQRMemo35: TQRMemo
        Left = 8
        Top = 245
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          648.229166666666700000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Did you take photographs on site when fitting was completed?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape193: TQRShape
        Left = 219
        Top = 236
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          624.416666666666700000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape194: TQRShape
        Left = 275
        Top = 252
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          666.750000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape195: TQRShape
        Left = 237
        Top = 252
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          666.750000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape196: TQRShape
        Left = 299
        Top = 236
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          624.416666666666700000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel66: TQRLabel
        Left = 313
        Top = 238
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          629.708333333333300000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If NOT, explain why not?'
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
      object gtQRMemo36: TQRMemo
        Left = 8
        Top = 309
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          817.562500000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Was there ANY damage on site after installation?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape197: TQRShape
        Left = 219
        Top = 300
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          793.750000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape198: TQRShape
        Left = 275
        Top = 316
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          836.083333333333300000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape199: TQRShape
        Left = 237
        Top = 316
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          836.083333333333300000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape200: TQRShape
        Left = 299
        Top = 300
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          793.750000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel67: TQRLabel
        Left = 313
        Top = 302
        Width = 148
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          799.041666666666700000
          391.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If YES, give details of damage.'
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
      object gtQRMemo37: TQRMemo
        Left = 8
        Top = 373
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          986.895833333333300000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Did you leave any items on site?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape201: TQRShape
        Left = 219
        Top = 364
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          963.083333333333300000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape202: TQRShape
        Left = 275
        Top = 380
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          1005.416666666667000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape203: TQRShape
        Left = 237
        Top = 380
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          1005.416666666667000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape204: TQRShape
        Left = 299
        Top = 364
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          963.083333333333300000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel68: TQRLabel
        Left = 313
        Top = 366
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          968.375000000000000000
          312.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If YES, what AND why?'
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
      object gtQRMemo38: TQRMemo
        Left = 8
        Top = 437
        Width = 212
        Height = 36
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          1156.229166666667000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Is there any reason why we will need to return to this site?')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape205: TQRShape
        Left = 219
        Top = 428
        Width = 7
        Size.Values = (
          171.979166666666700000
          579.437500000000000000
          1132.416666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape206: TQRShape
        Left = 275
        Top = 444
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          727.604166666666700000
          1174.750000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape207: TQRShape
        Left = 237
        Top = 444
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          627.062500000000000000
          1174.750000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape208: TQRShape
        Left = 299
        Top = 428
        Width = 7
        Size.Values = (
          171.979166666666700000
          791.104166666666700000
          1132.416666666667000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel69: TQRLabel
        Left = 313
        Top = 430
        Width = 165
        Height = 17
        Size.Values = (
          44.979166666666670000
          828.145833333333300000
          1137.708333333333000000
          436.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'If YES explain why and what for?'
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
      object gtQRMemo39: TQRMemo
        Left = 8
        Top = 497
        Width = 145
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          1314.979166666667000000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Additional Comments:')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel37: TQRLabel
        Left = 665
        Top = 973
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1759.479166666667000000
          2574.395833333333000000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page 2/2'
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
      'select  Job.*,'
      '        Operator.Operator_Name,'
      '        (select Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order,'
      '         (select Sales_order.Order_Ref_No'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Ref_No'
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
      'Fax_Number,'
      'Email_Address,'
      'Web_Address'
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
end
