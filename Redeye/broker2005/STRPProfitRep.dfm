object STRPProfitRepfrm: TSTRPProfitRepfrm
  Left = 211
  Top = 123
  BorderStyle = bsSingle
  Caption = 'Profit Report'
  ClientHeight = 452
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  
  TextHeight = 15
  object qrProfitRep: TQuickRep
    Left = -328
    Top = 8
    Width = 1123
    Height = 794
    ShowingPreview = False
    DataSet = qryProfitRepAll
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
      Left = 38
      Top = 38
      Width = 1047
      Height = 107
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.104166666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 112
        Top = 72
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666700000
          296.333333333333000000
          190.500000000000000000
          185.208333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 24
        Top = 72
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          190.500000000000000000
          161.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 504
        Top = 72
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          190.500000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 589
        Top = 72
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          190.500000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sell Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 672
        Top = 72
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          1778.000000000000000000
          190.500000000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 736
        Top = 72
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          1947.333333333333000000
          190.500000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Marg. %'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTitle: TQRLabel
        Left = 338
        Top = 8
        Width = 370
        Height = 25
        Size.Values = (
          66.145833333333330000
          894.291666666666700000
          21.166666666666670000
          978.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales Order Margin Report - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object qrlblDateRange: TQRLabel
        Left = 479
        Top = 32
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1267.354166666667000000
          84.666666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'qrlblDateRange'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 200
        Top = 56
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666700000
          529.166666666667000000
          148.166666666667000000
          185.208333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 200
        Top = 72
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666700000
          529.166666666667000000
          190.500000000000000000
          164.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order type'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 24
        Top = 96
        Width = 1009
        Height = 5
        Size.Values = (
          13.229166666666700000
          63.500000000000000000
          254.000000000000000000
          2669.645833333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblSortby: TQRLabel
        Left = 24
        Top = 40
        Width = 63
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          105.833333333333000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblSortby'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrdbtxtSortBy: TQRDBText
        Left = 104
        Top = 40
        Width = 81
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666700000
          275.166666666667000000
          105.833333333333000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 808
        Top = 72
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          2137.833333333333000000
          190.500000000000000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Replenish from'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpHeader: TQRGroup
      Left = 38
      Top = 145
      Width = 1047
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryProfitRepAll.Customer_Name'
      FooterBand = qrbndGrpFooter
      Master = qrProfitRep
      ReprintOnNewPage = False
      object lblSortSequence: TQRLabel
        Left = 8
        Top = 0
        Width = 107
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          0.000000000000000000
          283.104166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSortSequence'
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
        FontSize = 10
      end
      object lbldbSortField: TQRDBText
        Left = 136
        Top = 0
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666700000
          359.833333333333000000
          0.000000000000000000
          240.770833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryProfitRepAll
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
        FontSize = 10
      end
    end
    object qrbndGrpFooter: TQRBand
      Left = 38
      Top = 206
      Width = 1047
      Height = 40
      AfterPrint = qrbndGrpFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndGrpFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblCostSubTotal: TQRLabel
        Left = 525
        Top = 16
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          1389.062500000000000000
          42.333333333333330000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'CostST'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblPriceSubTotal: TQRLabel
        Left = 600
        Top = 16
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          42.333333333333330000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PriceST'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 416
        Top = 16
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          42.333333333333330000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SubTotals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape1: TQRShape
        Left = 464
        Top = 4
        Width = 321
        Height = 8
        Size.Values = (
          21.166666666666700000
          1227.666666666670000000
          10.583333333333300000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblMarginSubTotal: TQRLabel
        Left = 665
        Top = 16
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1759.479166666667000000
          42.333333333333330000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'MargST'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblMarginPercSubTotal: TQRLabel
        Left = 731
        Top = 16
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1934.104166666667000000
          42.333333333333330000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Marg%ST'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object qrbndSummary: TQRBand
      Left = 38
      Top = 246
      Width = 1047
      Height = 40
      AlignToBottom = False
      BeforePrint = qrbndSummaryBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel13: TQRLabel
        Left = 405
        Top = 12
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          31.750000000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'GrandTotals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblCostGrandTotal: TQRLabel
        Left = 524
        Top = 12
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          1386.416666666667000000
          31.750000000000000000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'CostGT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblPriceGrandTotal: TQRLabel
        Left = 598
        Top = 12
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1582.208333333333000000
          31.750000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PriceGT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblMarginGrandTotal: TQRLabel
        Left = 664
        Top = 12
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1756.833333333333000000
          31.750000000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'MargGT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblMarginPercGrandTotal: TQRLabel
        Left = 731
        Top = 12
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1934.104166666667000000
          31.750000000000000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Marg%GT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 464
        Top = 0
        Width = 321
        Height = 15
        Size.Values = (
          39.687500000000000000
          1227.666666666670000000
          0.000000000000000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 286
      Width = 1047
      Height = 31
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRSysData1: TQRSysData
        Left = 500
        Top = 8
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1322.916666666667000000
          21.166666666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Color = clWhite
        Data = qrsPageNumber
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrbndDetail: TQRBand
      Left = 38
      Top = 169
      Width = 1047
      Height = 37
      AfterPrint = qrbndDetailAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        97.895833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText9: TQRDBText
        Left = 112
        Top = 0
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666700000
          296.333333333333000000
          0.000000000000000000
          179.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryProfitRepAll
        DataField = 'sales_order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
      object QRDBText11: TQRDBText
        Left = 24
        Top = 0
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryProfitRepAll
        DataField = 'date_ordered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
      object qrlblMargPerc: TQRLabel
        Left = 708
        Top = 0
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1873.250000000000000000
          0.000000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblMargPerc'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 200
        Top = 0
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          0.000000000000000000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryProfitRepAll
        DataField = 'Customer_Name'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblMargin: TQRLabel
        Left = 648
        Top = 0
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1714.500000000000000000
          0.000000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblMargin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblTotalSell: TQRLabel
        Left = 572
        Top = 0
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1513.416666666667000000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalSell'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblTotalCost: TQRLabel
        Left = 488
        Top = 0
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          0.000000000000000000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalCost'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblDescription: TQRLabel
        Left = 200
        Top = 16
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666700000
          529.166666666667000000
          42.333333333333300000
          209.020833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblDescription'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblReplenishSource: TQRLabel
        Left = 808
        Top = 0
        Width = 123
        Height = 17
        Size.Values = (
          44.979166666666670000
          2137.833333333333000000
          0.000000000000000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblReplenishSource'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
  end
  object qryProfitRepAll: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sales_Order.Sales_Order, '
      #9'Sales_Order.Date_Ordered, '
      #9'Sales_Order.Cust_Order_No, '
      #9'Sales_Order.Customer, '
      #9'Sales_Order.Branch_no, '
      #9'Customer.Name as Customer_Name, '
      #9'Customer_Branch.Name as Branch_Name, '
      #9'Sales_OrderRep.Rep, '
      #9'Rep.Name as Rep_Name,'
      #9'Replenish_Source.Replenish_ID, '
      #9'Replenish_Source.Replenish_Source_Descr,'
      '                Sales_Order.Supplier,'
      '                Sales_Order.Part_Store,'
      
        #9'Sum(Sales_Order_line.Part_Sales_Price*(Sales_Order_line.Quantit' +
        'y_Ordered/Sales_Order_line.Sell_pack_Quantity)) AS Total_Sell, '
      
        #9'Sum(Sales_Order_line.Part_Cost*(Sales_Order_line.Quantity_Order' +
        'ed/Sales_Order_line.Purch_pack_Quantity)) AS Total_Cost, Repleni' +
        'sh_Source.Replenish_ID, Replenish_Source.Replenish_Source_Descr'
      'FROM Replenish_Source '
      #9'INNER JOIN (Customer '
      #9'INNER JOIN (((Customer_Branch '
      #9'INNER JOIN Sales_Order ON '
      #9#9'(Customer_Branch.Customer = Sales_Order.Customer) AND '
      #9#9'(Customer_Branch.Branch_no = Sales_Order.Branch_no)) '
      #9'INNER JOIN Sales_Order_line ON '
      #9#9'Sales_Order.Sales_Order = Sales_Order_line.Sales_Order) '
      #9'INNER JOIN (Rep '
      #9'INNER JOIN Sales_OrderRep ON '
      #9#9'Rep.Rep = Sales_OrderRep.Rep) ON '
      #9#9'Sales_Order.Sales_Order = Sales_OrderRep.Sales_Order) ON '
      #9#9'Customer.Customer = Customer_Branch.Customer) ON'
      
        #9#9'Replenish_Source.Replenish_Source = Sales_Order.Replenish_Sour' +
        'ce'
      'GROUP BY Sales_Order.Sales_Order, '
      #9'Sales_Order.Date_Ordered, '
      #9'Sales_Order.Cust_Order_No, '
      #9'Sales_Order.Customer, '
      #9'Sales_Order.Branch_no, Customer.Name, '
      #9'Customer_Branch.Name, '
      #9'Sales_OrderRep.Rep, '
      #9'Rep.Name, '
      #9'Replenish_Source.Replenish_ID, '
      #9'Replenish_Source.Replenish_Source_Descr,'
      '                Sales_order.Customer,'
      '                Sales_Order.Supplier,'
      '                Sales_Order.Part_Store'
      'HAVING      ((sales_order.date_ordered >= :Date_From) and'
      '            (sales_order.date_ordered <= :Date_To))'
      ''
      ''
      ' '
      ' ')
    Left = 128
    Top = 24
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object qryPartStore: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part_Store_Name'
      'from Part_Store'
      'where Part_Store = :Part_Store'
      ' ')
    Left = 472
    Top = 32
    ParamData = <
      item
        Name = 'Part_Store'
      end>
  end
  object qrySupplier: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name'
      'from Supplier'
      'where Supplier = :Supplier')
    Left = 560
    Top = 32
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
end
