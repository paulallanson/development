object PBRPOSSInvPInvRecdFrm: TPBRPOSSInvPInvRecdFrm
  Left = 2
  Top = 115
  Caption = 'Oustanding Invoicing - Purchase Invoice Received Report'
  ClientHeight = 570
  ClientWidth = 1177
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
  object qrReport: TQuickRep
    Left = 0
    Top = 0
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrReportBeforePrint
    DataSet = qryOSInvs
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
    object qrbndPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 154
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
        325.966666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 331
        Top = 10
        Width = 646
        Height = 29
        Size.Values = (
          61.383333333333330000
          700.616666666666700000
          21.166666666666670000
          1367.366666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Oustanding Invoicing Report (Purchase Invoice Received)'
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
      object QRLabel13: TQRLabel
        Left = 1166
        Top = 10
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          2468.033333333333000000
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
      object QRSysData1: TQRSysData
        Left = 1236
        Top = 10
        Width = 46
        Height = 21
        Size.Values = (
          44.450000000000000000
          2616.200000000000000000
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
      object QRLabel2: TQRLabel
        Left = 30
        Top = 130
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          63.500000000000000000
          275.166666666666700000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
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
      object QRLabel12: TQRLabel
        Left = 1049
        Top = 110
        Width = 63
        Height = 41
        Size.Values = (
          87.312500000000000000
          2219.854166666667000000
          232.833333333333300000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Selling Price'
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
      object QRLabel1: TQRLabel
        Left = 170
        Top = 130
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          359.833333333333300000
          275.166666666666700000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
        Left = 90
        Top = 130
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          190.500000000000000000
          275.166666666666700000
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
      object QRLabel3: TQRLabel
        Left = 1130
        Top = 130
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          2391.833333333333000000
          275.166666666666700000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sell Unit'
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
      object QRLabel5: TQRLabel
        Left = 360
        Top = 130
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          762.000000000000000000
          275.166666666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
        Left = 740
        Top = 110
        Width = 71
        Height = 41
        Size.Values = (
          87.312500000000000000
          1566.333333333333000000
          232.833333333333300000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Order Quantity'
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
      object QRLabel9: TQRLabel
        Left = 820
        Top = 110
        Width = 81
        Height = 41
        Size.Values = (
          87.312500000000000000
          1735.666666666667000000
          232.833333333333300000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Quantity to Invoice'
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
        Left = 1212
        Top = 130
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          2565.400000000000000000
          275.166666666666700000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Price'
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
        Left = 981
        Top = 94
        Width = 71
        Height = 56
        Size.Values = (
          119.062500000000000000
          2076.979166666667000000
          198.437500000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Stock Invoice upfront'
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
        Left = 920
        Top = 110
        Width = 61
        Height = 41
        Size.Values = (
          87.312500000000000000
          1947.333333333333000000
          232.833333333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Last Delivery'
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
        Left = 670
        Top = 130
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          1418.166666666667000000
          275.166666666666700000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
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
      object qrlblSelection: TQRLabel
        Left = 620
        Top = 42
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1312.333333333333000000
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
        Left = 627
        Top = 65
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          1327.150000000000000000
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
      object QRSysData2: TQRSysData
        Left = 1217
        Top = 50
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2575.983333333333000000
          105.833333333333300000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 259
      Width = 1309
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object RepQRGroup: TQRGroup
      Left = 47
      Top = 259
      Width = 1309
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qrySalesComm.Name'
      Master = QRSubDetail1
      ReprintOnNewPage = False
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 233
      Width = 1309
      Height = 1
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2.116666666666667000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 294
      Width = 1309
      Height = 35
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel21: TQRLabel
        Left = 950
        Top = 10
        Width = 110
        Height = 20
        Size.Values = (
          42.333333333333330000
          2010.833333333333000000
          21.166666666666670000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reports Totals:'
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
      object QRShape3: TQRShape
        Left = 1139
        Top = -5
        Width = 154
        Height = 16
        Size.Values = (
          34.395833333333300000
          2410.354166666670000000
          -10.583333333333300000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblReportTotal: TQRLabel
        Left = 1189
        Top = 10
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          2516.716666666667000000
          21.166666666666670000
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
    end
    object repQRGroup1: TQRGroup
      Left = 47
      Top = 201
      Width = 1309
      Height = 32
      AlignToBottom = False
      BeforePrint = repQRGroup1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryOSInvs.rep_name'
      FooterBand = qrGroupFooter
      Master = qrReport
      ReprintOnNewPage = False
      object qrlblGroupTitle: TQRLabel
        Left = 11
        Top = 10
        Width = 35
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          21.166666666666670000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'REP'
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
      object qrdbGroupName: TQRDBText
        Left = 160
        Top = 10
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          338.666666666666700000
          21.166666666666670000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'rep_name'
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
    end
    object qrGroupFooter: TQRBand
      Left = 47
      Top = 259
      Width = 1309
      Height = 35
      AfterPrint = qrGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblGroupTotal: TQRLabel
        Left = 1192
        Top = 8
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2523.066666666667000000
          16.933333333333330000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGroupTotal'
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
        Left = 1139
        Top = -5
        Width = 154
        Height = 16
        Size.Values = (
          34.395833333333300000
          2410.354166666670000000
          -10.583333333333300000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblFooter: TQRLabel
        Left = 1067
        Top = 10
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          2258.483333333333000000
          21.166666666666670000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblFooter'
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
    object QRChildBandProd: TQRChildBand
      Left = 47
      Top = 234
      Width = 1309
      Height = 25
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      PrintOrder = cboAfterParent
      object QRDBText5: TQRDBText
        Left = 873
        Top = 0
        Width = 108
        Height = 21
        Size.Values = (
          44.450000000000000000
          1847.850000000000000000
          0.000000000000000000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Last_delivery_date'
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
      object qrlblInvUpfront: TQRLabel
        Left = 990
        Top = 0
        Width = 51
        Height = 21
        Size.Values = (
          44.979166666666670000
          2095.500000000000000000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblInvUpfront'
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
      object QRDBText7: TQRDBText
        Left = 1092
        Top = 0
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2311.400000000000000000
          0.000000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Sales_Unit_Desc'
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
        Left = 10
        Top = 0
        Width = 61
        Height = 21
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          0.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Purchase_Order'
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
        Left = 90
        Top = 0
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          190.500000000000000000
          0.000000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Date_point'
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
        Left = 170
        Top = 0
        Width = 181
        Height = 21
        Size.Values = (
          44.979166666666700000
          359.833333333333000000
          0.000000000000000000
          383.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
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
      object QRDBText3: TQRDBText
        Left = 360
        Top = 0
        Width = 301
        Height = 21
        Size.Values = (
          44.979166666666700000
          762.000000000000000000
          0.000000000000000000
          637.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Customers_Desc'
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
      object qrlblQtyToInv: TQRLabel
        Left = 825
        Top = 0
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          1746.250000000000000000
          0.000000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQtyToInv'
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
      object QRDBText6: TQRDBText
        Left = 1040
        Top = 0
        Width = 71
        Height = 21
        Size.Values = (
          44.979166666666670000
          2201.333333333333000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Selling_Price'
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
      object qrlblSalesValue: TQRLabel
        Left = 1201
        Top = 0
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          2542.116666666667000000
          0.000000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSalesValue'
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
      object QRDBText13: TQRDBText
        Left = 681
        Top = 0
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          1441.450000000000000000
          0.000000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Job_Bag'
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
        Left = 761
        Top = 0
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1610.783333333333000000
          0.000000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Quantity'
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
  end
  object qryOSInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purchase_OrderLine.Purchase_Order,'
      'Purchase_OrderLine.Line,'
      'Purchase_OrderLine.Customer,'
      'Purchase_OrderLine.Branch_no,'
      'Purchase_OrderLine.Quantity,'
      'Purchase_OrderLine.Selling_Price,'
      'Purchase_OrderLine.Sell_Unit,'
      'Purchase_OrderLine.Supp_Inv_Recd,'
      'Purchase_OrderLine.Customers_Desc,'
      'Purchase_OrderLine.Qty_Invoiced,'
      '(select sum(Qty_Delivered)'
      ' from Delivery_Detail'
      
        ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      '   and Delivery_Detail.Line = Purchase_OrderLine.Line'
      '   and ((Delivery_Detail.delivery_to_Stock is null) or'
      '        (Delivery_Detail.delivery_to_Stock = '#39'N'#39'))'
      ') as Qty_Delivered,'
      '(select sum(Qty_Delivered)'
      ' from Delivery_Detail'
      
        ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      '   and Delivery_Detail.Line = Purchase_OrderLine.Line'
      ') as Total_Delivered,'
      'Customer.Name as Customer_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'Purch_Ord_Line_Status.Description as Status_Description,'
      'Vat_code.Vat_Rate,'
      'Customer.Vat_Code_Def as Customer_Vat_Code,'
      'Purchase_Order.Currency_Code,'
      'Price_Unit.Description as Sales_Unit_Desc,'
      'Price_Unit.Price_Unit_Factor,'
      'Customer_Branch.Inv_to_Customer,'
      'Customer_Branch.Inv_to_Branch,'
      'Purchase_order.Date_point,'
      'Rep.name as rep_name,'
      '(select Job_Bag from Job_Bag_Line_Dets'
      
        'where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLine.Purc' +
        'hase_Order) as Job_Bag'
      'FROM'
      '((((((Purchase_OrderLine'
      
        'INNER JOIN Purch_Ord_Line_Status on (Purchase_OrderLine.Purch_Or' +
        'd_Line_Status = Purch_Ord_Line_Status.Purch_Ord_Line_Status))'
      
        'INNER JOIN Customer on (Purchase_OrderLine.Customer = Customer.C' +
        'ustomer))'
      
        'INNER JOIN Customer_Branch on ((Purchase_OrderLine.Customer = Cu' +
        'stomer_Branch.Customer) AND'
      
        '                               (Purchase_OrderLine.Branch_no = C' +
        'ustomer_Branch.Branch_no)))'
      
        'INNER JOIN VAT_Code on (Customer.VAT_Code_Def = VAT_Code.VAT_Cod' +
        'e))'
      
        'INNER JOIN Purchase_Order on (Purchase_OrderLine.Purchase_Order ' +
        '= Purchase_Order.Purchase_Order))'
      
        'INNER JOIN Price_Unit on (Purchase_OrderLine.Sell_Unit = Price_U' +
        'nit.Price_Unit))'
      'INNER JOIN Rep on (Purchase_orderline.rep = rep.rep)'
      'WHERE  (((Delivery_Detail.Delivery_to_Stock)<>'#39'Y'#39') And'
      '        ((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<25) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null)) Or'
      '        (((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<25) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null) And'
      '        ((Purchase_OrderLine.Invoice_upfront)='#39'Y'#39'))'
      ''
      ''
      ' '
      ''
      ' '
      ''
      ' '
      ''
      ' ')
    Left = 39
    Top = 8
  end
  object oldqryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purchase_OrderLine.Purchase_Order,'
      'Purchase_OrderLine.Line,'
      'Purchase_OrderLine.Customer,'
      'Purchase_OrderLine.Branch_no,'
      'Purchase_OrderLine.Quantity,'
      'Purchase_OrderLine.Selling_Price,'
      'Purchase_OrderLine.Sell_Unit,'
      'Purchase_OrderLine.Supp_Inv_Recd,'
      'Purchase_OrderLine.Customers_Desc,'
      'Purchase_OrderLine.Qty_Invoiced,'
      '(select sum(Qty_Delivered)'
      ' from Delivery_Detail'
      
        ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      '   and Delivery_Detail.Line = Purchase_OrderLine.Line'
      '   and ((Delivery_Detail.delivery_to_Stock is null) or'
      '        (Delivery_Detail.delivery_to_Stock = '#39'N'#39'))'
      ') as Qty_Delivered,'
      '(select sum(Qty_Delivered)'
      ' from Delivery_Detail'
      
        ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      '   and Delivery_Detail.Line = Purchase_OrderLine.Line'
      ') as Total_Delivered,'
      'Customer.Name as Customer_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'Purch_Ord_Line_Status.Description as Status_Description,'
      'Vat_code.Vat_Rate,'
      'Customer.Vat_Code_Def as Customer_Vat_Code,'
      'Purchase_Order.Currency_Code,'
      'Price_Unit.Description as Sales_Unit_Desc,'
      'Price_Unit.Price_Unit_Factor,'
      'Customer_Branch.Inv_to_Customer,'
      'Customer_Branch.Inv_to_Branch,'
      'Purchase_order.Date_point,'
      'Rep.name as rep_name'
      'FROM'
      '((((((Purchase_OrderLine'
      
        'INNER JOIN Purch_Ord_Line_Status on (Purchase_OrderLine.Purch_Or' +
        'd_Line_Status = Purch_Ord_Line_Status.Purch_Ord_Line_Status))'
      
        'INNER JOIN Customer on (Purchase_OrderLine.Customer = Customer.C' +
        'ustomer))'
      
        'INNER JOIN Customer_Branch on ((Purchase_OrderLine.Customer = Cu' +
        'stomer_Branch.Customer) AND'
      
        '                               (Purchase_OrderLine.Branch_no = C' +
        'ustomer_Branch.Branch_no)))'
      
        'INNER JOIN VAT_Code on (Customer.VAT_Code_Def = VAT_Code.VAT_Cod' +
        'e))'
      
        'INNER JOIN Purchase_Order on (Purchase_OrderLine.Purchase_Order ' +
        '= Purchase_Order.Purchase_Order))'
      
        'INNER JOIN Price_Unit on (Purchase_OrderLine.Sell_Unit = Price_U' +
        'nit.Price_Unit))'
      'INNER JOIN Rep on (Purchase_orderline.rep = rep.rep)'
      'WHERE  (((Delivery_Detail.Delivery_to_Stock)<>'#39'Y'#39') And'
      '        ((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<25) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null)) Or'
      '        (((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<25) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null) And'
      '        ((Purchase_OrderLine.Invoice_upfront)='#39'Y'#39'))'
      ''
      ' ')
    Left = 104
    Top = 8
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Sum(Delivery_Detail.Qty_Delivered) AS Qty_Delivered,'
      '        (select top 1 Date_deliv_actual'
      '         from Delivery_detail'
      
        '         where (Delivery_detail.Purchase_order = Purchase_OrderL' +
        'ine.purchase_order) and'
      
        '               (Delivery_detail.Line = Purchase_OrderLine.Line) ' +
        'and'
      '               (Delivery_detail.Qty_delivered <> 0)'
      
        '         order by Delivery_detail.date_deliv_actual desc, Delive' +
        'ry_detail.Delivery_no desc) as Last_delivery_date,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_Order.Date_Point,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Invoice_upfront,'
      '        Price_Unit.Description as sales_unit_desc,'
      '        Purchase_OrderLine.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Purchase_OrderLine.Purch_ord_line_status,'
      '        Purch_Ord_Line_Status.Description as Status_Description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Job_Bag from Job_Bag_Line_Dets'
      
        '        where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderL' +
        'ine.Purchase_Order) as Job_Bag,'
      #9'      Supplier.Name as Supplier_Name,'
      '        Operator.Name as Account_Manager'
      'from purchase_orderline,'
      #9'customer, '
      #9'Rep, '
      #9'Price_unit,'
      #9'purch_ord_line_status,'
      #9'Purchase_Order,'
      #9'Delivery_Detail,'
      #9'supplier,'
      '  Operator'
      'WHERE'
      '((Delivery_Detail.Delivery_to_Stock <> '#39'Y'#39') and'
      '('
      '(Purchase_OrderLine.Purch_Ord_Line_Status > :Status) AND'
      '(Purchase_OrderLine.Purch_Ord_Line_Status < 30)'
      ') AND'
      '((Purchase_OrderLine.Inactive <> '#39'Y'#39') Or'
      '      (Purchase_OrderLine.Inactive Is Null)) AND'
      '('
      '(Purchase_OrderLine.Qty_Supp_inv > 0) or'
      '(Purchase_OrderLine.Qty_Supp_inv_Pend > 0)'
      ') AND'
      
        '(Purchase_orderline.Purchase_order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.rep = rep.rep) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.sell_unit = price_unit.Price_unit) and'
      
        '(Purchase_orderline.purch_ord_line_status = purch_ord_line_statu' +
        's.purch_ord_line_status) and'
      '('
      
        '(Purchase_orderline.purchase_order = Delivery_detail.purchase_or' +
        'der) and'
      '(Purchase_orderline.line = Delivery_Detail.line)'
      ') and'
      '(Purchase_Order.Supplier = Supplier.Supplier) and'
      '(Purchase_Order.office_contact = Operator.Operator)) OR'
      '('
      '('
      '(Purchase_OrderLine.Purch_Ord_Line_Status > :Status) AND'
      '(Purchase_OrderLine.Purch_Ord_Line_Status < 30)'
      ') AND'
      '((Purchase_OrderLine.Inactive <> '#39'Y'#39') Or'
      '      (Purchase_OrderLine.Inactive Is Null)) AND'
      '(Purchase_orderline.Invoice_upfront = '#39'Y'#39') AND'
      '('
      '(Purchase_OrderLine.Qty_Supp_inv > 0) or'
      '(Purchase_OrderLine.Qty_Supp_inv_Pend > 0)'
      ') AND'
      
        '(Purchase_orderline.Purchase_order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.rep = rep.rep) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.sell_unit = price_unit.Price_unit) and'
      
        '(Purchase_orderline.purch_ord_line_status = purch_ord_line_statu' +
        's.purch_ord_line_status) and'
      '('
      
        '(Purchase_orderline.purchase_order = Delivery_detail.purchase_or' +
        'der) and'
      '(Purchase_orderline.line = Delivery_Detail.line)'
      ') and'
      '(Purchase_Order.Supplier = Supplier.Supplier) and'
      '(Purchase_Order.office_contact = Operator.Operator))'
      'GROUP BY  Purchase_OrderLine.Purchase_Order,'
      '          Purchase_OrderLine.Line,'
      '          Purchase_OrderLine.Selling_Price,'
      '          Purchase_OrderLine.Qty_Invoiced,'
      '          Purchase_OrderLine.Quantity,'
      '          Purchase_Order.Date_Point,'
      '          Customer.Name,'
      '          Purchase_OrderLine.Customers_Desc,'
      '          Purchase_OrderLine.Invoice_upfront,'
      '          Price_Unit.Description,'
      '          Purchase_OrderLine.Rep,'
      '          Rep.Name,'
      '          Purchase_OrderLine.Purch_ord_line_status,'
      '          Purch_Ord_Line_Status.Description,'
      '          Price_Unit.Price_Unit_Factor,'
      #9'        Supplier.Name,'
      '          Operator.Name'
      'HAVING'
      '      (Purchase_OrderLine.Selling_Price >= :Selling_Price)'
      ''
      ' '
      ' '
      ' ')
    Left = 200
    Top = 16
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Selling_Price'
      end>
  end
  object SQLGetStkInv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT sales_Order_Line.*, Part.Part, Part.Part_Description,Part' +
        '.Price_Unit,'
      '  Customer.Name AS Customer_Name,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Sales_Order_Head_Status.Description as Status_Description,'
      
        '  Sales_Order.Date_Ordered,Price_Unit.Description as Price_Unit_' +
        'Description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  (select distinct part_movement.date_received'
      #9'from part_movement'
      
        #9'where part_movement_reference LIKE '#39'SalesOrd: '#39'+convert(nvarcha' +
        'r(10),Sales_order.Sales_order)) as Pick_date,'
      '  (select distinct purch_ord_line.date_Deliv_actual'
      #9'from purch_ord, purch_ord_line'
      #9'where Purch_ord.Sales_order = Sales_Order.Sales_order and'
      
        #9'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) AS Delivery_d' +
        'ate,'
      '  (select Rep.Name'
      '   '#9'from Sales_OrderRep, Rep'
      
        '        where (Sales_OrderRep.Sales_Order = Sales_Order.Sales_or' +
        'der) and'
      '            (Sales_OrderRep.Rep = Rep.Rep)) as Rep_Name,'
      '    (select Job_Bag from Job_Bag_Line_Dets'
      
        '        where Job_Bag_Line_Dets.Sales_Order = Sales_Order_line.S' +
        'ales_Order AND'
      
        '              Job_Bag_Line_Dets.Sales_Order_Line_no = Sales_Orde' +
        'r_line.Sales_Order_Line_no) as Job_Bag'
      'FROM (((Sales_Order'
      
        '  INNER JOIN sales_Order_Line ON Sales_Order.Sales_Order = sales' +
        '_Order_Line.Sales_Order)'
      '  INNER JOIN (Part'
      
        '  LEFT JOIN Price_Unit ON Part.price_unit = Price_Unit.Price_Uni' +
        't) ON sales_Order_Line.Part = Part.Part)'
      
        '  INNER JOIN Customer_Branch ON (Sales_Order.Branch_no = Custome' +
        'r_Branch.Branch_no) AND (Sales_Order.Customer = Customer_Branch.' +
        'Customer))'
      
        '  INNER JOIN Customer ON Customer_Branch.Customer = Customer.Cus' +
        'tomer'
      
        '  INNER JOIN Sales_order_Head_Status ON Sales_Order.Sales_order_' +
        'Head_Status = Sales_order_Head_Status.Sales_order_Head_Status'
      'where'
      '(Sales_Order.Sales_Order_Head_Status >= 150) AND'
      '(Sales_Order.Sales_Order_Head_Status < 250) AND'
      
        '(Sales_Order_Line.Quantity_Invoiced < Sales_Order_Line.Quantity_' +
        'Delivered)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      '')
    Left = 288
    Top = 32
  end
  object SQLGetStkInv_access: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT sales_Order_Line.*, Part.Part, Part.Part_Description,Part' +
        '.Price_Unit,'
      '  Customer.Name AS Customer_Name,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Sales_Order_Head_Status.Description as Status_Description,'
      
        '  Sales_Order.Date_Ordered,Price_Unit.Description as Price_Unit_' +
        'Description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  (select distinct part_movement.date_received'
      #9'from part_movement'
      
        '  where part_movement_reference LIKE '#39'SalesOrd: '#39'& Sales_order.S' +
        'ales_order) as Pick_date,'
      '  (select distinct purch_ord_line.date_Deliv_actual'
      #9'from purch_ord, purch_ord_line'
      #9'where Purch_ord.Sales_order = Sales_Order.Sales_order and'
      
        #9'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) AS Delivery_d' +
        'ate,'
      '  (select Rep.Name'
      '   '#9'from Sales_OrderRep, Rep'
      
        '        where (Sales_OrderRep.Sales_Order = Sales_Order.Sales_or' +
        'der) and'
      '            (Sales_OrderRep.Rep = Rep.Rep)) as Rep_Name'
      'FROM (((Sales_Order'
      
        '  INNER JOIN sales_Order_Line ON Sales_Order.Sales_Order = sales' +
        '_Order_Line.Sales_Order)'
      '  INNER JOIN (Part'
      
        '  LEFT JOIN Price_Unit ON Part.price_unit = Price_Unit.Price_Uni' +
        't) ON sales_Order_Line.Part = Part.Part)'
      
        '  INNER JOIN Customer_Branch ON (Sales_Order.Branch_no = Custome' +
        'r_Branch.Branch_no) AND (Sales_Order.Customer = Customer_Branch.' +
        'Customer))'
      
        '  INNER JOIN Customer ON Customer_Branch.Customer = Customer.Cus' +
        'tomer'
      
        '  INNER JOIN Sales_order_Head_Status ON Sales_Order.Sales_order_' +
        'Head_Status = Sales_order_Head_Status.Sales_order_Head_Status'
      'WHERE'
      '  (Sales_Order.Sales_Order_Head_Status >= 150) AND'
      '  (Sales_Order.Sales_Order_Head_Status < 250) AND'
      
        '  (Sales_Order_Line.Quantity_Invoiced < Sales_Order_Line.Quantit' +
        'y_Delivered)'
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 352
    Top = 40
  end
  object SQLGetRepName: TFDQuery
    ConnectionName = 'PB'
    Left = 454
    Top = 60
  end
end
