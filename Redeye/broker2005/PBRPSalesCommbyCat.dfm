object PBRPSalesCommbyCatFrm: TPBRPSalesCommbyCatFrm
  Left = 0
  Top = 101
  Caption = 'Reps Commission report'
  ClientHeight = 557
  ClientWidth = 1111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByInv: TQuickRep
    Left = 8
    Top = -56
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
      Height = 91
      Frame.DrawBottom = True
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
      object qrlblTitle: TQRLabel
        Left = 398
        Top = 8
        Width = 250
        Height = 23
        Size.Values = (
          60.854166666666670000
          1053.041666666667000000
          21.166666666666670000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales Invoice Commission '
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
        Top = 56
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          148.166666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 272
        Top = 56
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          719.666666666666700000
          148.166666666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 72
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          190.500000000000000000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of Job'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 408
        Top = 56
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          1079.500000000000000000
          148.166666666666700000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Goods Total'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 656
        Top = 56
        Width = 20
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          148.166666666666700000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 502
        Top = 56
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          148.166666666666700000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblDateRange: TQRLabel
        Left = 444
        Top = 32
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666670000
          1174.750000000000000000
          84.666666666666670000
          418.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Payments Dated from: '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 925
        Top = 8
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          2447.395833333333000000
          21.166666666666670000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 989
        Top = 8
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          2616.729166666667000000
          21.166666666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 656
        Top = 72
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          190.500000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 272
        Top = 72
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          719.666666666666700000
          190.500000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 340
        Top = 56
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          899.583333333333300000
          148.166666666666700000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 340
        Top = 72
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          899.583333333333300000
          190.500000000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Code'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object MarginQRLabel: TQRLabel
        Left = 597
        Top = 56
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          1579.562500000000000000
          148.166666666666700000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblPayment: TQRLabel
        Left = 736
        Top = 56
        Width = 58
        Height = 33
        Size.Values = (
          87.312500000000000000
          1947.333333333330000000
          148.166666666667000000
          153.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Payment Date'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 827
        Top = 72
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          2188.104166666667000000
          190.500000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Commission'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 658
        Top = 56
        Width = 137
        Height = 33
        Size.Values = (
          87.312500000000000000
          1740.958333333330000000
          148.166666666667000000
          362.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Invoice   Credit            count      count'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 931
        Top = 52
        Width = 110
        Height = 17
        Size.Values = (
          44.979166666666670000
          2463.270833333333000000
          137.583333333333300000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '-- Commission --'
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
      object QRLabel11: TQRLabel
        Left = 939
        Top = 70
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          2484.437500000000000000
          185.208333333333300000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Rate'
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
      object QRLabel12: TQRLabel
        Left = 995
        Top = 70
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          2632.604166666667000000
          185.208333333333300000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Type'
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
    object RepGrpFoot: TQRBand
      Left = 38
      Top = 273
      Width = 1047
      Height = 0
      AfterPrint = RepGrpFootAfterPrint
      AlignToBottom = False
      BeforePrint = RepGrpFootBeforePrint
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
    object RepQRGroup: TQRGroup
      Left = 38
      Top = 129
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
        Width = 153
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          21.166666666666700000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
    object QRBand2: TQRBand
      Left = 38
      Top = 313
      Width = 1047
      Height = 40
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
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
        Left = 565
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          42.333333333333300000
          171.979166666667000000)
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
        Left = 809
        Top = 16
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          2140.479166666667000000
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
        Left = 803
        Top = 2
        Width = 105
        Height = 9
        Size.Values = (
          23.812500000000000000
          2124.604166666670000000
          5.291666666666670000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblTotInv: TQRLabel
        Left = 656
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1735.666666666670000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRlblNoOfInv'
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
      object QRLblTotCred: TQRLabel
        Left = 704
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1862.666666666670000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblNoOfCreds'
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
      Top = 193
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
      Top = 193
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
    object QRGroupProdCat: TQRGroup
      Left = 38
      Top = 161
      Width = 1047
      Height = 32
      AlignToBottom = False
      BeforePrint = QRGroupProdCatBeforePrint
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
      object lblCommission: TQRLabel
        Left = 8
        Top = 8
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Commission rate:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBndProdCatGrpFoot: TQRBand
      Left = 38
      Top = 233
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
      Top = 193
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
      Top = 193
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
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666670000
          7.937500000000000000
          92.604166666666670000)
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
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
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
      object QRDBText2: TQRDBText
        Left = 258
        Top = 3
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          682.625000000000000000
          7.937500000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'InvoiceRef'
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
        Left = 348
        Top = 3
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          920.750000000000000000
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
        Left = 508
        Top = 3
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666700000
          1344.083333333330000000
          7.937500000000000000
          153.458333333333000000)
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
        Left = 565
        Top = 3
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          7.937500000000000000
          171.979166666667000000)
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
      object lblPaidDate: TQRDBText
        Left = 736
        Top = 3
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1947.333333333333000000
          7.937500000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Paid_Date'
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
        Left = 819
        Top = 3
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          2166.937500000000000000
          7.937500000000000000
          224.895833333333300000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCommSplit: TQRLabel
        Left = 912
        Top = 3
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          2413.000000000000000000
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
    end
    object ChildBand2: TQRChildBand
      Left = 38
      Top = 233
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
        Left = 565
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          42.333333333333300000
          171.979166666667000000)
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
    end
    object ChildBand3: TQRChildBand
      Left = 38
      Top = 273
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
        Left = 565
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          42.333333333333300000
          171.979166666667000000)
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
        Left = 820
        Top = 16
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          2169.583333333333000000
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
        Left = 803
        Top = 0
        Width = 106
        Height = 9
        Size.Values = (
          23.812500000000000000
          2124.604166666670000000
          0.000000000000000000
          280.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRChldBndCatSumm: TQRChildBand
      Left = 38
      Top = 353
      Width = 1047
      Height = 25
      AfterPrint = QRChldBndCatSummAfterPrint
      AlignToBottom = False
      BeforePrint = QRChldBndCatSummBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBndProdCatGrpFoot
      PrintOrder = cboAfterParent
      object QRLblCat: TQRLabel
        Left = 8
        Top = 5
        Width = 271
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          13.229166666666700000
          717.020833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object QRLblTotPrdGoodsSumm: TQRLabel
        Left = 397
        Top = 5
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1050.395833333333000000
          13.229166666666670000
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
        Top = 5
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1283.229166666667000000
          13.229166666666670000
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
        Left = 565
        Top = 5
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          13.229166666666700000
          171.979166666667000000)
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
      object QRlblNoOfInv: TQRLabel
        Left = 656
        Top = 5
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1735.666666666670000000
          13.229166666666700000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRlblNoOfInv'
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
      object QRLblNoOfCreds: TQRLabel
        Left = 704
        Top = 5
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1862.666666666670000000
          13.229166666666700000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblNoOfCreds'
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
        Left = 820
        Top = 5
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          2169.583333333333000000
          13.229166666666670000
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
        Left = 897
        Top = 5
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          2373.312500000000000000
          13.229166666666670000
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
      object QRLabelCommType: TQRLabel
        Left = 984
        Top = 5
        Width = 57
        Height = 18
        Size.Values = (
          47.625000000000000000
          2603.500000000000000000
          13.229166666666670000
          150.812500000000000000)
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
    end
    object QRChldBndRepSumm: TQRChildBand
      Left = 38
      Top = 378
      Width = 1047
      Height = 40
      AfterPrint = QRChldBndRepSummAfterPrint
      AlignToBottom = False
      BeforePrint = QRChldBndRepSummBeforePrint
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
      object TotalGoodsLblRepSumm: TQRLabel
        Left = 397
        Top = 16
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
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
      object TotalCostLblRepSumm: TQRLabel
        Left = 485
        Top = 16
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
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
      object GrpMargQRLblRepSumm: TQRLabel
        Left = 565
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          42.333333333333300000
          171.979166666667000000)
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
      object QRLblInvRep: TQRLabel
        Left = 656
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1735.666666666670000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRlblNoOfInv'
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
      object QRlblCredRep: TQRLabel
        Left = 704
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1862.666666666670000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblNoOfCreds'
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
        Left = 820
        Top = 16
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          2169.583333333333000000
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
      object QRShape6: TQRShape
        Left = 400
        Top = 2
        Width = 503
        Height = 9
        Size.Values = (
          23.812500000000000000
          1058.333333333330000000
          5.291666666666670000
          1330.854166666670000000)
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
      '    Rep.Rep,'
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
    object qrySalesCommCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesCommBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesCommSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesCommAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qrySalesCommName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesCommRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesCommSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesCommGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object qrySalesCommVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object qrySalesCommGoods_Total: TCurrencyField
      FieldName = 'Goods_Total'
    end
    object qrySalesCommInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesCommInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesCommPaid_Date: TDateTimeField
      FieldName = 'Paid_Date'
    end
    object qrySalesCommPaid_Amount: TCurrencyField
      FieldName = 'Paid_Amount'
    end
    object qrySalesCommPaid_Status: TStringField
      FieldName = 'Paid_Status'
      FixedChar = True
      Size = 2
    end
    object qrySalesCommCommission_Rate: TFloatField
      FieldName = 'Commission_Rate'
    end
    object qrySalesCommReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesCommInvoice_Description: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesCommInvoiceRef: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      OnGetText = qrySalesCommInvoiceRefGetText
      Calculated = True
    end
    object qrySalesCommSales_Invoice_type: TStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesCommInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qrySalesCommCategory: TIntegerField
      FieldName = 'Category'
    end
    object qrySalesCommPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qrySalesCommQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qrySalesCommRep_Responsibility: TFloatField
      FieldName = 'Rep_Responsibility'
    end
    object qrySalesCommRep: TIntegerField
      FieldName = 'Rep'
    end
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 88
    Top = 14
    ParamData = <
      item
        Name = 'PurchOrder'
        DataType = ftFloat
      end>
  end
  object GetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '      Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor ' +
        'as Order_Unit_Factor'
      
        'FROM Price_Unit INNER JOIN (Purchase_OrderLine INNER JOIN (Sales' +
        '_Invoice'
      
        '  INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice =' +
        ' Sales_Invoice_Line.Sales_Invoice) ON (Purchase_OrderLine.Line =' +
        ' Sales_Invoice_Line.Line) AND (Purchase_OrderLine.Purchase_Order' +
        ' = Sales_Invoice_Line.Purchase_Order)) ON (Price_Unit.Price_Unit' +
        ' = Purchase_OrderLine.Order_Unit)'
      '  WHERE ((Sales_Invoice.Sales_Invoice = :Invoice_No) and'
      '    (Sales_Invoice_Line.Invoice_Line_No = :Line_No));'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 184
    Top = 40
    ParamData = <
      item
        Name = 'invoice_no'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qryGetPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purch_Ord.Purch_Ord, '
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      'from Sales_invoice_line, Sales_order, Purch_Ord, Purch_Ord_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and '
      '(Sales_Invoice_Line.Sales_order = Sales_Order.Sales_order) and'
      '(Sales_Order.Sales_Order = Purch_Ord.Sales_order) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No)  and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_Invoice_Line.Sales_ord' +
        'er_Line_no)'
      ')'
      'Group By'
      'Purch_Ord.Purch_Ord'
      ' '
      ' '
      ' ')
    Left = 320
    Top = 128
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qryGetSOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Part_Cost*((Sales_invoice_line.Qty_Invoiced*1.0000)/(' +
        'Purch_Pack_Quantity*1.0000))) as Total_Cost'
      'from Sales_Order_Line, Sales_invoice_line'
      'where Sales_invoice_line.Sales_Order = :Sales_Order and'
      'Sales_invoice_line.Sales_invoice = :Sales_invoice and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No) and'
      '('
      
        '(Sales_invoice_line.Sales_order = Sales_order_line.sales_order) ' +
        'and'
      
        '(Sales_invoice_line.Sales_order_line_no = Sales_order_line.Sales' +
        '_order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 200
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_invoice'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qryAddPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Cost'
      'from Purch_Ord_add_charge'
      '  where (Purch_Ord_Add_Charge.Purch_Ord = :Purch_Ord) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 384
    Top = 54
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object oldqryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Dets.Job_Bag,'
      #9'sum(Job_Bag_Line_Dets.Job_Bag_Line_Cost) as Total_Cost'
      'from Job_Bag_Line_Dets, Sales_invoice_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '('
      '(Sales_invoice_Line.Job_Bag = Job_Bag_Line_Dets.Job_Bag) and'
      
        '(Sales_invoice_Line.Job_Bag_Line = Job_Bag_Line_Dets.Job_Bag_Lin' +
        'e)'
      ')'
      'group by'
      #9'Job_Bag_Line_Dets.Job_Bag'
      ' ')
    Left = 318
    Top = 268
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Sum(Amount)'
      '         from Purch_ord_line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Sales_Inv' +
        'oice_Line.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Sales_Invoice_Line.' +
        'Line) as Extra_Cost'
      'FROM Price_Unit'
      '     RIGHT JOIN (Purchase_OrderLine'
      '     RIGHT JOIN (Job_Bag_Line_Dets'
      '     INNER JOIN Sales_Invoice_Line ON'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line) AND'
      
        '        (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_Bag)' +
        ') ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'WHERE ((Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice) and'
      '    (Sales_Invoice_Line.Invoice_Line_No = :Line_No));'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 312
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qryGetProdCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Order_Price,'
      '        Price_unit_Factor as Order_unit_Factor,'
      '        Quantity'
      'from Purchase_OrderLine, Price_Unit'
      'where Purchase_Order = :Purchase_Order AND'
      'Line = :Line AND'
      '(Purchase_OrderLine.Order_unit = Price_unit.Price_Unit)'
      ' ')
    Left = 555
    Top = 94
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryCreditLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor as Invoice_Unit_Factor,'
      '        Sales_Invoice_Line.Cost_Price,'
      '        Sales_Invoice_Line.Purchase_order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_bag_Line,'
      '        Sales_Invoice_Line.Credit_Type'
      'FROM Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE ((Sales_Invoice_Line.Sales_Invoice = :Invoice_No) and'
      '    (Sales_Invoice_Line.Invoice_Line_No = :Line_No))'
      ''
      ' '
      ' ')
    Left = 70
    Top = 142
    ParamData = <
      item
        Name = 'Invoice_No'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qryGetJBCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_Dets.Job_Bag_Line_Cost'
      'FROM Job_Bag_Line_Dets'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      'Job_Bag_Line_Dets.Job_Bag_line = :Job_Bag_Line'
      ' ')
    Left = 556
    Top = 264
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetSOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Sales_Order_line.Part_Cost,'
      '        Sales_Order_line.Purch_Pack_Quantity'
      'FROM Sales_Order_line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' ')
    Left = 624
    Top = 208
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetPOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  Purch_Ord.Purch_Ord,'
      '  Purch_Ord.Purch_ord_no,'
      '  Purch_ord_Line.Purch_Pack_Quantity,'
      '  Purch_ord_Line.Purchase_Price'
      'from Sales_order_Line, Purch_Ord, Purch_Ord_Line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ') and'
      '(Sales_Order_Line.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_order_line.Sales_order' +
        '_Line_no)'
      ')'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 552
    Top = 152
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
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
  object QryInvAddChrg: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Add_Chrg'
      'from Sales_Invoice_Add_charge'
      
        '  where (Sales_Invoice_Add_Charge.Sales_Invoice = :Sales_Invoice' +
        ')'
      ' ')
    Left = 254
    Top = 78
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetRepCatComm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep_Financial_Cat'
      
        'where rep = :rep and Financial_year = :Financial_year and Catego' +
        'ry = :Category')
    Left = 294
    Top = 161
    ParamData = <
      item
        Name = 'rep'
      end
      item
        Name = 'Financial_year'
      end
      item
        Name = 'Category'
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
end
