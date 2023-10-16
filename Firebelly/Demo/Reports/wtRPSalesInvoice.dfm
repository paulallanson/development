object frmWTRPSalesInvoice: TfrmWTRPSalesInvoice
  Left = 0
  Top = 0
  Width = 1176
  Height = 780
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 599
  VertScrollBar.Range = 2000
  Caption = 'Print Sales Invoice'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 15
  object InvoiceReport: TQuickRep
    Left = 120
    Top = -239
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = InvoiceReportBeforePrint
    DataSet = InvOneHeadSQL
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
      150.000000000000000000
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
    PrinterSettings.ColorOption = 2
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
      Top = 626
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
      Top = 435
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
      Top = 568
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
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object InvoiceLine: TQRSubDetail
      Left = 38
      Top = 438
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
        Left = 565
        Top = 5
        Width = 59
        Height = 16
        Size.Values = (
          42.333333333333330000
          1494.895833333333000000
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
        Left = 624
        Top = 3
        Width = 88
        Height = 19
        Size.Values = (
          50.270833333333330000
          1651.000000000000000000
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
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = VatTotalLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
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
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lblDescriptionPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object GoodsLbl: TQRLabel
        Left = 567
        Top = 3
        Width = 55
        Height = 19
        Size.Values = (
          50.270833333333330000
          1500.187500000000000000
          7.937500000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'GoodsLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = GoodsLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 57
      Width = 756
      Height = 378
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1000.125000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 8
        Top = 346
        Width = 714
        Height = 31
        Size.Values = (
          82.020833333333340000
          21.166666666666670000
          915.458333333333200000
          1889.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 528
        Top = 346
        Width = 100
        Height = 31
        Size.Values = (
          82.020833333333340000
          1397.000000000000000000
          915.458333333333200000
          264.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 424
        Top = 179
        Width = 297
        Height = 142
        Size.Values = (
          375.708333333333300000
          1121.833333333333000000
          473.604166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 9
        Top = 179
        Width = 336
        Height = 142
        Size.Values = (
          375.708333333333300000
          23.812500000000000000
          473.604166666666700000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object CustomerAddMemo: TQRMemo
        Left = 40
        Top = 196
        Width = 273
        Height = 121
        Size.Values = (
          320.145833333333300000
          105.833333333333300000
          518.583333333333300000
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
        Font.Name = 'Arial'
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
        Top = 182
        Width = 110
        Height = 20
        Size.Values = (
          52.916666666666670000
          1598.083333333333000000
          481.541666666666700000
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
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = InvoiceNumberLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object InvoiceDateLbl: TQRLabel
        Left = 630
        Top = 210
        Width = 84
        Height = 20
        Size.Values = (
          52.916666666666670000
          1666.875000000000000000
          555.625000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'InvoiceDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = InvoiceDateLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustOrderNo: TQRLabel
        Left = 560
        Top = 239
        Width = 154
        Height = 20
        Size.Values = (
          52.916666666666670000
          1481.666666666667000000
          632.354166666666700000
          407.458333333333300000)
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
      object qrlblInvoiceLabel: TQRLabel
        Left = 437
        Top = 182
        Width = 62
        Height = 20
        Size.Values = (
          52.916666666666670000
          1156.229166666667000000
          481.541666666666700000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel5: TQRLabel
        Left = 437
        Top = 210
        Width = 82
        Height = 20
        Size.Values = (
          52.916666666666670000
          1156.229166666667000000
          555.625000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date/Tax point'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel7: TQRLabel
        Left = 437
        Top = 268
        Width = 69
        Height = 19
        Size.Values = (
          50.270833333333330000
          1156.229166666667000000
          709.083333333333300000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel6: TQRLabel
        Left = 437
        Top = 239
        Width = 84
        Height = 20
        Size.Values = (
          52.916666666666670000
          1156.229166666667000000
          632.354166666666700000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 424
        Top = 202
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          534.458333333333300000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 424
        Top = 233
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          616.479166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 424
        Top = 260
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          687.916666666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 549
        Top = 179
        Width = 9
        Height = 142
        Size.Values = (
          375.708333333333300000
          1452.562500000000000000
          473.604166666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 18
        Top = 350
        Width = 115
        Height = 22
        Size.Values = (
          58.208333333333330000
          47.625000000000000000
          926.041666666666700000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel10: TQRLabel
        Left = 639
        Top = 350
        Width = 75
        Height = 22
        Size.Values = (
          58.208333333333330000
          1690.687500000000000000
          926.041666666666700000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VAT Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblVatReg: TQRLabel
        Left = 549
        Top = 136
        Width = 162
        Height = 19
        Size.Values = (
          50.270833333333330000
          1452.562500000000000000
          359.833333333333300000
          428.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT Registration No. 816 8009 29'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblAccountCode: TQRLabel
        Left = 612
        Top = 268
        Width = 102
        Height = 19
        Size.Values = (
          50.270833333333330000
          1619.250000000000000000
          709.083333333333300000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblAccountCode'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel9: TQRLabel
        Left = 547
        Top = 350
        Width = 70
        Height = 22
        Size.Values = (
          58.208333333333330000
          1447.270833333333000000
          926.041666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Net Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape6: TQRShape
        Left = 424
        Top = 290
        Width = 297
        Height = 5
        Size.Values = (
          13.229166666666670000
          1121.833333333333000000
          767.291666666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 437
        Top = 297
        Width = 77
        Height = 19
        Size.Values = (
          50.270833333333330000
          1156.229166666667000000
          785.812500000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Person'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblAccountManager: TQRLabel
        Left = 591
        Top = 297
        Width = 123
        Height = 19
        Size.Values = (
          50.270833333333330000
          1563.687500000000000000
          785.812500000000000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblAccountManager'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object memAddress: TQRRichText
        Left = 286
        Top = 6
        Width = 138
        Height = 121
        Size.Values = (
          320.145833333333300000
          756.708333333333300000
          15.875000000000000000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object qrlblCompanyName: TQRLabel
        Left = 535
        Top = 72
        Width = 173
        Height = 16
        Size.Values = (
          42.333333333333330000
          1415.520833333333000000
          190.500000000000000000
          457.729166666666700000)
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
        Font.Color = clBlack
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
      object qriHeadLogo: TQRImage
        Left = 12
        Top = 6
        Width = 270
        Height = 152
        Size.Values = (
          402.166666666666700000
          31.750000000000000000
          15.875000000000000000
          714.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 629
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
        Top = 10
        Width = 194
        Height = 147
        Size.Values = (
          388.937500000000000000
          1397.000000000000000000
          26.458333333333330000
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
        Top = 174
        Width = 71
        Height = 18
        Size.Values = (
          47.625000000000000000
          42.333333333333330000
          460.375000000000000000
          187.854166666666700000)
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
        Font.Name = 'Arial'
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
        Width = 53
        Height = 21
        Size.Values = (
          55.562500000000000000
          1153.583333333333000000
          37.041666666666670000
          140.229166666666700000)
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
        Font.Name = 'Arial'
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
        Left = 537
        Top = 15
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          1420.812500000000000000
          39.687500000000000000
          227.541666666666700000)
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
        Font.Name = 'Arial'
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
        Left = 553
        Top = 44
        Width = 70
        Height = 16
        Size.Values = (
          42.333333333333330000
          1463.145833333333000000
          116.416666666666700000
          185.208333333333300000)
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
        Font.Name = 'Arial'
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
        Width = 52
        Height = 19
        Size.Values = (
          50.270833333333330000
          1153.583333333333000000
          113.770833333333300000
          137.583333333333300000)
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
        Font.Name = 'Arial'
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
        Top = 7
        Width = 521
        Height = 7
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          18.520833333333330000
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
        Width = 72
        Height = 16
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          277.812500000000000000
          190.500000000000000000)
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
        Font.Name = 'Arial'
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
        Left = 562
        Top = 105
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333330000
          1486.958333333333000000
          277.812500000000000000
          161.395833333333300000)
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
        Font.Name = 'Arial'
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
        Left = 545
        Top = 76
        Width = 78
        Height = 16
        Size.Values = (
          42.333333333333330000
          1441.979166666667000000
          201.083333333333300000
          206.375000000000000000)
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
        Font.Name = 'Arial'
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
        Width = 72
        Height = 16
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          201.083333333333300000
          190.500000000000000000)
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
        Font.Name = 'Arial'
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
        Top = 55
        Width = 409
        Height = 114
        Size.Values = (
          301.625000000000000000
          21.166666666666670000
          145.520833333333300000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 16
        Top = 65
        Width = 393
        Height = 96
        Size.Values = (
          254.000000000000000000
          42.333333333333330000
          171.979166666666700000
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
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Payment by cheque payable etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
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
        Width = 38
        Height = 16
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          357.187500000000000000
          100.541666666666700000)
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
        Font.Name = 'Arial'
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
        Left = 571
        Top = 135
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          1510.770833333333000000
          357.187500000000000000
          137.583333333333300000)
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
        Font.Name = 'Arial'
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
        Width = 97
        Height = 16
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          89.958333333333330000
          256.645833333333300000)
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
        Font.Name = 'Arial'
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
      Top = 597
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
      Left = 756
      Top = 403
      Width = 6
      Height = 653
      Size.Values = (
        1727.729166666667000000
        2000.250000000000000000
        1066.270833333333000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape2: TQRShape
      Left = 664
      Top = 403
      Width = 2
      Height = 653
      Size.Values = (
        1727.729166666667000000
        1756.833333333333000000
        1066.270833333333000000
        5.291666666666667000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape3: TQRShape
      Left = 563
      Top = 403
      Width = 6
      Height = 653
      Size.Values = (
        1727.729166666667000000
        1489.604166666667000000
        1066.270833333333000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape4: TQRShape
      Left = 43
      Top = 403
      Width = 6
      Height = 507
      Size.Values = (
        1341.437500000000000000
        113.770833333333300000
        1066.270833333333000000
        15.875000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 467
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
        Left = 327
        Top = 2
        Width = 82
        Height = 19
        Size.Values = (
          50.270833333333330000
          865.187500000000000000
          5.291666666666667000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object lblWorktopArea: TQRLabel
        Left = 430
        Top = 2
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          1137.708333333333000000
          5.291666666666667000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 491
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
        Left = 445
        Top = 3
        Width = 69
        Height = 19
        Size.Values = (
          50.270833333333330000
          1177.395833333333000000
          7.937500000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblCutOut: TQRLabel
        Left = 346
        Top = 3
        Width = 63
        Height = 19
        Size.Values = (
          50.270833333333330000
          915.458333333333300000
          7.937500000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 517
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
        Left = 451
        Top = 2
        Width = 63
        Height = 19
        Size.Values = (
          50.270833333333330000
          1193.270833333333000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblEdgeDescription: TQRLabel
        Left = 292
        Top = 3
        Width = 117
        Height = 19
        Size.Values = (
          50.270833333333330000
          772.583333333333300000
          7.937500000000000000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 542
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
        Left = 468
        Top = 4
        Width = 45
        Height = 19
        Size.Values = (
          50.270833333333330000
          1238.250000000000000000
          10.583333333333330000
          119.062500000000000000)
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
      object qrlblExtraDescription: TQRLabel
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
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
  object InvHeadSRC: TDataSource
    DataSet = InvOneHeadSQL
    Left = 480
    Top = 295
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
    Left = 48
    Top = 505
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
      'SELECT  Sales_order.Sales_Order,'
      '        Sales_order.Order_ref_no,'
      '        Sales_order.Customer,'
      '        Sales_order.Install_Address,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Sales_order.Account_Manager'
      'FROM Operator'
      
        '        RIGHT JOIN Sales_order ON Operator.Operator = Sales_orde' +
        'r.Account_Manager'
      'WHERE Sales_Order.Sales_Order = :Sales_Order')
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
      'VAT_Number,'
      'Email_Address,'
      'Web_Address '
      'from Company')
    Left = 944
    Top = 180
  end
end
