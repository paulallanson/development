object PBRPJobBagCompleteFrm: TPBRPJobBagCompleteFrm
  Left = 44
  Top = 50
  Caption = 'Job Bag WIP report'
  ClientHeight = 540
  ClientWidth = 1336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 32
    Top = 24
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
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
      Height = 124
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
        262.466666666666700000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 593
        Top = 3
        Width = 183
        Height = 30
        Size.Values = (
          63.500000000000000000
          1255.183333333333000000
          6.350000000000000000
          387.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Job Bag WIP Report'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel3: TQRLabel
        Left = 273
        Top = 100
        Width = 177
        Height = 21
        Size.Values = (
          44.450000000000000000
          577.850000000000000000
          211.666666666666700000
          374.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Name & Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object RunDateQRLabel: TQRLabel
        Left = 1251
        Top = 6
        Width = 101
        Height = 19
        Size.Values = (
          40.216666666666670000
          2647.950000000000000000
          12.700000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'RunDateQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel2: TQRLabel
        Left = 10
        Top = 100
        Width = 48
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          211.666666666666700000
          101.600000000000000000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QuantityLbl: TQRLabel
        Left = 916
        Top = 100
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1938.866666666667000000
          211.666666666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel5: TQRLabel
        Left = 1005
        Top = 100
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          2127.250000000000000000
          211.666666666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel6: TQRLabel
        Left = 1102
        Top = 100
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          2332.566666666667000000
          211.666666666666700000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel7: TQRLabel
        Left = 1321
        Top = 100
        Width = 48
        Height = 21
        Size.Values = (
          44.450000000000000000
          2796.116666666667000000
          211.666666666666700000
          101.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'On Hold'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel8: TQRLabel
        Left = 1279
        Top = 80
        Width = 34
        Height = 21
        Size.Values = (
          44.450000000000000000
          2707.216666666667000000
          169.333333333333300000
          71.966666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '%age'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel9: TQRLabel
        Left = 1276
        Top = 100
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2700.866666666667000000
          211.666666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblTotBy: TQRLabel
        Left = 649
        Top = 40
        Width = 71
        Height = 19
        Size.Values = (
          40.216666666666670000
          1373.716666666667000000
          84.666666666666670000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'QRLblTotBy'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRSysData1: TQRSysData
        Left = 1246
        Top = 31
        Width = 80
        Height = 19
        Size.Values = (
          40.216666666666670000
          2637.366666666667000000
          65.616666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 170
        Top = 100
        Width = 83
        Height = 20
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          211.666666666666700000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel4: TQRLabel
        Left = 830
        Top = 100
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          211.666666666666700000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Start Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel16: TQRLabel
        Left = 80
        Top = 100
        Width = 72
        Height = 20
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          211.666666666666700000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Raised'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel1: TQRLabel
        Left = 693
        Top = 100
        Width = 117
        Height = 21
        Size.Values = (
          44.450000000000000000
          1466.850000000000000000
          211.666666666666700000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel10: TQRLabel
        Left = 1215
        Top = 101
        Width = 40
        Height = 19
        Size.Values = (
          40.216666666666670000
          2571.750000000000000000
          213.783333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel12: TQRLabel
        Left = 560
        Top = 100
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          1185.333333333333000000
          211.666666666666700000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Manager.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object QRSubDetail1: TQRSubDetail
      Left = 24
      Top = 221
      Width = 1370
      Height = 44
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        93.133333333333330000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBQuantityText1: TQRDBText
        Left = 859
        Top = 3
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          1818.216666666667000000
          6.350000000000000000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Quantity'
        Font.Charset = ANSI_CHARSET
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
      object TotalCostLbl: TQRLabel
        Left = 996
        Top = 3
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          2108.200000000000000000
          6.350000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCostLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object TotalSellLbl: TQRLabel
        Left = 1106
        Top = 3
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2341.033333333333000000
          6.350000000000000000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object MarginQRBLabel: TQRLabel
        Left = 1217
        Top = 3
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2575.983333333333000000
          6.350000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object MargPercQRLabel: TQRLabel
        Left = 1281
        Top = 3
        Width = 36
        Height = 21
        Size.Values = (
          44.450000000000000000
          2711.450000000000000000
          6.350000000000000000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '%Age'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText1: TQRDBText
        Left = 10
        Top = 3
        Width = 51
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          6.350000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Font.Charset = ANSI_CHARSET
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
      object QRLblDesc: TQRLabel
        Left = 270
        Top = 20
        Width = 421
        Height = 20
        Size.Values = (
          42.333333333333330000
          571.500000000000000000
          42.333333333333330000
          891.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblDesc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText2: TQRDBText
        Left = 170
        Top = 3
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          6.350000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
        Font.Charset = ANSI_CHARSET
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
      object QRDBText7: TQRDBText
        Left = 830
        Top = 3
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          6.350000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Start'
        Font.Charset = ANSI_CHARSET
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
      object QRDBText9: TQRDBText
        Left = 80
        Top = 3
        Width = 65
        Height = 20
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          6.350000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = ANSI_CHARSET
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
      object QRLblCust: TQRLabel
        Left = 270
        Top = 3
        Width = 64
        Height = 20
        Size.Values = (
          42.333333333333330000
          571.500000000000000000
          6.350000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblCust'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object RepQRFooter: TQRBand
      Left = 24
      Top = 318
      Width = 1370
      Height = 39
      AlignToBottom = False
      BeforePrint = RepQRFooterBeforePrint
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
        Left = 731
        Top = 10
        Width = 233
        Height = 21
        Size.Values = (
          44.979166666666670000
          1547.812500000000000000
          21.166666666666670000
          492.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Sales Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblGroupSales: TQRLabel
        Left = 1068
        Top = 10
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          2260.600000000000000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGroupSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRShape1: TQRShape
        Left = 858
        Top = 1
        Width = 461
        Height = 9
        Size.Values = (
          18.520833333333330000
          1815.041666666667000000
          2.645833333333333000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblGroupCost: TQRLabel
        Left = 999
        Top = 10
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          2114.550000000000000000
          21.166666666666670000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblGroupMargin: TQRLabel
        Left = 1144
        Top = 10
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          2421.466666666667000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGroupSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblGroupMarginPerc: TQRLabel
        Left = 1204
        Top = 10
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          2548.466666666667000000
          21.166666666666670000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGroupSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrSummary: TQRBand
      Left = 24
      Top = 357
      Width = 1370
      Height = 32
      AlignToBottom = False
      BeforePrint = qrSummaryBeforePrint
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
        Left = 878
        Top = 9
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          1858.433333333333000000
          19.050000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Report Totals'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblReportSales: TQRLabel
        Left = 1059
        Top = 9
        Width = 117
        Height = 21
        Size.Values = (
          44.450000000000000000
          2241.550000000000000000
          19.050000000000000000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblReportSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRShape2: TQRShape
        Left = 856
        Top = -4
        Width = 461
        Height = 15
        Size.Values = (
          31.750000000000000000
          1812.395833333333000000
          -7.937500000000000000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblReportCost: TQRLabel
        Left = 979
        Top = 9
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          2072.216666666667000000
          19.050000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblReportMargin: TQRLabel
        Left = 1137
        Top = 9
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          2406.650000000000000000
          19.050000000000000000
          258.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblReportMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblReportMarginPerc: TQRLabel
        Left = 1168
        Top = 9
        Width = 151
        Height = 21
        Size.Values = (
          44.450000000000000000
          2472.266666666667000000
          19.050000000000000000
          319.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblReportMarginPerc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object RepQRGroup: TQRGroup
      Left = 24
      Top = 171
      Width = 1370
      Height = 20
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
        42.333333333333330000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = RepQRFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 14
        Top = 0
        Width = 100
        Height = 20
        Size.Values = (
          42.333333333333330000
          29.633333333333330000
          0.000000000000000000
          211.666666666666700000)
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
    object JobQRGroup: TQRGroup
      Left = 24
      Top = 191
      Width = 1370
      Height = 30
      AlignToBottom = False
      BeforePrint = JobQRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Job_Bag'
      FooterBand = JobQRFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object QRLabel13: TQRLabel
        Left = 11
        Top = 5
        Width = 57
        Height = 19
        Size.Values = (
          40.216666666666670000
          23.283333333333330000
          10.583333333333330000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText5: TQRDBText
        Left = 80
        Top = 5
        Width = 51
        Height = 19
        Size.Values = (
          40.216666666666670000
          169.333333333333300000
          10.583333333333330000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Font.Charset = ANSI_CHARSET
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
      object QRLabel14: TQRLabel
        Left = 190
        Top = 5
        Width = 76
        Height = 19
        Size.Values = (
          40.216666666666670000
          402.166666666666700000
          10.583333333333330000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText6: TQRDBText
        Left = 290
        Top = 5
        Width = 92
        Height = 19
        Size.Values = (
          40.216666666666670000
          613.833333333333300000
          10.583333333333330000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Font.Charset = ANSI_CHARSET
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
    object JobQRFooter: TQRBand
      Left = 24
      Top = 265
      Width = 1370
      Height = 53
      AfterPrint = JobQRFooterAfterPrint
      AlignToBottom = False
      BeforePrint = JobQRFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        112.183333333333300000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrshapeJobBag: TQRShape
        Left = 858
        Top = -5
        Width = 461
        Height = 15
        Size.Values = (
          31.750000000000000000
          1815.041666666667000000
          -10.583333333333330000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblJobSales: TQRLabel
        Left = 1113
        Top = 6
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          2355.850000000000000000
          12.700000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblJobCost: TQRLabel
        Left = 1008
        Top = 6
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          2133.600000000000000000
          12.700000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblMargin: TQRLabel
        Left = 1186
        Top = 6
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          2510.366666666667000000
          12.700000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblMarginPerc: TQRLabel
        Left = 1220
        Top = 6
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          2582.333333333333000000
          12.700000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblMarginPerc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrdbJobNumber: TQRDBText
        Left = 10
        Top = 6
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          12.700000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Font.Charset = ANSI_CHARSET
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
      object qrdbJobDate: TQRDBText
        Left = 170
        Top = 6
        Width = 97
        Height = 21
        Size.Values = (
          44.450000000000000000
          359.833333333333300000
          12.700000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
        Font.Charset = ANSI_CHARSET
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
      object qrdbJobDescription: TQRDBText
        Left = 270
        Top = 27
        Width = 451
        Height = 19
        Size.Values = (
          39.687500000000000000
          571.500000000000000000
          58.208333333333330000
          955.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Font.Charset = ANSI_CHARSET
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
      object qrdbJobQuantity: TQRDBText
        Left = 917
        Top = 6
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1940.983333333333000000
          12.700000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
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
      object qrlblJobBagTotal: TQRLabel
        Left = 865
        Top = 6
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          1830.916666666667000000
          12.700000000000000000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Totals'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText8: TQRDBText
        Left = 830
        Top = 6
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1756.833333333333000000
          12.700000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Start'
        Font.Charset = ANSI_CHARSET
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
      object qrdbJobCustomer: TQRDBText
        Left = 270
        Top = 6
        Width = 281
        Height = 21
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          13.229166666666670000
          595.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
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
      object QRDBText10: TQRDBText
        Left = 80
        Top = 6
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          12.700000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = ANSI_CHARSET
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
      object QRDBText3: TQRDBText
        Left = 694
        Top = 6
        Width = 131
        Height = 21
        Size.Values = (
          44.979166666666670000
          1468.437500000000000000
          13.229166666666670000
          277.812500000000000000)
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
        Left = 1325
        Top = 6
        Width = 41
        Height = 21
        Size.Values = (
          44.979166666666670000
          2804.583333333333000000
          13.229166666666670000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'On_Hold'
        Font.Charset = ANSI_CHARSET
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
      object QRDBText11: TQRDBText
        Left = 560
        Top = 6
        Width = 131
        Height = 21
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          13.229166666666670000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager'
        Font.Charset = ANSI_CHARSET
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
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Line_Dets.Job_Bag,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '                   Customer.Name AS Customer_Name,'
      '                   Supplier.Name AS Supplier_Name,'
      '                   Job_Bag_Line_Dets.Line_Is_Internal_Cost,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '                   Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '                   Job_Bag_Line_Dets.VAT_Code,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '                   Job_Bag_Line_Dets.Purchase_Order,'
      '                   Job_Bag_Line_Dets.Line,'
      '                   Job_Bag_Line_Dets.Qty_Invoiced,'
      '                   Job_Bag_Line_Dets.Unit_Cost,'
      '                   Job_Bag_Line_Dets.Unit_SSP,'
      '                   Job_Bag_Line_Dets.Selling_Price,'
      '                   Job_Bag_Line_Dets.Price_Unit,'
      '      (SELECT Price_Unit_Factor'
      '        FROM Price_Unit'
      
        '        WHERE Price_Unit.Price_unit = Job_Bag_Line_Dets.Price_Un' +
        'it) as JB_Price_Unit_Factor,'
      '                   Job_Bag.Cust_Order_No,'
      '                   Rep.Rep,'
      '                   Rep.Name AS Rep_Name,'
      '                   Vat_Code.Vat_Rate,'
      '                   Job_Bag.Date_Point,'
      '                   Job_Bag.Date_Start,'
      '                   Job_Bag.Quantity,'
      '                   Job_Bag.Customer,'
      '                   Job_Bag.Branch_No,'
      '                   Customer_Branch.Name AS Customer_Branch_Name,'
      '      Customer.Analysis_Code_1,'
      '      Customer.Analysis_Code_2,'
      '      (SELECT CB.Account_Code'
      '       FROM Customer_Branch CB'
      '       WHERE CB.Customer = Customer_Branch.Inv_To_Customer AND'
      
        '             CB.Branch_No = Customer_Branch.Inv_To_Branch) AS Ac' +
        'count_Code,'
      '                   Job_Bag_Line_Dets.Supplier,'
      
        '                   Job_Bag_Line_Dets.Branch_No AS Supplier_Branc' +
        'h_no,'
      '                   Supplier_Branch.Name AS Supplier_Branch_Name,'
      '                   Purchase_OrderLine.Inactive,'
      '                   Purchase_OrderLine.Quantity as PO_Quantity,'
      
        '                   Purchase_OrderLine.Order_Price as PO_Order_Pr' +
        'ice,'
      
        '                   Purchase_OrderLine.Selling_Price as PO_Sellin' +
        'g_Price,'
      
        '                   Purchase_OrderLine.Qty_Invoiced as PO_Qty_Inv' +
        'oiced,'
      '                   Purchase_OrderLine.Sell_Unit as PO_Sell_Unit,'
      
        '                   Purchase_OrderLine.Order_Unit as PO_Order_Uni' +
        't,'
      '      (SELECT Price_Unit_Factor'
      '        FROM Price_Unit'
      
        '        WHERE Price_Unit.Price_unit = Purchase_OrderLine.Sell_Un' +
        'it) as PO_Sell_Unit_Factor,'
      '      (SELECT Price_Unit_Factor'
      '        FROM Price_Unit'
      
        '        WHERE Price_Unit.Price_unit = Purchase_OrderLine.Order_U' +
        'nit) as PO_Order_Unit_Factor,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Job_Bag.Office_Contact,'
      '      Operator.Name as Account_Manager,'
      '      Job_Bag.Goods_Required,'
      '      Job_Bag.Ready_for_Invoicing,'
      '      Job_Bag_Line_Dets.Product_Type'
      'FROM Purchase_OrderLine'
      '                   RIGHT JOIN (Vat_Code'
      '                   INNER JOIN ((Supplier'
      '                   INNER JOIN Supplier_Branch ON'
      
        '                                  Supplier.Supplier = Supplier_B' +
        'ranch.Supplier)'
      '                   INNER JOIN (Customer'
      '      INNER JOIN ((Rep'
      '                   INNER JOIN (Customer_Branch'
      '                   INNER JOIN Job_Bag ON'
      
        '                                  (Customer_Branch.Branch_no = J' +
        'ob_Bag.Branch_No) AND'
      
        '                                  (Customer_Branch.Customer = Jo' +
        'b_Bag.Customer)) ON'
      '                                  Rep.Rep = Job_Bag.Rep)'
      '                   INNER JOIN Job_Bag_Line_Dets ON'
      
        '                                  Job_Bag.Job_Bag = Job_Bag_Line' +
        '_Dets.Job_Bag) ON'
      
        '                                  Customer.Customer = Customer_B' +
        'ranch.Customer) ON'
      
        '                                  (Supplier_Branch.Branch_no = J' +
        'ob_Bag_Line_Dets.Branch_No) AND'
      
        '                                  (Supplier_Branch.Supplier = Jo' +
        'b_Bag_Line_Dets.Supplier)) ON'
      '        Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) ON'
      
        '                                  (Purchase_OrderLine.Line = Job' +
        '_Bag_Line_Dets.Line) AND'
      
        '                                  (Purchase_OrderLine.Purchase_O' +
        'rder = Job_Bag_Line_Dets.Purchase_Order)'
      
        '      INNER JOIN Operator ON Job_Bag.Office_Contact = Operator.O' +
        'perator'
      'WHERE     (Job_Bag.Job_Bag_Status < 30) AND'
      '          (Job_Bag.On_Hold = '#39'N'#39') AND'
      
        '          ((Job_Bag.Invoice_This_Week = :Invoice_This_Week) OR (' +
        ':Invoice_This_Week = '#39'A'#39')) AND'
      
        '          ((Job_Bag.Production_Complete = :Production_Complete) ' +
        'OR (:Production_Complete = '#39'A'#39')) AND'
      '          ((Purchase_orderLine.InActive <> '#39'Y'#39') or'
      '           (Purchase_orderLine.Inactive is NULL)) AND'
      '          ((Job_Bag_Line_Dets.InActive = '#39'N'#39') or'
      '           (Job_Bag_Line_Dets.Inactive is NULL)) AND'
      '          ((Job_Bag.InActive = '#39'N'#39') or'
      '           (Job_Bag.Inactive is NULL)) AND'
      
        '          ((Job_bag.Goods_Required >= :Date_From) AND (Job_bag.G' +
        'oods_Required <= :Date_To)) AND'
      
        '          ((Job_Bag.Customer = :Customer) OR (:Customer = 0)) AN' +
        'D'
      
        '          ((Job_Bag.Office_Contact = :Office_Contact) OR (:Offic' +
        'e_Contact = 0))'
      ''
      '')
    Left = 550
    Top = 16
    ParamData = <
      item
        Name = 'Invoice_This_Week'
        ParamType = ptInput
      end
      item
        Name = 'Production_Complete'
        ParamType = ptInput
      end
      item
        Name = 'Date_From'
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Office_Contact'
        ParamType = ptInput
      end>
  end
  object qryGetPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_OrderLine.Product_Type, Product_Type.Description'
      'from Purchase_OrderLine, Product_Type'
      'where Purchase_Order = :Purchase_Order and'
      'Purchase_OrderLine.Product_Type = Product_Type.Product_Type')
    Left = 755
    Top = 44
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_Type.Product_Type, Product_Type.Description'
      'from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 395
    Top = 44
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryGetSuppInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit'
      '  INNER JOIN Supplier_Invoice_Line'
      '    ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit'
      'WHERE Job_Bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line')
    Left = 864
    Top = 46
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetSalesInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sales_Invoice_Line.Sales_Invoice, '
      #9'Sales_Invoice_Line.Invoice_Line_No, '
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Sales_Invoice_Line.Goods_Value, '
      #9'Price_Unit.Price_Unit_Factor, '
      #9'SUM(Sales_Invoice_Add_charge.Amount) as Total_Charges'
      'FROM (Price_Unit '
      #9'INNER JOIN Sales_Invoice_Line '
      #9#9'ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) '
      #9'LEFT JOIN Sales_Invoice_Add_charge '
      
        #9#9'ON (Sales_Invoice_Line.Invoice_Line_No = Sales_Invoice_Add_cha' +
        'rge.Invoice_line_no) AND (Sales_Invoice_Line.Sales_Invoice = Sal' +
        'es_Invoice_Add_charge.Sales_Invoice)'
      'WHERE Job_Bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line'
      'GROUP BY'
      ' '#9'Sales_Invoice_Line.Sales_Invoice, '
      #9'Sales_Invoice_Line.Invoice_Line_No, '
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Sales_Invoice_Line.Goods_Value, '
      #9'Price_Unit.Price_Unit_Factor')
    Left = 984
    Top = 46
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetSuppPOInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor,'
      #9'SUM(Supplier_Invoice_Charge.Amount) as Total_Charges'
      'FROM Price_Unit '
      #9'INNER JOIN (Supplier_Invoice_Line '
      #9'LEFT JOIN Supplier_Invoice_Charge '
      
        #9#9'ON (Supplier_Invoice_Line.Supplier_Invoice = Supplier_Invoice_' +
        'Charge.Supplier_Invoice) '
      
        #9#9#9'AND (Supplier_Invoice_Line.Purchase_Order = Supplier_Invoice_' +
        'Charge.Purchase_Order) '
      
        #9#9#9'AND (Supplier_Invoice_Line.Line = Supplier_Invoice_Charge.Lin' +
        'e)) '
      #9#9'ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit'
      
        'WHERE Supplier_Invoice_Line.Purchase_order = :Purchase_order and' +
        ' Supplier_Invoice_Line.Line = :Line'
      'GROUP BY Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor')
    Left = 232
    Top = 38
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purchase_Order.Date_Point'
      'From Purchase_Order'
      'WHERE Purchase_Order.Purchase_Order = :Purchase_Order')
    Left = 147
    Top = 36
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Line_Dets.Job_Bag,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '                   Customer.Name AS Customer_Name,'
      '                   Supplier.Name AS Supplier_Name,'
      '                   Job_Bag_Line_Dets.Line_Is_Internal_Cost,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '                   Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '                   Job_Bag_Line_Dets.VAT_Code,'
      '                   Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '                   Job_Bag_Line_Dets.Purchase_Order,'
      '                   Job_Bag_Line_Dets.Line,'
      '                   Job_Bag_Line_Dets.Qty_Invoiced,'
      '                   Job_Bag_Line_Dets.Unit_Cost,'
      '                   Job_Bag_Line_Dets.Unit_SSP,'
      '                   Job_Bag_Line_Dets.Selling_Price,'
      '                   Job_Bag_Line_Dets.Price_Unit,'
      '      (SELECT Price_Unit_Factor'
      '        FROM Price_Unit'
      
        '        WHERE Price_Unit.Price_unit = Job_Bag_Line_Dets.Price_Un' +
        'it) as JB_Price_Unit_Factor,'
      '                   Job_Bag.Cust_Order_No,'
      '                   Job_Bag.On_Hold,'
      '                   Rep.Rep,'
      '                   Rep.Name AS Rep_Name,'
      '                   Vat_Code.Vat_Rate,'
      '                   Job_Bag.Date_Point,'
      '                   Job_Bag.Date_Start,'
      '                   Job_Bag.Quantity,'
      '                   Job_Bag.Customer,'
      '                   Job_Bag.Branch_No,'
      '                   Customer_Branch.Name AS Customer_Branch_Name,'
      '      Customer.Analysis_Code_1,'
      '      Customer.Analysis_Code_2,'
      '      (SELECT CB.Account_Code'
      '       FROM Customer_Branch CB'
      '       WHERE CB.Customer = Customer_Branch.Inv_To_Customer AND'
      
        '             CB.Branch_No = Customer_Branch.Inv_To_Branch) AS Ac' +
        'count_Code,'
      '                   Job_Bag_Line_Dets.Supplier,'
      
        '                   Job_Bag_Line_Dets.Branch_No AS Supplier_Branc' +
        'h_no,'
      '                   Supplier_Branch.Name AS Supplier_Branch_Name,'
      '                   Purchase_OrderLine.Inactive,'
      '                   Purchase_OrderLine.Quantity as PO_Quantity,'
      
        '                   Purchase_OrderLine.Order_Price as PO_Order_Pr' +
        'ice,'
      
        '                   Purchase_OrderLine.Selling_Price as PO_Sellin' +
        'g_Price,'
      
        '                   Purchase_OrderLine.Qty_Invoiced as PO_Qty_Inv' +
        'oiced,'
      '                   Purchase_OrderLine.Sell_Unit as PO_Sell_Unit,'
      
        '                   Purchase_OrderLine.Order_Unit as PO_Order_Uni' +
        't,'
      '      (SELECT Price_Unit_Factor'
      '        FROM Price_Unit'
      
        '        WHERE Price_Unit.Price_unit = Purchase_OrderLine.Sell_Un' +
        'it) as PO_Sell_Unit_Factor,'
      '      (SELECT Price_Unit_Factor'
      '        FROM Price_Unit'
      
        '        WHERE Price_Unit.Price_unit = Purchase_OrderLine.Order_U' +
        'nit) as PO_Order_Unit_Factor,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Job_Bag.Office_Contact,'
      '      Operator.Name as Account_Manager,'
      '      Job_Bag.Goods_Required,'
      '      Job_Bag.Ready_for_Invoicing,'
      '      Job_Bag_Line_Dets.Product_Type'
      'FROM Purchase_OrderLine'
      '                   RIGHT JOIN (Vat_Code'
      '                   INNER JOIN ((Supplier'
      '                   INNER JOIN Supplier_Branch ON'
      
        '                                  Supplier.Supplier = Supplier_B' +
        'ranch.Supplier)'
      '                   INNER JOIN (Customer'
      '      INNER JOIN ((Rep'
      '                   INNER JOIN (Customer_Branch'
      '                   INNER JOIN Job_Bag ON'
      
        '                                  (Customer_Branch.Branch_no = J' +
        'ob_Bag.Branch_No) AND'
      
        '                                  (Customer_Branch.Customer = Jo' +
        'b_Bag.Customer)) ON'
      '                                  Rep.Rep = Job_Bag.Rep)'
      '                   INNER JOIN Job_Bag_Line_Dets ON'
      
        '                                  Job_Bag.Job_Bag = Job_Bag_Line' +
        '_Dets.Job_Bag) ON'
      
        '                                  Customer.Customer = Customer_B' +
        'ranch.Customer) ON'
      
        '                                  (Supplier_Branch.Branch_no = J' +
        'ob_Bag_Line_Dets.Branch_No) AND'
      
        '                                  (Supplier_Branch.Supplier = Jo' +
        'b_Bag_Line_Dets.Supplier)) ON'
      '        Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) ON'
      
        '                                  (Purchase_OrderLine.Line = Job' +
        '_Bag_Line_Dets.Line) AND'
      
        '                                  (Purchase_OrderLine.Purchase_O' +
        'rder = Job_Bag_Line_Dets.Purchase_Order)'
      
        '      INNER JOIN Operator ON Job_Bag.Office_Contact = Operator.O' +
        'perator'
      'WHERE     (Job_Bag.Job_Bag_Status < 30) AND'
      '          (Job_Bag.On_Hold = '#39'N'#39') AND'
      
        '          ((Job_Bag.Invoice_This_Week = :Invoice_This_Week) OR (' +
        ':Invoice_This_Week = '#39'A'#39')) AND'
      
        '          ((Job_Bag.Production_Complete = :Production_Complete) ' +
        'OR (:Production_Complete = '#39'A'#39')) AND'
      '          ((Purchase_orderLine.InActive <> '#39'Y'#39') or'
      '           (Purchase_orderLine.Inactive is NULL)) AND'
      '          ((Job_Bag_Line_Dets.InActive = '#39'N'#39') or'
      '           (Job_Bag_Line_Dets.Inactive is NULL)) AND'
      '          ((Job_Bag.InActive = '#39'N'#39') or'
      '           (Job_Bag.Inactive is NULL)) AND'
      
        '          ((Job_bag.Goods_Required >= :Date_From) AND (Job_bag.G' +
        'oods_Required <= :Date_To)) AND'
      
        '          ((Job_Bag.Customer = :Customer) OR (:Customer = 0)) AN' +
        'D'
      
        '          ((Job_Bag.Office_Contact = :Office_Contact) OR (:Offic' +
        'e_Contact = 0))'
      ''
      '')
    Left = 638
    Top = 16
    ParamData = <
      item
        Name = 'Invoice_This_Week'
        ParamType = ptInput
      end
      item
        Name = 'Production_Complete'
        ParamType = ptInput
      end
      item
        Name = 'Date_From'
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Office_Contact'
        ParamType = ptInput
      end>
  end
end
