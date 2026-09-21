object PBRPJobBagWIPfrm: TPBRPJobBagWIPfrm
  Left = 61
  Top = 48
  Caption = 'Job Bag Work In Progress'
  ClientHeight = 620
  ClientWidth = 1166
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = -8
    Top = 8
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
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
      20.000000000000000000
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
    object QRBand2: TQRBand
      Left = 24
      Top = 47
      Width = 1370
      Height = 96
      Frame.DrawBottom = True
      Frame.Style = psDashDot
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        203.200000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 453
        Top = 3
        Width = 464
        Height = 25
        Size.Values = (
          52.916666666666670000
          958.850000000000000000
          6.350000000000000000
          982.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Work in Progress - Purchase Orders in Job Bags'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 153
        Top = 72
        Width = 46
        Height = 20
        Size.Values = (
          42.333333333333330000
          323.850000000000000000
          152.400000000000000000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 310
        Top = 72
        Width = 53
        Height = 20
        Size.Values = (
          42.333333333333330000
          656.166666666666700000
          152.400000000000000000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 870
        Top = 72
        Width = 78
        Height = 20
        Size.Values = (
          42.333333333333330000
          1841.500000000000000000
          152.400000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Form Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 700
        Top = 72
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333340000
          1481.666666666667000000
          153.458333333333300000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 971
        Top = 72
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2055.283333333333000000
          152.400000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 536
        Top = 72
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          1134.533333333333000000
          152.400000000000000000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 80
        Top = 72
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333340000
          169.333333333333300000
          153.458333333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Order Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object RunDateQRLabel: TQRLabel
        Left = 1240
        Top = 30
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          2624.666666666667000000
          63.500000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RunDateQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 777
        Top = 72
        Width = 84
        Height = 20
        Size.Values = (
          42.333333333333340000
          1645.708333333333000000
          153.458333333333300000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Date Delivered'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object HoldQRLabel: TQRLabel
        Left = 1324
        Top = 53
        Width = 38
        Height = 41
        Size.Values = (
          87.312500000000000000
          2801.937500000000000000
          111.125000000000000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 1034
        Top = 72
        Width = 68
        Height = 20
        Size.Values = (
          42.333333333333340000
          2188.104166666667000000
          153.458333333333300000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Delivery Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSalesValue: TQRLabel
        Left = 1107
        Top = 72
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333340000
          2344.208333333333000000
          153.458333333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 10
        Top = 72
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          152.400000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PO Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 646
        Top = 72
        Width = 40
        Height = 20
        Size.Values = (
          42.333333333333330000
          1367.366666666667000000
          152.400000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 1257
        Top = 0
        Width = 75
        Height = 20
        Size.Values = (
          42.333333333333330000
          2660.650000000000000000
          0.000000000000000000
          158.750000000000000000)
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
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Text = 'Page:  '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCostValue: TQRLabel
        Left = 1181
        Top = 72
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333340000
          2500.312500000000000000
          153.458333333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblMarginValue: TQRLabel
        Left = 1251
        Top = 72
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333340000
          2648.479166666667000000
          153.458333333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object RepQRGroup: TQRGroup
      Left = 24
      Top = 143
      Width = 1370
      Height = 30
      AlignToBottom = False
      BeforePrint = RepQRGroupBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = RepQRFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 14
        Top = 0
        Width = 84
        Height = 20
        Size.Values = (
          42.333333333333330000
          29.633333333333330000
          0.000000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
    object QRSubDetail1: TQRSubDetail
      Left = 24
      Top = 173
      Width = 1370
      Height = 21
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.450000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblJobBag: TQRDBText
        Left = 630
        Top = 0
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333340000
          1333.500000000000000000
          0.000000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 10
        Top = 0
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333340000
          21.166666666666670000
          0.000000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'POLine'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 153
        Top = 0
        Width = 151
        Height = 20
        Size.Values = (
          42.333333333333340000
          322.791666666666700000
          0.000000000000000000
          320.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 310
        Top = 0
        Width = 221
        Height = 20
        Size.Values = (
          42.333333333333340000
          656.166666666666800000
          0.000000000000000000
          468.312500000000100000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customers_Desc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 870
        Top = 0
        Width = 91
        Height = 20
        Size.Values = (
          42.333333333333340000
          1841.500000000000000000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Form_Reference_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 700
        Top = 0
        Width = 80
        Height = 20
        Size.Values = (
          42.333333333333340000
          1481.666666666667000000
          0.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Delivery_Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 780
        Top = 0
        Width = 80
        Height = 20
        Size.Values = (
          42.333333333333340000
          1651.000000000000000000
          0.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Deliv_Actual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 970
        Top = 0
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333340000
          2053.166666666667000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 536
        Top = 0
        Width = 101
        Height = 20
        Size.Values = (
          42.333333333333340000
          1135.062500000000000000
          0.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
        Left = 80
        Top = 0
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333340000
          169.333333333333300000
          0.000000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
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
      object OnHoldQRLabel: TQRLabel
        Left = 1334
        Top = 0
        Width = 25
        Height = 21
        Size.Values = (
          44.979166666666670000
          2823.104166666667000000
          0.000000000000000000
          52.916666666666660000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblQuantity: TQRLabel
        Left = 1050
        Top = 0
        Width = 49
        Height = 20
        Size.Values = (
          42.333333333333330000
          2222.500000000000000000
          0.000000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblSalesValue: TQRLabel
        Left = 1110
        Top = 0
        Width = 64
        Height = 20
        Size.Values = (
          42.333333333333330000
          2349.500000000000000000
          0.000000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSalesValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblCostValue: TQRLabel
        Left = 1190
        Top = 0
        Width = 59
        Height = 20
        Size.Values = (
          42.333333333333330000
          2518.833333333333000000
          0.000000000000000000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCostValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblMarginValue: TQRLabel
        Left = 1245
        Top = 0
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333330000
          2635.250000000000000000
          0.000000000000000000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblMarginValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object RepQRFooter: TQRBand
      Left = 24
      Top = 194
      Width = 1370
      Height = 39
      AlignToBottom = False
      BeforePrint = RepQRFooterBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.550000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object Totals: TQRLabel
        Left = 970
        Top = 10
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          2053.166666666667000000
          21.166666666666670000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Group Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblGrpSalesTotal: TQRLabel
        Left = 1087
        Top = 10
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          2300.816666666667000000
          21.166666666666670000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpSalesTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrshapeGroup: TQRShape
        Left = 1071
        Top = 0
        Width = 261
        Height = 9
        Size.Values = (
          18.520833333333340000
          2267.479166666667000000
          0.000000000000000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblGrpCostTotal: TQRLabel
        Left = 1165
        Top = 10
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2465.916666666667000000
          21.166666666666670000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpCostTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblGrpMarginTotal: TQRLabel
        Left = 1232
        Top = 10
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2607.733333333333000000
          21.166666666666670000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpCostTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblGrpPerc: TQRLabel
        Left = 1298
        Top = 10
        Width = 56
        Height = 21
        Size.Values = (
          44.450000000000000000
          2747.433333333333000000
          21.166666666666670000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpPerc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrSummary: TQRBand
      Left = 24
      Top = 233
      Width = 1370
      Height = 32
      AlignToBottom = False
      BeforePrint = qrSummaryBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel15: TQRLabel
        Left = 971
        Top = 10
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          2055.283333333333000000
          21.166666666666670000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblReportSalesTotal: TQRLabel
        Left = 1070
        Top = 10
        Width = 105
        Height = 21
        Size.Values = (
          44.450000000000000000
          2264.833333333333000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportSalesTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrshapereport: TQRShape
        Left = 1071
        Top = 1
        Width = 261
        Height = 10
        Size.Values = (
          21.166666666666670000
          2267.479166666667000000
          2.645833333333333000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblReportCostTotal: TQRLabel
        Left = 1149
        Top = 10
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2432.050000000000000000
          21.166666666666670000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportCostTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblReportMarginTotal: TQRLabel
        Left = 1217
        Top = 10
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          2575.983333333333000000
          21.166666666666670000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportCostTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblReportPerc: TQRLabel
        Left = 1281
        Top = 10
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          2711.450000000000000000
          21.166666666666670000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportPerc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order, '
      #9'Delivery_Detail.Line, '
      #9'Delivery_Detail.Delivery_no, '
      #9'Purchase_OrderLine.Cust_Order_No, '
      #9'Delivery_Detail.Date_Point AS Delivery_Date, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Purchase_OrderLine.Purch_Ord_Line_Status, '
      #9'Purchase_OrderLine.Proof_Required, '
      #9'Purchase_OrderLine.Goods_Required, '
      #9'Purchase_OrderLine.Customers_Desc, '
      #9'Purchase_OrderLine.On_Hold,'
      '                Purchase_OrderLine.Quantity, '
      #9'Purchase_Order.Date_Point, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Customer.Name, Supplier_Branch.Account_Code, '
      #9'Rep.Name AS Rep_Name, '
      #9'Purchase_OrderLine.Rep, '
      #9'Delivery_Detail.Qty_to_Deliver, '
      #9'Delivery_Detail.Qty_Delivered, '
      #9'Purchase_OrderLine.Selling_Price,'
      #9'Price_Unit.Price_Unit_Factor,'
      #9'Purchase_OrderLine.Order_Price as Cost_Price,'
      #9'Cost_Unit.Price_Unit_Factor as Cost_Unit_Factor,'
      #9'Purchase_order.Office_Contact,'
      #9'Operator.Name as Account_Manager,'
      '  (select top 1 Job_Bag'
      '   from Job_Bag_Line_dets'
      
        '   where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.P' +
        'urchase_Order) as Job_Bag'
      'FROM Price_Unit AS Cost_Unit '
      #9'RIGHT JOIN (Supplier_Branch '
      #9'INNER JOIN (Rep '
      #9'INNER JOIN ((Customer '
      
        #9'INNER JOIN Customer_Branch ON Customer.Customer = Customer_Bran' +
        'ch.Customer) '
      #9'INNER JOIN ((Price_Unit '
      #9'INNER JOIN (Purchase_OrderLine '
      
        #9'LEFT JOIN Form_Reference ON Purchase_OrderLine.Form_Reference =' +
        ' Form_Reference.Form_Reference) '
      #9#9'ON Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) '
      #9'INNER JOIN (Operator '
      #9'INNER JOIN (Delivery_Detail '
      
        #9'INNER JOIN Purchase_Order ON Delivery_Detail.Purchase_Order = P' +
        'urchase_Order.Purchase_Order) '
      #9#9'ON Operator.Operator = Purchase_Order.Office_Contact) '
      
        #9#9'ON (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchas' +
        'e_Order) AND (Purchase_OrderLine.Line = Delivery_Detail.Line) AN' +
        'D (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_' +
        'Order)) '
      
        #9#9'ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) ' +
        'AND (Customer_Branch.Customer = Purchase_OrderLine.Customer)) '
      #9#9'ON Rep.Rep = Purchase_OrderLine.Rep) '
      
        #9#9'ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND ' +
        '(Supplier_Branch.Supplier = Purchase_Order.Supplier)) '
      #9#9'ON Cost_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'WHERE (Purchase_OrderLine.Purch_Ord_Line_Status>=20) And'
      #9'(Purchase_OrderLine.Purch_Ord_Line_Status<=24)')
    Left = 710
    Top = 16
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportCust_Order_No: TWideStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object qryReportGoods_Required: TDateTimeField
      FieldName = 'Goods_Required'
    end
    object qryReportPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryReportProof_Required: TWideStringField
      FieldName = 'Proof_Required'
      OnGetText = qryReportProof_RequiredGetText
      FixedChar = True
      Size = 2
    end
    object qryReportCustomers_Desc: TWideStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportForm_Reference_ID: TWideStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 16
    end
    object qryReportName: TWideStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qryReportAccount_code: TWideStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qryReportPOLine: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryReportPOLineGetText
      Calculated = True
    end
    object qryReportDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryReportDelivery_Date: TDateTimeField
      FieldName = 'Delivery_Date'
    end
    object qryReportDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryReportRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryReportOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      FixedChar = True
      Size = 2
    end
    object qryReportQty_to_Deliver: TFloatField
      FieldName = 'Qty_to_Deliver'
    end
    object qryReportQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryReportSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryReportPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryReportQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryReportJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryReportOffice_Contact: TIntegerField
      FieldName = 'Office_Contact'
    end
    object qryReportAccount_Manager: TWideStringField
      FieldName = 'Account_Manager'
      FixedChar = True
      Size = 80
    end
    object qryReportCost_Price: TCurrencyField
      FieldName = 'Cost_Price'
    end
    object qryReportCost_Unit_Factor: TFloatField
      FieldName = 'Cost_Unit_Factor'
    end
    object qryReportStatus_Description: TWideStringField
      FieldName = 'Status_Description'
    end
    object qryReportExtra_Costs: TFloatField
      FieldName = 'Extra_Costs'
    end
    object qryReportExtra_Sales: TFloatField
      FieldName = 'Extra_Sales'
    end
  end
end
