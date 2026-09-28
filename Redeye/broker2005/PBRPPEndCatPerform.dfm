object PBRPPEndCatPerformfrm: TPBRPPEndCatPerformfrm
  Left = 9
  Top = 104
  Caption = 'Product Category Performance Report'
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
    DataSet = qryCategories
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
        Left = 507
        Top = 10
        Width = 342
        Height = 29
        Size.Values = (
          61.383333333333330000
          1073.150000000000000000
          21.166666666666670000
          723.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Product Category Sales Report'
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
        Width = 160
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          169.333333333333300000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryCategories
        DataField = 'Category_Description'
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
        Left = 238
        Top = 125
        Width = 43
        Height = 14
        Size.Values = (
          29.633333333333330000
          503.766666666666700000
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
      Expression = 'qryCategories.Category_Description'
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
      DataSet = qrySortBy
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText5: TQRDBText
        Left = 680
        Top = 10
        Width = 97
        Height = 21
        Size.Values = (
          44.450000000000000000
          1439.333333333333000000
          21.166666666666670000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySortBy
        DataField = 'Sortby_Code'
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
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1164.166666666667000000
          21.166666666666670000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryCategories
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
      object QRLabel1: TQRLabel
        Left = 20
        Top = 10
        Width = 155
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          21.166666666666670000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sort by Header Band'
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
        Width = 121
        Height = 14
        Size.Values = (
          29.104166666666670000
          21.166666666666670000
          0.000000000000000000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySortBy
        DataField = 'Sortby_Description'
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
        Left = 277
        Top = 1
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          586.316666666666700000
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
      Height = 39
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
        82.550000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          12.700000000000000000
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
        Left = 277
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          586.316666666666700000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          12.700000000000000000
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
        Top = 6
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          12.700000000000000000
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
        Top = 6
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          12.700000000000000000
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
    object QRBand3: TQRBand
      Left = 24
      Top = 323
      Width = 1356
      Height = 50
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
        105.833333333333300000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel7: TQRLabel
        Left = 0
        Top = 18
        Width = 78
        Height = 19
        Size.Values = (
          40.216666666666670000
          0.000000000000000000
          38.100000000000000000
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
      object qrlblActTotalTO1: TQRLabel
        Left = 140
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          296.333333333333300000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          387.350000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          495.300000000000000000
          33.866666666666670000
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
        Left = 277
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          586.316666666666700000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          694.266666666666700000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          783.166666666666700000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          889.000000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          980.016666666666700000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1090.083333333333000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1181.100000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1289.050000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1377.950000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1485.900000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1574.800000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1686.983333333333000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1775.883333333333000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1885.950000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          1976.966666666667000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2084.916666666667000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2175.933333333333000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2281.766666666667000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2370.666666666667000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2474.383333333333000000
          33.866666666666670000
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
        Top = 16
        Width = 40
        Height = 14
        Size.Values = (
          29.633333333333330000
          2565.400000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2660.650000000000000000
          33.866666666666670000
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
        Top = 16
        Width = 49
        Height = 14
        Size.Values = (
          29.633333333333330000
          2762.250000000000000000
          33.866666666666670000
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
  object qryCategories: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT DISTINCT Category.Category, Category.Description as Categ' +
        'ory_Description'
      'FROM Category'
      '  INNER JOIN Sales_Profit ON'
      '    Category.Category = Sales_Profit.Category'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '((Sales_Profit.Category = :Category) or (:Category = 0))'
      'ORDER BY Category.Description'
      '')
    Left = 43
    Top = 14
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
        Name = 'Category'
      end>
  end
  object qrySortBy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Invoice_Location as Sortby_Code, Invoice_Location_Descr a' +
        's Sortby_Description'
      'from Invoice_Location'
      'order by Invoice_Location_Descr')
    Left = 83
    Top = 38
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '')
    Left = 235
    Top = 38
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
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Invoice_Location.Invoice_Location,'
      '        Invoice_Location.Invoice_Location_Descr,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Category,'
      '        Sales_Profit.Period,'
      '        Sum(Sales_Profit.Total_Cost_Value) AS Total_Cost,'
      '        Sum(Sales_Profit.Total_Sales_Value) AS Total_Sales'
      'FROM Invoice_Location'
      '      RIGHT JOIN (Sales_Invoice'
      '      INNER JOIN Sales_Profit ON'
      
        '        Sales_Invoice.Sales_Invoice = Sales_Profit.Sales_Invoice' +
        ') ON'
      
        '        Invoice_Location.Invoice_Location = Sales_Invoice.Invoic' +
        'e_Location'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Invoice_Location.Invoice_Location = :Sortby AND'
      'Sales_Profit.category = :Category'
      'GROUP BY  Invoice_Location.Invoice_Location,'
      '          Invoice_Location.Invoice_Location_Descr,'
      '          Sales_Profit.Sales_Invoice,'
      '          Sales_Profit.Category,'
      '          Sales_Profit.Period'
      'ORDER BY Sales_Profit.Period'
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
        Name = 'Sortby'
      end
      item
        Name = 'Category'
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
      
        'Select DISTINCT 0 as Category, '#39'All Categories'#39' as Category_Desc' +
        'ription'
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
  object qrytmpCategories: TFDQuery
    SQL.Strings = (
      
        'SELECT DISTINCT Category.Category, Category.Description as Categ' +
        'ory_Description'
      'FROM Category'
      '  INNER JOIN Sales_Profit ON'
      '    Category.Category = Sales_Profit.Category'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '((Sales_Profit.Category = :Category) or (:Category = 0))'
      'ORDER BY Category.Description'
      '')
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
        Name = 'Category'
      end
      item
        Name = 'Category'
      end>
  end
  object qryDummyConsolidate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Invoice_Location.Invoice_Location,'
      '        Invoice_Location.Invoice_Location_Descr,'
      '        Sales_Profit.Sales_Invoice,'
      '        0 AS Category,'
      '        Sales_Profit.Period,'
      '        Sum(Sales_Profit.Total_Cost_Value) AS Total_Cost,'
      '        Sum(Sales_Profit.Total_Sales_Value) AS Total_Sales'
      'FROM Invoice_Location'
      '      RIGHT JOIN (Sales_Invoice'
      '      INNER JOIN Sales_Profit ON'
      
        '        Sales_Invoice.Sales_Invoice = Sales_Profit.Sales_Invoice' +
        ') ON'
      
        '        Invoice_Location.Invoice_Location = Sales_Invoice.Invoic' +
        'e_Location'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Invoice_Location.Invoice_Location = :Sortby'
      'GROUP BY  Invoice_Location.Invoice_Location,'
      '          Invoice_Location.Invoice_Location_Descr,'
      '          Sales_Profit.Sales_Invoice,'
      '          Sales_Profit.Period'
      'ORDER BY Sales_Profit.Period'
      ''
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
        Name = 'Sortby'
      end>
  end
  object qryDummyCustomer: TFDQuery
    SQL.Strings = (
      
        'select distinct Sales_profit.customer as Sortby_Code, Customer.N' +
        'ame as Sortby_Description'
      'from Sales_Profit, customer'
      'where Sales_Profit.Period >= :start and'
      'Sales_Profit.period <= :finish and'
      '((Sales_Profit.Category = :Category) or (0 = :Category)) and'
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
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Category'
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
  object qrySalesProfitLoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Category.Category,'
      '                Category.Description,'
      '                Invoice_Location.Invoice_Location'
      'FROM Invoice_Location'
      '  RIGHT JOIN (Sales_Invoice'
      '  INNER JOIN (Category'
      '  INNER JOIN Sales_profit ON'
      '    Category.Category = Sales_profit.Category) ON'
      '    Sales_Invoice.Sales_Invoice = Sales_profit.Sales_Invoice) ON'
      
        '    Invoice_Location.Invoice_Location = Sales_Invoice.Invoice_Lo' +
        'cation'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '((Sales_Profit.Category = :Category) or (:Category = 0))'
      'ORDER BY Category.Description'
      ''
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
        Name = 'Category'
      end
      item
        Name = 'Category'
      end>
  end
  object qrySalesProfitCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Category.Category,'
      '                Category.Description,'
      '                Sales_profit.Customer'
      'FROM Category'
      '  INNER JOIN Sales_profit ON'
      '    Category.Category = Sales_profit.Category'
      
        'WHERE (Sales_Profit.Period >= :Start) And (Sales_Profit.Period <' +
        '= :Finish) AND'
      '((Sales_Profit.Category = :Category) or (:Category = 0))'
      'ORDER BY Category.Description'
      ''
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
        Name = 'Category'
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
      '        Sales_Profit.Category,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Customer'
      '      LEFT JOIN Sales_Profit ON'
      '        Customer.Customer = Sales_Profit.Customer'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.Category = :Category AND'
      'Sales_Profit.Customer = :Sortby'
      'GROUP BY Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        Sales_Profit.Category,'
      '        Sales_Profit.Period'
      'ORDER BY Sales_profit.Period'
      ''
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
        Name = 'Sortby'
      end>
  end
  object qryDummyConsolidateCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Name,'
      '        Sales_Profit.Sales_Invoice,'
      '        0 as Category,'
      '        Sales_Profit.Period,'
      '        sum(Sales_Profit.Total_Cost_Value) as Total_Cost,'
      '        sum(Sales_Profit.Total_Sales_Value) as Total_Sales'
      'FROM Customer'
      '      LEFT JOIN Sales_Profit ON'
      '        Customer.Customer = Sales_Profit.Customer'
      'WHERE'
      '(Sales_Profit.Period >= :Start AND'
      'Sales_Profit.Period <= :Finish) AND'
      'Sales_Profit.Customer = :Sortby'
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
        Name = 'Sortby'
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
end
