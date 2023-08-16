object PBRPSalesInvFrm: TPBRPSalesInvFrm
  Left = 46
  Top = 0
  Width = 1451
  Height = 884
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 161
  VertScrollBar.Range = 2000
  Caption = 'Sales Invoice'
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
    Left = 112
    Top = -169
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
    Page.Continuous = False
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
    PrinterSettings.UseStandardprinter = True
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
    object InvoiceFooter: TQRBand
      Left = 0
      Top = 633
      Width = 794
      Height = 2
      AfterPrint = InvoiceFooterAfterPrint
      AlignToBottom = True
      BeforePrint = InvoiceFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object InvoiceGroupHeader: TQRGroup
      Left = 0
      Top = 503
      Width = 794
      Height = 2
      AlignToBottom = False
      BeforePrint = InvoiceGroupHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = InvoiceFooter
      Master = InvoiceReport
      ReprintOnNewPage = False
    end
    object AddChargesFooter: TQRBand
      Left = 0
      Top = 552
      Width = 794
      Height = 81
      AlignToBottom = False
      BeforePrint = AddChargesFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        214.312500000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtNotesShape: TQRShape
        Left = 104
        Top = 8
        Width = 561
        Height = 32
        Size.Values = (
          84.666666666666670000
          275.166666666666700000
          21.166666666666670000
          1484.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clNavy
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object RichmemoNotes: TQRRichText
        Left = 136
        Top = 19
        Width = 529
        Height = 20
        Enabled = False
        Size.Values = (
          52.916666666666670000
          359.833333333333300000
          50.270833333333330000
          1399.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memoNotes')
      end
      object memoNotes: TQRMemo
        Left = 120
        Top = 17
        Width = 537
        Height = 22
        Size.Values = (
          58.208333333333330000
          317.500000000000000000
          44.979166666666670000
          1420.812500000000000000)
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
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object gtlblPackPriceUnit: TQRLabel
        Left = 75
        Top = 53
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          198.437500000000000000
          140.229166666666700000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackPriceUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtlblPackUnitPrice: TQRLabel
        Left = 159
        Top = 53
        Width = 101
        Height = 18
        Size.Values = (
          47.625000000000000000
          420.687500000000000000
          140.229166666666700000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtlblPackPriceVat: TQRLabel
        Left = 274
        Top = 53
        Width = 22
        Height = 17
        Size.Values = (
          44.979166666666670000
          724.958333333333300000
          140.229166666666700000
          58.208333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtlblPackVat: TQRLabel
        Left = 293
        Top = 53
        Width = 68
        Height = 18
        Size.Values = (
          47.625000000000000000
          775.229166666666700000
          140.229166666666700000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtlblPackPriceGross: TQRLabel
        Left = 367
        Top = 53
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          140.229166666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Pack Gross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtlblPackTotalGross: TQRLabel
        Left = 401
        Top = 53
        Width = 112
        Height = 18
        Size.Values = (
          47.625000000000000000
          1060.979166666667000000
          140.229166666666700000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackTotalGross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object InvoiceHeader: TQRSubDetail
      Left = 0
      Top = 505
      Width = 794
      Height = 2
      AlignToBottom = False
      BeforePrint = InvoiceHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object InvoiceLine: TQRSubDetail
      Left = 0
      Top = 507
      Width = 794
      Height = 23
      AfterPrint = InvoiceLineAfterPrint
      AlignToBottom = False
      BeforePrint = InvoiceLineBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      DataSet = InvLineSQL
      PrintBefore = False
      PrintIfEmpty = True
      object GoodsVatLbl: TQRLabel
        Left = 706
        Top = 2
        Width = 60
        Height = 18
        Size.Values = (
          47.625000000000000000
          1867.958333333333000000
          5.291666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object GoodsTotalLbl: TQRLabel
        Left = 623
        Top = 2
        Width = 88
        Height = 18
        Size.Values = (
          47.625000000000000000
          1648.354166666667000000
          5.291666666666667000
          232.833333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object VatPerclbl: TQRLabel
        Left = 582
        Top = 2
        Width = 56
        Height = 18
        Size.Values = (
          47.625000000000000000
          1539.875000000000000000
          5.291666666666667000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QtyInvoicedLbl: TQRLabel
        Left = 41
        Top = 2
        Width = 57
        Height = 18
        Size.Values = (
          47.625000000000000000
          108.479166666666700000
          5.291666666666667000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblPriceUnit: TQRLabel
        Left = 526
        Top = 2
        Width = 64
        Height = 18
        Size.Values = (
          47.625000000000000000
          1391.708333333333000000
          5.291666666666667000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblPriceUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object GoodsLbl: TQRLabel
        Left = 466
        Top = 2
        Width = 55
        Height = 18
        Size.Values = (
          47.625000000000000000
          1232.958333333333000000
          5.291666666666667000
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
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = GoodsLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblProduct: TQRLabel
        Left = 104
        Top = 2
        Width = 145
        Height = 18
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          5.291666666666667000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblProduct'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblDescription: TQRLabel
        Left = 255
        Top = 2
        Width = 202
        Height = 18
        Size.Values = (
          47.625000000000000000
          674.687500000000000000
          5.291666666666667000
          534.458333333333300000)
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
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object InvoiceCharges: TQRSubDetail
      Left = 0
      Top = 530
      Width = 794
      Height = 22
      AlignToBottom = False
      BeforePrint = InvoiceChargesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      DataSet = qryInvCharges
      FooterBand = AddChargesFooter
      PrintBefore = False
      PrintIfEmpty = True
      object ExtrasVatLbl: TQRLabel
        Left = 698
        Top = 1
        Width = 69
        Height = 18
        Size.Values = (
          47.625000000000000000
          1846.791666666667000000
          2.645833333333333000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ExtrasVatLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 104
        Top = 1
        Width = 377
        Height = 18
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          2.645833333333333000
          997.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblAmount: TQRLabel
        Left = 655
        Top = 1
        Width = 56
        Height = 18
        Size.Values = (
          47.625000000000000000
          1733.020833333333000000
          2.645833333333333000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblAmount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 0
      Top = 19
      Width = 794
      Height = 484
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1280.583333333333000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object memDefPayment: TQRMemo
        Left = 32
        Top = 334
        Width = 369
        Height = 60
        Enabled = False
        Size.Values = (
          158.750000000000000000
          84.666666666666670000
          883.708333333333300000
          976.312500000000000000)
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
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Payment by cheque payable to Mailadoc Print and Mailing '
          'Solutions or by BACS to Nat West Bank Sort Code: 60-03-27  '
          'A/C: 78177987')
        ParentFont = False
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object CustomerAddMemo: TQRMemo
        Left = 72
        Top = 194
        Width = 337
        Height = 116
        Size.Values = (
          306.916666666666700000
          190.500000000000000000
          513.291666666666700000
          891.645833333333300000)
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
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object InvoiceNumberLbl: TQRLabel
        Left = 609
        Top = 264
        Width = 110
        Height = 20
        Size.Values = (
          52.916666666666660000
          1611.312500000000000000
          698.500000000000000000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object InvoiceDateLbl: TQRLabel
        Left = 609
        Top = 291
        Width = 82
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          769.937500000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object OurJobLbl: TQRLabel
        Left = 609
        Top = 370
        Width = 58
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          978.958333333333300000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustOrderNo: TQRLabel
        Left = 609
        Top = 319
        Width = 87
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          844.020833333333300000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblCustOrderNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object CustAccount: TQRDBText
        Left = 609
        Top = 346
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          915.458333333333300000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblInvoiceLabel: TQRLabel
        Left = 44
        Top = 33
        Width = 128
        Height = 41
        Size.Values = (
          108.479166666666700000
          116.416666666666700000
          87.312500000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice - '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
      object QRLabel4: TQRLabel
        Left = 504
        Top = 264
        Width = 62
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          698.500000000000000000
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
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 504
        Top = 291
        Width = 70
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          769.937500000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 504
        Top = 319
        Width = 49
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          844.020833333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 504
        Top = 346
        Width = 52
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          915.458333333333300000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A/C Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblJobNumber: TQRLabel
        Left = 504
        Top = 370
        Width = 70
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          978.958333333333300000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 72
        Top = 467
        Width = 20
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          1235.604166666667000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 104
        Top = 467
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          1235.604166666667000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 463
        Top = 467
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1225.020833333333000000
          1235.604166666667000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 535
        Top = 467
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          1235.604166666667000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price unit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 680
        Top = 467
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          1799.166666666667000000
          1235.604166666667000000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrshpPayment: TQRShape
        Left = 72
        Top = 344
        Width = 393
        Height = 73
        Size.Values = (
          193.145833333333300000
          190.500000000000000000
          910.166666666666700000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 80
        Top = 350
        Width = 369
        Height = 60
        Size.Values = (
          158.750000000000000000
          211.666666666666700000
          926.041666666666700000
          976.312500000000000000)
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
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Payment by cheque payable to Mailadoc Print and Mailing '
          'Solutions or by BACS to Nat West Bank Sort Code: 60-03-27  '
          'A/C: 78177987')
        ParentFont = False
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRMemoCmpnyNm: TQRMemo
        Left = 568
        Top = 100
        Width = 108
        Height = 117
        Size.Values = (
          309.562500000000000000
          1502.833333333333000000
          264.583333333333300000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object lblInvoiceDescription: TQRLabel
        Left = 136
        Top = 424
        Width = 633
        Height = 18
        Size.Values = (
          47.625000000000000000
          359.833333333333300000
          1121.833333333333000000
          1674.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblInvoiceDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 72
        Top = 424
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          1121.833333333333000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Project:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblReference: TQRLabel
        Left = 504
        Top = 398
        Width = 73
        Height = 18
        Size.Values = (
          47.625000000000000000
          1333.500000000000000000
          1053.041666666667000000
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
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 745
        Top = 467
        Width = 20
        Height = 17
        Size.Values = (
          44.979166666666670000
          1971.145833333333000000
          1235.604166666667000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object imgReport: TQRImage
        Left = 392
        Top = 32
        Width = 363
        Height = 47
        Size.Values = (
          124.354166666666700000
          1037.166666666667000000
          84.666666666666670000
          960.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRLabel2: TQRLabel
        Left = 605
        Top = 467
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          1600.729166666667000000
          1235.604166666667000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VAT%'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblInvoiceNumber: TQRLabel
        Left = 185
        Top = 33
        Width = 256
        Height = 41
        Size.Values = (
          108.479166666666700000
          489.479166666666700000
          87.312500000000000000
          677.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'InvoiceNumberLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        OnPrint = InvoiceNumberLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
    end
    object QRBand2: TQRBand
      Left = 0
      Top = 635
      Width = 794
      Height = 246
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        650.875000000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel16: TQRLabel
        Left = 74
        Top = 7
        Width = 97
        Height = 18
        Size.Values = (
          47.625000000000000000
          195.791666666666700000
          18.520833333333330000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object BranchAddMemo: TQRMemo
        Left = 74
        Top = 23
        Width = 257
        Height = 103
        Size.Values = (
          272.520833333333300000
          195.791666666666700000
          60.854166666666670000
          679.979166666666700000)
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
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object GoodsValueLbl: TQRLabel
        Left = 681
        Top = 7
        Width = 86
        Height = 21
        Size.Values = (
          55.562500000000000000
          1801.812500000000000000
          18.520833333333330000
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
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 611
        Top = 7
        Width = 51
        Height = 20
        Size.Values = (
          52.916666666666670000
          1616.604166666667000000
          18.520833333333330000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel14: TQRLabel
        Left = 638
        Top = 34
        Width = 24
        Height = 20
        Size.Values = (
          52.916666666666670000
          1688.041666666667000000
          89.958333333333330000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 590
        Top = 61
        Width = 72
        Height = 20
        Size.Values = (
          52.916666666666670000
          1561.041666666667000000
          161.395833333333300000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Invoice Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object VATValueLbl: TQRLabel
        Left = 697
        Top = 34
        Width = 70
        Height = 20
        Size.Values = (
          52.916666666666670000
          1844.145833333333000000
          89.958333333333330000
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
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = VATValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRImage2: TQRImage
        Left = 40
        Top = 176
        Width = 270
        Height = 33
        Size.Values = (
          87.312500000000000000
          105.833333333333300000
          465.666666666666700000
          714.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        AutoSize = True
        Picture.Data = {
          07544269746D617056670000424D566700000000000036000000280000000A01
          0000210000000100180000000000206700000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB49492D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9E2E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CA
          C9D9CAC9ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1D9CAC9E3D7D6
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD9CAC9D9CAC9ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2E3A78C90A78C90E9E2E3FFFF
          FFFFFFFFFFFFFFFFFFFFD3C6C7A78C90A78C90F4F1F1FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D5A78C90A78C90DED4D5D3C6C7
          A78C90A78C90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B9A78C90A78C90DED4
          D5A78C90A78C90BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBDA9ABA78C90B29A9DFFFFFFFFFFFFFFFFFFFFFFFFD3C6C7
          916F7464363C4F1A214F1A2164363C916F74D3C6C7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9197BD161E7601035D00004B00
          004A293A7A2B3976586190DEDFE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9AB
          A78C90BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFBDA9AB7A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E3D7D6D9CAC9D9CAC9E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE3D7D6D9CAC9D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE3D7D6D9CAC9E3D7D6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFECE4E4D9CAC9D9
          CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492723733692A
          26692A26692A268E5F5CD9CAC9692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D7D6723733692A26692A26
          85514EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2
          F1A17977692A26692A26692A26692A267B4440C7AFADFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFFE9E2E34F1A214F1A21A78C90FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A2159272EF4F1F1A78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFDED4D54F1A214F1A216F444AFFFF
          FF916F744F1A2159272EF4F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE9E2E34F1A214F1A21A78C90FFFFFFFFFFFFE9E2E37A53584F1A21
          4F1A214F1A214F1A214F1A214F1A214F1A214F1A217A5358F4F1F1FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE2E4EC1923762A3B79404F86636F926C76926A
          748F666F8A4654814D597F555F7D777DABFFFFFFFFFFFFFFFFFFFFFFFF7A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFBDA9AB4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4A17977723733
          692A26692A26692A26692A26723733AA8784ECE4E4FFFFFFFFFFFFFFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7
          AFAD7B4440692A26692A26692A26723733A17977F6F2F1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD0BCBB7B4440692A26692A26692A267B4440C7AFADD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492E3D7D68E5F5C692A26692A2669
          2A26723733B49492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784692A26976C69E3D7
          D6FFFFFFE3D7D6B49492723733692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17977692A2685514EB49492
          B49492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F18551
          4E692A26A17977D0BCBBD9CAC9C7AFAD7B4440692A26A17977FFFFFFFFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A2159272EF4F1F1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2E34F1A214F1A21A78C90FFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFFF4F1F16F444A4F1A2159272EE9E2E3FFFF
          FFE9E2E34F1A214F1A21A78C90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF916F744F1A214F1A21F4F1F1FFFFFFDED4D559272E4F1A214F1A21
          64363CB29A9DD3C6C7D3C6C7B29A9D64363C4F1A214F1A216F444AF4F1F1FFFF
          FFFFFFFFFFFFFFFFFFFFA4A8C07C8498A2A3AA7F8AAB6878A95062A14F619F4C
          5E9B48589344548D626D90636C876D6F743C4783FFFFFFFFFFFFFFFFFF7A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFBDA9AB4F1A214F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26692A2685514E
          B49492D9CAC9D0BCBBB494927B4440692A26723733C7AFADFFFFFFFFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1797769
          2A267B4440C7AFADD9CAC9D0BCBB976C69692A2685514EF6F2F1FFFFFFFFFFFF
          FFFFFFF6F2F1723733692A26B49492D9CAC9D9CAC9AA878472373385514E692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A2685514E692A268E5F5CD0BCBBD9CAC9C7
          AFAD85514E692A26A17977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A268E5F5CFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE3D7D6692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C723733E3D7D6FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A
          26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFF6F2F185514E692A26D0BCBBFFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21BDA9ABFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A214F1A21E9E2E3FFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFF9C7E824F1A214F1A21BDA9ABFFFFFFFFFF
          FFFFFFFF7A53584F1A2159272EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF4F1F14F1A214F1A21916F74FFFFFFE9E2E359272E4F1A214F1A21B29A9D
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A214F1A217A5358FFFF
          FFFFFFFFFFFFFFE4E6EE36488A16278000007704028307058E0A079309069006
          048902017A00006D00006000005100035275767C50598EFFFFFFFFFFFF7A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9
          AB4F1A214F1A214F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784692A26723733D9CAC9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFAD723733692A26D0BCBBFFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A2697
          6C69F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFC7AFAD692A26976C69FFFFFFFFFFFF
          FFFFFFD0BCBB692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFECE4E485514E692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26692A26C7AFADFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF976C69692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26D0BCBBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D7D6692A26976C
          69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A2685514EFFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A53584F1A214F1A214F1A214F1A214F
          1A214F1A214F1A214F1A214F1A214F1A214F1A21916F74FFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFD3C6C74F1A214F1A21916F74FFFFFFFFFFFFFFFF
          FFFFFFFFD3C6C74F1A214F1A214F1A214F1A214F1A214F1A214F1A214F1A214F
          1A214F1A214F1A214F1A21E9E2E3FFFFFF8661664F1A214F1A21BDA9ABFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A214F1A21BDA9
          ABFFFFFFFFFFFF20268600006F0503871F2DA3394EBA3D53C53F55C93E54C73B
          51C1364AB32F43A2273A900614700000500615634C587EC3C5D4FFFFFF7A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D55927
          2E4F1A214F1A214F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A267B4440F6F2F1FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26B49492FFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B4440723733F6
          F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26E3D7D6FFFFFF
          FFFFFFB49492692A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26AA8784FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F2F1692A2685514EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26C7AFADFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26D9CA
          C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17977692A26ECE4E4FF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B94F1A214F1A214F1A214F1A214F
          1A214F1A214F1A214F1A214F1A214F1A214F1A21E9E2E3FFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFFF4F1F164363C4F1A2164363CF4F1F1FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF7A53584F1A214F1A214F1A214F1A214F1A214F1A214F1A214F
          1A214F1A214F1A21916F74FFFFFFDED4D54F1A214F1A21916F74FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF64363C4F1A218661
          66FFFFFFC6C9D96979ABBBC4D9F7F7F7FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEF9F8F8F1F0F0D9D7D7B6B3B28D8F945964852D3978FFFFFF7A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A
          2159272E64363C4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7B4440692A26D9CAC9FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A26A17977FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26B49492FFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF976C69692A26F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A2685514EFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD9CAC9692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF976C69692A26FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF64363C4F1A217A5358FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF64363C4F1A21866166FFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFF8661664F1A214F1A21DED4D5FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFBDA9AB4F1A214F1A21C8B7B9FFFFFFFFFFFFFFFFFFFFFFFFBD
          A9AB4F1A214F1A21D3C6C7FFFFFF9C7E824F1A214F1A21E9E2E3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A214F1A
          21FFFFFF6670B38898C96D82D65D78E34962E94B65EE4B64F04B65F14B65F14B
          64F04963EC4760E4435AD4364AB23C4F9B4757926B7490727481FFFFFF7A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A215927
          2EDED4D57A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26976C69FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26C7AFADFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1692A26A17977FFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784692A2685514ED0BC
          BBD9CAC9D0BCBBA17977723733692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFAD692A26D9CAC9FF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21916F74A78C
          90BDA9ABD3C6C7FFFFFFFFFFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21D3C6C7FF
          FFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21D3C6C7FFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21B29A9D4F1A214F1A21B29A9DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF64363C4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFF64
          363C4F1A217A5358FFFFFFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF4F1A214F1A214F1A214F1A214F1A214F1A214F1A
          21E9E2E3181695140CA01F16CA261EE32A25EB2C2BED2D2DEE2C29EE2A23EE28
          1DEE271CEC261BE72219DB1C12B90503890000680B1B6C6B72859EA2BA7A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A2159272EDED4
          D5FFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB49492692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26692A26692A26692A26692A26692A26
          692A268E5F5CB49492F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFBDA1A07B4440692A
          26692A26692A26A17977ECE4E4692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17977692A26F6F2
          F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A214F1A214F1A
          214F1A214F1A2159272EB29A9DFFFFFFFFFFFFFFFFFF59272E4F1A21916F74FF
          FFFFFFFFFFFFFFFF6F444A4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A214F1A214F1A214F1A214F1A217A5358DED4D5FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21E9E2E3FFFFFFFFFFFFD3C6C74F
          1A214F1A21C8B7B9FFFFFFFFFFFF7A53584F1A21A78C90FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF4F1A214F1A214F1A214F1A214F1A214F1A214F1A
          21D3C6C7313CAB5F76D07993EC849FF68BA6F891AAF993ACF98EA7F887A1F882
          9DF87C98F77B96F67994F3728AE36277C25365A54656903D4B808C92B57A5358
          4F1A217A5358FFFFFFFFFFFFFFFFFFDED4D559272E4F1A214F1A21D3C6C7FFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF976C69692A26ECE4E4FFFFFFFFFFFFFFFFFFFFFFFF
          C7AFAD8E5F5C8E5F5C8E5F5C8E5F5C8E5F5C85514E692A26B49492FFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A26AA8784FFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A2685514E8E5F5C8E5F5C8E5F5C8E5F5C
          8E5F5C723733692A2685514EF6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA1A0692A26C7AF
          ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85514E692A26FFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A216F444A7A53
          5864363C4F1A214F1A214F1A219C7E82FFFFFFFFFFFFA78C904F1A214F1A21E9
          E2E3FFFFFFD3C6C74F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A217A53587A535864363C4F1A214F1A2159272EE9E2E3FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF4F1F159272E4F1A21916F74FFFFFFFFFFFF7A53584F
          1A2164363CFFFFFFFFFFFFFFFFFF7A53584F1A21A78C90FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD3C6C7D3C6C7D3C6C7D3C6C7D3C6C7D3C6C7D3C6
          C7F4F1F17F90D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F4F4DEDCDBBCB9B8908D8C858BAA7A5358
          4F1A217A5358FFFFFFFFFFFFF4F1F159272E4F1A214F1A21BDA9ABFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C7AFAD8E5F5C8E5F5C8E5F5C8E5F5C8E5F5C8E5F5C8E5F5CC7AFADFFFFFFFFFF
          FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFF6F2F1692A268E5F5CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA1A0692A26C7AFADFFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF85514E692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6F2F1A17977692A268E5F5CFFFFFFFFFFFFF6F2F1E3D7D6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F2F1692A26AA8784FFFFFFFFFFFFFFFFFF8E5F5C69
          2A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F17237337B44
          40F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26A17977FFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFE9E2E36F444A4F1A214F1A21E9E2E3FFFFFFF4F1F159272E4F1A21A7
          8C90FFFFFF8661664F1A2164363CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFFD3C6C759272E4F1A21866166FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFA78C904F1A214F1A21F4F1F1E9E2E34F1A214F
          1A21BDA9ABFFFFFFFFFFFFFFFFFF7A53584F1A21866166FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2622B52424C94156EA708CF696AEF9B0C4FCB8CBFDA1B8FB7E9AF75B
          76F33543EF2A23EE271CEC2219DB1910B10503861F31809591908A90B07A5358
          4F1A217A5358FFFFFFF4F1F16F444A4F1A214F1A21BDA9ABFFFFFFFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26F6F2F1FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB49492692A26A17977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF976C69692A26D9
          CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F17B4440723733F6F2F1FFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26976C69FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD9CAC9692A26976C69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7B4440692A26ECE4E4FFFFFF976C69723733D9CAC9FFFF
          FFFFFFFFFFFFFFFFFFFFA17977692A26C7AFADFFFFFFFFFFFFFFFFFF8E5F5C72
          3733723733BDA1A0FFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A
          2685514EF6F2F1FFFFFFFFFFFFFFFFFFD9CAC9723733723733ECE4E4FFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFF4F1F14F1A214F1A21B29A9DFFFFFFFFFFFF9C7E824F1A2159
          272EDED4D54F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF4F1F159272E4F1A21A78C90916F744F1A2164
          363CFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A2159272EF4F1F1FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF5F68CE272CCB506AED8EA7F8BDCEFCD6E3FCDFE9FDC7D7FDA1B7FA71
          8DF63F52F12C29EE271CEC2319DC1A10B2050388081774203073FFFFFF7A5358
          4F1A217A5358F4F1F16F444A4F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB49492692A26D0BCBBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB49492692A26692A26976C69ECE4E4FFFFFFFFFFFFFFFFFFECE4E472373372
          3733D9CAC9FFFFFFFFFFFFFFFFFFECE4E485514E692A26BDA1A0FFFFFFFFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26692A26976C69ECE4E4FFFFFFFFFFFFFF
          FFFFD9CAC9723733692A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFE3D7D685514E692A268551
          4EAA8784A179777B4440692A26976C69FFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E
          5F5CC7AFAD692A267237337237338E5F5C692A26692A26692A26692A26692A26
          D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA87
          84692A26723733976C69AA878485514E692A26723733E3D7D6FFFFFFFFFFFFB4
          9492692A26692A26692A26692A26692A268E5F5CFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFF7A53584F1A21A78C90FFFFFFFFFFFFE9E2E34F1A214F
          1A2164363C4F1A2159272EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFF4F1F14F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A2159272E4F1A214F1A21A7
          8C90FFFFFFFFFFFFFFFFFFFFFFFFDED4D54F1A214F1A21A78C90FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFC2C7EAE8EEF8CBD9FAD6E3FCE8EFFDF5F9FEFAFBFFEFF4FED7E4FCBA
          CCFD92ACF9819CF77A96F57690EC697ECF8494C48D96AF404C80FFFFFF7A5358
          4F1A216F444A6F444A4F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26A17977FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB49492692A26BDA1A0723733692A267B4440D9CAC9FFFFFFFFFFFFE3D7D672
          3733692A2685514EAA87848E5F5C692A26692A26AA8784FFFFFFFFFFFFFFFFFF
          FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
          26D9CAC9FFFFFFFFFFFFFFFFFF692A26AA878485514E692A268E5F5CAA878485
          514E692A26692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFC7AFAD976C
          698E5F5C8E5F5C976C69C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFADC7
          AFADFFFFFFD9CAC9A179778E5F5CC7AFADB494927B44407B4440B49492B49492
          ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD9CAC9A179778E5F5C8E5F5C8E5F5CBDA1A0F6F2F1FFFFFFFFFFFFFFFFFFD9
          CAC9B494928E5F5C692A26A17977B49492C7AFADFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFFFFFFF64363C4F1A21A78C90FFFFFFFFFFFFFFFFFF916F744F
          1A214F1A214F1A21A78C90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21E9E2E3FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2E34F1A214F1A214F1A2159272EF4
          F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A53584F1A2159272EDED4D5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF866166DED4D5FFFF
          FFFFFFFFFFFFFF5566D2A6BBF5E0EAFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDB0BDDDAEB6CBB2AFAE8E93B5FFFFFF7A5358
          4F1A214F1A214F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF723733723733ECE4E4FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD9CAC9B49492ECE4E4F6F2F1B494928E5F5CE3D7D6FFFFFFFFFFFFFFFFFFF6
          F2F1BDA1A08E5F5C8E5F5C8E5F5CA17977D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD9CAC9B49492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4B494
          92ECE4E4FFFFFFFFFFFFFFFFFFB49492D9CAC9FFFFFFC7AFAD8E5F5C8E5F5C8E
          5F5CAA8784ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF8E5F5C692A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
          FFFFFFFFFFFFFFB29A9D4F1A214F1A21D3C6C7FFFFFFFFFFFFFFFFFFDED4D54F
          1A214F1A2159272EF4F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21FFFFFFFFFFFFFFFFFFF4F1F16F444A4F1A2164363CFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A214F1A219C7E82FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A2159272ED3C6C7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F1F16F444A4F1A2159272EE9E2
          E3FFFFFFFFFFFFD9DBF2455BDB7F99F3AEC2FBC9D9FDD0DFFCBACCFD93ACF967
          84F43B4CEE2A24EA2319DD1C12BC06048C4E609E3B4589FFFFFFFFFFFF7A5358
          4F1A214F1A214F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA1A0692A268E5F5CFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1D0BCBBFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC7AFAD692A267B4440FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD9CAC9692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21916F74A78C
          90A78C906F444A4F1A214F1A216F444AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A
          53584F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A21A78C90A78C90916F7459272E4F1A214F1A21BDA9ABFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21E9E2E3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B959272E4F1A214F1A21
          7A5358C8B7B9E9E2E3FFFFFFD3C6C79C7E8259272E4F1A214F1A21916F74FFFF
          FFFFFFFFFFFFFFFFFFFFC2C7F0C2D1F7B0C3F9AFC3FBA6BCFB8BA5F86D89F44E
          68F1303AE82D32E0445CD6384CB55568A949569BFFFFFFFFFFFFFFFFFF7A5358
          4F1A214F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A268E5F5CF6F2F1FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E485514E692A26C7AFADFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26BDA1A0D9CAC9D9CAC9D9CAC9D9CAC9
          B49492976C69692A26723733E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784AA8784FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F2F1692A2685514EECE4E4ECE4E4AA8784F6F2F1FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A214F1A214F1A
          214F1A214F1A214F1A216F444ADED4D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          C6C74F1A21E9E2E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
          4F1A214F1A214F1A214F1A214F1A214F1A214F1A219C7E82FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A5358916F74FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D564363C4F1A21
          4F1A214F1A214F1A214F1A214F1A214F1A214F1A214F1A21A78C90FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC5CAF091A6EDE1EAFBFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFBFAFAF4F3F3DEDCDB5A66A0FFFFFFFFFFFFFFFFFFFFFFFF7A5358
          4F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1976C69692A26723733AA8784
          D9CAC9F6F2F1ECE4E4D0BCBBA17977692A26692A26B49492FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFD9CAC9692A26692A26692A26692A26692A26692A26
          692A26692A268E5F5CE3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC7AFAD692A26692A26692A26723733D0BCBBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D57A53587A53587A53587A53
          587A5358A78C90D3C6C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9AB
          7A53587A53587A53587A53587A5358A78C90E9E2E3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C7E9E2E3FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9AB
          7A53584F1A214F1A214F1A214F1A2164363C9C7E82E9E2E3FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868EDF3B44CF4B62D2465ECF41
          57C84459BE5A6EBE5F6DB5CBCDDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A5358
          916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF9C7E827A53589C7E82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFAD7B4440692A26
          692A26692A26692A26692A26692A268E5F5CD9CAC9FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFF6F2F1D9CAC9D9CAC9D9CAC9D9CAC9D9CAC9D9CAC9
          D9CAC9F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFECE4E4BDA1A0D0BCBBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE9E2E3DED4D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EBF7BB
          C0E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B9
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D7D6
          C7AFADB49492B49492C7AFADECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000}
        Stretch = True
      end
      object qrmRegNumber: TQRMemo
        Left = 215
        Top = 216
        Width = 540
        Height = 13
        Size.Values = (
          34.395833333333330000
          568.854166666666700000
          571.500000000000000000
          1428.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Lato Light'
        Font.Style = []
        Lines.Strings = (
          
            'Service Graphics (A trading division of Paragon Group Ltd), Regi' +
            'stered in England & Wales Company Registration No: 00551336')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRMemo1: TQRMemo
        Left = 523
        Top = 232
        Width = 232
        Height = 13
        Size.Values = (
          34.395833333333330000
          1383.770833333333000000
          613.833333333333300000
          613.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Lato Light'
        Font.Style = []
        Lines.Strings = (
          'Registered address 1 Onslow Street London EC1N 8AS')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object TotalValueLbl: TQRLabel
        Left = 691
        Top = 61
        Width = 76
        Height = 20
        Size.Values = (
          52.916666666666670000
          1828.270833333333000000
          161.395833333333300000
          201.083333333333300000)
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
        Font.Name = 'Lato'
        Font.Style = []
        OnPrint = TotalValueLblPrint
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
    ConnectionName = 'PB'
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
    Top = 136
  end
  object InvHeadSRC: TDataSource
    DataSet = InvOneHeadSQL
    Left = 928
    Top = 463
  end
  object InvLineSQL: TFDQuery
    MasterSource = InvHeadSRC
    ConnectionName = 'PB'
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
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end
      item
        Name = 'Show_Zero_Values'
      end>
  end
  object InvLineSRC: TDataSource
    DataSet = InvLineSQL
    Left = 1032
    Top = 474
  end
  object CustomerSQL: TFDQuery
    MasterSource = InvHeadSRC
    ConnectionName = 'PB'
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
      'Customer.Pre_Pay_Balance,'
      'Customer.Customer_is_Acquired'
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
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object qryComp: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Company')
    Left = 928
    Top = 521
  end
  object InvOneHeadSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object UpInvHeadSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice_Line'
      'set Sales_Invoice_Status = :Status'
      'where (Sales_invoice = :Sales_Invoice) AND'
      '           (Invoice_Line_No = :Line)')
    Left = 928
    Top = 400
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
    ConnectionName = 'PB'
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
  object NotesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 920
    Top = 225
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object InvAddChgSQL: TFDQuery
    MasterSource = InvLineSRC
    ConnectionName = 'PB'
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
        Name = 'Sales_invoice'
        DataType = ftInteger
      end
      item
        Name = 'Invoice_Line_no'
        DataType = ftInteger
      end>
  end
  object OldInvLineSQL: TFDQuery
    MasterSource = InvHeadSRC
    ConnectionName = 'PB'
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
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object DeliverySQL: TFDQuery
    MasterSource = InvLineSRC
    ConnectionName = 'PB'
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
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
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
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Ad_hoc_Address'
      end>
  end
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Rep'
      end>
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
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
  object CustSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object CreditHeadSQL: TFDQuery
    ConnectionName = 'PB'
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
  object GetNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 472
    Top = 125
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object qryPOLine: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Descr'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 584
    Top = 116
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryInvCharges: TFDQuery
    MasterSource = InvHeadSRC
    ConnectionName = 'PB'
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
        Name = 'Sales_Invoice'
      end>
  end
  object qryJBHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Cust_Order_no'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 664
    Top = 8
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qrySOHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Sales_order, Cust_Order_no, Delivery_Customer, Delivery_B' +
        'ranch, ad_hoc_Address'
      'from Sales_order'
      'where Sales_order = :Sales_order')
    Left = 712
    Top = 56
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object qryCompCat: TFDQuery
    ConnectionName = 'PB'
    Left = 856
    Top = 409
  end
  object qryUniqueInv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'where Category = :Category')
    Left = 680
    Top = 209
    ParamData = <
      item
        Name = 'Category'
      end>
  end
  object qryCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'Where Category = :category')
    Left = 664
    Top = 355
    ParamData = <
      item
        Name = 'category'
      end>
  end
  object GetCustHOSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryUpCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer'
      'set Customer.Pre_pay_Balance = Pre_Pay_Balance - :Invoice_Amount'
      'where Customer.Customer = :Customer')
    Left = 928
    Top = 632
    ParamData = <
      item
        Name = 'Invoice_Amount'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryUpInvoicePay: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Paid_Status'
      end
      item
        Name = 'Paid_Date'
      end
      item
        Name = 'Paid_Amount'
      end
      item
        Name = 'Payment_Method'
      end
      item
        Name = 'Cash_Sales'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetCustomerPaymentTerms: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
      end>
  end
end
