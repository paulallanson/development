object frmwtRPSalesbyInvoice: TfrmwtRPSalesbyInvoice
  Left = 43
  Top = 110
  Caption = 'Sales by Invoice Report'
  ClientHeight = 576
  ClientWidth = 1334
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
    ReportTitle = 'Sales Order Scheduling  Report'
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
    object qrbGroupHeader: TQRGroup
      Left = 47
      Top = 151
      Width = 1309
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = qrbGroupFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object qrlblSortBy: TQRLabel
        Left = 0
        Top = 10
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          21.166666666666670000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object qrGroupbyText: TQRDBText
        Left = 120
        Top = 10
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          254.000000000000000000
          21.166666666666670000
          207.433333333333300000)
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
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 104
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        220.133333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 541
        Top = 10
        Width = 210
        Height = 24
        Size.Values = (
          50.800000000000000000
          1145.116666666667000000
          21.166666666666670000
          444.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales by Invoice Report'
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
      object QRSysData1: TQRSysData
        Left = 1222
        Top = 29
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2586.566666666667000000
          61.383333333333330000
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
      object QRLabel3: TQRLabel
        Left = 10
        Top = 81
        Width = 64
        Height = 17
        Size.Values = (
          35.983333333333330000
          21.166666666666670000
          171.450000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice No.'
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
        Left = 164
        Top = 81
        Width = 126
        Height = 17
        Size.Values = (
          35.983333333333330000
          347.133333333333300000
          171.450000000000000000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/Description'
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
        Left = 80
        Top = 81
        Width = 28
        Height = 17
        Size.Values = (
          35.983333333333330000
          169.333333333333300000
          171.450000000000000000
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
        Left = 1240
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2624.666666666667000000
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
      object QRLabel1: TQRLabel
        Left = 385
        Top = 81
        Width = 83
        Height = 17
        Size.Values = (
          35.983333333333330000
          814.916666666666700000
          171.450000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Code'
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
      object QRLabel2: TQRLabel
        Left = 826
        Top = 81
        Width = 57
        Height = 17
        Size.Values = (
          35.983333333333330000
          1748.366666666667000000
          171.450000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sell Price'
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
        Left = 940
        Top = 81
        Width = 26
        Height = 17
        Size.Values = (
          35.983333333333330000
          1989.666666666667000000
          171.450000000000000000
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
      object QRLabel7: TQRLabel
        Left = 1030
        Top = 81
        Width = 29
        Height = 17
        Size.Values = (
          35.983333333333330000
          2180.166666666667000000
          171.450000000000000000
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
      object QRLabel9: TQRLabel
        Left = 480
        Top = 81
        Width = 70
        Height = 17
        Size.Values = (
          35.983333333333330000
          1016.000000000000000000
          171.450000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order'
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
      object gtQRLabel1: TQRLabel
        Left = 1116
        Top = 81
        Width = 28
        Height = 21
        Size.Values = (
          44.450000000000000000
          2362.200000000000000000
          171.450000000000000000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost'
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
      object gtQRLabel2: TQRLabel
        Left = 1196
        Top = 81
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2531.533333333333000000
          171.450000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
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
      object gtQRLabel4: TQRLabel
        Left = 655
        Top = 81
        Width = 24
        Height = 17
        Size.Values = (
          35.983333333333330000
          1386.416666666667000000
          171.450000000000000000
          50.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
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
      object gtQRLabel3: TQRLabel
        Left = 1262
        Top = 81
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          2671.233333333333000000
          171.450000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Cost %'
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
        Left = 561
        Top = 81
        Width = 68
        Height = 17
        Size.Values = (
          35.983333333333330000
          1187.450000000000000000
          171.450000000000000000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date'
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
    object qrsbDetails: TQRSubDetail
      Left = 47
      Top = 183
      Width = 1309
      Height = 50
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
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblCostPerc: TQRLabel
        Left = 1227
        Top = 5
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          2597.150000000000000000
          10.583333333333330000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCostPerc'
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
      object QRDBText2: TQRDBText
        Left = 10
        Top = 5
        Width = 61
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          10.583333333333330000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Invoice_no'
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
        Left = 80
        Top = 5
        Width = 74
        Height = 19
        Size.Values = (
          40.216666666666670000
          169.333333333333300000
          10.583333333333330000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Invoice_Date'
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
        Left = 164
        Top = 5
        Width = 211
        Height = 19
        Size.Values = (
          40.216666666666670000
          347.133333333333300000
          10.583333333333330000
          446.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        FontSize = 8
      end
      object qrdbDescription: TQRDBText
        Left = 164
        Top = 25
        Width = 421
        Height = 19
        Size.Values = (
          40.216666666666670000
          347.133333333333300000
          52.916666666666670000
          891.116666666666700000)
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
      object QRDBText1: TQRDBText
        Left = 385
        Top = 5
        Width = 86
        Height = 19
        Size.Values = (
          40.216666666666670000
          814.916666666666700000
          10.583333333333330000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Code'
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
        Left = 480
        Top = 5
        Width = 59
        Height = 19
        Size.Values = (
          40.216666666666670000
          1016.000000000000000000
          10.583333333333330000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
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
      object QRDBText4: TQRDBText
        Left = 805
        Top = 5
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          1703.916666666667000000
          10.583333333333330000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Value'
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
      object QRDBText7: TQRDBText
        Left = 908
        Top = 5
        Width = 66
        Height = 19
        Size.Values = (
          40.216666666666670000
          1921.933333333333000000
          10.583333333333330000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'VAT_Value'
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
      object QRDBText8: TQRDBText
        Left = 994
        Top = 5
        Width = 69
        Height = 19
        Size.Values = (
          40.216666666666670000
          2103.966666666667000000
          10.583333333333330000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Total_Value'
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
      object qrlblCost: TQRLabel
        Left = 1094
        Top = 5
        Width = 52
        Height = 19
        Size.Values = (
          40.216666666666670000
          2315.633333333333000000
          10.583333333333330000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCost'
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
      object qrlblMargin: TQRLabel
        Left = 1173
        Top = 5
        Width = 64
        Height = 19
        Size.Values = (
          40.216666666666670000
          2482.850000000000000000
          10.583333333333330000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblMargin'
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
      object gtQRDBText1: TQRDBText
        Left = 655
        Top = 5
        Width = 140
        Height = 19
        Size.Values = (
          40.216666666666670000
          1386.416666666667000000
          10.583333333333330000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Rep_Name'
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
      object qrlblFitDate: TQRLabel
        Left = 561
        Top = 5
        Width = 67
        Height = 19
        Size.Values = (
          40.216666666666670000
          1187.450000000000000000
          10.583333333333330000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblFitDate'
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
    object qrbGroupFooter: TQRBand
      Left = 47
      Top = 233
      Width = 1309
      Height = 32
      AfterPrint = qrbGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblCustCostPerc: TQRLabel
        Left = 1194
        Top = 9
        Width = 113
        Height = 21
        Size.Values = (
          44.450000000000000000
          2527.300000000000000000
          19.050000000000000000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustCostPerc'
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
      object qrlblCustMargin: TQRLabel
        Left = 1137
        Top = 9
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2406.650000000000000000
          19.050000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustMargin'
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
      object qrlblCustCost: TQRLabel
        Left = 1063
        Top = 9
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2250.016666666667000000
          19.050000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustCost'
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
      object qrGroupbyFooter: TQRDBText
        Left = 608
        Top = 9
        Width = 105
        Height = 21
        Size.Values = (
          44.450000000000000000
          1286.933333333333000000
          19.050000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
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
      object QRLabel13: TQRLabel
        Left = 725
        Top = 9
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          1534.583333333333000000
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
      object QRShape1: TQRShape
        Left = 860
        Top = -1
        Width = 441
        Height = 10
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          933.979166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblCustTotal: TQRLabel
        Left = 976
        Top = 9
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          2065.866666666667000000
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
      object qrlblCustVat: TQRLabel
        Left = 897
        Top = 9
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1898.650000000000000000
          19.050000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustVat'
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
      object qrlblCustSell: TQRLabel
        Left = 803
        Top = 9
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          1699.683333333333000000
          19.050000000000000000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustSell'
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
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 265
      Width = 1309
      Height = 32
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
      object qrlblReportCostPerc: TQRLabel
        Left = 1178
        Top = 9
        Width = 128
        Height = 21
        Size.Values = (
          44.450000000000000000
          2493.433333333333000000
          19.050000000000000000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportCostPerc'
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
      object QRLabel10: TQRLabel
        Left = 674
        Top = 9
        Width = 79
        Height = 21
        Size.Values = (
          44.450000000000000000
          1426.633333333333000000
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
        Left = 962
        Top = 9
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          2036.233333333333000000
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
        Width = 441
        Height = 10
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          933.979166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblReportVat: TQRLabel
        Left = 882
        Top = 9
        Width = 93
        Height = 21
        Size.Values = (
          44.450000000000000000
          1866.900000000000000000
          19.050000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportVat'
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
      object qrlblReportSell: TQRLabel
        Left = 788
        Top = 9
        Width = 97
        Height = 21
        Size.Values = (
          44.450000000000000000
          1667.933333333333000000
          19.050000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportSell'
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
      object qrlblReportCost: TQRLabel
        Left = 1050
        Top = 9
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          2222.500000000000000000
          19.050000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportCost'
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
      object qrlblReportMargin: TQRLabel
        Left = 1123
        Top = 9
        Width = 116
        Height = 21
        Size.Values = (
          44.450000000000000000
          2377.016666666667000000
          19.050000000000000000
          245.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportMargin'
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
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_invoice.Sales_invoice,'
      '        Sales_invoice.Inactive,'
      '        Sales_invoice.Customer,'
      '        Sales_invoice.Account_code,'
      '        Sales_invoice.Invoice_no,'
      '        Sales_invoice.Invoice_date,'
      '        Sales_invoice.Goods_value,'
      '        Sales_invoice.Vat_Value,'
      
        '        (Sales_invoice.Goods_value+Sales_invoice.vat_value) AS T' +
        'otal_Value,'
      '        Sales_invoice.Sales_invoice_status,'
      '        Sales_invoice.Invoice_or_Credit,'
      '        Sales_invoice.description,'
      '        Sales_invoice.Rep,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Customer_Name,'
      '        Sales_invoice_status.Invoice_Status_description,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Customer_Type.Description AS Customer_Type_Description,'
      '        Customer.Requires_App_For_Payment,'
      '        Rep.Rep_Name,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Sales_invoice.Account_Manager,'
      
        '        (SELECT SUM((Purchase_orderline.Quantity_Delivered/Purch' +
        'ase_orderline.Cost_Pack_Quantity) * Purchase_orderline.Unit_cost' +
        ')'
      '          FROM Sales_invoice_line'
      '            INNER JOIN Purchase_orderline'
      
        '              ON (Sales_invoice_line.Sales_Order = Purchase_orde' +
        'rline.Sales_Order)'
      
        '         WHERE Sales_Invoice_Line.Sales_Invoice = Sales_invoice.' +
        'Sales_invoice) as Total_Materials,'
      '        Sales_invoice.Revenue_Centre,'
      '        Revenue_Centre.Revenue_Centre_Descr'
      'FROM Revenue_Centre'
      '      RIGHT JOIN (Sales_invoice_status'
      '      INNER JOIN (Rep'
      '      RIGHT JOIN (Operator'
      '      RIGHT JOIN ((Customer_Type'
      '      INNER JOIN Customer'
      
        '          ON Customer_Type.Customer_Type = Customer.Customer_typ' +
        'e)'
      '      INNER JOIN Sales_invoice'
      '          ON Customer.Customer = Sales_invoice.Customer)'
      '          ON Operator.Operator = Sales_invoice.Account_Manager)'
      '          ON Rep.Rep = Sales_invoice.Rep)'
      
        '          ON Sales_invoice_status.Sales_invoice_status = Sales_i' +
        'nvoice.Sales_invoice_status)'
      
        '          ON Revenue_Centre.Revenue_Centre = Sales_invoice.Reven' +
        'ue_Centre'
      
        'WHERE ((Sales_Invoice.Customer = :Customer) or (0 = :Customer)) ' +
        'and'
      '((Sales_Invoice.Rep = :Rep) or (0 = :Rep)) and'
      
        '((Sales_Invoice.Invoice_Date BETWEEN :Date_From AND :Date_To)) a' +
        'nd'
      '(Sales_Invoice.Sales_invoice_Status > 10) AND'
      
        '((Sales_invoice.inactive is NULL) or (Sales_invoice.inactive = '#39 +
        'N'#39')) AND'
      
        '(((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (Custo' +
        'mer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:Is_R' +
        'etail_Customer = '#39'A'#39')) AND'
      
        '((Customer.Requires_App_For_Payment = :Requires_App_For_Payment)' +
        ' OR (:Requires_App_For_Payment = '#39'A'#39'))'
      '')
    Left = 176
    Top = 64
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
        Name = 'Rep'
      end
      item
        Name = 'Rep'
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
      end
      item
        Name = 'Requires_App_For_Payment'
      end
      item
        Name = 'Requires_App_For_Payment'
      end>
    object qryReportSales_invoice: TIntegerField
      FieldName = 'Sales_invoice'
    end
    object qryReportInactive: TWideStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportAccount_code: TWideStringField
      FieldName = 'Account_code'
      Size = 10
    end
    object qryReportInvoice_No: TWideStringField
      FieldName = 'Invoice_no'
      Size = 10
    end
    object qryReportInvoice_date: TDateTimeField
      FieldName = 'Invoice_date'
    end
    object qryReportGoods_value: TFloatField
      FieldName = 'Goods_value'
      DisplayFormat = '#,##0.00'
    end
    object qryReportVat_Value: TFloatField
      FieldName = 'Vat_Value'
      DisplayFormat = '#,##0.00'
    end
    object qryReportTotal_Value: TFloatField
      FieldName = 'Total_Value'
      DisplayFormat = '#,##0.00'
    end
    object qryReportSales_invoice_status: TIntegerField
      FieldName = 'Sales_invoice_status'
    end
    object qryReportInvoice_Or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      Size = 1
    end
    object qryReportDescription: TWideStringField
      FieldName = 'description'
      Size = 255
    end
    object qryReportRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryReportReference: TWideStringField
      FieldName = 'Reference'
    end
    object qryReportCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryReportInvoice_Status_Description: TWideStringField
      FieldName = 'Invoice_Status_description'
      Size = 30
    end
    object qryReportCustomer_Type_Description: TWideStringField
      FieldName = 'Customer_Type_Description'
      Size = 40
    end
    object qryReportRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Size = 50
    end
    object qryReportAccount_Manager: TIntegerField
      FieldName = 'Account_Manager'
    end
    object qryReportAccount_Manager_Name: TWideStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object qryReportTotal_Materials: TFloatField
      FieldName = 'Total_Materials'
      DisplayFormat = '#,##0.00'
    end
    object qryReportIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object qryReportIs_Commercial_customer: TWideStringField
      FieldName = 'Is_Commercial_customer'
      Size = 1
    end
    object qryReportRevenue_Centre_Descr: TWideStringField
      FieldName = 'Revenue_Centre_Descr'
      Size = 50
    end
    object qryReportRequires_App_For_Payment: TWideStringField
      FieldName = 'Requires_App_For_Payment'
      Size = 1
    end
  end
  object qryReportOld: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_invoice.Sales_invoice,'
      '        Sales_invoice.Inactive,'
      '        Sales_invoice.Customer,'
      '        Sales_invoice.Account_code,'
      '        Sales_invoice.Invoice_no,'
      '        Sales_invoice.Invoice_date,'
      '        Sales_invoice.Goods_value,'
      '        Sales_invoice.Vat_Value,'
      
        '        (Sales_invoice.Goods_value+Sales_invoice.vat_value) AS T' +
        'otal_Value,'
      '        Sales_invoice.Sales_invoice_status,'
      '        Sales_invoice.Invoice_or_Credit,'
      '        Sales_invoice.description,'
      '        Sales_invoice.Rep,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Customer_Name,'
      '        Sales_invoice_status.Invoice_Status_description,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Customer_Type.Description AS Customer_Type_Description,'
      '        Customer.Requires_App_For_Payment,'
      '        Rep.Rep_Name,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Sales_invoice.Account_Manager,'
      
        '        (SELECT SUM((Purchase_orderline.Quantity_Delivered/Purch' +
        'ase_orderline.Cost_Pack_Quantity) * Purchase_orderline.Unit_cost' +
        ')'
      '          FROM Sales_invoice_line'
      '            INNER JOIN Purchase_orderline'
      
        '              ON (Sales_invoice_line.Sales_Order = Purchase_orde' +
        'rline.Sales_Order)'
      
        '         WHERE Sales_Invoice_Line.Sales_Invoice = Sales_invoice.' +
        'Sales_invoice) as Total_Materials'
      'FROM Operator'
      '      RIGHT JOIN (Sales_invoice_status'
      '      INNER JOIN (Rep'
      '      RIGHT JOIN ((Customer_Type'
      '      INNER JOIN Customer'
      '        ON Customer_Type.Customer_Type = Customer.Customer_type)'
      '      INNER JOIN Sales_invoice'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      '        ON Rep.Rep = Sales_invoice.Rep)'
      
        '        ON Sales_invoice_status.Sales_invoice_status = Sales_inv' +
        'oice.Sales_invoice_status)'
      '        ON Operator.Operator = Sales_invoice.Account_Manager'
      
        'WHERE ((Sales_Invoice.Customer = :Customer) or (0 = :Customer)) ' +
        'and'
      '((Sales_Invoice.Rep = :Rep) or (0 = :Rep)) and'
      
        '((Sales_Invoice.Invoice_Date BETWEEN :Date_From AND :Date_To)) a' +
        'nd'
      '(Sales_Invoice.Sales_invoice_Status > 10) AND'
      
        '((Sales_invoice.inactive is NULL) or (Sales_invoice.inactive = '#39 +
        'N'#39')) AND'
      
        '(((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (Custo' +
        'mer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:Is_R' +
        'etail_Customer = '#39'A'#39')) AND'
      
        '((Customer.Requires_App_For_Payment = :Requires_App_For_Payment)' +
        ' OR (:Requires_App_For_Payment = '#39'A'#39'))'
      '')
    Left = 304
    Top = 64
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
        Name = 'Rep'
      end
      item
        Name = 'Rep'
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
      end
      item
        Name = 'Requires_App_For_Payment'
      end
      item
        Name = 'Requires_App_For_Payment'
      end>
    object IntegerField1: TIntegerField
      FieldName = 'Sales_invoice'
    end
    object StringField1: TWideStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object IntegerField2: TIntegerField
      FieldName = 'Customer'
    end
    object StringField2: TWideStringField
      FieldName = 'Account_code'
      Size = 10
    end
    object StringField3: TWideStringField
      FieldName = 'Invoice_no'
      Size = 10
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Invoice_date'
    end
    object FloatField1: TFloatField
      FieldName = 'Goods_value'
      DisplayFormat = '#,##0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'Vat_Value'
      DisplayFormat = '#,##0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'Total_Value'
      DisplayFormat = '#,##0.00'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Sales_invoice_status'
    end
    object StringField4: TWideStringField
      FieldName = 'Invoice_or_Credit'
      Size = 1
    end
    object StringField5: TWideStringField
      FieldName = 'description'
      Size = 255
    end
    object IntegerField4: TIntegerField
      FieldName = 'Rep'
    end
    object StringField6: TWideStringField
      FieldName = 'Reference'
    end
    object StringField7: TWideStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object StringField8: TWideStringField
      FieldName = 'Invoice_Status_description'
      Size = 30
    end
    object StringField9: TWideStringField
      FieldName = 'Customer_Type_Description'
      Size = 40
    end
    object StringField10: TWideStringField
      FieldName = 'Rep_Name'
      Size = 50
    end
    object IntegerField5: TIntegerField
      FieldName = 'Account_Manager'
    end
    object StringField11: TWideStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object FloatField4: TFloatField
      FieldName = 'Total_Materials'
      DisplayFormat = '#,##0.00'
    end
    object StringField12: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object StringField13: TWideStringField
      FieldName = 'Is_Commercial_customer'
      Size = 1
    end
  end
  object qryGetSO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Date_Required'
      'FROM Sales_Order'
      'WHERE Sales_Order = :Sales_Order')
    Left = 575
    Top = 63
    ParamData = <
      item
        Name = 'SALES_ORDER'
        ParamType = ptInput
      end>
  end
end
