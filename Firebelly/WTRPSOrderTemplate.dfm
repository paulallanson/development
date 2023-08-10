object frmwtRPSOrderTemplate: TfrmwtRPSOrderTemplate
  Left = 43
  Top = 110
  Caption = 'Sales Order Templating Report'
  ClientHeight = 621
  ClientWidth = 1148
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    ReportTitle = 'Sales Orders due for templating Report'
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
        Left = 330
        Top = 10
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          698.500000000000000000
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
        Left = 430
        Top = 10
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          910.166666666666700000
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
    object qrsbDetails: TQRSubDetail
      Left = 47
      Top = 192
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
        Left = 10
        Top = 1
        Width = 73
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
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
        Left = 81
        Top = 1
        Width = 75
        Height = 19
        Size.Values = (
          40.216666666666670000
          171.450000000000000000
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
        Left = 650
        Top = 1
        Width = 171
        Height = 19
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
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
        Left = 330
        Top = 1
        Width = 321
        Height = 19
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          2.645833333333333000
          679.979166666666800000)
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
      object qrlblTotal: TQRLabel
        Tag = 1
        Left = 1235
        Top = 0
        Width = 62
        Height = 19
        Size.Values = (
          40.216666666666670000
          2614.083333333333000000
          0.000000000000000000
          131.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotal'
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
      object QRDBText4: TQRDBText
        Tag = 1
        Left = 160
        Top = 1
        Width = 36
        Height = 19
        Size.Values = (
          40.216666666666670000
          338.666666666666700000
          2.116666666666667000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object qrrchTextAddress: TQRRichText
        Tag = 1
        Left = 830
        Top = 1
        Width = 191
        Height = 19
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          2.645833333333333000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrrchTextAddress')
      end
      object QRDBText1: TQRDBText
        Tag = 1
        Left = 330
        Top = 21
        Width = 491
        Height = 19
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          44.979166666666670000
          1039.812500000000000000)
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
      object qrlblVAT: TQRLabel
        Tag = 1
        Left = 1145
        Top = 0
        Width = 56
        Height = 19
        Size.Values = (
          40.216666666666670000
          2423.583333333333000000
          0.000000000000000000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblVAT'
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
      object qrlblGoods: TQRLabel
        Tag = 1
        Left = 1053
        Top = 0
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          2228.850000000000000000
          0.000000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGoods'
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
      object qrlblTemplateDate: TQRLabel
        Tag = 1
        Left = 231
        Top = 1
        Width = 85
        Height = 19
        Size.Values = (
          40.216666666666670000
          488.950000000000000000
          2.116666666666667000
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
    end
    object qrbGroupFooter: TQRBand
      Left = 47
      Top = 236
      Width = 1309
      Height = 36
      AfterPrint = qrbGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
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
        Left = 1213
        Top = 9
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          2567.516666666667000000
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
        Left = 1118
        Top = 9
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          2366.433333333333000000
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
        Left = 1024
        Top = 9
        Width = 97
        Height = 21
        Size.Values = (
          44.450000000000000000
          2167.466666666667000000
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
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 272
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
        Left = 1198
        Top = 9
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          2535.766666666667000000
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
        Left = 1104
        Top = 9
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          2336.800000000000000000
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
        Left = 1010
        Top = 9
        Width = 112
        Height = 21
        Size.Values = (
          44.450000000000000000
          2137.833333333333000000
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
        Left = 502
        Top = 6
        Width = 288
        Height = 24
        Size.Values = (
          50.800000000000000000
          1062.566666666667000000
          12.700000000000000000
          609.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Orders due for Templating'
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
        Top = 89
        Width = 70
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
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
        Left = 100
        Top = 89
        Width = 28
        Height = 21
        Size.Values = (
          44.450000000000000000
          211.666666666666700000
          188.383333333333300000
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
        Left = 330
        Top = 89
        Width = 126
        Height = 21
        Size.Values = (
          44.450000000000000000
          698.500000000000000000
          188.383333333333300000
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
        Left = 650
        Top = 89
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          1375.833333333333000000
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
        Left = 1230
        Top = 89
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          2603.500000000000000000
          188.383333333333300000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Value'
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
        Top = 34
        Width = 89
        Height = 19
        Size.Values = (
          40.216666666666670000
          1261.533333333333000000
          71.966666666666670000
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
      object QRLabel1: TQRLabel
        Left = 160
        Top = 89
        Width = 36
        Height = 21
        Size.Values = (
          44.450000000000000000
          338.666666666666700000
          188.383333333333300000
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
      object QRLabel7: TQRLabel
        Left = 230
        Top = 89
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          486.833333333333300000
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
      object QRLabel8: TQRLabel
        Left = 830
        Top = 89
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          1756.833333333333000000
          188.383333333333300000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation Details'
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
      object QRLabel9: TQRLabel
        Left = 1080
        Top = 89
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          2286.000000000000000000
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
        Left = 1170
        Top = 89
        Width = 26
        Height = 21
        Size.Values = (
          44.450000000000000000
          2476.500000000000000000
          188.383333333333300000
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
      object qrlblSelection: TQRLabel
        Left = 600
        Top = 59
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          1270.000000000000000000
          124.883333333333300000
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
      '        Sales_Order_Line.Markup_Value,'
      '        Sales_Order_Line.Waste_Value,'
      '        Sales_Order_Line.Vat,'
      '        Sales_Order_Line.Description,'
      '        Vat.Vat_Rate,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order_Line.Unit_price,'
      '        Sales_Order_Line.Job,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Email_Address,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.IsTemplateInOutlook,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Customer.Telephone_number,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Rep.Rep,'
      '        Rep.Rep_Name'
      'FROM Rep'
      '        INNER JOIN ((Sales_Order_Status'
      '        INNER JOIN (Customer'
      '        INNER JOIN Sales_Order'
      '          ON Customer.Customer = Sales_Order.Customer)'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status)'
      '        INNER JOIN (Vat'
      '        INNER JOIN Sales_Order_Line'
      '          ON Vat.Vat = Sales_Order_Line.Vat)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Rep.Rep = Sales_Order.Rep'
      'WHERE (Sales_Order_Line.Quote <> NULL) and'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      ((Sales_Order.Rep = :Rep) or (0 = :Rep)) and'
      
        '      ((Sales_Order.Template_Date >= :Date_From) and (Sales_Orde' +
        'r.Template_Date <= :Date_To)) and'
      '      (Sales_Order.Sales_order_status < :Sales_Order_Status) AND'
      
        '      ((Sales_Order.IsTemplateInOutlook = :IsTemplateInOutlook) ' +
        'OR (Sales_Order.IsTemplateInOutlook = '#39'Y'#39') OR (Sales_Order.IsTem' +
        'plateInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 128
    Top = 352
    ParamData = <
      item
        Name = 'Customer'
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
      end
      item
        Name = 'Sales_Order_Status'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IsTemplateInOutlook'
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
    object qrySalesOrdersMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
      Origin = 'Markup_Value'
    end
    object qrySalesOrdersWaste_Value: TFloatField
      FieldName = 'Waste_Value'
      Origin = 'Waste_Value'
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
    object qrySalesOrdersInstall_Name: TWideStringField
      FieldName = 'Install_Name'
      Origin = 'Install_Name'
      Size = 30
    end
    object qrySalesOrdersInstall_Phone: TWideStringField
      FieldName = 'Install_Phone'
      Origin = 'Install_Phone'
      Size = 30
    end
    object qrySalesOrdersEmail_Address: TWideStringField
      FieldName = 'Email_Address'
      Origin = 'Email_Address'
      Size = 100
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
    object qrySalesOrdersSales_Order_Status_1: TIntegerField
      FieldName = 'Sales_Order_Status_1'
      Origin = 'Sales_Order_Status'
      Required = True
    end
    object qrySalesOrdersIsTemplateInOutlook: TWideStringField
      FieldName = 'IsTemplateInOutlook'
      Origin = 'IsTemplateInOutlook'
      Size = 1
    end
    object qrySalesOrdersSales_Order_Status_Desc_1: TWideStringField
      FieldName = 'Sales_Order_Status_Desc_1'
      Origin = 'Sales_Order_Status_Desc'
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
    object qrySalesOrdersRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'Rep'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySalesOrdersRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Origin = 'Rep_Name'
      Required = True
      Size = 50
    end
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 238
    Top = 352
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object OLDqrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Sales_Order_Line.Nett_Price,'
      '        Sales_Order_Line.Discount_Value,'
      '        Sales_Order_Line.Installation_price,'
      '        Sales_Order_Line.Survey_price,'
      '        Sales_Order_Line.Delivery_Price,'
      '        Sales_Order_Line.Markup_Value,'
      '        Sales_Order_Line.Waste_Value,'
      '        Sales_Order_Line.Vat,'
      '        Sales_Order_Line.Description,'
      '        Vat.Vat_Rate,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order_Line.Unit_price,'
      '        Sales_Order_Line.Job,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Email_Address,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.IsTemplateInOutlook,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Customer.Telephone_number,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Rep.Rep,'
      '        Rep.Rep_Name'
      'FROM Rep'
      '        INNER JOIN ((Sales_Order_Status'
      '        INNER JOIN (Customer'
      '        INNER JOIN Sales_Order'
      '          ON Customer.Customer = Sales_Order.Customer)'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status)'
      '        INNER JOIN (Vat'
      '        INNER JOIN Sales_Order_Line'
      '          ON Vat.Vat = Sales_Order_Line.Vat)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Rep.Rep = Sales_Order.Rep'
      
        'WHERE (Sales_Order_Line.Quote <> NULL) and (Sales_Order_Line.Job' +
        ' is NULL) and'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      ((Sales_Order.Rep = :Rep) or (0 = :Rep)) and'
      
        '      ((Sales_Order.Template_Date >= :Date_From) and (Sales_Orde' +
        'r.Template_Date <= :Date_To)) and'
      '      (Sales_Order.Sales_order_status < 60) AND'
      
        '      ((Sales_Order.IsTemplateInOutlook = :IsTemplateInOutlook) ' +
        'OR (Sales_Order.IsTemplateInOutlook = '#39'Y'#39') OR (Sales_Order.IsTem' +
        'plateInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 360
    Top = 352
    ParamData = <
      item
        Name = 'Customer'
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
      end
      item
        Name = 'IsTemplateInOutlook'
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
    object OLDqrySalesOrdersSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      Required = True
    end
    object OLDqrySalesOrdersSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
      Origin = 'Sales_order_Line_no'
      Required = True
    end
    object OLDqrySalesOrdersNett_Price: TCurrencyField
      FieldName = 'Nett_Price'
      Origin = 'Nett_Price'
    end
    object OLDqrySalesOrdersDiscount_Value: TCurrencyField
      FieldName = 'Discount_Value'
      Origin = 'Discount_Value'
    end
    object OLDqrySalesOrdersInstallation_price: TCurrencyField
      FieldName = 'Installation_price'
      Origin = 'Installation_price'
    end
    object OLDqrySalesOrdersSurvey_price: TCurrencyField
      FieldName = 'Survey_price'
      Origin = 'Survey_price'
    end
    object OLDqrySalesOrdersDelivery_Price: TCurrencyField
      FieldName = 'Delivery_Price'
      Origin = 'Delivery_Price'
    end
    object OLDqrySalesOrdersMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
      Origin = 'Markup_Value'
    end
    object OLDqrySalesOrdersWaste_Value: TFloatField
      FieldName = 'Waste_Value'
      Origin = 'Waste_Value'
    end
    object OLDqrySalesOrdersVat: TIntegerField
      FieldName = 'Vat'
      Origin = 'Vat'
    end
    object OLDqrySalesOrdersDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 255
    end
    object OLDqrySalesOrdersVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      Origin = 'Vat_Rate'
      Required = True
    end
    object OLDqrySalesOrdersQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
    end
    object OLDqrySalesOrdersUnit_price: TCurrencyField
      FieldName = 'Unit_price'
      Origin = 'Unit_price'
      Required = True
    end
    object OLDqrySalesOrdersJob: TFloatField
      FieldName = 'Job'
      Origin = 'Job'
    end
    object OLDqrySalesOrdersDate_Raised: TSQLTimeStampField
      FieldName = 'Date_Raised'
      Origin = 'Date_Raised'
      Required = True
    end
    object OLDqrySalesOrdersSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
      Origin = 'Sales_Order_Status'
      Required = True
    end
    object OLDqrySalesOrdersSales_Order_Status_Desc: TWideStringField
      FieldName = 'Sales_Order_Status_Desc'
      Origin = 'Sales_Order_Status_Desc'
      Required = True
      Size = 30
    end
    object OLDqrySalesOrdersTemplate_Date: TSQLTimeStampField
      FieldName = 'Template_Date'
      Origin = 'Template_Date'
    end
    object OLDqrySalesOrdersInstall_Name: TWideStringField
      FieldName = 'Install_Name'
      Origin = 'Install_Name'
      Size = 30
    end
    object OLDqrySalesOrdersInstall_Phone: TWideStringField
      FieldName = 'Install_Phone'
      Origin = 'Install_Phone'
      Size = 30
    end
    object OLDqrySalesOrdersEmail_Address: TWideStringField
      FieldName = 'Email_Address'
      Origin = 'Email_Address'
      Size = 100
    end
    object OLDqrySalesOrdersInstall_Address: TIntegerField
      FieldName = 'Install_Address'
      Origin = 'Install_Address'
    end
    object OLDqrySalesOrdersCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Size = 50
    end
    object OLDqrySalesOrdersReference: TWideStringField
      FieldName = 'Reference'
      Origin = 'Reference'
      Required = True
      Size = 50
    end
    object OLDqrySalesOrdersSales_Order_Status_1: TIntegerField
      FieldName = 'Sales_Order_Status_1'
      Origin = 'Sales_Order_Status'
      Required = True
    end
    object OLDqrySalesOrdersIsTemplateInOutlook: TWideStringField
      FieldName = 'IsTemplateInOutlook'
      Origin = 'IsTemplateInOutlook'
      Size = 1
    end
    object OLDqrySalesOrdersSales_Order_Status_Desc_1: TWideStringField
      FieldName = 'Sales_Order_Status_Desc_1'
      Origin = 'Sales_Order_Status_Desc'
      Required = True
      Size = 30
    end
    object OLDqrySalesOrdersTelephone_number: TWideStringField
      FieldName = 'Telephone_number'
      Origin = 'Telephone_number'
      Size = 30
    end
    object OLDqrySalesOrdersIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Origin = 'Is_Retail_Customer'
      Size = 1
    end
    object OLDqrySalesOrdersIs_Commercial_Customer: TWideStringField
      FieldName = 'Is_Commercial_Customer'
      Origin = 'Is_Commercial_Customer'
      Size = 1
    end
    object OLDqrySalesOrdersRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'Rep'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object OLDqrySalesOrdersRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      Origin = 'Rep_Name'
      Required = True
      Size = 50
    end
  end
end
