object frmWTRPSalesInvoice: TfrmWTRPSalesInvoice
  Left = 58
  Top = 14
  Width = 1176
  Height = 884
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 494
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'Print Sales Invoice'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object InvoiceReport: TQuickRep
    Left = 80
    Top = -62
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    ReportTitle = 'Sales Invoice Print'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object InvoiceFooter: TQRBand
      Left = 38
      Top = 622
      Width = 756
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = InvoiceFooterAfterPrint
      AlignToBottom = True
      BeforePrint = InvoiceFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2000.250000000000000000)
      BandType = rbGroupFooter
      object qrlblReverseCharge: TQRLabel
        Left = 14
        Top = 1
        Width = 125
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          37.041666666666670000
          2.645833333333333000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ReverseCharge'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object InvoiceGroupHeader: TQRGroup
      Left = 38
      Top = 435
      Width = 756
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = InvoiceGroupHeaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        7.937500000000000000
        2000.250000000000000000)
      FooterBand = InvoiceFooter
      Master = InvoiceReport
      ReprintOnNewPage = False
    end
    object AddChargesFooter: TQRBand
      Left = 38
      Top = 564
      Width = 756
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = AddChargesFooterAfterPrint
      AlignToBottom = False
      BeforePrint = AddChargesFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2000.250000000000000000)
      BandType = rbGroupFooter
      object memoNotes: TQRMemo
        Left = 18
        Top = 3
        Width = 471
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          47.625000000000000000
          7.937500000000000000
          1246.187500000000000000)
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
        WordWrap = True
        FontSize = 9
      end
    end
    object InvoiceLine: TQRSubDetail
      Left = 38
      Top = 438
      Width = 756
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = InvoiceLineAfterPrint
      AlignToBottom = False
      BeforePrint = InvoiceLineBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      Master = InvoiceReport
      DataSet = InvLineSQL
      FooterBand = AddChargesFooter
      PrintBefore = False
      PrintIfEmpty = True
      object Dummy06: TQRLabel
        Left = 565
        Top = 2
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1494.895833333333000000
          5.291666666666667000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNN.NN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object VatTotalLbl: TQRLabel
        Left = 624
        Top = 2
        Width = 88
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1651.000000000000000000
          5.291666666666667000
          232.833333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object QtyInvoicedLbl: TQRLabel
        Left = 396
        Top = 3
        Width = 83
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1047.750000000000000000
          7.937500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 10
      end
      object lblDescription: TQRLabel
        Left = 17
        Top = 2
        Width = 504
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          44.979166666666670000
          5.291666666666667000
          1333.500000000000000000)
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
        WordWrap = True
        FontSize = 9
      end
      object GoodsLbl: TQRLabel
        Left = 567
        Top = 2
        Width = 55
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1500.187500000000000000
          5.291666666666667000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 57
      Width = 756
      Height = 378
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1000.125000000000000000
        2000.250000000000000000)
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 8
        Top = 346
        Width = 714
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          21.166666666666670000
          915.458333333333200000
          1889.125000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 528
        Top = 346
        Width = 100
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          1397.000000000000000000
          915.458333333333200000
          264.583333333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 360
        Top = 163
        Width = 361
        Height = 142
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          375.708333333333300000
          952.500000000000000000
          431.270833333333300000
          955.145833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 9
        Top = 163
        Width = 304
        Height = 142
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          375.708333333333300000
          23.812500000000000000
          431.270833333333300000
          804.333333333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object CustomerAddMemo: TQRMemo
        Left = 24
        Top = 180
        Width = 273
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333300000
          63.500000000000000000
          476.250000000000000000
          722.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object InvoiceNumberLbl: TQRLabel
        Left = 604
        Top = 168
        Width = 110
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1598.083333333333000000
          444.500000000000000000
          291.041666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object InvoiceDateLbl: TQRLabel
        Left = 630
        Top = 196
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1666.875000000000000000
          518.583333333333300000
          222.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object lblCustOrderNo: TQRLabel
        Left = 536
        Top = 255
        Width = 178
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1418.166666666667000000
          674.687500000000000000
          470.958333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lblCustOrderNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblInvoice: TQRLabel
        Left = 376
        Top = 1
        Width = 342
        Height = 112
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          296.333333333333300000
          994.833333333333300000
          2.645833333333333000
          904.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'INVOICE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -48
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 36
      end
      object qrlblInvoiceLabel: TQRLabel
        Left = 461
        Top = 168
        Width = 62
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1219.729166666667000000
          444.500000000000000000
          164.041666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Invoice No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 440
        Top = 196
        Width = 83
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1164.166666666667000000
          518.583333333333300000
          219.604166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date/Tax Point'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 442
        Top = 254
        Width = 81
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1169.458333333333000000
          672.041666666666700000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Order No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 360
        Top = 186
        Width = 361
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          952.500000000000000000
          492.125000000000000000
          955.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 360
        Top = 217
        Width = 361
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          952.500000000000000000
          574.145833333333300000
          955.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 360
        Top = 244
        Width = 361
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          952.500000000000000000
          645.583333333333300000
          955.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 525
        Top = 163
        Width = 9
        Height = 142
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          375.708333333333300000
          1389.062500000000000000
          431.270833333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 18
        Top = 350
        Width = 115
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          47.625000000000000000
          926.041666666666700000
          304.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Product Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblVatAmountLabel: TQRLabel
        Left = 639
        Top = 350
        Width = 75
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          1690.687500000000000000
          926.041666666666700000
          198.437500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblVatReg: TQRLabel
        Left = 557
        Top = 136
        Width = 162
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1473.729166666667000000
          359.833333333333300000
          428.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT Registration No. 816 8009 29'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 547
        Top = 350
        Width = 70
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          1447.270833333333000000
          926.041666666666700000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Net Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape6: TQRShape
        Left = 360
        Top = 274
        Width = 361
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          952.500000000000000000
          724.958333333333300000
          955.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object memAddress: TQRRichText
        Left = 10
        Top = 71
        Width = 353
        Height = 83
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          219.604166666666700000
          26.458333333333330000
          187.854166666666700000
          933.979166666666700000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
      object qrlblCompanyName: TQRLabel
        Left = 543
        Top = 112
        Width = 173
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1436.687500000000000000
          296.333333333333300000
          457.729166666666700000)
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
        WordWrap = True
        FontSize = 8
      end
      object qriHeadLogo: TQRImage
        Left = 10
        Top = 3
        Width = 300
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          26.458333333333330000
          7.937500000000000000
          793.750000000000000000)
        Stretch = True
      end
      object gtQRLabel8: TQRLabel
        Left = 447
        Top = 226
        Width = 76
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1182.687500000000000000
          597.958333333333300000
          201.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Our Order No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblReference: TQRLabel
        Left = 536
        Top = 226
        Width = 178
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1418.166666666667000000
          597.958333333333300000
          470.958333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel10: TQRLabel
        Left = 434
        Top = 283
        Width = 89
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1148.291666666667000000
          748.770833333333300000
          235.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblCustReference: TQRLabel
        Left = 536
        Top = 283
        Width = 178
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1418.166666666667000000
          748.770833333333300000
          470.958333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblCustReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 40
        Top = 315
        Width = 77
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          833.437500000000000000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblAccountCode: TQRLabel
        Left = 123
        Top = 315
        Width = 103
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          325.437500000000000000
          833.437500000000000000
          272.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblAccountCode'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 644
      Width = 756
      Height = 222
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        587.375000000000000000
        2000.250000000000000000)
      BandType = rbPageFooter
      object QRShape10: TQRShape
        Left = 528
        Top = 10
        Width = 194
        Height = 147
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          388.937500000000000000
          1397.000000000000000000
          26.458333333333330000
          513.291666666666700000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 529
        Top = 94
        Width = 192
        Height = 6
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          15.875000000000000000
          1399.645833333333000000
          248.708333333333300000
          508.000000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 529
        Top = 64
        Width = 192
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1399.645833333333000000
          169.333333333333300000
          508.000000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 529
        Top = 33
        Width = 192
        Height = 6
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          15.875000000000000000
          1399.645833333333000000
          87.312500000000000000
          508.000000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblReference: TQRLabel
        Left = 16
        Top = 177
        Width = 71
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          42.333333333333330000
          468.312500000000000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblTotalNettLabel: TQRLabel
        Left = 436
        Top = 14
        Width = 53
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1153.583333333333000000
          37.041666666666670000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object GoodsValueLbl: TQRLabel
        Left = 537
        Top = 15
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1420.812500000000000000
          39.687500000000000000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object VATValueLbl: TQRLabel
        Left = 553
        Top = 44
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1463.145833333333000000
          116.416666666666700000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object qrlblTotalVatLabel: TQRLabel
        Left = 436
        Top = 43
        Width = 52
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1153.583333333333000000
          113.770833333333300000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object QRShape9: TQRShape
        Left = 8
        Top = 7
        Width = 521
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          18.520833333333330000
          1378.479166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblDepositPaid: TQRLabel
        Left = 436
        Top = 105
        Width = 72
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          277.812500000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object DepositLbl: TQRLabel
        Left = 562
        Top = 105
        Width = 61
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1486.958333333333000000
          277.812500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object TotalValueLbl: TQRLabel
        Left = 545
        Top = 76
        Width = 78
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1441.979166666667000000
          201.083333333333300000
          206.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object qrlblInvoiceTotal: TQRLabel
        Left = 436
        Top = 76
        Width = 72
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          201.083333333333300000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object qrshpPayment: TQRShape
        Left = 8
        Top = 58
        Width = 409
        Height = 114
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          301.625000000000000000
          21.166666666666670000
          153.458333333333300000
          1082.145833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 16
        Top = 68
        Width = 393
        Height = 96
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          254.000000000000000000
          42.333333333333330000
          179.916666666666700000
          1039.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape5: TQRShape
        Left = 529
        Top = 124
        Width = 192
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1399.645833333333000000
          328.083333333333400000
          508.000000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblToPay: TQRLabel
        Left = 436
        Top = 135
        Width = 38
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1153.583333333333000000
          357.187500000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object ToPayLbl: TQRLabel
        Left = 571
        Top = 135
        Width = 52
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1510.770833333333000000
          357.187500000000000000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object qrlblPaymentTerms: TQRLabel
        Left = 12
        Top = 35
        Width = 97
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          92.604166666666670000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
    end
    object qrLoopB: TQRLoopBand
      Left = 38
      Top = 593
      Width = 756
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = InvoiceFooter
      Size.Values = (
        76.729166666666670000
        2000.250000000000000000)
      Master = InvoiceReport
      PrintCount = 0
      PrintBefore = False
    end
    object gtQRShape1: TQRShape
      Left = 756
      Top = 403
      Width = 6
      Height = 653
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1727.729166666667000000
        2000.250000000000000000
        1066.270833333333000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape2: TQRShape
      Left = 664
      Top = 403
      Width = 2
      Height = 653
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1727.729166666667000000
        1756.833333333333000000
        1066.270833333333000000
        5.291666666666667000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape3: TQRShape
      Left = 563
      Top = 403
      Width = 6
      Height = 653
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1727.729166666667000000
        1489.604166666667000000
        1066.270833333333000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape4: TQRShape
      Left = 43
      Top = 403
      Width = 6
      Height = 507
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1341.437500000000000000
        113.770833333333300000
        1066.270833333333000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 458
      Width = 756
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      Master = InvoiceLine
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopArea: TQRLabel
        Left = 438
        Top = 2
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1158.875000000000000000
          5.291666666666667000
          222.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblWorktopSize: TQRLabel
        Left = 16
        Top = 2
        Width = 441
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          5.291666666666667000
          1166.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 478
      Width = 756
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      Master = InvoiceLine
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblEdgeDescription: TQRLabel
        Left = 16
        Top = 3
        Width = 441
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          7.937500000000000000
          1166.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblLength: TQRLabel
        Left = 459
        Top = 2
        Width = 63
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1214.437500000000000000
          5.291666666666667000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 498
      Width = 756
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      Master = InvoiceLine
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblCutOut: TQRLabel
        Left = 16
        Top = 3
        Width = 441
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          7.937500000000000000
          1166.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblQuantity: TQRLabel
        Left = 453
        Top = 3
        Width = 69
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1198.562500000000000000
          7.937500000000000000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 518
      Width = 756
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      Master = InvoiceLine
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraQuantity: TQRDBText
        Left = 476
        Top = 4
        Width = 45
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1259.416666666667000000
          10.583333333333330000
          119.062500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object qrlblExtraDescription: TQRLabel
        Left = 16
        Top = 3
        Width = 441
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          7.937500000000000000
          1166.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrsdQLabour: TQRSubDetail
      Left = 38
      Top = 538
      Width = 756
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQLabourBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      Master = InvoiceLine
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLabourVAT: TQRLabel
        Left = 620
        Top = 5
        Width = 92
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1640.416666666667000000
          13.229166666666670000
          243.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblLabourVAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblLabourUTR: TQRLabel
        Left = 386
        Top = 5
        Width = 135
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1021.291666666667000000
          13.229166666666670000
          357.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Labour Content - UTR: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblLabourCharge: TQRLabel
        Left = 513
        Top = 5
        Width = 108
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1357.312500000000000000
          13.229166666666670000
          285.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblLabourCharge'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
  end
  object InvHeadSRC: TDataSource
    Left = 408
    Top = 271
  end
  object InvLineSQL: TQuery
    DatabaseName = 'wt'
    DataSource = InvHeadSRC
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
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object InvLineSRC: TDataSource
    DataSet = InvLineSQL
    Left = 376
    Top = 160
  end
  object qryComp: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from'
      'Company')
    Left = 464
    Top = 321
  end
  object UpInvHeadSQL: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object UpInvLineSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'update Sales_Invoice_Line'
      'set Sales_Invoice_Status = :Status'
      'where (Sales_invoice = :Sales_Invoice) AND'
      '           (Invoice_Line_No = :Line)')
    Left = 456
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object NotesSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_code = :Notes_code)'
      'Order By Notes_Line')
    Left = 448
    Top = 201
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_code'
        ParamType = ptUnknown
      end>
  end
  object CreditHeadSQL: TQuery
    DatabaseName = 'wt'
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
  object GetNarrSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_Code = :Notes_Code)'
      'Order By Notes_Line')
    Left = 240
    Top = 21
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qrySOLine: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qrySIHead: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Sales_invoice'
      'where invoice_no = :Invoice_no')
    Left = 32
    Top = 68
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_no'
        ParamType = ptUnknown
      end>
  end
  object CustomerSQL: TQuery
    DatabaseName = 'wt'
    DataSource = InvHeadSRC
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
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryAddress: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
  object qryQCutOuts: TQuery
    DatabaseName = 'WT'
    DataSource = InvLineSRC
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 974
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQEdges: TQuery
    DatabaseName = 'wt'
    DataSource = InvLineSRC
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
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQExtras: TQuery
    DatabaseName = 'WT'
    DataSource = InvLineSRC
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 1038
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQElements: TQuery
    DatabaseName = 'WT'
    DataSource = InvLineSRC
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
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryCompanyAddress: TQuery
    DatabaseName = 'wt'
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
      'Web_Address,'
      'Unique_Tax_Reference '
      'from Company')
    Left = 944
    Top = 180
  end
  object InvOneHeadSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      '           Customer.Is_Retail_Customer,'
      '           Customer.Account_is_Factored,'
      '           Customer.Invoice_Label,'
      '           Customer.Separate_Labour_Invoice_Value,'
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
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object InvRHeadSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      '           Customer.Is_Retail_Customer,'
      '           Customer.Account_is_Factored,'
      '           Customer.Invoice_Label,'
      '           Customer.Separate_Labour_Invoice_Value,'
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
  object InvHeadSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Customer_Name,'
      '           Customer.Street,'
      '           Customer.Locale,'
      '           Customer.Town_City,'
      '           Customer.Postcode,'
      '           Customer.County_State,'
      '           Customer.Is_Retail_Customer,'
      '           Customer.Account_is_Factored,'
      '           Customer.Invoice_Label,'
      '           Customer.Separate_Labour_Invoice_Value,'
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
  object qrySOHead: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select  Sales_order,'
      '        Reference,'
      '        Order_Ref_no,'
      '        Customer,'
      '        Install_address,'
      '        Contact_Name,'
      '        Date_Raised,'
      '        Date_Required'
      'from Sales_order'
      'where Sales_order = :Sales_order')
    Left = 168
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryQLabour: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_order_line.Sales_Order,'
      '        Sales_order_line.Sales_order_Line_no,'
      '        Sales_order_line.Installation_price,'
      '        Sales_order_line.Survey_price,'
      '        Sales_order_line.Delivery_Price,'
      '        Sales_order_line.Markup_Value,'
      '        Sales_order_line.Waste_Value'
      'FROM Sales_order_line'
      'WHERE Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no')
    Left = 936
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetReverseCharge: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT top 1 Sales_Invoice_Line.*,'
      '        Vat.Vat_Rate,'
      '        Vat.Description,'
      '        Vat.VAT_Code,'
      '        Vat.Reverse_Charge,'
      '        Vat.Reverse_Charge_Vat_Rate,'
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
      ')'
      'ORDER BY Sales_Invoice_Line.Invoice_line_no')
    Left = 936
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
end
