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
  
  TextHeight = 13
  object QckRpRpsPrft: TQuickRep
    Left = 24
    Top = 8
    Width = 1123
    Height = 794
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
      Left = 19
      Top = 38
      Width = 1085
      Height = 59
      AlignToBottom = False
      BeforePrint = PageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        156.104166666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 484
        Top = 8
        Width = 117
        Height = 24
        Size.Values = (
          63.500000000000000000
          1280.583333333333000000
          21.166666666666670000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Color = clWhite
        Data = qrsReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        Left = 8
        Top = 32
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          84.666666666666670000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PageNumQrl'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object WhichSideQRL: TQRLabel
        Left = 8
        Top = 8
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTitle: TQRLabel
        Left = 358
        Top = 8
        Width = 369
        Height = 23
        Size.Values = (
          60.854166666666670000
          947.208333333333300000
          21.166666666666670000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Reps Annual Profit Analysis - Run Date: '
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
        Left = 519
        Top = 32
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1373.187500000000000000
          84.666666666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Begin:  '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object PageHeaderLeft: TQRChildBand
      Left = 19
      Top = 97
      Width = 1085
      Height = 50
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
        132.291666666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeader
      PrintOrder = cboAfterParent
      object QRLabel1: TQRLabel
        Left = 2
        Top = 0
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object PageHeaderRight: TQRChildBand
      Left = 19
      Top = 197
      Width = 1085
      Height = 50
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
        132.291666666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeaderMiddle
      PrintOrder = cboAfterParent
      object QRLabel11: TQRLabel
        Left = 2
        Top = 0
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRSubDetailpg1: TQRSubDetail
      Left = 19
      Top = 252
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRSubDetailpg1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QckRpRpsPrft
      DataSet = SQLRepPrft
      FooterBand = QRFootPg1
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRFootPg1: TQRBand
      Left = 19
      Top = 287
      Width = 1085
      Height = 50
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
        132.291666666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel2: TQRLabel
        Left = 2
        Top = 13
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          34.395833333333330000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:- '
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
    object QRGrpHeadPg2: TQRBand
      Left = 19
      Top = 337
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRGrpHeadPg2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
    end
    object QRSubDetailpg2: TQRSubDetail
      Left = 19
      Top = 347
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRSubDetailpg2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
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
      Left = 19
      Top = 247
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRGrpPg1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlpg1
      Master = QRSubDetailpg1
      ReprintOnNewPage = False
    end
    object QRDtlpg1: TQRBand
      Left = 19
      Top = 257
      Width = 1085
      Height = 30
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
        79.375000000000000000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText1: TQRDBText
        Left = 0
        Top = 0
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          201.083333333333300000)
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
        Font.Height = -9
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
      Left = 19
      Top = 342
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRGrpPg2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlpg2
      Master = QRSubDetailpg2
      ReprintOnNewPage = False
    end
    object QRDtlpg2: TQRBand
      Left = 19
      Top = 352
      Width = 1085
      Height = 30
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
        79.375000000000000000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText4: TQRDBText
        Left = 0
        Top = 0
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          201.083333333333300000)
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
        Font.Height = -9
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
      Left = 19
      Top = 382
      Width = 1085
      Height = 50
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
        132.291666666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel3: TQRLabel
        Left = 2
        Top = 13
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          34.395833333333330000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:- '
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
    object PageHeaderMiddle: TQRChildBand
      Left = 19
      Top = 147
      Width = 1085
      Height = 50
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
        132.291666666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeaderLeft
      PrintOrder = cboAfterParent
      object QRLabel4: TQRLabel
        Left = 2
        Top = 0
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      Left = 19
      Top = 432
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRGrpHeadPg3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
    end
    object QRGrpPg3: TQRGroup
      Left = 19
      Top = 437
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRGrpPg3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlPg3
      Master = QRSubDetailpg3
      ReprintOnNewPage = False
    end
    object QRSubDetailpg3: TQRSubDetail
      Left = 19
      Top = 442
      Width = 1085
      Height = 5
      AlignToBottom = False
      BeforePrint = QRSubDetailpg3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
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
      Left = 19
      Top = 447
      Width = 1085
      Height = 30
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
        79.375000000000000000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText2: TQRDBText
        Left = 0
        Top = 0
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          201.083333333333300000)
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
        Font.Height = -9
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
      Left = 19
      Top = 477
      Width = 1085
      Height = 50
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
        132.291666666666700000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel5: TQRLabel
        Left = 2
        Top = 13
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          34.395833333333330000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:- '
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
      object QRLblTotSell: TQRLabel
        Left = 155
        Top = 3
        Width = 248
        Height = 12
        Size.Values = (
          31.750000000000000000
          410.104166666666800000
          7.937500000000000000
          656.166666666666800000)
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
        Font.Height = -9
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
