object STRPCustStkBalfrm: TSTRPCustStkBalfrm
  Left = 18
  Top = 127
  Caption = 'Customer Stock Balance report'
  ClientHeight = 462
  ClientWidth = 956
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
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
    DataSet = qryStkBalRep
    Description.Strings = (
      'Customer Stock Balance report')
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      76.200000000000000000
      2970.000000000000000000
      76.200000000000000000
      2100.000000000000000000
      76.200000000000000000
      76.200000000000000000
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
    ReportTitle = 'Customer stock balance report'
    SnapToGrid = True
    Units = Inches
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
      Left = 36
      Top = 36
      Width = 920
      Height = 111
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        234.950000000000000000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 235
        Top = 10
        Width = 423
        Height = 29
        Size.Values = (
          61.383333333333330000
          497.416666666666700000
          21.166666666666670000
          895.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Customer Stock Balance Report - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object QRLabel2: TQRLabel
        Left = 4
        Top = 85
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          8.466666666666667000
          179.916666666666700000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
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
      object QRLabel3: TQRLabel
        Left = 474
        Top = 85
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1003.300000000000000000
          179.916666666666700000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
      object QRLabel4: TQRLabel
        Left = 140
        Top = 85
        Width = 83
        Height = 20
        Size.Values = (
          42.333333333333330000
          296.333333333333300000
          179.916666666666700000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
      object QRLabel5: TQRLabel
        Left = 574
        Top = 85
        Width = 38
        Height = 20
        Size.Values = (
          42.333333333333330000
          1214.966666666667000000
          179.916666666666700000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price'
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
      object QRLabel6: TQRLabel
        Left = 629
        Top = 85
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333330000
          1331.383333333333000000
          179.916666666666700000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price Unit'
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
      object QRLabel7: TQRLabel
        Left = 724
        Top = 85
        Width = 80
        Height = 20
        Size.Values = (
          42.333333333333330000
          1532.466666666667000000
          179.916666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Value'
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
      object QRLabel8: TQRLabel
        Left = 821
        Top = 85
        Width = 77
        Height = 20
        Size.Values = (
          42.333333333333330000
          1737.783333333333000000
          179.916666666666700000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Last Order'
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
      object QRSysData1: TQRSysData
        Left = 826
        Top = 10
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1748.366666666667000000
          21.166666666666670000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSelection: TQRLabel
        Left = 404
        Top = 36
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          855.133333333333300000
          76.200000000000000000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblSelection'
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
    object qrbCustFooter: TQRBand
      Left = 36
      Top = 250
      Width = 920
      Height = 38
      AfterPrint = qrbCustFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbCustFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        80.433333333333330000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel9: TQRLabel
        Left = 544
        Top = 10
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          1151.466666666667000000
          21.166666666666670000
          258.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total stock value'
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
      object QRShape1: TQRShape
        Left = 683
        Top = 0
        Width = 121
        Height = 10
        Size.Values = (
          21.166666666666700000
          1444.625000000000000000
          0.000000000000000000
          256.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalCustValue: TQRLabel
        Left = 696
        Top = 10
        Width = 108
        Height = 21
        Size.Values = (
          44.450000000000000000
          1473.200000000000000000
          21.166666666666670000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
    object qrbCustHeader: TQRGroup
      Left = 36
      Top = 177
      Width = 920
      Height = 26
      AlignToBottom = False
      BeforePrint = qrbCustHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        55.033333333333330000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryStkBalRep.Name'
      FooterBand = qrbCustFooter
      Master = QuickReport
      ReprintOnNewPage = False
      object QRDBText3: TQRDBText
        Left = 4
        Top = 1
        Width = 45
        Height = 21
        Size.Values = (
          44.450000000000000000
          8.466666666666667000
          2.116666666666667000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
    object QRBand2: TQRBand
      Left = 36
      Top = 203
      Width = 920
      Height = 24
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.800000000000000000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 4
        Top = 1
        Width = 128
        Height = 21
        Size.Values = (
          44.979166666666700000
          7.937500000000000000
          2.645833333333330000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Part'
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
        Left = 140
        Top = 1
        Width = 251
        Height = 21
        Size.Values = (
          44.979166666666700000
          296.333333333333000000
          2.645833333333330000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Part_Description'
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
      object qrlblQuantity: TQRLabel
        Left = 461
        Top = 0
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          975.783333333333300000
          0.000000000000000000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
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
      object qrlblPrice: TQRLabel
        Left = 557
        Top = 0
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          1178.983333333333000000
          0.000000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblPrice'
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
      object qrlblPriceUnit: TQRLabel
        Left = 622
        Top = 0
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1316.566666666667000000
          0.000000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblPriceUnit'
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
      object qrlblTotalValue: TQRLabel
        Left = 718
        Top = 1
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1519.766666666667000000
          2.116666666666667000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
      object qrlblLastDate: TQRLabel
        Left = 821
        Top = 1
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          1737.783333333333000000
          2.116666666666667000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLastDate'
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
      object qrlblPaid: TQRLabel
        Left = 394
        Top = 0
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          833.966666666666700000
          0.000000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblPaid'
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
    object qrsdtlNumbers: TQRSubDetail
      Left = 36
      Top = 227
      Width = 920
      Height = 23
      AlignToBottom = False
      BeforePrint = qrsdtlNumbersBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        48.683333333333330000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = GetSerNosSQL
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialNos: TQRLabel
        Left = 140
        Top = 0
        Width = 94
        Height = 19
        Size.Values = (
          40.216666666666670000
          296.333333333333300000
          0.000000000000000000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
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
      object lblSerialNoRange: TQRLabel
        Left = 250
        Top = 0
        Width = 100
        Height = 19
        Size.Values = (
          40.216666666666670000
          529.166666666666700000
          0.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialNoRange'
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
    object ChildBand1: TQRChildBand
      Left = 36
      Top = 147
      Width = 920
      Height = 30
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      PrintOrder = cboAfterParent
      object QRDBText4: TQRDBText
        Left = 4
        Top = 1
        Width = 128
        Height = 21
        Size.Values = (
          44.979166666666700000
          7.937500000000000000
          2.645833333333330000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Part'
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
      object QRDBText5: TQRDBText
        Left = 140
        Top = 1
        Width = 271
        Height = 21
        Size.Values = (
          44.979166666666700000
          296.333333333333000000
          2.645833333333330000
          574.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Part_Description'
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
    end
  end
  object qryStkBalRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Part.Part,'
      '        Part.Part_Description,'
      '        Part.Part_Cost_Cat,'
      '        Part.Sell_Pack_Quantity,'
      '        Part.price_unit,'
      '        Part.Customer,'
      '        Customer.Name,'
      '        Price_Unit.Description as Price_unit_description,'
      '        Price_Unit.Price_Unit_Factor,'
      
        '        Sum(Store_Stock.Store_Quantity-Store_Stock.Quantity_Allo' +
        'cated) AS Free_Stock,'
      '        Store_Stock.Invoice_Upfront,'
      '        Not_in_Use,'
      '        Product_Class'
      'FROM (((Part'
      '      LEFT JOIN Customer ON Part.Customer = Customer.Customer)'
      
        '      LEFT JOIN Price_Unit ON Part.price_unit = Price_Unit.Price' +
        '_Unit)'
      '      LEFT JOIN Store_Stock ON Part.Part = Store_Stock.Part)'
      
        '      INNER JOIN Part_Store_Levels ON Part.Part = Part_store_Lev' +
        'els.Part'
      'GROUP BY  Part.Part,'
      '          Part.Part_Description,'
      '          Part.Part_Cost_Cat,'
      '          Part.Sell_Pack_Quantity,'
      '          Part.price_unit,'
      '          Part.Customer,'
      '          Customer.Name,'
      '          Price_Unit.Description,'
      '          Price_Unit.Price_Unit_Factor,'
      '          Store_Stock.Invoice_Upfront,'
      '          Part.Not_in_Use,'
      '          Product_class'
      'HAVING ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '        Part.Part >= :Part_From and'
      '        Part.Part <= :Part_To and'
      '        ((Part.Not_in_Use = '#39'N'#39') or'
      '        (Part.Not_in_Use = :Not_in_Use)) and'
      
        '        ((Part.Product_Class = '#39'STK'#39') or (Part.Product_Class is ' +
        'null)) '
      'order by Customer.Name, Part.Part'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 312
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Part_From'
        DataType = ftString
      end
      item
        Name = 'Part_To'
        DataType = ftString
      end
      item
        Name = 'Not_in_Use'
      end>
  end
  object qryGetLastSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 date_received as Last_Sales_Date'
      'from part_movement'
      'where part = :Part and'
      'Part_movement_type = '#39'D'#39
      'order by date_received DESC')
    Left = 518
    Top = 16
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object oldqryStkBalRep: TFDQuery
    SQL.Strings = (
      'SELECT  Customer.Name,'
      '        Part.Customer,'
      '        Store_Stock.Part,'
      
        '        Sum(Store_Stock.Store_Quantity-Store_Stock.Quantity_Allo' +
        'cated) AS Free_Stock,'
      '        Store_Stock.Invoice_Upfront,'
      '        Part.Part_Description,'
      '        Part.Part_Cost_List,'
      '        Part.Part_Cost_Cat,'
      '        Price_Unit.Description as Price_unit_description,'
      '        Price_Unit.Price_Unit_Factor'
      'FROM ((Customer'
      '      RIGHT JOIN Part ON Customer.Customer = Part.Customer)'
      '      INNER JOIN Store_Stock ON Part.Part = Store_Stock.Part)'
      
        '      LEFT JOIN Price_Unit ON Part.price_unit = Price_Unit.Price' +
        '_Unit'
      'GROUP BY  Customer.Name,'
      '          Part.Customer,'
      '          Store_Stock.Part,'
      '          Store_Stock.Invoice_Upfront,'
      '          Part.Part_Description,'
      '          Part.Part_Cost_List,'
      '          Part.Part_Cost_Cat,'
      '          Price_Unit.Description,'
      '          Price_Unit.Price_Unit_Factor'
      'HAVING ((Part.Customer = :Customer) or (:Customer = 0)) and'
      'Store_stock.Part >= :Part_From and'
      'Store_Stock.Part <= :Part_To'
      'order by Customer.Name, Store_Stock.Part')
    Left = 321
    Top = 121
    ParamData = <
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
      end>
  end
  object GetSerNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Store_Stock_Serial_item.Serial_item_from,'
      'Store_Stock_Serial_item.Serial_item_to'
      'FROM Store_Stock inner JOIN Store_Stock_Serial_item ON'
      'Store_Stock.Store_Stock = Store_Stock_Serial_item.Store_Stock'
      
        'where (store_stock.part = :part)  and (store_stock.Invoice_Upfro' +
        'nt = :upfront)'
      'order by Store_stock_serial_item.serial_item_from'
      ' '
      ' '
      ' '
      ' ')
    Left = 94
    Top = 62
    ParamData = <
      item
        Name = 'part'
        DataType = ftString
      end
      item
        Name = 'upfront'
      end>
    object GetSerNosSQLSerial_item_from: TWideStringField
      FieldName = 'Serial_item_from'
      FixedChar = True
      Size = 60
    end
    object GetSerNosSQLSerial_item_to: TWideStringField
      FieldName = 'Serial_item_to'
      FixedChar = True
      Size = 60
    end
  end
end
