object PBRPOSSInvPInvRecdFrm: TPBRPOSSInvPInvRecdFrm
  Left = 2
  Top = 115
  Caption = 'Oustanding Invoicing - Purchase Invoice Received Report'
  ClientHeight = 570
  ClientWidth = 1177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
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
        Left = 256
        Top = 8
        Width = 534
        Height = 23
        Size.Values = (
          60.854166666666670000
          677.333333333333300000
          21.166666666666670000
          1412.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Oustanding Invoicing Report (Purchase Invoice Received)'
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
        Left = 24
        Top = 104
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          275.166666666666700000
          84.666666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
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
        Left = 592
        Top = 88
        Width = 57
        Height = 33
        Size.Values = (
          87.312500000000000000
          1566.333333333333000000
          232.833333333333300000
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
        Left = 656
        Top = 88
        Width = 65
        Height = 33
        Size.Values = (
          87.312500000000000000
          1735.666666666667000000
          232.833333333333300000
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
      object QRLabel10: TQRLabel
        Left = 785
        Top = 75
        Width = 57
        Height = 45
        Size.Values = (
          119.062500000000000000
          2076.979166666667000000
          198.437500000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Stock Invoice upfront'
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
      object QRLabel4: TQRLabel
        Left = 736
        Top = 88
        Width = 49
        Height = 33
        Size.Values = (
          87.312500000000000000
          1947.333333333333000000
          232.833333333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Last Delivery'
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
        Left = 536
        Top = 104
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1418.166666666667000000
          275.166666666666700000
          121.708333333333300000)
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
      object QRSysData2: TQRSysData
        Left = 972
        Top = 40
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2571.750000000000000000
          105.833333333333300000
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 214
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
      Top = 214
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
      Top = 193
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
      Top = 242
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
        Left = 128
        Top = 8
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
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
      Top = 214
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
      Top = 194
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
      object QRDBText5: TQRDBText
        Left = 692
        Top = 0
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1830.916666666667000000
          0.000000000000000000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Last_delivery_date'
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
      object qrlblInvUpfront: TQRLabel
        Left = 792
        Top = 0
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          2095.500000000000000000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblInvUpfront'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 871
        Top = 0
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          2304.520833333333000000
          0.000000000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Sales_Unit_Desc'
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
        DataField = 'Purchase_Order'
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
        DataField = 'Customers_Desc'
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
        Left = 656
        Top = 0
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
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
      object QRDBText6: TQRDBText
        Left = 832
        Top = 0
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          2201.333333333333000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryOSInvs
        DataField = 'Selling_Price'
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
      object QRDBText13: TQRDBText
        Left = 542
        Top = 0
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1434.041666666667000000
          0.000000000000000000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
      object QRDBText8: TQRDBText
        Left = 608
        Top = 0
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          0.000000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryOSInvs
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
  object oldqryDummy: TFDQuery
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
      'Rep.name as rep_name'
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
      ' ')
    Left = 104
    Top = 8
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Sum(Delivery_Detail.Qty_Delivered) AS Qty_Delivered,'
      '        (select top 1 Date_deliv_actual'
      '         from Delivery_detail'
      
        '         where (Delivery_detail.Purchase_order = Purchase_OrderL' +
        'ine.purchase_order) and'
      
        '               (Delivery_detail.Line = Purchase_OrderLine.Line) ' +
        'and'
      '               (Delivery_detail.Qty_delivered <> 0)'
      
        '         order by Delivery_detail.date_deliv_actual desc, Delive' +
        'ry_detail.Delivery_no desc) as Last_delivery_date,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_Order.Date_Point,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Invoice_upfront,'
      '        Price_Unit.Description as sales_unit_desc,'
      '        Purchase_OrderLine.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Purchase_OrderLine.Purch_ord_line_status,'
      '        Purch_Ord_Line_Status.Description as Status_Description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Job_Bag from Job_Bag_Line_Dets'
      
        '        where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderL' +
        'ine.Purchase_Order) as Job_Bag,'
      #9'      Supplier.Name as Supplier_Name,'
      '        Operator.Name as Account_Manager'
      'from purchase_orderline,'
      #9'customer, '
      #9'Rep, '
      #9'Price_unit,'
      #9'purch_ord_line_status,'
      #9'Purchase_Order,'
      #9'Delivery_Detail,'
      #9'supplier,'
      '  Operator'
      'WHERE'
      '((Delivery_Detail.Delivery_to_Stock <> '#39'Y'#39') and'
      '('
      '(Purchase_OrderLine.Purch_Ord_Line_Status > :Status) AND'
      '(Purchase_OrderLine.Purch_Ord_Line_Status < 30)'
      ') AND'
      '((Purchase_OrderLine.Inactive <> '#39'Y'#39') Or'
      '      (Purchase_OrderLine.Inactive Is Null)) AND'
      '('
      '(Purchase_OrderLine.Qty_Supp_inv > 0) or'
      '(Purchase_OrderLine.Qty_Supp_inv_Pend > 0)'
      ') AND'
      
        '(Purchase_orderline.Purchase_order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.rep = rep.rep) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.sell_unit = price_unit.Price_unit) and'
      
        '(Purchase_orderline.purch_ord_line_status = purch_ord_line_statu' +
        's.purch_ord_line_status) and'
      '('
      
        '(Purchase_orderline.purchase_order = Delivery_detail.purchase_or' +
        'der) and'
      '(Purchase_orderline.line = Delivery_Detail.line)'
      ') and'
      '(Purchase_Order.Supplier = Supplier.Supplier) and'
      '(Purchase_Order.office_contact = Operator.Operator)) OR'
      '('
      '('
      '(Purchase_OrderLine.Purch_Ord_Line_Status > :Status) AND'
      '(Purchase_OrderLine.Purch_Ord_Line_Status < 30)'
      ') AND'
      '((Purchase_OrderLine.Inactive <> '#39'Y'#39') Or'
      '      (Purchase_OrderLine.Inactive Is Null)) AND'
      '(Purchase_orderline.Invoice_upfront = '#39'Y'#39') AND'
      '('
      '(Purchase_OrderLine.Qty_Supp_inv > 0) or'
      '(Purchase_OrderLine.Qty_Supp_inv_Pend > 0)'
      ') AND'
      
        '(Purchase_orderline.Purchase_order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.rep = rep.rep) and'
      '(Purchase_orderline.customer = customer.customer) and'
      '(Purchase_orderline.sell_unit = price_unit.Price_unit) and'
      
        '(Purchase_orderline.purch_ord_line_status = purch_ord_line_statu' +
        's.purch_ord_line_status) and'
      '('
      
        '(Purchase_orderline.purchase_order = Delivery_detail.purchase_or' +
        'der) and'
      '(Purchase_orderline.line = Delivery_Detail.line)'
      ') and'
      '(Purchase_Order.Supplier = Supplier.Supplier) and'
      '(Purchase_Order.office_contact = Operator.Operator))'
      'GROUP BY  Purchase_OrderLine.Purchase_Order,'
      '          Purchase_OrderLine.Line,'
      '          Purchase_OrderLine.Selling_Price,'
      '          Purchase_OrderLine.Qty_Invoiced,'
      '          Purchase_OrderLine.Quantity,'
      '          Purchase_Order.Date_Point,'
      '          Customer.Name,'
      '          Purchase_OrderLine.Customers_Desc,'
      '          Purchase_OrderLine.Invoice_upfront,'
      '          Price_Unit.Description,'
      '          Purchase_OrderLine.Rep,'
      '          Rep.Name,'
      '          Purchase_OrderLine.Purch_ord_line_status,'
      '          Purch_Ord_Line_Status.Description,'
      '          Price_Unit.Price_Unit_Factor,'
      #9'        Supplier.Name,'
      '          Operator.Name'
      'HAVING'
      '      (Purchase_OrderLine.Selling_Price >= :Selling_Price)'
      ''
      ' '
      ' '
      ' ')
    Left = 200
    Top = 16
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Selling_Price'
      end>
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
    Left = 352
    Top = 40
  end
  object SQLGetRepName: TFDQuery
    ConnectionName = 'PB'
    Left = 454
    Top = 60
  end
end
