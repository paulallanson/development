object PBRPStkBalfrm: TPBRPStkBalfrm
  Left = 115
  Top = 113
  Caption = 'Customer Stock Balance Report'
  ClientHeight = 420
  ClientWidth = 1158
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 16
    Top = 8
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Customer Stock Balance Report'
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
      Height = 124
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
        262.466666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 1236
        Top = 10
        Width = 60
        Height = 21
        Size.Values = (
          44.450000000000000000
          2616.200000000000000000
          21.166666666666670000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 1156
        Top = 10
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          2446.866666666667000000
          21.166666666666670000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
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
      object qrlblTitle: TQRLabel
        Left = 468
        Top = 10
        Width = 373
        Height = 29
        Size.Values = (
          61.383333333333330000
          990.600000000000000000
          21.166666666666670000
          789.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Stock Balance Report - Run Date:'
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
      object FormRefQRLabel: TQRLabel
        Left = 11
        Top = 90
        Width = 110
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          190.500000000000000000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Reference'
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
      object DescQRLabel: TQRLabel
        Left = 344
        Top = 90
        Width = 84
        Height = 21
        Size.Values = (
          44.979166666666670000
          727.604166666666800000
          190.500000000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Description '
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
      object StkQRLabel: TQRLabel
        Left = 882
        Top = 90
        Width = 53
        Height = 21
        Size.Values = (
          44.450000000000000000
          1866.900000000000000000
          190.500000000000000000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'In Stock'
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
      object QRShape1: TQRShape
        Left = 10
        Top = 111
        Width = 1286
        Height = 12
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          235.479166666666700000
          2722.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTypeQRLabel: TQRLabel
        Left = 591
        Top = 40
        Width = 126
        Height = 29
        Size.Values = (
          61.383333333333330000
          1250.950000000000000000
          84.666666666666670000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Report Type'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel1: TQRLabel
        Left = 1072
        Top = 70
        Width = 65
        Height = 41
        Size.Values = (
          87.312500000000000000
          2270.125000000000000000
          148.166666666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Reorder Level'
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
        Left = 775
        Top = 70
        Width = 66
        Height = 41
        Size.Values = (
          87.312500000000000000
          1640.416666666667000000
          148.166666666666700000
          140.229166666666700000)
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
      object QRLabel5: TQRLabel
        Left = 190
        Top = 90
        Width = 141
        Height = 21
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          190.500000000000000000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Customer order ref'
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
        Left = 680
        Top = 90
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          1439.333333333333000000
          190.500000000000000000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Last PO No.'
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
      object QRLabel2: TQRLabel
        Left = 961
        Top = 70
        Width = 81
        Height = 41
        Size.Values = (
          87.312500000000000000
          2034.645833333333000000
          148.166666666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'On Order for stock'
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
        Left = 1152
        Top = 70
        Width = 65
        Height = 41
        Size.Values = (
          87.312500000000000000
          2439.458333333333000000
          148.166666666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Last Order Qty'
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
        Left = 1233
        Top = 70
        Width = 65
        Height = 41
        Size.Values = (
          87.312500000000000000
          2608.791666666667000000
          148.166666666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Paid Stock'
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
    object OrderDetail: TQRSubDetail
      Left = 47
      Top = 206
      Width = 1309
      Height = 28
      AlignToBottom = False
      BeforePrint = OrderDetailBeforePrint
      Enabled = False
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
        59.266666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object FormIDQRDBText: TQRDBText
        Left = 23
        Top = 4
        Width = 175
        Height = 20
        Size.Values = (
          42.333333333333300000
          47.625000000000000000
          7.937500000000000000
          370.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Stock_Reference'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object FormDescQRDBText: TQRDBText
        Left = 354
        Top = 4
        Width = 348
        Height = 20
        Size.Values = (
          42.333333333333300000
          748.770833333333000000
          7.937500000000000000
          735.541666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Form_Reference_Descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormsperBox: TQRLabel
        Left = 720
        Top = 4
        Width = 80
        Height = 20
        Size.Values = (
          42.333333333333300000
          1524.000000000000000000
          7.937500000000000000
          169.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblFormsperBox'
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
      object lblBoxCount: TQRLabel
        Left = 815
        Top = 4
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333330000
          1725.083333333333000000
          8.466666666666667000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblBoxCount'
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
      object lblQtyinStock: TQRLabel
        Left = 894
        Top = 4
        Width = 86
        Height = 20
        Size.Values = (
          42.333333333333330000
          1892.300000000000000000
          8.466666666666667000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblQtyinStock'
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
      object lblReorderLvl: TQRLabel
        Left = 1120
        Top = 4
        Width = 86
        Height = 20
        Size.Values = (
          42.333333333333330000
          2370.666666666667000000
          8.466666666666667000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReorderLvl'
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
      object lblQtyonOrder: TQRLabel
        Left = 994
        Top = 4
        Width = 92
        Height = 20
        Size.Values = (
          42.333333333333330000
          2103.966666666667000000
          8.466666666666667000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblQtyonOrder'
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
    object FooterQRBand: TQRBand
      Left = 47
      Top = 262
      Width = 1309
      Height = 30
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
    end
    object CustGroup: TQRGroup
      Left = 47
      Top = 171
      Width = 1309
      Height = 35
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        74.083333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Customer_Name'
      Master = OrderDetail
      ReprintOnNewPage = False
      object CustQRDBText: TQRDBText
        Left = 86
        Top = 9
        Width = 122
        Height = 23
        Size.Values = (
          48.683333333333330000
          182.033333333333300000
          19.050000000000000000
          258.233333333333300000)
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
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object CustnamQRLabel: TQRLabel
        Left = 5
        Top = 9
        Width = 81
        Height = 23
        Size.Values = (
          48.683333333333330000
          10.583333333333330000
          19.050000000000000000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 234
      Width = 1309
      Height = 28
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        59.266666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = OrderDetail
      DataSet = qryOrders
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText9: TQRDBText
        Left = 925
        Top = 4
        Width = 107
        Height = 19
        Size.Values = (
          40.216666666666670000
          1957.916666666667000000
          8.466666666666667000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity_on_order'
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
        Left = 828
        Top = 4
        Width = 108
        Height = 20
        Size.Values = (
          42.333333333333330000
          1752.600000000000000000
          8.466666666666667000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity_in_Stock'
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
        Top = 4
        Width = 175
        Height = 20
        Size.Values = (
          42.333333333333340000
          26.458333333333330000
          7.937500000000000000
          370.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Stock_Reference'
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
        Left = 346
        Top = 4
        Width = 325
        Height = 20
        Size.Values = (
          42.333333333333340000
          732.895833333333400000
          7.937500000000000000
          687.916666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Form_Reference_Descr'
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
        Left = 1048
        Top = 4
        Width = 82
        Height = 19
        Size.Values = (
          40.216666666666670000
          2218.266666666667000000
          8.466666666666667000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reorder_Level'
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
      object lblCustOrderNo: TQRLabel
        Left = 190
        Top = 4
        Width = 141
        Height = 19
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          7.937500000000000000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblCustOrderNo'
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
      object lblPONumber: TQRLabel
        Left = 680
        Top = 4
        Width = 78
        Height = 19
        Size.Values = (
          40.216666666666670000
          1439.333333333333000000
          8.466666666666667000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblPONumber'
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
      object lblDeliveryDate: TQRLabel
        Left = 780
        Top = 4
        Width = 86
        Height = 19
        Size.Values = (
          40.216666666666670000
          1651.000000000000000000
          8.466666666666667000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblDeliveryDate'
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
      object lblQuantity: TQRLabel
        Left = 1151
        Top = 4
        Width = 63
        Height = 19
        Size.Values = (
          40.216666666666670000
          2436.283333333333000000
          8.466666666666667000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblQuantity'
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
      object lblPaidStock: TQRLabel
        Left = 1231
        Top = 4
        Width = 63
        Height = 19
        Size.Values = (
          40.216666666666670000
          2605.616666666667000000
          8.466666666666667000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblQuantity'
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
  object qryReport: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'SELECT Form_Reference.Form_Reference_ID,'
      '       Form_Reference.Form_Reference_Descr,'
      '       Form_Reference.Stock_Reference,'
      '       Form_Reference.Reorder_Level,'
      #9'Form_Reference.Form_Reference,'
      #9'Customer.Name AS Customer_Name,'
      #9'Customer_Branch.Customer,'
      #9'Customer_Branch.Branch_no,'
      #9'Form_Reference.Stocked_Item,'
      ' '#9'(select sum(Delivery_detail.Qty_to_Deliver)'
      #9#9'from Purchase_Orderline POLine, Delivery_Detail'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      #9#9#9'POLine.purch_ord_line_Status >= 20 and'
      #9#9#9'POLine.purch_ord_line_Status <= 22 and'
      #9#9#9'('
      #9#9#9'(Delivery_detail.purchase_order = POLine.purchase_order) and'
      #9#9#9'(Delivery_detail.Line = POLine.Line)'
      #9#9#9') and'
      #9#9#9'(Delivery_detail.delivery_to_Stock = '#39'Y'#39') and'
      #9#9#9'(Delivery_Detail.Qty_Delivered = 0)'
      
        '                        and (POLine.inactive <> '#39'Y'#39')) AS Quantit' +
        'y_on_order,'
      ' '#9'(select sum(Delivery_detail.Qty_to_Deliver)'
      #9#9'from Purchase_Orderline POLine, Delivery_Detail'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      #9#9#9'POLine.purch_ord_line_Status >= 20 and'
      #9#9#9'POLine.purch_ord_line_Status <= 22 and'
      '                        (POLine.inactive <> '#39'Y'#39') and'
      #9#9#9'(round(POLine.Purchase_Order,0) <> POLine.Original_Order) and'
      #9#9#9'('
      #9#9#9'(Delivery_detail.purchase_order = POLine.purchase_order) and'
      #9#9#9'(Delivery_detail.Line = POLine.Line)'
      #9#9#9')) AS Total_on_order,'
      ' '#9'(select sum(POLine.Qty_in_Stock)'
      #9#9'from Purchase_orderline POLine'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      
        '                        (POLine.inactive <> '#39'Y'#39')) as Quantity_in' +
        '_stock,'
      ' '#9'(select sum(POLine.Qty_in_Stock)'
      #9#9'from Purchase_orderline POLine'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      
        '                        (POLine.inactive <> '#39'Y'#39') and (POLine.inv' +
        'oice_upfront = '#39'Y'#39')) as Paid_Stock'
      'FROM Customer'
      '      INNER JOIN ((Customer_Branch'
      '      INNER JOIN Form_Reference ON'
      
        '        (Customer_Branch.Branch_no = Form_Reference.Branch_No) A' +
        'ND'
      '        (Customer_Branch.Customer = Form_Reference.Customer))'
      '      LEFT JOIN Purchase_OrderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      '        Customer.Customer = Customer_Branch.Customer'
      'GROUP BY Form_Reference.Form_Reference_ID,'
      '                   Form_Reference.Form_Reference_Descr,'
      '                   Form_Reference.Stock_Reference,'
      '                   Form_Reference.Reorder_Level,'
      '                   Form_Reference.Form_Reference,'
      '                   Customer.Name,'
      '                   Customer_Branch.Customer,'
      '                   Customer_Branch.Branch_no,'
      '                   Form_Reference.Stocked_Item'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 32
    Top = 64
    object qryReportForm_Reference_ID: TWideStringField
      FieldName = 'Form_Reference_ID'
      Origin = 'Form_Reference_ID'
      Required = True
      Size = 50
    end
    object qryReportForm_Reference_Descr: TWideStringField
      FieldName = 'Form_Reference_Descr'
      Origin = 'Form_Reference_Descr'
      Size = 50
    end
    object qryReportStock_Reference: TWideStringField
      FieldName = 'Stock_Reference'
      Origin = 'Stock_Reference'
      Size = 25
    end
    object qryReportReorder_Level: TIntegerField
      FieldName = 'Reorder_Level'
      Origin = 'Reorder_Level'
    end
    object qryReportForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
      Origin = 'Form_Reference'
      Required = True
    end
    object qryReportCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Origin = 'Customer_Name'
      Required = True
      Size = 100
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
      Required = True
    end
    object qryReportStocked_Item: TStringField
      FieldName = 'Stocked_Item'
      Origin = 'Stocked_Item'
      Size = 1
    end
    object qryReportQuantity_on_order: TFloatField
      FieldName = 'Quantity_on_order'
      Origin = 'Quantity_on_order'
      ReadOnly = True
    end
    object qryReportTotal_on_order: TFloatField
      FieldName = 'Total_on_order'
      Origin = 'Total_on_order'
      ReadOnly = True
    end
    object qryReportQuantity_in_stock: TFloatField
      FieldName = 'Quantity_in_stock'
      Origin = 'Quantity_in_stock'
      ReadOnly = True
    end
    object qryReportPaid_Stock: TFloatField
      FieldName = 'Paid_Stock'
      Origin = 'Paid_Stock'
      ReadOnly = True
    end
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 94
    Top = 62
  end
  object qryOrders: TFDQuery
    MasterSource = dtsReport
    MasterFields = 'Form_Reference;Form_Reference'
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT top 1 Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Qty_in_Stock,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_orderLine.Forms_per_Box,'
      '        (select top 1 Date_Deliv_Actual'
      '        from Purchase_orderLine POLine, Delivery_Detail'
      '        where (POLine.Form_Reference = :Form_Reference) and'
      #9#9'          (POLine.Original_Order <> 0) and'
      '              ('
      
        '              (Delivery_Detail.Purchase_Order = POLine.Purchase_' +
        'Order) and'
      '              (Delivery_Detail.Line = POLine.Line)'
      '              ) and'
      '              (Delivery_Detail.Qty_delivered <> 0)'
      '        Order By Delivery_detail.Date_Deliv_Actual desc,'
      '                 Delivery_detail.delivery_no desc,'
      '                 Delivery_detail.Purchase_Order'
      '        ) as Last_Delivery'
      'FROM Purchase_OrderLine'
      'where Purchase_orderLine.Form_Reference = :Form_Reference'
      'and Qty_in_Stock <> 0'
      'ORDER BY Purchase_OrderLine.Purchase_Order desc'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 174
    Top = 62
    ParamData = <
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end>
    object qryOrdersCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object qryOrdersPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryOrdersQty_in_Stock: TFloatField
      FieldName = 'Qty_in_Stock'
      OnGetText = qryOrdersQty_in_StockGetText
      DisplayFormat = '#,##0'
    end
    object qryOrdersQuantity: TFloatField
      FieldName = 'Quantity'
      OnGetText = qryOrdersQty_in_StockGetText
      DisplayFormat = '#,##0'
    end
    object qryOrdersForms_per_Box: TStringField
      FieldName = 'Forms_per_Box'
      FixedChar = True
      Size = 40
    end
    object qryOrdersLast_Delivery: TDateTimeField
      FieldName = 'Last_Delivery'
    end
  end
  object qryLastDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Top 1'
      '  Delivery_Detail.Qty_Delivered,'
      '  Delivery_Detail.Date_Deliv_Actual,'
      '  Purchase_OrderLine.Cust_Order_No,'
      '  Purchase_OrderLine.Purchase_Order,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_Orderline,'
      '  Purchase_OrderLine.Forms_Per_Box,'
      '  (select POL.Quantity'
      '   from Purchase_orderLine POL'
      
        '   where POL.Purchase_Order = Purchase_orderline.Original_Order ' +
        'and'
      
        '         POL.Line = Purchase_orderline.Original_OrderLine) as Qu' +
        'antity'
      'FROM Purchase_OrderLine'
      '  INNER JOIN Delivery_Detail ON'
      '    (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order)'
      'WHERE (Purchase_orderLine.Form_Reference = :Form_Reference) and'
      
        '   (round(Purchase_OrderLine.Purchase_order,0) = (Purchase_Order' +
        'Line.Original_Order)) and'
      '  (Delivery_Detail.Qty_Delivered<>0)'
      
        'ORDER BY Delivery_Detail.Date_Deliv_Actual DESC, Delivery_Detail' +
        '.delivery_no DESC, Delivery_Detail.Purchase_Order desc  '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 254
    Top = 62
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
end
