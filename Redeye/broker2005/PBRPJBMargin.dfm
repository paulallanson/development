object PBRPJBMarginFrm: TPBRPJBMarginFrm
  Left = 44
  Top = 50
  Caption = 'Job Bag Margin Report'
  ClientHeight = 540
  ClientWidth = 1195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 32
    Top = 24
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
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
      Height = 104
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
        220.133333333333300000
        2899.833333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 580
        Top = 3
        Width = 209
        Height = 30
        Size.Values = (
          63.500000000000000000
          1227.666666666667000000
          6.350000000000000000
          442.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Job Bag Margin Report'
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
        Top = 70
        Width = 177
        Height = 21
        Size.Values = (
          44.450000000000000000
          577.850000000000000000
          148.166666666666700000
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
        Top = 70
        Width = 48
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          148.166666666666700000
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
        Left = 706
        Top = 70
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1494.366666666667000000
          148.166666666666700000
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
        Left = 806
        Top = 70
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          1706.033333333333000000
          148.166666666666700000
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
        Left = 902
        Top = 70
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          1909.233333333333000000
          148.166666666666700000
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
        Left = 1005
        Top = 70
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2127.250000000000000000
          148.166666666666700000
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
      object QRLabel8: TQRLabel
        Left = 1081
        Top = 50
        Width = 34
        Height = 21
        Size.Values = (
          44.450000000000000000
          2288.116666666667000000
          105.833333333333300000
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
        Left = 1076
        Top = 70
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2277.533333333333000000
          148.166666666666700000
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
      object QRLabel10: TQRLabel
        Left = 1200
        Top = 70
        Width = 48
        Height = 21
        Size.Values = (
          44.450000000000000000
          2540.000000000000000000
          148.166666666666700000
          101.600000000000000000)
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
        Height = 26
        Size.Values = (
          55.033333333333330000
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
        Top = 70
        Width = 83
        Height = 20
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          148.166666666666700000
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
      object QRLabel12: TQRLabel
        Left = 1130
        Top = 70
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          2391.833333333333000000
          148.166666666666700000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No.'
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
        Left = 600
        Top = 70
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1270.000000000000000000
          148.166666666666700000
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
        Top = 70
        Width = 72
        Height = 20
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          148.166666666666700000
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 24
      Top = 201
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
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 1095
        Top = 3
        Width = 95
        Height = 20
        Size.Values = (
          42.333333333333330000
          2317.750000000000000000
          6.350000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_Order'
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
      object QRDBQuantityText1: TQRDBText
        Left = 650
        Top = 3
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          1375.833333333333000000
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
        Left = 797
        Top = 3
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          1686.983333333333000000
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
        Left = 907
        Top = 3
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1919.816666666667000000
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
        Left = 1009
        Top = 3
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          2135.716666666667000000
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
        Left = 1082
        Top = 3
        Width = 36
        Height = 21
        Size.Values = (
          44.450000000000000000
          2290.233333333333000000
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
      object QRDBText4: TQRDBText
        Left = 1200
        Top = 3
        Width = 161
        Height = 21
        Size.Values = (
          44.979166666666670000
          2540.000000000000000000
          5.291666666666667000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Supplier_Name'
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
        Left = 600
        Top = 3
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1270.000000000000000000
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
      object qrlblPODate: TQRLabel
        Left = 1200
        Top = 20
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333330000
          2540.000000000000000000
          42.333333333333330000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblPODate'
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
      Top = 298
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
        Left = 530
        Top = 10
        Width = 233
        Height = 21
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
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
        Left = 861
        Top = 10
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          1822.450000000000000000
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
        Left = 656
        Top = 1
        Width = 461
        Height = 9
        Size.Values = (
          18.520833333333330000
          1389.062500000000000000
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
        Left = 798
        Top = 10
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1689.100000000000000000
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
        Left = 933
        Top = 10
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          1974.850000000000000000
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
        Left = 1003
        Top = 10
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          2123.016666666667000000
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
      Top = 337
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
        Left = 678
        Top = 9
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          1435.100000000000000000
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
        Left = 859
        Top = 9
        Width = 117
        Height = 21
        Size.Values = (
          44.450000000000000000
          1818.216666666667000000
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
        Left = 656
        Top = -4
        Width = 461
        Height = 15
        Size.Values = (
          31.750000000000000000
          1389.062500000000000000
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
        Left = 780
        Top = 9
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          1651.000000000000000000
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
        Left = 927
        Top = 9
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          1962.150000000000000000
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
        Left = 967
        Top = 9
        Width = 151
        Height = 21
        Size.Values = (
          44.450000000000000000
          2046.816666666667000000
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
      Top = 151
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
      Top = 171
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
      Top = 245
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
        Left = 656
        Top = -5
        Width = 461
        Height = 15
        Size.Values = (
          31.750000000000000000
          1389.062500000000000000
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
        Left = 912
        Top = 6
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1930.400000000000000000
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
        Left = 807
        Top = 6
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1708.150000000000000000
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
        Left = 975
        Top = 6
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          2063.750000000000000000
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
        Left = 1018
        Top = 6
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          2154.766666666667000000
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
        Top = 8
        Width = 51
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          16.933333333333330000
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
        Top = 8
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          359.833333333333300000
          16.933333333333330000
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
        Left = 706
        Top = 8
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          1494.366666666667000000
          16.933333333333330000
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
        Left = 643
        Top = 6
        Width = 120
        Height = 21
        Size.Values = (
          44.450000000000000000
          1361.016666666667000000
          12.700000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Totals For Job Bag'
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
        Left = 600
        Top = 6
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1270.000000000000000000
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
        Top = 8
        Width = 321
        Height = 19
        Size.Values = (
          39.687500000000000000
          571.500000000000000000
          15.875000000000000000
          679.979166666666700000)
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
        Height = 20
        Size.Values = (
          42.333333333333330000
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
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '        Customer.Name as Customer_Name,'
      '        Supplier.Name as Supplier_Name,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '        Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '        Job_Bag_Line_Dets.VAT_Code,'
      '        Job_Bag_Line_Dets.Purchase_Order,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Job_Bag.Cust_Order_No,'
      '        Rep.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Vat_Code.Vat_Rate,'
      '        Job_Bag.Date_Point,'
      '        Job_Bag.Date_Start,'
      '        Job_Bag.Customer,'
      '        Job_Bag.Branch_no,'
      '        Customer_Branch.Name as Customer_Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        Job_Bag_Line_Dets.Supplier,'
      '        Job_Bag_Line_Dets.Branch_no as Supplier_Branch_no,'
      '        Supplier_Branch.Name as Supplier_Branch_Name,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Job_Bag_Line_Dets.Product_Type'
      'FROM Vat_Code'
      '  INNER JOIN (Rep'
      '  INNER JOIN (Supplier'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Customer'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Job_Bag'
      '  INNER JOIN Job_Bag_Line_Dets ON'
      '    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON'
      '    (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND'
      '    (Customer_Branch.Customer = Job_Bag.Customer)) ON'
      '    Customer.Customer = Customer_Branch.Customer) ON'
      
        '    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AN' +
        'D'
      '    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) ON'
      '    Supplier.Supplier = Supplier_Branch.Supplier) ON'
      '    Rep.Rep = Job_Bag.Rep) ON'
      '    Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code'
      ' ')
    Left = 550
    Top = 16
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
    Left = 864
    Top = 110
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
    Left = 755
    Top = 108
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
end
