object PBRPCustStateFrm: TPBRPCustStateFrm
  Left = 80
  Top = 94
  Width = 1194
  Height = 766
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 463
  VertScrollBar.Range = 2000
  Caption = 'Customer Statement'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = True
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
    Left = 136
    Top = -453
    Width = 794
    Height = 1123
    AfterPrint = InvoiceReportAfterPrint
    ShowingPreview = False
    BeforePrint = InvoiceReportBeforePrint
    DataSet = SalesInvSQL
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
      Left = 0
      Top = 469
      Width = 794
      Height = 2
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
        5.291666666666667000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'SalesInvSQL.Account_Code'
      FooterBand = GrpFootQRBand
      Master = InvDetailBand
      ReprintOnNewPage = False
    end
    object InvDetailBand: TQRSubDetail
      Left = 0
      Top = 471
      Width = 794
      Height = 20
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
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      DataSet = SalesInvSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 12
        Top = 0
        Width = 90
        Height = 18
        Size.Values = (
          47.625000000000000000
          31.750000000000000000
          0.000000000000000000
          238.125000000000000000)
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
      object lblGoods: TQRLabel
        Left = 549
        Top = 0
        Width = 49
        Height = 18
        Size.Values = (
          47.625000000000000000
          1452.562500000000000000
          0.000000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGoods'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object LblTotal: TQRLabel
        Left = 722
        Top = 0
        Width = 44
        Height = 18
        Size.Values = (
          47.625000000000000000
          1910.291666666667000000
          0.000000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'LblTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblVat: TQRLabel
        Left = 646
        Top = 0
        Width = 32
        Height = 18
        Size.Values = (
          47.625000000000000000
          1709.208333333333000000
          0.000000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblCustomerRef: TQRLabel
        Left = 416
        Top = 0
        Width = 121
        Height = 18
        Size.Values = (
          47.625000000000000000
          1100.666666666667000000
          0.000000000000000000
          320.145833333333400000)
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
      object QRDBText2: TQRDBText
        Left = 76
        Top = 0
        Width = 70
        Height = 18
        Size.Values = (
          47.625000000000000000
          201.083333333333300000
          0.000000000000000000
          185.208333333333300000)
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
      object CustRefQRDBText: TQRDBText
        Left = 155
        Top = 0
        Width = 254
        Height = 18
        Size.Values = (
          47.625000000000000000
          410.104166666666800000
          0.000000000000000000
          672.041666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Invoice_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
    end
    object QRBand1: TQRBand
      Left = 0
      Top = 19
      Width = 794
      Height = 450
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
        1190.625000000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object memDefPayment: TQRMemo
        Left = 16
        Top = 318
        Width = 369
        Height = 60
        Enabled = False
        Size.Values = (
          158.750000000000000000
          42.333333333333330000
          841.375000000000000000
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
      object QRShape1: TQRShape
        Left = 48
        Top = 328
        Width = 393
        Height = 73
        Size.Values = (
          193.145833333333300000
          127.000000000000000000
          867.833333333333300000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object lblRundate: TQRLabel
        Left = 625
        Top = 304
        Width = 59
        Height = 20
        Size.Values = (
          52.916666666666670000
          1653.645833333333000000
          804.333333333333300000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblRundate'
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
      object lblInvoiceNo: TQRLabel
        Left = 625
        Top = 263
        Width = 69
        Height = 20
        Size.Values = (
          52.916666666666670000
          1653.645833333333000000
          695.854166666666700000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblInvoiceNo'
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
      object QRLabel2: TQRLabel
        Left = 512
        Top = 384
        Width = 36
        Height = 20
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          1016.000000000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 625
        Top = 384
        Width = 39
        Height = 20
        Size.Values = (
          52.916666666666670000
          1653.645833333333000000
          1016.000000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblPage'
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
      object QRLabel4: TQRLabel
        Left = 512
        Top = 264
        Width = 82
        Height = 20
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          698.500000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 512
        Top = 304
        Width = 94
        Height = 20
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          804.333333333333300000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 623
        Top = 144
        Width = 134
        Height = 36
        Size.Values = (
          95.250000000000000000
          1648.354166666667000000
          381.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -29
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
        Left = 155
        Top = 432
        Width = 69
        Height = 20
        Size.Values = (
          52.916666666666670000
          410.104166666666700000
          1143.000000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 732
        Top = 432
        Width = 32
        Height = 20
        Size.Values = (
          52.916666666666670000
          1936.750000000000000000
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
        Font.Height = -13
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
        Left = 416
        Top = 432
        Width = 53
        Height = 20
        Size.Values = (
          52.916666666666670000
          1100.666666666667000000
          1143.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 13
        Top = 432
        Width = 47
        Height = 20
        Size.Values = (
          52.916666666666670000
          34.395833333333330000
          1143.000000000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 537
        Top = 432
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          1420.812500000000000000
          1143.000000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 656
        Top = 108
        Width = 99
        Height = 14
        Enabled = False
        Size.Values = (
          37.041666666666670000
          1735.666666666667000000
          285.750000000000000000
          261.937500000000000000)
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
      object QRLabel3: TQRLabel
        Left = 48
        Top = 175
        Width = 112
        Height = 20
        Size.Values = (
          52.916666666666670000
          127.000000000000000000
          463.020833333333300000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 48
        Top = 194
        Width = 337
        Height = 116
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
        Font.Height = -13
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
        Left = 512
        Top = 338
        Width = 57
        Height = 20
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          894.291666666666700000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A/C Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
        Left = 625
        Top = 338
        Width = 79
        Height = 20
        Size.Values = (
          52.916666666666670000
          1653.645833333333000000
          894.291666666666700000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Account_Code'
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
      object QRLabel14: TQRLabel
        Left = 651
        Top = 432
        Width = 27
        Height = 20
        Size.Values = (
          52.916666666666670000
          1722.437500000000000000
          1143.000000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object memPayment: TQRMemo
        Left = 51
        Top = 333
        Width = 369
        Height = 60
        Size.Values = (
          158.750000000000000000
          134.937500000000000000
          881.062500000000000000
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
      object imgReport: TQRImage
        Left = 38
        Top = 0
        Width = 717
        Height = 105
        Size.Values = (
          277.812500000000000000
          100.541666666666700000
          0.000000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object QRLabel9: TQRLabel
        Left = 77
        Top = 432
        Width = 30
        Height = 20
        Size.Values = (
          52.916666666666670000
          203.729166666666700000
          1143.000000000000000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object GrpFootQRBand: TQRBand
      Left = 0
      Top = 491
      Width = 794
      Height = 270
      AfterPrint = GrpFootQRBandAfterPrint
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
      ParentFont = False
      Size.Values = (
        714.375000000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object TotGoodsQRLbl: TQRLabel
        Left = 670
        Top = 7
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666660000
          1772.708333333334000000
          18.520833333333330000
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
      object TotVatQRLbl: TQRLabel
        Left = 670
        Top = 39
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666660000
          1772.708333333334000000
          103.187500000000000000
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
        Font.Height = -12
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
        Left = 670
        Top = 71
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666660000
          1772.708333333334000000
          187.854166666666700000
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
        Font.Height = -12
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
        Left = 612
        Top = 7
        Width = 51
        Height = 20
        Size.Values = (
          52.916666666666670000
          1619.250000000000000000
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
      object gtQRLabel2: TQRLabel
        Left = 637
        Top = 39
        Width = 26
        Height = 20
        Size.Values = (
          52.916666666666670000
          1685.395833333333000000
          103.187500000000000000
          68.791666666666670000)
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
        Left = 576
        Top = 71
        Width = 87
        Height = 20
        Size.Values = (
          52.916666666666670000
          1524.000000000000000000
          187.854166666666700000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Statement Total'
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
    Left = 512
    Top = 55
  end
  object SalesInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice.Customer,'
      '        Sales_Invoice.Branch_no,'
      '        Customer_Branch.Account_Code,'
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
      '        Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Int_Sel.Text100,'
      '        Sales_Invoice.Invoice_Description,'
      '        Sales_Invoice.Reference,'
      '        Sales_Invoice.Sales_invoice_type,'
      '        Sales_Invoice.Sales_Invoice'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Int_Sel'
      '      INNER JOIN Sales_Invoice ON'
      '        Int_Sel.Sel1 = Sales_Invoice.Sales_Invoice) ON'
      
        '        (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch' +
        ') AND'
      
        '        (Customer_Branch.Customer = Sales_Invoice.Inv_to_Custome' +
        'r)) ON'
      '        Customer.Customer = Customer_Branch.Customer'
      'WHERE'
      '  Int_Sel.Int_Sel_Code = :Int_Sel'
      'ORDER BY Sales_invoice.Sales_invoice_no'
      '')
    Left = 363
    Top = 40
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object UpSalesInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_invoice'
      'set Statement_reference = :Statement_reference,'
      'Statement_Date = :Statement_Date,'
      'Statement_From = :Statement_From,'
      'Statement_To = :Statement_To'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 702
    Top = 126
    ParamData = <
      item
        Name = 'Statement_reference'
      end
      item
        Name = 'Statement_Date'
      end
      item
        Name = 'Statement_From'
      end
      item
        Name = 'Statement_To'
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
    Left = 518
    Top = 81
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
end
