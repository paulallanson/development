object PBRPPORepMFrm: TPBRPPORepMFrm
  Left = 0
  Top = 100
  Width = 812
  Height = 449
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 88
  VertScrollBar.Range = 2000
  Caption = 'Purchase Orders Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  TextHeight = 14
  object PrintPOsQuickReport: TQuickRep
    Left = 8
    Top = -8
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = PrintPOsQuickReportBeforePrint
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
    ReportTitle = 'Purchase Orders'
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
    object PageHeaderQRBand: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 154
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        325.966666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object DatesQRLabel: TQRLabel
        Left = 20
        Top = 10
        Width = 79
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          21.166666666666670000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Due Before:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object SelSuppsQRLabel: TQRLabel
        Left = 20
        Top = 50
        Width = 84
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          105.833333333333300000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'For Supplier:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object SequenceQRLabel: TQRLabel
        Left = 20
        Top = 30
        Width = 100
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          63.500000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sequenced By:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
        Left = 642
        Top = 115
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          1358.900000000000000000
          243.416666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel4: TQRLabel
        Left = 744
        Top = 115
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          1574.800000000000000000
          243.416666666666700000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sell Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel5: TQRLabel
        Left = 849
        Top = 115
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          1797.050000000000000000
          243.416666666666700000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel8: TQRLabel
        Left = 921
        Top = 115
        Width = 45
        Height = 21
        Size.Values = (
          44.450000000000000000
          1949.450000000000000000
          243.416666666666700000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '%Age'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel9: TQRLabel
        Left = 920
        Top = 94
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          1947.333333333333000000
          198.966666666666700000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QuantityLbl: TQRLabel
        Left = 566
        Top = 115
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          1198.033333333333000000
          243.416666666666700000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object POrderLbl: TQRLabel
        Left = 135
        Top = 115
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          285.750000000000000000
          243.416666666666700000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
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
      object QRLabel1: TQRLabel
        Left = 16
        Top = 115
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          33.866666666666670000
          243.416666666666700000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object CustQRLabel: TQRLabel
        Left = 20
        Top = 70
        Width = 96
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          148.166666666666700000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'For Customer:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
        Left = 292
        Top = 12
        Width = 373
        Height = 33
        Size.Values = (
          69.850000000000000000
          618.066666666666700000
          25.400000000000000000
          789.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Purchase Order Margin Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object RunDateQRLabel: TQRLabel
        Left = 680
        Top = 12
        Width = 142
        Height = 33
        Size.Values = (
          69.850000000000000000
          1439.333333333333000000
          25.400000000000000000
          300.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '- Run Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object ReportSelectionLbl: TQRLabel
        Left = 260
        Top = 50
        Width = 137
        Height = 21
        Size.Values = (
          44.450000000000000000
          550.333333333333300000
          105.833333333333300000
          289.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ReportSelectionLbl'
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
      object AdditionalCostLbl: TQRLabel
        Left = 464
        Top = 70
        Width = 126
        Height = 21
        Size.Values = (
          44.450000000000000000
          982.133333333333300000
          148.166666666666700000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AdditionalCostLbl'
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
      object QRShape1: TQRShape
        Left = 15
        Top = 138
        Width = 1261
        Height = 21
        Size.Values = (
          44.979166666666700000
          31.750000000000000000
          291.041666666667000000
          2669.645833333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 189
        Top = 95
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          400.050000000000000000
          201.083333333333300000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
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
      object QRLabel7: TQRLabel
        Left = 189
        Top = 115
        Width = 135
        Height = 21
        Size.Values = (
          44.450000000000000000
          400.050000000000000000
          243.416666666666700000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of Job'
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
      object QRLabel10: TQRLabel
        Left = 990
        Top = 115
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          2095.500000000000000000
          243.416666666666700000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
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
    object FooterQRBand: TQRBand
      Left = 47
      Top = 525
      Width = 1309
      Height = 50
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object PageNoQRLabel: TQRLabel
        Left = 600
        Top = 15
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          1270.000000000000000000
          31.750000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    object SeqFootQRBand: TQRBand
      Left = 47
      Top = 393
      Width = 1309
      Height = 32
      AfterPrint = SeqFootQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = SeqFootQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape6: TQRShape
        Left = 924
        Top = 5
        Width = 44
        Height = 33
        Size.Values = (
          68.791666666666700000
          1955.270833333330000000
          10.583333333333300000
          92.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 820
        Top = 5
        Width = 78
        Height = 33
        Size.Values = (
          68.791666666666700000
          1735.666666666670000000
          10.583333333333300000
          164.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 730
        Top = 5
        Width = 86
        Height = 31
        Size.Values = (
          66.145833333333300000
          1545.166666666670000000
          10.583333333333300000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 627
        Top = 5
        Width = 94
        Height = 33
        Size.Values = (
          68.791666666666700000
          1328.208333333330000000
          10.583333333333300000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object SeqTotalDescQRLabel: TQRLabel
        Left = 448
        Top = 11
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          948.266666666666700000
          23.283333333333330000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Seq Tots:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object STMarginQRLabel: TQRLabel
        Left = 848
        Top = 11
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1794.933333333333000000
          23.283333333333330000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object STMargPercQRLabel: TQRLabel
        Left = 924
        Top = 11
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          1955.800000000000000000
          23.283333333333330000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '%Age'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object SeqTotalCostLbl: TQRLabel
        Left = 601
        Top = 10
        Width = 120
        Height = 21
        Size.Values = (
          44.450000000000000000
          1272.116666666667000000
          21.166666666666670000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SeqTotalCostLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object SeqTotalSellLbl: TQRLabel
        Left = 702
        Top = 10
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          1485.900000000000000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SeqTotalSellLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    object Seq2FootQRBand: TQRBand
      Left = 47
      Top = 425
      Width = 1309
      Height = 44
      AfterPrint = Seq2FootQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = Seq2FootQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        93.133333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape8: TQRShape
        Left = 625
        Top = 8
        Width = 94
        Height = 31
        Size.Values = (
          66.145833333333300000
          1322.916666666670000000
          15.875000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 923
        Top = 6
        Width = 44
        Height = 31
        Size.Values = (
          66.145833333333300000
          1952.625000000000000000
          13.229166666666700000
          92.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 820
        Top = 8
        Width = 78
        Height = 31
        Size.Values = (
          66.145833333333300000
          1735.666666666670000000
          15.875000000000000000
          164.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 730
        Top = 8
        Width = 86
        Height = 31
        Size.Values = (
          66.145833333333300000
          1545.166666666670000000
          15.875000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object ST2MargPercQRLabel: TQRLabel
        Left = 924
        Top = 12
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          1955.800000000000000000
          25.400000000000000000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '%Age'
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
      object MarginQRLabel: TQRLabel
        Left = 848
        Top = 12
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1794.933333333333000000
          25.400000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
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
      object Seq2TotalCostLbl: TQRLabel
        Left = 593
        Top = 11
        Width = 128
        Height = 21
        Size.Values = (
          44.450000000000000000
          1255.183333333333000000
          23.283333333333330000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Seq2TotalCostLbl'
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
      object Seq2TotalSellLbl: TQRLabel
        Left = 694
        Top = 10
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          1468.966666666667000000
          21.166666666666670000
          258.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Seq2TotalSellLbl'
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
      object Seq2TotalDescQRLabel: TQRLabel
        Left = 429
        Top = 10
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          908.050000000000000000
          21.166666666666670000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Seq Tots(2):'
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
    object RepTotsQRBand: TQRBand
      Left = 47
      Top = 469
      Width = 1309
      Height = 56
      AfterPrint = RepTotsQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = RepTotsQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        118.533333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRShape11: TQRShape
        Left = 923
        Top = 11
        Width = 44
        Height = 33
        Size.Values = (
          68.791666666666700000
          1952.625000000000000000
          23.812500000000000000
          92.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 730
        Top = 11
        Width = 86
        Height = 33
        Size.Values = (
          68.791666666666700000
          1545.166666666670000000
          23.812500000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 625
        Top = 11
        Width = 95
        Height = 33
        Size.Values = (
          68.791666666666700000
          1322.916666666670000000
          23.812500000000000000
          201.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 820
        Top = 11
        Width = 78
        Height = 33
        Size.Values = (
          68.791666666666700000
          1735.666666666670000000
          23.812500000000000000
          164.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsTopAndBottom
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 415
        Top = 15
        Width = 102
        Height = 21
        Size.Values = (
          44.450000000000000000
          878.416666666666700000
          31.750000000000000000
          215.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Report Totals:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object RTMarginQRLabel: TQRLabel
        Left = 848
        Top = 18
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1794.933333333333000000
          38.100000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object RTMargPercQRLabel: TQRLabel
        Left = 924
        Top = 18
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          1955.800000000000000000
          38.100000000000000000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '%Age'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object ReportCostLbl: TQRLabel
        Left = 615
        Top = 15
        Width = 105
        Height = 21
        Size.Values = (
          44.450000000000000000
          1301.750000000000000000
          31.750000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ReportCostLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object ReportSellLbl: TQRLabel
        Left = 717
        Top = 15
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          1517.650000000000000000
          31.750000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ReportSellLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    object RepTotsQRGroup: TQRGroup
      Left = 47
      Top = 201
      Width = 1309
      Height = 24
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.800000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = RepTotsQRBand
      Master = PrintPOsQuickReport
      ReprintOnNewPage = False
    end
    object Seq2QRGroup: TQRGroup
      Left = 47
      Top = 225
      Width = 1309
      Height = 41
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        86.783333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = Seq2FootQRBand
      Master = PrintPOsQuickReport
      ReprintOnNewPage = False
      object SequenceName2QRLabel: TQRLabel
        Left = 1
        Top = 15
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          2.116666666666667000
          31.750000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sequence2:'
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
      object SeqDesc2QRDBText: TQRDBText
        Left = 146
        Top = 14
        Width = 150
        Height = 21
        Size.Values = (
          44.450000000000000000
          309.033333333333300000
          29.633333333333330000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object SeqQRGroup: TQRGroup
      Left = 47
      Top = 266
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
      FooterBand = SeqFootQRBand
      Master = PrintPOsQuickReport
      ReprintOnNewPage = False
      object SequenceNameQRLabel: TQRLabel
        Left = 31
        Top = 10
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          65.616666666666670000
          21.166666666666670000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sequence:'
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
      object SeqDescQRDBText: TQRDBText
        Left = 176
        Top = 10
        Width = 142
        Height = 21
        Size.Values = (
          44.450000000000000000
          372.533333333333300000
          21.166666666666670000
          300.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 339
      Width = 1309
      Height = 54
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        114.300000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object TotalCostLbl: TQRLabel
        Left = 640
        Top = 3
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          1354.666666666667000000
          6.350000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCostLbl'
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
      object TotalSellLbl: TQRLabel
        Left = 739
        Top = 3
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          1564.216666666667000000
          6.350000000000000000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object QRDBQuantityText1: TQRDBText
        Left = 572
        Top = 3
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          1210.733333333333000000
          6.350000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Quantity'
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
      object MarginQRBLabel: TQRLabel
        Left = 855
        Top = 3
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          1809.750000000000000000
          6.350000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
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
      object QRBMargPercQRLabel: TQRLabel
        Left = 928
        Top = 3
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          1964.266666666667000000
          6.350000000000000000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '%Age'
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
      object QRDBText1: TQRDBText
        Left = 20
        Top = 3
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          6.350000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Date_Point'
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
      object OrderLbl: TQRLabel
        Left = 118
        Top = 3
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          249.766666666666700000
          6.350000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'OrderLbl'
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
      object QRDBText2: TQRDBText
        Left = 190
        Top = 3
        Width = 368
        Height = 21
        Size.Values = (
          44.979166666666700000
          402.166666666667000000
          5.291666666666670000
          777.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'Cust_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 190
        Top = 24
        Width = 368
        Height = 21
        Size.Values = (
          44.979166666666700000
          402.166666666667000000
          50.270833333333300000
          777.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataField = 'Customers_Desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 990
        Top = 3
        Width = 112
        Height = 21
        Size.Values = (
          44.450000000000000000
          2095.500000000000000000
          6.350000000000000000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Supplier_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object TotalAddCostLbl: TQRLabel
        Left = 615
        Top = 24
        Width = 108
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1301.750000000000000000
          50.800000000000000000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalAddCostLbl'
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
      object TotalAddSellLbl: TQRLabel
        Left = 714
        Top = 24
        Width = 101
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1511.300000000000000000
          50.800000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalAddSellLbl'
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
      object AddChargesLbl: TQRLabel
        Left = 562
        Top = 24
        Width = 61
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1189.566666666667000000
          50.800000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Charges:'
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
      object AddMarg: TQRLabel
        Left = 840
        Top = 24
        Width = 58
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1778.000000000000000000
          50.800000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'AddMarg'
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
      object AddPerc: TQRLabel
        Left = 904
        Top = 24
        Width = 64
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1913.466666666667000000
          50.800000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Add%Age'
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
    object Seq3QRGroup: TQRGroup
      Left = 47
      Top = 298
      Width = 1309
      Height = 41
      AlignToBottom = False
      BeforePrint = Seq3QRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        86.783333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cust_type_desc'
      Master = PrintPOsQuickReport
      ReprintOnNewPage = False
      object SequenceName3QRLabel: TQRLabel
        Left = 31
        Top = 12
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          65.616666666666670000
          25.400000000000000000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sequence:'
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
      object SeqDesc3QRLabel: TQRLabel
        Left = 175
        Top = 12
        Width = 135
        Height = 21
        Size.Values = (
          44.450000000000000000
          370.416666666666700000
          25.400000000000000000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SeqDesc3QRLabel'
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
  end
  object AddCostsDataSource: TDataSource
    DataSet = AddCostsQuery
    Left = 448
    Top = 32
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Amount) as Add_Cost, sum(Quotation_Price) as Add_Pric' +
        'e'
      'from Purch_Ord_line_add_chg'
      
        '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder) an' +
        'd'
      '        (Purch_Ord_Line_Add_Chg.Line = :Purch_OrdLine)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 272
    Top = 22
    ParamData = <
      item
        Name = 'PurchOrder'
        DataType = ftFloat
      end
      item
        Name = 'Purch_OrdLine'
        DataType = ftInteger
      end>
  end
end
