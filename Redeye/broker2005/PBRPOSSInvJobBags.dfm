object PBRPOSSInvJobBagsFrm: TPBRPOSSInvJobBagsFrm
  Left = 2
  Top = 115
  Caption = 'Oustanding Invoicing Report'
  ClientHeight = 540
  ClientWidth = 1192
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object qrReport: TQuickRep
    Left = 0
    Top = 0
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrReportBeforePrint
    DataSet = qryOSInvs
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
      Height = 123
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        325.437500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 297
        Top = 8
        Width = 453
        Height = 23
        Size.Values = (
          60.854166666666670000
          785.812500000000000000
          21.166666666666670000
          1198.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Oustanding Job Bag Invoicing Report - Run Date '
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
      object QRLabel13: TQRLabel
        Left = 933
        Top = 8
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          2468.562500000000000000
          21.166666666666670000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
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
        Left = 989
        Top = 8
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666670000
          2616.729166666667000000
          21.166666666666670000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 104
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          275.166666666666700000
          121.708333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
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
        Left = 839
        Top = 88
        Width = 50
        Height = 33
        Size.Values = (
          87.312500000000000000
          2219.854166666667000000
          232.833333333333300000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Selling Price'
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
      object QRLabel1: TQRLabel
        Left = 136
        Top = 104
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          359.833333333333400000
          275.166666666666700000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
        Left = 72
        Top = 104
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          275.166666666666700000
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
      object QRLabel3: TQRLabel
        Left = 904
        Top = 104
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          2391.833333333333000000
          275.166666666666700000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sell Unit'
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
        Left = 288
        Top = 104
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          762.000000000000000000
          275.166666666666700000
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
        Left = 688
        Top = 88
        Width = 57
        Height = 33
        Size.Values = (
          87.312500000000000000
          1820.333333333333000000
          232.833333333333400000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Order Quantity'
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
        Left = 760
        Top = 88
        Width = 65
        Height = 33
        Size.Values = (
          87.312500000000000000
          2010.833333333333000000
          232.833333333333400000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Quantity to Invoice'
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
        Left = 970
        Top = 104
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          2566.458333333333000000
          275.166666666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Price'
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
      object qrlblSelection: TQRLabel
        Left = 496
        Top = 34
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          89.958333333333330000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Selection'
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
      object qrlblInclude: TQRLabel
        Left = 502
        Top = 52
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          137.583333333333300000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Include'
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
        Left = 632
        Top = 104
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          275.166666666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order no.'
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
        Left = 520
        Top = 104
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1375.833333333333000000
          275.166666666666700000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required'
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 230
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
      Master = qrReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object RepQRGroup: TQRGroup
      Left = 38
      Top = 230
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
      Expression = 'qrySalesComm.Name'
      Master = QRSubDetail1
      ReprintOnNewPage = False
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 209
      Width = 1047
      Height = 1
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2.645833333333333000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 289
      Width = 1047
      Height = 28
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel21: TQRLabel
        Left = 760
        Top = 8
        Width = 87
        Height = 16
        Size.Values = (
          42.333333333333340000
          2010.833333333333000000
          21.166666666666670000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reports Totals:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 911
        Top = -4
        Width = 123
        Height = 13
        Size.Values = (
          34.395833333333300000
          2410.354166666670000000
          -10.583333333333300000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblReportTotal: TQRLabel
        Left = 944
        Top = 8
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          2497.666666666667000000
          21.166666666666670000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportTotal'
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
    object repQRGroup1: TQRGroup
      Left = 38
      Top = 161
      Width = 1047
      Height = 32
      AlignToBottom = False
      BeforePrint = repQRGroup1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryOSInvs.rep_name'
      FooterBand = qrGroupFooter
      Master = qrReport
      ReprintOnNewPage = False
      object qrlblGroupTitle: TQRLabel
        Left = 9
        Top = 8
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          21.166666666666670000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'REP'
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
      object qrdbGroupName: TQRDBText
        Left = 88
        Top = 8
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          21.166666666666670000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'rep_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
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
    object qrGroupFooter: TQRBand
      Left = 38
      Top = 261
      Width = 1047
      Height = 28
      AfterPrint = qrGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblGroupTotal: TQRLabel
        Left = 947
        Top = 6
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          2505.604166666667000000
          15.875000000000000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGroupTotal'
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
        Left = 911
        Top = -4
        Width = 123
        Height = 13
        Size.Values = (
          34.395833333333300000
          2410.354166666670000000
          -10.583333333333300000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblFooter: TQRLabel
        Left = 848
        Top = 8
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          2243.666666666667000000
          21.166666666666670000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblFooter'
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
    object QRChildBandProd: TQRChildBand
      Left = 38
      Top = 210
      Width = 1047
      Height = 20
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      PrintOrder = cboAfterParent
      object QRDBText4: TQRDBText
        Left = 8
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          0.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Job_Bag'
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
        Left = 72
        Top = 0
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          0.000000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Date_point'
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
        Left = 136
        Top = 0
        Width = 145
        Height = 17
        Size.Values = (
          44.979166666666700000
          359.833333333333000000
          0.000000000000000000
          383.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Customer_Name'
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
        Left = 288
        Top = 0
        Width = 241
        Height = 17
        Size.Values = (
          44.979166666666700000
          762.000000000000000000
          0.000000000000000000
          637.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Job_Bag_Line_Descr'
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
      object qrlblQtyToInv: TQRLabel
        Left = 760
        Top = 0
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          2010.833333333333000000
          0.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQtyToInv'
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
      object qrlblSalesValue: TQRLabel
        Left = 958
        Top = 0
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          2534.708333333333000000
          0.000000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSalesValue'
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
        Left = 656
        Top = 0
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          0.000000000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Job_Bag_Quantity'
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
      object qrlblSellUnit: TQRLabel
        Left = 896
        Top = 0
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2370.666666666667000000
          0.000000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSellUnit'
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
      object QRDBText7: TQRDBText
        Left = 519
        Top = 0
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1373.187500000000000000
          0.000000000000000000
          216.958333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Goods_Required'
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
      object qrlblSellingPrice: TQRLabel
        Left = 812
        Top = 0
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          2148.416666666667000000
          0.000000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSellingPrice'
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
      object qrlblOrderNo: TQRLabel
        Left = 618
        Top = 0
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1635.125000000000000000
          0.000000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblOrderNo'
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
    object QRGroup1: TQRGroup
      Left = 38
      Top = 193
      Width = 1047
      Height = 16
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryOSInvs.job_bag'
      FooterBand = qrJBGroupFooter
      Master = qrReport
      ReprintOnNewPage = False
    end
    object qrJBGroupFooter: TQRBand
      Left = 38
      Top = 230
      Width = 1047
      Height = 31
      AlignToBottom = False
      BeforePrint = qrJBGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblJBFooter: TQRLabel
        Left = 835
        Top = 8
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          2209.270833333333000000
          21.166666666666670000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblJBFooter'
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
      object qrlblJBTotal: TQRLabel
        Left = 968
        Top = 6
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          2561.166666666667000000
          15.875000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblJBTotal'
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
        Left = 911
        Top = -4
        Width = 123
        Height = 13
        Size.Values = (
          34.395833333333300000
          2410.354166666670000000
          -10.583333333333300000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryOSInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purchase_OrderLine.Purchase_Order,'
      'Purchase_OrderLine.Line,'
      'Purchase_OrderLine.Customer,'
      'Purchase_OrderLine.Branch_no,'
      'Purchase_OrderLine.Quantity,'
      'Purchase_OrderLine.Selling_Price,'
      'Purchase_OrderLine.Sell_Unit,'
      'Purchase_OrderLine.Supp_Inv_Recd,'
      'Purchase_OrderLine.Customers_Desc,'
      'Purchase_OrderLine.Qty_Invoiced,'
      '(select sum(Qty_Delivered)'
      ' from Delivery_Detail'
      
        ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      '   and Delivery_Detail.Line = Purchase_OrderLine.Line'
      '   and ((Delivery_Detail.delivery_to_Stock is null) or'
      '        (Delivery_Detail.delivery_to_Stock = '#39'N'#39'))'
      ') as Qty_Delivered,'
      '(select sum(Qty_Delivered)'
      ' from Delivery_Detail'
      
        ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order'
      '   and Delivery_Detail.Line = Purchase_OrderLine.Line'
      ') as Total_Delivered,'
      'Customer.Name as Customer_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'Purch_Ord_Line_Status.Description as Status_Description,'
      'Vat_code.Vat_Rate,'
      'Customer.Vat_Code_Def as Customer_Vat_Code,'
      'Purchase_Order.Currency_Code,'
      'Price_Unit.Description as Sales_Unit_Desc,'
      'Price_Unit.Price_Unit_Factor,'
      'Customer_Branch.Inv_to_Customer,'
      'Customer_Branch.Inv_to_Branch,'
      'Purchase_order.Date_point,'
      'Rep.name as rep_name,'
      '(select Job_Bag from Job_Bag_Line_Dets'
      
        'where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLine.Purc' +
        'hase_Order) as Job_Bag'
      'FROM'
      '((((((Purchase_OrderLine'
      
        'INNER JOIN Purch_Ord_Line_Status on (Purchase_OrderLine.Purch_Or' +
        'd_Line_Status = Purch_Ord_Line_Status.Purch_Ord_Line_Status))'
      
        'INNER JOIN Customer on (Purchase_OrderLine.Customer = Customer.C' +
        'ustomer))'
      
        'INNER JOIN Customer_Branch on ((Purchase_OrderLine.Customer = Cu' +
        'stomer_Branch.Customer) AND'
      
        '                               (Purchase_OrderLine.Branch_no = C' +
        'ustomer_Branch.Branch_no)))'
      
        'INNER JOIN VAT_Code on (Customer.VAT_Code_Def = VAT_Code.VAT_Cod' +
        'e))'
      
        'INNER JOIN Purchase_Order on (Purchase_OrderLine.Purchase_Order ' +
        '= Purchase_Order.Purchase_Order))'
      
        'INNER JOIN Price_Unit on (Purchase_OrderLine.Sell_Unit = Price_U' +
        'nit.Price_Unit))'
      'INNER JOIN Rep on (Purchase_orderline.rep = rep.rep)'
      'WHERE  (((Delivery_Detail.Delivery_to_Stock)<>'#39'Y'#39') And'
      '        ((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<25) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null)) Or'
      '        (((Purchase_OrderLine.Purch_Ord_Line_Status)>=21 And'
      '        (Purchase_OrderLine.Purch_Ord_Line_Status)<25) And'
      '        ((Purchase_OrderLine.Selling_Price)<>0) And'
      '        ((Purchase_OrderLine.Calloff_Invoiced_upfront)='#39'N'#39' Or'
      
        '        (Purchase_OrderLine.Calloff_Invoiced_upfront) Is Null) A' +
        'nd'
      '        ((Delivery_Detail.Qty_Delivered)>0) And'
      '        ((Purchase_OrderLine.Inactive)<>'#39'Y'#39' Or'
      '        (Purchase_OrderLine.Inactive) Is Null) And'
      '        ((Purchase_OrderLine.Invoice_upfront)='#39'Y'#39'))'
      ''
      ''
      ' '
      ''
      ' '
      ''
      ' '
      ''
      ' ')
    Left = 39
    Top = 8
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Job_Bag.Job_Bag,'
      #9'Job_Bag_Line_Dets.Job_Bag_Line,'
      #9'Job_Bag.Date_Point, '
      '                Job_Bag.Goods_Required,'
      #9'Job_Bag.Job_Bag_Descr, '
      #9'Customer.Name as Customer_Name, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Descr, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Type, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Cost, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Sell, '
      #9'Job_Bag_Line_Dets.Job_Bag_Quantity, '
      #9'Job_Bag_Line_Dets.price_unit,'
      #9'Job_Bag_Line_Dets.selling_price,'
      #9'Price_Unit.Description as Price_Unit_Description,'
      #9'Price_Unit.Price_Unit_Factor,'
      #9'Job_Bag_Line_Dets.Purchase_Order, '
      #9'Job_Bag_Line_Dets.Line, '
      #9'Job_Bag_Line_Dets.sales_order, '
      #9'Job_Bag_Line_Dets.sales_order_line_no, '
      #9'Job_Bag.InActive,'
      '  Rep.Name as Rep_Name,'
      #9'Purchase_OrderLine.Qty_Invoiced,'
      #9'Purchase_OrderLine.Quantity,'
      #9'Purchase_OrderLine.Invoice_upfront,'
      '  ISNULL((select Sum(Delivery_Detail.Qty_Delivered)'
      '  from delivery_detail'
      
        '  where Delivery_detail.Purchase_order = Purchase_Orderline.Purc' +
        'hase_order and'
      '        Delivery_Detail.Qty_Delivered > 0 AND'
      #9'((Delivery_to_stock <> '#39'Y'#39') OR'
      
        #9' ((Delivery_to_stock = '#39'Y'#39') AND (Purchase_Orderline.Invoice_upf' +
        'ront = '#39'Y'#39')))),0) AS Qty_Delivered,'
      #9'Job_Bag.Office_Contact,'
      #9'Operator.Name as Account_Manager'
      'FROM Rep '
      #9'INNER JOIN (Operator '
      #9'INNER JOIN (Price_Unit '
      #9'RIGHT JOIN (Customer '
      #9'INNER JOIN (Purchase_OrderLine '
      #9'RIGHT JOIN ((Customer_Branch '
      #9'INNER JOIN Job_Bag '
      
        #9#9'ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Custom' +
        'er_Branch.Customer = Job_Bag.Customer)) '
      #9'INNER JOIN Job_Bag_Line_Dets '
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) '
      
        #9#9'ON (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND (Pur' +
        'chase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchase_Orde' +
        'r)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9'ON Price_Unit.Price_Unit = Job_Bag_Line_Dets.price_unit) '
      #9#9'ON Operator.Operator = Job_Bag.Office_Contact)'
      #9#9'ON Rep.Rep = Job_Bag.Rep'
      'WHERE '#9'(Job_Bag.Job_Bag = Job_Bag_Line_dets.Job_Bag) AND '
      #9'((Job_Bag.Inactive is null) OR (Job_Bag.inactive <> '#39'Y'#39')) AND'
      #9'(Job_Bag.Job_Bag_Status <= 25) AND'
      
        #9'((Job_Bag_Line_dets.Job_Bag_Line_Invoiced = '#39'N'#39') or (Job_Bag_Li' +
        'ne_dets.Job_Bag_Line_Invoiced = '#39'P'#39')) AND'
      '  ((Purchase_OrderLine.Inactive <> '#39'Y'#39') OR'
      '      (Purchase_OrderLine.Inactive Is Null)) AND'
      #9'('
      
        '  ((Purchase_OrderLine.Purch_Ord_Line_Status > 20) OR (Purchase_' +
        'OrderLine.Purch_Ord_Line_Status IS NULL)) AND'
      
        '  ((Purchase_OrderLine.Purch_Ord_Line_Status < 30) OR (Purchase_' +
        'OrderLine.Purch_Ord_Line_Status IS NULL))'
      #9')'
      ''
      ''
      ''
      ''
      '')
    Left = 200
    Top = 16
  end
  object SQLGetStkInv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT sales_Order_Line.*, Part.Part, Part.Part_Description,Part' +
        '.Price_Unit,'
      '  Customer.Name AS Customer_Name,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Sales_Order_Head_Status.Description as Status_Description,'
      
        '  Sales_Order.Date_Ordered,Price_Unit.Description as Price_Unit_' +
        'Description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  (select distinct part_movement.date_received'
      #9'from part_movement'
      
        #9'where part_movement_reference LIKE '#39'SalesOrd: '#39'+convert(nvarcha' +
        'r(10),Sales_order.Sales_order)) as Pick_date,'
      '  (select distinct purch_ord_line.date_Deliv_actual'
      #9'from purch_ord, purch_ord_line'
      #9'where Purch_ord.Sales_order = Sales_Order.Sales_order and'
      
        #9'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) AS Delivery_d' +
        'ate,'
      '  (select Rep.Name'
      '   '#9'from Sales_OrderRep, Rep'
      
        '        where (Sales_OrderRep.Sales_Order = Sales_Order.Sales_or' +
        'der) and'
      '            (Sales_OrderRep.Rep = Rep.Rep)) as Rep_Name,'
      '    (select Job_Bag from Job_Bag_Line_Dets'
      
        '        where Job_Bag_Line_Dets.Sales_Order = Sales_Order_line.S' +
        'ales_Order AND'
      
        '              Job_Bag_Line_Dets.Sales_Order_Line_no = Sales_Orde' +
        'r_line.Sales_Order_Line_no) as Job_Bag'
      'FROM (((Sales_Order'
      
        '  INNER JOIN sales_Order_Line ON Sales_Order.Sales_Order = sales' +
        '_Order_Line.Sales_Order)'
      '  INNER JOIN (Part'
      
        '  LEFT JOIN Price_Unit ON Part.price_unit = Price_Unit.Price_Uni' +
        't) ON sales_Order_Line.Part = Part.Part)'
      
        '  INNER JOIN Customer_Branch ON (Sales_Order.Branch_no = Custome' +
        'r_Branch.Branch_no) AND (Sales_Order.Customer = Customer_Branch.' +
        'Customer))'
      
        '  INNER JOIN Customer ON Customer_Branch.Customer = Customer.Cus' +
        'tomer'
      
        '  INNER JOIN Sales_order_Head_Status ON Sales_Order.Sales_order_' +
        'Head_Status = Sales_order_Head_Status.Sales_order_Head_Status'
      'where'
      '(Sales_Order.Sales_Order_Head_Status >= 150) AND'
      '(Sales_Order.Sales_Order_Head_Status < 250) AND'
      
        '(Sales_Order_Line.Quantity_Invoiced < Sales_Order_Line.Quantity_' +
        'Delivered)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      '')
    Left = 288
    Top = 32
  end
  object SQLGetStkInv_access: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT sales_Order_Line.*, Part.Part, Part.Part_Description,Part' +
        '.Price_Unit,'
      '  Customer.Name AS Customer_Name,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Sales_Order_Head_Status.Description as Status_Description,'
      
        '  Sales_Order.Date_Ordered,Price_Unit.Description as Price_Unit_' +
        'Description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  (select distinct part_movement.date_received'
      #9'from part_movement'
      
        '  where part_movement_reference LIKE '#39'SalesOrd: '#39'& Sales_order.S' +
        'ales_order) as Pick_date,'
      '  (select distinct purch_ord_line.date_Deliv_actual'
      #9'from purch_ord, purch_ord_line'
      #9'where Purch_ord.Sales_order = Sales_Order.Sales_order and'
      
        #9'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) AS Delivery_d' +
        'ate,'
      '  (select Rep.Name'
      '   '#9'from Sales_OrderRep, Rep'
      
        '        where (Sales_OrderRep.Sales_Order = Sales_Order.Sales_or' +
        'der) and'
      '            (Sales_OrderRep.Rep = Rep.Rep)) as Rep_Name'
      'FROM (((Sales_Order'
      
        '  INNER JOIN sales_Order_Line ON Sales_Order.Sales_Order = sales' +
        '_Order_Line.Sales_Order)'
      '  INNER JOIN (Part'
      
        '  LEFT JOIN Price_Unit ON Part.price_unit = Price_Unit.Price_Uni' +
        't) ON sales_Order_Line.Part = Part.Part)'
      
        '  INNER JOIN Customer_Branch ON (Sales_Order.Branch_no = Custome' +
        'r_Branch.Branch_no) AND (Sales_Order.Customer = Customer_Branch.' +
        'Customer))'
      
        '  INNER JOIN Customer ON Customer_Branch.Customer = Customer.Cus' +
        'tomer'
      
        '  INNER JOIN Sales_order_Head_Status ON Sales_Order.Sales_order_' +
        'Head_Status = Sales_order_Head_Status.Sales_order_Head_Status'
      'WHERE'
      '  (Sales_Order.Sales_Order_Head_Status >= 150) AND'
      '  (Sales_Order.Sales_Order_Head_Status < 250) AND'
      
        '  (Sales_Order_Line.Quantity_Invoiced < Sales_Order_Line.Quantit' +
        'y_Delivered)'
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
      ' ')
    Left = 296
    Top = 96
  end
  object SQLGetRepName: TFDQuery
    ConnectionName = 'PB'
    Left = 454
    Top = 60
  end
  object qryPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Purchase_orderLine.Purchase_Order,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Price_Unit.Description as Price_Unit_Description,'
      '        Purchase_Orderline.Selling_Price'
      'from Purchase_Orderline, Price_Unit'
      'where Purchase_Order = :Purchase_Order AND '
      'Line = :Line AND'
      'Purchase_OrderLine.Sell_unit = Price_Unit.Price_Unit')
    Left = 462
    Top = 118
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_order_Line.Part_Sales_Price, Sales_order_Line.Part,'
      'Part.Price_unit, Sales_order_Line.Sell_Pack_Quantity'
      'from Sales_Order_Line, Part'
      'where Sales_Order = :Sales_Order and'
      'sales_order_line_no = :sales_order_line_no and'
      'Sales_order_line.Part = Part.Part')
    Left = 462
    Top = 177
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
end
