object STRPStkBalRepfrm: TSTRPStkBalRepfrm
  Left = 20
  Top = 141
  Caption = 'Stock Balance Report'
  ClientHeight = 384
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrStkBal: TQuickRep
    Left = 64
    Top = 0
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrStkBalBeforePrint
    DataSet = qryStkBalRep
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
    Options = [FirstPageHeader, LastPageFooter, Compression]
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
      Width = 1047
      Height = 138
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        365.125000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 421
        Top = 0
        Width = 205
        Height = 25
        Size.Values = (
          66.145833333333330000
          1113.895833333333000000
          0.000000000000000000
          542.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Stock Balance Report'
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
      object DateQRLabel: TQRLabel
        Left = 832
        Top = 16
        Width = 32
        Height = 25
        Size.Values = (
          66.145833333333300000
          2201.333333333330000000
          42.333333333333300000
          84.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object qrlblRange: TQRLabel
        Left = 471
        Top = 24
        Width = 104
        Height = 25
        Size.Values = (
          66.145833333333330000
          1246.187500000000000000
          63.500000000000000000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'From Product - '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object qrPart: TQRLabel
        Left = 8
        Top = 88
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          232.833333333333300000
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
        Top = 105
        Width = 1050
        Height = 7
        Size.Values = (
          18.520833333333300000
          21.166666666666700000
          277.812500000000000000
          2778.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblDesc: TQRLabel
        Left = 88
        Top = 88
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          232.833333333333300000
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
      object qrlblPack: TQRLabel
        Left = 416
        Top = 88
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          232.833333333333300000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box Size'
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
      object qrlblBoxCount: TQRLabel
        Left = 472
        Top = 88
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          232.833333333333300000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
      object qrlblStock: TQRLabel
        Left = 552
        Top = 88
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          232.833333333333300000
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
        Left = 608
        Top = 88
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          232.833333333333300000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Alloc.Stock'
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
      object QRLabel4: TQRLabel
        Left = 680
        Top = 88
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666700000
          1799.166666666670000000
          232.833333333333000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Free Stock'
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
      object qrlblOnOrder: TQRLabel
        Left = 776
        Top = 72
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666700000
          2053.166666666670000000
          190.500000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'On Order'
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
        Left = 856
        Top = 88
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666700000
          2264.833333333330000000
          232.833333333333000000
          145.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Min Stock'
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
        Left = 920
        Top = 88
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666700000
          2434.166666666670000000
          232.833333333333000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Max Stock'
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
        Left = 760
        Top = 88
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666700000
          2010.833333333330000000
          232.833333333333000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prod.'
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
        Left = 808
        Top = 88
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666700000
          2137.833333333330000000
          232.833333333333000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Purch.'
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
        Left = 982
        Top = 88
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666700000
          2598.208333333330000000
          232.833333333333000000
          148.166666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Not in Use'
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
      object QRSysData1: TQRSysData
        Left = 832
        Top = 40
        Width = 117
        Height = 18
        Size.Values = (
          47.625000000000000000
          2201.333333333330000000
          105.833333333333000000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page No.:'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLblCust: TQRLabel
        Left = 469
        Top = 48
        Width = 109
        Height = 25
        Size.Values = (
          66.145833333333330000
          1240.895833333333000000
          127.000000000000000000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'From Customer '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel8: TQRLabel
        Left = 264
        Top = 72
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          190.500000000000000000
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
      object QRLabel9: TQRLabel
        Left = 264
        Top = 88
        Width = 22
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          232.833333333333300000
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
    end
    object QRbndDtl: TQRBand
      Left = 38
      Top = 201
      Width = 1047
      Height = 35
      AlignToBottom = False
      BeforePrint = QRbndDtlBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSubDtlSerNos
      Size.Values = (
        92.604166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qrdbtxtPartDesc: TQRDBText
        Left = 88
        Top = 0
        Width = 169
        Height = 17
        Size.Values = (
          44.979166666666700000
          232.833333333333000000
          0.000000000000000000
          447.145833333333000000)
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
      object qrdbtxtPart: TQRDBText
        Left = 8
        Top = 0
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          0.000000000000000000
          193.145833333333000000)
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
      object qrdbtxtPack: TQRDBText
        Left = 416
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          0.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Sell_Pack_Quantity'
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
        Left = 478
        Top = 0
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          1264.708333333333000000
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
      object qrdbtxtStock: TQRDBText
        Left = 532
        Top = 0
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1407.583333333330000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Qty_in_Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0'
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
        Left = 605
        Top = 0
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1600.729166666670000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Qty_Allocated'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0'
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
        Left = 674
        Top = 0
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1783.291666666670000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Free_Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbtxtOnOrder: TQRDBText
        Left = 740
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          1957.916666666670000000
          0.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Production Order Qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbtxtMin: TQRDBText
        Left = 860
        Top = 0
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666700000
          2275.416666666670000000
          0.000000000000000000
          132.291666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Minimum_Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbtxtMax: TQRDBText
        Left = 927
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          2452.687500000000000000
          0.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Maximum_Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0'
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
        Left = 795
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          2103.437500000000000000
          0.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Purchase Order Qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '0'
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
        Left = 1006
        Top = 0
        Width = 15
        Height = 19
        Size.Values = (
          50.270833333333300000
          2661.708333333330000000
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
      object QRDBText4: TQRDBText
        Left = 264
        Top = 0
        Width = 150
        Height = 17
        Size.Values = (
          44.979166666666700000
          698.500000000000000000
          0.000000000000000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
        DataField = 'Cust_Name'
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
      object QRMemoRepName: TQRMemo
        Left = 264
        Top = 16
        Width = 150
        Height = 17
        Size.Values = (
          44.979166666666700000
          698.500000000000000000
          42.333333333333300000
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
    end
    object QRSubDtlSerNos: TQRSubDetail
      Left = 38
      Top = 236
      Width = 1047
      Height = 20
      AlignToBottom = False
      BeforePrint = QRSubDtlSerNosBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrStkBal
      DataSet = GetSerNosSQL
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialNos: TQRLabel
        Left = 87
        Top = 0
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          230.187500000000000000
          0.000000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
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
      object lblSerialNoRange: TQRLabel
        Left = 176
        Top = 0
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          465.666666666666700000
          0.000000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialNoRange'
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
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 176
      Width = 1047
      Height = 25
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand
      PrintOrder = cboAfterParent
      object QRDBText5: TQRDBText
        Left = 8
        Top = 0
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          0.000000000000000000
          193.145833333333000000)
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
        Left = 88
        Top = 0
        Width = 169
        Height = 17
        Size.Values = (
          44.979166666666700000
          232.833333333333000000
          0.000000000000000000
          447.145833333333000000)
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
    end
  end
  object qryStkBalRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select part.part,'
      '       part.part_description,'
      '       part_store_levels.part,'
      '       Part_Store_Levels.Minimum_Stock,'
      '       Part_Store_Levels.Maximum_Stock,'
      '       Part.Sell_Pack_Quantity,'
      '       Part.Not_In_Use,'
      '       Customer.name as Cust_Name,'
      '       Rep.Name as Rep_Name,'
      '       store_stock.part,'
      '       '#9'         sum(Store_Quantity) as Qty_in_Stock,'
      #9'         sum(Quantity_Allocated) as Qty_Allocated,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as Free_Stock,'
      '         (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Part_Store_Level' +
        's.part) AS '#39'Purchase Order Qty'#39','
      '         (select sum(Delivery_detail.Qty_to_Deliver)'
      
        '                  from Purchase_Orderline POLine, Delivery_Detai' +
        'l, Form_Reference'
      
        '                  where Form_Reference.stock_reference = Part_St' +
        'ore_Levels.Part and'
      
        '                             POLine.form_reference = Form_refere' +
        'nce.form_reference and'
      
        #9#9#9'                          POLine.purch_ord_line_Status >= 20 ' +
        'and'
      
        '                                POLine.purch_ord_line_Status < 2' +
        '2 and'
      
        '                             ((Delivery_detail.purchase_order = ' +
        'POLine.purchase_order) and'
      
        #9#9#9'                           (Delivery_detail.Line = POLine.Lin' +
        'e)) and'
      
        '                              (Delivery_detail.delivery_to_Stock' +
        ' = '#39'Y'#39') and'
      
        '                              (Delivery_Detail.Qty_Delivered = 0' +
        ') and'
      
        '                              (stock_reference is not null)) AS ' +
        #39'Production Order Qty'#39
      
        'from (((part left join part_store_levels on part.part = part_sto' +
        're_levels.part)'
      
        '             left join store_stock on part.part = store_stock.pa' +
        'rt)'
      '             left join (customer_branch'
      '                left Join (Reps_Branches'
      '                  left Join Rep on Reps_Branches.Rep = Rep.Rep)'
      
        '                  on Customer_Branch.Branch_No = Reps_Branches.B' +
        'ranch_No and'
      
        '                     Customer_Branch.Customer = Reps_Branches.Cu' +
        'stomer)'
      
        '             on part.customer = customer_branch.customer and par' +
        't.Branch_no = Customer_Branch.Branch_no)'
      
        '             left Join Customer on part.Customer = customer.cust' +
        'omer'
      
        'where ((part_store_levels.part is not null) or (store_stock.part' +
        ' is not null))  and'
      
        '      ((part.part >= :part_from) and (part.part <= :part_to)) an' +
        'd'
      
        '      ((part.not_in_use <> :Not_in_Use) or (:Not_In_use = '#39#39')) a' +
        'nd'
      '          ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '          ((:Rep = 0) or (Rep.Rep = :Rep))'
      'group by Part.Part,'
      '         part.Part_Description,'
      '         part_store_levels.part,'
      '         Part_Store_Levels.Minimum_Stock,'
      '         Part_Store_Levels.Maximum_Stock,'
      '         Part.Sell_Pack_Quantity,'
      '         Part.Not_In_Use,'
      '         Customer.Name,'
      '         Rep.Name,'
      '         store_stock.part'
      'order by Part.Part'
      ''
      ''
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 118
    Top = 8
    ParamData = <
      item
        Name = 'part_from'
        DataType = ftString
      end
      item
        Name = 'part_to'
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
    Left = 150
    Top = 78
    ParamData = <
      item
        Name = 'part'
        DataType = ftString
      end>
  end
  object Query1: TFDQuery
    SQL.Strings = (
      'select part.part,'
      '       part.part_description,'
      '       part_store_levels.part,'
      '       Part_Store_Levels.Minimum_Stock,'
      '       Part_Store_Levels.Maximum_Stock,'
      '       Part.Sell_Pack_Quantity,'
      '       Part.Not_In_Use,'
      '       Customer.name as Cust_Name,'
      '       store_stock.part,'
      '       '#9'         sum(Store_Quantity) as Qty_in_Stock,'
      #9'         sum(Quantity_Allocated) as Qty_Allocated,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as Free_Stock,'
      '         (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Part_Store_Level' +
        's.part) AS '#39'Purchase Order Qty'#39','
      '         (select sum(Delivery_detail.Qty_to_Deliver)'
      
        '                  from Purchase_Orderline POLine, Delivery_Detai' +
        'l, Form_Reference'
      
        '                  where Form_Reference.stock_reference = Part_St' +
        'ore_Levels.Part and'
      
        '                             POLine.form_reference = Form_refere' +
        'nce.form_reference and'
      
        #9#9#9'                          POLine.purch_ord_line_Status >= 20 ' +
        'and'
      
        '                                POLine.purch_ord_line_Status < 2' +
        '2 and'
      
        '                             ((Delivery_detail.purchase_order = ' +
        'POLine.purchase_order) and'
      
        #9#9#9'                           (Delivery_detail.Line = POLine.Lin' +
        'e)) and'
      
        '                              (Delivery_detail.delivery_to_Stock' +
        ' = '#39'Y'#39') and'
      
        '                              (Delivery_Detail.Qty_Delivered = 0' +
        ') and'
      
        '                              (stock_reference is not null)) AS ' +
        #39'Production Order Qty'#39
      
        'from (((part left join part_store_levels on part.part = part_sto' +
        're_levels.part)'
      
        '             left join store_stock on part.part = store_stock.pa' +
        'rt)'
      
        '             left Join Customer on part.Customer = customer.cust' +
        'omer)'
      
        'where ((part_store_levels.part is not null) or (store_stock.part' +
        ' is not null))  and'
      
        '      ((part.part >= :part_from) and (part.part <= :part_to)) an' +
        'd'
      
        '      ((part.not_in_use <> :Not_in_Use) or (:Not_In_use = '#39#39')) a' +
        'nd'
      '          ((Part.Customer = :Customer) or (:Customer = 0))'
      'group by Part.Part,'
      '         part.Part_Description,'
      '         part_store_levels.part,'
      '         Part_Store_Levels.Minimum_Stock,'
      '         Part_Store_Levels.Maximum_Stock,'
      '         Part.Sell_Pack_Quantity,'
      '         Part.Not_In_Use,'
      '         Customer.Name,'
      '         store_stock.part'
      'order by Part.Part'
      ' '
      ' '
      ' ')
    Left = 222
    Top = 62
    ParamData = <
      item
        Name = 'part_from'
      end
      item
        Name = 'part_to'
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
        Name = 'Customer'
      end>
  end
  object GetSerNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Store_Stock_Serial_item.Serial_item_from,'
      'Store_Stock_Serial_item.Serial_item_to'
      'FROM Store_Stock inner JOIN Store_Stock_Serial_item ON'
      'Store_Stock.Store_Stock = Store_Stock_Serial_item.Store_Stock'
      'where store_stock.part = :part'
      'order by Store_stock_serial_item.serial_item_from'
      ' '
      ' ')
    Left = 94
    Top = 62
    ParamData = <
      item
        Name = 'part'
        DataType = ftString
      end>
    object GetSerNosSQLSerial_item_from: TStringField
      FieldName = 'Serial_item_from'
      FixedChar = True
      Size = 60
    end
    object GetSerNosSQLSerial_item_to: TStringField
      FieldName = 'Serial_item_to'
      FixedChar = True
      Size = 60
    end
  end
end
