object frmwtRPQuoteSalesLead: TfrmwtRPQuoteSalesLead
  Left = 49
  Top = 110
  Caption = 'Quote Sales Lead Source Report'
  ClientHeight = 579
  ClientWidth = 1157
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryQuotes
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
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
    ReportTitle = 'Quotation Report'
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
    object QRBand1: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 94
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        198.966666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 499
        Top = 10
        Width = 294
        Height = 24
        Size.Values = (
          50.800000000000000000
          1056.216666666667000000
          21.166666666666670000
          622.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Quote Sales Lead Source Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 10
        Top = 71
        Width = 36
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          150.283333333333300000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote'
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
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 60
        Top = 71
        Width = 28
        Height = 21
        Size.Values = (
          44.450000000000000000
          127.000000000000000000
          150.283333333333300000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 140
        Top = 71
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          296.333333333333300000
          150.283333333333300000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 470
        Top = 71
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          994.833333333333300000
          150.283333333333300000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
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
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 657
        Top = 71
        Width = 56
        Height = 21
        Size.Values = (
          44.450000000000000000
          1390.650000000000000000
          150.283333333333300000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Complete'
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
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 736
        Top = 71
        Width = 35
        Height = 21
        Size.Values = (
          44.450000000000000000
          1557.866666666667000000
          150.283333333333300000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Install'
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
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 800
        Top = 71
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          1693.333333333333000000
          150.283333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Survey'
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
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 1080
        Top = 71
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          2286.000000000000000000
          150.283333333333300000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
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
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 870
        Top = 71
        Width = 46
        Height = 21
        Size.Values = (
          44.450000000000000000
          1841.500000000000000000
          150.283333333333300000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery'
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
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 1030
        Top = 71
        Width = 29
        Height = 21
        Size.Values = (
          44.450000000000000000
          2180.166666666667000000
          150.283333333333300000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
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
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 960
        Top = 71
        Width = 26
        Height = 21
        Size.Values = (
          44.450000000000000000
          2032.000000000000000000
          150.283333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
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
        FontSize = 8
      end
      object qrlblDateRange: TQRLabel
        Left = 596
        Top = 40
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          1261.533333333333000000
          84.666666666666670000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
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
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 1228
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2599.266666666667000000
          21.166666666666670000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 1212
        Top = 30
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2565.400000000000000000
          63.500000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel1: TQRLabel
        Left = 1250
        Top = 71
        Width = 56
        Height = 21
        Size.Values = (
          44.450000000000000000
          2645.833333333333000000
          150.283333333333300000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Requotes'
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
        FontSize = 8
      end
    end
    object qrgCustomerHead: TQRGroup
      Left = 47
      Top = 141
      Width = 1309
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Sales_Lead_Source_Descr'
      FooterBand = qrbCustomerFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 0
        Top = 10
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          21.166666666666670000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lead Source:'
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
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 100
        Top = 10
        Width = 158
        Height = 21
        Size.Values = (
          44.450000000000000000
          211.666666666666700000
          21.166666666666670000
          334.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Sales_Lead_Source_Descr'
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
        FontSize = 8
      end
    end
    object qrsbDetails: TQRSubDetail
      Left = 47
      Top = 173
      Width = 1309
      Height = 32
      AfterPrint = qrsbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrsbDetailsBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText11: TQRDBText
        Left = 839
        Top = 0
        Width = 83
        Height = 19
        Size.Values = (
          40.216666666666670000
          1775.883333333333000000
          0.000000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Delivery_Price'
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
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 12
        Top = 1
        Width = 36
        Height = 19
        Size.Values = (
          40.216666666666670000
          25.400000000000000000
          2.116666666666667000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Quote'
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
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 60
        Top = 1
        Width = 75
        Height = 19
        Size.Values = (
          40.216666666666670000
          127.000000000000000000
          2.116666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Date_Raised'
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
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 470
        Top = 1
        Width = 181
        Height = 19
        Size.Values = (
          39.687500000000000000
          994.833333333333400000
          2.645833333333333000
          383.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Reference'
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
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 140
        Top = 21
        Width = 321
        Height = 19
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          44.979166666666670000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryQuotes
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
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 770
        Top = 0
        Width = 75
        Height = 19
        Size.Values = (
          40.216666666666670000
          1629.833333333333000000
          0.000000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Survey_price'
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
        FontSize = 8
      end
      object qrlTotal: TQRLabel
        Left = 1012
        Top = 0
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          2142.066666666667000000
          0.000000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 673
        Top = 0
        Width = 98
        Height = 19
        Size.Values = (
          40.216666666666670000
          1424.516666666667000000
          0.000000000000000000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Installation_price'
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
        FontSize = 8
      end
      object qrlComplete: TQRLabel
        Left = 642
        Top = 0
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          1358.900000000000000000
          0.000000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlComplete'
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
        FontSize = 8
      end
      object qrlVat: TQRLabel
        Left = 954
        Top = 0
        Width = 35
        Height = 19
        Size.Values = (
          40.216666666666670000
          2019.300000000000000000
          0.000000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlVat'
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
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 140
        Top = 1
        Width = 321
        Height = 19
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          2.645833333333333000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryQuotes
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
        FontSize = 8
      end
      object qrlblRequote: TQRLabel
        Left = 1265
        Top = 0
        Width = 73
        Height = 19
        Size.Values = (
          40.216666666666670000
          2677.583333333333000000
          0.000000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblRequote'
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
        FontSize = 8
      end
      object qrlblStatus: TQRLabel
        Left = 1085
        Top = 0
        Width = 156
        Height = 19
        Size.Values = (
          39.687500000000000000
          2296.583333333333000000
          0.000000000000000000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblStatus'
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
        FontSize = 8
      end
    end
    object qrbCustomerFooter: TQRBand
      Left = 47
      Top = 205
      Width = 1309
      Height = 36
      AfterPrint = qrbCustomerFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbCustomerFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel13: TQRLabel
        Left = 815
        Top = 9
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          1725.083333333333000000
          19.050000000000000000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCustTotal: TQRLabel
        Left = 973
        Top = 9
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          2059.516666666667000000
          19.050000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 860
        Top = -1
        Width = 201
        Height = 10
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 1083
        Top = 9
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          2292.350000000000000000
          19.050000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote Count'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCount: TQRLabel
        Left = 1165
        Top = 9
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          2465.916666666667000000
          19.050000000000000000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 635
        Top = 9
        Width = 169
        Height = 21
        Size.Values = (
          44.450000000000000000
          1344.083333333333000000
          19.050000000000000000
          357.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Sales_Lead_Source_Descr'
        Font.Charset = DEFAULT_CHARSET
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
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 241
      Width = 1309
      Height = 32
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 863
        Top = 9
        Width = 79
        Height = 21
        Size.Values = (
          44.450000000000000000
          1826.683333333333000000
          19.050000000000000000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblReportTotal: TQRLabel
        Left = 958
        Top = 9
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          2027.766666666667000000
          19.050000000000000000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 860
        Top = -1
        Width = 201
        Height = 10
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryQuotes: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'select Quote.*,'
      '  Customer.Customer_Name as Customer_Name_Actual,'
      '  Customer.telephone_number,'
      '  Customer.Email_Address,'
      '  Quote_Status_Description,'
      '  Vat_Rate,'
      '  Sales_Lead_Source.Sales_Lead_Source_Descr,'
      '  Customer.Is_Retail_Customer,'
      '  Customer.Is_Commercial_Customer,'
      '  (SELECT Count(ReQuote.Quote)'
      '   FROM Quote ReQuote'
      '   WHERE (ReQuote.Original_Quote = Quote.Original_Quote) and'
      '         (ReQuote.Quote <> ReQuote.Original_Quote) and'
      
        '         ((ReQuote.Original_Quote <> 0) and (ReQuote.Original_Qu' +
        'ote <> NULL))) as Requote_Count'
      'FROM Sales_Lead_Source'
      '      RIGHT JOIN (Vat'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Customer'
      '      INNER JOIN Quote ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '        Vat.Vat = Quote.Vat) ON'
      
        '        Sales_Lead_Source.Sales_Lead_Source = Quote.Sales_Lead_S' +
        'ource'
      'WHERE'
      '(Quote.inactive = '#39'N'#39') AND'
      
        '((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote = '#39'N'#39'))' +
        ' AND'
      '((Quote.Customer = :Customer) or (0 = :Customer)) and'
      '((Quote.Sales_Lead_Source = :Code) or (0 = :Code)) and'
      
        '((Quote.Date_Raised >= :Date_From) and (Quote.Date_Raised <= :Da' +
        'te_To)) AND'
      
        '(((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (Custo' +
        'mer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:Is_R' +
        'etail_Customer = '#39'A'#39'))'
      
        'ORDER BY Sales_Lead_Source_Descr, Quote.Quote_Number, Quote.Quot' +
        'e')
    Left = 208
    Top = 184
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
    object qryQuotesQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryQuotesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryQuotesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryQuotesCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryQuotesDescription: TWideStringField
      FieldName = 'Description'
      Size = 255
    end
    object qryQuotesOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryQuotesInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = '0.00'
    end
    object qryQuotesDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = '0.00'
    end
    object qryQuotesSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = '0.00'
    end
    object qryQuotesExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
    end
    object qryQuotesAvailability: TIntegerField
      FieldName = 'Availability'
    end
    object qryQuotesPayment_terms: TIntegerField
      FieldName = 'Payment_terms'
    end
    object qryQuotesReference: TWideStringField
      FieldName = 'Reference'
      Size = 30
    end
    object qryQuotesQuote_Status: TIntegerField
      FieldName = 'Quote_Status'
    end
    object qryQuotesNett_Price: TFloatField
      FieldName = 'Nett_Price'
      DisplayFormat = '0.00'
    end
    object qryQuotesInactive: TWideStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryQuotesInactive_reason: TIntegerField
      FieldName = 'Inactive_reason'
    end
    object qryQuotesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object qryQuotesAddress: TIntegerField
      FieldName = 'Address'
    end
    object qryQuotesContact_Name: TWideStringField
      FieldName = 'Contact_Name'
      Size = 50
    end
    object qryQuotesVat: TIntegerField
      FieldName = 'Vat'
    end
    object qryQuotesDiscount_Rate: TFloatField
      FieldName = 'Discount_Rate'
    end
    object qryQuotesDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      DisplayFormat = '0.00'
    end
    object qryQuotesCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryQuotesTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
    end
    object qryQuotesTemplate_Date_Actual: TDateTimeField
      FieldName = 'Template_Date_Actual'
    end
    object qryQuotesDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
    end
    object qryQuotesDeposit_Amount: TFloatField
      FieldName = 'Deposit_Amount'
      DisplayFormat = '0.00'
    end
    object qryQuotesInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qryQuotesDate_Accepted: TDateTimeField
      FieldName = 'Date_Accepted'
    end
    object qryQuotesCustomer_Name_Actual: TWideStringField
      FieldName = 'Customer_Name_Actual'
      Size = 50
    end
    object qryQuotesQuote_Status_Description: TWideStringField
      FieldName = 'Quote_Status_Description'
      Size = 50
    end
    object qryQuotesVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryQuotestelephone_number: TWideStringField
      FieldName = 'telephone_number'
      Size = 30
    end
    object qryQuotesSales_Lead_Source_Descr: TWideStringField
      FieldName = 'Sales_Lead_Source_Descr'
      Size = 100
    end
    object qryQuotesMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
    object qryQuotesQuote_Number: TFloatField
      FieldName = 'Quote_Number'
    end
    object qryQuotesOriginal_Quote: TIntegerField
      FieldName = 'Original_Quote'
    end
    object qryQuotesRequote_Count: TIntegerField
      FieldName = 'Requote_Count'
    end
    object qryQuotesWaste_Value: TFloatField
      FieldName = 'Waste_Value'
    end
    object qryQuotesIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object qryQuotesIs_Commercial_Customer: TWideStringField
      FieldName = 'Is_Commercial_Customer'
      Size = 1
    end
  end
  object qryReQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'SELECT Sum(Quote.Nett_Price - Quote.Discount_Value + Quote.Marku' +
        'p_Value + Quote.Waste_Value) as Total_Complete,'
      '        Sum(Installation_Price) as Total_Install,'
      '        Sum(Survey_Price) as Total_Survey,'
      '        Sum(Delivery_Price) as Total_Delivery,'
      '        max(Quote_Status) as Requote_Status'
      'FROM Quote'
      
        'WHERE ((Quote.Original_Quote = :Original_Quote) or (Quote.Quote ' +
        '= :Original_Quote)) and'
      '      (Quote.Quote <> :Quote)')
    Left = 326
    Top = 180
    ParamData = <
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'Quote'
      end>
  end
end
