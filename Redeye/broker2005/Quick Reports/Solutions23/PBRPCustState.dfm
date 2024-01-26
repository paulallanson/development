object PBRPCustStateFrm: TPBRPCustStateFrm
  Left = 240
  Top = 122
  Width = 1136
  Height = 719
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Customer Statement'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  
  TextHeight = 14
  object QRLabel6: TQRLabel
    Left = 448
    Top = 176
    Width = 10
    Height = 10
    Size.Values = (
      26.458333333333300000
      1185.333333333330000000
      465.666666666667000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
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
  object QRDBText6: TQRDBText
    Left = 504
    Top = 176
    Width = 10
    Height = 10
    Size.Values = (
      26.458333333333300000
      1333.500000000000000000
      465.666666666667000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Lucida Sans'
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
  object QRLabel7: TQRLabel
    Left = 448
    Top = 213
    Width = 10
    Height = 10
    Size.Values = (
      26.458333333333300000
      1185.333333333330000000
      563.562500000000000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
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
  object QRDBText7: TQRDBText
    Left = 504
    Top = 213
    Width = 10
    Height = 10
    Size.Values = (
      26.458333333333300000
      1333.500000000000000000
      563.562500000000000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Lucida Sans'
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
  object InvoiceReport: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    AfterPrint = InvoiceReportAfterPrint
    ShowingPreview = False
    BeforePrint = InvoiceReportBeforePrint
    DataSet = SalesInvSQL
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
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
    Page.PaperSize = Default
    Page.Continuous = False
    Page.Values = (
      300.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
    ReportTitle = 'Purchase Orders Due'
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
    object CustBranchQRGroup: TQRGroup
      Left = 19
      Top = 369
      Width = 756
      Height = 4
      AlignToBottom = False
      BeforePrint = CustBranchQRGroupBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        10.583333333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'SalesInvSQL.Account_Code'
      FooterBand = GrpFootQRBand
      Master = InvDetailBand
      ReprintOnNewPage = False
    end
    object InvDetailBand: TQRSubDetail
      Left = 19
      Top = 373
      Width = 756
      Height = 20
      AfterPrint = InvDetailBandAfterPrint
      AlignToBottom = False
      BeforePrint = InvDetailBandBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      DataSet = SalesInvSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Left = 494
        Top = 2
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1307.041666666667000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Invoice_Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblVAT: TQRLabel
        Left = 644
        Top = 2
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          1703.916666666667000000
          5.291666666666667000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblVAT'
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
      object lblGoods: TQRLabel
        Left = 574
        Top = 2
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1518.708333333333000000
          5.291666666666667000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGoods'
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
      object QRDBText1: TQRDBText
        Left = 410
        Top = 2
        Width = 86
        Height = 15
        Size.Values = (
          39.687500000000000000
          1084.791666666667000000
          5.291666666666667000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Sales_Invoice_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblTotal: TQRLabel
        Left = 700
        Top = 2
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1852.083333333333000000
          5.291666666666667000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblTotal'
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
      object lblCustomerRef: TQRLabel
        Left = 8
        Top = 2
        Width = 97
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblCustomerRef'
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
      object lblDescription: TQRLabel
        Left = 168
        Top = 2
        Width = 241
        Height = 15
        Size.Values = (
          39.687500000000000000
          444.500000000000000000
          5.291666666666667000
          637.645833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblDescription'
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
      object QRDBText3: TQRDBText
        Left = 108
        Top = 2
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          285.750000000000000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblDeliveryLocation: TQRLabel
        Left = 611
        Top = 9
        Width = 91
        Height = 15
        Enabled = False
        Size.Values = (
          39.687500000000000000
          1616.604166666667000000
          23.812500000000000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblDeliveryLocation'
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
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 38
      Width = 756
      Height = 331
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        875.770833333333300000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object lblAccountCode: TQRLabel
        Left = 24
        Top = 295
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          780.520833333333300000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblAccountCode'
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
      object lblRundate: TQRLabel
        Left = 490
        Top = 295
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          780.520833333333300000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblRundate'
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
      object lblInvoiceNo: TQRLabel
        Left = 643
        Top = 295
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          1701.270833333333000000
          780.520833333333300000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblInvoiceNo'
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
      object QRLabel2: TQRLabel
        Left = 600
        Top = 0
        Width = 31
        Height = 18
        Size.Values = (
          47.625000000000000000
          1587.500000000000000000
          0.000000000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page: '
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
      object CustomerAddMemo: TQRMemo
        Left = 24
        Top = 168
        Width = 345
        Height = 105
        Size.Values = (
          277.812500000000000000
          63.500000000000000000
          444.500000000000000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
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
        FontSize = 8
      end
      object lblPage: TQRLabel
        Left = 648
        Top = 0
        Width = 35
        Height = 18
        Size.Values = (
          47.625000000000000000
          1714.500000000000000000
          0.000000000000000000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblPage'
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
      object lblDateRange: TQRLabel
        Left = 176
        Top = 295
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          465.666666666666700000
          780.520833333333300000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblDateRange'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object GrpFootQRBand: TQRBand
      Left = 19
      Top = 393
      Width = 756
      Height = 147
      AfterPrint = GrpFootQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = GrpFootQRBandBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        388.937500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel16: TQRLabel
        Left = 472
        Top = 7
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          18.520833333333330000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object qrlblGoods: TQRLabel
        Left = 565
        Top = 7
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          1494.895833333333000000
          18.520833333333330000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'goodsTot'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object qrlblVatTot: TQRLabel
        Left = 641
        Top = 7
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          1695.979166666667000000
          18.520833333333330000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'vatTot'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object qrlblTotal: TQRLabel
        Left = 708
        Top = 7
        Width = 25
        Height = 15
        Size.Values = (
          39.687500000000000000
          1873.250000000000000000
          18.520833333333330000
          66.145833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
  end
  object SalesInvDataSource: TDataSource
    DataSet = SalesInvSQL
    Left = 256
    Top = 102
  end
  object CompDataSource: TDataSource
    DataSet = GetCompSQL
    Left = 427
    Top = 20
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 432
    Top = 71
  end
  object SalesInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice.Sales_Invoice,'
      '        Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Inv_to_Customer,'
      '        Sales_Invoice.Inv_to_Branch,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice.Invoice_or_Credit,'
      '        Sales_Invoice.Sales_invoice_type,'
      '        Sales_Invoice.Reference,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Goods_Value,'
      '        Sales_Invoice_Line.Vat_Code,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Vat_Code.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Sales_Invoice_Line.sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_Line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Int_Sel.Sel1,'
      '        Int_Sel.Int_Sel_Code,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Phone,'
      '        Customer_Branch.Fax_Number,'
      '        Customer_Branch.Account_Code'
      'FROM (Customer'
      '        INNER JOIN Customer_Branch'
      '          ON Customer.Customer = Customer_Branch.Customer)'
      '        INNER JOIN (Vat_Code'
      '        INNER JOIN (Int_Sel'
      '        INNER JOIN (Price_Unit'
      '        INNER JOIN (Sales_Invoice'
      '        INNER JOIN Sales_Invoice_Line'
      
        '          ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sa' +
        'les_Invoice)'
      
        '          ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Un' +
        'it)'
      '          ON Int_Sel.Sel1 = Sales_Invoice.Sales_Invoice)'
      '          ON Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code)'
      
        '          ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_B' +
        'ranch) AND (Customer_Branch.Customer = Sales_Invoice.Inv_to_Cust' +
        'omer)'
      'WHERE'
      '  Int_Sel.Int_Sel_Code = :Int_Sel'
      
        'ORDER BY Sales_invoice_Line.Sales_Invoice, Sales_Invoice_Line.In' +
        'voice_Line_no'
      ' '
      ' '
      ' ')
    Left = 363
    Top = 40
    ParamData = <
      item
        Name = 'Int_Sel'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UpSalesInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_invoice'
      'set Statement_reference = :Statement_reference,'
      'Statement_Date = :Statement_Date,'
      'Statement_From = :Statement_from,'
      'Statement_to = :Statement_to'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 430
    Top = 142
    ParamData = <
      item
        Name = 'Statement_reference'
      end
      item
        Name = 'Statement_Date'
      end
      item
        Name = 'Statement_from'
      end
      item
        Name = 'Statement_to'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object UpCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Customer_Branch'
      'set Last_Statement_ref = :Last_statement_Ref'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no')
    Left = 510
    Top = 206
    ParamData = <
      item
        Name = 'Last_statement_Ref'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object OldSalesInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.Customer,'
      '        Sales_Invoice.Branch_no,'
      '        Customer_Branch.Account_Code,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Goods_Value,'
      '        Sales_Invoice.Vat_Value,'
      
        '        Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Goo' +
        'ds_Total,'
      '        Sales_Invoice.Invoice_Date,'
      '        Customer.Name,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Phone,'
      '        Customer_Branch.Fax_Number,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Form_Reference.Form_Reference,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Form_Reference_ID,'
      '        Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Sales_Invoice_Line.sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_Line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Int_Sel.Text100,'
      '        sales_order.Cust_Order_No as SOCustRef,'
      '        job_bag.Cust_Order_No as JBCustRef,'
      '        job_bag.Job_Bag_Descr'
      
        'from ((((((((int_sel inner join sales_invoice on (Int_Sel.Sel1 =' +
        ' Sales_Invoice.Sales_Invoice))'
      
        '  inner join customer_branch on ((Customer_Branch.Customer = Sal' +
        'es_Invoice.Inv_to_Customer) AND'
      
        '             (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_B' +
        'ranch)))'
      
        '  inner join customer on (Customer.Customer = Customer_Branch.Cu' +
        'stomer))'
      
        '  inner join sales_invoice_line on (Sales_Invoice.Sales_Invoice ' +
        '= Sales_Invoice_Line.Sales_Invoice))'
      
        '  left join purchase_orderline on ((Purchase_OrderLine.Purchase_' +
        'Order = Sales_Invoice_Line.Purchase_Order) AND'
      
        '                                                      (Purchase_' +
        'OrderLine.Line = Sales_Invoice_Line.Line)))'
      
        '  left join form_reference on (Form_Reference.Form_Reference = P' +
        'urchase_OrderLine.Form_Reference))'
      
        '  left join sales_order on (Sales_Invoice_Line.sales_Order = sal' +
        'es_Order.sales_Order))'
      
        '  left join job_bag on (Sales_Invoice_Line.Job_Bag = Job_Bag.Job' +
        '_Bag))'
      'WHERE'
      '  Int_Sel.Int_Sel_Code = :Int_Sel'
      'ORDER BY Purchase_OrderLine.Cust_Order_No'
      ' '
      ' '
      ' ')
    Left = 667
    Top = 120
    ParamData = <
      item
        Name = 'Int_Sel'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'Customer'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Branch_no'
    end
    object StringField1: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object StringField2: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object StringField3: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'Goods_Total'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object StringField4: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object StringField5: TStringField
      FieldName = 'Building_No_name'
      FixedChar = True
      Size = 80
    end
    object StringField6: TStringField
      FieldName = 'Street'
      FixedChar = True
      Size = 80
    end
    object StringField7: TStringField
      FieldName = 'Locale'
      FixedChar = True
      Size = 80
    end
    object StringField8: TStringField
      FieldName = 'Town'
      FixedChar = True
      Size = 80
    end
    object StringField9: TStringField
      FieldName = 'Postcode'
      FixedChar = True
    end
    object StringField10: TStringField
      FieldName = 'Phone'
      FixedChar = True
      Size = 40
    end
    object StringField11: TStringField
      FieldName = 'Fax_Number'
      FixedChar = True
      Size = 40
    end
    object StringField12: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object IntegerField3: TIntegerField
      FieldName = 'Form_Reference'
    end
    object StringField13: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object StringField14: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object IntegerField4: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object IntegerField5: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object FloatField1: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object FloatField2: TFloatField
      FieldName = 'Purchase_Order'
    end
    object IntegerField6: TIntegerField
      FieldName = 'Line'
    end
    object IntegerField7: TIntegerField
      FieldName = 'Int_Sel_Code'
    end
    object FloatField3: TFloatField
      FieldName = 'Sel1'
    end
    object StringField15: TStringField
      FieldName = 'Text100'
      FixedChar = True
      Size = 100
    end
    object StringField16: TStringField
      FieldKind = fkCalculated
      FieldName = 'Order'
      Calculated = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'sales_Order'
    end
    object IntegerField9: TIntegerField
      FieldName = 'Sales_Order_Line_no'
    end
    object IntegerField10: TIntegerField
      FieldName = 'Job_Bag'
    end
    object IntegerField11: TIntegerField
      FieldName = 'Job_Bag_Line'
    end
    object StringField17: TStringField
      FieldName = 'SOCustRef'
      FixedChar = True
      Size = 80
    end
    object StringField18: TStringField
      FieldName = 'JBCustRef'
      FixedChar = True
      Size = 80
    end
    object StringField19: TStringField
      FieldName = 'Job_Bag_Descr'
      FixedChar = True
      Size = 80
    end
    object StringField20: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustRef'
      Calculated = True
    end
    object StringField21: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustDesc'
      Calculated = True
    end
  end
  object qryGetJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Cust_Order_No'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 416
    Top = 85
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Cust_Order_No'
      'from Purchase_orderLine'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 416
    Top = 141
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Cust_Order_No'
      'from Sales_Order'
      'where Sales_order = :sales_order')
    Left = 416
    Top = 205
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Descr'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 560
    Top = 140
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
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
    Left = 560
    Top = 76
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
      '          Price_Unit'
      'from Sales_order_line, '
      '        Part'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no and'
      '(Sales_order_line.Part = Part.Part)')
    Left = 560
    Top = 28
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryGetSODeliv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        (SELECT Ad_Hoc_Address.Name'
      '         FROM Ad_Hoc_Address'
      
        '         WHERE Ad_Hoc_Address.Ad_Hoc_Address = Sales_Order.Ad_Ho' +
        'c_Address) as Ad_Hoc_Address_Name'
      'FROM Customer'
      '      RIGHT JOIN (Customer_Branch'
      '      RIGHT JOIN Sales_Order'
      
        '        ON (Customer_Branch.Branch_no = Sales_Order.Delivery_Bra' +
        'nch) AND (Customer_Branch.Customer = Sales_Order.Delivery_Custom' +
        'er))'
      '        ON Customer.Customer = Sales_Order.Delivery_Customer'
      'where Sales_Order = :Sales_Order')
    Left = 592
    Top = 205
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryGetPOLineDeliv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1'
      '        Delivery_Detail.Purchase_Order,'
      '        Delivery_Detail.Line,'
      '        Delivery_Detail.Delivery_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        Supplier_Branch.Name as Supplier_Branch_Name,'
      '        Supplier.Name as Supplier_Name,'
      '        Ad_hoc_Address.Name as Ad_Hoc_Address_Name,'
      '        Rep.Name as Rep_Name'
      'FROM Customer_Branch'
      '        RIGHT JOIN (Rep'
      '        RIGHT JOIN (Ad_hoc_Address'
      '        RIGHT JOIN ((Supplier_Branch'
      '        RIGHT JOIN (Delivery_Detail'
      '        LEFT JOIN Customer'
      '            ON Delivery_Detail.Customer = Customer.Customer)'
      
        '            ON (Supplier_Branch.Branch_no = Delivery_Detail.Bran' +
        'ch_no) AND (Supplier_Branch.Supplier = Delivery_Detail.Supplier)' +
        ')'
      '        LEFT JOIN Supplier'
      '            ON Delivery_Detail.Supplier = Supplier.Supplier)'
      
        '            ON Ad_hoc_Address.Ad_hoc_Address = Delivery_Detail.A' +
        'd_hoc_Address)'
      '            ON Rep.Rep = Delivery_Detail.Rep)'
      
        '            ON (Customer_Branch.Branch_no = Delivery_Detail.Bran' +
        'ch_No0) AND (Customer_Branch.Customer = Delivery_Detail.Customer' +
        ')'
      'WHERE Delivery_Detail.Purchase_Order = :Purchase_Order AND'
      '      Delivery_Detail.Line = :Line')
    Left = 595
    Top = 262
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
end
