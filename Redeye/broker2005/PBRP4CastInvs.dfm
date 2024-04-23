object PBRP4CastInvsFrm: TPBRP4CastInvsFrm
  Left = 80
  Top = 118
  Caption = 'Anticipated Invoice Report'
  ClientHeight = 421
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  TextHeight = 13
  object qrReport: TQuickRep
    Left = -3
    Top = -5
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrReportBeforePrint
    DataSet = qry4CastInvs
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
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        240.770833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 334
        Top = 8
        Width = 379
        Height = 23
        Size.Values = (
          60.854166666666670000
          883.708333333333300000
          21.166666666666670000
          1002.770833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Anticipated Invoicing Report - Run Date:  '
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
      object qrlblDateRange: TQRLabel
        Left = 469
        Top = 32
        Width = 108
        Height = 17
        Size.Values = (
          44.979166666666670000
          1240.895833333333000000
          84.666666666666670000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Forecast Dated From: '
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
      object QRLabel13: TQRLabel
        Left = 925
        Top = 8
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          2447.395833333333000000
          21.166666666666670000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRSysData1: TQRSysData
        Left = 989
        Top = 8
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          2616.729166666667000000
          21.166666666666670000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 56
        Width = 36
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          148.166666666666700000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ORDER'
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
      object QRLabel3: TQRLabel
        Left = 56
        Top = 56
        Width = 36
        Height = 16
        Size.Values = (
          42.333333333333330000
          148.166666666666700000
          148.166666666666700000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ORDER'
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
        Left = 254
        Top = 56
        Width = 66
        Height = 16
        Size.Values = (
          42.333333333333330000
          672.041666666666700000
          148.166666666666700000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESCRIPTION'
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
      object QRLabel7: TQRLabel
        Left = 560
        Top = 56
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          1481.666666666667000000
          148.166666666666700000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DELIVERY'
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
      object QRLabel8: TQRLabel
        Left = 624
        Top = 72
        Width = 56
        Height = 16
        Size.Values = (
          42.333333333333330000
          1651.000000000000000000
          190.500000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DELIVERED'
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
      object QRLabel10: TQRLabel
        Left = 696
        Top = 56
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          1841.500000000000000000
          148.166666666666700000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DELIVERY'
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
        Left = 443
        Top = 56
        Width = 91
        Height = 16
        Size.Values = (
          42.333333333333330000
          1172.104166666667000000
          148.166666666666700000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FORM REFERENCE'
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
      object QRLabel9: TQRLabel
        Left = 941
        Top = 56
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          2489.729166666667000000
          148.166666666666700000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'COST'
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
      object QRLabel12: TQRLabel
        Left = 864
        Top = 56
        Width = 39
        Height = 16
        Size.Values = (
          42.333333333333330000
          2286.000000000000000000
          148.166666666666700000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SALES'
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
      object QRLabel14: TQRLabel
        Left = 1000
        Top = 56
        Width = 44
        Height = 16
        Size.Values = (
          42.333333333333330000
          2645.833333333333000000
          148.166666666666700000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROFIT'
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
      object QRLabel15: TQRLabel
        Left = 56
        Top = 72
        Width = 28
        Height = 16
        Size.Values = (
          42.333333333333330000
          148.166666666666700000
          190.500000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATE'
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
      object QRLabel1: TQRLabel
        Left = 120
        Top = 56
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333330000
          317.500000000000000000
          148.166666666666700000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER NAME'
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
        Left = 560
        Top = 72
        Width = 28
        Height = 16
        Size.Values = (
          42.333333333333330000
          1481.666666666667000000
          190.500000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATE'
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
      object QRLabel16: TQRLabel
        Left = 624
        Top = 56
        Width = 28
        Height = 16
        Size.Values = (
          42.333333333333330000
          1651.000000000000000000
          148.166666666666700000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATE'
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
      object QRLabel17: TQRLabel
        Left = 724
        Top = 72
        Width = 23
        Height = 16
        Size.Values = (
          42.333333333333330000
          1915.583333333333000000
          190.500000000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QTY'
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
      object QRLabel18: TQRLabel
        Left = 864
        Top = 72
        Width = 39
        Height = 16
        Size.Values = (
          42.333333333333330000
          2286.000000000000000000
          190.500000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VALUE'
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
      object QRLabel19: TQRLabel
        Left = 936
        Top = 72
        Width = 39
        Height = 16
        Size.Values = (
          42.333333333333330000
          2476.500000000000000000
          190.500000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VALUE'
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
      object QRLabel22: TQRLabel
        Left = 768
        Top = 56
        Width = 41
        Height = 16
        Size.Values = (
          42.333333333333330000
          2032.000000000000000000
          148.166666666666700000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'INVOICE'
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
      object QRLabel23: TQRLabel
        Left = 768
        Top = 72
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          2032.000000000000000000
          190.500000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'UP FRONT'
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 171
      Width = 1047
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object RepQRGroup: TQRGroup
      Left = 38
      Top = 171
      Width = 1047
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qrySalesComm.Name'
      Master = QRSubDetail1
      ReprintOnNewPage = False
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 153
      Width = 1047
      Height = 18
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText4: TQRDBText
        Left = 624
        Top = 0
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          1651.000000000000000000
          0.000000000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'date_deliv_actual'
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
      object QRDBText1: TQRDBText
        Left = 0
        Top = 0
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666700000
          0.000000000000000000
          0.000000000000000000
          116.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'purchase_order'
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
        Left = 56
        Top = 0
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          0.000000000000000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'order_date'
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
        Left = 253
        Top = 0
        Width = 185
        Height = 17
        Size.Values = (
          44.979166666666700000
          669.395833333333000000
          0.000000000000000000
          489.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'customers_desc'
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
      object QRDBText7: TQRDBText
        Left = 560
        Top = 0
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          0.000000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'date_point'
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
      object QRDBText9: TQRDBText
        Left = 444
        Top = 0
        Width = 109
        Height = 17
        Size.Values = (
          44.979166666666700000
          1174.750000000000000000
          0.000000000000000000
          288.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'form_reference_id'
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
      object qrlblTotalCost: TQRLabel
        Left = 911
        Top = 0
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          2410.354166666667000000
          0.000000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalCost'
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
      object qrlblTotalSell: TQRLabel
        Left = 844
        Top = 0
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          2233.083333333333000000
          0.000000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalSell'
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
      object qrlblProfit: TQRLabel
        Left = 1002
        Top = 0
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          2651.125000000000000000
          0.000000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblProfit'
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
      object QRDBText3: TQRDBText
        Left = 120
        Top = 0
        Width = 124
        Height = 17
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          0.000000000000000000
          328.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'cust_name'
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
      object QRDBText10: TQRDBText
        Left = 691
        Top = 0
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666700000
          1828.270833333330000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'qty_to_deliver'
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
      object lblInvoiceUpfront: TQRLabel
        Left = 749
        Top = 0
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          1981.729166666667000000
          0.000000000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'lblInvoiceUpfront'
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
        FontSize = 10
      end
    end
    object qrbndGrpHdr: TQRGroup
      Left = 38
      Top = 129
      Width = 1047
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qry4CastInvs.rep'
      FooterBand = qrbndGrpFtr
      Master = qrReport
      ReprintOnNewPage = False
      object qrlblGroupHeader: TQRLabel
        Left = 8
        Top = 2
        Width = 29
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          5.291666666666667000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep: '
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
      object QRDBText6: TQRDBText
        Left = 72
        Top = 2
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          5.291666666666667000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'rep_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object qrbndGrpFtr: TQRBand
      Left = 38
      Top = 171
      Width = 1047
      Height = 38
      AfterPrint = qrbndGrpFtrAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndGrpFtrBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        100.541666666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel20: TQRLabel
        Left = 592
        Top = 12
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          1566.333333333333000000
          31.750000000000000000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals for Rep: '
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
      object qrlblRepTotalCost: TQRLabel
        Left = 911
        Top = 12
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          2410.354166666667000000
          31.750000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalCost'
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
      object qrlblRepTotalSell: TQRLabel
        Left = 844
        Top = 12
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          2233.083333333333000000
          31.750000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalSell'
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
      object qrlblRepTotalProf: TQRLabel
        Left = 1002
        Top = 12
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          2651.125000000000000000
          31.750000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblProfit'
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
      object QRDBText8: TQRDBText
        Left = 688
        Top = 12
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666700000
          1820.333333333330000000
          31.750000000000000000
          383.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qry4CastInvs
        DataField = 'rep_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
      object QRShape1: TQRShape
        Left = 839
        Top = 8
        Width = 206
        Height = 1
        Size.Values = (
          2.645833333333330000
          2219.854166666670000000
          21.166666666666700000
          545.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 839
        Top = 30
        Width = 206
        Height = 1
        Size.Values = (
          2.645833333333330000
          2219.854166666670000000
          79.375000000000000000
          545.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 209
      Width = 1047
      Height = 34
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel21: TQRLabel
        Left = 720
        Top = 8
        Width = 87
        Height = 16
        Size.Values = (
          42.333333333333330000
          1905.000000000000000000
          21.166666666666670000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reports Totals:'
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
      object qrlblGrandTotalCost: TQRLabel
        Left = 911
        Top = 8
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          2410.354166666667000000
          21.166666666666670000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalCost'
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
      object qrlblGrandTotalSell: TQRLabel
        Left = 844
        Top = 8
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          2233.083333333333000000
          21.166666666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalSell'
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
      object qrlblGrandTotalProf: TQRLabel
        Left = 1002
        Top = 8
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          2651.125000000000000000
          21.166666666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblProfit'
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
      object QRShape3: TQRShape
        Left = 839
        Top = 28
        Width = 206
        Height = 1
        Size.Values = (
          2.645833333333330000
          2219.854166666670000000
          74.083333333333300000
          545.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qry4CastInvs: TFDQuery
    ConnectionName = 'PB'
    Left = 47
    Top = 8
    object qry4CastInvspurchase_order: TFloatField
      FieldName = 'purchase_order'
    end
    object qry4CastInvsline: TIntegerField
      FieldName = 'line'
    end
    object qry4CastInvsqty_to_deliver: TFloatField
      FieldName = 'qty_to_deliver'
    end
    object qry4CastInvsdate_point: TDateTimeField
      FieldName = 'date_point'
    end
    object qry4CastInvsdelivery_to_stock: TWideStringField
      FieldName = 'delivery_to_stock'
      FixedChar = True
      Size = 2
    end
    object qry4CastInvsinvoice_upfront: TWideStringField
      FieldName = 'invoice_upfront'
      FixedChar = True
      Size = 2
    end
    object qry4CastInvsinactive: TWideStringField
      FieldName = 'inactive'
      FixedChar = True
      Size = 2
    end
    object qry4CastInvsorder_price: TCurrencyField
      FieldName = 'order_price'
    end
    object qry4CastInvsselling_price: TCurrencyField
      FieldName = 'selling_price'
    end
    object qry4CastInvscust_order_no: TWideStringField
      FieldName = 'cust_order_no'
      FixedChar = True
      Size = 50
    end
    object qry4CastInvscustomers_desc: TWideStringField
      FieldName = 'customers_desc'
      FixedChar = True
      Size = 80
    end
    object qry4CastInvsorder_date: TDateTimeField
      FieldName = 'order_date'
    end
    object qry4CastInvssell_unit_factor: TFloatField
      FieldName = 'sell_unit_factor'
    end
    object qry4CastInvsorder_unit_factor: TFloatField
      FieldName = 'order_unit_factor'
    end
    object qry4CastInvscust_name: TWideStringField
      FieldName = 'cust_name'
      FixedChar = True
      Size = 80
    end
    object qry4CastInvsrep: TIntegerField
      FieldName = 'rep'
    end
    object qry4CastInvsrep_name: TWideStringField
      FieldName = 'rep_name'
      FixedChar = True
      Size = 80
    end
    object qry4CastInvsform_reference_descr: TWideStringField
      FieldName = 'form_reference_descr'
      FixedChar = True
      Size = 100
    end
    object qry4CastInvsdate_deliv_actual: TDateTimeField
      FieldName = 'date_deliv_actual'
    end
    object qry4CastInvsform_reference_id: TWideStringField
      FieldName = 'form_reference_id'
      FixedChar = True
      Size = 100
    end
    object qry4CastInvsstock_reference: TWideStringField
      FieldName = 'stock_reference'
      FixedChar = True
      Size = 30
    end
    object qry4CastInvsAdditional_Cost: TFloatField
      FieldName = 'Additional_Cost'
    end
    object qry4CastInvsAdditional_Sell: TFloatField
      FieldName = 'Additional_Sell'
    end
    object qry4CastInvsQuantity: TFloatField
      FieldName = 'Quantity'
    end
  end
  object oldqryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  delivery_detail.purchase_order,'
      '  delivery_detail.line,'
      '  delivery_detail.qty_to_deliver,'
      '  delivery_detail.date_point,'
      '  delivery_detail.date_deliv_actual,'
      '  delivery_detail.delivery_to_stock,'
      
        '  purchase_orderline.invoice_upfront, purchase_orderline.calloff' +
        '_invoiced_upfront,'
      '  purchase_orderline.inactive,'
      '  purchase_orderline.order_price,'
      '  purchase_orderline.selling_price,'
      '  purchase_orderline.cust_order_no,'
      '  purchase_orderline.customers_desc,'
      '  purchase_order.date_point as order_date,'
      '  sell_unit.price_unit_factor as sell_unit_factor,'
      '  order_unit.price_unit_factor as order_unit_factor,'
      '  customer.name as cust_name,'
      '  rep.rep, rep.name as rep_name,'
      
        '  form_reference.form_reference_descr, form_reference.form_refer' +
        'ence_id, form_reference.stock_reference'
      'from ((((((delivery_detail'
      '           inner join purchase_orderline on'
      
        '              ((delivery_detail.purchase_order = purchase_orderl' +
        'ine.purchase_order) and'
      
        '               (delivery_detail.line = purchase_orderline.line))' +
        ')'
      
        '          inner join purchase_order on (purchase_orderline.purch' +
        'ase_order = purchase_order.purchase_order))'
      
        '         inner join price_unit as sell_unit on (sell_unit.price_' +
        'unit = purchase_orderline.sell_unit))'
      
        '        inner join price_unit as order_unit on (order_unit.price' +
        '_unit = purchase_orderline.order_unit))'
      
        '       inner join customer on (purchase_orderline.customer = cus' +
        'tomer.customer))'
      '      inner join rep on (purchase_orderline.rep = rep.rep))'
      
        '     left join form_reference on (purchase_orderline.form_refere' +
        'nce = form_reference.form_reference)'
      'where'
      
        '  ((Purchase_orderLine.Purch_ord_line_Status > 10) and (Purchase' +
        '_orderLine.Purch_ord_line_Status < 30)) AND'
      
        '  ((Purchase_OrderLine.Calloff_Invoiced_upfront = '#39'N'#39') Or (Purch' +
        'ase_OrderLine.Calloff_Invoiced_upfront Is Null)) AND'
      
        '  ((delivery_detail.delivery_to_stock <> '#39'Y'#39') or (purchase_order' +
        'line.invoice_upfront = '#39'Y'#39'))'
      
        '  and ((purchase_orderline.inactive <> '#39'Y'#39') or (purchase_orderli' +
        'ne.inactive is null))'
      ' '
      ''
      ''
      '')
    Left = 163
    Top = 9
  end
  object qryBackup: TFDQuery
    SQL.Strings = (
      'SELECT'
      '  delivery_detail.purchase_order,'
      '  delivery_detail.line,'
      '  delivery_detail.qty_to_deliver,'
      '  delivery_detail.date_point,'
      '  delivery_detail.date_deliv_actual,'
      '  delivery_detail.delivery_to_stock,'
      
        '  purchase_orderline.invoice_upfront, purchase_orderline.calloff' +
        '_invoiced_upfront,'
      '  purchase_orderline.purch_ord_line_Status,  '
      '  purchase_orderline.inactive,'
      '  purchase_orderline.order_price,'
      '  purchase_orderline.selling_price,'
      '  purchase_orderline.cust_order_no,'
      '  purchase_orderline.customers_desc,'
      '  purchase_order.date_point as order_date,'
      '  price_unit.price_unit_factor as sell_unit_factor,'
      '  order_unit.price_unit_factor as order_unit_factor,'
      '  customer.name as cust_name,'
      '  rep.rep, rep.name as rep_name,'
      
        '  form_reference.form_reference_descr, form_reference.form_refer' +
        'ence_id, form_reference.stock_reference'
      
        'FROM Form_Reference RIGHT JOIN (Price_Unit AS Order_Unit INNER J' +
        'OIN (Price_Unit'
      
        #9'INNER JOIN (Supplier_Branch INNER JOIN (Purchase_Order INNER JO' +
        'IN (Customer INNER JOIN (Customer_Branch'
      
        #9'INNER JOIN (Rep INNER JOIN (Purchase_OrderLine INNER JOIN Deliv' +
        'ery_Detail ON (Purchase_OrderLine.Line = Delivery_Detail.Line) A' +
        'ND'
      
        #9#9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_' +
        'Order)) ON '
      
        #9#9'Rep.Rep = Purchase_OrderLine.Rep) ON (Customer_Branch.Branch_n' +
        'o = Purchase_OrderLine.Branch_no) AND'
      #9#9'(Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON'
      
        #9#9'Customer.Customer = Customer_Branch.Customer) ON (Delivery_Det' +
        'ail.Purchase_Order = Purchase_Order.Purchase_Order) AND'
      
        #9#9'(Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_O' +
        'rder)) ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)' +
        ' AND'
      
        #9#9'(Supplier_Branch.Supplier = Purchase_Order.Supplier)) ON Price' +
        '_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      
        #9#9'Order_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) ON Form' +
        '_Reference.Form_Reference = Purchase_OrderLine.Form_Reference'
      
        'WHERE ((Purchase_OrderLine.Purch_Ord_Line_Status) > 10 And (Purc' +
        'hase_OrderLine.Purch_Ord_Line_Status)<25) AND '
      
        #9'((Purchase_OrderLine.Calloff_Invoiced_upfront)= '#39'N'#39' Or (Purchas' +
        'e_OrderLine.Calloff_Invoiced_upfront) Is Null) AND '
      
        #9'((Purchase_OrderLine.Inactive)<> '#39'Y'#39' Or (Purchase_OrderLine.Ina' +
        'ctive) Is Null) AND '
      
        #9'(((delivery_detail.delivery_to_stock <> '#39'Y'#39') or (purchase_order' +
        'line.invoice_upfront = '#39'Y'#39')))'
      
        '/**the following lines get reinstated or blanked out at run time' +
        ' depending on selections, look in TPBRP4CastInvsFrm.PrepareRepor' +
        't()**/'
      '/**  and (delivery_detail.date_point >= date_from)    **/'
      '/**  and (delivery_detail.date_point <= date_to)      **/'
      
        '/**  and ((purchase_orderline.customer = customer) and (purchase' +
        '_orderline.branch_no = branch))  **/'
      '/**  and (purchase_orderline.rep = rep) **/'
      'ORDER BY Purchase_orderLine.Purchase_order')
    Left = 563
    Top = 9
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'select'
      '  delivery_detail.purchase_order,'
      '  delivery_detail.line,'
      '  delivery_detail.qty_to_deliver,'
      '  delivery_detail.qty_delivered,'
      '  delivery_detail.date_point,'
      '  delivery_detail.date_deliv_actual,'
      '  delivery_detail.delivery_to_stock,'
      '  purchase_orderline.purch_ord_line_status,'
      '  purchase_orderline.invoice_upfront,'
      '  purchase_orderline.calloff_invoiced_upfront,'
      '  purchase_orderline.inactive,'
      '  purchase_orderline.order_price,'
      '  purchase_orderline.selling_price,'
      '  purchase_orderline.Quantity,'
      '  purchase_orderline.cust_order_no,'
      '  purchase_orderline.customers_desc,'
      '  purchase_order.date_point as order_date,'
      '  sell_unit.price_unit_factor as sell_unit_factor,'
      '  order_unit.price_unit_factor as order_unit_factor,'
      '  purchase_orderline.Customer,'
      '  purchase_orderline.Branch_no,'
      '  customer.name as cust_name,'
      '  purchase_orderline.rep,'
      '  rep.name as rep_name,'
      '  form_reference.form_reference_descr,'
      '  form_reference.form_reference_id,'
      '  form_reference.stock_reference,'
      '  (select sum(Amount)'
      '   from purch_ord_line_add_chg'
      
        '   where ((purch_ord_line_add_chg.purchase_order = delivery_deta' +
        'il.purchase_order) AND'
      
        '          (purch_ord_line_add_chg.Line = delivery_detail.line)))' +
        ' as Additional_Cost,'
      '  (select sum(Quotation_Price)'
      '   from purch_ord_line_add_chg'
      
        '   where ((purch_ord_line_add_chg.purchase_order = delivery_deta' +
        'il.purchase_order) AND'
      
        '          (purch_ord_line_add_chg.Line = delivery_detail.line)))' +
        ' as Additional_Sell'
      'from ((((((delivery_detail'
      '           inner join purchase_orderline on'
      
        '              ((delivery_detail.purchase_order = purchase_orderl' +
        'ine.purchase_order) and'
      
        '               (delivery_detail.line = purchase_orderline.line))' +
        ')'
      
        '          inner join purchase_order on (purchase_orderline.purch' +
        'ase_order = purchase_order.purchase_order))'
      
        '         inner join price_unit as sell_unit on (sell_unit.price_' +
        'unit = purchase_orderline.sell_unit))'
      
        '        inner join price_unit as order_unit on (order_unit.price' +
        '_unit = purchase_orderline.order_unit))'
      
        '       inner join customer on (purchase_orderline.customer = cus' +
        'tomer.customer))'
      '      inner join rep on (purchase_orderline.rep = rep.rep))'
      
        '     left join form_reference on (purchase_orderline.form_refere' +
        'nce = form_reference.form_reference)'
      'WHERE (((Delivery_Detail.Delivery_to_Stock)<>'#39'Y'#39') AND'
      '      ((Purchase_OrderLine.Purch_Ord_Line_Status)>10 AND'
      '      (Purchase_OrderLine.Purch_Ord_Line_Status)<25 OR'
      '      (Purchase_OrderLine.Purch_Ord_Line_Status)=50) AND'
      '      ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      '      (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) AND'
      '      ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '      (Purchase_OrderLine.Inactive) Is Null)) OR'
      '      (((Purchase_OrderLine.Purch_Ord_Line_Status)>10 And'
      '      (Purchase_OrderLine.Purch_Ord_Line_Status)<25 OR'
      '      (Purchase_OrderLine.Purch_Ord_Line_Status)=50) AND'
      '      ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      '      (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) AND'
      '      ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '      (Purchase_OrderLine.Inactive) Is Null) AND'
      '      ((Purchase_OrderLine.Invoice_upfront)='#39'Y'#39'))'
      'GROUP BY'
      '  delivery_detail.purchase_order,'
      '  delivery_detail.line,'
      '  delivery_detail.qty_to_deliver,'
      '  delivery_detail.qty_delivered,'
      '  delivery_detail.date_point,'
      '  delivery_detail.date_deliv_actual,'
      '  delivery_detail.delivery_to_stock,'
      '  purchase_orderline.purch_ord_line_status,'
      '  purchase_orderline.invoice_upfront,'
      '  purchase_orderline.calloff_invoiced_upfront,'
      '  purchase_orderline.inactive,'
      '  purchase_orderline.order_price,'
      '  purchase_orderline.selling_price,'
      '  purchase_orderline.Quantity,'
      '  purchase_orderline.cust_order_no,'
      '  purchase_orderline.customers_desc,'
      '  purchase_order.date_point,'
      '  sell_unit.price_unit_factor,'
      '  order_unit.price_unit_factor,'
      '  purchase_orderline.Customer,'
      '  purchase_orderline.Branch_no,'
      '  customer.name,'
      '  purchase_orderline.rep, '
      '  rep.name,'
      '  form_reference.form_reference_descr, '
      '  form_reference.form_reference_id,'
      '  form_reference.stock_reference'
      'HAVING 1=1'
      '')
    Left = 253
    Top = 11
  end
end
