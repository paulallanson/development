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
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1123
    Height = 794
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
      Left = 38
      Top = 145
      Width = 1047
      Height = 26
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      ReprintOnNewPage = False
      object qrlblSortBy: TQRLabel
        Left = 0
        Top = 8
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object qrGroupbyText: TQRDBText
        Left = 96
        Top = 8
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          21.166666666666670000
          211.666666666666700000)
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
      object qrlblPhone: TQRLabel
        Left = 272
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          719.666666666666700000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone Number:'
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
      object qrPhoneText: TQRDBText
        Left = 352
        Top = 8
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          931.333333333333300000
          21.166666666666670000
          238.125000000000000000)
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
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 107
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.104166666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 410
        Top = 8
        Width = 213
        Height = 19
        Size.Values = (
          50.270833333333330000
          1084.791666666667000000
          21.166666666666670000
          563.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Orders Schedule Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 968
        Top = 23
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2561.166666666667000000
          60.854166666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 8
        Top = 89
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          235.479166666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order'
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
      object QRLabel5: TQRLabel
        Left = 80
        Top = 89
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          235.479166666666700000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/Description'
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
      object QRLabel6: TQRLabel
        Left = 296
        Top = 89
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          783.166666666666700000
          235.479166666666700000
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
      object qrlblDateRange: TQRLabel
        Left = 476
        Top = 32
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          84.666666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
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
      object QRSysData2: TQRSysData
        Left = 981
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2595.562500000000000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 576
        Top = 89
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          235.479166666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek1'
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
      object qrlblWeek2: TQRLabel
        Left = 645
        Top = 89
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          235.479166666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek2'
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
      object qrlblWeek3: TQRLabel
        Left = 714
        Top = 89
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1889.125000000000000000
          235.479166666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek3'
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
      object qrlblWeek4: TQRLabel
        Left = 783
        Top = 89
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          2071.687500000000000000
          235.479166666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek4'
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
      object qrlblWeek5: TQRLabel
        Left = 852
        Top = 89
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          2254.250000000000000000
          235.479166666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek5'
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
      object qrlblWeek6: TQRLabel
        Left = 921
        Top = 89
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          2436.812500000000000000
          235.479166666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWeek6'
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
      object QRLabel11: TQRLabel
        Left = 448
        Top = 89
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          235.479166666666700000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Materials'
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
      object qrlblOverdueDate: TQRLabel
        Left = 505
        Top = 89
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          235.479166666666700000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prior Periods'
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
      object qrlblFutureDate: TQRLabel
        Left = 987
        Top = 89
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          2611.437500000000000000
          235.479166666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Future'
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
      object QRShape1: TQRShape
        Left = 504
        Top = 72
        Width = 525
        Height = 8
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
        Left = 728
        Top = 68
        Width = 104
        Height = 15
        Size.Values = (
          39.687500000000000000
          1926.166666666667000000
          179.916666666666700000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '  Week Commencing  '
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 8
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Key:'
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
      object QRLabel4: TQRLabel
        Left = 56
        Top = 8
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          21.166666666666670000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Materials Required'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      object QRLabel7: TQRLabel
        Left = 56
        Top = 46
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          121.708333333333300000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Date'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      object QRLabel8: TQRLabel
        Left = 56
        Top = 65
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          171.979166666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date'
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      object QRLabel9: TQRLabel
        Left = 56
        Top = 27
        Width = 92
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          71.437500000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Materials Received'
        Color = clAqua
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
    object qrsbDetails: TQRSubDetail
      Left = 38
      Top = 171
      Width = 1047
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
        132.291666666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape2: TQRShape
        Left = 437
        Top = 0
        Width = 545
        Height = 39
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
        Left = 499
        Top = 0
        Width = 418
        Height = 39
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
        Left = 567
        Top = 0
        Width = 281
        Height = 39
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
        Left = 636
        Top = 0
        Width = 142
        Height = 39
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
        Left = 8
        Top = 4
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          10.583333333333330000
          164.041666666666700000)
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
      object QRDBText5: TQRDBText
        Left = 288
        Top = 4
        Width = 145
        Height = 15
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
      object QRDBText6: TQRDBText
        Left = 80
        Top = 4
        Width = 201
        Height = 15
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
      object qrdbTemplateDate: TQRDBText
        Left = 508
        Top = 4
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          1344.083333333333000000
          10.583333333333330000
          190.500000000000000000)
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
      object qrdbDescription: TQRDBText
        Left = 80
        Top = 20
        Width = 353
        Height = 15
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
      object qrlblMatDate: TQRLabel
        Left = 440
        Top = 4
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1164.166666666667000000
          10.583333333333330000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblMatDate'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      object QRShape6: TQRShape
        Left = 706
        Top = 0
        Width = 6
        Height = 39
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
        Left = 440
        Top = 20
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1164.166666666667000000
          52.916666666666670000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblMatDate'
        Color = clAqua
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
      object qrdbFittingDate: TQRDBText
        Left = 636
        Top = 2
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          1682.750000000000000000
          5.291666666666667000
          190.500000000000000000)
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
      object qrlblOnHold: TQRLabel
        Left = 984
        Top = 4
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          2603.500000000000000000
          10.583333333333330000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ON HOLD'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
