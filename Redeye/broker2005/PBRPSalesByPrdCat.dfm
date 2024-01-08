object PBRPSalesByPrdCatFrm: TPBRPSalesByPrdCatFrm
  Left = 4
  Top = 122
  Caption = 'Sales Order By Product Category Report Print Preview'
  ClientHeight = 518
  ClientWidth = 1147
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByPrdCat: TQuickRep
    Left = 0
    Top = 0
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qckrpSalesByPrdCatBeforePrint
    DataSet = qrySalesbyPrdCat
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
      Height = 91
      Frame.DrawBottom = True
      AfterPrint = qrbndPageHeaderAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        240.770833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 289
        Top = 8
        Width = 469
        Height = 23
        Size.Values = (
          60.854166666666670000
          764.645833333333300000
          21.166666666666670000
          1240.895833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales By Product Category (Summary) - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel5: TQRLabel
        Left = 120
        Top = 72
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          190.500000000000000000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Category'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 550
        Top = 72
        Width = 26
        Height = 17
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          190.500000000000000000
          68.791666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 632
        Top = 72
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          190.500000000000000000
          76.729166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 878
        Top = 72
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          2323.041666666667000000
          190.500000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Cost'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblDateRange: TQRLabel
        Left = 451
        Top = 32
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666670000
          1193.270833333333000000
          84.666666666666670000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Invoices Dated from: '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 975
        Top = 8
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2579.687500000000000000
          21.166666666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
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
      object MarginQRLabel: TQRLabel
        Left = 981
        Top = 72
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          2595.562500000000000000
          190.500000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 951
        Top = 56
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          2516.187500000000000000
          148.166666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Gross Profit'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 437
        Top = 72
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          1156.229166666667000000
          190.500000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Sales'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 680
        Top = 72
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1799.166666666667000000
          190.500000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Call Off Costs'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 776
        Top = 72
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          2053.166666666667000000
          190.500000000000000000
          216.958333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job/PO Costs'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 269
      Width = 1047
      Height = 38
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSbDtlInvTot
      Size.Values = (
        100.541666666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object TotalSellLbl: TQRLabel
        Left = 441
        Top = 9
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          1166.812500000000000000
          23.812500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object TotalVatlbl: TQRLabel
        Left = 518
        Top = 9
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          1370.541666666667000000
          23.812500000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalVatlbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object TotalGoodsLbl: TQRLabel
        Left = 583
        Top = 9
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1542.520833333333000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object TotalCostLbl: TQRLabel
        Left = 855
        Top = 9
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          2262.187500000000000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object GrpMargQRLbl: TQRLabel
        Left = 940
        Top = 9
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          2487.083333333333000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'GrpMargQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 120
        Top = 8
        Width = 305
        Height = 17
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          21.166666666666670000
          806.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabel1'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrshpCategoryLine: TQRShape
        Left = 408
        Top = 0
        Width = 613
        Height = 7
        Size.Values = (
          18.520833333333340000
          1079.500000000000000000
          0.000000000000000000
          1621.895833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object CallOffCostLbl: TQRLabel
        Left = 682
        Top = 9
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1804.458333333333000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object JobCostLbl: TQRLabel
        Left = 771
        Top = 9
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          2039.937500000000000000
          23.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
    object LocQRGroupHeader: TQRGroup
      Left = 38
      Top = 129
      Width = 1047
      Height = 25
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qrySalesbyPrdCat.Invoice_location_Descr'
      FooterBand = LocQRGroupFooter
      Master = qckrpSalesByPrdCat
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 152
        Top = 4
        Width = 137
        Height = 17
        Size.Values = (
          44.979166666666670000
          402.166666666666700000
          10.583333333333330000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyPrdCat
        DataField = 'Invoice_Location_Descr'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 32
        Top = 4
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          10.583333333333330000
          272.520833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Revenue Centre'
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
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 347
      Width = 1047
      Height = 40
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBand1
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object RepJobCostQRLbl: TQRLabel
        Left = 759
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          2008.187500000000000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepMargQRLbl: TQRLabel
        Left = 923
        Top = 13
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          2442.104166666667000000
          34.395833333333340000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'RepMargQRLbl'
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
      object QRShape2: TQRShape
        Left = 408
        Top = 2
        Width = 340
        Height = 9
        Size.Values = (
          23.812500000000000000
          1079.500000000000000000
          5.291666666666667000
          899.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTotSellQRLbl: TQRLabel
        Left = 431
        Top = 13
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          34.395833333333340000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object RepTotVatQRLbl: TQRLabel
        Left = 510
        Top = 13
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1349.375000000000000000
          34.395833333333340000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalVatlbl'
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
      object RepTotGoodsQRLbl: TQRLabel
        Left = 573
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1516.062500000000000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepTotCostQRLbl: TQRLabel
        Left = 841
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          2225.145833333333000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRShape4: TQRShape
        Left = 730
        Top = 2
        Width = 290
        Height = 9
        Size.Values = (
          23.812500000000000000
          1931.458333333333000000
          5.291666666666667000
          767.291666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 284
        Top = 13
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          751.416666666666800000
          34.395833333333340000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Totals'
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
      object RepCallOffCostQRLbl: TQRLabel
        Left = 669
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1770.062500000000000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
    end
    object QRSubDetInvlns: TQRSubDetail
      Left = 38
      Top = 179
      Width = 1047
      Height = 20
      AlignToBottom = False
      BeforePrint = QRSubDetInvlnsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByPrdCat
      DataSet = qrygetinvline
      PrintBefore = False
      PrintIfEmpty = True
      object QRLblGoods: TQRLabel
        Left = 443
        Top = 2
        Width = 62
        Height = 16
        Size.Values = (
          42.333333333333340000
          1172.104166666667000000
          5.291666666666667000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGoods'
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
      object QRLblVat: TQRLabel
        Left = 529
        Top = 2
        Width = 47
        Height = 16
        Size.Values = (
          42.333333333333340000
          1399.645833333333000000
          5.291666666666667000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblVat'
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
      object QRLblTot: TQRLabel
        Left = 618
        Top = 2
        Width = 45
        Height = 16
        Size.Values = (
          42.333333333333340000
          1635.125000000000000000
          5.291666666666667000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblTot'
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
      object LblDesc: TQRLabel
        Left = 120
        Top = 0
        Width = 241
        Height = 17
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          0.000000000000000000
          637.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblDescription'
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
      object TotCstQRLbl: TQRLabel
        Left = 876
        Top = 1
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333340000
          2317.750000000000000000
          2.645833333333333000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object MargQRLbl: TQRLabel
        Left = 968
        Top = 2
        Width = 54
        Height = 16
        Size.Values = (
          42.333333333333340000
          2561.166666666667000000
          5.291666666666667000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'MargQRLbl'
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
      object CallOffCstqrlbl: TQRLabel
        Left = 691
        Top = 1
        Width = 70
        Height = 16
        Size.Values = (
          42.333333333333340000
          1828.270833333333000000
          2.645833333333333000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'CallOffCstqrlbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object JobCstqrLbl: TQRLabel
        Left = 792
        Top = 1
        Width = 58
        Height = 16
        Size.Values = (
          42.333333333333340000
          2095.500000000000000000
          2.645833333333333000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'JobCstqrLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRSbDtlInvTot: TQRSubDetail
      Left = 38
      Top = 199
      Width = 1047
      Height = 45
      AfterPrint = QRSbDtlInvTotAfterPrint
      AlignToBottom = False
      BeforePrint = QRSbDtlInvTotBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByPrdCat
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape5: TQRShape
        Left = 400
        Top = 0
        Width = 622
        Height = 10
        Size.Values = (
          26.458333333333330000
          1058.333333333333000000
          0.000000000000000000
          1645.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblInvTotCst: TQRLabel
        Left = 866
        Top = 15
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          2291.291666666667000000
          39.687500000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblInvTotMarg: TQRLabel
        Left = 961
        Top = 16
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          2542.645833333333000000
          42.333333333333340000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'MargQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblInvGoods: TQRLabel
        Left = 577
        Top = 15
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1526.645833333333000000
          39.687500000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblInvGoods'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblInvVat: TQRLabel
        Left = 510
        Top = 15
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1349.375000000000000000
          39.687500000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblInvVat'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblInvSell: TQRLabel
        Left = 435
        Top = 15
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          1150.937500000000000000
          39.687500000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblInvSell'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblInvJobCst: TQRLabel
        Left = 781
        Top = 15
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          2066.395833333333000000
          39.687500000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblInvCallOffCst: TQRLabel
        Left = 692
        Top = 15
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1830.916666666667000000
          39.687500000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object RepQRGroup: TQRGroup
      Left = 38
      Top = 154
      Width = 1047
      Height = 25
      AlignToBottom = False
      BeforePrint = RepQRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qrySalesbyPrdCat.Description'
      FooterBand = QRBand1
      Master = qckrpSalesByPrdCat
      ReprintOnNewPage = False
      object qrdbCategory: TQRDBText
        Left = 120
        Top = 4
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          10.583333333333330000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyPrdCat
        DataField = 'Description'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrbfProdType: TQRBand
      Left = 38
      Top = 244
      Width = 1047
      Height = 25
      AfterPrint = qrbfProdTypeAfterPrint
      AlignToBottom = False
      BeforePrint = qrbfProdTypeBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblProductType: TQRLabel
        Left = 168
        Top = 4
        Width = 257
        Height = 17
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          10.583333333333330000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblProductType'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object ProdTotalSellLbl: TQRLabel
        Left = 443
        Top = 5
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          1172.104166666667000000
          13.229166666666670000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGoods'
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
      object ProdTotalVatLbl: TQRLabel
        Left = 530
        Top = 5
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          1402.291666666667000000
          13.229166666666670000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblVat'
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
      object ProdTotalGoodsLbl: TQRLabel
        Left = 618
        Top = 5
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          1635.125000000000000000
          13.229166666666670000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblTot'
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
      object ProdTotalCostLbl: TQRLabel
        Left = 875
        Top = 5
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          2315.104166666667000000
          13.229166666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object ProdMarginLbl: TQRLabel
        Left = 968
        Top = 5
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          2561.166666666667000000
          13.229166666666670000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'MargQRLbl'
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
      object ProdJobCostlbl: TQRLabel
        Left = 779
        Top = 5
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          2061.104166666667000000
          13.229166666666670000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ProdJobCostlbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object ProdCallOffCostlbl: TQRLabel
        Left = 674
        Top = 5
        Width = 88
        Height = 15
        Size.Values = (
          39.687500000000000000
          1783.291666666667000000
          13.229166666666670000
          232.833333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ProdCallOffCostlbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrgpProdType: TQRGroup
      Left = 38
      Top = 179
      Width = 1047
      Height = 0
      AlignToBottom = False
      BeforePrint = qrgpProdTypeBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qrySalesbyPrdCat.Product_Type_Description'
      FooterBand = qrbfProdType
      Master = qckrpSalesByPrdCat
      ReprintOnNewPage = False
    end
    object LocQRGroupFooter: TQRBand
      Left = 38
      Top = 307
      Width = 1047
      Height = 40
      AfterPrint = LocQRGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = LocQRGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object LocMarginLbl: TQRLabel
        Left = 925
        Top = 13
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          2447.395833333333000000
          34.395833333333340000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'GrpMargQRLbl'
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
      object QRLabel3: TQRLabel
        Left = 32
        Top = 12
        Width = 166
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          31.750000000000000000
          439.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals for Revenue Centre'
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
      object QRDBText2: TQRDBText
        Left = 208
        Top = 12
        Width = 137
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333400000
          31.750000000000000000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyPrdCat
        DataField = 'Invoice_Location_Descr'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object locTotalSellLbl: TQRLabel
        Left = 430
        Top = 13
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          34.395833333333340000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object LocTotalVatLbl: TQRLabel
        Left = 509
        Top = 13
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1346.729166666667000000
          34.395833333333340000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalVatlbl'
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
      object LocTotalGoodsLbl: TQRLabel
        Left = 572
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1513.416666666667000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object LocTotalCostLbl: TQRLabel
        Left = 842
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          2227.791666666667000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRShape1: TQRShape
        Left = 408
        Top = 1
        Width = 612
        Height = 7
        Size.Values = (
          18.520833333333340000
          1079.500000000000000000
          2.645833333333333000
          1619.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 408
        Top = 33
        Width = 612
        Height = 7
        Size.Values = (
          18.520833333333340000
          1079.500000000000000000
          87.312500000000000000
          1619.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object LocCallOffCostLbl: TQRLabel
        Left = 669
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1770.062500000000000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object LocJobCostLbl: TQRLabel
        Left = 759
        Top = 13
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          2008.187500000000000000
          34.395833333333340000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
    end
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 232
    Top = 14
    ParamData = <
      item
        Name = 'PurchOrder'
        DataType = ftFloat
      end>
  end
  object GetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '      Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor ' +
        'as Order_Unit_Factor'
      
        'FROM Price_Unit INNER JOIN (Purchase_OrderLine INNER JOIN (Sales' +
        '_Invoice'
      
        '  INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice =' +
        ' Sales_Invoice_Line.Sales_Invoice) ON'
      
        '  (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND (Purch' +
        'ase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Order' +
        ')) ON (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      
        '  WHERE (((Sales_Invoice.Sales_Invoice)=:Invoice_No) and (Invoic' +
        'e_Line_No = :Line_No));'
      ''
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
    Left = 344
    Top = 8
    ParamData = <
      item
        Name = 'invoice_no'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qrySalesbyPrdCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer,'
      
        'Sales_Invoice.Inv_to_Branch AS Branch_no, Sales_Invoice.Sales_In' +
        'voice,'
      
        'Customer_Branch.Account_Code, Customer.Name, Sales_Invoice.Sales' +
        '_Invoice_No,'
      'Sales_Invoice.Goods_Value, Sales_Invoice.Vat_Value,'
      
        '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Tot' +
        'al,'
      'Sales_Invoice_Line.Invoice_Line_No, Sales_Invoice.Invoice_Date,'
      
        'Sales_Invoice.Invoice_or_Credit, Sales_Invoice.Rep, Sales_Invoic' +
        'e.Sales_invoice_type,'
      'Sales_Invoice.Inactive, Sales_Invoice.Reference,'
      'Sales_Invoice.Invoice_Description, (select Supplier.Name'
      #9'from Purchase_order, Supplier, Supplier_Branch'
      
        #9'where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purcha' +
        'se_Order and'
      #9#9'((Purchase_Order.Supplier = Supplier_Branch.Supplier) and'
      #9#9'(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and'
      
        #9#9'(Supplier_Branch.Supplier = Supplier.Supplier)) AS Supplier_Na' +
        'me,'
      '    Rep.Name AS Rep_Name, Product_Type.Description'
      
        'FROM Product_Type INNER JOIN (Customer INNER JOIN (((Customer_Br' +
        'anch'
      
        'INNER JOIN Sales_Invoice ON (Customer_Branch.Customer = Sales_In' +
        'voice.Inv_to_Customer)'
      ' AND (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch))'
      ' INNER JOIN Rep ON Sales_Invoice.Rep = Rep.Rep)'
      ' INNER JOIN Sales_Invoice_Line'
      
        ' ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoi' +
        'ce)'
      ' ON Customer.Customer = Customer_Branch.Customer)'
      ' ON Product_Type.Product_Type = Sales_Invoice_Line.Product_Type'
      ''
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
    Left = 184
    Top = 88
    object qrySalesbyPrdCatCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesbyPrdCatBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesbyPrdCatSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesbyPrdCatAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qrySalesbyPrdCatName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesbyPrdCatGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object qrySalesbyPrdCatVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object qrySalesbyPrdCatGoods_Total: TCurrencyField
      FieldName = 'Goods_Total'
    end
    object qrySalesbyPrdCatInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesbyPrdCatInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyPrdCatRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySalesbyPrdCatSales_Invoice_type: TStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyPrdCatInactive: TStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyPrdCatReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesbyPrdCatSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatInvoiceRef: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      Size = 10
      Calculated = True
    end
    object qrySalesbyPrdCatInvoice_Description: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesbyPrdCatSupplier_Desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'Supplier_Desc'
      Size = 30
      Calculated = True
    end
    object qrySalesbyPrdCatOrderDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'OrderDesc'
      Size = 15
      Calculated = True
    end
    object qrySalesbyPrdCatDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qrySalesbyPrdCatProduct_Type_Description: TStringField
      FieldName = 'Product_Type_Description'
    end
    object qrySalesbyPrdCatInvoice_Location: TIntegerField
      FieldName = 'Invoice_Location'
    end
    object qrySalesbyPrdCatInvoice_Location_Descr: TStringField
      FieldName = 'Invoice_Location_Descr'
    end
  end
  object qryGetPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_ord_no, Supplier.Name,'
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      
        'from Sales_invoice_line, Sales_order, Purch_Ord, Purch_Ord_Line,' +
        ' supplier'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No) and'
      '(Sales_Invoice_Line.Sales_order = Sales_Order.Sales_order) and'
      '(Sales_Order.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_Invoice_Line.Sales_ord' +
        'er_Line_no)'
      ') and'
      '(Purch_Ord.Supplier = Supplier.Supplier)'
      'Group By'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_Ord_no, Supplier.Name'
      ' '
      ' '
      ' '
      ' ')
    Left = 392
    Top = 48
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qryGetSOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Part_Cost*(((:Qty_Invoiced)*1.0000)/(Purch_Pack_Quant' +
        'ity*1.0000))) as Total_Cost'
      'from Sales_Order_Line'
      'where Sales_Order = :Sales_Order  and'
      '    (Sales_Order_Line_No = :Sales_Order_Line)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 184
    Top = 56
    ParamData = <
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line'
      end>
  end
  object qryAddPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Cost'
      'from Purch_Ord_add_charge'
      '  where (Purch_Ord_Add_Charge.Purch_Ord = :Purch_Ord) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 54
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object oldqryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Dets.Job_Bag,'
      #9'sum(Job_Bag_Line_Dets.Job_Bag_Line_Cost) as Total_Cost'
      'from Job_Bag_Line_Dets, Sales_invoice_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '('
      '(Sales_invoice_Line.Job_Bag = Job_Bag_Line_Dets.Job_Bag) and'
      
        '(Sales_invoice_Line.Job_Bag_Line = Job_Bag_Line_Dets.Job_Bag_Lin' +
        'e)'
      ')'
      'group by'
      #9'Job_Bag_Line_Dets.Job_Bag')
    Left = 118
    Top = 228
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Sum(Amount)'
      '         from Purch_ord_line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Sales_Inv' +
        'oice_Line.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Sales_Invoice_Line.' +
        'Line) as Extra_Cost'
      'FROM Price_Unit'
      '     RIGHT JOIN (Purchase_OrderLine'
      '     RIGHT JOIN (Job_Bag_Line_Dets'
      '     INNER JOIN Sales_Invoice_Line ON'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line) AND'
      
        '        (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_Bag)' +
        ') ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'WHERE (Sales_Invoice = :Sales_Invoice) and'
      '  (Sales_Invoice_Line.Invoice_Line_No = :line_No)'
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 256
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'line_No'
      end>
  end
  object qryCreditLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor as Invoice_Unit_Factor,'
      '        Sales_Invoice_Line.Cost_Price,'
      '        Sales_Invoice_Line.Purchase_order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_bag_Line,'
      '        Sales_Invoice_Line.Credit_Type'
      'FROM Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE (Sales_invoice_Line.Sales_invoice = :Sales_invoice) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No)'
      ''
      ' '
      ' ')
    Left = 182
    Top = 182
    ParamData = <
      item
        Name = 'Sales_invoice'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qrygetinvline: TFDQuery
    MasterSource = DtSrcReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.*,'
      '        Price_Unit.Price_Unit,'
      '        Price_Unit.Description AS Sales_Unit_Desc,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Vat_Code.VAT_Ref'
      'FROM Vat_Code'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      
        '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) O' +
        'N'
      '        Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code'
      'where sales_invoice_line.sales_invoice = :sales_invoice and'
      '      sales_invoice_line.invoice_line_no = :invoice_line_no'
      '')
    Left = 106
    Top = 197
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end
      item
        Name = 'invoice_line_no'
      end>
    object qrygetinvlineSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrygetinvlineInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qrygetinvlinePurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qrygetinvlineLine: TIntegerField
      FieldName = 'Line'
    end
    object qrygetinvlineQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qrygetinvlineGoods_Value: TFloatField
      FieldName = 'Goods_Value'
    end
    object qrygetinvlineVat_Code: TIntegerField
      FieldName = 'Vat_Code'
    end
    object qrygetinvlineVat_Value: TFloatField
      FieldName = 'Vat_Value'
    end
    object qrygetinvlineProduct_Type: TIntegerField
      FieldName = 'Product_Type'
    end
    object qrygetinvlineSales_Invoice_Status: TIntegerField
      FieldName = 'Sales_Invoice_Status'
    end
    object qrygetinvlinePrice_Unit: TIntegerField
      FieldName = 'Price_Unit'
    end
    object qrygetinvlineNominal: TStringField
      FieldName = 'Nominal'
      FixedChar = True
      Size = 32
    end
    object qrygetinvlineJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qrygetinvlineJob_Bag_Line: TIntegerField
      FieldName = 'Job_Bag_Line'
    end
    object qrygetinvlineNarrative: TIntegerField
      FieldName = 'Narrative'
    end
    object qrygetinvlineReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 60
    end
    object qrygetinvlineInternal_Narrative: TIntegerField
      FieldName = 'Internal_Narrative'
    end
    object qrygetinvlineSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrygetinvlineSales_Order_line_no: TIntegerField
      FieldName = 'Sales_Order_line_no'
    end
    object qrygetinvlineCredit_type: TStringField
      FieldName = 'Credit_type'
      FixedChar = True
      Size = 2
    end
    object qrygetinvlineNot_Printed: TStringField
      FieldName = 'Not_Printed'
      FixedChar = True
      Size = 2
    end
    object qrygetinvlinecost_price: TFloatField
      FieldName = 'cost_price'
    end
    object qrygetinvlinePrice_Unit_1: TIntegerField
      FieldName = 'Price_Unit_1'
    end
    object qrygetinvlineSales_Unit_Desc: TStringField
      FieldName = 'Sales_Unit_Desc'
      FixedChar = True
      Size = 80
    end
    object qrygetinvlinePrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qrygetinvlineVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qrygetinvlineDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qrygetinvlineVAT_Ref: TStringField
      FieldName = 'VAT_Ref'
      FixedChar = True
      Size = 2
    end
  end
  object DtSrcReport: TDataSource
    DataSet = qrySalesbyPrdCat
    Left = 286
    Top = 54
  end
  object qryInvCharges: TFDQuery
    MasterSource = DtSrcReport
    MasterFields = 'Sales_Invoice'
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_invoice_Add_Charge.*, VAT_Code.VAT_Rate'
      'from Sales_invoice_Add_Charge, VAT_Code'
      
        'where Sales_invoice_Add_Charge.Sales_Invoice = :Sales_Invoice an' +
        'd'
      'Sales_invoice_Add_Charge.VAT_Code = Vat_Code.Vat_Code')
    Left = 40
    Top = 222
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object qryJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Descr, Supplier.Name'
      'from Job_Bag_Line_Dets, Supplier'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line and'
      'Job_Bag_Line_Dets.Supplier = Supplier.Supplier')
    Left = 472
    Top = 36
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part.Part, '
      '          Part_Description, '
      '          Sales_order_line.Sell_Pack_Quantity, '
      '          Price_Unit'
      'from Sales_order_line, '
      '        Part'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no and'
      '(Sales_order_line.Part = Part.Part)')
    Left = 512
    Top = 12
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_orderLine.Customers_Desc,'
      '        Purchase_orderLine.Cust_order_no,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr'
      'FROM Form_Reference'
      '      RIGHT JOIN Purchase_orderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_orderLine.Form_' +
        'Reference'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line'
      ' ')
    Left = 584
    Top = 20
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier.Name'
      'from Purchase_Order, Supplier'
      'where Purchase_Order = :Purchase_order and'
      'Purchase_Order.Supplier = Supplier.Supplier')
    Left = 632
    Top = 38
    ParamData = <
      item
        Name = 'Purchase_order'
      end>
  end
  object qryGetProdCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Order_Price,'
      '        Price_unit_Factor as Order_unit_Factor,'
      '        Quantity'
      'from Purchase_OrderLine, Price_Unit'
      'where Purchase_Order = :Purchase_Order AND'
      'Line = :Line AND'
      '(Purchase_OrderLine.Order_unit = Price_unit.Price_Unit)'
      ' ')
    Left = 530
    Top = 166
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetPOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  Purch_Ord.Purch_Ord,'
      '  Purch_Ord.Purch_ord_no,'
      '  Purch_ord_Line.Purch_Pack_Quantity,'
      '  Purch_ord_Line.Purchase_Price'
      'from Sales_order_Line, Purch_Ord, Purch_Ord_Line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ') and'
      '(Sales_Order_Line.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_order_line.Sales_order' +
        '_Line_no)'
      ')'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 432
    Top = 184
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetSOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Sales_Order_line.Part_Cost,'
      '        Sales_Order_line.Purch_Pack_Quantity'
      'FROM Sales_Order_line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' ')
    Left = 464
    Top = 216
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetJBCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag_Line_Cost '
      'FROM Job_Bag_Line_Dets'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      'Job_Bag_Line_Dets.Job_Bag_line = :Job_Bag_Line'
      ' ')
    Left = 452
    Top = 296
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetInvAddChrg: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_invoice_add_charge.*,'
      '  vat_code.vat_rate'
      'from sales_invoice_add_charge'
      
        'inner join vat_code on sales_invoice_add_charge.vat_code = vat_c' +
        'ode.vat_code'
      'where sales_invoice = :sales_invoice '
      ' ')
    Left = 74
    Top = 296
    ParamData = <
      item
        Name = 'sales_invoice'
      end>
  end
end
