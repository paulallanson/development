object PBRPProdWeeklyFrm: TPBRPProdWeeklyFrm
  Left = 15
  Top = 0
  Caption = 'Weekly Production Report'
  ClientHeight = 695
  ClientWidth = 1249
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
    Top = 24
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
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
      Height = 60
      AlignToBottom = False
      BeforePrint = qrbndPageHeaderBeforePrint
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
        158.750000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 402
        Top = 8
        Width = 242
        Height = 23
        Size.Values = (
          60.854166666666670000
          1063.625000000000000000
          21.166666666666670000
          640.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Weekly Production Report'
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
        Left = 453
        Top = 32
        Width = 141
        Height = 17
        Size.Values = (
          44.979166666666670000
          1198.562500000000000000
          84.666666666666670000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Report Criteria - Dated From: '
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
      object QRSysData1: TQRSysData
        Left = 973
        Top = 29
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          2574.395833333333000000
          76.729166666666670000
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
      object QRSysData2: TQRSysData
        Left = 986
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2608.791666666667000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblSheetNo: TQRLabel
        Left = 8
        Top = 8
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sheet No'
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
        Left = 10
        Top = 77
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          203.729166666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
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
        Left = 88
        Top = 77
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          203.729166666666700000
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
      object QRLabel18: TQRLabel
        Left = 360
        Top = 77
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          952.500000000000000000
          203.729166666666700000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Basic'
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
      object QRLabel19: TQRLabel
        Left = 408
        Top = 77
        Width = 18
        Height = 15
        Size.Values = (
          39.687500000000000000
          1079.500000000000000000
          203.729166666666700000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'O/T'
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
      object QRLabel20: TQRLabel
        Left = 441
        Top = 77
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          1166.812500000000000000
          203.729166666666700000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
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
      object QRLabel21: TQRLabel
        Left = 504
        Top = 77
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          1333.500000000000000000
          203.729166666666700000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Basic'
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
      object QRLabel22: TQRLabel
        Left = 552
        Top = 77
        Width = 18
        Height = 15
        Size.Values = (
          39.687500000000000000
          1460.500000000000000000
          203.729166666666700000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'O/T'
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
        Left = 592
        Top = 77
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          203.729166666666700000
          76.729166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Spent'
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
      object QRLabel24: TQRLabel
        Left = 672
        Top = 77
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          1778.000000000000000000
          203.729166666666700000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Charge'
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
      object QRLabel25: TQRLabel
        Left = 728
        Top = 77
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          1926.166666666667000000
          203.729166666666700000
          92.604166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inoiced'
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
      object QRLabel26: TQRLabel
        Left = 784
        Top = 77
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          2074.333333333333000000
          203.729166666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Over (Under)'
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
      object QRLabel27: TQRLabel
        Left = 392
        Top = 63
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1037.166666666667000000
          166.687500000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'This Week'
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
      object QRLabel28: TQRLabel
        Left = 538
        Top = 63
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          1423.458333333333000000
          166.687500000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To Date'
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
      object QRLabel29: TQRLabel
        Left = 728
        Top = 63
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1926.166666666667000000
          166.687500000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'From Job Bag'
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
    object qrbndHeaderPage1: TQRChildBand
      Left = 38
      Top = 98
      Width = 1047
      Height = 40
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = qrbndHeaderPage1BeforePrint
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
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbndPageHeader
      PrintOrder = cboAfterParent
      object QRLabel12: TQRLabel
        Left = 10
        Top = 20
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          52.916666666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
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
        Left = 88
        Top = 20
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          52.916666666666670000
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
    end
    object qrbndHeaderPage2: TQRChildBand
      Left = 38
      Top = 138
      Width = 1047
      Height = 40
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = qrbndHeaderPage2BeforePrint
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
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbndHeaderPage1
      PrintOrder = cboAfterParent
      object QRLabel1: TQRLabel
        Left = 10
        Top = 20
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          52.916666666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
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
        Left = 88
        Top = 20
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          52.916666666666670000
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
    end
    object qrbndHeaderPage3: TQRChildBand
      Left = 38
      Top = 178
      Width = 1047
      Height = 40
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = qrbndHeaderPage3BeforePrint
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
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbndHeaderPage2
      PrintOrder = cboAfterParent
      object QRLabel3: TQRLabel
        Left = 10
        Top = 20
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          52.916666666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
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
        Left = 88
        Top = 20
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          52.916666666666670000
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
    end
    object qrGrpCustomerPage1: TQRGroup
      Left = 38
      Top = 218
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerPage1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Customer_Name'
      Master = qrSubDetailPage1
      ReprintOnNewPage = False
    end
    object qrbndJobsPage1: TQRBand
      Left = 38
      Top = 233
      Width = 1047
      Height = 21
      AfterPrint = qrbndJobsPage1AfterPrint
      AlignToBottom = False
      BeforePrint = qrbndJobsPage1BeforePrint
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
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText1: TQRDBText
        Left = 10
        Top = 2
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          5.291666666666667000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Activity_Code'
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
        Left = 88
        Top = 2
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          5.291666666666667000
          211.666666666666700000)
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
    object qrSubDetailPage1: TQRSubDetail
      Left = 38
      Top = 228
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrSubDetailPage1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      FooterBand = qrbndTotalsPage1
      PrintBefore = False
      PrintIfEmpty = True
    end
    object qrbndTotalsPage1: TQRBand
      Left = 38
      Top = 254
      Width = 1047
      Height = 65
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = qrbndTotalsPage1BeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        171.979166666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel7: TQRLabel
        Left = 10
        Top = 45
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          119.062500000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL HOURS'
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
      object QRLabel8: TQRLabel
        Left = 10
        Top = 25
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          66.145833333333340000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Overtime'
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
      object QRLabel9: TQRLabel
        Left = 10
        Top = 5
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          13.229166666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Grand Total'
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
    object qrGrpHeaderPage2: TQRBand
      Left = 38
      Top = 319
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpHeaderPage2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
    end
    object qrGrpCustomerPage2: TQRGroup
      Left = 38
      Top = 324
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerPage2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Customer_Name'
      Master = qrSubDetailPage2
      ReprintOnNewPage = False
    end
    object qrSubDetailPage2: TQRSubDetail
      Left = 38
      Top = 334
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrSubDetailPage2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      FooterBand = qrbndTotalsPage2
      HeaderBand = qrGrpHeaderPage2
      PrintBefore = False
      PrintIfEmpty = True
    end
    object qrbndJobsPage2: TQRBand
      Left = 38
      Top = 339
      Width = 1047
      Height = 21
      AfterPrint = qrbndJobsPage2AfterPrint
      AlignToBottom = False
      BeforePrint = qrbndJobsPage2BeforePrint
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
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText3: TQRDBText
        Left = 10
        Top = 2
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          5.291666666666667000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Activity_Code'
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
      object QRDBText4: TQRDBText
        Left = 88
        Top = 2
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          5.291666666666667000
          211.666666666666700000)
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
    object qrbndTotalsPage2: TQRBand
      Left = 38
      Top = 360
      Width = 1047
      Height = 65
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = qrbndTotalsPage2BeforePrint
      Enabled = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        171.979166666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel10: TQRLabel
        Left = 10
        Top = 5
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          13.229166666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Grand Total'
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
        Left = 10
        Top = 25
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          66.145833333333340000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Overtime'
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
      object QRLabel14: TQRLabel
        Left = 10
        Top = 45
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          119.062500000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL HOURS'
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
    object qrGrpHeaderPage3: TQRBand
      Left = 38
      Top = 425
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpHeaderPage3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
    end
    object qrGrpCustomerPage3: TQRGroup
      Left = 38
      Top = 430
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerPage3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Customer_Name'
      Master = qrSubDetailPage3
      ReprintOnNewPage = False
    end
    object qrSubDetailPage3: TQRSubDetail
      Left = 38
      Top = 440
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrSubDetailPage3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      FooterBand = qrbndTotalsPage3
      HeaderBand = qrGrpHeaderPage3
      PrintBefore = False
      PrintIfEmpty = True
    end
    object qrBndJobsPage3: TQRBand
      Left = 38
      Top = 445
      Width = 1047
      Height = 21
      AfterPrint = qrBndJobsPage3AfterPrint
      AlignToBottom = False
      BeforePrint = qrBndJobsPage3BeforePrint
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
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText5: TQRDBText
        Left = 10
        Top = 2
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          5.291666666666667000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Activity_Code'
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
        Left = 88
        Top = 2
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          5.291666666666667000
          211.666666666666700000)
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
    object qrbndTotalsPage3: TQRBand
      Left = 38
      Top = 466
      Width = 1047
      Height = 65
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = qrbndTotalsPage3BeforePrint
      Enabled = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        171.979166666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel15: TQRLabel
        Left = 10
        Top = 5
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          13.229166666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Grand Total'
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
      object QRLabel16: TQRLabel
        Left = 10
        Top = 25
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          66.145833333333340000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Overtime'
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
      object QRLabel17: TQRLabel
        Left = 10
        Top = 45
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          119.062500000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL HOURS'
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
    object qrgrpHeaderFinal: TQRBand
      Left = 38
      Top = 531
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrgrpHeaderFinalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
    end
    object qrGrpCustomerFinal: TQRGroup
      Left = 38
      Top = 536
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerFinalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Customer_Name'
      Master = qrSubDetailFinal
      ReprintOnNewPage = False
    end
    object qrSubDetailFinal: TQRSubDetail
      Left = 38
      Top = 546
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrSubDetailFinalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      FooterBand = qrbndTotalsFinal
      HeaderBand = qrgrpHeaderFinal
      PrintBefore = False
      PrintIfEmpty = True
    end
    object qrBndJobsFinal: TQRBand
      Left = 38
      Top = 551
      Width = 1047
      Height = 21
      AfterPrint = qrBndJobsFinalAfterPrint
      AlignToBottom = False
      BeforePrint = qrBndJobsFinalBeforePrint
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
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText7: TQRDBText
        Left = 10
        Top = 2
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          5.291666666666667000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Activity_Code'
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
      object QRDBText8: TQRDBText
        Left = 88
        Top = 2
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          5.291666666666667000
          211.666666666666700000)
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
      object qrlblBasicTW: TQRLabel
        Left = 359
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          949.854166666666700000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblOvertimeTW: TQRLabel
        Left = 404
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1068.916666666667000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblTotalTW: TQRLabel
        Left = 445
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblTotalTD: TQRLabel
        Left = 600
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1587.500000000000000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblChargeable: TQRLabel
        Left = 687
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1817.687500000000000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblInvoiced: TQRLabel
        Left = 748
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1979.083333333333000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblDifference: TQRLabel
        Left = 813
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          2151.062500000000000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblOvertimeTD: TQRLabel
        Left = 560
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1481.666666666667000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblBasicTD: TQRLabel
        Left = 514
        Top = 2
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1359.958333333333000000
          5.291666666666667000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
    object qrbndTotalsFinal: TQRBand
      Left = 38
      Top = 572
      Width = 1047
      Height = 26
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = qrbndTotalsFinalBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        68.791666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblReportBasicTW: TQRLabel
        Left = 359
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          949.854166666666700000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportOvertimeTW: TQRLabel
        Left = 404
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1068.916666666667000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportTotalTW: TQRLabel
        Left = 445
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportBasicTD: TQRLabel
        Left = 514
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1359.958333333333000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportOvertimeTD: TQRLabel
        Left = 559
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1479.020833333333000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportTotalTD: TQRLabel
        Left = 600
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1587.500000000000000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportTotalChargeable: TQRLabel
        Left = 687
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1817.687500000000000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportTotalInvoiced: TQRLabel
        Left = 748
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          1979.083333333333000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object qrlblReportTotalDifference: TQRLabel
        Left = 813
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          2151.062500000000000000
          15.875000000000000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object QRLabel40: TQRLabel
        Left = 10
        Top = 6
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          15.875000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Grand Total'
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
    object QRGrpPage1: TQRGroup
      Left = 38
      Top = 223
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerPage1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Activity_Code'
      FooterBand = qrbndJobsPage1
      Master = qrSubDetailPage1
      ReprintOnNewPage = False
    end
    object qrGrpFinal: TQRGroup
      Left = 38
      Top = 541
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerFinalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Activity_Code'
      FooterBand = qrBndJobsFinal
      Master = qrSubDetailFinal
      ReprintOnNewPage = False
    end
    object qrGrpPage2: TQRGroup
      Left = 38
      Top = 329
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerPage2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Activity_Code'
      FooterBand = qrbndJobsPage2
      Master = qrSubDetailPage2
      ReprintOnNewPage = False
    end
    object qrGrpPage3: TQRGroup
      Left = 38
      Top = 435
      Width = 1047
      Height = 5
      AlignToBottom = False
      BeforePrint = qrGrpCustomerPage3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Activity_Code'
      FooterBand = qrBndJobsPage3
      Master = qrSubDetailPage3
      ReprintOnNewPage = False
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    Left = 80
    Top = 16
  end
  object qryOldWCOperators: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Work_Centre_Operator'
      'where '
      '((Process_Group = :Process_Group) or (:Process_Group = 0))'
      'Order by Name')
    Left = 288
    Top = 24
    ParamData = <
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process_Group'
      end>
  end
  object qryOldDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Time_Log.Job_Bag_Time_Log,'
      '      Job_Bag_Time_Log.Job_Bag as activity_Code,'
      '      Job_Bag_Time_Log.Date_Point,'
      '      Job_Bag_Time_Log.Process_Group,'
      '      Process_Group.Process_Group_Description,'
      '      Job_Bag_Time_Log.Work_Centre_Operator,'
      '      Job_Bag_Time_Log.Labour_Hours,'
      '      Job_Bag_Time_Log.Machine_Hours,'
      '      Job_Bag_Time_Log.Labour_Overtime_Hours,'
      '      Job_Bag_Time_Log.Hourly_Rate,'
      '      Job_Bag_Time_Log.Customer,'
      '      Customer.Name as Customer_Name'
      'FROM Process_Group'
      '      INNER JOIN (Customer'
      '      INNER JOIN Job_Bag_Time_Log'
      '        ON Customer.Customer = Job_Bag_Time_Log.Customer)'
      
        '        ON Process_Group.Process_Group = Job_Bag_Time_Log.Proces' +
        's_Group'
      'WHERE job_bag is not NULL')
    Left = 168
    Top = 16
  end
  object qryDummyJobs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Time_Log.Job_Bag_Time_Log,'
      '      0 as Activity_Type,'
      '      Job_Bag_Time_Log.Job_Bag,'
      
        '      cast(Job_Bag_Time_Log.Job_Bag as nvarchar) as activity_Cod' +
        'e,'
      '      Job_Bag_Time_Log.Date_Point,'
      '      Job_Bag_Time_Log.Process_Group,'
      '      Process_Group.Process_Group_Description,'
      '      Job_Bag_Time_Log.Work_Centre_Operator,'
      '      Job_Bag_Time_Log.Labour_Hours,'
      '      Job_Bag_Time_Log.Machine_Hours,'
      '      Job_Bag_Time_Log.Labour_Overtime_Hours,'
      '      Job_Bag_Time_Log.Hourly_Rate,'
      '      Job_Bag_Time_Log.Customer,'
      '      Customer.Name as Customer_Name'
      'FROM Process_Group'
      '      INNER JOIN (Customer'
      '      INNER JOIN Job_Bag_Time_Log'
      '        ON Customer.Customer = Job_Bag_Time_Log.Customer)'
      
        '        ON Process_Group.Process_Group = Job_Bag_Time_Log.Proces' +
        's_Group'
      'WHERE job_bag is not NULL'
      ''
      '')
    Left = 166
    Top = 94
  end
  object qryDummynonJobs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Time_Log.Job_Bag_Time_Log,'
      '      1 as Activity_Type,'
      '      0 as Job_Bag,'
      '      activity as Activity_Code,'
      '      Job_Bag_Time_Log.Date_Point,'
      '      Job_Bag_Time_Log.Process_Group,'
      '      Process_Group.Process_Group_Description,'
      '      Job_Bag_Time_Log.Work_Centre_Operator,'
      '      Job_Bag_Time_Log.Labour_Hours,'
      '      Job_Bag_Time_Log.Machine_Hours,'
      '      Job_Bag_Time_Log.Labour_Overtime_Hours,'
      '      Job_Bag_Time_Log.Hourly_Rate,'
      '      Job_Bag_Time_Log.Customer,'
      '      Customer.Name as Customer_Name'
      'FROM Process_Group'
      #9'RIGHT JOIN (Customer'
      #9'RIGHT JOIN Job_Bag_Time_Log'
      #9#9'ON Customer.Customer = Job_Bag_Time_Log.Customer)'
      
        #9#9'ON Process_Group.Process_Group = Job_Bag_Time_Log.Process_Grou' +
        'p'
      'WHERE (Job_Bag_Time_Log.Job_Bag Is Null)'
      ''
      '')
    Left = 166
    Top = 150
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_bag,'
      '        Process_Group,'
      '        sum(Labour_Hours) as Total_basic,'
      '        sum(Labour_Hours*Hourly_Rate) as Total_basic_Cost,'
      '        sum(Labour_Overtime_Hours) as Total_Overtime,'
      
        '        sum(Labour_Overtime_Hours*(Hourly_Rate*1)) as Total_Over' +
        'time_Cost'
      'FROM Job_Bag_Time_log'
      'GROUP BY Job_Bag,'
      '        Process_Group'
      'HAVING Job_Bag = :Job_Bag and'
      '((Process_Group = :Process_Group) or (0 = :Process_Group))')
    Left = 286
    Top = 84
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process_Group'
      end>
  end
  object qryWCOperators: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Work_Centre_Operator.Work_Centre_Operator,'
      #9'Work_Centre_Operator.Name'
      'from job_bag_time_log, Work_Centre_Operator'
      'where '
      
        '((job_bag_time_log.Process_Group = :Process_Group) or (0 = :Proc' +
        'ess_Group)) and'
      '('
      '(Job_bag_time_log.Date_Point >= :DateFrom) and'
      '(Job_bag_time_log.Date_Point <= :DateTo)'
      ') and'
      
        '(Job_Bag_Time_Log.Work_Centre_Operator = Work_Centre_Operator.Wo' +
        'rk_Centre_Operator)'
      'Order by Name')
    Left = 414
    Top = 29
    ParamData = <
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'DateFrom'
      end
      item
        Name = 'DateTo'
      end>
  end
  object qrygetJobBagCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_dets.Job_bag,'
      #9'Job_Bag_Line_dets.Product_Type,'
      #9'sum(Job_bag_Line_dets.Job_bag_line_sell) as Total_Invoiced,'
      #9'(select top 1 Process_Group'
      #9' from Process'
      
        #9' where process.Product_Type = Job_bag_Line_Dets.Product_Type) a' +
        's Process_Group'
      'FROM Job_Bag_Line_Dets'
      'where Job_Bag_Line_Dets.Job_bag = :Job_Bag and'
      '(((select top 1 Process_Group'
      #9' from Process'
      
        #9' where process.Product_Type = Job_bag_Line_Dets.Product_Type) =' +
        ' :Process_Group) or'
      '(0 = :Process_Group))'
      'GROUP BY Job_Bag_Line_Dets.Job_Bag,'
      #9'Job_Bag_Line_dets.Product_Type'
      '')
    Left = 414
    Top = 86
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Process_Group'
      end>
  end
  object qryOldGetJobBagCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_dets.Job_bag,'
      #9'sum(Job_bag_Line_dets.Job_bag_line_sell) as Total_Chargeable,'
      #9'(SELECT '
      #9'  (SUM(case'
      #9#9'  when Qty_Invoiced < 0 then'
      #9#9#9'  (case'
      #9#9#9'    when Price_Unit.Price_Unit_Factor = 0 then'
      #9#9#9#9'    Sales_Invoice_line.Goods_Value'
      #9#9#9'    else'
      
        #9#9#9#9'    ((Sales_Invoice_line.Goods_Value * (Sales_Invoice_line.Q' +
        'ty_invoiced/Price_Unit.Price_Unit_Factor))*-1)'
      #9#9#9'    end)'
      #9#9'  else'
      #9#9#9'  (case'
      #9#9#9'    when Price_Unit.Price_Unit_Factor = 0 then'
      #9#9#9#9'    Sales_Invoice_line.Goods_Value'
      #9#9#9'    else'
      
        '            (Sales_Invoice_line.Goods_Value * (Sales_Invoice_lin' +
        'e.Qty_invoiced/Price_Unit.Price_Unit_Factor))'
      #9#9#9'    end)'
      #9#9'  end))'
      #9'  FROM Sales_Invoice_line, Price_unit'
      
        #9'  WHERE Sales_Invoice_line.Price_unit = Price_Unit.Price_Unit A' +
        'ND'
      
        #9#9'  Sales_Invoice_line.Job_bag = Job_bag_line_Dets.Job_bag) as T' +
        'otal_Invoiced'
      'FROM Job_Bag_Line_Dets'
      'where Job_Bag_Line_Dets.Job_bag = :Job_Bag'
      'GROUP BY Job_Bag_Line_Dets.Job_Bag')
    Left = 822
    Top = 30
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
end
