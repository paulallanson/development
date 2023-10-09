object STRPAgedStkFrm: TSTRPAgedStkFrm
  Left = 0
  Top = 109
  Caption = 'Aged Stock Report Print'
  ClientHeight = 567
  ClientWidth = 1211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  Scaled = False
  TextHeight = 13
  object qrAgedStk: TQuickRep
    Left = 0
    Top = 0
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrAgedStkBeforePrint
    DataSet = qryAgedStk
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
    object QRBand: TQRBand
      Left = 38
      Top = 38
      Width = 1078
      Height = 145
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        383.645833333333300000
        2852.208333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 406
        Top = 8
        Width = 266
        Height = 25
        Size.Values = (
          66.145833333333330000
          1074.208333333333000000
          21.166666666666670000
          703.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Slow Moving Stock Report - '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object qrlblDateSince: TQRLabel
        Left = 330
        Top = 34
        Width = 417
        Height = 17
        Size.Values = (
          44.979166666666670000
          873.125000000000000000
          89.958333333333330000
          1103.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 
          'Report showing products that have been stocked for more than x d' +
          'ays:- '
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
        FontSize = 10
      end
      object qrPart: TQRLabel
        Left = 8
        Top = 107
        Width = 44
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          283.104166666666700000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
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
      object QRShape1: TQRShape
        Left = 8
        Top = 137
        Width = 1062
        Height = 7
        Size.Values = (
          18.520833333333300000
          21.166666666666700000
          362.479166666667000000
          2809.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblDesc: TQRLabel
        Left = 8
        Top = 123
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          325.437500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
      object qrlblStock: TQRLabel
        Left = 746
        Top = 123
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          1973.791666666667000000
          325.437500000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'In Stock'
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
      object QRLabel3: TQRLabel
        Left = 880
        Top = 115
        Width = 36
        Height = 25
        Size.Values = (
          66.145833333333320000
          2328.333333333333000000
          304.270833333333300000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Box Count'
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
      object QRLabel5: TQRLabel
        Left = 923
        Top = 123
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          2442.104166666667000000
          325.437500000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Value'
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
      object QRLabel1: TQRLabel
        Left = 528
        Top = 123
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          325.437500000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Store/Bin'
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
      object QRLabel2: TQRLabel
        Left = 800
        Top = 123
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          2116.666666666667000000
          325.437500000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Size'
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
      object QRLabel6: TQRLabel
        Left = 671
        Top = 123
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          1775.354166666667000000
          325.437500000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Ref'
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
      object QRLabel7: TQRLabel
        Left = 330
        Top = 123
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          873.125000000000000000
          325.437500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Recv'#39'd'
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
        Left = 475
        Top = 107
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          1256.770833333333000000
          283.104166666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Days in'
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
      object QRLabel10: TQRLabel
        Left = 479
        Top = 123
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          1267.354166666667000000
          325.437500000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock'
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
        Left = 406
        Top = 123
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          1074.208333333333000000
          325.437500000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Date'
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
      object QRLabel12: TQRLabel
        Left = 424
        Top = 107
        Width = 25
        Height = 15
        Size.Values = (
          39.687500000000000000
          1121.833333333333000000
          283.104166666666700000
          66.145833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Last'
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
      object QRLblCust: TQRLabel
        Left = 491
        Top = 78
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          206.375000000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'From Customer '
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
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 184
        Top = 107
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          486.833333333333300000
          283.104166666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/'
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
      object QRLabel15: TQRLabel
        Left = 200
        Top = 123
        Width = 22
        Height = 15
        Size.Values = (
          39.687500000000000000
          529.166666666666700000
          325.437500000000000000
          58.208333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
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
        Left = 1046
        Top = 123
        Width = 22
        Height = 17
        Size.Values = (
          44.979166666666670000
          2767.541666666667000000
          325.437500000000000000
          58.208333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Use'
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
        Left = 1037
        Top = 107
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          2743.729166666667000000
          283.104166666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Not in'
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
      object qrlblRange: TQRLabel
        Left = 493
        Top = 56
        Width = 92
        Height = 17
        Size.Values = (
          44.979166666666670000
          1304.395833333333000000
          148.166666666666700000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'From Product - '
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
        FontSize = 10
      end
      object DateQRLabel: TQRLabel
        Left = 1046
        Top = 32
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          2767.541666666667000000
          84.666666666666670000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Date'
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
        Left = 984
        Top = 10
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          2603.500000000000000000
          26.458333333333330000
          224.895833333333300000)
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
        Text = 'Page No.:'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 1004
        Top = 123
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          2656.416666666667000000
          325.437500000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Paid'
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
    object qrbndDetail: TQRBand
      Left = 38
      Top = 183
      Width = 1078
      Height = 38
      AfterPrint = qrbndDetailAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        100.541666666666700000
        2852.208333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText7: TQRDBText
        Left = 951
        Top = 0
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          2516.187500000000000000
          0.000000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'Invoice_upfront'
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
      object QRDBText1: TQRDBText
        Left = 8
        Top = 0
        Width = 165
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          0.000000000000000000
          436.562499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'Part'
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
        Left = 8
        Top = 16
        Width = 165
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          42.333333333333340000
          436.562499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'Description'
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
        Left = 750
        Top = 0
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          1984.375000000000000000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'Quantity'
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
        Left = 528
        Top = 16
        Width = 16
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          42.333333333333330000
          42.333333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'Bin'
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
      object qrlblBoxCountVal: TQRLabel
        Left = 864
        Top = 0
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          2286.000000000000000000
          0.000000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Box Count'
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
      object QRDBText8: TQRDBText
        Left = 528
        Top = 0
        Width = 137
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          0.000000000000000000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'Part_Store_Name'
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
      object QRDBText3: TQRDBText
        Left = 670
        Top = 0
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1772.708333333333000000
          0.000000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'Stock_Ref'
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
      object QRDBText9: TQRDBText
        Left = 324
        Top = 0
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          857.250000000000000000
          0.000000000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'date_received'
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
      object qrlblDays: TQRLabel
        Left = 468
        Top = 0
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          1238.250000000000000000
          0.000000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDays'
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
      object QRLblPckSz: TQRLabel
        Left = 800
        Top = 0
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          2116.666666666667000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblPckSz'
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
      object QRLblVal: TQRLabel
        Left = 944
        Top = 0
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          2497.666666666667000000
          0.000000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblVal'
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
      object qrlblLastSalesDate: TQRLabel
        Left = 416
        Top = 0
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          1100.666666666667000000
          0.000000000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblLastSalesDate'
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
      object QRDBText5: TQRDBText
        Left = 176
        Top = 0
        Width = 150
        Height = 15
        Size.Values = (
          39.687500000000000000
          465.666666666666700000
          0.000000000000000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryAgedStk
        DataField = 'CustName'
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
      object QRLblInUse: TQRLabel
        Left = 1050
        Top = 0
        Width = 15
        Height = 17
        Size.Values = (
          44.979166666666670000
          2778.125000000000000000
          0.000000000000000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' *'
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
        FontSize = 10
      end
      object QRMemoRepName: TQRMemo
        Left = 176
        Top = 16
        Width = 150
        Height = 15
        Size.Values = (
          39.687500000000000000
          465.666666666666700000
          42.333333333333340000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrlblLastJobUsedDate: TQRLabel
        Left = 416
        Top = 16
        Width = 45
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          1100.666666666667000000
          42.333333333333330000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblLastJobUsedDate'
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
    object QRBand2: TQRBand
      Left = 38
      Top = 221
      Width = 1078
      Height = 32
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2852.208333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel9: TQRLabel
        Left = 818
        Top = 8
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          2164.291666666667000000
          21.166666666666670000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Stock Value'
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
      object qrlblTotalStkVal: TQRLabel
        Left = 923
        Top = 8
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          2442.104166666667000000
          21.166666666666670000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Stock Value'
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
      object QRShape2: TQRShape
        Left = 803
        Top = 4
        Width = 185
        Height = 1
        Size.Values = (
          2.645833333333333000
          2124.604166666667000000
          10.583333333333330000
          489.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryAgedStk: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select    store_stock.part as Part,'
      '          part.part_description as Description,'
      '          part.part_Cost_Cat as Sales_Value,'
      '          part.Sell_Pack_Quantity as Sell_Pack_Size,'
      '          part_store.part_store_name as Part_Store_Name,'
      '          Part.Not_In_Use,'
      '          Part.Customer,'
      '          Customer.name as CustName,'
      '          Rep.Name as Rep_Name,'
      '          store_stock.part_bin as Bin,'
      '          store_Stock.Part_Store_Lot as Lot,'
      '          store_stock.Store_stock_description as Stock_Ref,'
      '          store_stock.store_quantity as Quantity,'
      '          store_Stock.Stock_Pack_Quantity as Pack_Size,'
      '          (store_stock.store_Cost) as Stock_Value,'
      '          Store_Stock.Part_Store,'
      '          store_stock.date_received,'
      '          store_stock.invoice_upfront,'
      '          (select top 1 Form_Reference.Form_Reference_ID'
      '           from Form_Reference'
      
        '           where Form_Reference.Stock_Reference = Part.Part) as ' +
        'Form_Reference_ID'
      
        'FROM ((Customer RIGHT JOIN ((part INNER JOIN (store_stock INNER ' +
        'JOIN'
      
        '    part_store ON store_stock.Part_Store = part_store.Part_Store' +
        ')'
      '    ON part.Part = store_stock.Part)'
      
        '    LEFT JOIN Customer_Branch ON (part.Branch_no = Customer_Bran' +
        'ch.Branch_no)'
      '    AND (part.Customer = Customer_Branch.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer)'
      
        '    LEFT JOIN Reps_Branches ON (Customer_Branch.Branch_no = Reps' +
        '_Branches.Branch_no)'
      '    AND (Customer_Branch.Customer = Reps_Branches.Customer))'
      '    LEFT JOIN Rep ON Reps_Branches.Rep = Rep.Rep'
      
        'where     (((:theDate - store_stock.date_received) > :noOfDays) ' +
        'and'
      
        '      (Store_Stock.Part >= :PartFrom) and (Store_Stock.Part <= :' +
        'PartTo)) and'
      
        '        ((part.not_in_use <> :Not_in_Use) or (:Not_In_use = '#39#39'))' +
        ' and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) and'
      
        '          ((Store_Stock.Part_Store = :Part_store) or (:Part_Stor' +
        'e = 0)) and'
      
        '          ((Store_Stock.Part_Bin >= :Bin_From) and (Store_Stock.' +
        'Part_Bin <= :Bin_To)) and'
      '          ((:Rep = 0) or (Rep.Rep = :Rep))'
      'order by  store_stock.part'
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 312
    Top = 8
    ParamData = <
      item
        Name = 'theDate'
        DataType = ftDateTime
      end
      item
        Name = 'noOfDays'
        DataType = ftInteger
      end
      item
        Name = 'PartFrom'
        DataType = ftString
      end
      item
        Name = 'PartTo'
        DataType = ftString
      end
      item
        Name = 'Not_in_Use'
        DataType = ftString
      end
      item
        Name = 'Not_In_use'
        DataType = ftString
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'CustBranch'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Part_store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Bin_From'
      end
      item
        Name = 'Bin_To'
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
  object GetSalesDtQry: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 date_received as Sales_Dt'
      'from part_movement'
      'where (Part_Movement.Part = :Part) and'
      '  (Part_movement.Part_Movement_Bin = :Bin) and'
      '  (Part_movement.Part_Store_Lot = :Lot) and'
      '  (Part_Movement.Part_Movement_Store = :Store) and'
      '  (Part_Movement.Part_Movement_Type = :Part_Movement_Type)'
      'Order by Date_received desc'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 126
    Top = 38
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Bin'
        DataType = ftString
      end
      item
        Name = 'Lot'
        DataType = ftString
      end
      item
        Name = 'Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Movement_Type'
      end>
  end
  object Query1: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select    store_stock.part as Part,'
      '          part.part_description as Description,'
      '          part.part_Cost_Cat as Sales_Value,'
      '          part.Sell_Pack_Quantity as Sell_Pack_Size,'
      '          part_store.part_store_name as Part_Store_Name,'
      '          Part.Not_In_Use,'
      '          Part.Customer,'
      '          Customer.name as CustName,'
      '          store_stock.part_bin as Bin,'
      '          store_Stock.Part_Store_Lot as Lot,'
      '          store_stock.Store_stock_description as Stock_Ref,'
      '          store_stock.store_quantity as Quantity,'
      '          store_Stock.Stock_Pack_Quantity as Pack_Size,'
      '          (store_stock.store_Cost) as Stock_Value,'
      '          Store_Stock.Part_Store,'
      '          store_stock.date_received,'
      '          store_stock.invoice_upfront,'
      '          (select top 1 Form_Reference.Form_Reference_ID'
      '           from Form_Reference'
      
        '           where Form_Reference.Stock_Reference = Part.Part) as ' +
        'Form_Reference_ID'
      
        'FROM ((Customer RIGHT JOIN ((part INNER JOIN (store_stock INNER ' +
        'JOIN'
      
        '    part_store ON store_stock.Part_Store = part_store.Part_Store' +
        ')'
      '    ON part.Part = store_stock.Part)'
      
        '    LEFT JOIN Customer_Branch ON (part.Branch_no = Customer_Bran' +
        'ch.Branch_no)'
      '    AND (part.Customer = Customer_Branch.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer))'
      
        'where     (((:theDate - store_stock.date_received) > :noOfDays) ' +
        'and'
      
        '      (Store_Stock.Part >= :PartFrom) and (Store_Stock.Part <= :' +
        'PartTo)) and'
      
        '        ((part.not_in_use <> :Not_in_Use) or (:Not_In_use = '#39#39'))' +
        ' and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) and'
      
        '          ((Store_Stock.Part_Store = :Part_store) or (:Part_Stor' +
        'e = 0)) and'
      
        '          ((Store_Stock.Part_Bin >= :Bin_From) and (Store_Stock.' +
        'Part_Bin <= :Bin_To))'
      'order by  Part_Store_Name, store_stock.part')
    Left = 310
    Top = 94
    ParamData = <
      item
        Name = 'theDate'
      end
      item
        Name = 'noOfDays'
      end
      item
        Name = 'PartFrom'
      end
      item
        Name = 'PartTo'
      end
      item
        Name = 'Not_in_Use'
      end
      item
        Name = 'Not_In_use'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'CustBranch'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Part_store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Bin_From'
      end
      item
        Name = 'Bin_To'
      end>
  end
  object GetTopRepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Rep.Name as Rep_Name'
      
        'FROM ((Part inner JOIN Customer_Branch ON (Part.Branch_no = Cust' +
        'omer_Branch.Branch_no) AND (Part.Customer = Customer_Branch.Cust' +
        'omer)) inner JOIN Reps_Branches ON (Customer_Branch.Branch_no = ' +
        'Reps_Branches.Branch_no) AND (Customer_Branch.Customer = Reps_Br' +
        'anches.Customer)) inner JOIN Rep ON Reps_Branches.Rep = Rep.Rep'
      'where part = :part'
      'order by Rep.name'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 126
    Top = 94
    ParamData = <
      item
        Name = 'part'
        DataType = ftString
      end>
  end
  object qryGetPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Purchase_OrderLine.Purchase_Order'
      'from Purchase_OrderLine, Form_Reference'
      'where Form_Reference.Stock_Reference = :Stock_reference and'
      
        'Purchase_OrderLine.Form_Reference = Form_Reference.Form_Referenc' +
        'e')
    Left = 760
    Top = 24
    ParamData = <
      item
        Name = 'Stock_reference'
      end>
  end
  object qryGetPurchOrds: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Purch_Ord'
      'from Purch_Ord_Line'
      'where Part = :Part')
    Left = 758
    Top = 86
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryAccMgr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Customer_Operator.Customer,'
      'Customer_Operator.Operator,'
      'Customer_Operator.Is_Main_Operator,'
      'Operator.Name as Account_Manager_Name'
      'from Customer_Operator, Operator'
      'where Customer_Operator.Customer = :Customer and'
      'Customer_Operator.Operator = Operator.Operator'
      'order by Operator.Name')
    Left = 880
    Top = 24
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
end
