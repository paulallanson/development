object PBRPSalesInvFrm: TPBRPSalesInvFrm
  Left = 46
  Top = 0
  Width = 1173
  Height = 724
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'Sales Invoice'
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
    Left = 112
    Top = 40
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnNeedData = InvoiceReportNeedData
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = True
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object InvoiceFooter: TQRBand
      Left = 0
      Top = 633
      Width = 794
      Height = 2
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
        5.291666666666667000
        2100.791666666667000000)
      BandType = rbGroupFooter
    end
    object InvoiceGroupHeader: TQRGroup
      Left = 0
      Top = 503
      Width = 794
      Height = 2
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
        5.291666666666667000
        2100.791666666667000000)
      FooterBand = InvoiceFooter
      Master = InvoiceReport
      ReprintOnNewPage = False
    end
    object AddChargesFooter: TQRBand
      Left = 0
      Top = 552
      Width = 794
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = AddChargesFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        214.312500000000000000
        2100.791666666667000000)
      BandType = rbGroupFooter
      object gtNotesShape: TgtQRShape
        Left = 104
        Top = 8
        Width = 561
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          275.166666666666700000
          21.166666666666670000
          1484.312500000000000000)
        Pen.Color = 29670
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object RichmemoNotes: TgtQRRichText
        Left = 136
        Top = 19
        Width = 529
        Height = 20
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          359.833333333333300000
          50.270833333333330000
          1399.645833333333000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        Lines.Strings = (
          'memoNotes')
      end
      object memoNotes: TgtQRMemo
        Left = 120
        Top = 17
        Width = 537
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          317.500000000000000000
          44.979166666666670000
          1420.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
    object InvoiceHeader: TQRSubDetail
      Left = 0
      Top = 505
      Width = 794
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = InvoiceHeaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2100.791666666667000000)
      Master = InvoiceReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object InvoiceLine: TQRSubDetail
      Left = 0
      Top = 507
      Width = 794
      Height = 23
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
        60.854166666666670000
        2100.791666666667000000)
      Master = InvoiceReport
      DataSet = InvLineSQL
      PrintBefore = False
      PrintIfEmpty = True
      object GoodsVatLbl: TgtQRLabel
        Left = 706
        Top = 2
        Width = 60
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1867.958333333333000000
          5.291666666666667000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'GoodsVatLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = GoodsTotalLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object GoodsTotalLbl: TgtQRLabel
        Left = 623
        Top = 2
        Width = 88
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1648.354166666667000000
          5.291666666666667000
          232.833333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'GoodsTotalLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = GoodsTotalLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object VatPerclbl: TgtQRLabel
        Left = 582
        Top = 2
        Width = 56
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1539.875000000000000000
          5.291666666666667000
          148.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VatPerclbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = GoodsTotalLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QtyInvoicedLbl: TgtQRLabel
        Left = 37
        Top = 2
        Width = 61
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          97.895833333333330000
          5.291666666666667000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QtyInvdLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = QtyInvoicedLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblPriceUnit: TgtQRLabel
        Left = 526
        Top = 2
        Width = 64
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1391.708333333333000000
          5.291666666666667000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblPriceUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object GoodsLbl: TgtQRLabel
        Left = 469
        Top = 2
        Width = 52
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1240.895833333333000000
          5.291666666666667000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GoodsLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = GoodsLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblProduct: TgtQRLabel
        Left = 104
        Top = 2
        Width = 145
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          5.291666666666667000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lblProduct'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblDescription: TgtQRLabel
        Left = 255
        Top = 2
        Width = 202
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          674.687500000000000000
          5.291666666666667000
          534.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object InvoiceCharges: TQRSubDetail
      Left = 0
      Top = 530
      Width = 794
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = InvoiceChargesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2100.791666666667000000)
      Master = InvoiceReport
      DataSet = qryInvCharges
      FooterBand = AddChargesFooter
      PrintBefore = False
      PrintIfEmpty = True
      object ExtrasVatLbl: TgtQRLabel
        Left = 699
        Top = 1
        Width = 68
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1849.437500000000000000
          2.645833333333333000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ExtrasVatLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText3: TgtQRDBText
        Left = 104
        Top = 1
        Width = 377
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          2.645833333333333000
          997.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryInvCharges
        DataField = 'Details'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblAmount: TgtQRLabel
        Left = 654
        Top = 1
        Width = 57
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1730.375000000000000000
          2.645833333333333000
          150.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblAmount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 0
      Top = 19
      Width = 794
      Height = 484
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1280.583333333333000000
        2100.791666666667000000)
      BandType = rbPageHeader
      object memDefPayment: TgtQRMemo
        Left = 32
        Top = 334
        Width = 369
        Height = 60
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          158.750000000000000000
          84.666666666666670000
          883.708333333333300000
          976.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Payment by cheque payable to Mailadoc Print and Mailing '
          'Solutions or by BACS to Nat West Bank Sort Code: 60-03-27  '
          'A/C: 78177987')
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 8
      end
      object CustomerAddMemo: TgtQRMemo
        Left = 72
        Top = 194
        Width = 337
        Height = 116
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          306.916666666666700000
          190.500000000000000000
          513.291666666666700000
          891.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
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
      object InvoiceNumberLbl: TgtQRLabel
        Left = 609
        Top = 264
        Width = 110
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          1611.312500000000000000
          698.500000000000000000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'InvoiceNumberLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = InvoiceNumberLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object InvoiceDateLbl: TgtQRLabel
        Left = 609
        Top = 291
        Width = 81
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          769.937500000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'InvoiceDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = InvoiceDateLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object OurJobLbl: TgtQRLabel
        Left = 609
        Top = 370
        Width = 58
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          978.958333333333300000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OurJobLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = OurJobLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblCustOrderNo: TgtQRLabel
        Left = 609
        Top = 319
        Width = 87
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          844.020833333333300000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblCustOrderNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object CustAccount: TgtQRDBText
        Left = 609
        Top = 346
        Width = 79
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          915.458333333333300000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = CustomerSQL
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = CustAccountPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblInvoiceLabel: TgtQRLabel
        Left = 588
        Top = 160
        Width = 169
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          1555.750000000000000000
          423.333333333333300000
          447.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Invoice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 22
      end
      object QRLabel4: TgtQRLabel
        Left = 504
        Top = 264
        Width = 61
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          698.500000000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Invoice No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel5: TgtQRLabel
        Left = 504
        Top = 291
        Width = 68
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          769.937500000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Invoice Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel6: TgtQRLabel
        Left = 504
        Top = 319
        Width = 48
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          844.020833333333300000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel7: TgtQRLabel
        Left = 504
        Top = 346
        Width = 53
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          915.458333333333300000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'A/C Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblJobNumber: TgtQRLabel
        Left = 504
        Top = 370
        Width = 66
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          978.958333333333300000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel9: TgtQRLabel
        Left = 72
        Top = 467
        Width = 22
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          1235.604166666667000000
          58.208333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel10: TgtQRLabel
        Left = 104
        Top = 467
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          1235.604166666667000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel11: TgtQRLabel
        Left = 463
        Top = 467
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1225.020833333333000000
          1235.604166666667000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel12: TgtQRLabel
        Left = 535
        Top = 467
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          1235.604166666667000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price unit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel13: TgtQRLabel
        Left = 680
        Top = 467
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1799.166666666667000000
          1235.604166666667000000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrshpPayment: TgtQRShape
        Left = 72
        Top = 344
        Width = 393
        Height = 73
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333300000
          190.500000000000000000
          910.166666666666700000
          1039.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TgtQRMemo
        Left = 80
        Top = 350
        Width = 369
        Height = 60
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          158.750000000000000000
          211.666666666666700000
          926.041666666666700000
          976.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Payment by cheque payable to Mailadoc Print and Mailing '
          'Solutions or by BACS to Nat West Bank Sort Code: 60-03-27  '
          'A/C: 78177987')
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 8
      end
      object QRMemoCmpnyNm: TgtQRMemo
        Left = 568
        Top = 124
        Width = 99
        Height = 14
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1502.833333333333000000
          328.083333333333300000
          261.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lblInvoiceDescription: TgtQRLabel
        Left = 136
        Top = 424
        Width = 633
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          359.833333333333300000
          1121.833333333333000000
          1674.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lblInvoiceDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel18: TgtQRLabel
        Left = 72
        Top = 424
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          1121.833333333333000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Project:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblReference: TgtQRLabel
        Left = 504
        Top = 398
        Width = 68
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1333.500000000000000000
          1053.041666666667000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel8: TgtQRLabel
        Left = 745
        Top = 467
        Width = 21
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1971.145833333333000000
          1235.604166666667000000
          55.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object imgReport: TgtQRImage
        Left = 40
        Top = 32
        Width = 717
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125000000000000000
          105.833333333333300000
          84.666666666666670000
          1897.062500000000000000)
        Stretch = True
      end
      object gtQRLabel2: TgtQRLabel
        Left = 602
        Top = 467
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1592.791666666667000000
          1235.604166666667000000
          95.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT%'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand2: TQRBand
      Left = 0
      Top = 635
      Width = 794
      Height = 142
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
        375.708333333333300000
        2100.791666666667000000)
      BandType = rbPageFooter
      object QRLabel16: TgtQRLabel
        Left = 74
        Top = 7
        Width = 91
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          195.791666666666700000
          18.520833333333330000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object BranchAddMemo: TgtQRMemo
        Left = 74
        Top = 23
        Width = 257
        Height = 103
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          272.520833333333300000
          195.791666666666700000
          60.854166666666670000
          679.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'Deliver To XXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXX')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object GoodsValueLbl: TgtQRLabel
        Left = 685
        Top = 7
        Width = 82
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1812.395833333333000000
          18.520833333333330000
          216.958333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GoodsValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object TotalValueLbl: TgtQRLabel
        Left = 693
        Top = 61
        Width = 74
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1833.562500000000000000
          161.395833333333300000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TotalValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel1: TgtQRLabel
        Left = 635
        Top = 7
        Width = 51
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1680.104166666667000000
          18.520833333333330000
          134.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel14: TgtQRLabel
        Left = 660
        Top = 34
        Width = 26
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1746.250000000000000000
          89.958333333333330000
          68.791666666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel15: TgtQRLabel
        Left = 616
        Top = 61
        Width = 70
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1629.833333333333000000
          161.395833333333300000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Invoice Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object VATValueLbl: TgtQRLabel
        Left = 697
        Top = 34
        Width = 70
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1844.145833333333000000
          89.958333333333330000
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
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = VATValueLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
  end
  object InvHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode,'
      '           (SELECT Price_Unit_Factor'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Factor,'
      '           (SELECT Description'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Description'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'I'#39') or'
      '(Sales_Invoice.Invoice_or_credit is null)'
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')')
    Left = 840
    Top = 56
  end
  object InvHeadSRC: TDataSource
    DataSet = InvOneHeadSQL
    Left = 928
    Top = 463
  end
  object InvLineSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.*,'
      '        Price_Unit.Price_Unit,'
      '        Price_Unit.Description AS Sales_Unit_Desc,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Vat_Code.VAT_Ref'
      'FROM Vat_Code'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      
        '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) O' +
        'N'
      '        Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code'
      'WHERE Sales_Invoice = :Sales_Invoice and'
      '('
      
        '(Sales_invoice_line.Not_printed <> '#39'Y'#39') or (Sales_invoice_line.N' +
        'ot_printed = null)'
      ')'
      'AND'
      '('
      
        '(Sales_Invoice_line.Goods_Value <> 0) or (:Show_Zero_Values = '#39'Y' +
        #39')'
      ')'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 920
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Show_Zero_Values'
        ParamType = ptUnknown
      end>
  end
  object InvLineSRC: TDataSource
    DataSet = InvLineSQL
    Left = 1032
    Top = 474
  end
  object CustomerSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'select Sales_Invoice.Customer,'
      'Customer.Name as Customer_name,'
      'Customer_Branch.Building_no_Name,'
      'Customer_Branch.Street,'
      'Customer_Branch.Locale,'
      'Customer_Branch.Town,'
      'Customer_Branch.Postcode,'
      'Customer_Branch.Account_Code,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name,'
      'Customer.Pre_Pay_Balance'
      'from Sales_Invoice,'
      'Customer_Branch,'
      'Customer'
      'where'
      '(sales_invoice.Sales_Invoice = :Sales_Invoice) AND'
      '(Sales_Invoice.Inv_to_Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Inv_to_Customer = Customer_Branch.Customer) AND'
      '(Sales_Invoice.Inv_to_Branch = Customer_Branch.Branch_no)'
      ')'
      '')
    Left = 936
    Top = 576
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryComp: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from'
      'Company')
    Left = 928
    Top = 521
  end
  object InvOneHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode,'
      '           (SELECT Price_Unit_Factor'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Factor,'
      '           (SELECT Description'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Description'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '(Sales_Invoice.Sales_invoice = :Sales_Invoice) AND '
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      ' ')
    Left = 922
    Top = 289
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object UpInvHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Sales_Invoice_Status = :Status,'
      '      Invoice_Date = :Invoice_Date,'
      '      Sales_invoice_no = :Sales_Invoice_No'
      'where Sales_invoice = :Sales_Invoice')
    Left = 1032
    Top = 442
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
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice_Line'
      'set Sales_Invoice_Status = :Status'
      'where (Sales_invoice = :Sales_Invoice) AND'
      '           (Invoice_Line_No = :Line)')
    Left = 928
    Top = 400
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
  object InvRHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode,'
      '           (SELECT Price_Unit_Factor'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Factor,'
      '           (SELECT Description'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Description'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '(Sales_Invoice.Sales_invoice_Status = 20) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      'order by Sales_Invoice_no')
    Left = 928
    Top = 49
  end
  object NotesSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 920
    Top = 225
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object InvAddChgSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvLineSRC
    SQL.Strings = (
      'select * '
      'from sales_inv_line_add_chg'
      'where (sales_invoice = :Sales_invoice) and'
      '(Invoice_Line_No = :Invoice_Line_no) and'
      '(Quotation_Price <> 0.00)')
    Left = 926
    Top = 345
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoice_Line_no'
        ParamType = ptUnknown
      end>
  end
  object OldInvLineSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'select Sales_invoice_Line.*,'
      '          Purchase_orderLine.*,'
      '          Form_Reference.Form_Reference_id,'
      '          Vat_Code.Vat_Ref,'
      '          Vat_Code.Vat_Rate,'
      '          Price_Unit.Description as Sales_Unit_Desc,'
      '          Price_Unit.Price_Unit_Factor'
      'from Sales_invoice_Line,'
      '        Purchase_OrderLine,'
      '        Form_Reference,'
      '        Vat_Code,'
      '        Price_Unit'
      'where Sales_Invoice = :Sales_Invoice AND'
      '('
      
        '(Sales_Invoice_Line.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) AND'
      '(Sales_Invoice_Line.Line = Purchase_OrderLine.Line)'
      ') and'
      
        '(Purchase_OrderLine.Form_Reference *= Form_Reference.Form_refere' +
        'nce) and'
      '(Sales_Invoice_Line.Vat_Code = Vat_code.Vat_Code) and'
      '(Sales_Invoice_Line.Price_Unit = Price_Unit.Price_Unit)')
    Left = 920
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object DeliverySQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvLineSRC
    SQL.Strings = (
      'select top 1 Delivery_Detail.*'
      'from Delivery_Detail'
      'where'
      '('
      '(Purchase_Order = :Purchase_Order) AND'
      '(Line = :Line)'
      ')')
    Left = 392
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object DeliverySRC: TDataSource
    DataSet = DeliverySQL
    Left = 440
    Top = 120
  end
  object AddressSRC: TDataSource
    DataSet = CustSQL
    Left = 80
    Top = 280
  end
  object AdhocSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 193
    Top = 300
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ad_hoc_Address'
        ParamType = ptUnknown
      end>
  end
  object RepSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Rep'
      'where Rep = :Rep')
    Left = 378
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object SupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'Supplier.Name as Supplier_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Supplier_Branch, Supplier'
      'where Supplier_Branch.Supplier = :Supplier and'
      #9#9#9'Supplier_Branch.Branch_no = :Branch_no and'
      '        Supplier_Branch.Supplier = Supplier.Supplier'
      ' ')
    Left = 259
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object CompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Fax_Number,'
      '        Email'
      'from Company'
      'where Company = 1'
      ' ')
    Left = 341
    Top = 360
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
      '        HO_Department'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 454
    Top = 360
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
  object CreditHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'C'#39') '
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      ' ')
    Left = 576
    Top = 189
  end
  object GetNarrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 472
    Top = 125
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object qryPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_orderLine.Customers_Desc, '
      '        Purchase_OrderLine.Cust_Order_no,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr'
      'FROM Form_Reference'
      '      RIGHT JOIN Purchase_orderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_orderLine.Form_' +
        'Reference'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line'
      ' ')
    Left = 584
    Top = 20
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qrySOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Part.Part, '
      '          Part_Description, '
      '          Sales_order_line.Sell_Pack_Quantity, '
      '          Price_Unit,'
      '          Quantity_Delivered'
      'from Sales_order_line, '
      '        Part'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no and'
      '(Sales_order_line.Part = Part.Part)')
    Left = 464
    Top = 28
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
  object qryJBLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Descr'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 584
    Top = 116
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
  object qryInvCharges: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'select Sales_invoice_Add_Charge.*, VAT_Code.VAT_Rate'
      'from Sales_invoice_Add_Charge, VAT_Code'
      
        'where Sales_invoice_Add_Charge.Sales_Invoice = :Sales_Invoice an' +
        'd'
      'Sales_invoice_Add_Charge.VAT_Code = Vat_Code.Vat_Code')
    Left = 304
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryJBHead: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Cust_Order_no'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 664
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qrySOHead: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Sales_order, Cust_Order_no, Delivery_Customer, Delivery_B' +
        'ranch, ad_hoc_Address'
      'from Sales_order'
      'where Sales_order = :Sales_order')
    Left = 712
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryCompCat: TQuery
    DatabaseName = 'PB'
    Left = 848
    Top = 441
  end
  object qryUniqueInv: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'where Category = :Category')
    Left = 680
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
  object qryCategory: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'Where Category = :category')
    Left = 664
    Top = 355
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'category'
        ParamType = ptUnknown
      end>
  end
  object gtQRFilters1: TgtQRFilters
    HTML.Author = 'Pragnaan'
    HTML.Keywords = 'gtQrFilters'
    HTML.ImageDir = 'Images'
    PDF.Author = 'Pragnaan'
    PDF.Keywords = 'QuickReport, Export, Filters'
    RTF.Author = 'Pragnaan'
    RTF.Keywords = 'QuickReport, Export, Filters'
    RTF.ImagePixelFormat = pf32bit
    RTF.ExportImageFormat = ifBMP
    Text.XScaleFactor = 1.000000000000000000
    VisibleFilters = [fkHTML, fkPDF, fkRTF, fkExcel, fkText, fkGIF, fkJPEG, fkBMP, fkEMF, fkWMF]
    Left = 648
    Top = 365
  end
  object GetCustHOSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'CB.Building_no_name,'
      'CB.Street,'
      'CB.Locale,'
      'CB.Town,'
      'CB.Postcode,'
      'CB.Delivery_Narrative,'
      'CB.Account_Code,'
      'CB.Inv_To_Customer,'
      'CB.Inv_To_Branch,'
      'CB.Short_Code,'
      'Customer_Branch.HO_Department'
      'from'
      '  Customer_Branch, Customer, Customer_Branch CB'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Customer_Branch.Branch_no = :Branch_no)) and'
      '  ((CB.Customer = :Customer) and'
      '   (CB.Branch_no = 0)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      '')
    Left = 389
    Top = 195
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
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryUpCustomer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Customer'
      'set Customer.Pre_pay_Balance = Pre_Pay_Balance - :Invoice_Amount'
      'where Customer.Customer = :Customer')
    Left = 928
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryUpInvoicePay: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Paid_Status = :Paid_Status,'
      '      Paid_Date = :Paid_Date,'
      '      Paid_Amount = :Paid_Amount,'
      '      Payment_Method = :Payment_Method,'
      '      Cash_Sales = :Cash_Sales'
      'where Sales_invoice = :Sales_Invoice')
    Left = 1008
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Paid_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Paid_Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Payment_Method'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cash_Sales'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustomerPaymentTerms: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Payment_Terms,'
      '        Payment_Terms.Payment_Type,'
      '        Payment_Terms.Number_of_Days'
      'FROM Payment_Terms'
      '      INNER JOIN Customer'
      '        ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'WHERE Customer.Customer = :Customer')
    Left = 1008
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
end
