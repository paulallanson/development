object PBRPSalesInvFrm: TPBRPSalesInvFrm
  Left = 214
  Top = 94
  Width = 1142
  Height = 746
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'PBRPSalesInvFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  TextHeight = 15
  object InvoiceReport: TQuickRep
    Left = 32
    Top = 16
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
      0.000000000000000000
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
      Top = 544
      Width = 794
      Height = 3
      AfterPrint = InvoiceFooterAfterPrint
      AlignToBottom = True
      BeforePrint = InvoiceFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object InvoiceGroupHeader: TQRGroup
      Left = 0
      Top = 425
      Width = 794
      Height = 3
      AlignToBottom = False
      BeforePrint = InvoiceGroupHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        7.937500000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = InvoiceFooter
      Master = InvoiceReport
      ReprintOnNewPage = False
    end
    object AddChargesFooter: TQRBand
      Left = 0
      Top = 494
      Width = 794
      Height = 50
      AlignToBottom = False
      BeforePrint = AddChargesFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        132.291666666666700000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtNotesShape: TQRShape
        Left = 120
        Top = 8
        Width = 561
        Height = 32
        Size.Values = (
          84.666666666666680000
          317.500000000000000000
          21.166666666666670000
          1484.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clRed
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
          52.916666666666660000
          359.833333333333400000
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memoNotes')
      end
      object memoNotes: TQRMemo
        Left = 144
        Top = 19
        Width = 529
        Height = 20
        Size.Values = (
          52.916666666666660000
          381.000000000000000000
          50.270833333333330000
          1399.645833333333000000)
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
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object InvoiceHeader: TQRSubDetail
      Left = 0
      Top = 428
      Width = 794
      Height = 3
      AlignToBottom = False
      BeforePrint = InvoiceHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object InvoiceLine: TQRSubDetail
      Left = 0
      Top = 431
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
      object Dummy03: TQRLabel
        Left = 48
        Top = 2
        Width = 51
        Height = 18
        Size.Values = (
          47.625000000000000000
          127.000000000000000000
          5.291666666666667000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object Dummy06: TQRLabel
        Left = 451
        Top = 3
        Width = 53
        Height = 18
        Size.Values = (
          47.625000000000000000
          1193.270833333333000000
          7.937500000000000000
          140.229166666666700000)
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
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object Dummy05: TQRLabel
        Left = 200
        Top = 2
        Width = 201
        Height = 18
        Size.Values = (
          47.625000000000000000
          529.166666666666700000
          5.291666666666667000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AAAAAAAAAAAAAAAAAAAAAAAAA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object GoodsTotalLbl: TQRLabel
        Left = 607
        Top = 2
        Width = 88
        Height = 18
        Size.Values = (
          46.566666666666670000
          1606.550000000000000000
          6.350000000000000000
          232.833333333333300000)
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = GoodsTotalLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QtyInvoicedLbl: TQRLabel
        Left = 43
        Top = 2
        Width = 60
        Height = 18
        Size.Values = (
          47.625000000000000000
          113.770833333333300000
          5.291666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QtyInvdLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QtyInvoicedLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblPriceUnit: TQRLabel
        Left = 534
        Top = 2
        Width = 64
        Height = 18
        Size.Values = (
          47.625000000000000000
          1412.875000000000000000
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object GoodsLbl: TQRLabel
        Left = 460
        Top = 2
        Width = 52
        Height = 18
        Size.Values = (
          47.625000000000000000
          1217.083333333333000000
          5.291666666666667000
          137.583333333333300000)
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
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = GoodsLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblProduct: TQRLabel
        Left = 120
        Top = 2
        Width = 88
        Height = 18
        Size.Values = (
          46.566666666666670000
          317.500000000000000000
          6.350000000000000000
          232.833333333333300000)
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblDescription: TQRLabel
        Left = 209
        Top = 2
        Width = 224
        Height = 18
        Size.Values = (
          46.566666666666670000
          552.450000000000000000
          6.350000000000000000
          592.666666666666700000)
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
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object GoodsVatLbl: TQRLabel
        Left = 698
        Top = 2
        Width = 60
        Height = 18
        Size.Values = (
          46.566666666666670000
          1847.850000000000000000
          6.350000000000000000
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = GoodsTotalLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object InvoiceCharges: TQRSubDetail
      Left = 0
      Top = 472
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
      object QRDBText3: TQRDBText
        Left = 120
        Top = 1
        Width = 338
        Height = 18
        Size.Values = (
          46.566666666666670000
          317.500000000000000000
          2.116666666666667000
          895.350000000000000000)
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
        Font.Height = -13
        Font.Name = 'Tahoma'
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
      object lblAmount: TQRLabel
        Left = 637
        Top = 1
        Width = 58
        Height = 18
        Size.Values = (
          47.625000000000000000
          1685.395833333333000000
          2.645833333333333000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblAmount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object ExtrasVatLbl: TQRLabel
        Left = 688
        Top = 1
        Width = 71
        Height = 18
        Size.Values = (
          47.625000000000000000
          1820.333333333333000000
          2.645833333333333000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ExtrasVatLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 0
      Top = 19
      Width = 794
      Height = 406
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1074.208333333333000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object CustomerAddMemo: TQRMemo
        Left = 48
        Top = 202
        Width = 337
        Height = 116
        Size.Values = (
          306.916666666666700000
          127.000000000000000000
          534.458333333333400000
          891.645833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
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
        FontSize = 10
      end
      object InvoiceNumberLbl: TQRLabel
        Left = 609
        Top = 184
        Width = 110
        Height = 20
        Size.Values = (
          52.916666666666660000
          1611.312500000000000000
          486.833333333333400000
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = InvoiceNumberLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object InvoiceDateLbl: TQRLabel
        Left = 609
        Top = 211
        Width = 83
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          558.270833333333300000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'InvoiceDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = InvoiceDateLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object OurJobLbl: TQRLabel
        Left = 609
        Top = 290
        Width = 57
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          767.291666666666700000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'OurJobLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = OurJobLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblCustOrderNo: TQRLabel
        Left = 609
        Top = 239
        Width = 87
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          632.354166666666700000
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object CustAccount: TQRDBText
        Left = 609
        Top = 266
        Width = 82
        Height = 20
        Size.Values = (
          52.916666666666670000
          1611.312500000000000000
          703.791666666666700000
          216.958333333333300000)
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = CustAccountPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 48
        Top = 184
        Width = 66
        Height = 20
        Size.Values = (
          52.916666666666670000
          127.000000000000000000
          486.833333333333300000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice to'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 600
        Top = 144
        Width = 60
        Height = 20
        Size.Values = (
          52.916666666666670000
          1587.500000000000000000
          381.000000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel4: TQRLabel
        Left = 504
        Top = 184
        Width = 72
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          486.833333333333300000
          190.500000000000000000)
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
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 504
        Top = 211
        Width = 83
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          558.270833333333300000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 504
        Top = 239
        Width = 58
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          632.354166666666700000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 504
        Top = 266
        Width = 63
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          703.791666666666700000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A/C Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblJobNumber: TQRLabel
        Left = 504
        Top = 290
        Width = 76
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          767.291666666666700000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 46
        Top = 384
        Width = 57
        Height = 19
        Size.Values = (
          50.270833333333330000
          121.708333333333300000
          1016.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 120
        Top = 384
        Width = 74
        Height = 19
        Size.Values = (
          50.270833333333330000
          317.500000000000000000
          1016.000000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 455
        Top = 384
        Width = 62
        Height = 19
        Size.Values = (
          50.270833333333330000
          1203.854166666667000000
          1016.000000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 543
        Top = 384
        Width = 62
        Height = 19
        Size.Values = (
          50.270833333333330000
          1436.687500000000000000
          1016.000000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price unit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 664
        Top = 384
        Width = 33
        Height = 19
        Size.Values = (
          50.270833333333330000
          1756.833333333333000000
          1016.000000000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRMemoCmpnyNm: TQRMemo
        Left = 520
        Top = 12
        Width = 105
        Height = 121
        Size.Values = (
          320.145833333333300000
          1375.833333333333000000
          31.750000000000000000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object lblInvoiceDescription: TQRLabel
        Left = 112
        Top = 344
        Width = 649
        Height = 20
        Size.Values = (
          52.916666666666670000
          296.333333333333400000
          910.166666666666600000
          1717.145833333333000000)
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 48
        Top = 344
        Width = 53
        Height = 20
        Size.Values = (
          52.916666666666670000
          127.000000000000000000
          910.166666666666700000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Project:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblReference: TQRLabel
        Left = 504
        Top = 318
        Width = 82
        Height = 18
        Size.Values = (
          47.625000000000000000
          1333.500000000000000000
          841.375000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 737
        Top = 384
        Width = 24
        Height = 19
        Size.Values = (
          50.270833333333330000
          1949.979166666667000000
          1016.000000000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 0
      Top = 547
      Width = 794
      Height = 282
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        746.125000000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrshpPayment: TQRShape
        Left = 16
        Top = 3
        Width = 457
        Height = 182
        Size.Values = (
          481.541666666666700000
          42.333333333333340000
          7.937500000000000000
          1209.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRMemo2: TQRMemo
        Left = 113
        Top = 232
        Width = 560
        Height = 17
        Size.Values = (
          44.979166666666670000
          298.979166666666700000
          613.833333333333400000
          1481.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          
            'Nine 8 Nine Deisgn & Print Ltd.  !st Floor, 2 Glebe Road, Warlin' +
            'gham.  Surrey. CR6 9NJ')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object GoodsValueLbl: TQRLabel
        Left = 613
        Top = 31
        Width = 84
        Height = 21
        Size.Values = (
          55.562500000000000000
          1621.895833333333000000
          82.020833333333330000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'GoodsValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object VATValueLbl: TQRLabel
        Left = 624
        Top = 62
        Width = 73
        Height = 20
        Size.Values = (
          52.916666666666670000
          1651.000000000000000000
          164.041666666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VATValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = VATValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object TotalValueLbl: TQRLabel
        Left = 620
        Top = 93
        Width = 78
        Height = 20
        Size.Values = (
          52.916666666666670000
          1640.416666666667000000
          246.062500000000000000
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 520
        Top = 29
        Width = 59
        Height = 20
        Size.Values = (
          52.916666666666670000
          1375.833333333333000000
          76.729166666666670000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 520
        Top = 61
        Width = 63
        Height = 20
        Size.Values = (
          52.916666666666670000
          1375.833333333333000000
          161.395833333333300000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 520
        Top = 93
        Width = 84
        Height = 20
        Size.Values = (
          52.916666666666670000
          1375.833333333333000000
          246.062500000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRMemo1: TQRMemo
        Left = 113
        Top = 248
        Width = 560
        Height = 17
        Size.Values = (
          44.979166666666670000
          298.979166666666700000
          656.166666666666800000
          1481.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'Registered in England & Wales No 8147754. Vat No: 138568968')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object memDefPayment: TQRMemo
        Left = 8
        Top = 8
        Width = 441
        Height = 169
        Enabled = False
        Size.Values = (
          447.145833333333400000
          21.166666666666670000
          21.166666666666670000
          1166.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'IMPORTANT NOTICE'
          'The amount payable under this invoice has been purchased by'
          
            'BIBBY FACTORS MANCHESTER LIMITED to whom you are hereby authoris' +
            'ed'
          ' and requested to make payment at:'
          ''
          'SUITE E MAGNETIC HOUSE WATERFRONT QUAY SALFORD QUAYS MANCHESTER'
          'M50 3XW  TELEPHONE 0161 873 5400 TELEFAX 0161 873 5432'
          '(Credit Transfers to Barclays Bank PLC'
          
            '48B - 50 Lord St, Liverpool L2 1TD  Sortcode 20.51.01  A/C No 60' +
            '078816)'
          ''
          
            'At law, they alone can give a valid discharge and should be advi' +
            'sed immediately of any dispute likely to defer payment beyond te' +
            'rms of Sale.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object memPayment: TQRRichText
        Left = 24
        Top = 8
        Width = 441
        Height = 170
        Size.Values = (
          449.791666666666700000
          63.500000000000000000
          21.166666666666670000
          1166.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memPayment')
      end
      object qrlblFSC: TQRLabel
        Left = 24
        Top = 192
        Width = 738
        Height = 16
        Size.Values = (
          42.333333333333330000
          63.500000000000000000
          508.000000000000000000
          1952.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Only the products that are identified as such on this document a' +
          're FSC or PeFC certified - SGS-COC-008602 and SGS-PEFC/COC-1274 '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object chldbndFSCClaim: TQRChildBand
      Left = 0
      Top = 454
      Width = 794
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = InvoiceLine
      Size.Values = (
        47.625000000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = InvoiceLine
      PrintOrder = cboAfterParent
      object gtlblFSCClaim: TQRLabel
        Left = 120
        Top = 1
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          2.645833333333333000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FSC Claim:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object imgReport: TQRImage
      Left = 349
      Top = 24
      Width = 97
      Height = 152
      Enabled = False
      Size.Values = (
        402.166666666666600000
        923.395833333333400000
        63.500000000000000000
        256.645833333333400000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
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
      '           Customer_Branch.Postcode'
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
      'WHERE Sales_Invoice = :Sales_Invoice'
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
      end>
  end
  object InvLineSRC: TDataSource
    DataSet = InvLineSQL
    Left = 848
    Top = 184
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
      'Customer_Branch.Use_Branch_Name'
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
      '           Customer_Branch.Postcode'
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
    Left = 840
    Top = 120
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
      '           Customer_Branch.Postcode'
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
    Top = 160
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
    Left = 472
    Top = 160
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
    Left = 313
    Top = 396
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
    Left = 194
    Top = 40
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
    Left = 291
    Top = 272
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
    Top = 376
  end
  object CustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 454
    Top = 376
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
    Left = 472
    Top = 469
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
      '        Form_Reference.Form_Reference_Descr,'
      '        Purchase_OrderLine.FSC_Material_Claim,'
      '        Purchase_orderline.FSC_Mixed_Percentage'
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
      '          Part.FSC_Material_Claim,'
      '          Part.FSC_Mixed_Percentage,'
      '          Original_Sell_Price'
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
    Left = 752
    Top = 60
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
    Left = 240
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
        'ranch'
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
    Left = 784
    Top = 425
  end
  object qryUniqueInv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Category'
      'where Category = :Category')
    Left = 752
    Top = 121
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
    Top = 371
    ParamData = <
      item
        Name = 'category'
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 638
    Top = 310
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
