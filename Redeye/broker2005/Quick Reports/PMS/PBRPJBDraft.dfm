object PBRPJBDraftFrm: TPBRPJBDraftFrm
  Left = 60
  Top = 44
  Caption = 'Draft Sales Invoice Print'
  ClientHeight = 652
  ClientWidth = 977
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 8
    Top = 8
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = GetOrdHedQuery
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      200.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
      0.000000000000000000
      0.000000000000000000
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
    object PageHeaderQRBand: TQRBand
      Left = 0
      Top = 23
      Width = 992
      Height = 498
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1054.100000000000000000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object ReportTitleQRLabel: TQRLabel
        Left = 570
        Top = 360
        Width = 93
        Height = 21
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          762.000000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object OrdNumQRLabel: TQRLabel
        Left = 708
        Top = 360
        Width = 110
        Height = 21
        Size.Values = (
          44.450000000000000000
          1498.600000000000000000
          762.000000000000000000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Number:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object OrdDateQRLabel: TQRLabel
        Left = 570
        Top = 238
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          503.766666666666700000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object SalesOrdDateQRLabel: TQRLabel
        Left = 708
        Top = 238
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          1498.600000000000000000
          503.766666666666700000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object CustomerAddmemo: TQRMemo
        Left = 80
        Top = 241
        Width = 391
        Height = 149
        Size.Values = (
          314.854166666666700000
          169.333333333333300000
          510.645833333333300000
          828.145833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLblWho: TQRLabel
        Left = 570
        Top = 268
        Width = 111
        Height = 21
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          567.266666666666700000
          234.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblCntct: TQRLabel
        Left = 706
        Top = 268
        Width = 243
        Height = 21
        Size.Values = (
          44.979166666666670000
          1494.895833333333000000
          566.208333333333400000
          513.291666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Contact'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblCustRef: TQRLabel
        Left = 570
        Top = 299
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          632.883333333333300000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblRef: TQRLabel
        Left = 708
        Top = 299
        Width = 244
        Height = 21
        Size.Values = (
          44.979166666666670000
          1497.541666666667000000
          632.354166666666800000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '123456789012345678901234'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblReqDt: TQRLabel
        Left = 708
        Top = 329
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          1498.600000000000000000
          696.383333333333300000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblDtReq: TQRLabel
        Left = 570
        Top = 329
        Width = 113
        Height = 21
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          696.383333333333300000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 822
        Top = 471
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          1739.900000000000000000
          996.950000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 631
        Top = 471
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          1335.616666666667000000
          996.950000000000000000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object OrdQtyQRLabel: TQRLabel
        Left = 695
        Top = 471
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1471.083333333333000000
          996.950000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Price Unit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 488
        Top = 471
        Width = 85
        Height = 21
        Size.Values = (
          44.979166666666670000
          1031.875000000000000000
          997.479166666666900000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object DescQRLabel: TQRLabel
        Left = 30
        Top = 471
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          63.500000000000000000
          996.950000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 770
        Top = 30
        Width = 188
        Height = 29
        Size.Values = (
          61.383333333333330000
          1629.833333333333000000
          63.500000000000000000
          397.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Proforma Invoice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
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
        Left = 915
        Top = 471
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          1936.750000000000000000
          996.950000000000000000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 30
        Top = 420
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          63.500000000000000000
          889.000000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Project:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblJobBagDescription: TQRLabel
        Left = 108
        Top = 420
        Width = 155
        Height = 21
        Size.Values = (
          44.450000000000000000
          228.600000000000000000
          889.000000000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblJobBagDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblRevenueCentre: TQRLabel
        Left = 570
        Top = 400
        Width = 133
        Height = 21
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          846.666666666666700000
          281.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Revenue Centre:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblRevenueCentreData: TQRLabel
        Left = 706
        Top = 400
        Width = 243
        Height = 21
        Size.Values = (
          44.979166666666670000
          1494.895833333333000000
          846.666666666666600000
          513.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Revenue Centre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object imgReport: TQRImage
        Left = 40
        Top = 21
        Width = 721
        Height = 145
        Enabled = False
        Size.Values = (
          306.916666666666700000
          84.666666666666680000
          44.979166666666670000
          1526.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object qrlblReportTitle: TQRLabel
        Left = 570
        Top = 206
        Width = 88
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          436.033333333333300000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ReportTitle'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object FooterQRBand: TQRBand
      Left = 0
      Top = 579
      Width = 992
      Height = 166
      AfterPrint = FooterQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        351.366666666666700000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel14: TQRLabel
        Left = 678
        Top = 28
        Width = 72
        Height = 25
        Size.Values = (
          52.916666666666670000
          1435.100000000000000000
          59.266666666666670000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object GoodsValueLbl: TQRLabel
        Left = 756
        Top = 28
        Width = 110
        Height = 26
        Size.Values = (
          55.033333333333330000
          1600.200000000000000000
          59.266666666666670000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'GoodsValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel15: TQRLabel
        Left = 672
        Top = 57
        Width = 77
        Height = 25
        Size.Values = (
          52.916666666666670000
          1422.400000000000000000
          120.650000000000000000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object VATValueLbl: TQRLabel
        Left = 772
        Top = 57
        Width = 94
        Height = 25
        Size.Values = (
          52.916666666666670000
          1634.066666666667000000
          120.650000000000000000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VATValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object TotalValueLbl: TQRLabel
        Left = 770
        Top = 87
        Width = 97
        Height = 25
        Size.Values = (
          52.916666666666670000
          1629.833333333333000000
          184.150000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel16: TQRLabel
        Left = 654
        Top = 87
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          1384.300000000000000000
          184.150000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Gross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel1: TQRLabel
        Left = 826
        Top = 138
        Width = 41
        Height = 25
        Size.Values = (
          52.916666666666670000
          1748.366666666667000000
          292.100000000000000000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'e&oe'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrsbdJBLines: TQRSubDetail
      Left = 0
      Top = 526
      Width = 992
      Height = 28
      AlignToBottom = False
      BeforePrint = qrsbdJBLinesBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        59.266666666666670000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = GetDetsQuery
      PrintBefore = False
      PrintIfEmpty = True
      object lblDescription: TQRLabel
        Left = 30
        Top = 1
        Width = 451
        Height = 20
        Size.Values = (
          42.333333333333340000
          63.500000000000000000
          2.645833333333333000
          955.145833333333500000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblSellPrice: TQRLabel
        Left = 591
        Top = 1
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          1250.950000000000000000
          2.116666666666667000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblSellUnit: TQRLabel
        Left = 704
        Top = 1
        Width = 70
        Height = 21
        Size.Values = (
          44.450000000000000000
          1490.133333333333000000
          2.116666666666667000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblValue: TQRLabel
        Left = 808
        Top = 1
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          1710.266666666667000000
          2.116666666666667000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblVat: TQRLabel
        Left = 888
        Top = 1
        Width = 63
        Height = 21
        Size.Values = (
          44.979166666666670000
          1878.541666666667000000
          2.645833333333333000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblQuantity: TQRLabel
        Left = 491
        Top = 1
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666670000
          1039.812500000000000000
          2.645833333333333000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrmDescription: TQRRichText
        Left = 30
        Top = 1
        Width = 461
        Height = 20
        Size.Values = (
          42.333333333333340000
          63.500000000000000000
          2.645833333333333000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
    end
    object pogroupheader: TQRGroup
      Left = 0
      Top = 522
      Width = 992
      Height = 4
      AlignToBottom = False
      BeforePrint = pogroupheaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        8.466666666666667000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetOrdHedQuery.Sel1'
      FooterBand = FooterQRBand
      Master = qrpDetails
      ReprintOnNewPage = True
    end
    object qrsbdAddCharges: TQRSubDetail
      Left = 0
      Top = 554
      Width = 992
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsbdAddChargesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsbdJBLines
      DataSet = qryPOLineChgs
      PrintBefore = False
      PrintIfEmpty = True
      object lblAddDescription: TQRLabel
        Left = 30
        Top = 1
        Width = 461
        Height = 21
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2.645833333333333000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblAddValue: TQRLabel
        Left = 808
        Top = 1
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          1710.266666666667000000
          2.116666666666667000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblAddVAT: TQRLabel
        Left = 888
        Top = 1
        Width = 63
        Height = 21
        Size.Values = (
          44.979166666666670000
          1878.541666666667000000
          2.645833333333333000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    end
  end
  object GetDetsDataSource: TDataSource
    DataSet = GetOrdHedQuery
    Left = 560
    Top = 35
  end
  object GetDetsQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Job_Bag_Line_Dets.Purchase_Order,'
      '        Job_Bag_Line_Dets.Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Invoiced,'
      '        Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '        Job_Bag_Line_Dets.VAT_Code,'
      '        Job_Bag_Line_Dets.Currency_Code,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Job_Bag_Line_Dets.Price_unit,'
      '        Job_Bag_Line_Dets.Selling_Price as Unit_Price,'
      '        Job_Bag_Line_Dets.Sales_Order,'
      '        Job_Bag_Line_Dets.Sales_Order_Line_no,'
      '        Job_Bag_Line_Dets.Product_Type as JB_Product_Type,'
      '        (select Product_type'
      '         from Purchase_OrderLine'
      
        '         where Purchase_OrderLine.Purchase_Order = Job_Bag_Line_' +
        'Dets.Purchase_Order and'
      
        '               Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line)' +
        ' as Product_Type,'
      
        '        (Purchase_OrderLine.Quantity - Purchase_OrderLine.Qty_In' +
        'voiced) as Invoice_qty,'
      #9'      Job_Bag.Customer,'
      #9'      Job_Bag.Branch_No,'
      #9'      Job_Bag.Date_Point,'
      #9'      Job_Bag.Contact_no,'
      #9'      Job_Bag.Cust_Order_No,'
      #9'      Job_Bag.Goods_Required as Date_Required,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Customer_Branch.Inv_To_Customer,'
      '        Customer_Branch.Inv_To_Branch,'
      '        (select Invoice_Location_Descr'
      '         from Invoice_Location'
      
        '         where Invoice_Location.Invoice_Location = Job_bag.Invoi' +
        'ce_Location) as Revenue_Centre'
      'FROM Customer_Branch'
      '      INNER JOIN (Vat_Code'
      '      INNER JOIN (Purchase_OrderLine'
      '      RIGHT JOIN (Job_Bag'
      
        '      INNER JOIN Job_Bag_Line_Dets ON Job_Bag.Job_Bag = Job_Bag_' +
        'Line_Dets.Job_Bag)'
      
        '        ON (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AN' +
        'D (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchas' +
        'e_Order))'
      '        ON Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code)'
      
        '        ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (' +
        'Customer_Branch.Customer = Job_Bag.Customer)'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :sel1 and'
      '('
      '(((Purchase_OrderLine.purch_ord_line_status < 30) and'
      '(Purchase_OrderLine.Inactive <> '#39'Y'#39') or'
      '(Purchase_orderLine.Inactive is null)) or'
      'Job_Bag_Line_Dets.Purchase_order is null)'
      ') and'
      
        '((Job_Bag_Line_Dets.Job_Bag_Line_Sell > 0) or (:Show_Zero_Values' +
        ' = '#39'Y'#39')) and'
      '((Job_Bag_Line_Dets.Job_Bag_Line_Invoiced is null) or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'N'#39') or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'P'#39')) and'
      '(Job_Bag_Line_Dets.Ready_to_invoice = '#39'Y'#39') AND'
      
        '((Job_Bag_Line_Dets.Inactive is null) OR (Job_Bag_Line_Dets.inac' +
        'tive = '#39'N'#39'))'
      
        'ORDER BY Job_Bag_line_dets.Job_Bag, Job_Bag_line_dets.Sequence_n' +
        'o, Job_Bag_Line ')
    Left = 249
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Show_Zero_Values'
        ParamType = ptUnknown
      end>
  end
  object GetOrdHedQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sel1, text100'
      'from'
      '  Int_Sel'
      'where'
      '  (Int_Sel_Code = :Int_Sel_Code) and'
      '  (Sel1 <> 0) and'
      '  (select count(job_bag_Line)'
      '    from Job_Bag_line_dets'
      
        '    where Job_Bag = text100 and ((Ready_to_invoice = '#39'Y'#39') and (J' +
        'ob_bag_line_invoiced <> '#39'Y'#39'))) > 0'
      'order by'
      '  Sel1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 462
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object GetSOAddQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as DelNam,'
      '          Customer_Branch.Building_no_Name as DelAdd1,'
      '          Customer_Branch.Street as DelAdd2,'
      '          Customer_Branch.Locale as DelAdd3,'
      '          Customer_Branch.Town as DelAdd4,'
      '          Customer_Branch.Postcode as DelAdd5,'
      '          Customer_Branch.Phone as DelAdd6,'
      '          Customer_Branch.Fax_number as DelAdd7'
      'from Sales_order, Customer, Customer_Branch'
      'where Sales_Order.SAles_Order = :Sales_order and'
      '('
      '(Sales_order.Delivery_Customer = Customer_branch.Customer) and'
      '(Sales_order.Delivery_Branch = Customer_branch.Branch_no)'
      ') and'
      '(Customer_branch.Customer = Customer.Customer)'
      ' ')
    Left = 238
    Top = 41
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 96
    Top = 79
  end
  object GetCompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 96
    Top = 126
  end
  object CustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Fax_Number,'
      '        Email'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 406
    Top = 289
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object AddressSRC: TDataSource
    DataSet = CustSQL
    Left = 352
    Top = 343
  end
  object GetContactSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Customer_Contact.Name as Contact_Name'
      'From  Customer_Contact'
      'Where (Customer_Contact.Contact_No = :Contact_No) and'
      '      (Customer_Contact.Customer = :Customer) and'
      '      (Customer_Contact.Branch_No = :Branch_No)'
      ' '
      ' '
      ' '
      ' ')
    Left = 336
    Top = 42
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object GetNarrSQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line'
      '')
    Left = 454
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object qrySOLinePart: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Sales_Order_Line.Part,'
      '  Part.Price_unit, Part.Part_Description'
      'from Sales_Order_Line, Part'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no and'
      'sales_order_line.Part = Part.Part'
      ' '
      '')
    Left = 328
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetPriceUnit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 536
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end>
  end
  object qrySOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Order_Line.Part,'
      
        '      (Quantity_Delivered - Quantity_Invoiced) as Qty_Outstandin' +
        'g,'
      '      Sell_Pack_quantity,'
      '      Quantity_Ordered,'
      '      Quantity_Delivered,'
      '      Part_Sales_Price'
      'from Sales_Order_Line'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no'
      ' ')
    Left = 360
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryJBLineChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purch_Ord_Line_Add_Chg.Additional_charge,'
      '        Purch_Ord_Line_Add_Chg.Details,'
      '        Purch_Ord_Line_Add_Chg.Amount,'
      '        Purch_Ord_Line_Add_Chg.Quotation_Price,'
      '        Product_Type.Nominal,'
      '        Purchase_OrderLine.Customer,'
      '        Customer.VAT_Code_Def AS Vat_Code,'
      '        Purch_Ord_Line_Add_Chg.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code_1.Vat_Rate as Customer_Vat_Rate'
      'FROM Vat_Code AS Vat_Code_1'
      '      INNER JOIN (Vat_Code'
      '      RIGHT JOIN (Product_Type'
      '      INNER JOIN (((Purchase_OrderLine'
      
        '      INNER JOIN Customer ON Purchase_OrderLine.Customer = Custo' +
        'mer.Customer)'
      
        '      INNER JOIN Job_Bag_Line_Dets ON (Purchase_OrderLine.Line =' +
        ' Job_Bag_Line_Dets.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_De' +
        'ts.Purchase_Order))'
      
        '      INNER JOIN Purch_Ord_Line_Add_Chg ON (Purchase_OrderLine.L' +
        'ine = Purch_Ord_Line_Add_Chg.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_' +
        'Add_Chg.Purchase_Order))'
      
        '        ON Product_Type.Product_Type = Purchase_OrderLine.Produc' +
        't_Type)'
      '        ON Vat_Code.Vat_Code = Purch_Ord_Line_Add_Chg.Vat_Code)'
      '        ON Vat_Code_1.Vat_Code = Customer.VAT_Code_Def'
      'WHERE job_bag = :Job_Bag and'
      ' Purch_Ord_Line_Add_Chg.Quotation_Price <> 0 and'
      ' Purchase_orderLine.purch_ord_line_Status <= 25'
      ' ')
    Left = 360
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryPOLineChgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purch_Ord_Line_Add_Chg.Additional_charge,'
      '        Purch_Ord_Line_Add_Chg.Details,'
      '        Purch_Ord_Line_Add_Chg.Amount,'
      '        Purch_Ord_Line_Add_Chg.Quotation_Price,'
      '        Product_Type.Nominal,'
      '        Purchase_OrderLine.Customer,'
      '        Customer.VAT_Code_Def AS Vat_Code,'
      '        Purch_Ord_Line_Add_Chg.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code_1.Vat_Rate as Customer_Vat_Rate'
      'FROM Vat_Code AS Vat_Code_1'
      '      INNER JOIN (Vat_Code'
      '      RIGHT JOIN (Product_Type'
      '      INNER JOIN (((Purchase_OrderLine'
      
        '      INNER JOIN Customer ON Purchase_OrderLine.Customer = Custo' +
        'mer.Customer)'
      
        '      INNER JOIN Job_Bag_Line_Dets ON (Purchase_OrderLine.Line =' +
        ' Job_Bag_Line_Dets.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_De' +
        'ts.Purchase_Order))'
      
        '      INNER JOIN Purch_Ord_Line_Add_Chg ON (Purchase_OrderLine.L' +
        'ine = Purch_Ord_Line_Add_Chg.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_' +
        'Add_Chg.Purchase_Order))'
      
        '        ON Product_Type.Product_Type = Purchase_OrderLine.Produc' +
        't_Type)'
      '        ON Vat_Code.Vat_Code = Purch_Ord_Line_Add_Chg.Vat_Code)'
      '        ON Vat_Code_1.Vat_Code = Customer.VAT_Code_Def'
      'WHERE job_bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line AND'
      ' Purch_Ord_Line_Add_Chg.Quotation_Price <> 0 and'
      ' Purchase_orderLine.purch_ord_line_Status <= 25'
      ' ')
    Left = 464
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetProductType: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Product_Type.Description, Category.Description as Categor' +
        'y_Description'
      'from Product_Type, Category'
      'where Product_Type = :Product_Type and'
      'Product_Type.Category = Category.Category')
    Left = 696
    Top = 171
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
end
