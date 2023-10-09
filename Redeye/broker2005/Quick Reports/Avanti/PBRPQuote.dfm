object frmPBRPQuote: TfrmPBRPQuote
  Left = 252
  Top = 48
  Caption = 'Quote Print'
  ClientHeight = 621
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 32
    Top = 32
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
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
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
      50.000000000000000000
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
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
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
    object qrbPageHeader: TQRBand
      Left = 19
      Top = 38
      Width = 756
      Height = 235
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        621.770833333333300000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblQuoteCaption: TQRLabel
        Left = 8
        Top = 0
        Width = 136
        Height = 38
        Size.Values = (
          100.541666666666700000
          21.166666666666670000
          0.000000000000000000
          359.833333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estimate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 24
      end
      object QRDBText2: TQRDBText
        Left = 719
        Top = 100
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          1902.354166666667000000
          264.583333333333400000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
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
      object QRLabel3: TQRLabel
        Left = 581
        Top = 100
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1537.229166666667000000
          264.583333333333400000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estimate No:'
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
      object QRDBText5: TQRDBText
        Left = 80
        Top = 155
        Width = 409
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          410.104166666666700000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
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
      object gtQRLabel1: TQRLabel
        Left = 8
        Top = 180
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          476.250000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
      object gtQRDBText2: TQRDBText
        Left = 80
        Top = 180
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          476.250000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
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
      object qrmAddress: TQRMemo
        Left = 80
        Top = 62
        Width = 262
        Height = 83
        Size.Values = (
          219.604166666666700000
          211.666666666666700000
          164.041666666666700000
          693.208333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblContactName: TQRLabel
        Left = 80
        Top = 46
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          121.708333333333400000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblContactName'
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
      object QRDBText3: TQRDBText
        Left = 642
        Top = 139
        Width = 107
        Height = 15
        Size.Values = (
          39.687500000000000000
          1698.625000000000000000
          367.770833333333400000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Office_Contact_Name'
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
      object gtQRLabel3: TQRLabel
        Left = 8
        Top = 216
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          571.500000000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
      object gtQRLabel4: TQRLabel
        Left = 520
        Top = 216
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          571.500000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
      object gtQRLabel6: TQRLabel
        Left = 592
        Top = 216
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          571.500000000000000000
          121.708333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
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
      object gtQRLabel7: TQRLabel
        Left = 688
        Top = 216
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1820.333333333333000000
          571.500000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Price'
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
      object gtQRLabel2: TQRLabel
        Left = 615
        Top = 119
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          1627.187500000000000000
          314.854166666666700000
          68.791666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
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
      object gtQRDBText7: TQRDBText
        Left = 697
        Top = 119
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1844.145833333333000000
          314.854166666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
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
      object QRLabel4: TQRLabel
        Left = 567
        Top = 139
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1500.187500000000000000
          367.770833333333400000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Office Contact:'
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
      object gtQRLabel5: TQRLabel
        Left = 8
        Top = 155
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          410.104166666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
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
      object gtQRLabel8: TQRLabel
        Left = 8
        Top = 44
        Width = 13
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          116.416666666666700000
          34.395833333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To'
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
    object qrgQuote: TQRGroup
      Left = 19
      Top = 273
      Width = 756
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Quote'
      FooterBand = qrgfQuote
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbLineDetail: TQRSubDetail
      Left = 19
      Top = 302
      Width = 756
      Height = 20
      AlignToBottom = False
      BeforePrint = qrbLineDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportlines
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText3: TQRDBText
        Left = 498
        Top = 2
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1317.625000000000000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Quantity'
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
      object gtQRDBText4: TQRDBText
        Left = 576
        Top = 2
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1524.000000000000000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'unit_price'
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
      object gtQRDBText1: TQRDBText
        Left = 8
        Top = 2
        Width = 465
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          1230.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Quote_Line_Description'
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
      object gtlblTotalPrice: TQRLabel
        Left = 671
        Top = 2
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1775.354166666667000000
          5.291666666666667000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalPrice'
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
    object qrbPageFooter: TQRBand
      Left = 19
      Top = 374
      Width = 756
      Height = 56
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = qrbPageFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object gtQRLabel10: TQRLabel
        Left = 577
        Top = 5
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          1526.645833333333000000
          13.229166666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Sales'
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
      object gtlblTotalSales: TQRLabel
        Left = 656
        Top = 5
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          1735.666666666667000000
          13.229166666666670000
          216.958333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalSales'
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
      object gtlblUnitPrice: TQRLabel
        Left = 664
        Top = 28
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          74.083333333333340000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblUnitPrice'
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
      object gtlblPriceUnit: TQRLabel
        Left = 564
        Top = 28
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1492.250000000000000000
          74.083333333333340000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qtlblUnitPrice'
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
    object qrgfQuote: TQRBand
      Left = 19
      Top = 371
      Width = 756
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgfQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object qrbSupplyLines: TQRSubDetail
      Left = 19
      Top = 351
      Width = 756
      Height = 20
      AlignToBottom = False
      BeforePrint = qrbSupplyLinesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportSupply
      HeaderBand = qrbSupplyHeader
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText6: TQRDBText
        Left = 8
        Top = 2
        Width = 465
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          1230.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Form_Description'
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
      object gtQRDBText9: TQRDBText
        Left = 498
        Top = 2
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1317.625000000000000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Quantity'
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
      object gtQRDBText10: TQRDBText
        Left = 576
        Top = 2
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1524.000000000000000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Quotation_price'
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
      object gtlblSupplyPrice: TQRLabel
        Left = 661
        Top = 2
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          1748.895833333334000000
          5.291666666666667000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblSupplyPrice'
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
    object qrbSupplyHeader: TQRBand
      Left = 19
      Top = 322
      Width = 756
      Height = 29
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRLabel9: TQRLabel
        Left = 8
        Top = 8
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To Supply'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbLineHeader: TQRGroup
      Left = 19
      Top = 275
      Width = 756
      Height = 27
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Product_Type_Description'
      Master = qrbLineDetail
      ReprintOnNewPage = False
      object gtQRDBText5: TQRDBText
        Left = 8
        Top = 8
        Width = 425
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          21.166666666666670000
          1124.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Product_Type_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
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
    object ReportImage: TQRImage
      Left = 434
      Top = 39
      Width = 343
      Height = 82
      Size.Values = (
        216.958333333333400000
        1148.291666666667000000
        103.187500000000000000
        907.520833333333400000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
    object qrbOvers: TQRChildBand
      Left = 19
      Top = 430
      Width = 756
      Height = 180
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        476.250000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbPageFooter
      PrintOrder = cboAfterParent
      object gtQRLabel13: TQRLabel
        Left = 8
        Top = 8
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          97.895833333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Overs:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel14: TQRLabel
        Left = 8
        Top = 24
        Width = 484
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          63.500000000000000000
          1280.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Please confirm how you would like us to deal with any print over' +
          's by ticking the relevant box below:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel15: TQRLabel
        Left = 8
        Top = 48
        Width = 325
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          127.000000000000000000
          859.895833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DELIVER ALL/PART OVERS BACK TO THE CLIENT @ '#163'60 per pallet'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel16: TQRLabel
        Left = 8
        Top = 72
        Width = 370
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          190.500000000000000000
          978.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RETURN ALL/PART OVERS BACK TO FMM STOCK @ '#163'5 per pallet per week'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel17: TQRLabel
        Left = 8
        Top = 96
        Width = 224
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          254.000000000000000000
          592.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESTROY ALL/PART OVERS @ '#163'20 per pallet'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel18: TQRLabel
        Left = 8
        Top = 120
        Width = 524
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          317.500000000000000000
          1386.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Should you wish to proceed to the order stage then please sign, ' +
          'date & confirm your PO No & send/fax back'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRShape1: TQRShape
        Left = 464
        Top = 43
        Height = 24
        Size.Values = (
          63.500000000000000000
          1227.666666666667000000
          113.770833333333300000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape2: TQRShape
        Left = 464
        Top = 66
        Height = 24
        Size.Values = (
          63.500000000000000000
          1227.666666666667000000
          174.625000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 464
        Top = 89
        Height = 24
        Size.Values = (
          63.500000000000000000
          1227.666666666667000000
          235.479166666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel19: TQRLabel
        Left = 8
        Top = 160
        Width = 323
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          423.333333333333300000
          854.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Signature:  ....................................................' +
          '.....................................'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel20: TQRLabel
        Left = 384
        Top = 160
        Width = 143
        Height = 17
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          423.333333333333300000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:  .....................................'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel21: TQRLabel
        Left = 592
        Top = 160
        Width = 151
        Height = 17
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          423.333333333333300000
          399.520833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PO No:  .....................................'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    object qrbPostage: TQRChildBand
      Left = 19
      Top = 610
      Width = 756
      Height = 215
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        568.854166666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbOvers
      PrintOrder = cboAfterParent
      object gtQRLabel32: TQRLabel
        Left = 8
        Top = 112
        Width = 663
        Height = 28
        Size.Values = (
          74.083333333333340000
          21.166666666666670000
          296.333333333333400000
          1754.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          '                                        to sight of materials su' +
          'pplied, machine suitability, machine space/timings and our machi' +
          'ne specifications which requires a minimum of 15mm clearance whe' +
          're applicable.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel31: TQRLabel
        Left = 8
        Top = 80
        Width = 663
        Height = 28
        Size.Values = (
          74.083333333333340000
          21.166666666666670000
          211.666666666666700000
          1754.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          '                       not despatched on the clients own postage' +
          ' docket i.e. going on Formpromm'#39's postage docket WILL NOT be des' +
          'patched until cleared postage funds are in Formpromm'#39's postage a' +
          'ccount & will incure a 3% handling surcharge.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel25: TQRLabel
        Left = 8
        Top = 62
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          164.041666666666700000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Variable data'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel22: TQRLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Postage:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel23: TQRLabel
        Left = 8
        Top = 24
        Width = 605
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          63.500000000000000000
          1600.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'For a real alternative to Royal Mail please email: postalservice' +
          's@formpromm.co.uk for a free Down Stream Access data audit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel24: TQRLabel
        Left = 8
        Top = 43
        Width = 363
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          113.770833333333300000
          960.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PLEASE READ THE FOLLOWING IMPORTANT NOTES & CONDITIONS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel26: TQRLabel
        Left = 8
        Top = 80
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          211.666666666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All mailings'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel27: TQRLabel
        Left = 8
        Top = 112
        Width = 118
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          296.333333333333400000
          312.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All prices are subject'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel28: TQRLabel
        Left = 8
        Top = 144
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          381.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All deliveries'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel29: TQRLabel
        Left = 8
        Top = 163
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          431.270833333333400000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All prices are'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel30: TQRLabel
        Left = 8
        Top = 189
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          500.062500000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our TERMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel12: TQRLabel
        Left = 84
        Top = 62
        Width = 523
        Height = 15
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          164.041666666666700000
          1383.770833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'is required as ASCII comma or piped delimited format or fixed fi' +
          'eld and can be received via Email, CD or SFPT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel33: TQRLabel
        Left = 77
        Top = 144
        Width = 341
        Height = 15
        Size.Values = (
          39.687500000000000000
          203.729166666666700000
          381.000000000000000000
          902.229166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          ', collections and additional storage requirements are charged as' +
          ' extra.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel34: TQRLabel
        Left = 82
        Top = 163
        Width = 212
        Height = 15
        Size.Values = (
          39.687500000000000000
          216.958333333333400000
          431.270833333333400000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'exclusive of VAT and are valid for 30 days.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object gtQRLabel35: TQRLabel
        Left = 72
        Top = 189
        Width = 348
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          500.062500000000000000
          920.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'of payment are STRICTLY 30 days unless otherwise previously agre' +
          'ed.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    ConnectionName = 'pb'
    SQL.Strings = (
      'select  Quote.*,'
      '        Operator.Name as Office_Contact_Name,'
      '        Price_Unit.Price_unit_Factor,'
      '        Price_unit.Description as Price_unit_Description'
      'from Quote, Operator, Price_Unit'
      'where Quote.Quote = :Quote and'
      'Quote.Price_Unit = Price_unit.Price_unit and'
      'Quote.Office_Contact = Operator.Operator')
    Left = 371
    Top = 46
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer')
    Left = 464
    Top = 48
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object dtsAddress: TDataSource
    Left = 432
    Top = 48
  end
  object qryContact: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer_Contact.Name as Contact_Name,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Contact.Mobile_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Phone as Branch_Phone,'
      '        Customer_Branch.Fax_Number as Branch_Fax_number'
      'from Customer_Contact, Customer_Branch'
      'where Customer_Contact.Customer = :Customer and'
      '      Customer_Contact.Branch_no = :Branch_no and'
      '      Customer_Contact.Contact_no = :Contact_no and'
      '      ('
      '      (Customer_Contact.Customer = Customer_Branch.Customer) and'
      '      (Customer_Contact.Branch_no = Customer_Branch.Branch_no)'
      '      )')
    Left = 72
    Top = 48
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end>
  end
  object qryReportlines: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'SELECT Quote_Line.*, Price_Unit.Price_Unit_factor, Product_Type.' +
        'Description as Product_Type_Description'
      'FROM Quote_Line, Price_Unit, Product_Type'
      'WHERE Quote = :Quote and'
      '(Quote_Line.Price_Unit = Price_Unit.Price_Unit) and'
      '(Quote_Line.Product_Type = Product_Type.Product_Type)'
      'ORDER BY Quote_Line.Sequence_no'
      '')
    Left = 368
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 290
    Top = 46
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Narrative_line'
      'where narrative = :Narrative'
      'order by narrative, narrative_line')
    Left = 174
    Top = 45
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 560
    Top = 125
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object qryReportSupply: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '    Quote_Supply.Quote,'
      '    Quote_Supply.Quote_Supply_no,'
      '    Quote_Supply.Enquiry,'
      '    Quote_Supply.Line,'
      '    Quote_Supply.Line_Converted,'
      '    Quote_Supply.Quantity,'
      '    EnquiryLine.Form_Description,'
      '    EnquiryLine.Product_Type,'
      '    Enquiry_LineQuantity.Price_Unit,'
      '    Enquiry_LineQuantity.Supplier_Price,'
      '    Enquiry_LineQuantity.Quotation_Price,'
      '    Price_Unit.Price_Unit_Factor,'
      '    Price_Unit.Description as Price_Unit_Description,'
      '    Product_Type.Description as Product_Type_Description'
      
        'from Quote_Supply, EnquiryLine, Enquiry_LineQuantity, Price_Unit' +
        ', Product_type'
      'where Quote = :Quote and'
      '      ('
      '      (Quote_Supply.Enquiry = EnquiryLine.Enquiry) and'
      '      (Quote_Supply.Line = EnquiryLine.Line)'
      '      ) and'
      '      ('
      '      (Quote_Supply.Enquiry = Enquiry_LineQuantity.Enquiry) and'
      '      (Quote_Supply.Line = Enquiry_LineQuantity.Line) and'
      '      (Quote_Supply.Quantity = Enquiry_LineQuantity.Quantity)'
      '      ) and'
      
        '      (Enquiry_LineQuantity.Price_Unit = Price_unit.Price_Unit) ' +
        'and'
      '      (EnquiryLine.Product_Type = Product_Type.Product_Type)'
      'order by Quote_Supply.Quote_Supply_No')
    Left = 499
    Top = 190
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryProspect: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select'
      'Ad_Hoc_Address.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode'
      'from'
      '  Ad_Hoc_Address'
      'where'
      '  Ad_Hoc_Address.Ad_hoc_Address = :Ad_hoc_Address')
    Left = 560
    Top = 48
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
      end>
  end
end
