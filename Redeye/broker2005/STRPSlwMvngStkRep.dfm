object STRPSlwMvngStkRepfrm: TSTRPSlwMvngStkRepfrm
  Left = 65
  Top = 122
  Caption = 'Slow Moving Stock Report'
  ClientHeight = 441
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrDetails: TQuickRep
    Left = 0
    Top = 0
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrDetailsBeforePrint
    DataSet = qrySlwMvngStk
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
      100.000000000000000000
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
    PrintIfEmpty = False
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
    object qrbndDetail: TQRBand
      Left = 24
      Top = 233
      Width = 1332
      Height = 48
      AfterPrint = qrbndDetailAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        101.600000000000000000
        2819.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 6
        Top = 0
        Width = 25
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          0.000000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
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
        Left = 6
        Top = 20
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          42.333333333333330000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Description'
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
      object QRDBText4: TQRDBText
        Left = 613
        Top = 0
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          1297.516666666667000000
          0.000000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Stock_Quantity'
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
        Left = 859
        Top = 0
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          1818.216666666667000000
          0.000000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Stock_Value'
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
      object QRDBText6: TQRDBText
        Left = 1107
        Top = 0
        Width = 47
        Height = 21
        Size.Values = (
          44.450000000000000000
          2343.150000000000000000
          0.000000000000000000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'part_bin'
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
      object qrlblBoxCountVal: TQRLabel
        Left = 787
        Top = 0
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          1665.816666666667000000
          0.000000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Box_Count'
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
      object QRDBText7: TQRDBText
        Left = 704
        Top = 0
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          1490.133333333333000000
          0.000000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Pack_Size'
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
      object QRDBText8: TQRDBText
        Left = 950
        Top = 0
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          2010.833333333333000000
          0.000000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Part_Store'
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
      object QRDBText10: TQRDBText
        Left = 1179
        Top = 0
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          2495.550000000000000000
          0.000000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Stock_Ref'
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
      object QRLblInUse: TQRLabel
        Left = 1278
        Top = 0
        Width = 19
        Height = 24
        Size.Values = (
          50.270833333333300000
          2704.041666666670000000
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
      object QRDBText11: TQRDBText
        Left = 240
        Top = 0
        Width = 215
        Height = 21
        Size.Values = (
          44.979166666666700000
          508.000000000000000000
          0.000000000000000000
          455.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Cust_Name'
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
      object QRDBText12: TQRDBText
        Left = 240
        Top = 20
        Width = 215
        Height = 21
        Size.Values = (
          44.979166666666700000
          508.000000000000000000
          42.333333333333300000
          455.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Rep_Name'
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
      object QRLblSlsOrd: TQRLabel
        Left = 467
        Top = 0
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          988.483333333333300000
          0.000000000000000000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblSlsOrd'
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
      object QRLblDtReq: TQRLabel
        Left = 566
        Top = 0
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          1198.033333333333000000
          0.000000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblDtReq'
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
    object QRBand: TQRBand
      Left = 24
      Top = 47
      Width = 1332
      Height = 186
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        393.700000000000000000
        2819.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 501
        Top = 10
        Width = 329
        Height = 33
        Size.Values = (
          69.850000000000000000
          1060.450000000000000000
          21.166666666666670000
          696.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Slow Moving Stock Report '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
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
        Left = 487
        Top = 50
        Width = 358
        Height = 31
        Size.Values = (
          65.616666666666670000
          1030.816666666667000000
          105.833333333333300000
          757.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Report showing stock with no movements since:- '
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
      object qrPart: TQRLabel
        Left = 10
        Top = 120
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          254.000000000000000000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product/'
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
      object QRShape1: TQRShape
        Left = 0
        Top = 160
        Width = 1313
        Height = 16
        Size.Values = (
          34.395833333333300000
          0.000000000000000000
          338.666666666667000000
          2778.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblDesc: TQRLabel
        Left = 10
        Top = 140
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          296.333333333333300000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
      object qrlblPack: TQRLabel
        Left = 560
        Top = 140
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1185.333333333333000000
          296.333333333333300000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Req.'
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
      object qrlblStock: TQRLabel
        Left = 648
        Top = 140
        Width = 52
        Height = 21
        Size.Values = (
          44.450000000000000000
          1371.600000000000000000
          296.333333333333300000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'In Stock'
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
      object QRLabel4: TQRLabel
        Left = 1088
        Top = 140
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          2302.933333333333000000
          296.333333333333300000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin location'
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
      object QRLabel3: TQRLabel
        Left = 780
        Top = 140
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          1651.000000000000000000
          296.333333333333300000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box Count'
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
      object QRLabel5: TQRLabel
        Left = 860
        Top = 140
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          1820.333333333333000000
          296.333333333333300000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Value'
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
      object QRLabel1: TQRLabel
        Left = 950
        Top = 140
        Width = 35
        Height = 21
        Size.Values = (
          44.450000000000000000
          2010.833333333333000000
          296.333333333333300000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Store'
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
      object QRLabel2: TQRLabel
        Left = 710
        Top = 140
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          1502.833333333333000000
          296.333333333333300000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Size'
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
      object QRLabel6: TQRLabel
        Left = 468
        Top = 140
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          990.600000000000000000
          296.333333333333300000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order'
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
      object QRLabel7: TQRLabel
        Left = 1180
        Top = 140
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          2497.666666666667000000
          296.333333333333300000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Ref.'
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
      object QRLabel8: TQRLabel
        Left = 1257
        Top = 140
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          2660.650000000000000000
          296.333333333333300000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Not in Use'
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
      object PageQRSysData: TQRSysData
        Left = 1084
        Top = 50
        Width = 112
        Height = 24
        Size.Values = (
          50.800000000000000000
          2294.466666666667000000
          105.833333333333300000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page:'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRSysData2: TQRSysData
        Left = 1084
        Top = 20
        Width = 144
        Height = 23
        Size.Values = (
          48.683333333333330000
          2294.466666666667000000
          42.333333333333330000
          304.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Date :'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object qrlblRange: TQRLabel
        Left = 607
        Top = 80
        Width = 117
        Height = 31
        Size.Values = (
          65.616666666666670000
          1284.816666666667000000
          169.333333333333300000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'From Product - '
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
      object QRLblCust: TQRLabel
        Left = 606
        Top = 110
        Width = 119
        Height = 31
        Size.Values = (
          65.616666666666670000
          1282.700000000000000000
          232.833333333333300000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'From Customer '
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
      object QRLabel12: TQRLabel
        Left = 240
        Top = 120
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          508.000000000000000000
          254.000000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/'
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
      object QRLabel13: TQRLabel
        Left = 260
        Top = 140
        Width = 26
        Height = 21
        Size.Values = (
          44.450000000000000000
          550.333333333333300000
          296.333333333333300000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
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
    object QRBand2: TQRBand
      Left = 24
      Top = 281
      Width = 1332
      Height = 32
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2819.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel9: TQRLabel
        Left = 705
        Top = 10
        Width = 113
        Height = 21
        Size.Values = (
          44.450000000000000000
          1492.250000000000000000
          21.166666666666670000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Stock Value'
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
      object qrlblTotalStkVal: TQRLabel
        Left = 856
        Top = 10
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          1811.866666666667000000
          21.166666666666670000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Stock Value'
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
      object QRShape2: TQRShape
        Left = 706
        Top = 5
        Width = 235
        Height = 1
        Size.Values = (
          2.645833333333330000
          1494.895833333330000000
          10.583333333333300000
          497.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qrySlwMvngStk: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select   store_stock.part as Part,'
      '         part.part_description as Description,'
      '         part.Not_In_Use,'
      '         Customer.name as Cust_Name,'
      '         Rep.Name as Rep_Name,'
      '         store_stock.Stock_Pack_Quantity as Pack_Size,'
      '         part_store.part_store_name as Part_Store,'
      '         store_stock.part_bin,'
      '         store_stock.Store_stock_description as Stock_Ref,'
      '          sum(store_stock.Store_Quantity) as Stock_Quantity,'
      '          sum(store_stock.Store_Cost) as Stock_Value'
      'FROM Rep RIGHT JOIN (Reps_Branches RIGHT JOIN ((((Part'
      #9#9'RIGHT JOIN Store_Stock ON Part.Part = Store_Stock.Part) '
      
        #9#9'LEFT JOIN Part_Store ON Store_Stock.Part_Store = Part_Store.Pa' +
        'rt_Store)'
      #9#9'LEFT JOIN Customer ON Part.Customer = Customer.Customer)'
      
        #9#9'LEFT JOIN Customer_Branch ON Customer.Customer = Customer_Bran' +
        'ch.Customer) '
      #9#9#9'ON (Reps_Branches.Branch_no = Customer_Branch.Branch_no) '
      #9#9#9'AND (Reps_Branches.Customer = Customer_Branch.Customer))'
      #9#9#9'ON Rep.Rep = Reps_Branches.Rep'
      
        'where     (store_stock.part >= :PartFrom) and (store_stock.part ' +
        '<= :PartTo) and'
      
        '          ((Part.Not_In_Use <> :Not_in_Use) or (:Not_in_Use = '#39#39 +
        ')) and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) and'
      '          ((:Rep = 0) or (Rep.Rep = :Rep)) AND'
      '          (store_stock.date_received <= :DateFrom) AND'
      
        '          (Store_Stock.Part not in (select distinct Part from sa' +
        'les_order_line, sales_order'
      
        #9#9#9'    WHERE sales_order_line.sales_order = sales_order.sales_or' +
        'der and'
      #9#9#9#9'        sales_order.date_required > :DateFrom))'
      'group by  store_stock.part,'
      '          part.part_description,'
      '          Part.Not_In_use,'
      '          Customer.name,'
      '          Rep.Name,'
      '          store_stock.Stock_Pack_Quantity,'
      '          part_store.part_store_name,'
      '          store_stock.part_bin,'
      '          store_stock.Store_stock_description'
      'order by store_stock.part'
      ''
      ''
      ''
      ''
      ''
      ''
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
    Left = 344
    Top = 8
    ParamData = <
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
        Name = 'Not_in_Use'
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
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'DateFrom'
      end
      item
        Name = 'DateFrom'
      end>
  end
  object DataSource1: TDataSource
    DataSet = qrySlwMvngStk
    Left = 66
    Top = 16
  end
  object SQLGetSlsDt: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT distinct Sales_Order.Sales_Order, Sales_Order.Date_Requir' +
        'ed'
      'FROM Sales_Order INNER JOIN (Part INNER JOIN Sales_Order_line'
      'ON Part.Part = Sales_Order_line.Part)'
      'ON Sales_Order.Sales_Order = Sales_Order_line.Sales_Order'
      'where sales_order_line.part = :part and'
      
        '((Sales_Order.Date_Required <= :Date) or (Sales_Order.Date_Requi' +
        'red is null))'
      'order by Sales_Order.Date_Required desc,'
      'sales_order.sales_order desc'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 259
    Top = 54
    ParamData = <
      item
        Name = 'part'
        DataType = ftInteger
      end
      item
        Name = 'Date'
        DataType = ftDateTime
      end>
  end
  object qrySlowMvgNoRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Store_Stock.Store_Quantity as Stock_Quantity,'
      #9'Store_Stock.Store_Cost as Stock_Value, '
      #9'Store_Stock.Part, '
      #9'Part.Part_Description as Description,'
      #9'Part.Not_In_Use,'
      #9'Store_Stock.Stock_Pack_Quantity as Pack_Size,'
      #9'Store_Stock.Store_Stock_Description as Stock_Ref,'
      #9'Store_Stock.Part_Bin, '
      #9'Store_Stock.Date_Received, '
      #9'Customer.Name AS Cust_Name, '
      #9'Part_Store.Part_Store_Name as Part_Store,'
      '  Part.Customer,'
      '  Part.Branch_no,'
      '  (select top 1 Rep.Name'
      '   from Rep, Reps_Branches'
      '   where (Reps_Branches.customer = Part.Customer and'
      '         Reps_Branches.branch_no = Part.Branch_no) and'
      '         Rep.Rep = Reps_Branches.Rep) as Rep_Name'
      'FROM Part_Store '
      #9'INNER JOIN ((Part '
      #9'LEFT JOIN Customer ON Part.Customer = Customer.Customer) '
      
        #9'INNER JOIN Store_Stock ON Part.Part = Store_Stock.Part) ON Part' +
        '_Store.Part_Store = Store_Stock.Part_Store'
      
        'WHERE     (store_stock.part >= :PartFrom) and (store_stock.part ' +
        '<= :PartTo) and'
      
        '          ((Part.Not_In_Use <> :Not_in_Use) or (:Not_in_Use = '#39#39 +
        ')) and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) AND'
      '          (store_stock.date_received <= :DateFrom) AND'
      
        '          (Store_Stock.Part not in (select distinct Part from sa' +
        'les_order_line, sales_order'
      
        #9#9#9'    WHERE sales_order_line.sales_order = sales_order.sales_or' +
        'der and'
      #9#9#9#9'        sales_order.date_required > :DateFrom))'
      'ORDER BY Store_Stock.Part'
      ''
      '')
    Left = 346
    Top = 110
    ParamData = <
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
        Name = 'Not_in_Use'
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
        Name = 'DateFrom'
      end
      item
        Name = 'DateFrom'
      end>
  end
end
