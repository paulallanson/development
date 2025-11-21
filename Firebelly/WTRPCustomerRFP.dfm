object frmWTRPCustomerRFP: TfrmWTRPCustomerRFP
  Left = 80
  Top = 94
  Width = 1206
  Height = 804
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Application for Payment'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  TextHeight = 14
  object QRLabel6: TQRLabel
    Left = 560
    Top = 220
    Width = 12
    Height = 12
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
    Font.Height = -17
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
    Left = 630
    Top = 220
    Width = 12
    Height = 12
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
    DataSet = qryGetCompany
    DataField = 'Fax_number'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -17
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
    Left = 560
    Top = 266
    Width = 12
    Height = 12
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
    Font.Height = -17
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
    Left = 630
    Top = 266
    Width = 12
    Height = 12
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
    DataSet = qryGetCompany
    DataField = 'Fax_number'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -17
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
    Left = 152
    Top = -350
    Width = 992
    Height = 1403
    AfterPrint = InvoiceReportAfterPrint
    ShowingPreview = False
    BeforePrint = InvoiceReportBeforePrint
    DataSet = qrySalesInv
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
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
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
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
      Left = 47
      Top = 609
      Width = 898
      Height = 3
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
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'SalesInvSQL.Account_Code'
      FooterBand = qrsdQLabour
      Master = InvDetailBand
      ReprintOnNewPage = False
    end
    object InvDetailBand: TQRSubDetail
      Left = 47
      Top = 612
      Width = 898
      Height = 25
      AfterPrint = InvDetailBandAfterPrint
      AlignToBottom = False
      BeforePrint = InvDetailBandBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      DataSet = qrySalesInv
      PrintBefore = False
      PrintIfEmpty = True
      object lblUnit: TQRLabel
        Left = 578
        Top = 0
        Width = 40
        Height = 23
        Size.Values = (
          48.683333333333330000
          1223.433333333333000000
          0.000000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object LblTotal: TQRLabel
        Left = 833
        Top = 0
        Width = 52
        Height = 23
        Size.Values = (
          48.683333333333330000
          1763.183333333333000000
          0.000000000000000000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'LblTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblVat: TQRLabel
        Left = 762
        Top = 0
        Width = 36
        Height = 23
        Size.Values = (
          48.683333333333330000
          1612.900000000000000000
          0.000000000000000000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustomerRef: TQRLabel
        Left = 54
        Top = 0
        Width = 477
        Height = 23
        Size.Values = (
          47.625000000000000000
          113.770833333333300000
          0.000000000000000000
          1010.708333333333000000)
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
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 8
        Top = 0
        Width = 29
        Height = 23
        Size.Values = (
          48.683333333333330000
          16.933333333333330000
          0.000000000000000000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '1.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblGoods: TQRLabel
        Left = 674
        Top = 0
        Width = 58
        Height = 23
        Size.Values = (
          48.683333333333330000
          1426.633333333333000000
          0.000000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGoods'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
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
      Left = 47
      Top = 47
      Width = 898
      Height = 562
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        1189.566666666667000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object lblRundate: TQRLabel
        Left = 781
        Top = 380
        Width = 70
        Height = 25
        Size.Values = (
          52.916666666666670000
          1653.116666666667000000
          804.333333333333300000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblRundate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblInvoiceNo: TQRLabel
        Left = 781
        Top = 329
        Width = 78
        Height = 25
        Size.Values = (
          52.916666666666670000
          1653.116666666667000000
          696.383333333333300000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblInvoiceNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 640
        Top = 480
        Width = 51
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          1016.000000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblPage: TQRLabel
        Left = 781
        Top = 480
        Width = 49
        Height = 25
        Size.Values = (
          52.916666666666670000
          1653.116666666667000000
          1016.000000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblPage'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 640
        Top = 330
        Width = 120
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          698.500000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Application No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 640
        Top = 380
        Width = 37
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          804.333333333333300000
          78.316666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 59
        Top = 10
        Width = 387
        Height = 45
        Size.Values = (
          95.250000000000000000
          124.883333333333300000
          21.166666666666670000
          819.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Application for Payment'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -37
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
      object QRLabel10: TQRLabel
        Left = 54
        Top = 540
        Width = 54
        Height = 25
        Size.Values = (
          52.916666666666670000
          114.300000000000000000
          1143.000000000000000000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Details'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 845
        Top = 540
        Width = 40
        Height = 25
        Size.Values = (
          52.916666666666670000
          1788.583333333333000000
          1143.000000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 11
        Top = 540
        Width = 29
        Height = 25
        Size.Values = (
          52.916666666666670000
          23.283333333333330000
          1143.000000000000000000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 539
        Top = 540
        Width = 78
        Height = 25
        Size.Values = (
          52.916666666666670000
          1140.883333333333000000
          1143.000000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRMemoCmpnyNm: TQRMemo
        Left = 700
        Top = 145
        Width = 124
        Height = 146
        Size.Values = (
          309.033333333333300000
          1481.666666666667000000
          306.916666666666700000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 60
        Top = 219
        Width = 151
        Height = 25
        Size.Values = (
          52.916666666666670000
          127.000000000000000000
          463.550000000000000000
          319.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object CustomerAddMemo: TQRMemo
        Left = 60
        Top = 243
        Width = 421
        Height = 145
        Size.Values = (
          306.916666666666700000
          127.000000000000000000
          513.291666666666800000
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
        Font.Height = -17
        Font.Name = 'Lato'
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
      object QRLabel18: TQRLabel
        Left = 640
        Top = 423
        Width = 75
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          895.350000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A/C Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object LblAccountCode: TQRDBText
        Left = 781
        Top = 423
        Width = 97
        Height = 25
        Size.Values = (
          52.916666666666670000
          1653.116666666667000000
          895.350000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesInv
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRLabel14: TQRLabel
        Left = 765
        Top = 540
        Width = 33
        Height = 25
        Size.Values = (
          52.916666666666670000
          1619.250000000000000000
          1143.000000000000000000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qriHeadLogo: TQRImage
        Left = 575
        Top = 0
        Width = 306
        Height = 141
        Size.Values = (
          298.979166666666700000
          1217.083333333333000000
          0.000000000000000000
          648.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object QRLabel16: TQRLabel
        Left = 639
        Top = 540
        Width = 94
        Height = 25
        Size.Values = (
          52.916666666666670000
          1352.550000000000000000
          1143.000000000000000000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Net Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 10
        Top = 480
        Width = 37
        Height = 25
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          1016.000000000000000000
          78.316666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblSiteName: TQRLabel
        Left = 60
        Top = 481
        Width = 92
        Height = 20
        Size.Values = (
          42.333333333333330000
          127.000000000000000000
          1018.116666666667000000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblSiteName'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
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
    object GrpFootQRBand: TQRBand
      Left = 47
      Top = 701
      Width = 898
      Height = 240
      AlignToBottom = True
      BeforePrint = GrpFootQRBandBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrsdQLabour
      ParentFont = False
      Size.Values = (
        508.000000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object TotGoodsQRLbl: TQRLabel
        Left = 768
        Top = 99
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666670000
          1624.541666666667000000
          209.020833333333300000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotGoodsQRLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object TotVatQRLbl: TQRLabel
        Left = 768
        Top = 139
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666670000
          1624.541666666667000000
          293.687500000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotVatQRLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object InvTotQrLbl: TQRLabel
        Left = 768
        Top = 179
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666670000
          1624.541666666667000000
          378.354166666666700000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'InvTotQrLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 693
        Top = 99
        Width = 66
        Height = 25
        Size.Values = (
          52.916666666666670000
          1466.850000000000000000
          209.550000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel2: TQRLabel
        Left = 730
        Top = 139
        Width = 29
        Height = 25
        Size.Values = (
          52.916666666666670000
          1545.166666666667000000
          294.216666666666700000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 640
        Top = 179
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          378.883333333333300000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Application Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblPaymentTerms: TQRLabel
        Left = 15
        Top = 29
        Width = 128
        Height = 20
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          61.383333333333330000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Payment Terms: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrshpPayment: TQRShape
        Left = 10
        Top = 54
        Width = 511
        Height = 162
        Size.Values = (
          343.958333333333300000
          21.166666666666670000
          113.770833333333300000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 20
        Top = 61
        Width = 491
        Height = 150
        Size.Values = (
          317.500000000000000000
          42.333333333333330000
          129.645833333333300000
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
        Font.Height = -15
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          'Payment by cheque payable etc.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object qrsdQLabour: TQRBand
      Left = 47
      Top = 637
      Width = 898
      Height = 64
      AlignToBottom = False
      BeforePrint = qrsdQLabourBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        135.466666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblLabourUTR: TQRLabel
        Left = 55
        Top = 6
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333330000
          116.416666666666700000
          12.700000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'UTR No: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblLabourValue: TQRLabel
        Left = 55
        Top = 36
        Width = 90
        Height = 20
        Size.Values = (
          42.333333333333330000
          116.416666666666700000
          76.200000000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Labour Value:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
  end
  object dtsSalesInv: TDataSource
    DataSet = qrySalesInv
    Left = 1064
    Top = 334
  end
  object dtsGetCompany: TDataSource
    DataSet = qryGetCompany
    Left = 1059
    Top = 108
  end
  object qryGetCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Company.Company_Name,'
      '        Street,'
      '        Locale,'
      '        Town_City,'
      '        Postcode,'
      '        Telephone_Number,'
      '        Fax_Number,'
      '        Email_Address,'
      '        VAT_Number,'
      '        Unique_Tax_Reference'
      'from Company'
      'where Company = 1')
    Left = 976
    Top = 111
  end
  object qrySalesInv: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_invoice.Customer,'
      '        Sales_invoice.Account_code,'
      '        Sales_invoice.Invoice_no,'
      '        Sales_invoice.Goods_value,'
      '        Sales_invoice.Vat_Value,'
      
        '        Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Goo' +
        'ds_Total,'
      '        Sales_invoice.Invoice_date,'
      '        Customer.Customer_Name,'
      '        Customer.Street,'
      '        Customer.Locale,'
      '        Customer.Town_city,'
      '        Customer.Postcode,'
      '        Customer.County_State,'
      '        Customer.Telephone_number,'
      '        Customer.Fax_number,'
      '        Customer.Account_is_Factored,'
      '        Customer.Use_Virtual_Bank_Details,'
      '        Customer.Separate_Labour_Invoice_Value,'
      '        (Select Payment_Terms_Description'
      '         from Payment_Terms'
      
        '         where Payment_Terms.Payment_Terms = Sales_invoice.Payme' +
        'nt_Terms) as Payment_Terms_Description,'
      '        Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Int_Sel.Text100,'
      '        Sales_invoice.description,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Sales_invoice'
      'FROM Int_Sel'
      '        INNER JOIN (Customer'
      '        INNER JOIN Sales_invoice'
      
        '            ON (Customer.Customer = Sales_invoice.Customer) AND ' +
        '(Customer.Customer = Sales_invoice.Customer))'
      '            ON Int_Sel.Sel1 = Sales_invoice.Sales_invoice'
      'WHERE  Int_Sel.Int_Sel_Code = :Int_Sel'
      'ORDER BY Sales_invoice.Invoice_no'
      ''
      '')
    Left = 979
    Top = 336
    ParamData = <
      item
        Name = 'Int_Sel'
        ParamType = ptInput
      end>
  end
  object qryUpSalesInv: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'update Sales_invoice'
      'set Application_reference = :Application_reference,'
      'Application_Date = :Application_Date,'
      'Application_Date_From = :Application_Date_From,'
      'Application_Date_To = :Application_Date_To,'
      'Application_Labour_Value = :Application_Labour_Value'
      'WHERE Sales_Invoice = :Sales_Invoice')
    Left = 974
    Top = 30
    ParamData = <
      item
        Name = 'Application_reference'
      end
      item
        Name = 'Application_Date'
      end
      item
        Name = 'Application_Date_From'
      end
      item
        Name = 'Application_Date_To'
      end
      item
        Name = 'Application_Labour_Value'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryUpCustomerBranch: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'update Customer'
      'set Last_Application_ref = :Last_Application_Ref'
      'where Customer = :Customer')
    Left = 1086
    Top = 33
    ParamData = <
      item
        Name = 'Last_Application_Ref'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryGetSO: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Order_Ref_No, Reference'
      'from Sales_Order'
      'where Sales_order = :sales_order')
    Left = 976
    Top = 261
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_Code = :Notes_Code)'
      'Order By Notes_Line')
    Left = 976
    Top = 181
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
end
