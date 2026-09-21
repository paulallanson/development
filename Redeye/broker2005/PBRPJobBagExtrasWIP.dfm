object PBRPJobBagExtrasWIPfrm: TPBRPJobBagExtrasWIPfrm
  Left = 109
  Top = 41
  Caption = 'Job Bag Work In Progress'
  ClientHeight = 620
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = -8
    Top = 8
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
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
      50.000000000000000000
      20.000000000000000000
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
      Left = 24
      Top = 47
      Width = 1370
      Height = 114
      Frame.Style = psDashDot
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        241.300000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 506
        Top = 12
        Width = 358
        Height = 25
        Size.Values = (
          52.916666666666670000
          1071.033333333333000000
          25.400000000000000000
          757.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'CURRENT WORK IN PROGRESS LIST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object RunDateQRLabel: TQRLabel
        Left = 1230
        Top = 30
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          2603.500000000000000000
          63.500000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RunDateQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 1246
        Top = 0
        Width = 75
        Height = 20
        Size.Values = (
          42.333333333333330000
          2637.366666666667000000
          0.000000000000000000
          158.750000000000000000)
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
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Text = 'Page:  '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSelection: TQRLabel
        Left = 651
        Top = 42
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1377.950000000000000000
          88.900000000000000000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Selection'
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
      object qrlblInclude: TQRLabel
        Left = 658
        Top = 65
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          1392.766666666667000000
          137.583333333333300000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Include'
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
    object RepQRGroup: TQRGroup
      Left = 24
      Top = 186
      Width = 1370
      Height = 30
      AlignToBottom = False
      BeforePrint = RepQRGroupBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = RepQRFooter
      Master = qrsubJobBagline
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 14
        Top = 0
        Width = 84
        Height = 20
        Size.Values = (
          42.333333333333330000
          29.633333333333330000
          0.000000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
    object qrsubJobBagline: TQRSubDetail
      Left = 24
      Top = 246
      Width = 1370
      Height = 21
      AfterPrint = qrsubJobBaglineAfterPrint
      AlignToBottom = False
      BeforePrint = qrsubJobBaglineBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.450000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 200
        Top = 0
        Width = 421
        Height = 20
        Size.Values = (
          42.333333333333340000
          423.333333333333300000
          0.000000000000000000
          891.645833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Line_Descr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 630
        Top = 0
        Width = 80
        Height = 20
        Size.Values = (
          42.333333333333340000
          1333.500000000000000000
          0.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Delivery_Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 750
        Top = 0
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333340000
          1587.500000000000000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object lblQuantity: TQRLabel
        Left = 932
        Top = 0
        Width = 49
        Height = 20
        Size.Values = (
          42.333333333333330000
          1972.733333333333000000
          0.000000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblValue: TQRLabel
        Left = 1053
        Top = 0
        Width = 38
        Height = 20
        Size.Values = (
          42.333333333333330000
          2228.850000000000000000
          0.000000000000000000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 150
        Top = 0
        Width = 41
        Height = 20
        Size.Values = (
          42.333333333333340000
          317.500000000000000000
          0.000000000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Line'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object qrlblOrderNo: TQRLabel
        Left = 848
        Top = 0
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1794.933333333333000000
          0.000000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblOrderNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblCostValue: TQRLabel
        Left = 1122
        Top = 0
        Width = 59
        Height = 20
        Size.Values = (
          42.333333333333330000
          2374.900000000000000000
          0.000000000000000000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCostValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblMargin: TQRLabel
        Left = 1223
        Top = 0
        Width = 44
        Height = 20
        Size.Values = (
          42.333333333333330000
          2588.683333333333000000
          0.000000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object RepQRFooter: TQRBand
      Left = 24
      Top = 306
      Width = 1370
      Height = 39
      AlignToBottom = False
      BeforePrint = RepQRFooterBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.550000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object lblGrpCostTotal: TQRLabel
        Left = 1083
        Top = 10
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          2292.350000000000000000
          21.166666666666670000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpCostTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblTotals: TQRLabel
        Left = 827
        Top = 10
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          1750.483333333333000000
          21.166666666666670000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Group Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblGrpTotal: TQRLabel
        Left = 1021
        Top = 10
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          2161.116666666667000000
          21.166666666666670000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape1: TQRShape
        Left = 930
        Top = 0
        Width = 341
        Height = 9
        Size.Values = (
          18.520833333333340000
          1968.500000000000000000
          0.000000000000000000
          722.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblGrpMargin: TQRLabel
        Left = 1185
        Top = 10
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          2508.250000000000000000
          21.166666666666670000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrSummary: TQRBand
      Left = 24
      Top = 345
      Width = 1370
      Height = 32
      AlignToBottom = False
      BeforePrint = qrSummaryBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object lblReportCostTotal: TQRLabel
        Left = 1064
        Top = 10
        Width = 117
        Height = 21
        Size.Values = (
          44.450000000000000000
          2252.133333333333000000
          21.166666666666670000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportCostTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 826
        Top = 10
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          1748.366666666667000000
          21.166666666666670000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Report Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblReportTotal: TQRLabel
        Left = 1001
        Top = 10
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          2118.783333333333000000
          21.166666666666670000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape2: TQRShape
        Left = 930
        Top = 1
        Width = 341
        Height = 10
        Size.Values = (
          21.166666666666670000
          1968.500000000000000000
          2.645833333333333000
          722.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblReportMargin: TQRLabel
        Left = 1167
        Top = 10
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2470.150000000000000000
          21.166666666666670000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrgJobBag: TQRGroup
      Left = 24
      Top = 216
      Width = 1370
      Height = 30
      AlignToBottom = False
      BeforePrint = qrgJobBagBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Job_Bag'
      FooterBand = qrFooterJobBag
      Master = qrsubJobBagline
      ReprintOnNewPage = False
      object qrdbJobBagNo: TQRDBText
        Left = 110
        Top = 3
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333340000
          232.833333333333400000
          5.291666666666667000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'job_bag'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRLabel2: TQRLabel
        Left = 30
        Top = 3
        Width = 62
        Height = 20
        Size.Values = (
          42.333333333333330000
          63.500000000000000000
          6.350000000000000000
          131.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Number:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 190
        Top = 3
        Width = 73
        Height = 20
        Size.Values = (
          42.333333333333330000
          402.166666666666700000
          6.350000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 270
        Top = 3
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333340000
          571.500000000000000000
          5.291666666666667000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Delivery_Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 353
        Top = 3
        Width = 49
        Height = 20
        Size.Values = (
          42.333333333333330000
          747.183333333333300000
          6.350000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 412
        Top = 3
        Width = 209
        Height = 20
        Size.Values = (
          42.333333333333340000
          873.124999999999900000
          5.291666666666667000
          441.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRLabel10: TQRLabel
        Left = 950
        Top = 3
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2010.833333333333000000
          6.350000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 1050
        Top = 3
        Width = 76
        Height = 20
        Size.Values = (
          42.333333333333330000
          2222.500000000000000000
          6.350000000000000000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRLabel11: TQRLabel
        Left = 633
        Top = 3
        Width = 56
        Height = 20
        Size.Values = (
          42.333333333333330000
          1339.850000000000000000
          6.350000000000000000
          118.533333333333300000)
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
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 702
        Top = 3
        Width = 229
        Height = 20
        Size.Values = (
          42.333333333333340000
          1486.958333333333000000
          5.291666666666667000
          484.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object qrlblJBStatus1: TQRLabel
        Left = 1253
        Top = 3
        Width = 113
        Height = 20
        Size.Values = (
          42.333333333333340000
          2651.125000000000000000
          5.291666666666667000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblJBStatus1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrFooterJobBag: TQRBand
      Left = 24
      Top = 267
      Width = 1370
      Height = 39
      AlignToBottom = False
      BeforePrint = qrFooterJobBagBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.550000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object lblJobBagCostTotal: TQRLabel
        Left = 1058
        Top = 10
        Width = 123
        Height = 21
        Size.Values = (
          44.450000000000000000
          2239.433333333333000000
          21.166666666666670000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblJobBagCostTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblJobBagMargin: TQRLabel
        Left = 1159
        Top = 10
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          2453.216666666667000000
          21.166666666666670000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblJobBagMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 930
        Top = 1
        Width = 341
        Height = 9
        Size.Values = (
          18.520833333333340000
          1968.500000000000000000
          2.645833333333333000
          722.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblJobBagTotal: TQRLabel
        Left = 828
        Top = 10
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          1752.600000000000000000
          21.166666666666670000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Job Bag Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblJobBagTotal: TQRLabel
        Left = 996
        Top = 10
        Width = 95
        Height = 21
        Size.Values = (
          44.450000000000000000
          2108.200000000000000000
          21.166666666666670000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblJobBagTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrFooterJobBagSummary: TQRBand
      Left = 24
      Top = 377
      Width = 1370
      Height = 30
      AlignToBottom = False
      BeforePrint = qrFooterJobBagSummaryBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblSummaryCostValue: TQRLabel
        Left = 1089
        Top = 3
        Width = 93
        Height = 20
        Size.Values = (
          42.333333333333330000
          2305.050000000000000000
          6.350000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSummaryValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSummaryMargin: TQRLabel
        Left = 1174
        Top = 3
        Width = 93
        Height = 20
        Size.Values = (
          42.333333333333330000
          2484.966666666667000000
          6.350000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSummaryValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSummaryValue: TQRLabel
        Left = 996
        Top = 3
        Width = 93
        Height = 20
        Size.Values = (
          42.333333333333330000
          2108.200000000000000000
          6.350000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSummaryValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 718
        Top = 3
        Width = 87
        Height = 20
        Size.Values = (
          42.333333333333330000
          1519.766666666667000000
          6.350000000000000000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRDBText11: TQRDBText
        Left = 16
        Top = 3
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333340000
          34.395833333333340000
          5.291666666666667000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'job_bag'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRDBText12: TQRDBText
        Left = 89
        Top = 3
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333340000
          187.854166666666700000
          5.291666666666667000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Delivery_Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRDBText13: TQRDBText
        Left = 155
        Top = 3
        Width = 206
        Height = 20
        Size.Values = (
          42.333333333333340000
          328.083333333333400000
          5.291666666666667000
          436.562499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRDBText14: TQRDBText
        Left = 370
        Top = 3
        Width = 239
        Height = 20
        Size.Values = (
          42.333333333333340000
          783.166666666666800000
          5.291666666666667000
          505.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRDBText15: TQRDBText
        Left = 616
        Top = 3
        Width = 111
        Height = 20
        Size.Values = (
          42.333333333333340000
          1304.395833333333000000
          5.291666666666667000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRDBText18: TQRDBText
        Left = 814
        Top = 3
        Width = 98
        Height = 20
        Size.Values = (
          42.333333333333340000
          1722.437500000000000000
          5.291666666666667000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object QRDBText19: TQRDBText
        Left = 920
        Top = 3
        Width = 91
        Height = 20
        Size.Values = (
          42.333333333333340000
          1947.333333333334000000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Rep_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object qrlblJBStatus2: TQRLabel
        Left = 1278
        Top = 3
        Width = 113
        Height = 20
        Size.Values = (
          42.333333333333340000
          2704.041666666667000000
          5.291666666666667000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblJBStatus2'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrchildDetailed: TQRChildBand
      Left = 24
      Top = 161
      Width = 1370
      Height = 25
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbPageHeader
      PrintOrder = cboAfterParent
      object QRLabel9: TQRLabel
        Left = 130
        Top = 0
        Width = 38
        Height = 20
        Size.Values = (
          42.333333333333330000
          275.166666666666700000
          0.000000000000000000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Line No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 200
        Top = 0
        Width = 53
        Height = 20
        Size.Values = (
          42.333333333333330000
          423.333333333333300000
          0.000000000000000000
          112.183333333333300000)
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
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 630
        Top = 0
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333340000
          1333.500000000000000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 751
        Top = 0
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          1589.616666666667000000
          0.000000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 914
        Top = 0
        Width = 68
        Height = 20
        Size.Values = (
          42.333333333333340000
          1934.104166666667000000
          0.000000000000000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSalesValue: TQRLabel
        Left = 1025
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333330000
          2169.583333333333000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 1201
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333340000
          2542.645833333333000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 1115
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333330000
          2360.083333333333000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrChildsummary: TQRChildBand
      Left = 24
      Top = 407
      Width = 1370
      Height = 25
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      PrintOrder = cboAfterParent
      object QRLabel26: TQRLabel
        Left = 10
        Top = 0
        Width = 59
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          0.000000000000000000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 89
        Top = 0
        Width = 52
        Height = 20
        Size.Values = (
          42.333333333333330000
          188.383333333333300000
          0.000000000000000000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Reqd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 155
        Top = 0
        Width = 49
        Height = 20
        Size.Values = (
          42.333333333333330000
          328.083333333333300000
          0.000000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 370
        Top = 0
        Width = 53
        Height = 20
        Size.Values = (
          42.333333333333330000
          783.166666666666700000
          0.000000000000000000
          112.183333333333300000)
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
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 618
        Top = 0
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1308.100000000000000000
          0.000000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 761
        Top = 0
        Width = 44
        Height = 20
        Size.Values = (
          42.333333333333340000
          1611.312500000000000000
          0.000000000000000000
          92.604166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 1023
        Top = 0
        Width = 68
        Height = 20
        Size.Values = (
          42.333333333333330000
          2164.291666666667000000
          0.000000000000000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 1201
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333340000
          2542.645833333333000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 821
        Top = 0
        Width = 84
        Height = 20
        Size.Values = (
          42.333333333333330000
          1737.783333333333000000
          0.000000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Account Manager'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 922
        Top = 0
        Width = 21
        Height = 20
        Size.Values = (
          42.333333333333330000
          1951.566666666667000000
          0.000000000000000000
          44.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Rep'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 1116
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333330000
          2362.729166666667000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 1278
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333340000
          2704.041666666667000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Status'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order, '
      #9'Delivery_Detail.Line, '
      #9'Delivery_Detail.Delivery_no, '
      #9'Purchase_OrderLine.Cust_Order_No, '
      #9'Delivery_Detail.Date_Point AS Delivery_Date, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Purchase_OrderLine.Purch_Ord_Line_Status, '
      #9'Purchase_OrderLine.Proof_Required, '
      #9'Purchase_OrderLine.Goods_Required, '
      #9'Purchase_OrderLine.Customers_Desc, '
      #9'Purchase_OrderLine.On_Hold,'
      '                Purchase_OrderLine.Quantity, '
      #9'Purchase_Order.Date_Point, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Customer.Name, Supplier_Branch.Account_Code, '
      #9'Rep.Name AS Rep_Name, '
      #9'Purchase_OrderLine.Rep, '
      #9'Delivery_Detail.Qty_to_Deliver, '
      #9'Delivery_Detail.Qty_Delivered, '
      #9'Purchase_OrderLine.Selling_Price, '
      #9'Price_Unit.Price_Unit_Factor,'
      #9'Purchase_order.Office_Contact,'
      #9'Operator.Name as Account_Manager,'
      '  (select top 1 Job_Bag'
      '   from Job_Bag_Line_dets'
      
        '   where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.P' +
        'urchase_Order) as Job_Bag'
      'FROM Price_Unit'
      #9'INNER JOIN (Operator'
      #9'INNER JOIN (Rep'
      #9'INNER JOIN ((Customer'
      #9'INNER JOIN Customer_Branch ON '
      #9#9'Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN ((Purchase_OrderLine '
      #9'LEFT JOIN Form_Reference ON '
      
        #9#9'Purchase_OrderLine.Form_Reference = Form_Reference.Form_Refere' +
        'nce)'
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Delivery_Detail '
      #9'INNER JOIN Purchase_Order ON '
      
        #9#9'Delivery_Detail.Purchase_Order = Purchase_Order.Purchase_Order' +
        ') ON '
      #9#9'(Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND '
      #9#9'(Supplier_Branch.Supplier = Purchase_Order.Supplier)) ON '
      
        #9#9'(Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_O' +
        'rder) AND '
      #9#9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9#9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_' +
        'Order)) ON '
      
        #9#9'(Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) AND' +
        ' '
      #9#9'(Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON '
      #9#9'Rep.Rep = Purchase_OrderLine.Rep) ON'
      #9#9'Operator.Operator = Purchase_Order.Office_Contact) ON'
      #9#9'Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit'
      'WHERE (Purchase_OrderLine.Purch_Ord_Line_Status>=20) And '
      #9'(Purchase_OrderLine.Purch_Ord_Line_Status<=24)')
    Left = 710
    Top = 16
  end
  object qrySO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_order_Line.Part_Sales_Price, Sales_order_Line.Part,'
      
        'Part.Price_unit, Sales_order_Line.Sell_Pack_Quantity, Sales_orde' +
        'r_Line.Purch_Pack_Quantity, Sales_order_Line.Part_Cost'
      'from Sales_Order_Line, Part'
      'where Sales_Order = :Sales_Order and'
      'sales_order_line_no = :sales_order_line_no and'
      'Sales_order_line.Part = Part.Part')
    Left = 462
    Top = 177
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Purchase_orderLine.Purchase_Order,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Purchase_Orderline.Selling_Price,'
      '        Order_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '        Order_Unit.Description as Order_Unit_Description,'
      '        Purchase_Orderline.Order_Price'
      'from Purchase_Orderline, Price_Unit, Price_Unit Order_Unit'
      'where Purchase_Order = :Purchase_Order AND '
      'Line = :Line AND'
      'Purchase_OrderLine.Sell_unit = Price_Unit.Price_Unit AND'
      'Purchase_OrderLine.Order_Unit = Order_Unit.Price_Unit')
    Left = 462
    Top = 118
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
end
