object PBRPRepProfitSummFrm: TPBRPRepProfitSummFrm
  Left = 0
  Top = 0
  Caption = 'Rep Sales Profit Report'
  ClientHeight = 541
  ClientWidth = 1199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QckRpRpsPrft: TQuickRep
    Left = 24
    Top = 8
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = QckRpRpsPrftBeforePrint
    DataSet = SQLRepPrft
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
      50.000000000000000000
      50.000000000000000000
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
    object PageHeader: TQRBand
      Left = 24
      Top = 47
      Width = 1356
      Height = 74
      AlignToBottom = False
      BeforePrint = PageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        156.633333333333300000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 608
        Top = 10
        Width = 139
        Height = 30
        Size.Values = (
          63.500000000000000000
          1286.933333333333000000
          21.166666666666670000
          294.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Color = clWhite
        Data = qrsReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object PageNumQrl: TQRLabel
        Left = 10
        Top = 40
        Width = 93
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          84.666666666666670000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PageNumQrl'
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
      object WhichSideQRL: TQRLabel
        Left = 10
        Top = 10
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          21.166666666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LeftRight'
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
        Left = 452
        Top = 10
        Width = 452
        Height = 29
        Size.Values = (
          61.383333333333330000
          956.733333333333300000
          21.166666666666670000
          956.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Reps Annual Profit Analysis - Run Date: '
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
      object qrlblDateRange: TQRLabel
        Left = 649
        Top = 40
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          1373.716666666667000000
          84.666666666666670000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Begin:  '
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
    object PageHeaderLeft: TQRChildBand
      Left = 24
      Top = 121
      Width = 1356
      Height = 63
      AlignToBottom = False
      BeforePrint = PageHeaderLeftBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        133.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeader
      PrintOrder = cboAfterParent
      object QRLabel1: TQRLabel
        Left = 3
        Top = 0
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          6.350000000000000000
          0.000000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object PageHeaderRight: TQRChildBand
      Left = 24
      Top = 247
      Width = 1356
      Height = 63
      AlignToBottom = False
      BeforePrint = PageHeaderRightBeforePrint
      Enabled = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        133.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeaderMiddle
      PrintOrder = cboAfterParent
      object QRLabel11: TQRLabel
        Left = 3
        Top = 0
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          6.350000000000000000
          0.000000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRSubDetailpg1: TQRSubDetail
      Left = 24
      Top = 316
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRSubDetailpg1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QckRpRpsPrft
      DataSet = SQLRepPrft
      FooterBand = QRFootPg1
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRFootPg1: TQRBand
      Left = 24
      Top = 360
      Width = 1356
      Height = 63
      AfterPrint = QRFootPg1AfterPrint
      AlignToBottom = False
      BeforePrint = QRFootPg1BeforePrint
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
        133.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel2: TQRLabel
        Left = 3
        Top = 16
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          6.350000000000000000
          33.866666666666670000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:- '
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
    object QRGrpHeadPg2: TQRBand
      Left = 24
      Top = 423
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRGrpHeadPg2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
    end
    object QRSubDetailpg2: TQRSubDetail
      Left = 24
      Top = 435
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRSubDetailpg2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QckRpRpsPrft
      DataSet = SQLRepPrft
      FooterBand = QRFootPg2
      HeaderBand = QRGrpHeadPg2
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRGrpPg1: TQRGroup
      Left = 24
      Top = 310
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRGrpPg1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlpg1
      Master = QRSubDetailpg1
      ReprintOnNewPage = False
    end
    object QRDtlpg1: TQRBand
      Left = 24
      Top = 322
      Width = 1356
      Height = 38
      AlignToBottom = False
      BeforePrint = QRDtlpg1BeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        80.433333333333330000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText1: TQRDBText
        Left = 0
        Top = 0
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          0.000000000000000000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SQLRepPrft
        DataField = 'period_description'
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
        FontSize = 7
      end
    end
    object QRGrpPg2: TQRGroup
      Left = 24
      Top = 429
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRGrpPg2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlpg2
      Master = QRSubDetailpg2
      ReprintOnNewPage = False
    end
    object QRDtlpg2: TQRBand
      Left = 24
      Top = 441
      Width = 1356
      Height = 38
      AlignToBottom = False
      BeforePrint = QRDtlpg2BeforePrint
      Enabled = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        80.433333333333330000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText4: TQRDBText
        Left = 0
        Top = 0
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          0.000000000000000000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SQLRepPrft
        DataField = 'period_description'
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
        FontSize = 7
      end
    end
    object QRFootPg2: TQRBand
      Left = 24
      Top = 479
      Width = 1356
      Height = 63
      AfterPrint = QRFootPg2AfterPrint
      AlignToBottom = False
      BeforePrint = QRFootPg2BeforePrint
      Enabled = False
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
        133.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel3: TQRLabel
        Left = 3
        Top = 16
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          6.350000000000000000
          33.866666666666670000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:- '
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
    object PageHeaderMiddle: TQRChildBand
      Left = 24
      Top = 184
      Width = 1356
      Height = 63
      AlignToBottom = False
      BeforePrint = PageHeaderMiddleBeforePrint
      Enabled = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        133.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeaderLeft
      PrintOrder = cboAfterParent
      object QRLabel4: TQRLabel
        Left = 3
        Top = 0
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          6.350000000000000000
          0.000000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRGrpHeadPg3: TQRBand
      Left = 24
      Top = 542
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRGrpHeadPg3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
    end
    object QRGrpPg3: TQRGroup
      Left = 24
      Top = 548
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRGrpPg3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlPg3
      Master = QRSubDetailpg3
      ReprintOnNewPage = False
    end
    object QRSubDetailpg3: TQRSubDetail
      Left = 24
      Top = 554
      Width = 1356
      Height = 6
      AlignToBottom = False
      BeforePrint = QRSubDetailpg3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QckRpRpsPrft
      DataSet = SQLRepPrft
      FooterBand = QRFootpg3
      HeaderBand = QRGrpHeadPg3
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRDtlPg3: TQRBand
      Left = 24
      Top = 560
      Width = 1356
      Height = 38
      AlignToBottom = False
      BeforePrint = QRDtlPg3BeforePrint
      Enabled = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        80.433333333333330000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText2: TQRDBText
        Left = 0
        Top = 0
        Width = 104
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          0.000000000000000000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SQLRepPrft
        DataField = 'period_description'
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
        FontSize = 7
      end
    end
    object QRFootpg3: TQRBand
      Left = 24
      Top = 598
      Width = 1356
      Height = 63
      AlignToBottom = False
      BeforePrint = QRFootpg3BeforePrint
      Enabled = False
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
        133.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel5: TQRLabel
        Left = 3
        Top = 16
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          6.350000000000000000
          33.866666666666670000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:- '
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
      object QRLblTotSell: TQRLabel
        Left = 194
        Top = 4
        Width = 310
        Height = 16
        Size.Values = (
          33.866666666666670000
          410.633333333333300000
          8.466666666666667000
          656.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '------------------'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
  end
  object DataSRCRepPrft: TDataSource
    Left = 254
    Top = 78
  end
  object SQLRepPrft: TFDQuery
    MasterSource = DataSRCRepPrft
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'sales_profit.rep,'
      #9'rep.name as rep_name,'
      #9'sales_profit.period,'
      #9'period.description as period_description,'
      #9'sum(Total_sales_value) as Total_Sales,'
      #9'sum(Total_cost_value) as Total_Cost'
      'from '#9'sales_profit,'
      #9'rep,'
      #9'period'
      
        'where ((((sales_profit.period >= :period_from) and (sales_profit' +
        '.period <= :period_to)) and'
      #9'sales_profit.rep = rep.rep and'
      #9'sales_profit.period = period.period)  and'
      '  ((sales_profit.Rep = :Rep) or (:Rep = 0)))'
      
        'group by sales_profit.rep, rep.name,'#9'sales_profit.period,period.' +
        'description'
      'order by sales_profit.period, rep.name'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 302
    Top = 78
    ParamData = <
      item
        Name = 'period_from'
      end
      item
        Name = 'period_to'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end>
  end
  object SQLRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'distinct rep.rep,'
      #9'rep.name as rep_name'
      'from '#9'sales_profit,'
      #9'rep'
      
        'where (((sales_profit.period >= :period_from) and (sales_profit.' +
        'period <= :period_to)) and'
      #9'sales_profit.rep = rep.rep and'
      '  ((sales_profit.Rep = :Rep) or (:Rep = 0)))'
      'order by  rep.name'
      '')
    Left = 358
    Top = 70
    ParamData = <
      item
        Name = 'period_from'
      end
      item
        Name = 'period_to'
      end
      item
        Name = 'rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end>
  end
end
