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
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object quickreport: TQuickRep
    Left = 8
    Top = 8
    Width = 1123
    Height = 794
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
      Left = 19
      Top = 38
      Width = 1085
      Height = 115
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.270833333333300000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 372
        Top = 8
        Width = 341
        Height = 23
        Size.Values = (
          60.854166666666670000
          984.250000000000000000
          21.166666666666670000
          902.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Revenue Centre Performance Report'
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
        Left = 506
        Top = 32
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          84.666666666666670000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Period From'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 16
        Top = 64
        Width = 137
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          169.333333333333300000
          362.479166666666700000)
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
        FontSize = 10
      end
      object qrlblMonth1: TQRLabel
        Left = 134
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          354.541666666666700000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 115
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          304.270833333333300000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 158
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          418.041666666666700000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1033
        Top = 88
        Width = 38
        Height = 11
        Size.Values = (
          29.104166666666670000
          2733.145833333333000000
          232.833333333333300000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Total YTD'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 100
        Width = 36
        Height = 12
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
        Font.Height = -8
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
        Left = 1060
        Top = 100
        Width = 22
        Height = 12
        Size.Values = (
          31.750000000000000000
          2804.583333333333000000
          264.583333333333300000
          58.208333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 209
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          552.979166666666700000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 190
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          502.708333333333300000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 233
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          616.479166666666700000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 284
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          751.416666666666700000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 265
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          701.145833333333300000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 308
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          814.916666666666700000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 359
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          949.854166666666700000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 340
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          899.583333333333300000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 383
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          1013.354166666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 434
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1148.291666666667000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 415
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1098.020833333333000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 458
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          1211.791666666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 509
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1346.729166666667000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 490
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1296.458333333333000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 533
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          1410.229166666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 584
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1545.166666666667000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 565
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1494.895833333333000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 608
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          1608.666666666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 659
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1743.604166666667000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 640
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1693.333333333333000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 683
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          1807.104166666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 734
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1942.041666666667000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 715
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          1891.770833333333000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 758
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          2005.541666666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 809
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          2140.479166666667000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 790
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          2090.208333333333000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 833
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          2203.979166666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 884
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          2338.916666666667000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 865
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          2288.645833333333000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 908
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          2402.416666666667000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 958
        Top = 87
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          2534.708333333333000000
          230.187500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sept - 04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 939
        Top = 100
        Width = 31
        Height = 11
        Size.Values = (
          29.104166666666670000
          2484.437500000000000000
          264.583333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Turnover'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 982
        Top = 100
        Width = 19
        Height = 11
        Size.Values = (
          29.104166666666670000
          2598.208333333333000000
          264.583333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1024
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2709.333333333333000000
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
      object QRSysData2: TQRSysData
        Left = 1011
        Top = 28
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2674.937500000000000000
          74.083333333333330000
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
    end
    object qrgReps: TQRGroup
      Left = 19
      Top = 157
      Width = 1085
      Height = 4
      AlignToBottom = False
      BeforePrint = qrgRepsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        10.583333333333330000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryRevenueLocs.Invoice_Location_Descr'
      FooterBand = qrbGrpRepFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
    end
    object QRSubDetail1: TQRSubDetail
      Left = 19
      Top = 161
      Width = 1085
      Height = 32
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = quickreport
      DataSet = qryCategory
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText5: TQRDBText
        Left = 544
        Top = 8
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          1439.333333333333000000
          21.166666666666670000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryCategory
        DataField = 'Category'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 440
        Top = 8
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          21.166666666666670000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryRevenueLocs
        DataField = 'Invoice_Location'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 8
        Width = 179
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          21.166666666666670000
          473.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Category Header band'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 153
      Width = 1085
      Height = 4
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      LinkBand = QRSubDetail1
      Size.Values = (
        10.583333333333330000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object qrsubPeriods: TQRSubDetail
      Left = 19
      Top = 193
      Width = 1085
      Height = 24
      AlignToBottom = False
      BeforePrint = qrsubPeriodsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = qryReport
      FooterBand = qrbGrpCatFooter
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel2: TQRLabel
        Left = 48
        Top = 0
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          0.000000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period sales details'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrbGrpCatFooter: TQRBand
      Left = 19
      Top = 217
      Width = 1085
      Height = 17
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
        44.979166666666670000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText7: TQRDBText
        Left = 8
        Top = 0
        Width = 89
        Height = 11
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
        Font.Height = -8
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
        Left = 117
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 151
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          399.520833333333300000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 192
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          508.000000000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 226
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          597.958333333333300000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 267
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          706.437500000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 301
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          796.395833333333300000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 341
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          902.229166666666700000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 375
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          992.187500000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 417
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 451
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1193.270833333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 492
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1301.750000000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 526
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1391.708333333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 600
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 566
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1497.541666666667000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 642
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 676
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1788.583333333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 718
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1899.708333333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 752
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1989.666666666667000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 793
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2098.145833333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 827
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2188.104166666667000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 867
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2293.937500000000000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 901
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2383.895833333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 940
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2487.083333333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 974
        Top = 1
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2577.041666666667000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 1
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2677.583333333333000000
          2.645833333333333000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1050
        Top = 1
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2778.125000000000000000
          2.645833333333333000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
      Left = 19
      Top = 234
      Width = 1085
      Height = 79
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
        209.020833333333300000
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel8: TQRLabel
        Left = 85
        Top = 21
        Width = 22
        Height = 11
        Size.Values = (
          29.104166666666670000
          224.895833333333300000
          55.562500000000000000
          58.208333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Actual'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 82
        Top = 6
        Width = 25
        Height = 11
        Size.Values = (
          29.104166666666670000
          216.958333333333300000
          15.875000000000000000
          66.145833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Budget'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 58
        Top = 36
        Width = 45
        Height = 11
        Size.Values = (
          29.104166666666670000
          153.458333333333300000
          95.250000000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Difference %'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 8
        Top = 6
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          15.875000000000000000
          58.208333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 117
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 117
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 151
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          399.520833333333300000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 151
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          399.520833333333300000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 192
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          508.000000000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 192
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          508.000000000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 226
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          597.958333333333300000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 226
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          597.958333333333300000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 267
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          706.437500000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 267
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          706.437500000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 301
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          796.395833333333300000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 301
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          796.395833333333300000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 341
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          902.229166666666700000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 341
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          902.229166666666700000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 375
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          992.187500000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 375
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          992.187500000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 417
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 417
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 451
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1193.270833333333000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 451
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1193.270833333333000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 492
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1301.750000000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 492
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1301.750000000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 526
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1391.708333333333000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 526
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1391.708333333333000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 566
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1497.541666666667000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 566
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1497.541666666667000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 600
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 600
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 642
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 642
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 676
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1788.583333333333000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 676
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1788.583333333333000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 718
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1899.708333333333000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 718
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1899.708333333333000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 752
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1989.666666666667000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 752
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1989.666666666667000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 793
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2098.145833333333000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 793
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2098.145833333333000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 827
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2188.104166666667000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 827
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2188.104166666667000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 867
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2293.937500000000000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 867
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2293.937500000000000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 901
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2383.895833333333000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 901
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2383.895833333333000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 940
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2487.083333333333000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 940
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2487.083333333333000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 974
        Top = 21
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2577.041666666667000000
          55.562500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 974
        Top = 6
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2577.041666666667000000
          15.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 21
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2677.583333333333000000
          55.562500000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 6
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2677.583333333333000000
          15.875000000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1050
        Top = 21
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2778.125000000000000000
          55.562500000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1050
        Top = 6
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2778.125000000000000000
          15.875000000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 117
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 151
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          399.520833333333300000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 192
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          508.000000000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 226
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          597.958333333333300000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 267
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          706.437500000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 301
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          796.395833333333300000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 341
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          902.229166666666700000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 375
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          992.187500000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 417
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 451
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1193.270833333333000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 492
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1301.750000000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 526
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1391.708333333333000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 566
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1497.541666666667000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 600
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 642
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 676
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1788.583333333333000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 718
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1899.708333333333000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 752
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1989.666666666667000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 793
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2098.145833333333000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 827
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2188.104166666667000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 867
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2293.937500000000000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 901
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2383.895833333333000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 940
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2487.083333333333000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 974
        Top = 37
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2577.041666666667000000
          97.895833333333330000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 37
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2677.583333333333000000
          97.895833333333330000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1050
        Top = 37
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2778.125000000000000000
          97.895833333333330000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 106
        Top = 50
        Width = 979
        Height = 9
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
      Left = 19
      Top = 313
      Width = 1085
      Height = 104
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
        2870.729166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel7: TQRLabel
        Left = 0
        Top = 30
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          79.375000000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Company Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 85
        Top = 45
        Width = 22
        Height = 11
        Size.Values = (
          29.104166666666670000
          224.895833333333300000
          119.062500000000000000
          58.208333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Actual'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 82
        Top = 30
        Width = 25
        Height = 11
        Size.Values = (
          29.104166666666670000
          216.958333333333300000
          79.375000000000000000
          66.145833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Budget'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 58
        Top = 60
        Width = 45
        Height = 11
        Size.Values = (
          29.104166666666670000
          153.458333333333300000
          158.750000000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Difference %'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 117
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 117
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 117
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          309.562500000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 151
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          399.520833333333300000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 151
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          399.520833333333300000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 151
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          399.520833333333300000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 192
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          508.000000000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 192
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          508.000000000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 192
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          508.000000000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 226
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          597.958333333333300000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 226
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          597.958333333333300000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 226
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          597.958333333333300000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 267
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          706.437500000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 267
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          706.437500000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 267
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          706.437500000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 301
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          796.395833333333300000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 301
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          796.395833333333300000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 301
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          796.395833333333300000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 341
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          902.229166666666700000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 341
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          902.229166666666700000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 341
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          902.229166666666700000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 375
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          992.187500000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 375
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          992.187500000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 375
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          992.187500000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 417
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 451
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1193.270833333333000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 451
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1193.270833333333000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 417
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 417
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1103.312500000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 451
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1193.270833333333000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 492
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1301.750000000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 526
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1391.708333333333000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 492
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1301.750000000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 526
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1391.708333333333000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 492
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1301.750000000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 526
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1391.708333333333000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 566
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1497.541666666667000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 600
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 600
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 566
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1497.541666666667000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 566
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1497.541666666667000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 600
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1587.500000000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 642
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 676
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1788.583333333333000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 676
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1788.583333333333000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 642
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 642
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 676
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1788.583333333333000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 718
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1899.708333333333000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 718
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1899.708333333333000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 718
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1899.708333333333000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 752
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1989.666666666667000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 752
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1989.666666666667000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 752
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          1989.666666666667000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 793
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2098.145833333333000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 827
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2188.104166666667000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 827
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2188.104166666667000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 793
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2098.145833333333000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 793
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2098.145833333333000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 827
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2188.104166666667000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 867
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2293.937500000000000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 901
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2383.895833333333000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 901
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2383.895833333333000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 867
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2293.937500000000000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 867
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2293.937500000000000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 901
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2383.895833333333000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 940
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2487.083333333333000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 974
        Top = 45
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2577.041666666667000000
          119.062500000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 974
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2577.041666666667000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 940
        Top = 30
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2487.083333333333000000
          79.375000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 940
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2487.083333333333000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 974
        Top = 61
        Width = 27
        Height = 11
        Size.Values = (
          29.104166666666670000
          2577.041666666667000000
          161.395833333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 45
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2677.583333333333000000
          119.062500000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 29
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2677.583333333333000000
          76.729166666666670000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1012
        Top = 61
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2677.583333333333000000
          161.395833333333300000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1050
        Top = 29
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2778.125000000000000000
          76.729166666666670000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1050
        Top = 45
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2778.125000000000000000
          119.062500000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
        Left = 1050
        Top = 61
        Width = 33
        Height = 11
        Size.Values = (
          29.104166666666670000
          2778.125000000000000000
          161.395833333333300000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '9,999,999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
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
