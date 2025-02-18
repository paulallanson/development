object frmWTRPSOAllocated: TfrmWTRPSOAllocated
  Left = 151
  Top = 107
  Caption = 'Allocated Stock Report'
  ClientHeight = 576
  ClientWidth = 1380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qrySalesOrders
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
    ReportTitle = 'Sales Orders due for templating Quote Report'
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
      Top = 160
      Width = 1309
      Height = 33
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
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
        DataSet = qrySalesOrders
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
    object qrbGroupFooter: TQRBand
      Left = 47
      Top = 237
      Width = 1309
      Height = 36
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblCustTotal: TQRLabel
        Left = 572
        Top = 9
        Width = 89
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1210.733333333333000000
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
      object qrlblCustVAT: TQRLabel
        Left = 479
        Top = 9
        Width = 83
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1013.883333333333000000
          19.050000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustVAT'
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
        Left = 990
        Top = -1
        Width = 311
        Height = 10
        Size.Values = (
          21.166666666666670000
          2095.500000000000000000
          -2.645833333333333000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrGroupbyFootText: TQRDBText
        Left = 820
        Top = 11
        Width = 124
        Height = 21
        Size.Values = (
          44.450000000000000000
          1735.666666666667000000
          23.283333333333330000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object QRLabel2: TQRLabel
        Left = 953
        Top = 11
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          2017.183333333333000000
          23.283333333333330000
          69.850000000000000000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCustGoods: TQRLabel
        Left = 993
        Top = 9
        Width = 97
        Height = 21
        Size.Values = (
          44.450000000000000000
          2101.850000000000000000
          19.050000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustGoods'
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
        Left = 1109
        Top = 9
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2347.383333333333000000
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
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 273
      Width = 1309
      Height = 33
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 903
        Top = 9
        Width = 79
        Height = 21
        Size.Values = (
          44.450000000000000000
          1911.350000000000000000
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
        Left = 558
        Top = 9
        Width = 104
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1181.100000000000000000
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
        Left = 990
        Top = -1
        Width = 311
        Height = 10
        Size.Values = (
          21.166666666666670000
          2095.500000000000000000
          -2.645833333333333000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblReportVAT: TQRLabel
        Left = 464
        Top = 9
        Width = 98
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          982.133333333333300000
          19.050000000000000000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportVAT'
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
      object qrlblReportGoods: TQRLabel
        Left = 978
        Top = 9
        Width = 112
        Height = 21
        Size.Values = (
          44.450000000000000000
          2070.100000000000000000
          19.050000000000000000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportGoods'
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
        Left = 1092
        Top = 9
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          2311.400000000000000000
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
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 113
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        239.183333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 483
        Top = 3
        Width = 324
        Height = 24
        Size.Values = (
          50.800000000000000000
          1022.350000000000000000
          6.350000000000000000
          685.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Anticipated Material Ordering Report'
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
        Left = 1212
        Top = 29
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2565.400000000000000000
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
        Left = 0
        Top = 89
        Width = 70
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          188.383333333333300000
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
      object QRLabel4: TQRLabel
        Left = 678
        Top = 89
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          1435.100000000000000000
          188.383333333333300000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date'
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
        Left = 170
        Top = 89
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          359.833333333333300000
          188.383333333333300000
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
      object QRLabel6: TQRLabel
        Left = 370
        Top = 89
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          783.166666666666700000
          188.383333333333300000
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
      object qrlblDateRange: TQRLabel
        Left = 597
        Top = 31
        Width = 89
        Height = 19
        Size.Values = (
          40.216666666666670000
          1263.650000000000000000
          65.616666666666670000
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
      object QRLabel7: TQRLabel
        Left = 760
        Top = 89
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          1608.666666666667000000
          188.383333333333300000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Date'
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
      object QRLabel1: TQRLabel
        Left = 550
        Top = 89
        Width = 24
        Height = 21
        Size.Values = (
          44.450000000000000000
          1164.166666666667000000
          188.383333333333300000
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
      object qrlblSelection: TQRLabel
        Left = 600
        Top = 56
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          1270.000000000000000000
          118.533333333333300000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblSelection'
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
        Left = 80
        Top = 89
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          188.383333333333300000
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
      object gtQRLabel2: TQRLabel
        Left = 860
        Top = 89
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          1820.333333333333000000
          188.383333333333300000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Slab Size'
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
        Left = 950
        Top = 71
        Width = 51
        Height = 42
        Size.Values = (
          89.958333333333330000
          2010.833333333333000000
          150.812500000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'No of Slabs'
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
        Left = 1200
        Top = 89
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          2540.000000000000000000
          188.383333333333300000
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
      object QRLabel9: TQRLabel
        Left = 1015
        Top = 89
        Width = 74
        Height = 21
        Size.Values = (
          44.979166666666670000
          2148.416666666667000000
          187.854166666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sales Value'
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
      object gtQRLabel5: TQRLabel
        Left = 1114
        Top = 89
        Width = 78
        Height = 19
        Size.Values = (
          40.216666666666670000
          2357.966666666667000000
          188.383333333333300000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Material Cost'
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
      Top = 193
      Width = 1309
      Height = 44
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
        93.133333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Tag = 1
        Left = 0
        Top = 1
        Width = 73
        Height = 19
        Size.Values = (
          40.216666666666670000
          0.000000000000000000
          2.116666666666667000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
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
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Tag = 1
        Left = 677
        Top = 1
        Width = 75
        Height = 19
        Size.Values = (
          40.216666666666670000
          1432.983333333333000000
          2.116666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
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
        Tag = 1
        Left = 370
        Top = 1
        Width = 171
        Height = 19
        Size.Values = (
          39.687500000000000000
          783.166666666666700000
          2.645833333333333000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
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
        Tag = 1
        Left = 170
        Top = 1
        Width = 191
        Height = 19
        Size.Values = (
          39.687500000000000000
          359.833333333333300000
          2.645833333333333000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object QRDBText10: TQRDBText
        Tag = 1
        Left = 550
        Top = 1
        Width = 121
        Height = 19
        Size.Values = (
          39.687500000000000000
          1164.166666666667000000
          2.645833333333333000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object qrlblTemplateDate: TQRLabel
        Tag = 1
        Left = 762
        Top = 1
        Width = 105
        Height = 19
        Size.Values = (
          40.216666666666670000
          1612.900000000000000000
          2.116666666666667000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblTemplateDate'
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
      object qrlblFittingDate: TQRLabel
        Tag = 1
        Left = 83
        Top = 1
        Width = 88
        Height = 19
        Size.Values = (
          40.216666666666670000
          175.683333333333300000
          2.116666666666667000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblFittingDate'
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
      object qrlblDescription: TQRLabel
        Tag = 1
        Left = 170
        Top = 21
        Width = 90
        Height = 19
        Size.Values = (
          40.216666666666670000
          359.833333333333300000
          44.450000000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDescription'
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
      object gtQRDBText2: TQRDBText
        Tag = 1
        Left = 1200
        Top = 1
        Width = 155
        Height = 19
        Size.Values = (
          40.216666666666670000
          2540.000000000000000000
          2.116666666666667000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Sales_Order_Status_Desc'
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
      object qrlblSlabDescription: TQRLabel
        Tag = 1
        Left = 863
        Top = 1
        Width = 99
        Height = 19
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          2.645833333333333000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSlabDescription'
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
        Tag = 1
        Left = 960
        Top = 1
        Width = 83
        Height = 19
        Size.Values = (
          40.216666666666670000
          2032.000000000000000000
          2.116666666666667000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Slab_Quantity'
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
      object qrlblGoodsValue: TQRLabel
        Tag = 1
        Left = 992
        Top = 1
        Width = 96
        Height = 19
        Size.Values = (
          40.216666666666670000
          2099.733333333333000000
          2.116666666666667000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGoodsValue'
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
      object qrlblMaterialCost: TQRLabel
        Tag = 1
        Left = 1095
        Top = 1
        Width = 96
        Height = 19
        Size.Values = (
          40.216666666666670000
          2317.750000000000000000
          2.116666666666667000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGoodsValue'
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
      object qrlblWorktopMaterial: TQRLabel
        Tag = 1
        Left = 762
        Top = 21
        Width = 120
        Height = 19
        Enabled = False
        Size.Values = (
          40.216666666666670000
          1612.900000000000000000
          44.450000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWorktopMaterial'
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
      object qrlblStockCode: TQRLabel
        Tag = 1
        Left = 864
        Top = 21
        Width = 89
        Height = 19
        Size.Values = (
          40.216666666666670000
          1828.800000000000000000
          44.450000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblStockCode'
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
      object qrlblAllocatedSlabDescription: TQRLabel
        Tag = 1
        Left = 993
        Top = 19
        Width = 99
        Height = 19
        Size.Values = (
          40.216666666666670000
          2101.850000000000000000
          40.216666666666670000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSlabDescription'
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
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.IsFittingInOutlook,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Worktop,'
      '        Quote_Slab.Thickness,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        Sales_order_line.Unit_Price,'
      '        SUM(Quote_Slab.Quantity) as Slab_Quantity,'
      
        '        SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/1000000.00' +
        '0000) * Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_S' +
        'lab.Adhesive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1)))) as ' +
        'Total_Slab_Cost'
      'FROM Sales_Order_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN ((Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      '      INNER JOIN (Worktop'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN Quote_Slab'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      'WHERE'
      
        '    ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.Sal' +
        'es_Order_Status < :Sales_Order_Status)) AND'
      '    ((Sales_Order.inactive = '#39'N'#39')) AND'
      '    ((Sales_Order.Rep = :Rep) or (0 = :Rep)) AND'
      
        '    ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Order.' +
        'Date_Required <= :Date_To)) AND'
      
        '    ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR (' +
        'Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittingI' +
        'nOutlook IS NULL)) AND'
      
        '    (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (C' +
        'ustomer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:' +
        'Is_Retail_Customer = '#39'A'#39'))')
    Left = 200
    Top = 40
    ParamData = <
      item
        Name = 'Sales_Order_Status'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IsFittingInOutlook'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Is_Commercial_Customer'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryWTElement: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Thickness.Thickness_mm,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      
        '        Thickness.Thickness_mm + '#39' '#39' + Worktop.Description + '#39' '#39 +
        ' + Material_Type.Description as Worktop_Material'
      'FROM (Material_Type '
      #9#9'INNER JOIN (Quote_Element '
      #9#9'INNER JOIN Worktop '
      #9#9#9'ON Quote_Element.Worktop = Worktop.Worktop) '
      
        #9#9#9'ON Material_Type.Material_Type = Worktop.Material_Type) INNER' +
        ' JOIN Thickness '
      #9#9#9'ON Quote_Element.Thickness = Thickness.Thickness'
      'WHERE Quote_Element.Quote = :Quote')
    Left = 320
    Top = 40
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object OLDqrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.IsFittingInOutlook,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Worktop.Description as Worktop_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Thickness.Thickness_mm,'
      '        Quote_Slab.Length as Slab_Length,'
      '        Quote_Slab.Depth as Slab_Depth,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      '        SUM(Quote_Slab.Quantity) as Slab_Quantity,'
      
        '        SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/1000000) *' +
        ' Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_Slab.Adh' +
        'esive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1)))) as Total_S' +
        'lab_Cost'
      'FROM Sales_Order_Status'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN ((Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      '      INNER JOIN (Worktop'
      '        INNER JOIN (Thickness'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN Quote_Slab'
      '          ON Quote.Quote = Quote_Slab.Quote)'
      '          ON Thickness.Thickness = Quote_Slab.Thickness)'
      '          ON Worktop.Worktop = Quote_Slab.Worktop)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      'WHERE'
      
        '    ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.Sal' +
        'es_Order_Status < 55)) AND'
      '    ((Sales_Order.Rep = :Rep) or (0 = :Rep)) AND'
      
        '    ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Order.' +
        'Date_Required < :Date_To)) AND'
      
        '    ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR (' +
        'Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittingI' +
        'nOutlook IS NULL)) AND'
      
        '    (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (C' +
        'ustomer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:' +
        'Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 416
    Top = 40
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Date_From'
        DataType = ftString
      end
      item
        Name = 'Date_To'
        DataType = ftString
      end
      item
        Name = 'IsFittingInOutlook'
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
  end
  object qryGetStockCode: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Stock_item.Stock_code'
      'FROM Stock_item'
      '        RIGHT JOIN Worktop_Thickness_Slab_Size'
      
        '          ON Stock_item.Stock_item = Worktop_Thickness_Slab_Size' +
        '.Stock_Item'
      'WHERE Worktop_Thickness_Slab_Size.Worktop = :Worktop AND'
      '      Worktop_Thickness_Slab_Size.Thickness = :Thickness AND'
      '      Worktop_Thickness_Slab_Size.Length = :Length AND'
      '      Worktop_Thickness_Slab_Size.Depth = :Depth'
      '')
    Left = 792
    Top = 48
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end>
  end
end
