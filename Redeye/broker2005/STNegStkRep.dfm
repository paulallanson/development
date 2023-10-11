object STNegStkRepFrm: TSTNegStkRepFrm
  Left = 4
  Top = 133
  Caption = 'Negative Stock Report Form'
  ClientHeight = 707
  ClientWidth = 1437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object NegStkQuickReport: TQuickRep
    Left = 32
    Top = 16
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = NegStkQuickReportBeforePrint
    DataSet = GetDetsQuery
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
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
      Height = 91
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        240.770833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 417
        Top = 8
        Width = 212
        Height = 26
        Size.Values = (
          68.791666666666670000
          1103.312500000000000000
          21.166666666666670000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Negative Stock Report'
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
        Left = 867
        Top = 8
        Width = 32
        Height = 25
        Size.Values = (
          66.145833333333330000
          2293.937500000000000000
          21.166666666666670000
          84.666666666666670000)
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
      object PageQRSysData: TQRSysData
        Left = 867
        Top = 40
        Width = 121
        Height = 19
        Size.Values = (
          50.270833333333330000
          2293.937500000000000000
          105.833333333333300000
          320.145833333333300000)
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
        Text = 'Page No.: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLblSel: TQRLabel
        Left = 491
        Top = 40
        Width = 64
        Height = 18
        Size.Values = (
          47.625000000000000000
          1299.104166666667000000
          105.833333333333300000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'QRLblSel'
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
      Top = 129
      Width = 1047
      Height = 64
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        169.333333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetDetsQuery.Part_Store_Name'
      FooterBand = GrpFootQRBand
      Master = NegStkQuickReport
      ReprintOnNewPage = False
      object SeqByQRLabel: TQRLabel
        Left = 16
        Top = 0
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'STORE : '
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 32
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          84.666666666666670000
          121.708333333333300000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 136
        Top = 32
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          84.666666666666670000
          174.625000000000000000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 336
        Top = 32
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          84.666666666666670000
          161.395833333333300000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 414
        Top = 32
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1095.375000000000000000
          84.666666666666670000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity '
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
      object QRLabel4: TQRLabel
        Left = 508
        Top = 32
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666700000
          1344.083333333330000000
          84.666666666666700000
          100.541666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Latest Cost'
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
      object QRLabel9: TQRLabel
        Left = 584
        Top = 32
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          84.666666666666670000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Av. Cost'
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
      object BinQRLabel: TQRLabel
        Left = 675
        Top = 32
        Width = 20
        Height = 17
        Size.Values = (
          44.979166666666670000
          1785.937500000000000000
          84.666666666666670000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin'
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
      object LotQRLabel: TQRLabel
        Left = 739
        Top = 32
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1955.270833333333000000
          84.666666666666670000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lot/Serial No.'
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
      object NameQRLabel: TQRLabel
        Left = 96
        Top = 0
        Width = 550
        Height = 17
        Size.Values = (
          44.979166666666700000
          254.000000000000000000
          0.000000000000000000
          1455.208333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'NameQRLabel'
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
      object QRShape1: TQRShape
        Left = 8
        Top = 50
        Width = 906
        Height = 5
        Size.Values = (
          13.229166666666700000
          21.166666666666700000
          132.291666666667000000
          2397.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 838
        Top = 32
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          2217.208333333333000000
          84.666666666666670000
          164.041666666666700000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object GrpFootQRBand: TQRBand
      Left = 38
      Top = 219
      Width = 1047
      Height = 50
      AfterPrint = GrpFootQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = GrpFootQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        132.291666666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object Group1TotalQRLabel: TQRLabel
        Left = 384
        Top = 16
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          42.333333333333330000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Value:'
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
      object TotCostQRLabel: TQRLabel
        Left = 480
        Top = 16
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666700000
          1270.000000000000000000
          42.333333333333300000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCostQRLabel'
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
      object QRShape2: TQRShape
        Left = 470
        Top = 8
        Width = 97
        Height = 10
        Size.Values = (
          26.458333333333300000
          1243.541666666670000000
          21.166666666666700000
          256.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 193
      Width = 1047
      Height = 26
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = NegStkQuickReport
      PrintBefore = False
      PrintIfEmpty = True
      object Seq2QRDBText: TQRDBText
        Left = 6
        Top = 8
        Width = 123
        Height = 18
        Size.Values = (
          47.625000000000000000
          15.875000000000000000
          21.166666666666700000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
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
      object DescQRDBText: TQRDBText
        Left = 134
        Top = 8
        Width = 179
        Height = 18
        Size.Values = (
          47.625000000000000000
          354.541666666667000000
          21.166666666666700000
          473.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
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
      object PackSizeQRDBText: TQRDBText
        Left = 334
        Top = 8
        Width = 67
        Height = 18
        Size.Values = (
          47.625000000000000000
          883.708333333333000000
          21.166666666666700000
          177.270833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Stock_Pack_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '########'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 414
        Top = 8
        Width = 54
        Height = 18
        Size.Values = (
          47.625000000000000000
          1095.375000000000000000
          21.166666666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Store_Quantity_Pos'
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
      object QRDBText1: TQRDBText
        Left = 658
        Top = 8
        Width = 56
        Height = 18
        Size.Values = (
          47.625000000000000000
          1740.958333333330000000
          21.166666666666700000
          148.166666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Bin'
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
      object QRDBText2: TQRDBText
        Left = 739
        Top = 8
        Width = 73
        Height = 18
        Size.Values = (
          47.625000000000000000
          1955.270833333330000000
          21.166666666666700000
          193.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Store_Lot'
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
      object QRDBText3: TQRDBText
        Left = 584
        Top = 8
        Width = 59
        Height = 18
        Size.Values = (
          47.625000000000000000
          1545.166666666670000000
          21.166666666666700000
          156.104166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Store_Cost_Pos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = #163'######0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object LatCostQRExpr: TQRExpr
        Left = 480
        Top = 8
        Width = 88
        Height = 18
        Size.Values = (
          47.625000000000000000
          1270.000000000000000000
          21.166666666666700000
          232.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          '(GetDetsQuery.Part_Purchase_Price * GetDetsQuery.Store_Quantity_' +
          'Pos) / GetDetsQuery.Purch_Pack_Quantity'
        Mask = #163'######0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLblInUse: TQRLabel
        Left = 862
        Top = 8
        Width = 15
        Height = 19
        Size.Values = (
          50.270833333333300000
          2280.708333333330000000
          21.166666666666700000
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
    end
  end
  object GetDetsDataSource: TDataSource
    DataSet = GetDetsQuery
    Left = 533
    Top = 61
  end
  object GetDetsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Store_Stock.*,'
      '       (0 - Store_Stock.Store_Quantity) as Store_Quantity_Pos,'
      '       (0 - Store_Stock.Store_Cost) as Store_Cost_Pos,'
      '        Part.Part_Description, Part.Purch_Pack_Quantity,'
      '    Part.Part_Purchase_Price,'
      '    Part.Not_In_Use,'
      '    Part_Store.Part_Store_Name'
      'from Store_Stock, Part, Part_Store'
      'where (Store_Stock.Part = Part.Part) and'
      '  (Part_Store.Part_Store = Store_Stock.Part_Store) and'
      '  (Store_Stock.Store_Quantity) < 0'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 531
    Top = 27
    object GetDetsQueryStore_Stock: TIntegerField
      FieldName = 'Store_Stock'
    end
    object GetDetsQueryQuantity_Allocated: TIntegerField
      FieldName = 'Quantity_Allocated'
    end
    object GetDetsQueryStore_Quantity: TIntegerField
      FieldName = 'Store_Quantity'
    end
    object GetDetsQueryStore_Cost: TCurrencyField
      FieldName = 'Store_Cost'
    end
    object GetDetsQueryDate_Received: TDateTimeField
      FieldName = 'Date_Received'
    end
    object GetDetsQueryPart: TStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object GetDetsQueryPart_Store_Lot: TStringField
      FieldName = 'Part_Store_Lot'
      FixedChar = True
      Size = 40
    end
    object GetDetsQueryPart_Store: TIntegerField
      FieldName = 'Part_Store'
    end
    object GetDetsQueryPart_Bin: TStringField
      FieldName = 'Part_Bin'
      FixedChar = True
    end
    object GetDetsQueryStock_Pack_Quantity: TIntegerField
      FieldName = 'Stock_Pack_Quantity'
    end
    object GetDetsQueryPart_Description: TStringField
      FieldName = 'Part_Description'
      FixedChar = True
      Size = 60
    end
    object GetDetsQueryPurch_Pack_Quantity: TIntegerField
      FieldName = 'Purch_Pack_Quantity'
    end
    object GetDetsQueryPart_Purchase_Price: TCurrencyField
      FieldName = 'Part_Purchase_Price'
    end
    object GetDetsQueryPart_Store_Name: TStringField
      FieldName = 'Part_Store_Name'
      FixedChar = True
      Size = 60
    end
    object GetDetsQueryStore_Quantity_Pos: TIntegerField
      FieldName = 'Store_Quantity_Pos'
      OnGetText = GetDetsQueryStore_Quantity_PosGetText
    end
    object GetDetsQueryStore_Cost_Pos: TCurrencyField
      FieldName = 'Store_Cost_Pos'
    end
    object GetDetsQueryNot_In_Use: TStringField
      FieldName = 'Not_In_Use'
      FixedChar = True
      Size = 2
    end
  end
end
