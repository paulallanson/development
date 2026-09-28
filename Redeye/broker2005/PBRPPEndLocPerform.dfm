object PBRPPEndLocPerformfrm: TPBRPPEndLocPerformfrm
  Left = 136
  Top = 106
  Caption = 'Revenue Centre Performance Report'
  ClientHeight = 575
  ClientWidth = 1191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object quickreport: TQuickRep
    Left = 8
    Top = 8
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = quickreportBeforePrint
    DataSet = qryRevenueLocs
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
    ReportTitle = 'Reps Product Category report'
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
      Left = 24
      Top = 47
      Width = 1356
      Height = 144
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.800000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 473
        Top = 10
        Width = 409
        Height = 29
        Size.Values = (
          61.383333333333330000
          1001.183333333333000000
          21.166666666666670000
          865.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Revenue Centre Performance Report'
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
        Left = 632
        Top = 40
        Width = 92
        Height = 21
        Size.Values = (
          44.450000000000000000
          1337.733333333333000000
          84.666666666666670000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Period From'
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
      object QRDBText2: TQRDBText
        Left = 20
        Top = 80
        Width = 177
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          169.333333333333300000
          374.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryRevenueLocs
        DataField = 'Invoice_Location_Descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblMonth1: TQRLabel
        Left = 166
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          351.366666666666700000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel5: TQRLabel
        Left = 144
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          304.800000000000000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel6: TQRLabel
        Left = 198
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          419.100000000000000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel30: TQRLabel
        Left = 1292
        Top = 110
        Width = 46
        Height = 14
        Size.Values = (
          29.633333333333330000
          2734.733333333333000000
          232.833333333333300000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Total YTD'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel31: TQRLabel
        Left = 1265
        Top = 125
        Width = 45
        Height = 15
        Size.Values = (
          31.750000000000000000
          2677.583333333333000000
          264.583333333333300000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel32: TQRLabel
        Left = 1325
        Top = 125
        Width = 27
        Height = 15
        Size.Values = (
          31.750000000000000000
          2804.583333333333000000
          264.583333333333300000
          57.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth2: TQRLabel
        Left = 259
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          548.216666666666700000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel13: TQRLabel
        Left = 237
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          501.650000000000000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel14: TQRLabel
        Left = 291
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          615.950000000000000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth3: TQRLabel
        Left = 353
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          747.183333333333300000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel16: TQRLabel
        Left = 331
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          700.616666666666700000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel17: TQRLabel
        Left = 385
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          814.916666666666700000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth4: TQRLabel
        Left = 447
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          946.150000000000000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel19: TQRLabel
        Left = 425
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          899.583333333333300000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel20: TQRLabel
        Left = 479
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          1013.883333333333000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth5: TQRLabel
        Left = 541
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          1145.116666666667000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel22: TQRLabel
        Left = 519
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          1098.550000000000000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel23: TQRLabel
        Left = 573
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          1212.850000000000000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth6: TQRLabel
        Left = 634
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          1341.966666666667000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel25: TQRLabel
        Left = 612
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          1295.400000000000000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel26: TQRLabel
        Left = 666
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          1409.700000000000000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth7: TQRLabel
        Left = 728
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          1540.933333333333000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel28: TQRLabel
        Left = 706
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          1494.366666666667000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel29: TQRLabel
        Left = 760
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          1608.666666666667000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth8: TQRLabel
        Left = 822
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          1739.900000000000000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel34: TQRLabel
        Left = 800
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          1693.333333333333000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel35: TQRLabel
        Left = 854
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          1807.633333333333000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth9: TQRLabel
        Left = 916
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          1938.866666666667000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel39: TQRLabel
        Left = 894
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          1892.300000000000000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel40: TQRLabel
        Left = 948
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          2006.600000000000000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth10: TQRLabel
        Left = 1009
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          2135.716666666667000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel42: TQRLabel
        Left = 987
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          2089.150000000000000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel43: TQRLabel
        Left = 1041
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          2203.450000000000000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth11: TQRLabel
        Left = 1103
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          2334.683333333333000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel45: TQRLabel
        Left = 1081
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          2288.116666666667000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel46: TQRLabel
        Left = 1135
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          2402.416666666667000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblMonth12: TQRLabel
        Left = 1195
        Top = 109
        Width = 44
        Height = 14
        Size.Values = (
          29.633333333333330000
          2529.416666666667000000
          230.716666666666700000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel50: TQRLabel
        Left = 1174
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          2484.966666666667000000
          264.583333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel51: TQRLabel
        Left = 1227
        Top = 125
        Width = 26
        Height = 14
        Size.Values = (
          29.633333333333330000
          2597.150000000000000000
          264.583333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRSysData1: TQRSysData
        Left = 1282
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2713.566666666667000000
          21.166666666666670000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 1266
        Top = 35
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2679.700000000000000000
          74.083333333333330000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
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
    end
    object qrgReps: TQRGroup
      Left = 24
      Top = 196
      Width = 1356
      Height = 5
      AlignToBottom = False
      BeforePrint = qrgRepsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        10.583333333333330000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryRevenueLocs.Invoice_Location_Descr'
      FooterBand = qrbGrpRepFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
    end
    object QRSubDetail1: TQRSubDetail
      Left = 24
      Top = 201
      Width = 1356
      Height = 32
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = quickreport
      DataSet = qryCategory
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText5: TQRDBText
        Left = 680
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1439.333333333333000000
          21.166666666666670000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryCategory
        DataField = 'Category'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 550
        Top = 10
        Width = 124
        Height = 21
        Size.Values = (
          44.450000000000000000
          1164.166666666667000000
          21.166666666666670000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryRevenueLocs
        DataField = 'Invoice_Location'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 20
        Top = 10
        Width = 229
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          21.166666666666670000
          484.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Category Header band'
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
    object QRBand2: TQRBand
      Left = 24
      Top = 191
      Width = 1356
      Height = 5
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      LinkBand = QRSubDetail1
      Size.Values = (
        10.583333333333330000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object qrsubPeriods: TQRSubDetail
      Left = 24
      Top = 233
      Width = 1356
      Height = 30
      AlignToBottom = False
      BeforePrint = qrsubPeriodsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = qryReport
      FooterBand = qrbGrpCatFooter
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel2: TQRLabel
        Left = 60
        Top = 0
        Width = 142
        Height = 21
        Size.Values = (
          44.450000000000000000
          127.000000000000000000
          0.000000000000000000
          300.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period sales details'
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
    object qrbGrpCatFooter: TQRBand
      Left = 24
      Top = 263
      Width = 1356
      Height = 21
      AfterPrint = qrbGrpCatFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGrpCatFooterBeforePrint
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
        44.450000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText7: TQRDBText
        Left = 10
        Top = 0
        Width = 111
        Height = 14
        Size.Values = (
          29.104166666666670000
          21.166666666666670000
          0.000000000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryCategory
        DataField = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO1: TQRLabel
        Left = 140
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf1: TQRLabel
        Left = 183
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO2: TQRLabel
        Left = 234
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf2: TQRLabel
        Left = 276
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          584.200000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO3: TQRLabel
        Left = 328
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf3: TQRLabel
        Left = 370
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO4: TQRLabel
        Left = 420
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf4: TQRLabel
        Left = 463
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO5: TQRLabel
        Left = 515
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf5: TQRLabel
        Left = 558
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO6: TQRLabel
        Left = 609
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf6: TQRLabel
        Left = 651
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf7: TQRLabel
        Left = 744
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO7: TQRLabel
        Left = 702
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO8: TQRLabel
        Left = 797
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf8: TQRLabel
        Left = 839
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO9: TQRLabel
        Left = 891
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf9: TQRLabel
        Left = 934
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO10: TQRLabel
        Left = 985
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf10: TQRLabel
        Left = 1028
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO11: TQRLabel
        Left = 1078
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf11: TQRLabel
        Left = 1120
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTO12: TQRLabel
        Left = 1169
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActProf12: TQRLabel
        Left = 1212
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          2.116666666666667000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblCatActTOTotal: TQRLabel
        Left = 1257
        Top = 1
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          2.116666666666667000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblCatActProfTotal: TQRLabel
        Left = 1305
        Top = 1
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          2.116666666666667000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
    end
    object qrbGrpRepFooter: TQRBand
      Left = 24
      Top = 284
      Width = 1356
      Height = 99
      Frame.DrawTop = True
      Frame.Width = 2
      AfterPrint = qrbGrpRepFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGrpRepFooterBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        209.550000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel8: TQRLabel
        Left = 102
        Top = 26
        Width = 31
        Height = 14
        Size.Values = (
          29.633333333333330000
          215.900000000000000000
          55.033333333333330000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Actual'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel9: TQRLabel
        Left = 98
        Top = 8
        Width = 35
        Height = 14
        Size.Values = (
          29.633333333333330000
          207.433333333333300000
          16.933333333333330000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Budget'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel10: TQRLabel
        Left = 72
        Top = 45
        Width = 61
        Height = 14
        Size.Values = (
          29.633333333333330000
          152.400000000000000000
          95.250000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Difference %'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel11: TQRLabel
        Left = 10
        Top = 8
        Width = 30
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          16.933333333333330000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO1: TQRLabel
        Left = 140
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO1: TQRLabel
        Left = 140
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf1: TQRLabel
        Left = 183
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf1: TQRLabel
        Left = 183
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO2: TQRLabel
        Left = 234
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO2: TQRLabel
        Left = 234
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf2: TQRLabel
        Left = 276
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          584.200000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf2: TQRLabel
        Left = 276
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          584.200000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO3: TQRLabel
        Left = 328
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO3: TQRLabel
        Left = 328
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf3: TQRLabel
        Left = 370
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf3: TQRLabel
        Left = 370
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO4: TQRLabel
        Left = 420
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO4: TQRLabel
        Left = 420
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf4: TQRLabel
        Left = 463
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf4: TQRLabel
        Left = 463
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO5: TQRLabel
        Left = 515
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO5: TQRLabel
        Left = 515
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf5: TQRLabel
        Left = 558
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf5: TQRLabel
        Left = 558
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO6: TQRLabel
        Left = 609
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO6: TQRLabel
        Left = 609
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf6: TQRLabel
        Left = 651
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf6: TQRLabel
        Left = 651
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO7: TQRLabel
        Left = 702
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO7: TQRLabel
        Left = 702
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf7: TQRLabel
        Left = 744
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf7: TQRLabel
        Left = 744
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO8: TQRLabel
        Left = 797
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO8: TQRLabel
        Left = 797
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf8: TQRLabel
        Left = 839
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf8: TQRLabel
        Left = 839
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO9: TQRLabel
        Left = 891
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO9: TQRLabel
        Left = 891
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf9: TQRLabel
        Left = 934
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf9: TQRLabel
        Left = 934
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO10: TQRLabel
        Left = 985
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO10: TQRLabel
        Left = 985
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf10: TQRLabel
        Left = 1028
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf10: TQRLabel
        Left = 1028
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO11: TQRLabel
        Left = 1078
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO11: TQRLabel
        Left = 1078
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf11: TQRLabel
        Left = 1120
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf11: TQRLabel
        Left = 1120
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTO12: TQRLabel
        Left = 1169
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTO12: TQRLabel
        Left = 1169
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProf12: TQRLabel
        Left = 1212
        Top = 26
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          55.033333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProf12: TQRLabel
        Left = 1212
        Top = 8
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActTOTotal: TQRLabel
        Left = 1257
        Top = 26
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          55.033333333333330000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudTOTotal: TQRLabel
        Left = 1257
        Top = 8
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          16.933333333333330000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepActProfTotal: TQRLabel
        Left = 1305
        Top = 26
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          55.033333333333330000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblRepBudProfTotal: TQRLabel
        Left = 1305
        Top = 8
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          16.933333333333330000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff1: TQRLabel
        Left = 140
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff1: TQRLabel
        Left = 183
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff2: TQRLabel
        Left = 234
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff2: TQRLabel
        Left = 276
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          584.200000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff3: TQRLabel
        Left = 328
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff3: TQRLabel
        Left = 370
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff4: TQRLabel
        Left = 420
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff4: TQRLabel
        Left = 463
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff5: TQRLabel
        Left = 515
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff5: TQRLabel
        Left = 558
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff6: TQRLabel
        Left = 609
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff6: TQRLabel
        Left = 651
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff7: TQRLabel
        Left = 702
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff7: TQRLabel
        Left = 744
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff8: TQRLabel
        Left = 797
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff8: TQRLabel
        Left = 839
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff9: TQRLabel
        Left = 891
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff9: TQRLabel
        Left = 934
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff10: TQRLabel
        Left = 985
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff10: TQRLabel
        Left = 1028
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff11: TQRLabel
        Left = 1078
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff11: TQRLabel
        Left = 1120
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiff12: TQRLabel
        Left = 1169
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiff12: TQRLabel
        Left = 1212
        Top = 46
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          97.366666666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTODiffTotal: TQRLabel
        Left = 1257
        Top = 46
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          97.366666666666670000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblProfDiffTotal: TQRLabel
        Left = 1305
        Top = 46
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          97.366666666666670000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRShape1: TQRShape
        Left = 133
        Top = 63
        Width = 1224
        Height = 11
        Size.Values = (
          23.812500000000000000
          280.458333333333400000
          132.291666666666700000
          2590.270833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand3: TQRBand
      Left = 24
      Top = 383
      Width = 1356
      Height = 130
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.Width = 2
      AfterPrint = QRBand3AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        275.166666666666700000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel7: TQRLabel
        Left = 0
        Top = 38
        Width = 78
        Height = 19
        Size.Values = (
          40.216666666666670000
          0.000000000000000000
          80.433333333333330000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Company Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel12: TQRLabel
        Left = 102
        Top = 56
        Width = 31
        Height = 14
        Size.Values = (
          29.633333333333330000
          215.900000000000000000
          118.533333333333300000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Actual'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel15: TQRLabel
        Left = 98
        Top = 38
        Width = 35
        Height = 14
        Size.Values = (
          29.633333333333330000
          207.433333333333300000
          80.433333333333330000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Budget'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object QRLabel18: TQRLabel
        Left = 72
        Top = 75
        Width = 61
        Height = 14
        Size.Values = (
          29.633333333333330000
          152.400000000000000000
          158.750000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Difference %'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO1: TQRLabel
        Left = 140
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO1: TQRLabel
        Left = 140
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff1: TQRLabel
        Left = 140
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf1: TQRLabel
        Left = 183
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf1: TQRLabel
        Left = 183
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff1: TQRLabel
        Left = 183
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO2: TQRLabel
        Left = 234
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO2: TQRLabel
        Left = 234
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff2: TQRLabel
        Left = 234
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf2: TQRLabel
        Left = 276
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          584.200000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf2: TQRLabel
        Left = 276
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          584.200000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff2: TQRLabel
        Left = 276
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          584.200000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO3: TQRLabel
        Left = 328
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO3: TQRLabel
        Left = 328
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff3: TQRLabel
        Left = 328
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf3: TQRLabel
        Left = 370
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf3: TQRLabel
        Left = 370
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff3: TQRLabel
        Left = 370
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO4: TQRLabel
        Left = 420
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO4: TQRLabel
        Left = 420
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff4: TQRLabel
        Left = 420
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf4: TQRLabel
        Left = 463
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf4: TQRLabel
        Left = 463
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff4: TQRLabel
        Left = 463
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO5: TQRLabel
        Left = 515
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf5: TQRLabel
        Left = 558
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf5: TQRLabel
        Left = 558
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO5: TQRLabel
        Left = 515
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff5: TQRLabel
        Left = 515
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff5: TQRLabel
        Left = 558
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO6: TQRLabel
        Left = 609
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf6: TQRLabel
        Left = 651
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO6: TQRLabel
        Left = 609
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf6: TQRLabel
        Left = 651
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff6: TQRLabel
        Left = 609
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff6: TQRLabel
        Left = 651
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO7: TQRLabel
        Left = 702
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf7: TQRLabel
        Left = 744
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf7: TQRLabel
        Left = 744
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO7: TQRLabel
        Left = 702
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff7: TQRLabel
        Left = 702
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff7: TQRLabel
        Left = 744
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO8: TQRLabel
        Left = 797
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf8: TQRLabel
        Left = 839
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf8: TQRLabel
        Left = 839
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO8: TQRLabel
        Left = 797
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff8: TQRLabel
        Left = 797
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff8: TQRLabel
        Left = 839
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO9: TQRLabel
        Left = 891
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO9: TQRLabel
        Left = 891
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff9: TQRLabel
        Left = 891
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf9: TQRLabel
        Left = 934
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf9: TQRLabel
        Left = 934
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff9: TQRLabel
        Left = 934
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO10: TQRLabel
        Left = 985
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf10: TQRLabel
        Left = 1028
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf10: TQRLabel
        Left = 1028
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO10: TQRLabel
        Left = 985
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff10: TQRLabel
        Left = 985
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff10: TQRLabel
        Left = 1028
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO11: TQRLabel
        Left = 1078
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf11: TQRLabel
        Left = 1120
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf11: TQRLabel
        Left = 1120
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO11: TQRLabel
        Left = 1078
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff11: TQRLabel
        Left = 1078
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff11: TQRLabel
        Left = 1120
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO12: TQRLabel
        Left = 1169
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf12: TQRLabel
        Left = 1212
        Top = 56
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          118.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf12: TQRLabel
        Left = 1212
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO12: TQRLabel
        Left = 1169
        Top = 38
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          80.433333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff12: TQRLabel
        Left = 1169
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff12: TQRLabel
        Left = 1212
        Top = 76
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          160.866666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalTO: TQRLabel
        Left = 1257
        Top = 56
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          118.533333333333300000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalTO: TQRLabel
        Left = 1257
        Top = 36
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          76.200000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalTODiff: TQRLabel
        Left = 1257
        Top = 76
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          160.866666666666700000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblBudTotalProf: TQRLabel
        Left = 1305
        Top = 36
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          76.200000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblActTotalProf: TQRLabel
        Left = 1305
        Top = 56
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          118.533333333333300000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
      object qrlblTotalProfDiff: TQRLabel
        Left = 1305
        Top = 76
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          160.866666666666700000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 6
      end
    end
  end
  object qryRevenueLocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT DISTINCT Invoice_Location.Invoice_Location, Invoice_Locat' +
        'ion.Invoice_Location_Descr'
      'FROM Invoice_Location'
      '  RIGHT JOIN (Sales_Invoice'
      '  INNER JOIN Sales_Profit ON'
      '    Sales_Invoice.Sales_Invoice = Sales_Profit.Sales_Invoice) ON'
      
        '    Invoice_Location.Invoice_Location = Sales_Invoice.Invoice_Lo' +
        'cation'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '  (Sales_Profit.Sales_Invoice = sales_invoice.sales_invoice) AND'
      
        '((Sales_Invoice.Invoice_Location = :Invoice_Location) or (:Invoi' +
        'ce_Location = 0))'
      'ORDER BY Invoice_Location.Invoice_Location_Descr'
      '')
    Left = 44
    Top = 15
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Invoice_Location'
      end
      item
        Name = 'Invoice_Location'
      end>
  end
  object qryCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'order by Description')
    Left = 83
    Top = 38
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        (select Invoice_Location'
      '         from Sales_Invoice'
      
        '         where Sales_invoice.Sales_invoice = Sales_Profit.Sales_' +
        'Invoice) as Invoice_Location,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Category'
      '      LEFT JOIN Sales_Profit ON'
      '        Category.Category = Sales_Profit.Category'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.category = :Category AND'
      '(select Invoice_Location'
      ' from Sales_Invoice'
      
        ' where Sales_invoice.Sales_invoice = Sales_Profit.Sales_Invoice)' +
        ' = :Location'
      'GROUP BY Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      '')
    Left = 235
    Top = 38
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Location'
      end>
  end
  object qryPeriods: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Period'
      'where Period >= :Start_Period and'
      'Period <= :Finish_Period'
      'order by Period')
    Left = 160
    Top = 40
    ParamData = <
      item
        Name = 'Start_Period'
      end
      item
        Name = 'Finish_Period'
      end>
  end
  object qryDummyNull: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        (select Invoice_Location'
      '         from Sales_Invoice'
      
        '         where Sales_invoice.Sales_invoice = Sales_Profit.Sales_' +
        'Invoice) as Invoice_Location,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Category'
      '      LEFT JOIN Sales_Profit ON'
      '        Category.Category = Sales_Profit.Category'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.category = :Category AND'
      '(select Invoice_Location'
      ' from Sales_Invoice'
      
        ' where Sales_invoice.Sales_invoice = Sales_Profit.Sales_Invoice)' +
        ' is NULL'
      'GROUP BY Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      '')
    Left = 163
    Top = 318
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Category'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        (select Invoice_Location'
      '         from Sales_Invoice'
      
        '         where Sales_invoice.Sales_invoice = Sales_Profit.Sales_' +
        'Invoice) as Invoice_Location,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Category'
      '      LEFT JOIN Sales_Profit ON'
      '        Category.Category = Sales_Profit.Category'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.category = :Category AND'
      '(select Invoice_Location'
      ' from Sales_Invoice'
      
        ' where Sales_invoice.Sales_invoice = Sales_Profit.Sales_Invoice)' +
        ' = :Location'
      'GROUP BY Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      '')
    Left = 163
    Top = 374
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Location'
      end>
  end
  object qrySalesProfit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Profit.category,'
      '                Invoice_Location.Invoice_Location,'
      '                Invoice_Location.Invoice_Location_Descr'
      'FROM Invoice_Location'
      '  RIGHT JOIN (Sales_Invoice'
      '  INNER JOIN Sales_Profit ON'
      '    Sales_Invoice.Sales_Invoice = Sales_Profit.Sales_Invoice) ON'
      
        '    Invoice_Location.Invoice_Location = Sales_Invoice.Invoice_Lo' +
        'cation'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '  (Sales_Profit.Sales_Invoice = sales_invoice.sales_invoice) AND'
      
        '((Sales_Invoice.Invoice_Location = :Invoice_Location) or (:Invoi' +
        'ce_Location = 0))'
      'ORDER BY Invoice_Location.Invoice_Location_Descr'
      ''
      ''
      '')
    Left = 427
    Top = 38
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Invoice_Location'
      end
      item
        Name = 'Invoice_Location'
      end>
  end
  object qrytmpConsolidate: TFDQuery
    SQL.Strings = (
      
        'Select DISTINCT 0 as Invoice_Location, '#39'All Revenue Centres'#39' as ' +
        'Invoice_Location_Descr'
      'from Sales_Profit'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish)')
    Left = 624
    Top = 16
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end>
  end
  object qrytmpRevCentres: TFDQuery
    SQL.Strings = (
      
        'SELECT DISTINCT Invoice_Location.Invoice_Location, Invoice_Locat' +
        'ion.Invoice_Location_Descr'
      'FROM Invoice_Location'
      '  RIGHT JOIN (Sales_Invoice'
      '  INNER JOIN Sales_Profit ON'
      '    Sales_Invoice.Sales_Invoice = Sales_Profit.Sales_Invoice) ON'
      
        '    Invoice_Location.Invoice_Location = Sales_Invoice.Invoice_Lo' +
        'cation'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '  (Sales_Profit.Sales_Invoice = sales_invoice.sales_invoice) AND'
      
        '((Sales_Invoice.Invoice_Location = :Invoice_Location) or (:Invoi' +
        'ce_Location = 0))'
      'ORDER BY Invoice_Location.Invoice_Location_Descr')
    Left = 627
    Top = 86
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Invoice_Location'
      end
      item
        Name = 'Invoice_Location'
      end>
  end
  object qryDummyConsolidate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        0 as Invoice_Location,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Category'
      '      LEFT JOIN Sales_Profit ON'
      '        Category.Category = Sales_Profit.Category'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.category = :Category'
      'GROUP BY Category.Category,'
      '        Category.Description,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      '')
    Left = 163
    Top = 438
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Category'
      end>
  end
  object qryDummyCustomer: TFDQuery
    SQL.Strings = (
      
        'select distinct Sales_profit.customer as Category, Customer.Name' +
        ' as Description'
      'from Sales_Profit, customer'
      'where Sales_Profit.Period >= :start and'
      'Sales_Profit.period <= :finish and'
      'Sales_profit.customer = customer.customer'
      'order by customer.name')
    Left = 768
    Top = 16
    ParamData = <
      item
        Name = 'start'
      end
      item
        Name = 'finish'
      end>
  end
  object qryDummyCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'order by Description')
    Left = 891
    Top = 14
  end
  object qrySalesProfitCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Profit.category,'
      '                Invoice_Location.Invoice_Location,'
      '                Invoice_Location.Invoice_Location_Descr'
      'FROM Invoice_Location'
      '  RIGHT JOIN (Sales_Invoice'
      '  INNER JOIN Sales_Profit ON'
      '    Sales_Invoice.Sales_Invoice = Sales_Profit.Sales_Invoice) ON'
      
        '    Invoice_Location.Invoice_Location = Sales_Invoice.Invoice_Lo' +
        'cation'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '  (Sales_Profit.Sales_Invoice = sales_invoice.sales_invoice) AND'
      
        '((Sales_Invoice.Invoice_Location = :Invoice_Location) or (:Invoi' +
        'ce_Location = 0))'
      'ORDER BY Invoice_Location.Invoice_Location_Descr'
      ''
      ''
      '')
    Left = 771
    Top = 86
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Invoice_Location'
      end
      item
        Name = 'Invoice_Location'
      end>
  end
  object qrySalesProfitCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Profit.customer,'
      '                Invoice_Location.Invoice_Location,'
      '                Invoice_Location.Invoice_Location_Descr'
      'FROM Invoice_Location'
      '  RIGHT JOIN (Sales_Invoice'
      '  INNER JOIN Sales_Profit ON'
      '    Sales_Invoice.Sales_Invoice = Sales_Profit.Sales_Invoice) ON'
      
        '    Invoice_Location.Invoice_Location = Sales_Invoice.Invoice_Lo' +
        'cation'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '  (Sales_Profit.Sales_Invoice = sales_invoice.sales_invoice) AND'
      
        '((Sales_Invoice.Invoice_Location = :Invoice_Location) or (:Invoi' +
        'ce_Location = 0))'
      'ORDER BY Invoice_Location.Invoice_Location_Descr'
      ''
      ''
      '')
    Left = 771
    Top = 150
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Invoice_Location'
      end
      item
        Name = 'Invoice_Location'
      end>
  end
  object qryDummyNullCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        (select Invoice_Location'
      '         from Sales_Invoice'
      
        '         where Sales_invoice.Sales_invoice = Sales_Profit.Sales_' +
        'Invoice) as Invoice_Location,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Customer'
      '      LEFT JOIN Sales_Profit ON'
      '        Customer.Customer = Sales_Profit.Customer'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.Customer = :Category AND'
      '(select Invoice_Location'
      ' from Sales_Invoice'
      
        ' where Sales_invoice.Sales_invoice = Sales_Profit.Sales_Invoice)' +
        ' is NULL'
      'GROUP BY Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      '')
    Left = 331
    Top = 318
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Category'
      end>
  end
  object qryDummyCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        (select Invoice_Location'
      '         from Sales_Invoice'
      
        '         where Sales_invoice.Sales_invoice = Sales_Profit.Sales_' +
        'Invoice) as Invoice_Location,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Customer'
      '      LEFT JOIN Sales_Profit ON'
      '        Customer.Customer = Sales_Profit.Customer'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.Customer = :Category AND'
      '(select Invoice_Location'
      ' from Sales_Invoice'
      
        ' where Sales_invoice.Sales_invoice = Sales_Profit.Sales_Invoice)' +
        ' = :Location'
      'GROUP BY Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      '')
    Left = 331
    Top = 374
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Location'
      end>
  end
  object qryDummyConsolidateCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        0 as Invoice_Location,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Customer'
      '      LEFT JOIN Sales_Profit ON'
      '        Customer.Customer = Sales_Profit.Customer'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.Customer = :Category'
      'GROUP BY Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      '')
    Left = 331
    Top = 438
    ParamData = <
      item
        Name = 'Start'
      end
      item
        Name = 'Finish'
      end
      item
        Name = 'Category'
      end>
  end
  object qryCustRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Rep.Name as Rep_Name'
      'from Reps_Branches, Rep'
      'where Reps_Branches.Customer = :Customer and'
      'Reps_Branches.rep = Rep.Rep'
      'order by Branch_no')
    Left = 891
    Top = 86
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryRevLocBudgets: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Invoice_Location_Budget'
      'where Invoice_Location = :Invoice_Location and'
      'Period >= :Start_Period and'
      'Period <= :Finish_Period')
    Left = 163
    Top = 94
    ParamData = <
      item
        Name = 'Invoice_Location'
      end
      item
        Name = 'Start_Period'
      end
      item
        Name = 'Finish_Period'
      end>
  end
end
