object PBRPPEndSalesCommFrm: TPBRPPEndSalesCommFrm
  Left = 44
  Top = 102
  Caption = 'Reps Commission report'
  ClientHeight = 698
  ClientWidth = 1194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByInv: TQuickRep
    Left = 16
    Top = 16
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qckrpSalesByInvBeforePrint
    DataSet = qrySalesComm
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
    object qrbndPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 99
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        261.937500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 436
        Top = 8
        Width = 174
        Height = 23
        Size.Values = (
          60.854166666666670000
          1153.583333333333000000
          21.166666666666670000
          460.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Reps Commission '
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 64
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          169.333333333333300000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 264
        Top = 64
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          169.333333333333300000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 80
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          211.666666666666700000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of Job'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 408
        Top = 80
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1079.500000000000000000
          211.666666666666700000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Goods Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 656
        Top = 64
        Width = 19
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          169.333333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 502
        Top = 80
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          211.666666666666700000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDateRange: TQRLabel
        Left = 457
        Top = 32
        Width = 133
        Height = 17
        Size.Values = (
          44.979166666666670000
          1209.145833333333000000
          84.666666666666670000
          351.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Payments Dated : '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 656
        Top = 80
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          211.666666666666700000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 264
        Top = 80
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          211.666666666666700000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel16: TQRLabel
        Left = 332
        Top = 64
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          878.416666666666700000
          169.333333333333300000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 332
        Top = 80
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          878.416666666666700000
          211.666666666666700000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Code'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object MarginQRLabel: TQRLabel
        Left = 613
        Top = 80
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          1621.895833333333000000
          211.666666666666700000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 727
        Top = 64
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          1923.520833333333000000
          169.333333333333300000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '--- Commission ---'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 715
        Top = 80
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1891.770833333333000000
          211.666666666666700000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Rate'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 787
        Top = 80
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          2082.270833333333000000
          211.666666666666700000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 971
        Top = 64
        Width = 37
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          2569.104166666667000000
          169.333333333333300000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bonus'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 939
        Top = 80
        Width = 46
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          2484.437500000000000000
          211.666666666666700000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Rate'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel19: TQRLabel
        Left = 995
        Top = 80
        Width = 46
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          2632.604166666667000000
          211.666666666666700000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRSysData2: TQRSysData
        Left = 986
        Top = 3
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2608.791666666667000000
          7.937500000000000000
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
      object QRSysData1: TQRSysData
        Left = 973
        Top = 24
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          2574.395833333333000000
          63.500000000000000000
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
    object RepGrpFoot: TQRBand
      Left = 38
      Top = 281
      Width = 1047
      Height = 5
      AfterPrint = RepGrpFootAfterPrint
      AlignToBottom = False
      BeforePrint = RepGrpFootBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object RepQRGroup: TQRGroup
      Left = 38
      Top = 137
      Width = 1047
      Height = 32
      AlignToBottom = False
      BeforePrint = RepQRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = RepGrpFoot
      Master = qckrpSalesByInv
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 8
        Top = 8
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySalesComm
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrbSummary: TQRBand
      Left = 38
      Top = 326
      Width = 1047
      Height = 40
      AlignToBottom = False
      BeforePrint = qrbSummaryBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape2: TQRShape
        Left = 336
        Top = 2
        Width = 297
        Height = 9
        Size.Values = (
          23.812500000000000000
          889.000000000000000000
          5.291666666666670000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTotQRLabel: TQRLabel
        Left = 344
        Top = 16
        Width = 35
        Height = 20
        Size.Values = (
          52.916666666666670000
          910.166666666666700000
          42.333333333333330000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
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
      object RepTotGoodsQRLbl: TQRLabel
        Left = 397
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepTotCostQRLbl: TQRLabel
        Left = 485
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1283.229166666667000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepMargQRLbl: TQRLabel
        Left = 581
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          42.333333333333340000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'RepMargQRLbl'
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
      object RepTotCommLbl: TQRLabel
        Left = 741
        Top = 16
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          1960.562500000000000000
          42.333333333333330000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'RepTotCommLbl'
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
      object QRShape4: TQRShape
        Left = 723
        Top = 2
        Width = 118
        Height = 9
        Size.Values = (
          23.812500000000000000
          1912.937500000000000000
          5.291666666666667000
          312.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 631
        Top = 2
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1669.520833333330000000
          5.291666666666670000
          489.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRDtlBnd: TQRBand
      Left = 38
      Top = 201
      Width = 1047
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 201
      Width = 1047
      Height = 0
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRDtlBnd
      PrintOrder = cboAfterParent
    end
    object qrgrpCategory: TQRGroup
      Left = 38
      Top = 169
      Width = 1047
      Height = 32
      AlignToBottom = False
      BeforePrint = qrgrpCategoryBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qrySalesComm.Category'
      FooterBand = QRBndProdCatGrpFoot
      Master = qckrpSalesByInv
      ReprintOnNewPage = False
      object qrdbtxtCategory: TQRDBText
        Left = 24
        Top = 8
        Width = 159
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          21.166666666666670000
          420.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'qrySalesComm.Description'
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBndProdCatGrpFoot: TQRBand
      Left = 38
      Top = 241
      Width = 1047
      Height = 0
      AfterPrint = QRBndProdCatGrpFootAfterPrint
      AlignToBottom = False
      BeforePrint = QRBndProdCatGrpFootBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object QRGrpInv: TQRGroup
      Left = 38
      Top = 201
      Width = 1047
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qrySalesComm.Sales_Invoice_No'
      FooterBand = QRBndInvGrpFoot
      Master = qckrpSalesByInv
      ReprintOnNewPage = False
    end
    object QRBndInvGrpFoot: TQRBand
      Left = 38
      Top = 201
      Width = 1047
      Height = 40
      AfterPrint = QRBndInvGrpFootAfterPrint
      AlignToBottom = False
      BeforePrint = QRBndInvGrpFootBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrdbtxtCustomer: TQRDBText
        Left = 32
        Top = 3
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666670000
          7.937500000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Name'
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
      object qrdbtxtCustsDesc: TQRDBText
        Left = 32
        Top = 20
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666670000
          52.916666666666670000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Invoice_Description'
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
      object qrdbtxtAccCode: TQRDBText
        Left = 332
        Top = 3
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          878.416666666666700000
          7.937500000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Account_Code'
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
      object TotGoodsQRLbl: TQRLabel
        Left = 391
        Top = 3
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          1034.520833333333000000
          7.937500000000000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotGoodsQRLbl'
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
      object TotCstQRLbl: TQRLabel
        Left = 507
        Top = 3
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          7.937500000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object MargQRLbl: TQRLabel
        Left = 579
        Top = 3
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1531.937500000000000000
          7.937500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MargQRLbl'
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
      object qrdbtxtInvDate: TQRDBText
        Left = 656
        Top = 3
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          7.937500000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Invoice_Date'
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
      object Commissionlbl: TQRLabel
        Left = 765
        Top = 3
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          2024.062500000000000000
          7.937500000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Commissionlbl'
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
      object qrlblCommSplit: TQRLabel
        Left = 976
        Top = 3
        Width = 65
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          2582.333333333333000000
          7.937500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblCommSplit'
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
      object qrlblInvoice: TQRLabel
        Left = 264
        Top = 3
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          7.937500000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblInvoice'
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
      object qrlblCommRate: TQRLabel
        Left = 688
        Top = 3
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          7.937500000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCommRate'
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
    object qrbCategoryFooter: TQRChildBand
      Left = 38
      Top = 241
      Width = 1047
      Height = 40
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBndProdCatGrpFoot
      PrintOrder = cboAfterParent
      object QRLabel4: TQRLabel
        Left = 344
        Top = 16
        Width = 35
        Height = 20
        Size.Values = (
          52.916666666666670000
          910.166666666666700000
          42.333333333333330000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
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
      object QRLblTotPrdGoods: TQRLabel
        Left = 397
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRLblTotPrdCst: TQRLabel
        Left = 485
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1283.229166666667000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRLblTotPrdMrg: TQRLabel
        Left = 581
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          42.333333333333340000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object QRShape5: TQRShape
        Left = 336
        Top = 0
        Width = 505
        Height = 9
        Size.Values = (
          23.812500000000000000
          889.000000000000000000
          0.000000000000000000
          1336.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object TotCatCommLbl: TQRLabel
        Left = 753
        Top = 16
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1992.312500000000000000
          42.333333333333330000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCommLbl'
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
    object qrbRepTotals: TQRChildBand
      Left = 38
      Top = 286
      Width = 1047
      Height = 40
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = RepGrpFoot
      PrintOrder = cboAfterParent
      object QRShape1: TQRShape
        Left = 336
        Top = 0
        Width = 297
        Height = 9
        Size.Values = (
          23.812500000000000000
          889.000000000000000000
          0.000000000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 320
        Top = 16
        Width = 59
        Height = 20
        Size.Values = (
          52.916666666666670000
          846.666666666666700000
          42.333333333333330000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep Totals'
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
      object TotalGoodsLbl: TQRLabel
        Left = 397
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object TotalCostLbl: TQRLabel
        Left = 485
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1283.229166666667000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object GrpMargQRLbl: TQRLabel
        Left = 581
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          42.333333333333340000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object TotalCommLbl: TQRLabel
        Left = 753
        Top = 16
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1992.312500000000000000
          42.333333333333330000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCommLbl'
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
      object QRShape3: TQRShape
        Left = 737
        Top = 0
        Width = 106
        Height = 9
        Size.Values = (
          23.812500000000000000
          1949.979166666667000000
          0.000000000000000000
          280.458333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRChldBndCatSumm: TQRChildBand
      Left = 38
      Top = 366
      Width = 1047
      Height = 24
      AfterPrint = QRChldBndCatSummAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBndProdCatGrpFoot
      PrintOrder = cboAfterParent
      object QRLblTotPrdGoodsSumm: TQRLabel
        Left = 397
        Top = 2
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1050.395833333333000000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRLblTotPrdCstSumm: TQRLabel
        Left = 485
        Top = 2
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1283.229166666667000000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRLblTotPrdMrgSumm: TQRLabel
        Left = 581
        Top = 2
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          5.291666666666667000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object TotalCommLblProdSumm: TQRLabel
        Left = 753
        Top = 2
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1992.312500000000000000
          5.291666666666667000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCommLbl'
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
      object QRLabelComm: TQRLabel
        Left = 691
        Top = 2
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1828.270833333333000000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblCat'
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
      object qrlblBonus: TQRLabel
        Left = 899
        Top = 2
        Width = 73
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          2378.604166666667000000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblCat'
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
      object TotalBonusProdSumm: TQRLabel
        Left = 976
        Top = 2
        Width = 67
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          2582.333333333333000000
          5.291666666666667000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCommLbl'
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
      object qrdbTxtCategoryFooter: TQRDBText
        Left = 108
        Top = 3
        Width = 133
        Height = 17
        Size.Values = (
          44.979166666666670000
          285.750000000000000000
          7.937500000000000000
          351.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySalesComm
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrbRepSummary: TQRChildBand
      Left = 38
      Top = 390
      Width = 1047
      Height = 96
      AfterPrint = qrbRepSummaryAfterPrint
      AlignToBottom = False
      BeforePrint = qrbRepSummaryBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        254.000000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = RepGrpFoot
      PrintOrder = cboAfterParent
      object TotalGoodsLblRepSumm: TQRLabel
        Left = 397
        Top = 32
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1050.395833333333000000
          84.666666666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object TotalCostLblRepSumm: TQRLabel
        Left = 485
        Top = 32
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1283.229166666667000000
          84.666666666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object GrpMargQRLblRepSumm: TQRLabel
        Left = 581
        Top = 32
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          84.666666666666680000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object TotalCommLblRepSumm: TQRLabel
        Left = 755
        Top = 32
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1997.604166666667000000
          84.666666666666670000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCommLbl'
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
      object QRShape6: TQRShape
        Left = 400
        Top = 2
        Width = 441
        Height = 9
        Size.Values = (
          23.812500000000000000
          1058.333333333333000000
          5.291666666666667000
          1166.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblBudgetTO: TQRLabel
        Left = 397
        Top = 11
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1050.395833333333000000
          29.104166666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object qrlblBudgetProfit: TQRLabel
        Left = 581
        Top = 11
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          29.104166666666670000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object QRLabel20: TQRLabel
        Left = 296
        Top = 11
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          783.166666666666700000
          29.104166666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Budget'
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
      object QRLabel21: TQRLabel
        Left = 301
        Top = 32
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          796.395833333333300000
          84.666666666666670000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Actual'
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
      object QRLabel24: TQRLabel
        Left = 277
        Top = 58
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          732.895833333333300000
          153.458333333333300000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Difference'
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
      object QRLabel25: TQRLabel
        Left = 325
        Top = 74
        Width = 10
        Height = 17
        Size.Values = (
          44.979166666666670000
          859.895833333333300000
          195.791666666666700000
          26.458333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '%'
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
      object qrlblTODiff: TQRLabel
        Left = 397
        Top = 57
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1050.395833333333000000
          150.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object qrlblTODiffPerc: TQRLabel
        Left = 397
        Top = 74
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1050.395833333333000000
          195.791666666666700000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object qrlblProfitDiff: TQRLabel
        Left = 581
        Top = 57
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          150.812500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object qrlblProfitDiffPerc: TQRLabel
        Left = 565
        Top = 74
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1494.895833333333000000
          195.791666666666700000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRShape8: TQRShape
        Left = 335
        Top = 46
        Width = 508
        Height = 10
        Size.Values = (
          26.458333333333330000
          886.354166666666800000
          121.708333333333300000
          1344.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qrySalesComm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        '// this sql is built from the selection screen from a const sql ' +
        'core'
      'SELECT DISTINCT Sales_Invoice.Customer,'
      '    Sales_Invoice.Branch_no,'
      '    Sales_Invoice_Line.Qty_Invoiced,'
      '    Sales_Invoice.Sales_Invoice,'
      '    Customer_Branch.Account_Code,'
      '    Customer.Name,'
      '    Rep.Name AS Rep_Name,'
      '    Sales_Invoice.Sales_Invoice_No,'
      '    Sales_Invoice_Line.Invoice_Line_No,'
      '    Sales_Invoice_Line.Goods_Value,'
      '    Sales_Invoice.Sales_invoice_type,'
      '    Sales_Invoice_Line.Vat_Value,'
      
        '    Sales_Invoice_Line.Goods_Value+Sales_Invoice_Line.Vat_Value ' +
        'AS Goods_Total,'
      '    Sales_Invoice.Invoice_Date,'
      '    Sales_Invoice.Invoice_or_Credit,'
      '    Sales_Invoice.Paid_Date,'
      '    Sales_Invoice.Paid_Amount,'
      '    Sales_Invoice.Paid_Status,'
      '    Rep.Commission_Rate,'
      '    Sales_Invoice.Reference,'
      '    (select Reps_Branches.Percentage'
      '    from Reps_branches'
      '    where Reps_branches.customer = sales_invoice.customer and'
      '          Reps_branches.branch_no = sales_invoice.branch_no and'
      
        '          Reps_branches.rep = sales_invoice.rep) as Rep_Responsi' +
        'bility,'
      '    Sales_Invoice.Invoice_Description,'
      '    Product_Type.Category,'
      '    Product_Type.Product_Type,'
      '    Price_Unit.Price_Unit_Factor'
      
        'FROM Price_Unit INNER JOIN (Customer INNER JOIN (Product_Type RI' +
        'GHT JOIN ((Rep INNER JOIN (Customer_Branch INNER JOIN Sales_Invo' +
        'ice ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch)' +
        ' AND (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer))' +
        ' ON Rep.Rep = Sales_Invoice.Rep) INNER JOIN Sales_Invoice_Line O' +
        'N Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice' +
        ') ON Product_Type.Product_Type = Sales_Invoice_Line.Product_Type' +
        ') ON Customer.Customer = Customer_Branch.Customer) ON Price_Unit' +
        '.Price_Unit = Sales_Invoice_Line.Price_Unit'
      
        'ORDER BY Rep.Name, Product_Type.Category, Sales_Invoice.Sales_In' +
        'voice;'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 27
    Top = 16
  end
  object GetCommRtQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from category'
      'where category = :category')
    Left = 166
    Top = 110
    ParamData = <
      item
        Name = 'category'
      end>
  end
  object qryRepFinance: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Rep_Financial'
      'where Rep = :Rep and'
      'Financial_Year = :Financial_Year')
    Left = 286
    Top = 105
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end>
  end
  object qryGetRepComm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep_Financial'
      'where Rep = :Rep and Financial_Year = :Financial_Year')
    Left = 294
    Top = 161
    ParamData = <
      item
        Name = 'rep'
      end
      item
        Name = 'Financial_year'
      end>
  end
  object qryGetRepBudget: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Rep_Budget'
      'where'
      'Rep = :Rep AND'
      'Period = :Period')
    Left = 288
    Top = 56
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Period'
      end>
  end
end
