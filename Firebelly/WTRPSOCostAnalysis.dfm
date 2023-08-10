object frmWTRPSOCostAnalysis: TfrmWTRPSOCostAnalysis
  Left = 43
  Top = 110
  Caption = 'Sales Order Cost Analysis Report'
  ClientHeight = 576
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
        Left = 100
        Top = 10
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          211.666666666666700000
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
    object qrsbDetails: TQRSubDetail
      Left = 47
      Top = 192
      Width = 1309
      Height = 29
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
        61.383333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
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
      object qrdbDate: TQRDBText
        Left = 86
        Top = 1
        Width = 75
        Height = 19
        Enabled = False
        Size.Values = (
          40.216666666666670000
          182.033333333333300000
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
        Left = 400
        Top = 1
        Width = 191
        Height = 19
        Size.Values = (
          39.687500000000000000
          846.666666666666600000
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
        Left = 170
        Top = 1
        Width = 231
        Height = 19
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          2.645833333333333000
          489.479166666666600000)
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
      object QRDBText4: TQRDBText
        Left = 973
        Top = 1
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          2059.516666666667000000
          2.116666666666667000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object QRDBText10: TQRDBText
        Left = 730
        Top = 1
        Width = 111
        Height = 19
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          2.645833333333333000
          235.479166666666700000)
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
      object gtQRDBText2: TQRDBText
        Left = 844
        Top = 1
        Width = 111
        Height = 19
        Size.Values = (
          39.687500000000000000
          1785.937500000000000000
          2.645833333333333000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
      object qrlblCost: TQRLabel
        Left = 1091
        Top = 0
        Width = 52
        Height = 19
        Size.Values = (
          40.216666666666670000
          2309.283333333333000000
          0.000000000000000000
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
      object qrlblCostPerc: TQRLabel
        Left = 1222
        Top = 0
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          2586.566666666667000000
          0.000000000000000000
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
      object gtQRDBText1: TQRDBText
        Left = 590
        Top = 1
        Width = 121
        Height = 19
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          2.645833333333333000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
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
        FontSize = 8
      end
      object qrlblMargin: TQRLabel
        Left = 1172
        Top = 0
        Width = 64
        Height = 19
        Size.Values = (
          40.216666666666670000
          2480.733333333333000000
          0.000000000000000000
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
      object qrlblReportDate: TQRLabel
        Left = 80
        Top = 1
        Width = 90
        Height = 19
        Size.Values = (
          40.216666666666670000
          169.333333333333300000
          2.116666666666667000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblReportDate'
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
      Top = 221
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
      object qrlblCustPerc: TQRLabel
        Left = 1215
        Top = 9
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          2571.750000000000000000
          19.050000000000000000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustPerc'
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
        Left = 1134
        Top = 9
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2400.300000000000000000
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
        Left = 1060
        Top = 9
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2243.666666666667000000
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
      object qrlblCustGoods: TQRLabel
        Left = 954
        Top = 9
        Width = 97
        Height = 21
        Size.Values = (
          44.450000000000000000
          2019.300000000000000000
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
        Left = 790
        Top = 9
        Width = 124
        Height = 21
        Size.Values = (
          44.450000000000000000
          1672.166666666667000000
          19.050000000000000000
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
        Left = 923
        Top = 9
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          1953.683333333333000000
          19.050000000000000000
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
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 253
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
      object qrlblReportPerc: TQRLabel
        Left = 1200
        Top = 9
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2540.000000000000000000
          19.050000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportPerc'
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
        Left = 1119
        Top = 9
        Width = 116
        Height = 21
        Size.Values = (
          44.450000000000000000
          2368.550000000000000000
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
      object qrlblReportCost: TQRLabel
        Left = 1046
        Top = 9
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          2214.033333333333000000
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
      object qrlblReportGoods: TQRLabel
        Left = 941
        Top = 9
        Width = 112
        Height = 21
        Size.Values = (
          44.450000000000000000
          1991.783333333333000000
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
      object QRLabel10: TQRLabel
        Left = 873
        Top = 9
        Width = 79
        Height = 21
        Size.Values = (
          44.450000000000000000
          1847.850000000000000000
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
        Left = 493
        Top = 3
        Width = 309
        Height = 24
        Size.Values = (
          50.800000000000000000
          1043.516666666667000000
          6.350000000000000000
          654.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Orders Cost Analysis Report'
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
      object qrlblDate: TQRLabel
        Left = 87
        Top = 89
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          184.150000000000000000
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
        Left = 400
        Top = 89
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          846.666666666666700000
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
      object QRLabel12: TQRLabel
        Left = 1255
        Top = 89
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          2656.416666666667000000
          188.383333333333300000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object qrlblDateRange: TQRLabel
        Left = 596
        Top = 31
        Width = 89
        Height = 19
        Size.Values = (
          40.216666666666670000
          1261.533333333333000000
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
      object QRLabel9: TQRLabel
        Left = 1008
        Top = 89
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          2133.600000000000000000
          188.383333333333300000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Goods'
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
        Left = 1064
        Top = 89
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          2252.133333333333000000
          188.383333333333300000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object QRLabel1: TQRLabel
        Left = 730
        Top = 89
        Width = 24
        Height = 21
        Size.Values = (
          44.450000000000000000
          1545.166666666667000000
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
      object gtQRLabel2: TQRLabel
        Left = 844
        Top = 89
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          1786.466666666667000000
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
      object gtQRLabel1: TQRLabel
        Left = 590
        Top = 89
        Width = 116
        Height = 21
        Size.Values = (
          44.450000000000000000
          1248.833333333333000000
          188.383333333333300000
          245.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Order Ref'
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
        Left = 1195
        Top = 89
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2529.416666666667000000
          188.383333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
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
    end
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Descriptive_Reference,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_Ref_no,'
      '        Customer.Telephone_number,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      
        '        (SELECT SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/10' +
        '00000) * Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_' +
        'Slab.Adhesive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1))))'
      '          FROM Sales_Order_Line'
      '              INNER JOIN Quote_Slab'
      '                ON Sales_Order_Line.Quote = Quote_Slab.Quote'
      
        '          WHERE (Sales_Order_Line.Sales_Order = Sales_order.Sale' +
        's_Order)) as Total_Materials,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Sales_Order.Account_Manager,'
      '        Operator.Operator_Name as Account_Manager_Name'
      'FROM Operator'
      '      INNER JOIN (Sales_Order_Status'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      
        '        ON Sales_Order_Status.Sales_Order_Status = Sales_Order.S' +
        'ales_Order_Status)'
      '        ON Operator.Operator = Sales_Order.Account_Manager'
      'WHERE'
      '((Sales_Order.Rep = :Rep) or (0 = :Rep)) AND'
      
        '((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive IS NULL))' +
        ' AND'
      
        '(((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (Custo' +
        'mer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:Is_R' +
        'etail_Customer = '#39'A'#39'))'
      '')
    Left = 108
    Top = 326
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
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
    object qrySalesOrdersSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      Required = True
    end
    object qrySalesOrdersDate_Raised: TSQLTimeStampField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object qrySalesOrdersDescriptive_Reference: TWideStringField
      FieldName = 'Descriptive_Reference'
      Origin = 'Descriptive_Reference'
      Size = 255
    end
    object qrySalesOrdersSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
      Origin = 'Sales_Order_Status'
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
    object qrySalesOrdersDate_Required: TSQLTimeStampField
      FieldName = 'Date_Required'
      Origin = 'Date_Required'
      Required = True
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
    object qrySalesOrdersOrder_Ref_no: TWideStringField
      FieldName = 'Order_Ref_no'
      Origin = 'Order_Ref_no'
      Required = True
      Size = 30
    end
    object qrySalesOrdersTelephone_number: TWideStringField
      FieldName = 'Telephone_number'
      Origin = 'Telephone_number'
      Size = 30
    end
    object qrySalesOrdersIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Origin = 'Is_Retail_Customer'
      Size = 1
    end
    object qrySalesOrdersIs_Commercial_Customer: TWideStringField
      FieldName = 'Is_Commercial_Customer'
      Origin = 'Is_Commercial_Customer'
      Size = 1
    end
    object qrySalesOrdersGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      Origin = 'Goods_Value'
    end
    object qrySalesOrdersVAT_Value: TFloatField
      FieldName = 'VAT_Value'
      Origin = 'VAT_Value'
    end
    object qrySalesOrdersTotal_Value: TFloatField
      FieldName = 'Total_Value'
      Origin = 'Total_Value'
      ReadOnly = True
    end
    object qrySalesOrdersTotal_Materials: TFloatField
      FieldName = 'Total_Materials'
      Origin = 'Total_Materials'
      ReadOnly = True
    end
    object qrySalesOrdersRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'Rep'
    end
    object qrySalesOrdersRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Origin = 'Rep_Name'
      Required = True
      Size = 50
    end
    object qrySalesOrdersAccount_Manager: TIntegerField
      FieldName = 'Account_Manager'
      Origin = 'Account_Manager'
    end
    object qrySalesOrdersAccount_Manager_Name: TWideStringField
      FieldName = 'Account_Manager_Name'
      Origin = 'Account_Manager_Name'
      Required = True
      Size = 30
    end
  end
end
