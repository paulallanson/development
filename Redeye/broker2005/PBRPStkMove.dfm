object PBRPStkMovefrm: TPBRPStkMovefrm
  Left = 3
  Top = 101
  Caption = 'Customer Stock Movement Report'
  ClientHeight = 431
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 16
    Top = 16
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    ReportTitle = 'Customer Stock Movement Report'
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
    object PageTitle: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 146
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        309.033333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 1256
        Top = 10
        Width = 46
        Height = 21
        Size.Values = (
          44.450000000000000000
          2658.533333333333000000
          21.166666666666670000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
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
      object QRLabel13: TQRLabel
        Left = 1186
        Top = 10
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          2510.366666666667000000
          21.166666666666670000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
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
      object qrlblTitle: TQRLabel
        Left = 430
        Top = 10
        Width = 448
        Height = 29
        Size.Values = (
          61.383333333333330000
          910.166666666666700000
          21.166666666666670000
          948.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Customer Stock Movements - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel2: TQRLabel
        Left = 111
        Top = 119
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          234.950000000000000000
          251.883333333333300000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 65
        Top = 119
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          137.583333333333300000
          251.883333333333300000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 308
        Top = 119
        Width = 92
        Height = 21
        Size.Values = (
          44.450000000000000000
          651.933333333333300000
          251.883333333333300000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer PO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 454
        Top = 119
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          960.966666666666700000
          251.883333333333300000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 516
        Top = 89
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          1092.200000000000000000
          188.383333333333300000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movement In'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 626
        Top = 94
        Width = 61
        Height = 11
        Size.Values = (
          23.812500000000000000
          1325.562500000000000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 446
        Top = 94
        Width = 61
        Height = 11
        Size.Values = (
          23.812500000000000000
          944.562500000000000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 1006
        Top = 119
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          2129.366666666667000000
          251.883333333333300000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery To:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 520
        Top = 119
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1100.666666666667000000
          251.883333333333300000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 612
        Top = 119
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1295.400000000000000000
          251.883333333333300000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape5: TQRShape
        Left = 706
        Top = 94
        Width = 61
        Height = 11
        Size.Values = (
          23.812500000000000000
          1494.895833333330000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 776
        Top = 89
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          1642.533333333333000000
          188.383333333333300000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movement Out'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape6: TQRShape
        Left = 896
        Top = 94
        Width = 61
        Height = 11
        Size.Values = (
          23.812500000000000000
          1897.062500000000000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 708
        Top = 119
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          1498.600000000000000000
          251.883333333333300000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 780
        Top = 119
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1651.000000000000000000
          251.883333333333300000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 880
        Top = 119
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1862.666666666667000000
          251.883333333333300000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDateRange: TQRLabel
        Left = 560
        Top = 40
        Width = 205
        Height = 21
        Size.Values = (
          44.450000000000000000
          1185.333333333333000000
          84.666666666666670000
          433.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'For movements dated from: '
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
      object QRLabel19: TQRLabel
        Left = 186
        Top = 119
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          393.700000000000000000
          251.883333333333300000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movement Type'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object CustGroup: TQRGroup
      Left = 47
      Top = 203
      Width = 1309
      Height = 30
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = CustFooter
      Master = OrderDetail
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 108
        Top = 3
        Width = 131
        Height = 21
        Size.Values = (
          44.450000000000000000
          228.600000000000000000
          6.350000000000000000
          277.283333333333300000)
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
      object QRLabel1: TQRLabel
        Left = 20
        Top = 3
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          6.350000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
    end
    object OrderDetail: TQRSubDetail
      Left = 47
      Top = 263
      Width = 1309
      Height = 26
      AlignToBottom = False
      BeforePrint = OrderDetailBeforePrint
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
        55.033333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 110
        Top = 3
        Width = 42
        Height = 19
        Size.Values = (
          40.216666666666670000
          232.833333333333300000
          6.350000000000000000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'POrder'
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
        Left = 306
        Top = 3
        Width = 117
        Height = 19
        Size.Values = (
          39.687500000000000000
          648.229166666667000000
          5.291666666666670000
          248.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_order_no'
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
        Left = 470
        Top = 3
        Width = 39
        Height = 19
        Size.Values = (
          40.216666666666670000
          994.833333333333300000
          6.350000000000000000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Qty_In'
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
      object qrdbQtyOut: TQRDBText
        Left = 717
        Top = 3
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          1517.650000000000000000
          6.350000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Qty_Out'
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
      object QRDBText11: TQRDBText
        Left = -5
        Top = 3
        Width = 106
        Height = 19
        Size.Values = (
          40.216666666666670000
          -10.583333333333330000
          6.350000000000000000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Deliv_Actual'
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
      object lblSellValueIn: TQRLabel
        Left = 523
        Top = 3
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          1107.016666666667000000
          6.350000000000000000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellValueIn'
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
      object qrdbDeliveryName: TQRDBText
        Left = 1006
        Top = 3
        Width = 291
        Height = 19
        Size.Values = (
          39.687500000000000000
          2129.895833333330000000
          5.291666666666670000
          616.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'DeliveryName'
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
      object lblCostValueIn: TQRLabel
        Left = 608
        Top = 3
        Width = 84
        Height = 19
        Size.Values = (
          40.216666666666670000
          1286.933333333333000000
          6.350000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCostValueIn'
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
      object lblSellValueOut: TQRLabel
        Left = 776
        Top = 3
        Width = 87
        Height = 19
        Size.Values = (
          40.216666666666670000
          1642.533333333333000000
          6.350000000000000000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellValueout'
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
      object lblCostValueOut: TQRLabel
        Left = 866
        Top = 3
        Width = 92
        Height = 19
        Size.Values = (
          40.216666666666670000
          1833.033333333333000000
          6.350000000000000000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCostValueout'
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
      object qrlblType: TQRLabel
        Left = 185
        Top = 3
        Width = 111
        Height = 19
        Size.Values = (
          39.687500000000000000
          391.583333333333000000
          5.291666666666670000
          235.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblType'
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
    object FormRefGroup: TQRGroup
      Left = 47
      Top = 233
      Width = 1309
      Height = 30
      AlignToBottom = False
      BeforePrint = FormRefGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = FormRefFooter
      Master = OrderDetail
      ReprintOnNewPage = False
      object QRLabel3: TQRLabel
        Left = 30
        Top = 4
        Width = 123
        Height = 19
        Size.Values = (
          40.216666666666670000
          63.500000000000000000
          8.466666666666667000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Reference:'
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
      object qrlblStockReference: TQRLabel
        Left = 180
        Top = 4
        Width = 130
        Height = 19
        Size.Values = (
          40.216666666666670000
          381.000000000000000000
          8.466666666666667000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblStockReference'
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
    object FormRefFooter: TQRBand
      Left = 47
      Top = 289
      Width = 1309
      Height = 32
      AfterPrint = FormRefFooterAfterPrint
      AlignToBottom = False
      BeforePrint = FormRefFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblTotalQtyOut: TQRLabel
        Left = 647
        Top = 9
        Width = 119
        Height = 20
        Size.Values = (
          42.333333333333330000
          1369.483333333333000000
          19.050000000000000000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalQtyOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 271
        Top = 9
        Width = 120
        Height = 20
        Size.Values = (
          42.333333333333330000
          573.616666666666700000
          19.050000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total for product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormSellTotalIn: TQRLabel
        Left = 473
        Top = 9
        Width = 130
        Height = 20
        Size.Values = (
          42.333333333333330000
          1001.183333333333000000
          19.050000000000000000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormSellTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormCostTotalIn: TQRLabel
        Left = 558
        Top = 9
        Width = 136
        Height = 20
        Size.Values = (
          42.333333333333330000
          1181.100000000000000000
          19.050000000000000000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormCostTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormSellTotalOut: TQRLabel
        Left = 718
        Top = 9
        Width = 143
        Height = 20
        Size.Values = (
          42.333333333333330000
          1519.766666666667000000
          19.050000000000000000
          302.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormSellTotalOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormCostTotalOut: TQRLabel
        Left = 808
        Top = 9
        Width = 149
        Height = 20
        Size.Values = (
          42.333333333333330000
          1710.266666666667000000
          19.050000000000000000
          315.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormCostTotalOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape8: TQRShape
        Left = 438
        Top = 4
        Width = 520
        Height = 6
        Size.Values = (
          13.229166666666700000
          926.041666666667000000
          7.937500000000000000
          1100.666666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalQtyIn: TQRLabel
        Left = 404
        Top = 9
        Width = 106
        Height = 20
        Size.Values = (
          42.333333333333330000
          855.133333333333300000
          19.050000000000000000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalQtyIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object CustFooter: TQRBand
      Left = 47
      Top = 321
      Width = 1309
      Height = 32
      AfterPrint = CustFooterAfterPrint
      AlignToBottom = False
      BeforePrint = CustFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel14: TQRLabel
        Left = 273
        Top = 10
        Width = 134
        Height = 20
        Size.Values = (
          42.333333333333330000
          577.850000000000000000
          21.166666666666670000
          283.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total for Customer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustSellTotalIn: TQRLabel
        Left = 478
        Top = 10
        Width = 127
        Height = 20
        Size.Values = (
          42.333333333333330000
          1011.766666666667000000
          21.166666666666670000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape2: TQRShape
        Left = 438
        Top = 0
        Width = 520
        Height = 11
        Size.Values = (
          23.812500000000000000
          926.041666666667000000
          0.000000000000000000
          1100.666666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblCustCostTotalIn: TQRLabel
        Left = 581
        Top = 10
        Width = 114
        Height = 20
        Size.Values = (
          42.333333333333330000
          1229.783333333333000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustSellTotalOut: TQRLabel
        Left = 746
        Top = 10
        Width = 114
        Height = 20
        Size.Values = (
          42.333333333333330000
          1579.033333333333000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustCostTotalOut: TQRLabel
        Left = 843
        Top = 10
        Width = 114
        Height = 20
        Size.Values = (
          42.333333333333330000
          1784.350000000000000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object ReportGroup: TQRGroup
      Left = 47
      Top = 193
      Width = 1309
      Height = 10
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        21.166666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = ReportGroupFooter
      Master = QuickReport
      ReprintOnNewPage = False
    end
    object ReportGroupFooter: TQRBand
      Left = 47
      Top = 353
      Width = 1309
      Height = 48
      AlignToBottom = False
      BeforePrint = ReportGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        101.600000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel5: TQRLabel
        Left = 274
        Top = 10
        Width = 98
        Height = 20
        Size.Values = (
          42.333333333333330000
          579.966666666666700000
          21.166666666666670000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepSellIn: TQRLabel
        Left = 477
        Top = 10
        Width = 127
        Height = 20
        Size.Values = (
          42.333333333333330000
          1009.650000000000000000
          21.166666666666670000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepCostIn: TQRLabel
        Left = 579
        Top = 10
        Width = 114
        Height = 20
        Size.Values = (
          42.333333333333330000
          1225.550000000000000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepSellOut: TQRLabel
        Left = 744
        Top = 10
        Width = 114
        Height = 20
        Size.Values = (
          42.333333333333330000
          1574.800000000000000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepCostOut: TQRLabel
        Left = 842
        Top = 10
        Width = 114
        Height = 20
        Size.Values = (
          42.333333333333330000
          1782.233333333333000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape7: TQRShape
        Left = 438
        Top = 0
        Width = 520
        Height = 11
        Size.Values = (
          23.812500000000000000
          926.041666666667000000
          0.000000000000000000
          1100.666666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryReport: TFDQuery
    OnCalcFields = qryReportCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Delivery_Detail.Purchase_Order,'
      '        Delivery_Detail.Line,'
      '        Delivery_Detail.Delivery_no,'
      '        Delivery_Detail.Ad_hoc_Address,'
      '        Delivery_Detail.Supplier,'
      '        Delivery_Detail.Branch_no,'
      '        Delivery_Detail.Rep,'
      '        Delivery_Detail.Qty_to_Deliver,'
      '        Delivery_Detail.Qty_Delivered,'
      '        Delivery_Detail.Qty_Invoiced,'
      '        Delivery_Detail.Date_Point,'
      '        Delivery_Detail.Branch_No0,'
      '        Delivery_Detail.Customer,'
      '        Delivery_Detail.Deliver_via_Company,'
      '        Delivery_Detail.Date_Deliv_Actual,'
      '        Delivery_Detail.Delivery_to_Stock,'
      '        Delivery_Detail.Delivery_note_printed,'
      '        Purchase_OrderLine.Customer AS Order_Customer,'
      '        Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Purch_Ord_Line_Status,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Branch_No AS Supplier_Branch,'
      '        Supplier.Name AS Supplier_Name,'
      '        Customer.Name AS Customer_Name,'
      '        Purch_Ord_Line_Status.Description AS Order_Status,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Stock_Reference,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Price_Unit.Description as Sell_Unit_Descr,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Purchase_OrderLine.Order_Price'
      'FROM Price_Unit'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Supplier'
      '  INNER JOIN ((Purch_Ord_Line_Status'
      '  INNER JOIN (Form_Reference'
      '  RIGHT JOIN (Customer'
      '  INNER JOIN Purchase_OrderLine ON'
      '    Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '    Form_Reference.Form_Reference = Purchase_OrderLine.Form_Refe' +
        'rence) ON'
      
        '    Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Order' +
        'Line.Purch_Ord_Line_Status)'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Purchase_Order'
      '  INNER JOIN Delivery_Detail ON'
      
        '    Purchase_Order.Purchase_Order = Delivery_Detail.Purchase_Ord' +
        'er) ON'
      '    (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '    (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ON'
      
        '    (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) AND'
      '    (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order)) ON'
      '    Supplier.Supplier = Purchase_Order.Supplier) ON'
      
        '    (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) A' +
        'ND'
      '    (Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON'
      '    Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit'
      'WHERE'
      '('
      '((Delivery_Detail.Delivery_to_Stock)='#39'Y'#39')) OR'
      
        '(((round([Purchase_OrderLine].[Purchase_Order],0))=[Purchase_Ord' +
        'erLine].[Original_Order])'
      ')')
    Left = 32
    Top = 64
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryReportAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object qryReportSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryReportRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryReportQty_to_Deliver: TFloatField
      FieldName = 'Qty_to_Deliver'
    end
    object qryReportQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryReportQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportBranch_No0: TIntegerField
      FieldName = 'Branch_No0'
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportDeliver_via_Company: TWideStringField
      FieldName = 'Deliver_via_Company'
      Size = 1
    end
    object qryReportDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryReportDelivery_to_Stock: TWideStringField
      FieldName = 'Delivery_to_Stock'
      Size = 1
    end
    object qryReportDelivery_note_printed: TWideStringField
      FieldName = 'Delivery_note_printed'
      Size = 1
    end
    object qryReportOrder_Customer: TIntegerField
      FieldName = 'Order_Customer'
    end
    object qryReportCustomer_Branch: TIntegerField
      FieldName = 'Customer_Branch'
    end
    object qryReportCust_order_no: TWideStringField
      FieldName = 'Cust_order_no'
      Size = 40
    end
    object qryReportPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryReportSupplier_1: TIntegerField
      FieldName = 'Supplier_1'
    end
    object qryReportSupplier_Branch: TIntegerField
      FieldName = 'Supplier_Branch'
    end
    object qryReportSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      Size = 40
    end
    object qryReportCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Size = 40
    end
    object qryReportOrder_Status: TWideStringField
      FieldName = 'Order_Status'
      Size = 40
    end
    object qryReportQty_In: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_In'
      OnGetText = qryReportQty_InGetText
      Calculated = True
    end
    object qryReportQty_Out: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_Out'
      OnGetText = qryReportQty_OutGetText
      Calculated = True
    end
    object qryReportDeliveryName: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryName'
      Size = 50
      Calculated = True
    end
    object qryReportCustomers_Desc: TWideStringField
      FieldName = 'Customers_Desc'
      Size = 80
    end
    object qryReportForm_Reference_ID: TWideStringField
      FieldName = 'Form_Reference_ID'
      Size = 50
    end
    object qryReportPOrder: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'POrder'
      OnGetText = qryReportPOrderGetText
      Calculated = True
    end
    object qryReportSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryReportSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qryReportSell_Unit_Descr: TWideStringField
      FieldName = 'Sell_Unit_Descr'
      FixedChar = True
      Size = 80
    end
    object qryReportPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryReportOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryReportStock_Reference: TWideStringField
      FieldName = 'Stock_Reference'
      FixedChar = True
      Size = 30
    end
    object qryReportForm_Reference_Descr: TWideStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 41
    Top = 336
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
      end>
  end
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Rep'
      'where Rep = :Rep')
    Left = 114
    Top = 336
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Supplier.Name as Supplier_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Supplier_Branch, Supplier'
      'where Supplier_Branch.Supplier = :Supplier and'
      #9#9#9'Supplier_Branch.Branch_no = :Branch_no and'
      '        Supplier_Branch.Supplier = Supplier.Supplier'
      ' ')
    Left = 187
    Top = 336
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Company'
      'where Company = 1')
    Left = 261
    Top = 336
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Customer_Branch.Name as Branch_Name'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 334
    Top = 336
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
end
