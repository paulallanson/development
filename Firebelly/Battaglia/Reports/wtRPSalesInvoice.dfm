object frmWTRPSalesInvoice: TfrmWTRPSalesInvoice
  Left = 145
  Top = 54
  Width = 1218
  Height = 780
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 335
  VertScrollBar.Range = 2000
  Caption = 'Print Sales Invoice'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 15
  object InvoiceReport: TQuickRep
    Left = 104
    Top = -295
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = InvoiceReportBeforePrint
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Lucida Sans'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPB')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
    OnNeedData = InvoiceReportNeedData
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      0.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
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
    ReportTitle = 'Sales Invoice Print'
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
    object InvoiceFooter: TQRBand
      Left = 38
      Top = 640
      Width = 756
      Height = 3
      AfterPrint = InvoiceFooterAfterPrint
      AlignToBottom = True
      BeforePrint = InvoiceFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object InvoiceGroupHeader: TQRGroup
      Left = 38
      Top = 449
      Width = 756
      Height = 3
      AlignToBottom = False
      BeforePrint = InvoiceGroupHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        7.937500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = InvoiceFooter
      Master = InvoiceReport
      ReprintOnNewPage = False
    end
    object AddChargesFooter: TQRBand
      Left = 38
      Top = 582
      Width = 756
      Height = 29
      AfterPrint = AddChargesFooterAfterPrint
      AlignToBottom = False
      BeforePrint = AddChargesFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object memoNotes: TQRMemo
        Left = 18
        Top = 3
        Width = 471
        Height = 19
        Size.Values = (
          50.270833333333330000
          47.625000000000000000
          7.937500000000000000
          1246.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object InvoiceLine: TQRSubDetail
      Left = 38
      Top = 452
      Width = 756
      Height = 29
      AfterPrint = InvoiceLineAfterPrint
      AlignToBottom = False
      BeforePrint = InvoiceLineBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      DataSet = InvLineSQL
      FooterBand = AddChargesFooter
      PrintBefore = False
      PrintIfEmpty = True
      object Dummy06: TQRLabel
        Left = 557
        Top = 5
        Width = 59
        Height = 16
        Size.Values = (
          42.333333333333330000
          1473.729166666667000000
          13.229166666666670000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NNNN.NN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object VatTotalLbl: TQRLabel
        Left = 626
        Top = 3
        Width = 88
        Height = 19
        Size.Values = (
          50.270833333333330000
          1656.291666666667000000
          7.937500000000000000
          232.833333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'VatTotalLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        OnPrint = VatTotalLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QtyInvoicedLbl: TQRLabel
        Left = 396
        Top = 3
        Width = 83
        Height = 20
        Size.Values = (
          52.916666666666670000
          1047.750000000000000000
          7.937500000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QtyInvoicedLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        OnPrint = QtyInvoicedLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblDescription: TQRLabel
        Left = 17
        Top = 3
        Width = 496
        Height = 19
        Size.Values = (
          50.270833333333330000
          44.979166666666670000
          7.937500000000000000
          1312.333333333333000000)
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
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        OnPrint = lblDescriptionPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object GoodsLbl: TQRLabel
        Left = 567
        Top = 3
        Width = 53
        Height = 19
        Size.Values = (
          50.270833333333330000
          1500.187500000000000000
          7.937500000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'GoodsLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        OnPrint = GoodsLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 756
      Height = 411
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1087.437500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 8
        Top = 378
        Width = 713
        Height = 31
        Size.Values = (
          82.020833333333340000
          21.166666666666670000
          1000.125000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 528
        Top = 378
        Width = 99
        Height = 31
        Size.Values = (
          82.020833333333340000
          1397.000000000000000000
          1000.125000000000000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 424
        Top = 235
        Width = 297
        Height = 113
        Size.Values = (
          298.979166666666700000
          1121.833333333333000000
          621.770833333333400000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 9
        Top = 235
        Width = 313
        Height = 113
        Size.Values = (
          298.979166666666700000
          23.812500000000000000
          621.770833333333400000
          828.145833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object CustomerAddMemo: TQRMemo
        Left = 17
        Top = 245
        Width = 273
        Height = 95
        Size.Values = (
          251.354166666666700000
          44.979166666666670000
          648.229166666666800000
          722.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          'Invoice To XXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          ' ')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object InvoiceNumberLbl: TQRLabel
        Left = 604
        Top = 238
        Width = 110
        Height = 20
        Size.Values = (
          52.916666666666660000
          1598.083333333333000000
          629.708333333333400000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'InvoiceNumberLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        OnPrint = InvoiceNumberLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object InvoiceDateLbl: TQRLabel
        Left = 619
        Top = 267
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666670000
          1637.770833333333000000
          706.437500000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'InvoiceDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        OnPrint = InvoiceDateLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblCustOrderNo: TQRLabel
        Left = 560
        Top = 297
        Width = 154
        Height = 20
        Size.Values = (
          52.916666666666670000
          1481.666666666667000000
          785.812500000000000000
          407.458333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblCustOrderNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblInvoice: TQRLabel
        Left = 526
        Top = -8
        Width = 192
        Height = 56
        Size.Values = (
          148.166666666666700000
          1391.708333333333000000
          -21.166666666666670000
          508.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'INVOICE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -48
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 36
      end
      object qrlblCompanyName: TQRLabel
        Left = 539
        Top = 80
        Width = 173
        Height = 29
        Size.Values = (
          76.729166666666680000
          1426.104166666667000000
          211.666666666666700000
          457.729166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblCompanyName'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblInvoiceLabel: TQRLabel
        Left = 440
        Top = 238
        Width = 73
        Height = 20
        Size.Values = (
          52.916666666666670000
          1164.166666666667000000
          629.708333333333300000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 440
        Top = 267
        Width = 94
        Height = 20
        Size.Values = (
          52.916666666666670000
          1164.166666666667000000
          706.437500000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date/Tax point'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 440
        Top = 326
        Width = 81
        Height = 19
        Size.Values = (
          50.270833333333330000
          1164.166666666667000000
          862.541666666666700000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 440
        Top = 297
        Width = 101
        Height = 20
        Size.Values = (
          52.916666666666670000
          1164.166666666667000000
          785.812500000000000000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 424
        Top = 261
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          690.562500000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 424
        Top = 292
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          772.583333333333400000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 424
        Top = 319
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          844.020833333333500000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 549
        Top = 235
        Width = 9
        Height = 113
        Size.Values = (
          298.979166666666700000
          1452.562500000000000000
          621.770833333333400000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 18
        Top = 382
        Width = 127
        Height = 22
        Size.Values = (
          58.208333333333330000
          47.625000000000000000
          1010.708333333333000000
          336.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel10: TQRLabel
        Left = 631
        Top = 382
        Width = 83
        Height = 22
        Size.Values = (
          58.208333333333330000
          1669.520833333333000000
          1010.708333333333000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VAT Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object memAddress: TQRRichText
        Left = 24
        Top = 152
        Width = 289
        Height = 57
        Size.Values = (
          150.812500000000000000
          63.500000000000000000
          402.166666666666600000
          764.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object qrlblAccountCode: TQRLabel
        Left = 597
        Top = 326
        Width = 117
        Height = 19
        Size.Values = (
          50.270833333333330000
          1579.562500000000000000
          862.541666666666700000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblAccountCode'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 538
        Top = 382
        Width = 79
        Height = 22
        Size.Values = (
          58.208333333333330000
          1423.458333333333000000
          1010.708333333333000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Net Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object qriHeadLogo: TQRImage
        Left = 38
        Top = 0
        Width = 257
        Height = 145
        Size.Values = (
          383.645833333333300000
          100.541666666666700000
          0.000000000000000000
          679.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object qrlblVatReg: TQRLabel
        Left = 525
        Top = 200
        Width = 193
        Height = 19
        Size.Values = (
          50.270833333333330000
          1389.062500000000000000
          529.166666666666700000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'VAT Registration No. 816 8009 29'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 643
      Width = 756
      Height = 222
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        587.375000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRShape10: TQRShape
        Left = 528
        Top = 9
        Width = 194
        Height = 147
        Size.Values = (
          388.937500000000000000
          1397.000000000000000000
          23.812500000000000000
          513.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 529
        Top = 94
        Width = 192
        Height = 6
        Size.Values = (
          15.875000000000000000
          1399.645833333333000000
          248.708333333333300000
          508.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 529
        Top = 64
        Width = 192
        Height = 4
        Size.Values = (
          10.583333333333330000
          1399.645833333333000000
          169.333333333333300000
          508.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 529
        Top = 33
        Width = 192
        Height = 6
        Size.Values = (
          15.875000000000000000
          1399.645833333333000000
          87.312500000000000000
          508.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblReference: TQRLabel
        Left = 16
        Top = 177
        Width = 73
        Height = 18
        Size.Values = (
          47.625000000000000000
          42.333333333333330000
          468.312500000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 436
        Top = 14
        Width = 61
        Height = 21
        Size.Values = (
          55.562500000000000000
          1153.583333333333000000
          37.041666666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object GoodsValueLbl: TQRLabel
        Left = 533
        Top = 15
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          1410.229166666667000000
          39.687500000000000000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'GoodsValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object VATValueLbl: TQRLabel
        Left = 547
        Top = 44
        Width = 76
        Height = 16
        Size.Values = (
          42.333333333333330000
          1447.270833333333000000
          116.416666666666700000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VATValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = VATValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 436
        Top = 43
        Width = 60
        Height = 19
        Size.Values = (
          50.270833333333330000
          1153.583333333333000000
          113.770833333333300000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = VATValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape9: TQRShape
        Left = 8
        Top = 6
        Width = 521
        Height = 7
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          15.875000000000000000
          1378.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblDepositPaid: TQRLabel
        Left = 436
        Top = 105
        Width = 75
        Height = 16
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          277.812500000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deposit Paid'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object DepositLbl: TQRLabel
        Left = 559
        Top = 105
        Width = 64
        Height = 16
        Size.Values = (
          42.333333333333330000
          1479.020833333333000000
          277.812500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'DepositLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object TotalValueLbl: TQRLabel
        Left = 532
        Top = 76
        Width = 91
        Height = 16
        Size.Values = (
          42.333333333333330000
          1407.583333333333000000
          201.083333333333300000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblInvoiceTotal: TQRLabel
        Left = 436
        Top = 76
        Width = 87
        Height = 16
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          201.083333333333300000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrshpPayment: TQRShape
        Left = 8
        Top = 54
        Width = 409
        Height = 114
        Size.Values = (
          301.625000000000000000
          21.166666666666670000
          142.875000000000000000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 16
        Top = 64
        Width = 393
        Height = 100
        Size.Values = (
          264.583333333333300000
          42.333333333333330000
          169.333333333333300000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          'Payment by cheque payable etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRShape5: TQRShape
        Left = 529
        Top = 124
        Width = 192
        Height = 9
        Size.Values = (
          23.812500000000000000
          1399.645833333333000000
          328.083333333333400000
          508.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblToPay: TQRLabel
        Left = 436
        Top = 135
        Width = 40
        Height = 16
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          357.187500000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To Pay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object ToPayLbl: TQRLabel
        Left = 570
        Top = 135
        Width = 53
        Height = 16
        Size.Values = (
          42.333333333333330000
          1508.125000000000000000
          357.187500000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ToPayLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblPaymentTerms: TQRLabel
        Left = 12
        Top = 34
        Width = 109
        Height = 16
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          89.958333333333330000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Payment Terms: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblReverseCharge: TQRLabel
        Left = 12
        Top = 14
        Width = 114
        Height = 16
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          37.041666666666670000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblReverseCharge'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = VATValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrLoopB: TQRLoopBand
      Left = 38
      Top = 611
      Width = 756
      Height = 29
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = InvoiceFooter
      Size.Values = (
        76.729166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      PrintCount = 0
      PrintBefore = False
    end
    object gtQRShape1: TQRShape
      Left = 755
      Top = 416
      Width = 6
      Height = 640
      Size.Values = (
        1693.333333333333000000
        1997.604166666667000000
        1100.666666666667000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape2: TQRShape
      Left = 663
      Top = 416
      Width = 2
      Height = 640
      Size.Values = (
        1693.333333333333000000
        1754.187500000000000000
        1100.666666666667000000
        5.291666666666667000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape3: TQRShape
      Left = 563
      Top = 416
      Width = 6
      Height = 640
      Size.Values = (
        1693.333333333333000000
        1489.604166666667000000
        1100.666666666667000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape4: TQRShape
      Left = 43
      Top = 416
      Width = 6
      Height = 494
      Size.Values = (
        1307.041666666667000000
        113.770833333333300000
        1100.666666666667000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 481
      Width = 756
      Height = 24
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceLine
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TQRLabel
        Left = 325
        Top = 2
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          859.895833333333300000
          5.291666666666667000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblWorktopArea: TQRLabel
        Left = 424
        Top = 2
        Width = 90
        Height = 19
        Size.Values = (
          50.270833333333330000
          1121.833333333333000000
          5.291666666666667000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 505
      Width = 756
      Height = 26
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceLine
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TQRLabel
        Left = 440
        Top = 3
        Width = 74
        Height = 19
        Size.Values = (
          50.270833333333330000
          1164.166666666667000000
          7.937500000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCutOut: TQRLabel
        Left = 341
        Top = 3
        Width = 68
        Height = 19
        Size.Values = (
          50.270833333333330000
          902.229166666666700000
          7.937500000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 531
      Width = 756
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceLine
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TQRLabel
        Left = 452
        Top = 2
        Width = 62
        Height = 19
        Size.Values = (
          50.270833333333330000
          1195.916666666667000000
          5.291666666666667000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblEdgeDescription: TQRLabel
        Left = 294
        Top = 3
        Width = 115
        Height = 19
        Size.Values = (
          50.270833333333330000
          777.875000000000000000
          7.937500000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 556
      Width = 756
      Height = 26
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceLine
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraQuantity: TQRDBText
        Left = 464
        Top = 4
        Width = 49
        Height = 19
        Size.Values = (
          50.270833333333330000
          1227.666666666667000000
          10.583333333333330000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQExtras
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
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
      object qrlblExtraDescription: TQRLabel
        Left = 291
        Top = 3
        Width = 118
        Height = 19
        Size.Values = (
          50.270833333333330000
          769.937500000000000000
          7.937500000000000000
          312.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
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
  object InvHeadSRC: TDataSource
    Left = 408
    Top = 271
  end
  object InvLineSQL: TFDQuery
    MasterSource = InvHeadSRC
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.*,'
      '        Vat.Vat_Rate,'
      '        Vat.Description,'
      '        Vat.VAT_Code,'
      '        Vat.Reverse_Charge,'
      '        Vat.Invoice_Text,'
      '        Sales_Order_Line.Quote'
      'FROM Sales_Order_Line'
      '      RIGHT JOIN (Vat'
      '      INNER JOIN Sales_Invoice_Line'
      '        ON Vat.Vat = Sales_Invoice_Line.Vat)'
      
        '        ON (Sales_Order_Line.Sales_order_Line_no = Sales_Invoice' +
        '_Line.Sales_Order_line_no) AND (Sales_Order_Line.Sales_Order = S' +
        'ales_Invoice_Line.Sales_Order)'
      'WHERE Sales_Invoice = :Sales_Invoice and'
      '('
      '(Sales_invoice_line.Not_printed <> '#39'Y'#39') or'
      '(Sales_invoice_line.Not_printed = null)'
      ')')
    Left = 480
    Top = 80
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object InvLineSRC: TDataSource
    DataSet = InvLineSQL
    Left = 376
    Top = 160
  end
  object qryComp: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from'
      'Company')
    Left = 464
    Top = 321
  end
  object UpInvHeadSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Sales_Invoice_Status = :Status,'
      '      Invoice_Date = :Invoice_Date,'
      '      invoice_no = :Sales_Invoice_No'
      'where Sales_invoice = :Sales_Invoice')
    Left = 368
    Top = 96
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Invoice_Date'
      end
      item
        Name = 'Sales_Invoice_No'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object UpInvLineSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Sales_Invoice_Line'
      'set Sales_Invoice_Status = :Status'
      'where (Sales_invoice = :Sales_Invoice) AND'
      '           (Invoice_Line_No = :Line)')
    Left = 456
    Top = 376
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Line'
      end>
  end
  object NotesSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_code = :Notes_code)'
      'Order By Notes_Line')
    Left = 448
    Top = 201
    ParamData = <
      item
        Name = 'Notes_code'
      end>
  end
  object CreditHeadSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      '           Customer.Is_Retail_Customer'
      'from Sales_Invoice,'
      '        Customer'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'C'#39') '
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer)'
      ' ')
    Left = 312
    Top = 21
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_Code = :Notes_Code)'
      'Order By Notes_Line')
    Left = 240
    Top = 21
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Product.Product_Code, '
      '          Sales_order_line.Description,'
      '          Sales_order_line.Sell_Unit'
      'from Sales_order_line, '
      '        Product'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no and'
      '(Sales_order_line.Product = Product.Product)')
    Left = 72
    Top = 20
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qrySOHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_order, Order_Ref_no, Customer, Install_address'
      'from Sales_order'
      'where Sales_order = :Sales_order')
    Left = 168
    Top = 24
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object qrySIHead: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Sales_invoice'
      'where invoice_no = :Invoice_no')
    Left = 32
    Top = 68
    ParamData = <
      item
        Name = 'Invoice_no'
      end>
  end
  object CustomerSQL: TFDQuery
    MasterSource = InvHeadSRC
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.Customer,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      'Customer.Account_Code'
      'from Sales_Invoice,'
      'Customer'
      'where'
      '(sales_invoice.Sales_Invoice = :Sales_Invoice) AND'
      '(Sales_Invoice.Customer = Customer.Customer)')
    Left = 376
    Top = 566
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Address.Address_Name,'
      '          Address.Street,'
      '           Address.Locale,'
      '           Address.Town_City,'
      '           Address.Postcode,'
      '           Address.County_State'
      'from Address'
      'where'
      'Address = :Address')
    Left = 456
    Top = 561
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryCompanyAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number, '
      'Company_Name,'
      'VAT_Number '
      'from Company')
    Left = 592
    Top = 201
  end
  object qryQCutOuts: TFDQuery
    MasterSource = InvLineSRC
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 974
    Top = 22
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQEdges: TFDQuery
    MasterSource = InvLineSRC
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 910
    Top = 22
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQExtras: TFDQuery
    MasterSource = InvLineSRC
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 1038
    Top = 25
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQElements: TFDQuery
    MasterSource = InvLineSRC
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description'
      'FROM Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN (Material_Use'
      '      RIGHT JOIN Quote_Element'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Element_number')
    Left = 840
    Top = 24
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object InvOneHeadSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      '           Customer.Is_Retail_Customer,'
      '           (Select Payment_Terms_Description'
      '            from Payment_Terms'
      
        '            where Payment_Terms.Payment_Terms = Sales_invoice.Pa' +
        'yment_Terms) as Payment_Terms_Description'
      'from Sales_Invoice,'
      '        Customer'
      'where'
      '(Sales_Invoice.Sales_invoice = :Sales_Invoice) AND '
      '(Sales_Invoice.Customer = Customer.Customer)')
    Left = 850
    Top = 113
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object InvRHeadSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      '           Customer.Is_Retail_Customer,'
      '           (Select Payment_Terms_Description'
      '            from Payment_Terms'
      
        '            where Payment_Terms.Payment_Terms = Sales_invoice.Pa' +
        'yment_Terms) as Payment_Terms_Description'
      'from Sales_Invoice,'
      '        Customer'
      'where'
      '(Sales_Invoice.Sales_invoice_Status = 20) AND'
      '(Sales_Invoice.Customer = Customer.Customer)'
      'order by Sales_Invoice_no')
    Left = 936
    Top = 113
  end
  object InvHeadSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      '           Customer.Is_Retail_Customer,'
      '           (Select Payment_Terms_Description'
      '            from Payment_Terms'
      
        '            where Payment_Terms.Payment_Terms = Sales_invoice.Pa' +
        'yment_Terms) as Payment_Terms_Description'
      'from Sales_Invoice,'
      '        Customer'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'I'#39') or'
      '(Sales_Invoice.Invoice_or_credit is null)'
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer)'
      'Order by Sales_invoice')
    Left = 1008
    Top = 112
  end
end
