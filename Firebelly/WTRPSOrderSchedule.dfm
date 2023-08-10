object frmwtRPSOrderSchedule: TfrmwtRPSOrderSchedule
  Left = 43
  Top = 110
  Caption = 'Sales Order Scheduling Report'
  ClientHeight = 576
  ClientWidth = 1117
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
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
      Top = 181
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
      object qrlblPhone: TQRLabel
        Left = 340
        Top = 10
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          719.666666666666700000
          21.166666666666670000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone Number:'
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
      object qrPhoneText: TQRDBText
        Left = 440
        Top = 10
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          931.333333333333300000
          21.166666666666670000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'telephone_number'
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
      Height = 134
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.633333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 511
        Top = 10
        Width = 270
        Height = 24
        Size.Values = (
          50.800000000000000000
          1081.616666666667000000
          21.166666666666670000
          571.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Orders Schedule Report'
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
        Left = 10
        Top = 111
        Width = 70
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          234.950000000000000000
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
      object QRLabel5: TQRLabel
        Left = 100
        Top = 111
        Width = 126
        Height = 21
        Size.Values = (
          44.450000000000000000
          211.666666666666700000
          234.950000000000000000
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
        Left = 370
        Top = 111
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          783.166666666666700000
          234.950000000000000000
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
        Left = 1229
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2601.383333333333000000
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
      object qrlblWeek1: TQRLabel
        Left = 720
        Top = 111
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
          234.950000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek1'
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
      object qrlblWeek2: TQRLabel
        Left = 806
        Top = 111
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          1706.033333333333000000
          234.950000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek2'
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
      object qrlblWeek3: TQRLabel
        Left = 893
        Top = 111
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          1890.183333333333000000
          234.950000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek3'
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
      object qrlblWeek4: TQRLabel
        Left = 979
        Top = 111
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          2072.216666666667000000
          234.950000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek4'
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
      object qrlblWeek5: TQRLabel
        Left = 1065
        Top = 111
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          2254.250000000000000000
          234.950000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek5'
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
      object qrlblWeek6: TQRLabel
        Left = 1151
        Top = 111
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          2436.283333333333000000
          234.950000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek6'
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
        Left = 560
        Top = 111
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          1185.333333333333000000
          234.950000000000000000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Materials'
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
      object qrlblOverdueDate: TQRLabel
        Left = 631
        Top = 111
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          1335.616666666667000000
          234.950000000000000000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prior Periods'
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
      object qrlblFutureDate: TQRLabel
        Left = 1234
        Top = 111
        Width = 38
        Height = 21
        Size.Values = (
          44.450000000000000000
          2611.966666666667000000
          234.950000000000000000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Future'
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
      object QRShape1: TQRShape
        Left = 630
        Top = 90
        Width = 656
        Height = 10
        Size.Values = (
          21.166666666666670000
          1333.500000000000000000
          190.500000000000000000
          1389.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 910
        Top = 85
        Width = 131
        Height = 19
        Size.Values = (
          40.216666666666670000
          1926.166666666667000000
          179.916666666666700000
          277.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '  Week Commencing  '
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
        Left = 10
        Top = 10
        Width = 28
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          21.166666666666670000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Key:'
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
        Left = 70
        Top = 10
        Width = 109
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          21.166666666666670000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Materials Required'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
        Left = 70
        Top = 57
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          120.650000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Date'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
        Left = 70
        Top = 81
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          171.450000000000000000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date'
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
        Left = 70
        Top = 34
        Width = 110
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          71.966666666666670000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Materials Received'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      Top = 213
      Width = 1309
      Height = 50
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
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
      object QRShape2: TQRShape
        Left = 546
        Top = 0
        Width = 681
        Height = 49
        Size.Values = (
          103.187500000000000000
          1156.229166666667000000
          0.000000000000000000
          1441.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 624
        Top = 0
        Width = 522
        Height = 49
        Size.Values = (
          103.187500000000000000
          1320.270833333333000000
          0.000000000000000000
          1105.958333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 709
        Top = 0
        Width = 351
        Height = 49
        Size.Values = (
          103.187500000000000000
          1500.187500000000000000
          0.000000000000000000
          743.479166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 795
        Top = 0
        Width = 177
        Height = 49
        Size.Values = (
          103.187500000000000000
          1682.750000000000000000
          0.000000000000000000
          375.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText2: TQRDBText
        Left = 10
        Top = 5
        Width = 73
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          10.583333333333330000
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
      object QRDBText5: TQRDBText
        Left = 360
        Top = 5
        Width = 181
        Height = 19
        Size.Values = (
          39.687500000000000000
          762.000000000000000000
          10.583333333333330000
          383.645833333333300000)
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
        Left = 100
        Top = 5
        Width = 251
        Height = 19
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          10.583333333333330000
          531.812500000000000000)
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
      object qrdbTemplateDate: TQRDBText
        Left = 635
        Top = 5
        Width = 88
        Height = 19
        Size.Values = (
          40.216666666666670000
          1344.083333333333000000
          10.583333333333330000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clRed
        DataSet = qrySalesOrders
        DataField = 'Template_Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
        Left = 100
        Top = 25
        Width = 441
        Height = 19
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          52.916666666666670000
          933.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object qrlblMatDate: TQRLabel
        Left = 550
        Top = 5
        Width = 74
        Height = 19
        Size.Values = (
          40.216666666666670000
          1164.166666666667000000
          10.583333333333330000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblMatDate'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      object QRShape6: TQRShape
        Left = 882
        Top = 0
        Width = 8
        Height = 49
        Size.Values = (
          103.187500000000000000
          1867.958333333333000000
          0.000000000000000000
          15.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlblMatReceived: TQRLabel
        Left = 550
        Top = 25
        Width = 74
        Height = 19
        Size.Values = (
          40.216666666666670000
          1164.166666666667000000
          52.916666666666670000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblMatDate'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object qrdbFittingDate: TQRDBText
        Left = 795
        Top = 3
        Width = 86
        Height = 19
        Size.Values = (
          40.216666666666670000
          1682.750000000000000000
          6.350000000000000000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clGreen
        DataSet = qrySalesOrders
        DataField = 'Date_Required'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      object qrlblOnHold: TQRLabel
        Left = 1230
        Top = 5
        Width = 59
        Height = 19
        Size.Values = (
          40.216666666666670000
          2603.500000000000000000
          10.583333333333330000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ON HOLD'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Sales_Order_Line.Nett_Price,'
      '        Sales_Order_Line.Discount_Value,'
      '        Sales_Order_Line.Installation_price,'
      '        Sales_Order_Line.Survey_price,'
      '        Sales_Order_Line.Delivery_Price,'
      '        Sales_Order_Line.Vat,'
      '        Sales_Order_Line.Description,'
      '        Vat.Vat_Rate,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order_Line.Unit_price,'
      '        Sales_Order_Line.Job,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Materials_Required,'
      '        Sales_Order.Materials_Reqd_date,'
      '        Sales_Order.Materials_Recd_date,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Date_Type,'
      '        Customer.Telephone_number,'
      '        Sales_Order.On_Hold'
      'FROM Sales_Order_Status'
      '        INNER JOIN ((Customer'
      '        INNER JOIN Sales_Order'
      '          ON Customer.Customer = Sales_Order.Customer)'
      '        INNER JOIN (Vat'
      '        INNER JOIN Sales_Order_Line'
      '          ON Vat.Vat = Sales_Order_Line.Vat)'
      
        '          ON (Vat.Vat = Customer.Vat) AND (Sales_Order.Sales_Ord' +
        'er = Sales_Order_Line.Sales_Order))'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status'
      
        'WHERE ((Sales_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      
        '((Sales_Order.Date_Required >= :Date_From) and (Sales_Order.Date' +
        '_Required <= :Date_To)) and'
      'Sales_Order_Status.Sales_Order_Status < 60'
      '')
    Left = 108
    Top = 302
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
    object qrySalesOrdersSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      Required = True
    end
    object qrySalesOrdersSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
      Origin = 'Sales_order_Line_no'
      Required = True
    end
    object qrySalesOrdersNett_Price: TCurrencyField
      FieldName = 'Nett_Price'
      Origin = 'Nett_Price'
    end
    object qrySalesOrdersDiscount_Value: TCurrencyField
      FieldName = 'Discount_Value'
      Origin = 'Discount_Value'
    end
    object qrySalesOrdersInstallation_price: TCurrencyField
      FieldName = 'Installation_price'
      Origin = 'Installation_price'
    end
    object qrySalesOrdersSurvey_price: TCurrencyField
      FieldName = 'Survey_price'
      Origin = 'Survey_price'
    end
    object qrySalesOrdersDelivery_Price: TCurrencyField
      FieldName = 'Delivery_Price'
      Origin = 'Delivery_Price'
    end
    object qrySalesOrdersVat: TIntegerField
      FieldName = 'Vat'
      Origin = 'Vat'
    end
    object qrySalesOrdersDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 255
    end
    object qrySalesOrdersVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      Origin = 'Vat_Rate'
      Required = True
    end
    object qrySalesOrdersQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
    end
    object qrySalesOrdersUnit_price: TCurrencyField
      FieldName = 'Unit_price'
      Origin = 'Unit_price'
      Required = True
    end
    object qrySalesOrdersJob: TFloatField
      FieldName = 'Job'
      Origin = 'Job'
    end
    object qrySalesOrdersDate_Raised: TSQLTimeStampField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qrySalesOrdersDate_Required: TSQLTimeStampField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
    end
    object qrySalesOrdersSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
      Origin = 'Sales_Order_Status'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySalesOrdersSales_Order_Status_Desc: TWideStringField
      FieldName = 'Sales_Order_Status_Desc'
      Origin = 'Sales_Order_Status_Desc'
      Required = True
      Size = 30
    end
    object qrySalesOrdersTemplate_Date: TSQLTimeStampField
      FieldName = 'Template_Date'
      Origin = 'Template_Date'
    end
    object qrySalesOrdersInstall_Address: TIntegerField
      FieldName = 'Install_Address'
      Origin = 'Install_Address'
    end
    object qrySalesOrdersCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Size = 50
    end
    object qrySalesOrdersReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Required = True
      Size = 50
    end
    object qrySalesOrdersMaterials_Required: TWideStringField
      FieldName = 'Materials_Required'
      Origin = 'Materials_Required'
      Size = 1
    end
    object qrySalesOrdersMaterials_Reqd_date: TSQLTimeStampField
      FieldName = 'Materials_Reqd_date'
      Origin = 'Materials_Reqd_date'
    end
    object qrySalesOrdersMaterials_Recd_date: TSQLTimeStampField
      FieldName = 'Materials_Recd_date'
      Origin = 'Materials_Recd_date'
    end
    object qrySalesOrdersSales_Order_Status_1: TIntegerField
      FieldName = 'Sales_Order_Status_1'
      Origin = 'Sales_Order_Status'
      Required = True
    end
    object qrySalesOrdersSales_Order_Status_Desc_1: TWideStringField
      FieldName = 'Sales_Order_Status_Desc_1'
      Origin = 'Sales_Order_Status_Desc'
      Required = True
      Size = 30
    end
    object qrySalesOrdersDate_Type: TWideStringField
      FieldName = 'Date_Type'
      Origin = 'Date_Type'
      Size = 1
    end
    object qrySalesOrdersTelephone_number: TWideStringField
      FieldName = 'Telephone_number'
      Origin = 'Telephone_number'
      Size = 30
    end
    object qrySalesOrdersOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      Origin = 'On_Hold'
      Size = 1
    end
  end
end
