object STRPStkBalRep2frm: TSTRPStkBalRep2frm
  Left = 39
  Top = 87
  Caption = 'Stock Balance Report'
  ClientHeight = 406
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  TextHeight = 13
  object qrStkBal: TQuickRep
    Left = -3
    Top = -5
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
      Height = 90
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        238.125000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 421
        Top = 16
        Width = 205
        Height = 25
        Size.Values = (
          66.145833333333330000
          1113.895833333333000000
          42.333333333333330000
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
        Left = 840
        Top = 16
        Width = 32
        Height = 25
        Size.Values = (
          66.145833333333300000
          2222.500000000000000000
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
        Top = 40
        Width = 104
        Height = 25
        Size.Values = (
          66.145833333333330000
          1246.187500000000000000
          105.833333333333300000
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
      object QRSysData1: TQRSysData
        Left = 840
        Top = 40
        Width = 121
        Height = 18
        Size.Values = (
          47.625000000000000000
          2222.500000000000000000
          105.833333333333000000
          320.145833333333000000)
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
        Text = 'Page No. :'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLblCust: TQRLabel
        Left = 469
        Top = 64
        Width = 109
        Height = 25
        Size.Values = (
          66.145833333333330000
          1240.895833333333000000
          169.333333333333300000
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
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 153
      Width = 1047
      Height = 54
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRbndDtl
      Size.Values = (
        142.875000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryStkBalRep.Part'
      FooterBand = QRbndFooter
      Master = qrStkBal
      ReprintOnNewPage = True
      object qrPart: TQRLabel
        Left = 8
        Top = 8
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
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
        FontSize = 10
      end
      object qrdbtxtPart: TQRDBText
        Left = 64
        Top = 8
        Width = 161
        Height = 17
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          21.166666666666700000
          425.979166666667000000)
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
        FontSize = 10
      end
      object qrlblPartStoreName: TQRLabel
        Left = 8
        Top = 32
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          84.666666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Warehouse'
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
      object qrlblDesc: TQRLabel
        Left = 232
        Top = 8
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          613.833333333333300000
          21.166666666666670000
          190.500000000000000000)
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
        FontSize = 10
      end
      object qrlblPack: TQRLabel
        Left = 272
        Top = 32
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          719.666666666666700000
          84.666666666666670000
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
        Left = 352
        Top = 32
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          931.333333333333300000
          84.666666666666670000
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
        Left = 464
        Top = 32
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          84.666666666666670000
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
      object qrlblOnOrder: TQRLabel
        Left = 752
        Top = 16
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666700000
          1989.666666666670000000
          42.333333333333300000
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
        Top = 32
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666700000
          2264.833333333330000000
          84.666666666666700000
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
        Left = 928
        Top = 32
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666700000
          2455.333333333330000000
          84.666666666666700000
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
      object qrdbtxtPartDesc: TQRDBText
        Left = 312
        Top = 8
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          21.166666666666670000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 544
        Top = 32
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1439.333333333333000000
          84.666666666666670000
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
        Left = 646
        Top = 32
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1709.208333333333000000
          84.666666666666670000
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
      object QRLabel5: TQRLabel
        Left = 736
        Top = 32
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666700000
          1947.333333333330000000
          84.666666666666700000
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
        Left = 796
        Top = 32
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666700000
          2106.083333333330000000
          84.666666666666700000
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
        Left = 990
        Top = 32
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666700000
          2619.375000000000000000
          84.666666666666700000
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
      object QRShape2: TQRShape
        Left = 0
        Top = 2
        Width = 1046
        Height = 7
        Size.Values = (
          18.520833333333300000
          0.000000000000000000
          5.291666666666670000
          2767.541666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRbndDtl: TQRBand
      Left = 38
      Top = 207
      Width = 1047
      Height = 16
      AlignToBottom = False
      BeforePrint = QRbndDtlBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRbndFooter
      Size.Values = (
        42.333333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qrdbtxtPartStoreName: TQRDBText
        Left = 8
        Top = 0
        Width = 169
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          0.000000000000000000
          447.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryStkBalRep
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
      object qrdbtxtPack: TQRDBText
        Left = 264
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          698.500000000000000000
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
        Left = 350
        Top = 0
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          926.041666666666700000
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
        Left = 440
        Top = 0
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1164.166666666670000000
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
        Left = 536
        Top = 0
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1418.166666666670000000
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
        Left = 640
        Top = 0
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1693.333333333330000000
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
        Left = 712
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          1883.833333333330000000
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
        Left = 849
        Top = 0
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666700000
          2246.312500000000000000
          0.000000000000000000
          148.166666666667000000)
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
        Left = 928
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          2455.333333333330000000
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
        Left = 784
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          2074.333333333330000000
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
      object qrlblWarehouse: TQRLabel
        Left = 40
        Top = 0
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          0.000000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblWarehouse'
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
    object QRbndFooter: TQRBand
      Left = 38
      Top = 243
      Width = 1047
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object qrsdtlNumbers: TQRSubDetail
      Left = 38
      Top = 223
      Width = 1047
      Height = 20
      AlignToBottom = False
      BeforePrint = qrsdtlNumbersBeforePrint
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
        Left = 7
        Top = 2
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          5.291666666666667000
          235.479166666666700000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblSerialNoRange: TQRLabel
        Left = 104
        Top = 2
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          275.166666666666700000
          5.291666666666667000
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
      Top = 128
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
      object QRLabel8: TQRLabel
        Left = 8
        Top = 5
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          13.229166666666670000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
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
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 64
        Top = 5
        Width = 161
        Height = 17
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          13.229166666666700000
          425.979166666667000000)
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
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 232
        Top = 5
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          613.833333333333300000
          13.229166666666670000
          190.500000000000000000)
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
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 312
        Top = 5
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          13.229166666666670000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        FontSize = 10
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
      '       Store_Stock.Part_Store,'
      '       Part_Store.Part_Store_Name,'
      #9'         sum(Store_Quantity) as Qty_in_Stock,'
      #9'         sum(Quantity_Allocated) as Qty_Allocated,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as Free_Stock,'
      '          (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Part_Store_Level' +
        's.part) AS '#39'Purchase Order Qty'#39','
      '          (select sum(Delivery_detail.Qty_to_Deliver)'
      
        '                  from Purchase_Orderline POLine, Delivery_Detai' +
        'l, Form_Reference'
      
        '                  where Form_Reference.Stock_reference = Part_St' +
        'ore_Levels.Part and'
      
        '                             POLine.form_reference = Form_refere' +
        'nce.form_reference and'
      
        #9#9#9'                          POLine.purch_ord_line_Status >= 20 ' +
        'and'
      
        '                                POLine.purch_ord_line_status < 2' +
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
        'omer)'
      '             left join (store_stock'
      
        '                left join part_store on store_stock.part_store =' +
        ' part_store.part_store)'
      '              on part.part = store_stock.part'
      
        'where ((part_store_levels.part is not null) or (store_stock.part' +
        ' is not null)) and'
      
        '      ((part.part >= :part_from) and (part.part <= :part_to)) an' +
        'd'
      
        '          ((Part.Not_In_Use <> :Not_in_Use) or (:Not_in_Use = '#39#39 +
        ')) and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0))and'
      '          ((:Rep = 0) or (Rep.Rep = :Rep))'
      'group by Part.Part,'
      '         part.Part_Description,'
      '         part_store_levels.part,'
      '         Part_Store_Levels.Minimum_Stock,'
      '         Part_Store_Levels.Maximum_Stock,'
      '         Part.Sell_Pack_Quantity,'
      '         Part.Not_In_Use,'
      '         Customer.name,'
      '         Rep.Name,'
      '         store_stock.part,'
      '         Store_Stock.Part_Store,'
      '         Part_Store.part_Store_Name'
      'order by Part.Part,'
      '         Store_Stock.Part_Store;'
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
      ' ')
    Left = 120
    Top = 48
    ParamData = <
      item
        Name = 'part_from'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'part_to'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'Not_in_Use'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'Not_in_Use'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'CustBranch'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
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
    Left = 78
    Top = 70
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
