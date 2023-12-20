object STRPPordfrm: TSTRPPordfrm
  Left = 25
  Top = 103
  Caption = 'Purchase Order Report'
  ClientHeight = 589
  ClientWidth = 1292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 0
    Top = 8
    Width = 1123
    Height = 794
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
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
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
    object QRBand1: TQRBand
      Left = 38
      Top = 48
      Width = 1047
      Height = 120
      Frame.DrawBottom = True
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        317.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel14: TQRLabel
        Left = 966
        Top = 88
        Width = 96
        Height = 28
        Size.Values = (
          74.083333333333340000
          2555.875000000000000000
          232.833333333333400000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Retail Delivered'
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
      object qrlblTitle: TQRLabel
        Left = 433
        Top = 8
        Width = 181
        Height = 20
        Size.Values = (
          52.916666666666670000
          1145.645833333333000000
          21.166666666666670000
          478.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Purchase Order Report '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrlblselection: TQRLabel
        Left = 491
        Top = 30
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          79.375000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'qrlblselection'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRlblDesc: TQRLabel
        Left = 306
        Top = 88
        Width = 64
        Height = 28
        Size.Values = (
          74.083333333333340000
          809.625000000000000000
          232.833333333333400000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Product / Description'
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
      object QRLabel3: TQRLabel
        Left = 659
        Top = 88
        Width = 46
        Height = 28
        Size.Values = (
          74.083333333333340000
          1743.604166666667000000
          232.833333333333400000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Order Quantity'
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
      object QRLabel7: TQRLabel
        Left = 806
        Top = 88
        Width = 96
        Height = 28
        Size.Values = (
          74.083333333333340000
          2132.541666666667000000
          232.833333333333400000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Value Delivered'
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
      object QRSysData1: TQRSysData
        Left = 936
        Top = 8
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2476.500000000000000000
          21.166666666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
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
      object qrlblDateSelection: TQRLabel
        Left = 480
        Top = 70
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          185.208333333333300000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'qrlblDateSelection'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 523
        Top = 88
        Width = 60
        Height = 28
        Size.Values = (
          74.083333333333340000
          1383.770833333333000000
          232.833333333333400000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cost Pack Size'
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
      object QRLabel5: TQRLabel
        Left = 587
        Top = 100
        Width = 58
        Height = 16
        Size.Values = (
          42.333333333333340000
          1553.104166666667000000
          264.583333333333400000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
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
      object QRLblDt: TQRLabel
        Left = 59
        Top = 88
        Width = 99
        Height = 28
        Size.Values = (
          74.083333333333320000
          156.104166666666700000
          232.833333333333300000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Order Date / Order Description'
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
      object QRLabel10: TQRLabel
        Left = 3
        Top = 88
        Width = 54
        Height = 28
        Size.Values = (
          74.083333333333300000
          7.937500000000000000
          232.833333333333000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Order Number'
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
      object QRLabel11: TQRLabel
        Left = 899
        Top = 88
        Width = 80
        Height = 28
        Size.Values = (
          74.083333333333340000
          2378.604166666667000000
          232.833333333333400000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Value of Extra Charges'
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
      object QRLabel12: TQRLabel
        Left = 723
        Top = 88
        Width = 85
        Height = 28
        Size.Values = (
          74.083333333333340000
          1912.937500000000000000
          232.833333333333400000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Delivered Quantity'
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
      object QRLblPartSelection: TQRLabel
        Left = 491
        Top = 50
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          132.291666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'PartSelection'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 171
        Top = 100
        Width = 117
        Height = 16
        Size.Values = (
          42.333333333333340000
          452.437500000000000000
          264.583333333333400000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Reference'
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
    object qrbCustHeader: TQRGroup
      Left = 38
      Top = 168
      Width = 1047
      Height = 35
      AlignToBottom = False
      BeforePrint = qrbCustHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        92.604166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Name'
      FooterBand = qrpCustFooter
      Master = QuickReport
      ReprintOnNewPage = False
      object QRLblGrpBy: TQRLabel
        Left = 8
        Top = 8
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Group by'
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
    object qrpCustFooter: TQRBand
      Left = 38
      Top = 281
      Width = 1047
      Height = 32
      AfterPrint = qrpCustFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrpCustFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBndDtl
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel9: TQRLabel
        Left = 604
        Top = 8
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1598.083333333333000000
          21.166666666666670000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total value'
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
        Left = 793
        Top = 1
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          2098.145833333333000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalCustValue: TQRLabel
        Left = 796
        Top = 8
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          2106.083333333333000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRShape5: TQRShape
        Left = 889
        Top = 1
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          2352.145833333333000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 892
        Top = 8
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          2360.083333333333000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRLblGrpOrdTot: TQRLabel
        Left = 697
        Top = 8
        Width = 84
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1844.145833333333000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRShape8: TQRShape
        Left = 685
        Top = 1
        Width = 97
        Height = 8
        Enabled = False
        Size.Values = (
          21.166666666666670000
          1812.395833333333000000
          2.645833333333333000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 203
      Width = 1047
      Height = 5
      AfterPrint = QRGroup1AfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.OrdNum'
      FooterBand = QROrdFoot
      Master = QuickReport
      ReprintOnNewPage = False
    end
    object QRBndDtl: TQRBand
      Left = 38
      Top = 213
      Width = 1047
      Height = 1
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2.645833333333333000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object QRChldDtl: TQRChildBand
      Left = 38
      Top = 214
      Width = 1047
      Height = 35
      AfterPrint = QRChldDtlAfterPrint
      AlignToBottom = False
      BeforePrint = QRChldDtlBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.604166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBndDtl
      PrintOrder = cboAfterParent
      object QRLblExtChrgs: TQRLabel
        Left = 901
        Top = 0
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          2383.895833333333000000
          0.000000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblExtChrgs'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 802
        Top = 0
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          2121.958333333333000000
          0.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          '(qryReport.Quantity_Received * qryReport.Purchase_Price) / qryRe' +
          'port.Purch_Pack_Quantity'
        Mask = #163'###,###,##0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 740
        Top = 0
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1957.916666666667000000
          0.000000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity_Received'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 654
        Top = 0
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1730.375000000000000000
          0.000000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity_Ordered'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 592
        Top = 0
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cost_Price'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 520
        Top = 0
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          0.000000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purch_Pack_Quantity'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 306
        Top = 17
        Width = 237
        Height = 15
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          44.979166666666670000
          627.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Description'
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
      object QRDBText2: TQRDBText
        Left = 306
        Top = 1
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          2.645833333333333000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part'
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
        Left = 59
        Top = 0
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          156.104166666666700000
          0.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purch_Ord_Date'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 59
        Top = 16
        Width = 166
        Height = 15
        Size.Values = (
          39.687500000000000000
          156.104166666666700000
          42.333333333333330000
          439.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purch_Ord_Descr'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBTxtOrdNo: TQRDBText
        Left = 0
        Top = 0
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'OrdNum'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 171
        Top = 0
        Width = 126
        Height = 15
        Size.Values = (
          39.687500000000000000
          452.437500000000000000
          0.000000000000000000
          333.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_no'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblRetail: TQRLabel
        Left = 992
        Top = 0
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          2624.666666666667000000
          0.000000000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRetail'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRChldSumm: TQRChildBand
      Left = 38
      Top = 353
      Width = 1047
      Height = 24
      AfterPrint = QRChldSummAfterPrint
      AlignToBottom = False
      BeforePrint = QRChldSummBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBndDtl
      PrintOrder = cboAfterParent
      object QRDBText4: TQRDBText
        Left = 0
        Top = 0
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'OrdNum'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 67
        Top = 0
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          177.270833333333300000
          0.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purch_Ord_Date'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 242
        Top = 0
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          640.291666666666800000
          0.000000000000000000
          232.833333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purch_Ord_Descr'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 744
        Top = 0
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          1968.500000000000000000
          0.000000000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Tot_Val'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 845
        Top = 0
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          2235.729166666667000000
          0.000000000000000000
          97.895833333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Tot_Del'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblExtChrgs2: TQRLabel
        Left = 897
        Top = 0
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          2373.312500000000000000
          0.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblExtChrgs2'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRBOrdHead: TQRGroup
      Left = 38
      Top = 208
      Width = 1047
      Height = 5
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'QryReport.OrdNum'
      Master = QuickReport
      ReprintOnNewPage = False
    end
    object QROrdFoot: TQRBand
      Left = 38
      Top = 249
      Width = 1047
      Height = 32
      AfterPrint = QROrdFootAfterPrint
      AlignToBottom = False
      BeforePrint = QROrdFootBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBndDtl
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel2: TQRLabel
        Left = 552
        Top = 8
        Width = 113
        Height = 17
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          21.166666666666670000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total  value ordered'
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
      object QRLblTotDlvrd: TQRLabel
        Left = 796
        Top = 8
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          2106.083333333333000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRShape2: TQRShape
        Left = 793
        Top = 1
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          2098.145833333333000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 889
        Top = 1
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          2352.145833333333000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblTotExt: TQRLabel
        Left = 892
        Top = 8
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          2360.083333333333000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRLblOrdTot: TQRLabel
        Left = 697
        Top = 8
        Width = 84
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1844.145833333333000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRShape9: TQRShape
        Left = 685
        Top = 1
        Width = 97
        Height = 8
        Enabled = False
        Size.Values = (
          21.166666666666670000
          1812.395833333333000000
          2.645833333333333000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object DelAddmemo: TQRMemo
        Left = 60
        Top = 9
        Width = 301
        Height = 15
        Size.Values = (
          39.687500000000000000
          158.750000000000000000
          23.812500000000000000
          796.395833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 5
        Top = 8
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          21.166666666666670000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery:'
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
    object QRBand2: TQRBand
      Left = 38
      Top = 313
      Width = 1047
      Height = 40
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel4: TQRLabel
        Left = 593
        Top = 8
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1568.979166666667000000
          21.166666666666670000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Report Totals'
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
      object QRLblRepTot: TQRLabel
        Left = 797
        Top = 8
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          2108.729166666667000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRShape3: TQRShape
        Left = 794
        Top = 1
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          2100.791666666667000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblRepTotExtChrg: TQRLabel
        Left = 893
        Top = 8
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          2362.729166666667000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRShape4: TQRShape
        Left = 890
        Top = 1
        Width = 87
        Height = 8
        Size.Values = (
          21.166666666666670000
          2354.791666666667000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblOrdRepTot: TQRLabel
        Left = 698
        Top = 8
        Width = 84
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          1846.791666666667000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object QRShape7: TQRShape
        Left = 686
        Top = 1
        Width = 97
        Height = 8
        Enabled = False
        Size.Values = (
          21.166666666666670000
          1815.041666666667000000
          2.645833333333333000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '// this query get'#39's overwritten by the summary or detailed query'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 222
    Top = 16
  end
  object qryExtraCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum (Purch_Ord_Add_Charge.Amount) as TotalVal'
      'from Purch_Ord_Add_Charge'
      'Where (Purch_ord_add_charge.purch_ord = :OrdNo)'
      'group by Purch_ord_Add_Charge.Purch_Ord'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 142
    Top = 18
    ParamData = <
      item
        Name = 'OrdNo'
      end>
  end
  object OldQryRptSumm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purch_Ord.Purch_Ord_No as OrdNum,'
      '       Purch_Ord.Purch_Ord_Date,'
      '       Purch_Ord.Purch_Ord_Descr,'
      '       Purch_Ord.Purch_Ord,'
      '       Supplier.name,'
      
        '       Sum((Purch_Ord_Line.Quantity_Ordered /Part.Purch_Pack_Qua' +
        'ntity)* Purch_Ord_Line.Purchase_Price) as Tot_Val,'
      
        '       Sum((Purch_Ord_Line.Quantity_Received /Part.Purch_Pack_Qu' +
        'antity)* Purch_Ord_Line.Purchase_Price) as Tot_Del'
      'FROM Purch_Ord_Line, Purch_Ord, Part, Supplier'
      'WHERE ((Purch_Ord.Supplier = :Supplier) or (:Supplier = 0)) AND'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Supplier.Supplier = Purch_Ord.Supplier) and'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part.Part >= :Part_From) and'
      '      (Part.Part <= :Part_To)  and'
      '      (Purch_Ord_Date >= :Date_From) and'
      '      (Purch_Ord_Date <= :Date_To)'
      
        'Group by Purch_Ord.Purch_Ord_No, Purch_Ord.Purch_Ord_Date, Purch' +
        '_Ord.Purch_Ord_Descr,'
      '       Purch_Ord.Purch_Ord, Supplier.name'
      ''
      ''
      ''
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
    Left = 374
    Top = 16
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object OldQryRptDet: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purch_Ord_Line.Quantity_Ordered,Purch_Ord.Purch_Ord_No as' +
        ' OrdNum,'
      
        '       Purch_Ord_Line.Purch_Ord_Line_No,Purch_Ord.Purch_Ord_Date' +
        ','
      
        '       Purch_Ord_Line.Date_Deliv_Expected,Purch_Ord.Purch_Ord_St' +
        'atus,'
      '       Purch_Ord_Line.Purchase_Price,'
      '       Purch_Ord_Line.Cost_Price,'
      '       Purch_Ord_Line.Quantity_Received,'
      '       Purch_Ord_Line.Quantity_Sent,'
      '       Purch_Ord.Purch_Ord_Descr,'
      '       Purch_Ord.Purch_Ord,'
      
        '       Part.Part, Part.Part_Description, Part.Purch_Pack_Quantit' +
        'y,'
      '       Purch_Ord.Sales_order,'
      '       Supplier.name'
      'FROM Purch_Ord_Line, Purch_Ord, Part, Supplier'
      'WHERE ((Purch_Ord.Supplier = :Supplier) or (:Supplier = 0)) AND'
      '      (Purch_Ord.Supplier = Supplier.Supplier) and'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part.Part >= :Part_From) and'
      '      (Part.Part <= :Part_To) and'
      '      (Purch_Ord_Date >= :Date_From) and'
      '      (Purch_Ord_Date <= :Date_To)'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 294
    Top = 16
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object QryRptSummBypart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purch_Ord.Purch_Ord_No as OrdNum,'
      '       Purch_Ord.Purch_Ord_Date,'
      '       Purch_Ord.Purch_Ord_Descr,'
      '       Purch_Ord.Purch_Ord,'
      '       Supplier.name,'
      '       Part.Part,'
      
        '       Sum((Purch_Ord_Line.Quantity_Ordered /Part.Purch_Pack_Qua' +
        'ntity)* Purch_Ord_Line.Purchase_Price) as Tot_Val,'
      
        '       Sum((Purch_Ord_Line.Quantity_Received /Part.Purch_Pack_Qu' +
        'antity)* Purch_Ord_Line.Purchase_Price) as Tot_Del'
      'FROM Purch_Ord_Line, Purch_Ord, Part, Supplier'
      'WHERE ((Purch_Ord.Supplier = :Supplier) or (:Supplier = 0)) AND'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Supplier.Supplier = Purch_Ord.Supplier) and'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part.Part >= :Part_From) and'
      '      (Part.Part <= :Part_To)  and'
      '      (Purch_Ord_Date >= :Date_From) and'
      '      (Purch_Ord_Date <= :Date_To)'
      
        'Group by Purch_Ord.Purch_Ord_No, Purch_Ord.Purch_Ord_Date, Purch' +
        '_Ord.Purch_Ord_Descr,'
      '       Purch_Ord.Purch_Ord, Supplier.name,Part.Part'
      ''
      ''
      ''
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 46
    Top = 16
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object QryRptDet: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purch_Ord_Line.Quantity_Ordered,'
      '        Purch_Ord_Line.Purch_Ord_Line_No,'
      '        Purch_Ord_Line.Date_Deliv_Expected,'
      '        Purch_Ord_Line.Purchase_Price,'
      '        Purch_Ord_Line.Cost_Price,'
      '        Purch_Ord_Line.Quantity_Received,'
      '        Purch_Ord_Line.Quantity_Sent,'
      '        Purch_Ord.Purch_Ord_No as OrdNum,'
      '        Purch_Ord.Purch_Ord_Date,'
      '        Purch_Ord.Purch_Ord_Status,'
      '        Purch_Ord.Purch_Ord_Descr,'
      '        Purch_Ord.Purch_Ord,'
      '        Purch_Ord.Narrative,'
      '        Purch_Ord.Sales_order,'
      '        Part.Part,'
      '        Part.Part_Description,'
      '        Part.Purch_Pack_Quantity,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Cust_Order_no,'
      '        Sales_Order.Delivery_Customer,'
      '        Sales_Order.Delivery_Branch,'
      '        Sales_Order.Ad_hoc_Address,'
      '        Supplier.Name,'
      '        (select Customer.Name'
      '         from Customer'
      
        '         where Customer.Customer = Sales_order.Customer) as Cust' +
        'omer_Name,'
      
        '        (select top 1 Sales_order_line.Retail_Price/Sales_Order_' +
        'line.Sell_Pack_Quantity'
      '         from sales_order_line'
      
        '         where sales_order_line.sales_order = sales_order.sales_' +
        'order and'
      
        '               sales_order_line.part = purch_ord_line.part) as U' +
        'nit_Retail_Price'
      'FROM Supplier'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN (Part'
      '      INNER JOIN ((Purch_Ord'
      '      INNER JOIN Purch_Ord_Line'
      '        ON Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord)'
      '      LEFT JOIN Sales_Order'
      '        ON Purch_Ord.Sales_order = Sales_Order.Sales_Order)'
      '        ON Part.Part = Purch_Ord_Line.Part)'
      
        '        ON (Supplier_Branch.Branch_no = Purch_Ord.Branch_no) AND' +
        ' (Supplier_Branch.Supplier = Purch_Ord.Supplier))'
      '        ON Supplier.Supplier = Supplier_Branch.Supplier'
      'WHERE ((Purch_Ord.Supplier = :Supplier) or (:Supplier = 0)) AND'
      
        '      ((Sales_Order.Customer = :Customer) or (:Customer = 0)) AN' +
        'D'
      '      (Part.Part >= :Part_From) and'
      '      (Part.Part <= :Part_To) and'
      '      (Purch_Ord_Date >= :Date_From) and'
      '      (Purch_Ord_Date <= :Date_To)'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 294
    Top = 64
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object QryRptSumm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purch_Ord.Purch_Ord_No as OrdNum,'
      '       Purch_Ord.Purch_Ord_Date,'
      '       Purch_Ord.Purch_Ord_Descr,'
      '       Purch_Ord.Purch_Ord,'
      '       Supplier.name,'
      
        '       Sum((Purch_Ord_Line.Quantity_Ordered /Part.Purch_Pack_Qua' +
        'ntity)* Purch_Ord_Line.Purchase_Price) as Tot_Val,'
      
        '       Sum((Purch_Ord_Line.Quantity_Received /Part.Purch_Pack_Qu' +
        'antity)* Purch_Ord_Line.Purchase_Price) as Tot_Del,'
      '       Sales_order.Customer,'
      '       (select Customer.Name'
      '         from Customer'
      
        '         where Customer.Customer = Sales_order.Customer) as Cust' +
        'omer_Name'
      'FROM Supplier'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN (Part'
      '      INNER JOIN ((Purch_Ord'
      '      INNER JOIN Purch_Ord_Line'
      '        ON Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord)'
      '      LEFT JOIN Sales_Order'
      '        ON Purch_Ord.Sales_order = Sales_Order.Sales_Order)'
      '        ON Part.Part = Purch_Ord_Line.Part)'
      
        '        ON (Supplier_Branch.Branch_no = Purch_Ord.Branch_no) AND' +
        ' (Supplier_Branch.Supplier = Purch_Ord.Supplier))'
      '        ON Supplier.Supplier = Supplier_Branch.Supplier'
      'WHERE ((Purch_Ord.Supplier = :Supplier) or (:Supplier = 0)) AND'
      
        '      ((Sales_Order.Customer = :Customer) or (:Customer = 0)) AN' +
        'D'
      '      (Part.Part >= :Part_From) and'
      '      (Part.Part <= :Part_To)  and'
      '      (Purch_Ord_Date >= :Date_From) and'
      '      (Purch_Ord_Date <= :Date_To)'
      'Group by  Purch_Ord.Purch_Ord_No,'
      '          Purch_Ord.Purch_Ord_Date,'
      '          Purch_Ord.Purch_Ord_Descr,'
      '          Purch_Ord.Purch_Ord,'
      '          Supplier.name,'
      '          Sales_order.Customer'
      ''
      ''
      ''
      ''
      ''
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
    Left = 374
    Top = 64
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object qryCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Fax_Number,'
      '        Email,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Use_Branch_Name'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 694
    Top = 25
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object AddressSRC: TDataSource
    Left = 752
    Top = 31
  end
  object qryAdhoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  Delivery_Narrative,'
      '  '#39'N'#39' as Use_Branch_Name'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address'
      ' ')
    Left = 848
    Top = 32
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line'
      '')
    Left = 926
    Top = 34
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
end
